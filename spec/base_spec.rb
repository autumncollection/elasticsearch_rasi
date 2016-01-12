require 'spec_helper'
$LOAD_PATH.unshift(File.join(__dir__, '../../app/workers'))
require 'oj'
require 'elasticsearch'

describe ElasticsearchRasi do
  def test_count
    @rasi_es.mention.count(
      query: {
        filtered: {
          filter: {
            term: {
              resource: 'zpravy.idnes'
            }
          }
        }
      }
    )
  end

  context 'initialize from config' do
    before(:context) do
      @rasi_es = ElasticsearchRasi.new(:disputatio)
      @es = Elasticsearch::Client.new(@rasi_es.config[:connect])
      @id = 'test_abc'
      @es.delete(
        index: @rasi_es.config[:idx_mention_write],
        id:    @id,
        type:  @rasi_es.config[:mention_type],
        ignore: 404)
      @rasi_es.mention.refresh
    end

    it 'check config' do
      expect(@rasi_es.config.size).not_to eq(0)
    end

    it 'count' do
      expect(test_count).to be(0)
    end

    it 'count' do
      @rasi_es.mention.save_document(_id: @id, resource: 'zpravy.idnes')
      @rasi_es.mention.refresh
      expect(test_count).to be(1)
    end

    after(:context) do
      @es.delete(
        index: @rasi_es.config[:idx_mention_write],
        id:    @id,
        type:  @rasi_es.config[:mention_type],
        ignore: 404)
    end
  end
end