@implementation PKPaymentAvailableProductsResponse

- (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)expiry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKWebServiceResponse headers](self, "headers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("Cache-Control"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("="));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 2
    && (objc_msgSend(v6, "objectAtIndex:", 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("max-age")),
        v7,
        v8))
  {
    objc_msgSend(v6, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v3, "dateByAddingTimeInterval:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("Expires"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v3, "dateByAddingTimeInterval:", 86400.0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v15;

  }
  return (NSDate *)v12;
}

- (NSArray)availableProducts
{
  return self->_availableProducts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableProducts, 0);
}

@end
