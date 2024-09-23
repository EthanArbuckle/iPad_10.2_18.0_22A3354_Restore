@implementation WLKChannelUtilities

+ (BOOL)isItunesBundleID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "_validiTunesBundles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)_validiTunesBundles
{
  if (_validiTunesBundles_onceToken != -1)
    dispatch_once(&_validiTunesBundles_onceToken, &__block_literal_global_14_0);
  return (id)_validiTunesBundles___validItunesIDs;
}

+ (id)sharedInstanceFiltered
{
  if (sharedInstanceFiltered_onceToken != -1)
    dispatch_once(&sharedInstanceFiltered_onceToken, &__block_literal_global_40);
  return (id)sharedInstanceFiltered_sharedInstanceFiltered;
}

void __45__WLKChannelUtilities_sharedInstanceFiltered__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WLKChannelUtilities initFiltered:]([WLKChannelUtilities alloc], "initFiltered:", 1);
  v1 = (void *)sharedInstanceFiltered_sharedInstanceFiltered;
  sharedInstanceFiltered_sharedInstanceFiltered = (uint64_t)v0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_3_0);
  return (id)sharedInstance_sharedInstance_2;
}

void __37__WLKChannelUtilities_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WLKChannelUtilities initFiltered:]([WLKChannelUtilities alloc], "initFiltered:", 0);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (id)initFiltered:(BOOL)a3
{
  WLKChannelUtilities *v4;
  WLKChannelUtilities *v5;
  NSMutableArray *inFlightcompletionList;
  NSError *error;
  _QWORD handler[4];
  WLKChannelUtilities *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WLKChannelUtilities;
  v4 = -[WLKChannelUtilities init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_filtered = a3;
    *(_WORD *)&v4->_shouldRefresh = 0;
    inFlightcompletionList = v4->_inFlightcompletionList;
    v4->_inFlightcompletionList = 0;

    v5->_lock._os_unfair_lock_opaque = 0;
    error = v5->_error;
    v5->_error = 0;

    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __36__WLKChannelUtilities_initFiltered___block_invoke;
    handler[3] = &unk_1E68A8820;
    v10 = v5;
    notify_register_dispatch("com.apple.WatchListKit._WLKChannelUtilitesDataShouldRefreshInternal", &v5->_shouldRefreshNotificationToken, MEMORY[0x1E0C80D38], handler);

  }
  return v5;
}

void __36__WLKChannelUtilities_initFiltered___block_invoke(uint64_t a1)
{
  pid_t v2;
  NSObject *v3;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  v2 = getpid();
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32), &state64);
  if (state64 != v2)
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v6 = v2;
      v7 = 2048;
      v8 = state64;
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - Set refresh=YES for next request in process=%llu., Triggered from process=%llu", buf, 0x16u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  }
}

- (WLKChannelUtilities)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKChannelUtilitiesException"), CFSTR("-init not supported"));

  return 0;
}

- (void)loadIfNeededWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    -[WLKChannelUtilities loadIfNeededWithCompletion:].cold.1();
  v5 = v4;
  -[WLKChannelUtilities _loadConfigIfNeededWithCompletion:](self, "_loadConfigIfNeededWithCompletion:", v4);

}

- (void)dealloc
{
  int shouldRefreshNotificationToken;
  objc_super v4;

  shouldRefreshNotificationToken = self->_shouldRefreshNotificationToken;
  if (shouldRefreshNotificationToken)
    notify_cancel(shouldRefreshNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)WLKChannelUtilities;
  -[WLKChannelUtilities dealloc](&v4, sel_dealloc);
}

- (BOOL)loaded
{
  WLKChannelUtilities *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[WLKChannelsResponse isValidForFiltered:](v2->_cachedResponse, "isValidForFiltered:", v2->_filtered);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDictionary)channelsByID
{
  void *v2;
  void *v3;

  -[WLKChannelUtilities _configuration](self, "_configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)channelForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    -[WLKChannelUtilities _configuration](self, "_configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "channels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)channelForBundleID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "_validiTunesBundles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      -[WLKChannelUtilities channelForID:](self, "channelForID:", CFSTR("tvs.sbd.9001"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[WLKChannelUtilities _configuration](self, "_configuration", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "orderedChannels");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v9);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v12, "appBundleIDs");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "containsObject:", v4);

            if (v14)
            {
              v7 = v12;
              goto LABEL_15;
            }
          }
          v7 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)channelIDForBundleID:(id)a3
{
  void *v3;
  void *v4;

  -[WLKChannelUtilities channelForBundleID:](self, "channelForBundleID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)orderedChannels
{
  void *v2;
  void *v3;

  -[WLKChannelUtilities _configuration](self, "_configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedChannels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

void __42__WLKChannelUtilities__validiTunesBundles__block_invoke()
{
  void *v0;

  v0 = (void *)_validiTunesBundles___validItunesIDs;
  _validiTunesBundles___validItunesIDs = (uint64_t)&unk_1E68CA198;

}

- (BOOL)isItunesOrFirstPartyBundleID:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isItunesBundleID:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[WLKChannelUtilities channelForBundleID:](self, "channelForBundleID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isFirstParty");

  }
  return v5;
}

- (id)_configuration
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  os_unfair_lock_s *p_lock;
  WLKChannelsResponse *v7;
  _QWORD v9[4];
  dispatch_semaphore_t v10;

  v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__WLKChannelUtilities__configuration__block_invoke;
  v9[3] = &unk_1E68A9468;
  v10 = v3;
  v4 = v3;
  -[WLKChannelUtilities _loadConfigIfNeededWithCompletion:](self, "_loadConfigIfNeededWithCompletion:", v9);
  v5 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v4, v5);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_cachedResponse;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

intptr_t __37__WLKChannelUtilities__configuration__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_loadConfigIfNeededWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  os_unfair_lock_s *p_lock;
  _BOOL4 isChannelsInProgress;
  NSObject *v8;
  _BOOL4 v9;
  NSMutableArray *inFlightcompletionList;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  WLKChannelsRequestOperation *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  WLKChannelUtilities *v22;
  id v23;
  id v24;
  id location;
  id buf[2];

  v4 = a3;
  if (!v4)
    -[WLKChannelUtilities _loadConfigIfNeededWithCompletion:].cold.1();
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_shouldRefresh
    || !-[WLKChannelsResponse isValidForFiltered:](self->_cachedResponse, "isValidForFiltered:", self->_filtered))
  {
    isChannelsInProgress = self->_isChannelsInProgress;
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (isChannelsInProgress)
    {
      if (v9)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - WLKChannelsRequestOperation in progress. Adding completion to pending list.", (uint8_t *)buf, 2u);
      }

      inFlightcompletionList = self->_inFlightcompletionList;
      v11 = (void *)MEMORY[0x1B5E47FF4](v5);
      -[NSMutableArray addObject:](inFlightcompletionList, "addObject:", v11);

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      if (v9)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - WLKChannelsRequestOperation starting.", (uint8_t *)buf, 2u);
      }

      *(_WORD *)&self->_shouldRefresh = 256;
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = self->_inFlightcompletionList;
      self->_inFlightcompletionList = v12;

      v14 = self->_inFlightcompletionList;
      v15 = (void *)MEMORY[0x1B5E47FF4](v5);
      -[NSMutableArray addObject:](v14, "addObject:", v15);

      v16 = -[WLKChannelsRequestOperation initWithCaller:isFilteredByUserChannels:]([WLKChannelsRequestOperation alloc], "initWithCaller:isFilteredByUserChannels:", 0, self->_filtered);
      os_unfair_lock_unlock(&self->_lock);
      v17 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_initWeak(buf, self);
      objc_initWeak(&location, v16);
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __57__WLKChannelUtilities__loadConfigIfNeededWithCompletion___block_invoke;
      v21 = &unk_1E68A9490;
      objc_copyWeak(&v23, buf);
      objc_copyWeak(&v24, &location);
      v22 = self;
      -[WLKChannelsRequestOperation setCompletionBlock:](v16, "setCompletionBlock:", &v18);
      objc_msgSend(v17, "addOperation:", v16, v18, v19, v20, v21);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      objc_destroyWeak(buf);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v5[2](v5, 1, 0);
  }

}

void __57__WLKChannelUtilities__loadConfigIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = v3;
  if (WeakRetained && v3)
  {
    WLKSystemLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - WLKChannelsRequestOperation completed. Processing response.", buf, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v4, "channelsResponse");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = v6;

    objc_msgSend(v4, "error");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)WeakRetained + 7);
    *((_QWORD *)WeakRetained + 7) = v8;

    *((_BYTE *)WeakRetained + 37) = 0;
    v10 = (void *)objc_msgSend(*((id *)WeakRetained + 6), "copy");
    v11 = (void *)*((_QWORD *)WeakRetained + 6);
    *((_QWORD *)WeakRetained + 6) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    WLKSystemLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B515A000, v12, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - Calling pending completion list with result.", v17, 2u);
    }

    if (objc_msgSend(v10, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
        v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "channelsResponse");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, BOOL, void *))v14)[2](v14, v15 != 0, v16);

        ++v13;
      }
      while (v13 < objc_msgSend(v10, "count"));
    }

  }
}

- (void)updateConsentStatusForCachedEntry:(id)a3 consented:(BOOL)a4
{
  _BOOL8 v4;
  WLKChannelsResponse *cachedResponse;
  id v7;

  v4 = a4;
  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  cachedResponse = self->_cachedResponse;
  if (cachedResponse)
    -[WLKChannelsResponse modifyConsentStatusForChannelEntry:consented:](cachedResponse, "modifyConsentStatusForChannelEntry:consented:", v7, v4);
  -[WLKChannelUtilities invalidateCache](self, "invalidateCache");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)invalidateCache
{
  NSObject *v3;
  int shouldRefreshNotificationToken;
  pid_t v5;
  uint8_t v6[16];

  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - Posting channel data should refresh for cross processes note", v6, 2u);
  }

  shouldRefreshNotificationToken = self->_shouldRefreshNotificationToken;
  v5 = getpid();
  notify_set_state(shouldRefreshNotificationToken, v5);
  notify_post("com.apple.WatchListKit._WLKChannelUtilitesDataShouldRefreshInternal");
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)channelsByBundleID
{
  return self->_channelsByBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelsByBundleID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_inFlightcompletionList, 0);
  objc_storeStrong((id *)&self->_cachedResponse, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)loadIfNeededWithCompletion:.cold.1()
{
  __assert_rtn("-[WLKChannelUtilities loadIfNeededWithCompletion:]", "WLKChannelUtilities.m", 96, "completion != nil");
}

- (void)_loadConfigIfNeededWithCompletion:.cold.1()
{
  __assert_rtn("-[WLKChannelUtilities _loadConfigIfNeededWithCompletion:]", "WLKChannelUtilities.m", 224, "completion != nil");
}

@end
