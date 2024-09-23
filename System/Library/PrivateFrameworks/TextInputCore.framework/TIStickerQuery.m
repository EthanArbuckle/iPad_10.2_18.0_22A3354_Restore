@implementation TIStickerQuery

- (TIStickerQuery)initWithQueryString:(id)a3
{
  id v5;
  TIStickerQuery *v6;
  TIStickerQuery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIStickerQuery;
  v6 = -[TIStickerQuery init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queryString, a3);

  return v7;
}

- (NSString)normalizedQueryString
{
  NSString *normalizedQueryString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  normalizedQueryString = self->_normalizedQueryString;
  if (!normalizedQueryString)
  {
    -[TIStickerQuery queryString](self, "queryString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decomposedStringWithCanonicalMapping");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_normalizedQueryString;
    self->_normalizedQueryString = v6;

    normalizedQueryString = self->_normalizedQueryString;
  }
  return normalizedQueryString;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_normalizedQueryString, 0);
}

@end
