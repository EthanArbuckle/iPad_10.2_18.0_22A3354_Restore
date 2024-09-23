@implementation WLKPlayHistoryRemoveRequest

- (WLKPlayHistoryRemoveRequest)initWithBundleID:(id)a3 externalID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  WLKPlayHistoryRemoveRequest *v12;
  id *p_isa;
  WLKPlayHistoryRemoveRequest *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("bundleID is required");
LABEL_9:
    objc_msgSend(v15, "raise:format:", v16, v17);
    v14 = 0;
    goto LABEL_12;
  }
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("externalID is required");
    goto LABEL_9;
  }
  +[WLKChannelUtilities sharedInstance](WLKChannelUtilities, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "channelIDForBundleID:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)WLKPlayHistoryRemoveRequest;
    v12 = -[WLKPlayHistoryRemoveRequest init](&v19, sel_init);
    p_isa = (id *)&v12->super.super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_bundleID, a3);
      objc_storeStrong(p_isa + 4, a4);
      objc_storeStrong(p_isa + 2, v11);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    NSLog(CFSTR("Error: Unable to resolve bundle ID '%@' into a channel ID."), v7);
    v14 = 0;
  }

LABEL_12:
  return v14;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4;
  WLKPlayHistoryRemoveRequestOperation *v5;
  NSString *channelID;
  NSString *externalID;
  void *v8;
  WLKPlayHistoryRemoveRequestOperation *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = [WLKPlayHistoryRemoveRequestOperation alloc];
  channelID = self->_channelID;
  externalID = self->_externalID;
  -[WLKRequest caller](self, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WLKPlayHistoryRemoveRequestOperation initWithChannelID:externalID:caller:](v5, "initWithChannelID:externalID:caller:", channelID, externalID, v8);

  objc_initWeak(&location, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__WLKPlayHistoryRemoveRequest_makeRequestWithCompletion___block_invoke;
  v12[3] = &unk_1E68A7A28;
  objc_copyWeak(&v14, &location);
  v10 = v4;
  v13 = v10;
  -[WLKPlayHistoryRemoveRequestOperation setCompletionBlock:](v9, "setCompletionBlock:", v12);
  objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __57__WLKPlayHistoryRemoveRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _BOOL8, void *))(v5 + 16))(v5, v4, v6);

    WeakRetained = v7;
  }

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

@end
