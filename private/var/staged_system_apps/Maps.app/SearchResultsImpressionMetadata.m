@implementation SearchResultsImpressionMetadata

- (SearchResultsImpressionMetadata)initWithResultIndex:(unint64_t)a3 businessId:(unint64_t)a4 localSearchProviderId:(unsigned int)a5 query:(id)a6
{
  id v10;
  SearchResultsImpressionMetadata *v11;
  SearchResultsImpressionMetadata *v12;
  NSString *v13;
  NSString *query;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SearchResultsImpressionMetadata;
  v11 = -[SearchResultsImpressionMetadata init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    v11->_resultIndex = a3;
    v11->_businessId = a4;
    v11->_localSearchProviderId = a5;
    v13 = (NSString *)objc_msgSend(v10, "copy");
    query = v12->_query;
    v12->_query = v13;

    v12->_enriched = 0;
  }

  return v12;
}

- (unint64_t)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unint64_t)a3
{
  self->_resultIndex = a3;
}

- (BOOL)isEnriched
{
  return self->_enriched;
}

- (void)setEnriched:(BOOL)a3
{
  self->_enriched = a3;
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  self->_businessId = a3;
}

- (unsigned)localSearchProviderId
{
  return self->_localSearchProviderId;
}

- (void)setLocalSearchProviderId:(unsigned int)a3
{
  self->_localSearchProviderId = a3;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
