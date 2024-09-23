@implementation VUIAppDocumentUpdateEventDescriptor

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (VUIAppDocumentUpdateEventDescriptor)initWithEventType:(unint64_t)a3
{
  VUIAppDocumentUpdateEventDescriptor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIAppDocumentUpdateEventDescriptor;
  result = -[VUIAppDocumentUpdateEventDescriptor init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  VUIAppDocumentUpdateEventDescriptor *v4;
  VUIAppDocumentUpdateEventDescriptor *v5;
  VUIAppDocumentUpdateEventDescriptor *v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = (VUIAppDocumentUpdateEventDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIAppDocumentUpdateEventDescriptor type](self, "type");
    v8 = -[VUIAppDocumentUpdateEventDescriptor type](v6, "type");

    v9 = v7 == v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
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
  v12.super_class = (Class)VUIAppDocumentUpdateEventDescriptor;
  -[VUIAppDocumentUpdateEventDescriptor description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  VUIAppDocumentUpdateEventStringRepresentationFromEventType(-[VUIAppDocumentUpdateEventDescriptor type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("type"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __74__VUIAppDocumentUpdateEventDescriptor_groupRecoCollectionVisiblityChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 25);
  v1 = (void *)groupRecoCollectionVisiblityChanged___eventDescriptor;
  groupRecoCollectionVisiblityChanged___eventDescriptor = (uint64_t)v0;

}

void __68__VUIAppDocumentUpdateEventDescriptor_upNextLockupArtSettingChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 8);
  v1 = (void *)upNextLockupArtSettingChanged___eventDescriptor;
  upNextLockupArtSettingChanged___eventDescriptor = (uint64_t)v0;

}

void __67__VUIAppDocumentUpdateEventDescriptor_locationAuthorizationChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 22);
  v1 = (void *)locationAuthorizationChanged___eventDescriptor;
  locationAuthorizationChanged___eventDescriptor = (uint64_t)v0;

}

void __61__VUIAppDocumentUpdateEventDescriptor_brandVisibilityChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 30);
  v1 = (void *)brandVisibilityChanged___eventDescriptor;
  brandVisibilityChanged___eventDescriptor = (uint64_t)v0;

}

void __57__VUIAppDocumentUpdateEventDescriptor_playHistoryUpdated__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 19);
  v1 = (void *)playHistoryUpdated___eventDescriptor;
  playHistoryUpdated___eventDescriptor = (uint64_t)v0;

}

void __55__VUIAppDocumentUpdateEventDescriptor_clearPlayHistory__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 20);
  v1 = (void *)clearPlayHistory___eventDescriptor;
  clearPlayHistory___eventDescriptor = (uint64_t)v0;

}

void __53__VUIAppDocumentUpdateEventDescriptor_accountChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 11);
  v1 = (void *)accountChanged___eventDescriptor;
  accountChanged___eventDescriptor = (uint64_t)v0;

}

void __51__VUIAppDocumentUpdateEventDescriptor_restrictions__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 15);
  v1 = (void *)restrictions___eventDescriptor;
  restrictions___eventDescriptor = (uint64_t)v0;

}

void __51__VUIAppDocumentUpdateEventDescriptor_playActivity__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 5);
  v1 = (void *)playActivity___eventDescriptor;
  playActivity___eventDescriptor = (uint64_t)v0;

}

void __51__VUIAppDocumentUpdateEventDescriptor_entitlements__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 13);
  v1 = (void *)entitlements___eventDescriptor;
  entitlements___eventDescriptor = (uint64_t)v0;

}

void __49__VUIAppDocumentUpdateEventDescriptor_appRefresh__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 21);
  v1 = (void *)appRefresh___eventDescriptor;
  appRefresh___eventDescriptor = (uint64_t)v0;

}

void __48__VUIAppDocumentUpdateEventDescriptor_purchases__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 3);
  v1 = (void *)purchases___eventDescriptor;
  purchases___eventDescriptor = (uint64_t)v0;

}

void __47__VUIAppDocumentUpdateEventDescriptor_settings__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 6);
  v1 = (void *)settings___eventDescriptor;
  settings___eventDescriptor = (uint64_t)v0;

}

void __45__VUIAppDocumentUpdateEventDescriptor_upNext__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 7);
  v1 = (void *)upNext___eventDescriptor;
  upNext___eventDescriptor = (uint64_t)v0;

}

void __43__VUIAppDocumentUpdateEventDescriptor_utsk__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 14);
  v1 = (void *)utsk___eventDescriptor;
  utsk___eventDescriptor = (uint64_t)v0;

}

+ (id)utsk
{
  if (utsk___onceToken != -1)
    dispatch_once(&utsk___onceToken, &__block_literal_global_11);
  return (id)utsk___eventDescriptor;
}

+ (id)upNext
{
  if (upNext___onceToken != -1)
    dispatch_once(&upNext___onceToken, &__block_literal_global_3);
  return (id)upNext___eventDescriptor;
}

+ (id)upNextLockupArtSettingChanged
{
  if (upNextLockupArtSettingChanged___onceToken != -1)
    dispatch_once(&upNextLockupArtSettingChanged___onceToken, &__block_literal_global_4);
  return (id)upNextLockupArtSettingChanged___eventDescriptor;
}

+ (id)settings
{
  if (settings___onceToken != -1)
    dispatch_once(&settings___onceToken, &__block_literal_global_2);
  return (id)settings___eventDescriptor;
}

+ (id)restrictions
{
  if (restrictions___onceToken != -1)
    dispatch_once(&restrictions___onceToken, &__block_literal_global_12);
  return (id)restrictions___eventDescriptor;
}

+ (id)purchases
{
  if (purchases___onceToken != -1)
    dispatch_once(&purchases___onceToken, &__block_literal_global_20);
  return (id)purchases___eventDescriptor;
}

+ (id)playHistoryUpdated
{
  if (playHistoryUpdated___onceToken != -1)
    dispatch_once(&playHistoryUpdated___onceToken, &__block_literal_global_16_0);
  return (id)playHistoryUpdated___eventDescriptor;
}

+ (id)playActivity
{
  if (playActivity___onceToken != -1)
    dispatch_once(&playActivity___onceToken, &__block_literal_global_1);
  return (id)playActivity___eventDescriptor;
}

+ (id)locationAuthorizationChanged
{
  if (locationAuthorizationChanged___onceToken != -1)
    dispatch_once(&locationAuthorizationChanged___onceToken, &__block_literal_global_19_0);
  return (id)locationAuthorizationChanged___eventDescriptor;
}

+ (id)groupRecoCollectionVisiblityChanged
{
  if (groupRecoCollectionVisiblityChanged___onceToken != -1)
    dispatch_once(&groupRecoCollectionVisiblityChanged___onceToken, &__block_literal_global_22);
  return (id)groupRecoCollectionVisiblityChanged___eventDescriptor;
}

+ (id)entitlements
{
  if (entitlements___onceToken != -1)
    dispatch_once(&entitlements___onceToken, &__block_literal_global_10);
  return (id)entitlements___eventDescriptor;
}

+ (id)clearPlayHistory
{
  if (clearPlayHistory___onceToken != -1)
    dispatch_once(&clearPlayHistory___onceToken, &__block_literal_global_17_0);
  return (id)clearPlayHistory___eventDescriptor;
}

+ (id)brandVisibilityChanged
{
  if (brandVisibilityChanged___onceToken != -1)
    dispatch_once(&brandVisibilityChanged___onceToken, &__block_literal_global_26);
  return (id)brandVisibilityChanged___eventDescriptor;
}

+ (id)appRefresh
{
  if (appRefresh___onceToken != -1)
    dispatch_once(&appRefresh___onceToken, &__block_literal_global_18);
  return (id)appRefresh___eventDescriptor;
}

+ (id)accountChanged
{
  if (accountChanged___onceToken != -1)
    dispatch_once(&accountChanged___onceToken, &__block_literal_global_8_0);
  return (id)accountChanged___eventDescriptor;
}

+ (id)preferredPlaybackDimensionalityChanged
{
  if (preferredPlaybackDimensionalityChanged___onceToken != -1)
    dispatch_once(&preferredPlaybackDimensionalityChanged___onceToken, &__block_literal_global_5);
  return (id)preferredPlaybackDimensionalityChanged___eventDescriptor;
}

void __77__VUIAppDocumentUpdateEventDescriptor_preferredPlaybackDimensionalityChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 29);
  v1 = (void *)preferredPlaybackDimensionalityChanged___eventDescriptor;
  preferredPlaybackDimensionalityChanged___eventDescriptor = (uint64_t)v0;

}

+ (id)favorites
{
  if (favorites___onceToken != -1)
    dispatch_once(&favorites___onceToken, &__block_literal_global_6_0);
  return (id)favorites___eventDescriptor;
}

void __48__VUIAppDocumentUpdateEventDescriptor_favorites__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 9);
  v1 = (void *)favorites___eventDescriptor;
  favorites___eventDescriptor = (uint64_t)v0;

}

+ (id)favoritesInBackground
{
  if (favoritesInBackground___onceToken != -1)
    dispatch_once(&favoritesInBackground___onceToken, &__block_literal_global_7);
  return (id)favoritesInBackground___eventDescriptor;
}

void __60__VUIAppDocumentUpdateEventDescriptor_favoritesInBackground__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 10);
  v1 = (void *)favoritesInBackground___eventDescriptor;
  favoritesInBackground___eventDescriptor = (uint64_t)v0;

}

+ (id)removeFromPlayHistory
{
  if (removeFromPlayHistory___onceToken != -1)
    dispatch_once(&removeFromPlayHistory___onceToken, &__block_literal_global_9);
  return (id)removeFromPlayHistory___eventDescriptor;
}

void __60__VUIAppDocumentUpdateEventDescriptor_removeFromPlayHistory__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 12);
  v1 = (void *)removeFromPlayHistory___eventDescriptor;
  removeFromPlayHistory___eventDescriptor = (uint64_t)v0;

}

+ (id)preferredVideoFormat
{
  if (preferredVideoFormat___onceToken != -1)
    dispatch_once(&preferredVideoFormat___onceToken, &__block_literal_global_13);
  return (id)preferredVideoFormat___eventDescriptor;
}

void __59__VUIAppDocumentUpdateEventDescriptor_preferredVideoFormat__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 16);
  v1 = (void *)preferredVideoFormat___eventDescriptor;
  preferredVideoFormat___eventDescriptor = (uint64_t)v0;

}

+ (id)postPlay
{
  if (postPlay___onceToken != -1)
    dispatch_once(&postPlay___onceToken, &__block_literal_global_14);
  return (id)postPlay___eventDescriptor;
}

void __47__VUIAppDocumentUpdateEventDescriptor_postPlay__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 17);
  v1 = (void *)postPlay___eventDescriptor;
  postPlay___eventDescriptor = (uint64_t)v0;

}

+ (id)appDidBecomeActive
{
  if (appDidBecomeActive___onceToken != -1)
    dispatch_once(&appDidBecomeActive___onceToken, &__block_literal_global_15);
  return (id)appDidBecomeActive___eventDescriptor;
}

void __57__VUIAppDocumentUpdateEventDescriptor_appDidBecomeActive__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 18);
  v1 = (void *)appDidBecomeActive___eventDescriptor;
  appDidBecomeActive___eventDescriptor = (uint64_t)v0;

}

+ (id)locationRetrieved
{
  if (locationRetrieved___onceToken != -1)
    dispatch_once(&locationRetrieved___onceToken, &__block_literal_global_20);
  return (id)locationRetrieved___eventDescriptor;
}

void __56__VUIAppDocumentUpdateEventDescriptor_locationRetrieved__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 23);
  v1 = (void *)locationRetrieved___eventDescriptor;
  locationRetrieved___eventDescriptor = (uint64_t)v0;

}

+ (id)highlightsChanged
{
  if (highlightsChanged___onceToken != -1)
    dispatch_once(&highlightsChanged___onceToken, &__block_literal_global_21);
  return (id)highlightsChanged___eventDescriptor;
}

void __56__VUIAppDocumentUpdateEventDescriptor_highlightsChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 24);
  v1 = (void *)highlightsChanged___eventDescriptor;
  highlightsChanged___eventDescriptor = (uint64_t)v0;

}

+ (id)groupRecoUsersChanged
{
  if (groupRecoUsersChanged___onceToken != -1)
    dispatch_once(&groupRecoUsersChanged___onceToken, &__block_literal_global_23);
  return (id)groupRecoUsersChanged___eventDescriptor;
}

void __60__VUIAppDocumentUpdateEventDescriptor_groupRecoUsersChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 26);
  v1 = (void *)groupRecoUsersChanged___eventDescriptor;
  groupRecoUsersChanged___eventDescriptor = (uint64_t)v0;

}

+ (id)deviceDiscoveryDataAvailable
{
  if (deviceDiscoveryDataAvailable___onceToken != -1)
    dispatch_once(&deviceDiscoveryDataAvailable___onceToken, &__block_literal_global_24);
  return (id)deviceDiscoveryDataAvailable___eventDescriptor;
}

void __67__VUIAppDocumentUpdateEventDescriptor_deviceDiscoveryDataAvailable__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 27);
  v1 = (void *)deviceDiscoveryDataAvailable___eventDescriptor;
  deviceDiscoveryDataAvailable___eventDescriptor = (uint64_t)v0;

}

+ (id)favoritesSyncCompleted
{
  if (favoritesSyncCompleted___onceToken != -1)
    dispatch_once(&favoritesSyncCompleted___onceToken, &__block_literal_global_25);
  return (id)favoritesSyncCompleted___eventDescriptor;
}

void __61__VUIAppDocumentUpdateEventDescriptor_favoritesSyncCompleted__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 28);
  v1 = (void *)favoritesSyncCompleted___eventDescriptor;
  favoritesSyncCompleted___eventDescriptor = (uint64_t)v0;

}

+ (id)federatedAppDidInstall
{
  if (federatedAppDidInstall___onceToken != -1)
    dispatch_once(&federatedAppDidInstall___onceToken, &__block_literal_global_27);
  return (id)federatedAppDidInstall___eventDescriptor;
}

void __61__VUIAppDocumentUpdateEventDescriptor_federatedAppDidInstall__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 31);
  v1 = (void *)federatedAppDidInstall___eventDescriptor;
  federatedAppDidInstall___eventDescriptor = (uint64_t)v0;

}

+ (id)pinnedTabsChanged
{
  if (pinnedTabsChanged___onceToken != -1)
    dispatch_once(&pinnedTabsChanged___onceToken, &__block_literal_global_28);
  return (id)pinnedTabsChanged___eventDescriptor;
}

void __56__VUIAppDocumentUpdateEventDescriptor_pinnedTabsChanged__block_invoke()
{
  VUIAppDocumentUpdateEventDescriptor *v0;
  void *v1;

  v0 = -[VUIAppDocumentUpdateEventDescriptor initWithEventType:]([VUIAppDocumentUpdateEventDescriptor alloc], "initWithEventType:", 32);
  v1 = (void *)pinnedTabsChanged___eventDescriptor;
  pinnedTabsChanged___eventDescriptor = (uint64_t)v0;

}

- (VUIAppDocumentUpdateEventDescriptor)init
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

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

@end
