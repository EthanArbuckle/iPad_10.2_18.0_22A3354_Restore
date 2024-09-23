@implementation BCCacheOperation

+ (id)operationWithKind:(unsigned __int16)a3 vendedImageInterest:(id)a4 subject:(id)a5 request:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  BCCacheOperation *v12;

  v8 = a3;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = objc_alloc_init(BCCacheOperation);
  -[BCCacheOperation setOperationKind:](v12, "setOperationKind:", v8);
  -[BCCacheOperation setVendedImageInterest:](v12, "setVendedImageInterest:", v11);

  -[BCCacheOperation setRequest:](v12, "setRequest:", v9);
  -[BCCacheOperation setSubject:](v12, "setSubject:", v10);

  return v12;
}

+ (id)operationWithKind:(unsigned __int16)a3 vendedImageInterest:(id)a4 request:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  BCCacheOperation *v9;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(BCCacheOperation);
  -[BCCacheOperation setOperationKind:](v9, "setOperationKind:", v6);
  -[BCCacheOperation setVendedImageInterest:](v9, "setVendedImageInterest:", v8);

  -[BCCacheOperation setRequest:](v9, "setRequest:", v7);
  return v9;
}

+ (id)operationWithKind:(unsigned __int16)a3 subject:(id)a4 request:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  BCCacheOperation *v9;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(BCCacheOperation);
  -[BCCacheOperation setOperationKind:](v9, "setOperationKind:", v6);
  -[BCCacheOperation setRequest:](v9, "setRequest:", v7);

  -[BCCacheOperation setSubject:](v9, "setSubject:", v8);
  return v9;
}

+ (id)operationWithKind:(unsigned __int16)a3 subject:(id)a4 result:(id)a5 request:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  BCCacheOperation *v12;

  v8 = a3;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = objc_alloc_init(BCCacheOperation);
  -[BCCacheOperation setOperationKind:](v12, "setOperationKind:", v8);
  -[BCCacheOperation setRequest:](v12, "setRequest:", v9);

  -[BCCacheOperation setSubject:](v12, "setSubject:", v11);
  -[BCCacheOperation setResult:](v12, "setResult:", v10);

  return v12;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheOperation descriptionForKind](self, "descriptionForKind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Op: %@"), v2));

  return v3;
}

- (id)descriptionForKind
{
  unsigned int v2;

  v2 = -[BCCacheOperation operationKind](self, "operationKind");
  if (v2 > 5)
    return 0;
  else
    return off_291DE8[(__int16)v2];
}

- (unsigned)operationKind
{
  return self->_operationKind;
}

- (void)setOperationKind:(unsigned __int16)a3
{
  self->_operationKind = a3;
}

- (BICDescribedImage)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (BICDescribedImage)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (BICDescribedImage)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (BCCacheImageInterest)vendedImageInterest
{
  return self->_vendedImageInterest;
}

- (void)setVendedImageInterest:(id)a3
{
  objc_storeStrong((id *)&self->_vendedImageInterest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendedImageInterest, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
