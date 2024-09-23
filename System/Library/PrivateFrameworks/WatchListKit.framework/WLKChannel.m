@implementation WLKChannel

- (WLKChannel)initWithDictionary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  WLKChannel *v8;
  uint64_t v9;
  NSString *ID;
  uint64_t v11;
  NSDictionary *punchoutUrls;
  uint64_t v13;
  NSArray *seasonNumbers;
  void *v15;
  uint64_t v16;
  NSArray *subscriptionOffers;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  WLKChannelDetails *details;
  _QWORD v24[4];
  WLKChannel *v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)WLKChannel;
  v8 = -[WLKChannel init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("channelId"));
    v9 = objc_claimAutoreleasedReturnValue();
    ID = v8->_ID;
    v8->_ID = (NSString *)v9;

    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("punchoutUrls"));
    v11 = objc_claimAutoreleasedReturnValue();
    punchoutUrls = v8->_punchoutUrls;
    v8->_punchoutUrls = (NSDictionary *)v11;

    objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("seasonNumbers"));
    v13 = objc_claimAutoreleasedReturnValue();
    seasonNumbers = v8->_seasonNumbers;
    v8->_seasonNumbers = (NSArray *)v13;

    objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("subscriptionOffers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[WLKStoreOffer offersWithSubscriptionDictionaries:](WLKStoreOffer, "offersWithSubscriptionDictionaries:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      subscriptionOffers = v8->_subscriptionOffers;
      v8->_subscriptionOffers = (NSArray *)v16;

    }
    v18 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "wlk_arrayForKey:", CFSTR("WLKModelContextKeyChannels"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __41__WLKChannel_initWithDictionary_context___block_invoke;
      v24[3] = &unk_1E68A8430;
      v25 = v8;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v24);

    }
    if (!v8->_details)
    {
      +[WLKChannelUtilities sharedInstance](WLKChannelUtilities, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "channelForID:", v8->_ID);
      v21 = objc_claimAutoreleasedReturnValue();
      details = v8->_details;
      v8->_details = (WLKChannelDetails *)v21;

    }
  }

  return v8;
}

void __41__WLKChannel_initWithDictionary_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "channelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
    *a4 = 1;
  }

}

- (WLKChannel)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKChannelInitException"), CFSTR("-init not supported. Use initWithDictionary: instead"));

  return 0;
}

+ (id)channelsWithDictionaries:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WLKChannel *v14;
  WLKChannel *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = [WLKChannel alloc];
        v15 = -[WLKChannel initWithDictionary:context:](v14, "initWithDictionary:context:", v13, v6, (_QWORD)v18);
        if (v15)
          objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

+ (id)channelsWithDictionaries:(id)a3 context:(id)a4 seasons:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WLKChannel *v21;
  void *v22;
  id obj;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v10 = 0;
    v26 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        v30 = v11;
        objc_msgSend(v29, "wlk_arrayForKey:", CFSTR("seasons"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v10 = v12;
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v32 != v15)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "wlk_stringForKey:", CFSTR("id"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "wlk_dictionaryForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "wlk_numberForKey:", CFSTR("seasonNumber"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v9, "addObject:", v19);
            }
            v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v14);
        }

        v20 = (void *)objc_msgSend(v29, "mutableCopy");
        objc_msgSend(v20, "setObject:forKey:", v9, CFSTR("seasonNumbers"));
        v21 = -[WLKChannel initWithDictionary:context:]([WLKChannel alloc], "initWithDictionary:context:", v20, v27);
        if (v21)
          objc_msgSend(v25, "addObject:", v21);

        v11 = v30 + 1;
      }
      while (v30 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v28);

  }
  v22 = (void *)objc_msgSend(v25, "copy");

  return v22;
}

- (NSString)ID
{
  return self->_ID;
}

- (WLKChannelDetails)details
{
  return self->_details;
}

- (NSDictionary)punchoutUrls
{
  return self->_punchoutUrls;
}

- (NSArray)seasonNumbers
{
  return self->_seasonNumbers;
}

- (NSArray)subscriptionOffers
{
  return self->_subscriptionOffers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionOffers, 0);
  objc_storeStrong((id *)&self->_seasonNumbers, 0);
  objc_storeStrong((id *)&self->_punchoutUrls, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
