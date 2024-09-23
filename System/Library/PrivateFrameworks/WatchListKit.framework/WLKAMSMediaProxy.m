@implementation WLKAMSMediaProxy

- (WLKAMSMediaProxy)initWithDictionary:(id)a3
{
  id v4;
  WLKAMSMediaProxy *v5;
  WLKAMSMediaProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLKAMSMediaProxy;
  v5 = -[WLKAMSMediaProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[WLKAMSMediaProxy _initializeProperties:](v5, "_initializeProperties:", v4);

  return v6;
}

- (void)_initializeProperties:(id)a3
{
  void *v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *contentRatingsBySystemDictionary;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *subtitle;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSArray *v19;
  NSArray *buyParameters;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "wlk_arrayForKey:", CFSTR("data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "wlk_dictionaryForKey:", CFSTR("attributes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("contentRatingsBySystem"));
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    contentRatingsBySystemDictionary = self->_contentRatingsBySystemDictionary;
    self->_contentRatingsBySystemDictionary = v6;

    v22 = v5;
    objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("platformAttributes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "wlk_dictionaryForKey:", CFSTR("appletvos"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_arrayForKey:", CFSTR("offers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasInAppPurchases = objc_msgSend(v8, "wlk_BOOLForKey:defaultValue:", CFSTR("hasInAppPurchases"), 0);
    objc_msgSend(v8, "wlk_stringForKey:", CFSTR("subtitle"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    subtitle = self->_subtitle;
    self->_subtitle = v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "wlk_stringForKey:", CFSTR("buyParams"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    v19 = (NSArray *)objc_msgSend(v12, "copy");
    buyParameters = self->_buyParameters;
    self->_buyParameters = v19;

    NSLog(CFSTR("WLKAMSMediaProxy: properties are: _contentRatingsBySystemDictionary:%@,_hasInAppPurchases:%d,_substitle:%@,_buyParameters: %@"), self->_contentRatingsBySystemDictionary, self->_hasInAppPurchases, self->_subtitle, self->_buyParameters);
  }
  else
  {
    NSLog(CFSTR("dictionary response is invalid and does not have valid node."));
  }

}

- (NSArray)buyParameters
{
  return self->_buyParameters;
}

- (BOOL)hasInAppPurchases
{
  return self->_hasInAppPurchases;
}

- (void)setHasInAppPurchases:(BOOL)a3
{
  self->_hasInAppPurchases = a3;
}

- (NSDictionary)contentRatingsBySystemDictionary
{
  return self->_contentRatingsBySystemDictionary;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_contentRatingsBySystemDictionary, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
}

@end
