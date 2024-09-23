@implementation SearchDotPlaceItemKey

- (SearchDotPlaceItemKey)initWithSearchDotPlace:(id)a3
{
  id v4;
  SearchDotPlaceItemKey *v5;
  uint64_t v6;
  GEOMapItemIdentifier *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchDotPlaceItemKey;
  v5 = -[SearchDotPlaceItemKey init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    identifier = v5->_identifier;
    v5->_identifier = (GEOMapItemIdentifier *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlaceItemKey identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "muid");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  SearchDotPlaceItemKey *v4;
  uint64_t v5;
  SearchDotPlaceItemKey *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (SearchDotPlaceItemKey *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(SearchDotPlaceItemKey);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlaceItemKey identifier](self, "identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDotPlaceItemKey identifier](v6, "identifier"));

      v9 = objc_msgSend(v7, "isEqualToGEOMapItemIdentifier:", v8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (GEOMapItemIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
