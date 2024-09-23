@implementation PSAppSuggestionsMetricsItem

- (PSAppSuggestionsMetricsItem)initWithTransportBundleId:(id)a3 model:(id)a4 rank:(unsigned __int8)a5
{
  uint64_t v5;
  id v7;
  id v8;
  PSAppSuggestionsMetricsItem *v9;
  _PSAppSuggestionsMetricsItem *v10;
  uint64_t v11;
  _PSAppSuggestionsMetricsItem *underlyingObject;
  objc_super v14;

  v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSAppSuggestionsMetricsItem;
  v7 = a4;
  v8 = a3;
  v9 = -[PSAppSuggestionsMetricsItem init](&v14, sel_init);
  v10 = [_PSAppSuggestionsMetricsItem alloc];
  v11 = -[_PSAppSuggestionsMetricsItem initWithTransportBundleId:model:rank:](v10, "initWithTransportBundleId:model:rank:", v8, v7, v5, v14.receiver, v14.super_class);

  underlyingObject = v9->_underlyingObject;
  v9->_underlyingObject = (_PSAppSuggestionsMetricsItem *)v11;

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[PSAppSuggestionsMetricsItem underlyingObject](self, "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[PSAppSuggestionsMetricsItem underlyingObject](self, "underlyingObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v5 + 32 * v5 + 961;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PSAppSuggestionsMetricsItem *v4;
  PSAppSuggestionsMetricsItem *v5;
  PSAppSuggestionsMetricsItem *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (PSAppSuggestionsMetricsItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[PSAppSuggestionsMetricsItem underlyingObject](self, "underlyingObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSAppSuggestionsMetricsItem underlyingObject](v6, "underlyingObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_PSAppSuggestionsMetricsItem)underlyingObject
{
  return (_PSAppSuggestionsMetricsItem *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
