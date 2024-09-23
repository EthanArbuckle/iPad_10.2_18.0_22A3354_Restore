@implementation VUIAppDocumentUpdateEvent

+ (id)purchases
{
  if (purchases___onceToken_0 != -1)
    dispatch_once(&purchases___onceToken_0, &__block_literal_global_164);
  return (id)purchases___event;
}

void __38__VUIAppDocumentUpdateEvent_purchases__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor purchases](VUIAppDocumentUpdateEventDescriptor, "purchases");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)purchases___event;
  purchases___event = v1;

}

+ (id)playActivity
{
  if (playActivity___onceToken_0 != -1)
    dispatch_once(&playActivity___onceToken_0, &__block_literal_global_3_4);
  return (id)playActivity___event;
}

void __41__VUIAppDocumentUpdateEvent_playActivity__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor playActivity](VUIAppDocumentUpdateEventDescriptor, "playActivity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)playActivity___event;
  playActivity___event = v1;

}

+ (id)settings
{
  if (settings___onceToken_0 != -1)
    dispatch_once(&settings___onceToken_0, &__block_literal_global_4_3);
  return (id)settings___event;
}

void __37__VUIAppDocumentUpdateEvent_settings__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor settings](VUIAppDocumentUpdateEventDescriptor, "settings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)settings___event;
  settings___event = v1;

}

+ (id)favorites
{
  if (favorites___onceToken_0 != -1)
    dispatch_once(&favorites___onceToken_0, &__block_literal_global_5_3);
  return (id)favorites___event;
}

void __38__VUIAppDocumentUpdateEvent_favorites__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor favorites](VUIAppDocumentUpdateEventDescriptor, "favorites");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)favorites___event;
  favorites___event = v1;

}

+ (id)accountChanged
{
  if (accountChanged___onceToken_0 != -1)
    dispatch_once(&accountChanged___onceToken_0, &__block_literal_global_6_1);
  return (id)accountChanged___event;
}

void __43__VUIAppDocumentUpdateEvent_accountChanged__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor accountChanged](VUIAppDocumentUpdateEventDescriptor, "accountChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)accountChanged___event;
  accountChanged___event = v1;

}

+ (id)removeFromPlayHistory
{
  if (removeFromPlayHistory___onceToken_0 != -1)
    dispatch_once(&removeFromPlayHistory___onceToken_0, &__block_literal_global_7_0);
  return (id)removeFromPlayHistory___event;
}

void __50__VUIAppDocumentUpdateEvent_removeFromPlayHistory__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor removeFromPlayHistory](VUIAppDocumentUpdateEventDescriptor, "removeFromPlayHistory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)removeFromPlayHistory___event;
  removeFromPlayHistory___event = v1;

}

+ (id)entitlements
{
  if (entitlements___onceToken_0 != -1)
    dispatch_once(&entitlements___onceToken_0, &__block_literal_global_8_2);
  return (id)entitlements___event;
}

void __41__VUIAppDocumentUpdateEvent_entitlements__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor entitlements](VUIAppDocumentUpdateEventDescriptor, "entitlements");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)entitlements___event;
  entitlements___event = v1;

}

+ (id)restrictions
{
  if (restrictions___onceToken_0 != -1)
    dispatch_once(&restrictions___onceToken_0, &__block_literal_global_9_0);
  return (id)restrictions___event;
}

void __41__VUIAppDocumentUpdateEvent_restrictions__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor restrictions](VUIAppDocumentUpdateEventDescriptor, "restrictions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)restrictions___event;
  restrictions___event = v1;

}

+ (id)utsk
{
  if (utsk___onceToken_0 != -1)
    dispatch_once(&utsk___onceToken_0, &__block_literal_global_10_1);
  return (id)utsk___event;
}

void __33__VUIAppDocumentUpdateEvent_utsk__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor utsk](VUIAppDocumentUpdateEventDescriptor, "utsk");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)utsk___event;
  utsk___event = v1;

}

+ (id)preferredVideoFormat
{
  if (preferredVideoFormat___onceToken_0 != -1)
    dispatch_once(&preferredVideoFormat___onceToken_0, &__block_literal_global_11_3);
  return (id)preferredVideoFormat___event;
}

void __49__VUIAppDocumentUpdateEvent_preferredVideoFormat__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor preferredVideoFormat](VUIAppDocumentUpdateEventDescriptor, "preferredVideoFormat");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)preferredVideoFormat___event;
  preferredVideoFormat___event = v1;

}

+ (id)appDidBecomeActive
{
  if (appDidBecomeActive___onceToken_0 != -1)
    dispatch_once(&appDidBecomeActive___onceToken_0, &__block_literal_global_12_1);
  return (id)appDidBecomeActive___event;
}

void __47__VUIAppDocumentUpdateEvent_appDidBecomeActive__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor appDidBecomeActive](VUIAppDocumentUpdateEventDescriptor, "appDidBecomeActive");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)appDidBecomeActive___event;
  appDidBecomeActive___event = v1;

}

+ (id)playHistoryUpdated
{
  if (playHistoryUpdated___onceToken_0 != -1)
    dispatch_once(&playHistoryUpdated___onceToken_0, &__block_literal_global_13_1);
  return (id)playHistoryUpdated___event;
}

void __47__VUIAppDocumentUpdateEvent_playHistoryUpdated__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor playHistoryUpdated](VUIAppDocumentUpdateEventDescriptor, "playHistoryUpdated");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)playHistoryUpdated___event;
  playHistoryUpdated___event = v1;

}

+ (id)clearPlayHistory
{
  if (clearPlayHistory___onceToken_0 != -1)
    dispatch_once(&clearPlayHistory___onceToken_0, &__block_literal_global_14_2);
  return (id)clearPlayHistory___event;
}

void __45__VUIAppDocumentUpdateEvent_clearPlayHistory__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor clearPlayHistory](VUIAppDocumentUpdateEventDescriptor, "clearPlayHistory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)clearPlayHistory___event;
  clearPlayHistory___event = v1;

}

+ (id)appRefresh
{
  if (appRefresh___onceToken_0 != -1)
    dispatch_once(&appRefresh___onceToken_0, &__block_literal_global_15_2);
  return (id)appRefresh___event;
}

void __39__VUIAppDocumentUpdateEvent_appRefresh__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor appRefresh](VUIAppDocumentUpdateEventDescriptor, "appRefresh");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)appRefresh___event;
  appRefresh___event = v1;

}

+ (id)locationAuthorizationChanged
{
  if (locationAuthorizationChanged___onceToken_0 != -1)
    dispatch_once(&locationAuthorizationChanged___onceToken_0, &__block_literal_global_16_4);
  return (id)locationAuthorizationChanged___event;
}

void __57__VUIAppDocumentUpdateEvent_locationAuthorizationChanged__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor locationAuthorizationChanged](VUIAppDocumentUpdateEventDescriptor, "locationAuthorizationChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)locationAuthorizationChanged___event;
  locationAuthorizationChanged___event = v1;

}

+ (id)locationRetrieved
{
  if (locationRetrieved___onceToken_0 != -1)
    dispatch_once(&locationRetrieved___onceToken_0, &__block_literal_global_17_2);
  return (id)locationRetrieved___event;
}

void __46__VUIAppDocumentUpdateEvent_locationRetrieved__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor locationRetrieved](VUIAppDocumentUpdateEventDescriptor, "locationRetrieved");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)locationRetrieved___event;
  locationRetrieved___event = v1;

}

+ (id)highlightsChanged
{
  if (highlightsChanged___onceToken_0 != -1)
    dispatch_once(&highlightsChanged___onceToken_0, &__block_literal_global_18_1);
  return (id)highlightsChanged___event;
}

void __46__VUIAppDocumentUpdateEvent_highlightsChanged__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor highlightsChanged](VUIAppDocumentUpdateEventDescriptor, "highlightsChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)highlightsChanged___event;
  highlightsChanged___event = v1;

}

+ (id)groupRecoCollectionVisiblityChanged
{
  if (groupRecoCollectionVisiblityChanged___onceToken_0 != -1)
    dispatch_once(&groupRecoCollectionVisiblityChanged___onceToken_0, &__block_literal_global_19_4);
  return (id)groupRecoCollectionVisiblityChanged___event;
}

void __64__VUIAppDocumentUpdateEvent_groupRecoCollectionVisiblityChanged__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor groupRecoCollectionVisiblityChanged](VUIAppDocumentUpdateEventDescriptor, "groupRecoCollectionVisiblityChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)groupRecoCollectionVisiblityChanged___event;
  groupRecoCollectionVisiblityChanged___event = v1;

}

+ (id)groupRecoUsersChanged
{
  if (groupRecoUsersChanged___onceToken_0 != -1)
    dispatch_once(&groupRecoUsersChanged___onceToken_0, &__block_literal_global_20_1);
  return (id)groupRecoUsersChanged___event;
}

void __50__VUIAppDocumentUpdateEvent_groupRecoUsersChanged__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor groupRecoUsersChanged](VUIAppDocumentUpdateEventDescriptor, "groupRecoUsersChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)groupRecoUsersChanged___event;
  groupRecoUsersChanged___event = v1;

}

+ (id)upNextLockupArtSettingChanged
{
  if (upNextLockupArtSettingChanged___onceToken_0[0] != -1)
    dispatch_once(upNextLockupArtSettingChanged___onceToken_0, &__block_literal_global_21_1);
  return (id)upNextLockupArtSettingChanged___event;
}

void __58__VUIAppDocumentUpdateEvent_upNextLockupArtSettingChanged__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor upNextLockupArtSettingChanged](VUIAppDocumentUpdateEventDescriptor, "upNextLockupArtSettingChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)upNextLockupArtSettingChanged___event;
  upNextLockupArtSettingChanged___event = v1;

}

+ (id)deviceDiscoveryDataAvailable
{
  if (deviceDiscoveryDataAvailable___onceToken_0 != -1)
    dispatch_once(&deviceDiscoveryDataAvailable___onceToken_0, &__block_literal_global_22_1);
  return (id)deviceDiscoveryDataAvailable___event;
}

void __57__VUIAppDocumentUpdateEvent_deviceDiscoveryDataAvailable__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor deviceDiscoveryDataAvailable](VUIAppDocumentUpdateEventDescriptor, "deviceDiscoveryDataAvailable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)deviceDiscoveryDataAvailable___event;
  deviceDiscoveryDataAvailable___event = v1;

}

+ (id)favoritesSyncCompleted
{
  if (favoritesSyncCompleted___onceToken_0[0] != -1)
    dispatch_once(favoritesSyncCompleted___onceToken_0, &__block_literal_global_23_2);
  return (id)favoritesSyncCompleted___event;
}

void __51__VUIAppDocumentUpdateEvent_favoritesSyncCompleted__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor favoritesSyncCompleted](VUIAppDocumentUpdateEventDescriptor, "favoritesSyncCompleted");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)favoritesSyncCompleted___event;
  favoritesSyncCompleted___event = v1;

}

+ (id)brandVisibilityChanged
{
  if (brandVisibilityChanged___onceToken_0 != -1)
    dispatch_once(&brandVisibilityChanged___onceToken_0, &__block_literal_global_24_1);
  return (id)brandVisibilityChanged___event;
}

void __51__VUIAppDocumentUpdateEvent_brandVisibilityChanged__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor brandVisibilityChanged](VUIAppDocumentUpdateEventDescriptor, "brandVisibilityChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)brandVisibilityChanged___event;
  brandVisibilityChanged___event = v1;

}

+ (id)federatedAppDidInstall
{
  if (federatedAppDidInstall___onceToken_0 != -1)
    dispatch_once(&federatedAppDidInstall___onceToken_0, &__block_literal_global_25_0);
  return (id)federatedAppDidInstall___event;
}

void __51__VUIAppDocumentUpdateEvent_federatedAppDidInstall__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor federatedAppDidInstall](VUIAppDocumentUpdateEventDescriptor, "federatedAppDidInstall");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)federatedAppDidInstall___event;
  federatedAppDidInstall___event = v1;

}

+ (id)pinnedTabsChanged
{
  if (pinnedTabsChanged___onceToken_0 != -1)
    dispatch_once(&pinnedTabsChanged___onceToken_0, &__block_literal_global_26_2);
  return (id)pinnedTabsChanged___event;
}

void __46__VUIAppDocumentUpdateEvent_pinnedTabsChanged__block_invoke()
{
  VUIAppDocumentUpdateEvent *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [VUIAppDocumentUpdateEvent alloc];
  +[VUIAppDocumentUpdateEventDescriptor pinnedTabsChanged](VUIAppDocumentUpdateEventDescriptor, "pinnedTabsChanged");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[VUIAppDocumentUpdateEvent initWithDescriptor:](v0, "initWithDescriptor:", v3);
  v2 = (void *)pinnedTabsChanged___event;
  pinnedTabsChanged___event = v1;

}

- (VUIAppDocumentUpdateEvent)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIAppDocumentUpdateEvent)initWithDescriptor:(id)a3
{
  id v5;
  VUIAppDocumentUpdateEvent *v6;
  VUIAppDocumentUpdateEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIAppDocumentUpdateEvent;
  v6 = -[VUIAppDocumentUpdateEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_descriptor, a3);

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[VUIAppDocumentUpdateEvent descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VUIAppDocumentUpdateEventStringRepresentationFromEventType(objc_msgSend(v2, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = CFSTR("type");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (id)coalescedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  VUIAppDocumentUpdateEvent *v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppDocumentUpdateEvent descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = self;
  }
  else
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VUIAppDocumentModifiedFavoritesEvent coalescedEvent:].cold.1(self, v4, v9);

    v8 = 0;
  }

  return v8;
}

- (BOOL)isRefreshEvent
{
  void *v2;
  unint64_t v3;

  -[VUIAppDocumentUpdateEvent descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3 < 3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VUIAppDocumentUpdateEvent descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUIAppDocumentUpdateEvent *v4;
  VUIAppDocumentUpdateEvent *v5;
  VUIAppDocumentUpdateEvent *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (VUIAppDocumentUpdateEvent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[VUIAppDocumentUpdateEvent descriptor](self, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppDocumentUpdateEvent descriptor](v6, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v9 && v10)
        v12 = objc_msgSend(v9, "isEqual:", v10);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentUpdateEvent;
  -[VUIAppDocumentUpdateEvent description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentUpdateEvent descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("descriptor"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (VUIAppDocumentUpdateEventDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
