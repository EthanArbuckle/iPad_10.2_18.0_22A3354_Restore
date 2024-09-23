@implementation VUIDocumentPreFetchedData

- (VUIDocumentPreFetchedData)initWithDictionary:(id)a3
{
  id v4;
  VUIDocumentPreFetchedData *v5;
  uint64_t v6;
  NSDictionary *prefetchedDataDict;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDocumentPreFetchedData;
  v5 = -[VUIDocumentPreFetchedData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    prefetchedDataDict = v5->_prefetchedDataDict;
    v5->_prefetchedDataDict = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VUIDocumentPreFetchedData *v4;
  VUIDocumentPreFetchedData *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VUIDocumentPreFetchedData *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VUIDocumentPreFetchedData jsonData](self, "jsonData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDocumentPreFetchedData jsonData](v5, "jsonData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToDictionary:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSDictionary)prefetchedDataDict
{
  return self->_prefetchedDataDict;
}

- (void)setPrefetchedDataDict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedDataDict, 0);
}

@end
