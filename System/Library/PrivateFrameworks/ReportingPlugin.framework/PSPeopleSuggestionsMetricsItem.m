@implementation PSPeopleSuggestionsMetricsItem

- (PSPeopleSuggestionsMetricsItem)initWithId:(id)a3 model:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  _PSPeopleSuggestionsMetricsModel *v15;
  PSPeopleSuggestionsMetricsItem *v16;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[_PSPeopleSuggestionsMetricsModel initWithModelIdentifier:trialIdentifier:]([_PSPeopleSuggestionsMetricsModel alloc], "initWithModelIdentifier:trialIdentifier:", v13, 0);

  v16 = -[PSPeopleSuggestionsMetricsItem initWithId:modelIdentifier:transportBundleId:rank:score:](self, "initWithId:modelIdentifier:transportBundleId:rank:score:", v14, v15, v12, v8, a7);
  return v16;
}

- (PSPeopleSuggestionsMetricsItem)initWithId:(id)a3 modelIdentifier:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  PSPeopleSuggestionsMetricsItem *v14;
  _PSPeopleSuggestionsMetricsItemInternal *v15;
  void *v16;
  uint64_t v17;
  _PSPeopleSuggestionsMetricsItemInternal *underlyingObject;
  objc_super v20;

  v8 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PSPeopleSuggestionsMetricsItem;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[PSPeopleSuggestionsMetricsItem init](&v20, sel_init);
  v15 = [_PSPeopleSuggestionsMetricsItemInternal alloc];
  objc_msgSend(v12, "underlyingObject", v20.receiver, v20.super_class);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[_PSPeopleSuggestionsMetricsItemInternal initWithId:model:transportBundleId:rank:score:](v15, "initWithId:model:transportBundleId:rank:score:", v13, v16, v11, v8, a7);
  underlyingObject = v14->_underlyingObject;
  v14->_underlyingObject = (_PSPeopleSuggestionsMetricsItemInternal *)v17;

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[PSPeopleSuggestionsMetricsItem underlyingObject](self, "underlyingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[PSPeopleSuggestionsMetricsItem underlyingObject](self, "underlyingObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v5 + 32 * v5 + 961;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PSPeopleSuggestionsMetricsItem *v4;
  PSPeopleSuggestionsMetricsItem *v5;
  PSPeopleSuggestionsMetricsItem *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (PSPeopleSuggestionsMetricsItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[PSPeopleSuggestionsMetricsItem underlyingObject](self, "underlyingObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSPeopleSuggestionsMetricsItem underlyingObject](v6, "underlyingObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_PSPeopleSuggestionsMetricsItemInternal)underlyingObject
{
  return (_PSPeopleSuggestionsMetricsItemInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
