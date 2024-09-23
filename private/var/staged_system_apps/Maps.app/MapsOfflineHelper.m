@implementation MapsOfflineHelper

+ (MapsOfflineHelper)sharedHelper
{
  if (qword_1014D2048 != -1)
    dispatch_once(&qword_1014D2048, &stru_1011B0048);
  return (MapsOfflineHelper *)(id)qword_1014D2040;
}

- (id)init_internal
{
  MapsOfflineHelper *v2;
  uint64_t v3;
  geo_isolater *completionIsolater;
  MapsOfflineHelper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsOfflineHelper;
  v2 = -[MapsOfflineHelper init](&v7, "init");
  if (v2)
  {
    v3 = geo_isolater_create("com.apple.Maps.OfflineHelper");
    completionIsolater = v2->_completionIsolater;
    v2->_completionIsolater = (geo_isolater *)v3;

    _GEOConfigAddDelegateListenerForKey(MapsConfig_OfflineOnlyData, off_1014B4C08, &_dispatch_main_q, v2);
    -[MapsOfflineHelper _updateForcedOffline](v2, "_updateForcedOffline");
    v5 = v2;
  }

  return v2;
}

- (BOOL)offlineServiceEnabled
{
  return 1;
}

- (BOOL)offlineServiceRunning
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  v3 = objc_msgSend(v2, "isUsingOffline");

  return v3;
}

- (void)startServiceIfEnabled
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  objc_msgSend(v2, "startServiceIfEnabled");

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)MapsConfig_OfflineOnlyData && a3.var1 == off_1014B4C08)
    -[MapsOfflineHelper _updateForcedOffline](self, "_updateForcedOffline");
}

- (void)_updateForcedOffline
{
  int BOOL;
  void *v3;
  id v4;

  BOOL = GEOConfigGetBOOL(MapsConfig_OfflineOnlyData, off_1014B4C08);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  v4 = v3;
  if (BOOL)
    objc_msgSend(v3, "setStateForcedOffline");
  else
    objc_msgSend(v3, "setStateAuto");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_completionIsolater, 0);
}

@end
