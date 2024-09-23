@implementation PKRetrieveMerchantTokensResponse

- (PKRetrieveMerchantTokensResponse)initWithData:(id)a3
{
  PKRetrieveMerchantTokensResponse *v3;
  PKRetrieveMerchantTokensResponse *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PKRetrieveMerchantTokensResponse *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKMerchantToken *v14;
  PKMerchantToken *v15;
  uint64_t v16;
  NSArray *merchantTokens;
  uint64_t v18;
  NSNumber *totalMerchantTokens;
  uint64_t v20;
  NSNumber *pageSize;
  uint64_t v22;
  NSNumber *totalPages;
  uint64_t v24;
  NSNumber *pageNumber;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PKRetrieveMerchantTokensResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v35, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("merchantTokens"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v8 = v6;
      v9 = -[PKRetrieveMerchantTokensResponse countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v32;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
            v14 = [PKMerchantToken alloc];
            v15 = -[PKMerchantToken initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v31);
            if (v15)
              -[NSObject addObject:](v7, "addObject:", v15);

            ++v12;
          }
          while (v10 != v12);
          v10 = -[PKRetrieveMerchantTokensResponse countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v10);
      }

      v16 = -[NSObject copy](v7, "copy");
      merchantTokens = v4->_merchantTokens;
      v4->_merchantTokens = (NSArray *)v16;

      objc_msgSend(v5, "PKNumberForKey:", CFSTR("totalMerchantTokens"));
      v18 = objc_claimAutoreleasedReturnValue();
      totalMerchantTokens = v4->_totalMerchantTokens;
      v4->_totalMerchantTokens = (NSNumber *)v18;

      objc_msgSend(v5, "PKNumberForKey:", CFSTR("pageSize"));
      v20 = objc_claimAutoreleasedReturnValue();
      pageSize = v4->_pageSize;
      v4->_pageSize = (NSNumber *)v20;

      objc_msgSend(v5, "PKNumberForKey:", CFSTR("totalPages"));
      v22 = objc_claimAutoreleasedReturnValue();
      totalPages = v4->_totalPages;
      v4->_totalPages = (NSNumber *)v22;

      objc_msgSend(v5, "PKNumberForKey:", CFSTR("pageNumber"));
      v24 = objc_claimAutoreleasedReturnValue();
      pageNumber = v4->_pageNumber;
      v4->_pageNumber = (NSNumber *)v24;

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2112;
        v39 = v28;
        v29 = v28;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v8 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (PKRetrieveMerchantTokensResponse)initWithMerchantTokens:(id)a3 totalMerchantTokens:(id)a4 pageSize:(id)a5 totalPages:(id)a6 pageNumber:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKRetrieveMerchantTokensResponse *v17;
  uint64_t v18;
  NSArray *merchantTokens;
  uint64_t v20;
  NSNumber *totalMerchantTokens;
  uint64_t v22;
  NSNumber *pageSize;
  uint64_t v24;
  NSNumber *totalPages;
  uint64_t v26;
  NSNumber *pageNumber;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKRetrieveMerchantTokensResponse;
  v17 = -[PKRetrieveMerchantTokensResponse init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    merchantTokens = v17->_merchantTokens;
    v17->_merchantTokens = (NSArray *)v18;

    v20 = objc_msgSend(v13, "copy");
    totalMerchantTokens = v17->_totalMerchantTokens;
    v17->_totalMerchantTokens = (NSNumber *)v20;

    v22 = objc_msgSend(v14, "copy");
    pageSize = v17->_pageSize;
    v17->_pageSize = (NSNumber *)v22;

    v24 = objc_msgSend(v15, "copy");
    totalPages = v17->_totalPages;
    v17->_totalPages = (NSNumber *)v24;

    v26 = objc_msgSend(v16, "copy");
    pageNumber = v17->_pageNumber;
    v17->_pageNumber = (NSNumber *)v26;

  }
  return v17;
}

- (NSArray)merchantTokens
{
  return self->_merchantTokens;
}

- (NSNumber)totalMerchantTokens
{
  return self->_totalMerchantTokens;
}

- (NSNumber)pageSize
{
  return self->_pageSize;
}

- (NSNumber)totalPages
{
  return self->_totalPages;
}

- (NSNumber)pageNumber
{
  return self->_pageNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageNumber, 0);
  objc_storeStrong((id *)&self->_totalPages, 0);
  objc_storeStrong((id *)&self->_pageSize, 0);
  objc_storeStrong((id *)&self->_totalMerchantTokens, 0);
  objc_storeStrong((id *)&self->_merchantTokens, 0);
}

@end
