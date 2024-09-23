@implementation WLKStoreOffer

- (id)sui_buttonSubtitleWithServiceName:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v5 = -[WLKStoreOffer offerType](self, "offerType");
  switch(v5)
  {
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("OFFER_ACTION_PREORDER");
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("OFFER_ACTION_RENT");
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("OFFER_ACTION_BUY");
LABEL_7:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E68AA228, CFSTR("WatchListKit"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
  }
  v9 = 0;
LABEL_9:
  if (objc_msgSend(v9, "length"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OFFER_PURCHASE_SUBTITLE_FORMAT"), &stru_1E68AA228, CFSTR("WatchListKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v4;
    if (-[WLKStoreOffer offerType](self, "offerType") != 4)
      goto LABEL_12;
    if (v13)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OFFER_SUBSCRIPTION_SUBTITLE_FORMAT"), &stru_1E68AA228, CFSTR("WatchListKit"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v13);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OFFER_SUBSCRIPTION_SUBTITLE_FALLBACK"), &stru_1E68AA228, CFSTR("WatchListKit"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_12:
  return v13;
}

- (id)sui_buttonTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WLKStoreOffer formattedPrice](self, "formattedPrice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WLKStoreOffer offerType](self, "offerType") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OFFER_ACTION_SUBSCRIBE"), &stru_1E68AA228, CFSTR("WatchListKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[WLKStoreOffer subscriptionType](self, "subscriptionType") == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WatchListKit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OFFER_ACTION_SUBSCRIBE_FREE_TRIAL"), &stru_1E68AA228, CFSTR("WatchListKit"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = v5;
    }
  }
  return v3;
}

- (WLKStoreOffer)initWithSubscriptionDictionary:(id)a3
{
  id v4;
  WLKStoreOffer *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  void *v8;
  uint64_t v9;
  NSString *buyParameters;
  void *v11;
  uint64_t v12;
  NSString *title;
  void *v14;
  void *v15;
  uint64_t v16;
  NSNumber *price;
  uint64_t v18;
  NSString *formattedPrice;
  void *v20;
  void *v21;
  WLKStoreOfferPeriod *v22;
  WLKStoreOfferPeriod *freeTrialPeriod;
  WLKStoreOfferPeriod *v24;
  void *v25;
  WLKStoreOfferPeriod *v26;
  WLKStoreOfferPeriod *renewalPeriod;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WLKStoreOffer;
  v5 = -[WLKStoreOffer init](&v29, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v5->_offerType = 4;
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("buyParams"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v9;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v12;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("price"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "floatValue");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = objc_claimAutoreleasedReturnValue();
    price = v5->_price;
    v5->_price = (NSNumber *)v16;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("priceForDisplay"));
    v18 = objc_claimAutoreleasedReturnValue();
    formattedPrice = v5->_formattedPrice;
    v5->_formattedPrice = (NSString *)v18;

    v5->_subscriptionType = 1;
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("eligibilityType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("INTRO")))
    {
      v5->_subscriptionType = 2;
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("freeTrialPeriod"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[WLKStoreOfferPeriod initWithString:]([WLKStoreOfferPeriod alloc], "initWithString:", v21);
      freeTrialPeriod = v5->_freeTrialPeriod;
      v5->_freeTrialPeriod = v22;
    }
    else
    {
      if (!objc_msgSend(v20, "isEqualToString:", CFSTR("HARDWARE_1")))
      {
LABEL_7:
        objc_msgSend(v4, "wlk_stringForKey:", CFSTR("renewalPeriod"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[WLKStoreOfferPeriod initWithString:]([WLKStoreOfferPeriod alloc], "initWithString:", v25);
        renewalPeriod = v5->_renewalPeriod;
        v5->_renewalPeriod = v26;

        goto LABEL_8;
      }
      v5->_subscriptionType = 3;
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("introOfferPeriod"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[WLKStoreOfferPeriod initWithString:]([WLKStoreOfferPeriod alloc], "initWithString:", v21);
      freeTrialPeriod = v5->_introOfferPeriod;
      v5->_introOfferPeriod = v24;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (WLKStoreOffer)initWithMAPIDictionary:(id)a3
{
  id v4;
  WLKStoreOffer *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  void *v8;
  uint64_t v9;
  NSString *buyParameters;
  void *v11;
  void *v12;
  void *v13;
  NSNumber *v14;
  void *v15;
  NSNumber *price;
  uint64_t v17;
  NSString *formattedPrice;
  void *v19;
  uint64_t v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WLKStoreOffer;
  v5 = -[WLKStoreOffer init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("buyParams"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v9;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("price"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wlk_numberForKey:", CFSTR("price"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v11, "floatValue");
      objc_msgSend(v15, "numberWithFloat:");
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    price = v5->_price;
    v5->_price = v14;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("priceFormatted"));
    v17 = objc_claimAutoreleasedReturnValue();
    formattedPrice = v5->_formattedPrice;
    v5->_formattedPrice = (NSString *)v17;

    v5->_offerType = 0;
    v5->_subscriptionType = 0;
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("kind"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("buy")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("rent")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("preorder")) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("get")) & 1) != 0)
    {
      v20 = 5;
    }
    else
    {
      if (!objc_msgSend(v19, "isEqualToString:", CFSTR("redownload")))
      {
LABEL_16:

        goto LABEL_17;
      }
      v20 = 6;
    }
    v5->_offerType = v20;
    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

- (BOOL)specialOfferEligible
{
  void *v3;
  BOOL v4;
  void *v5;

  -[WLKStoreOffer freeTrialPeriod](self, "freeTrialPeriod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[WLKStoreOffer introOfferPeriod](self, "introOfferPeriod");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

+ (id)offersWithSubscriptionDictionaries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WLKStoreOffer *v11;
  WLKStoreOffer *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [WLKStoreOffer alloc];
        v12 = -[WLKStoreOffer initWithSubscriptionDictionary:](v11, "initWithSubscriptionDictionary:", v10, (_QWORD)v15);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v13 = (void *)objc_msgSend(v4, "copy");
  else
    v13 = 0;

  return v13;
}

+ (id)offersWithMAPIDictionaries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WLKStoreOffer *v11;
  WLKStoreOffer *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [WLKStoreOffer alloc];
        v12 = -[WLKStoreOffer initWithMAPIDictionary:](v11, "initWithMAPIDictionary:", v10, (_QWORD)v15);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v13 = (void *)objc_msgSend(v4, "copy");
  else
    v13 = 0;

  return v13;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (NSNumber)price
{
  return self->_price;
}

- (unint64_t)offerType
{
  return self->_offerType;
}

- (unint64_t)subscriptionType
{
  return self->_subscriptionType;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (WLKStoreOfferPeriod)renewalPeriod
{
  return self->_renewalPeriod;
}

- (WLKStoreOfferPeriod)freeTrialPeriod
{
  return self->_freeTrialPeriod;
}

- (WLKStoreOfferPeriod)introOfferPeriod
{
  return self->_introOfferPeriod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_introOfferPeriod, 0);
  objc_storeStrong((id *)&self->_freeTrialPeriod, 0);
  objc_storeStrong((id *)&self->_renewalPeriod, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
}

@end
