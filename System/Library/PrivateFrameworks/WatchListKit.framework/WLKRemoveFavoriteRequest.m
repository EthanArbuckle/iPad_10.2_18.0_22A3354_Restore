@implementation WLKRemoveFavoriteRequest

- (WLKRemoveFavoriteRequest)initWithCanonicalID:(id)a3
{
  id v4;
  WLKRemoveFavoriteRequest *v5;
  uint64_t v6;
  NSString *canonicalID;
  WLKRemoveFavoriteRequest *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKRemoveFavoriteRequest;
    v5 = -[WLKRemoveFavoriteRequest init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      canonicalID = v5->_canonicalID;
      v5->_canonicalID = (NSString *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("canonicalID is required"));
    v8 = 0;
  }

  return v8;
}

- (WLKRemoveFavoriteRequest)initWithStatsID:(id)a3
{
  id v4;
  WLKRemoveFavoriteRequest *v5;
  uint64_t v6;
  NSString *statsID;
  WLKRemoveFavoriteRequest *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WLKRemoveFavoriteRequest;
    v5 = -[WLKRemoveFavoriteRequest init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      statsID = v5->_statsID;
      v5->_statsID = (NSString *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("statsID is required"));
    v8 = 0;
  }

  return v8;
}

- (WLKRemoveFavoriteRequest)initWithBundleID:(id)a3 externalID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WLKRemoveFavoriteRequest *v11;
  uint64_t v12;
  NSString *bundleID;
  uint64_t v14;
  NSString *externalID;
  uint64_t v16;
  NSString *channelID;
  WLKRemoveFavoriteRequest *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("bundleID is required");
LABEL_9:
    objc_msgSend(v19, "raise:format:", v20, v21);
    v18 = 0;
    goto LABEL_12;
  }
  if (!v7)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("externalID is required");
    goto LABEL_9;
  }
  +[WLKChannelUtilities sharedInstance](WLKChannelUtilities, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "channelIDForBundleID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)WLKRemoveFavoriteRequest;
    v11 = -[WLKRemoveFavoriteRequest init](&v23, sel_init);
    if (v11)
    {
      v12 = objc_msgSend(v6, "copy");
      bundleID = v11->_bundleID;
      v11->_bundleID = (NSString *)v12;

      v14 = objc_msgSend(v8, "copy");
      externalID = v11->_externalID;
      v11->_externalID = (NSString *)v14;

      v16 = objc_msgSend(v10, "copy");
      channelID = v11->_channelID;
      v11->_channelID = (NSString *)v16;

    }
    self = v11;
    v18 = self;
  }
  else
  {
    NSLog(CFSTR("Error: Unable to resolve bundle ID '%@' into a channel ID."), v6);
    v18 = 0;
  }

LABEL_12:
  return v18;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  WLKWatchListModificationRequestOperation *v7;
  NSString *canonicalID;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  WLKWatchListModificationRequestOperation *v12;
  WLKWatchListModificationRequestOperation *v13;
  NSString *statsID;
  WLKWatchListModificationRequestOperation *v15;
  void *v16;
  WLKWatchListModificationRequestOperation *v17;
  NSString *channelID;
  NSString *externalID;
  void *v20;
  _QWORD v21[4];
  WLKWatchListModificationRequestOperation *v22;
  id v23;
  id v24;
  id v25;
  id from;
  id location;
  _QWORD block[4];
  WLKWatchListModificationRequestOperation *v29;

  v4 = a3;
  +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "optedIn");

  if ((v6 & 1) != 0)
  {
    if (self->_canonicalID)
    {
      v7 = [WLKWatchListModificationRequestOperation alloc];
      canonicalID = self->_canonicalID;
      -[WLKRequest caller](self, "caller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WLKWatchListModificationRequestOperation initWithAction:canonicalID:caller:](v7, "initWithAction:canonicalID:caller:", 1, canonicalID, v9);
    }
    else
    {
      if (!self->_statsID)
      {
        if (self->_channelID && self->_externalID)
        {
          v17 = [WLKWatchListModificationRequestOperation alloc];
          channelID = self->_channelID;
          externalID = self->_externalID;
          -[WLKRequest caller](self, "caller");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[WLKWatchListModificationRequestOperation initWithAction:channelID:externalID:caller:](v17, "initWithAction:channelID:externalID:caller:", 1, channelID, externalID, v20);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("no valid canonical ID or channel/external ID pair"));
          v15 = 0;
        }
        goto LABEL_8;
      }
      v13 = [WLKWatchListModificationRequestOperation alloc];
      statsID = self->_statsID;
      -[WLKRequest caller](self, "caller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[WLKWatchListModificationRequestOperation initWithAction:statsID:caller:](v13, "initWithAction:statsID:caller:", 1, statsID, v9);
    }
    v15 = (WLKWatchListModificationRequestOperation *)v10;

LABEL_8:
    objc_initWeak(&location, self);
    objc_initWeak(&from, v15);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__WLKRemoveFavoriteRequest_makeRequestWithCompletion___block_invoke_2;
    v21[3] = &unk_1E68A9078;
    objc_copyWeak(&v24, &from);
    objc_copyWeak(&v25, &location);
    v23 = v4;
    v12 = v15;
    v22 = v12;
    -[WLKWatchListModificationRequestOperation setCompletionBlock:](v12, "setCompletionBlock:", v21);
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v12);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WLKRemoveFavoriteRequest_makeRequestWithCompletion___block_invoke;
  block[3] = &unk_1E68A7DE0;
  v29 = (WLKWatchListModificationRequestOperation *)v4;
  dispatch_async(v11, block);

  v12 = v29;
LABEL_9:

}

void __54__WLKRemoveFavoriteRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKAddFavoriteRequestErrorDomain"), 9056, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __54__WLKRemoveFavoriteRequest_makeRequestWithCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (v2)
  {
    objc_msgSend(WeakRetained, "response");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[7];
    v2[7] = v3;

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "response");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(*(id *)(a1 + 32), "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = *(_QWORD *)(a1 + 40);
      if (!v7)
      {
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 1, 0);
        goto LABEL_9;
      }
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(WeakRetained, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

  }
LABEL_9:

}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)statsID
{
  return self->_statsID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (WLKWatchListModificationResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_statsID, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

@end
