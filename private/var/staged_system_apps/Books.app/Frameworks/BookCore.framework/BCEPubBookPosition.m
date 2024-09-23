@implementation BCEPubBookPosition

+ (id)positionWithCFI:(id)a3
{
  id v3;
  BCEPubBookPosition *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(BCEPubBookPosition);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tailCFI"));

  -[BCEPubBookPosition setCfiPosition:](v4, "setCfiPosition:", v5);
  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class(BCEPubBookPosition);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCEPubBookPosition cfiPosition](self, "cfiPosition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cfiPosition"));
  v10 = objc_msgSend(v8, "compare:", v9);

  return (int64_t)v10;
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCEPubBookPosition cfiPosition](self, "cfiPosition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BCEPubBookPosition(%@)"), v2));

  return (NSString *)v3;
}

- (BCCFI)cfiPosition
{
  return self->_cfiPosition;
}

- (void)setCfiPosition:(id)a3
{
  objc_storeStrong((id *)&self->_cfiPosition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cfiPosition, 0);
}

@end
