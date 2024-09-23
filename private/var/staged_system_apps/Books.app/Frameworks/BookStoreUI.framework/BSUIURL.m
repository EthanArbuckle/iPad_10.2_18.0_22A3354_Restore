@implementation BSUIURL

- (BSUIURL)initWithURL:(id)a3
{
  id v4;
  BSUIURL *v5;
  NSURL *v6;
  NSURL *underlyingURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSUIURL;
  v5 = -[BSUIURL init](&v9, "init");
  if (v5)
  {
    v6 = (NSURL *)objc_msgSend(v4, "copy");
    underlyingURL = v5->_underlyingURL;
    v5->_underlyingURL = v6;

  }
  return v5;
}

+ (id)URLWithURL:(id)a3
{
  id v3;
  BSUIURL *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[BSUIURL initWithURL:]([BSUIURL alloc], "initWithURL:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)URLWithURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5
{
  BSUIURL *v5;
  id v7;
  id v8;
  BSUIURL *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v5 = (BSUIURL *)a3;
  if (a3)
  {
    v7 = a5;
    v8 = a4;
    v9 = v5;
    v5 = -[BSUIURL initWithURL:]([BSUIURL alloc], "initWithURL:", v9);

    -[BSUIURL setReferrerApplicationName:](v5, "setReferrerApplicationName:", v8);
    v10 = objc_opt_class(NSDictionary);
    v11 = BUDynamicCast(v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", LSReferrerURLKey));
    v14 = objc_opt_class(NSString);
    v15 = BUDynamicCast(v14, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16)
    {
      -[BSUIURL setReferrerURLString:](v5, "setReferrerURLString:", v13);
    }
    else
    {
      v17 = objc_opt_class(NSURL);
      v18 = BUDynamicCast(v17, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
        -[BSUIURL setReferrerURLString:](v5, "setReferrerURLString:", v20);

      }
    }

  }
  return v5;
}

- (id)actionString
{
  __CFString *v3;
  void *v4;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BSUIURL valueForQueryParameter:](self, "valueForQueryParameter:", CFSTR("action")));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_underlyingURL, "absoluteString"));
    if (objc_msgSend(v4, "rangeOfString:", CFSTR("MZSearch.woa")) == (id)0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v4, "rangeOfString:", CFSTR("/search?")) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v4, "rangeOfString:", CFSTR("freeProductCodeWizard")) == (id)0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v4, "rangeOfString:", CFSTR("redeemLandingPage")) == (id)0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v4, "rangeOfString:", CFSTR("showDialogForRedeem")) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v4, "rangeOfString:", CFSTR("buyLandingPage")) == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v4, "rangeOfString:", CFSTR("buyCharityGiftWizard")) == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(v4, "rangeOfString:", CFSTR("MZFinance.woa")) == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend(v4, "rangeOfString:", CFSTR("viewEula")) == (id)0x7FFFFFFFFFFFFFFFLL)
                v3 = 0;
              else
                v3 = CFSTR("eula");
            }
            else if (objc_msgSend(v4, "rangeOfString:", CFSTR("getPass")) == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v3 = CFSTR("account");
            }
            else
            {
              v3 = CFSTR("addpassbookpass");
            }
          }
          else
          {
            v3 = CFSTR("donate");
          }
        }
        else
        {
          v3 = CFSTR("gift");
        }
      }
      else
      {
        v3 = CFSTR("redeem");
      }
    }
    else
    {
      v3 = CFSTR("search");
    }

  }
  return v3;
}

- (id)valueForQueryParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIURL _queryDictionary](self, "_queryDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (id)_queryDictionary
{
  NSDictionary *queryDictionary;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  queryDictionary = self->_queryDictionary;
  if (!queryDictionary)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL query](self->_underlyingURL, "query"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&")));

    v6 = objc_alloc_init((Class)NSMutableDictionary);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v18));
          if (objc_msgSend(v12, "count") == (char *)&dword_0 + 2)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 1));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 0));
            objc_msgSend(v6, "setObject:forKey:", v13, v14);

          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v15 = (NSDictionary *)objc_msgSend(v6, "copy");
    v16 = self->_queryDictionary;
    self->_queryDictionary = v15;

    queryDictionary = self->_queryDictionary;
  }
  return queryDictionary;
}

- (NSURL)underlyingURL
{
  return self->_underlyingURL;
}

- (void)setUnderlyingURL:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingURL, a3);
}

- (NSString)referrerURLString
{
  return self->_referrerURLString;
}

- (void)setReferrerURLString:(id)a3
{
  objc_storeStrong((id *)&self->_referrerURLString, a3);
}

- (NSString)referrerApplicationName
{
  return self->_referrerApplicationName;
}

- (void)setReferrerApplicationName:(id)a3
{
  objc_storeStrong((id *)&self->_referrerApplicationName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerApplicationName, 0);
  objc_storeStrong((id *)&self->_referrerURLString, 0);
  objc_storeStrong((id *)&self->_underlyingURL, 0);
  objc_storeStrong((id *)&self->_queryDictionary, 0);
}

@end
