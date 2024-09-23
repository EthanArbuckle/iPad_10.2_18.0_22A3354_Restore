@implementation PKPaymentTransactionIconRequest

- (id)logoURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  PKPayLaterMerchant *payLaterMerchant;

  if (self->_transaction)
  {
    -[PKPaymentTransaction merchant](self->_transaction, "merchant");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logoImageURL");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_merchant)
    {
      -[PKMerchant logoImageURL](self->_merchant, "logoImageURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    payLaterMerchant = self->_payLaterMerchant;
    if (!payLaterMerchant)
    {
      v4 = 0;
      return v4;
    }
    -[PKPayLaterMerchant mapsBrand](payLaterMerchant, "mapsBrand");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logoURL");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  char v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = (double *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (self->_size.width == v4[7] ? (v5 = self->_size.height == v4[8]) : (v5 = 0), v5))
  {
    v7 = (void *)*((_QWORD *)v4 + 5);
    v8 = self->_cacheKey;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v6 = 1;
    }
    else
    {
      v6 = 0;
      if (v8 && v9)
        v6 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  -[NSString hash](self->_cacheKey, "hash");
  PKDoubleHash();
  return PKDoubleHash();
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (PKPayLaterMerchant)payLaterMerchant
{
  return self->_payLaterMerchant;
}

- (void)setPayLaterMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterMerchant, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (NSArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (BOOL)ignoreLogoURL
{
  return self->_ignoreLogoURL;
}

- (void)setIgnoreLogoURL:(BOOL)a3
{
  self->_ignoreLogoURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_payLaterMerchant, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
