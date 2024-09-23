@implementation CustomRoutesTask

- (CustomRoutesTask)init
{
  CustomRoutesTask *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t String;
  uint64_t v9;
  NSString *activeTileGroupHash;
  int BOOL;
  objc_super v13;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v13.receiver = self;
  v13.super_class = (Class)CustomRoutesTask;
  v3 = -[CustomRoutesTask init](&v13, "init");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    objc_msgSend(v4, "addTileGroupObserver:queue:", v3, &_dispatch_main_q);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeTileGroup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hashForPurpose:", 0));
    v7 = objc_msgSend(v6, "copy");

    String = GEOConfigGetString(MapsConfig_RouteCreationCacheTileHash, off_1014B5648);
    v9 = objc_claimAutoreleasedReturnValue(String);
    activeTileGroupHash = v3->_activeTileGroupHash;
    v3->_activeTileGroupHash = (NSString *)v9;

    LODWORD(v6) = GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8);
    BOOL = GEOConfigGetBOOL(MapsConfig_RouteCreationSnapshotGeneratedAvailability, off_1014B55B8);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_RouteCreationAvailable, off_1014B55A8, &_dispatch_main_q, v3);

    if ((_DWORD)v6 != BOOL)
      -[CustomRoutesTask _handleAvailabilityChange](v3, "_handleAvailabilityChange");
    if (v7)
      -[CustomRoutesTask setActiveTileGroupHash:](v3, "setActiveTileGroupHash:", v7);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)CustomRoutesTask;
  -[CustomRoutesTask dealloc](&v3, "dealloc");
}

- (void)setActiveTileGroupHash:(id)a3
{
  id v5;
  id *p_activeTileGroupHash;
  NSString *activeTileGroupHash;
  id v8;
  unint64_t v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  unint64_t v16;

  v5 = a3;
  activeTileGroupHash = self->_activeTileGroupHash;
  p_activeTileGroupHash = (id *)&self->_activeTileGroupHash;
  v8 = activeTileGroupHash;
  v9 = (unint64_t)v5;
  if (v9 | (unint64_t)v8)
  {
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      v11 = sub_100BE3590();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = 138543362;
        v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "activeTileGroupHash changed to %{public}@", (uint8_t *)&v15, 0xCu);
      }

      v13 = *p_activeTileGroupHash;
      objc_storeStrong(p_activeTileGroupHash, a3);
      GEOConfigSetString(MapsConfig_RouteCreationCacheTileHash, off_1014B5648, v9);
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[MURouteSnapshotManager sharedInstance](MURouteSnapshotManager, "sharedInstance"));
        objc_msgSend(v14, "purgeSnapshotsWithCompletionBlock:", 0);

      }
    }
  }

}

- (void)_handleAvailabilityChange
{
  uint64_t BOOL;
  id v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];

  BOOL = GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8);
  v3 = sub_100BE3590();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = BOOL;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Availability changed to %d", (uint8_t *)v6, 8u);
  }

  GEOConfigSetBOOL(MapsConfig_RouteCreationSnapshotGeneratedAvailability, off_1014B55B8, BOOL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MURouteSnapshotManager sharedInstance](MURouteSnapshotManager, "sharedInstance"));
  objc_msgSend(v5, "purgeSnapshotsWithCompletionBlock:", 0);

}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)MapsConfig_RouteCreationAvailable && a3.var1 == off_1014B55A8)
    -[CustomRoutesTask _handleAvailabilityChange](self, "_handleAvailabilityChange");
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "activeTileGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hashForPurpose:", 0));
  v5 = objc_msgSend(v4, "copy");
  -[CustomRoutesTask setActiveTileGroupHash:](self, "setActiveTileGroupHash:", v5);

}

- (NSString)activeTileGroupHash
{
  return self->_activeTileGroupHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTileGroupHash, 0);
}

@end
