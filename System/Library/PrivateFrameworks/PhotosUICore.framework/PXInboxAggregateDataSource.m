@implementation PXInboxAggregateDataSource

- (PXInboxAggregateDataSource)initWithModels:(id)a3 providerSourceDictionary:(id)a4
{
  id v6;
  PXInboxAggregateDataSource *v7;
  uint64_t v8;
  NSDictionary *providerSourceDictionary;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXInboxAggregateDataSource;
  v7 = -[PXInboxModelDataSource initWithModels:](&v11, sel_initWithModels_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    providerSourceDictionary = v7->_providerSourceDictionary;
    v7->_providerSourceDictionary = (NSDictionary *)v8;

  }
  return v7;
}

- (id)providerSourceForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXInboxAggregateDataSource providerSourceDictionary](self, "providerSourceDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)providerSourceDictionary
{
  return self->_providerSourceDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerSourceDictionary, 0);
}

@end
