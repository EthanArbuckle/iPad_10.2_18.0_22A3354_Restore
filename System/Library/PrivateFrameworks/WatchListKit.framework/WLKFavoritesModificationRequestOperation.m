@implementation WLKFavoritesModificationRequestOperation

- (WLKFavoritesModificationRequestOperation)initWithAction:(unint64_t)a3 entityId:(id)a4 caller:(id)a5
{
  id v9;
  id v10;
  const __CFString *v11;
  WLKFavoritesModificationRequestOperation *v12;
  void *v13;
  void *v14;
  WLKFavoritesModificationRequestOperation *v15;
  WLKFavoritesModificationRequestOperation *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        v11 = CFSTR("favorites/remove");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid action provided (%ld)"), a3);
        v11 = 0;
      }
    }
    else
    {
      v11 = CFSTR("favorites/add");
    }
    v19[0] = CFSTR("entityId");
    v19[1] = CFSTR("entityType");
    v20[0] = v9;
    v20[1] = CFSTR("team");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:", v11, v13, CFSTR("POST"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18.receiver = self;
    v18.super_class = (Class)WLKFavoritesModificationRequestOperation;
    v15 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v18, sel_initWithRequestProperties_, v14);
    v16 = v15;
    if (v15)
    {
      v15->_action = a3;
      objc_storeStrong((id *)&v15->_entityID, a4);
    }
    self = v16;

    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("entity ID is required"));
    v12 = 0;
  }

  return v12;
}

- (void)processResponse
{
  NSObject *v2;

  if (WLKIsTVApp())
  {
    dispatch_get_global_queue(21, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, &__block_literal_global_51);

  }
}

void __59__WLKFavoritesModificationRequestOperation_processResponse__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("WLKFavoritesModificationRequestOperation: Set last modification date: %@"), v4);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKey:", v4, CFSTR("WLKFavoritesModificationDate"));

  v1 = objc_alloc_init(MEMORY[0x1E0D51618]);
  WLKTVAppBundleID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("WLKFavoritesModificationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronizeUserDefaultsDomain:keys:", v2, v3);

}

- (unint64_t)action
{
  return self->_action;
}

- (NSString)entityID
{
  return self->_entityID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityID, 0);
}

@end
