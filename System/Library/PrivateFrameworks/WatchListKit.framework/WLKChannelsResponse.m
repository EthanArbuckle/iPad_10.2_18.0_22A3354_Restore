@implementation WLKChannelsResponse

- (WLKChannelsResponse)initWithDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5 filtered:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  WLKChannelsResponse *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *modificationQueue;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  objc_super v29;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WLKChannelsResponse;
  v12 = -[WLKChannelsResponse init](&v29, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("WLKChannelsResponseModificationQueue", 0);
    modificationQueue = v12->_modificationQueue;
    v12->_modificationQueue = (OS_dispatch_queue *)v13;

    objc_msgSend(v10, "wlk_dictionaryForKey:", CFSTR("channels"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __82__WLKChannelsResponse_initWithDictionary_expirationDate_environmentHash_filtered___block_invoke;
    v26 = &unk_1E68A9E28;
    v27 = v16;
    v28 = v17;
    v18 = v17;
    v19 = v16;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", &v23);
    v20 = (void *)objc_msgSend(v19, "copy", v23, v24, v25, v26);
    -[WLKChannelsResponse setOrderedChannels:](v12, "setOrderedChannels:", v20);

    v21 = (void *)objc_msgSend(v18, "copy");
    -[WLKChannelsResponse setChannels:](v12, "setChannels:", v21);

    -[WLKChannelsResponse setExpirationDate:](v12, "setExpirationDate:", v11);
    -[WLKChannelsResponse setFiltered:](v12, "setFiltered:", v6);
    -[WLKChannelsResponse setEnvironmentHash:](v12, "setEnvironmentHash:", a5);

  }
  return v12;
}

void __82__WLKChannelsResponse_initWithDictionary_expirationDate_environmentHash_filtered___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WLKChannelDetails *v8;

  v4 = a3;
  v8 = -[WLKChannelDetails initWithDictionary:]([WLKChannelDetails alloc], "initWithDictionary:", v4);

  -[WLKChannelDetails channelID](v8, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    v6 = *(void **)(a1 + 40);
    -[WLKChannelDetails channelID](v8, "channelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, v7);

  }
}

- (void)setChannels:(id)a3
{
  id v4;
  NSObject *modificationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WLKChannelsResponse_setChannels___block_invoke;
  block[3] = &unk_1E68A9E50;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(modificationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __35__WLKChannelsResponse_setChannels___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 3, *(id *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (NSDictionary)channels
{
  NSObject *modificationQueue;
  id v4;
  _QWORD v6[6];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  v14 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__WLKChannelsResponse_channels__block_invoke;
  v6[3] = &unk_1E68A9E78;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v6[5] = &v9;
  dispatch_sync(modificationQueue, v6);
  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v4;
}

void __31__WLKChannelsResponse_channels__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    WeakRetained = v6;
  }

}

- (void)setOrderedChannels:(id)a3
{
  id v4;
  NSObject *modificationQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__WLKChannelsResponse_setOrderedChannels___block_invoke;
  block[3] = &unk_1E68A9E50;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(modificationQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __42__WLKChannelsResponse_setOrderedChannels___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (NSArray)orderedChannels
{
  NSObject *modificationQueue;
  id v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  v14 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__WLKChannelsResponse_orderedChannels__block_invoke;
  block[3] = &unk_1E68A9EA0;
  objc_copyWeak(&v7, &location);
  block[4] = &v9;
  dispatch_sync(modificationQueue, block);
  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

void __38__WLKChannelsResponse_orderedChannels__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_msgSend(WeakRetained[2], "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    WeakRetained = v6;
  }

}

- (void)modifyConsentStatusForChannelEntry:(id)a3 consented:(BOOL)a4
{
  id v6;
  NSObject *modificationQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  modificationQueue = self->_modificationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__WLKChannelsResponse_modifyConsentStatusForChannelEntry_consented___block_invoke;
  v9[3] = &unk_1E68A9EC8;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v12 = a4;
  v8 = v6;
  dispatch_async(modificationQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __68__WLKChannelsResponse_modifyConsentStatusForChannelEntry_consented___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[3], "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "setConsented:", *(unsigned __int8 *)(a1 + 48));

    WeakRetained = v5;
  }

}

- (BOOL)isValidForFiltered:(BOOL)a3
{
  int v3;
  int filtered;
  void *v6;
  NSDate *expirationDate;
  double v8;
  BOOL v9;
  unint64_t environmentHash;
  void *v11;
  uint64_t v12;
  BOOL result;

  v3 = a3;
  filtered = self->_filtered;
  -[WLKChannelsResponse channels](self, "channels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    -[NSDate timeIntervalSinceNow](expirationDate, "timeIntervalSinceNow");
    v9 = v8 > -5.0;
  }
  else
  {
    v9 = 0;
  }
  environmentHash = self->_environmentHash;
  +[WLKUserEnvironment currentEnvironment](WLKUserEnvironment, "currentEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  result = 0;
  if (filtered == v3 && v6)
    return environmentHash == v12 && v9;
  return result;
}

+ (id)parseChannelsFromPayload:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a3, "wlk_arrayForKey:", CFSTR("channels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__WLKChannelsResponse_parseChannelsFromPayload___block_invoke;
  v8[3] = &unk_1E68A8DD8;
  v5 = v4;
  v9 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  if (objc_msgSend(v5, "count"))
    v6 = (void *)objc_msgSend(v5, "copy");
  else
    v6 = 0;

  return v6;
}

void __48__WLKChannelsResponse_parseChannelsFromPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  WLKChannelDetails *v5;

  v3 = a2;
  v5 = -[WLKChannelDetails initWithDictionary:]([WLKChannelDetails alloc], "initWithDictionary:", v3);

  -[WLKChannelDetails channelID](v5, "channelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (BOOL)filtered
{
  return self->_filtered;
}

- (void)setFiltered:(BOOL)a3
{
  self->_filtered = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)environmentHash
{
  return self->_environmentHash;
}

- (void)setEnvironmentHash:(unint64_t)a3
{
  self->_environmentHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_orderedChannels, 0);
  objc_storeStrong((id *)&self->_modificationQueue, 0);
}

@end
