@implementation MapsAnalyticStateProvider

+ (OS_dispatch_queue)serialQueue
{
  if (qword_1014D3780 != -1)
    dispatch_once(&qword_1014D3780, &stru_1011D9F48);
  return (OS_dispatch_queue *)(id)qword_1014D3778;
}

+ (void)clearSharedState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v2, "setMapLaunchSourceAppId:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v3, "setMapLaunchLaunchUri:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v4, "setMapLaunchReferringWebsite:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v5, "setMapLaunchIsHandoff:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v6, "setMapLaunchSourceHandoffDevice:", 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v7, "setHasMapLaunchAction:", 0);

}

+ (void)updateLocaleInformation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentVoiceLanguage"));

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v6, "setDeviceOutputLocale:", v5);

  }
  if (objc_msgSend(v11, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v7, "setDeviceInputLocale:", v11);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(a1, "updateDriveOptionsInformation:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(a1, "updateWalkOptionsInformation:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(a1, "updateCycleOptionsInformation:", v10);

}

+ (void)updateMapViewInformation:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  unsigned __int8 v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "mapType");
  v6 = 1;
  switch((unint64_t)v5)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 3uLL:
      v6 = 2;
      break;
    case 2uLL:
    case 4uLL:
      v6 = 3;
      break;
    default:
      if (v5 != (id)102)
      {
        if (v5 == (id)104)
          v6 = 4;
        else
          v6 = 0;
      }
      break;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
  v8 = objc_msgSend(v7, "copy");

  objc_msgSend(v4, "_zoomLevel");
  v10 = v9;
  objc_msgSend(v4, "_vectorKitTileZoomLevelForMapKitZoomLevel:");
  v12 = v11;
  LOBYTE(v7) = objc_msgSend(v4, "hasUserLocation");
  v13 = objc_msgSend(v4, "isUserLocationVisible");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "camera"));
  objc_msgSend(v14, "pitch");
  v16 = v15;

  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serialQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100890138;
  v20[3] = &unk_1011D9F98;
  v26 = v6;
  v23 = v10;
  v24 = v12;
  v27 = (char)v7;
  v28 = v13;
  v25 = v16;
  v21 = v8;
  v22 = v4;
  v18 = v4;
  v19 = v8;
  dispatch_async(v17, v20);

}

+ (void)updateMapViewViewMode:(int64_t)a3
{
  int v3;
  NSObject *v4;
  _QWORD block[4];
  int v6;

  if ((unint64_t)a3 > 7)
    v3 = 0;
  else
    v3 = dword_100E3C460[a3];
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100890340;
  block[3] = &unk_1011C9840;
  v6 = v3;
  dispatch_async(v4, block);

}

+ (void)updateTouristInformation
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serialQueue"));
  dispatch_async(v2, &stru_1011D9FB8);

}

+ (void)updateSuggestionSearchInformation:(id)a3 searchText:(id)a4 searchIndex:(int)a5 searchfieldType:(int)a6 suggestionsAcSequenceNumber:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v13, "setSuggestionsSearchString:", v12);
  objc_msgSend(v13, "setSuggestionsSelectedIndex:", v9);
  objc_msgSend(v13, "setSuggestionsSearchFieldType:", v8);
  objc_msgSend(v13, "setSuggestionsAcSequenceNumber:", v7);
  objc_msgSend(v13, "clearSuggestionsDisplayedResults");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "addSuggestionsDisplayedResults:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v18), (_QWORD)v19);
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

+ (void)updateLayoutInformation:(id)a3
{
  char *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unint64_t v21;
  void *v22;
  double Height;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  unsigned int v30;
  uint64_t v32;
  void *v33;
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v34 = a3;
  v3 = (char *)objc_msgSend(v34, "containerStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "currentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardPresentationController"));
  v6 = (char *)objc_msgSend(v5, "containeeLayout");

  if ((unint64_t)(v6 - 1) > 4)
    v7 = 0;
  else
    v7 = dword_100E3C480[(_QWORD)(v6 - 1)];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v8, "setMapUiLayoutInfo:", v7);

  if ((unint64_t)(v3 - 1) > 5)
    v9 = 0;
  else
    v9 = dword_100E3C494[(_QWORD)(v3 - 1)];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v10, "setMapUiLayoutStyle:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "view"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v20, "setLandscape:", v19 < v17);

  v21 = +[UIApplication _maps_numberOfApplicationScenes](UIApplication, "_maps_numberOfApplicationScenes");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v22, "setMapUiNumberOfMapsWindows:", v21);

  v35.origin.x = v13;
  v35.origin.y = v15;
  v35.size.width = v17;
  v35.size.height = v19;
  Height = CGRectGetHeight(v35);
  v36.origin.x = v13;
  v36.origin.y = v15;
  v36.size.width = v17;
  v36.size.height = v19;
  v24 = Height * CGRectGetWidth(v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "window"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "screen"));

  objc_msgSend(v27, "bounds");
  v28 = CGRectGetHeight(v37);
  objc_msgSend(v27, "bounds");
  v29 = v24 / (v28 * CGRectGetWidth(v38));
  if (v29 <= 0.5)
    v30 = 3;
  else
    v30 = 2;
  if (v29 < 0.9 && v29 > 0.7)
    v30 = 1;
  if (v29 <= 0.9)
    v32 = v30;
  else
    v32 = 0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v33, "setWindowSize:", v32);

}

+ (void)updateMapSettingsInformationLabels:(BOOL)a3 traffic:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v6, "setMapSettingsLabelEnabled:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v7, "setMapSettingsTrafficEnabled:", v4);

}

+ (void)updateSettingsInformation
{
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t BOOL;
  AudioPreferences *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = objc_msgSend(v3, "isFindMyCarAllowed");

  v6 = GEOGetUserTransportTypePreference(v5);
  if (v6 < 5)
    v7 = (v6 + 1);
  else
    v7 = 0;
  v36 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  BOOL = GEOConfigGetBOOL(NavigationConfig_SpokenGuidancePauseSpokenAudio[0], NavigationConfig_SpokenGuidancePauseSpokenAudio[1]);
  v9 = -[AudioPreferences initWithDefaults:]([AudioPreferences alloc], "initWithDefaults:", v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  v11 = (char *)-[AudioPreferences drivingVoiceGuidance](v9, "drivingVoiceGuidance") + 1;
  if ((unint64_t)v11 >= 4)
    v12 = 0;
  else
    v12 = v11;
  objc_msgSend(v10, "setNavVoiceGuidanceLevel:forTransportMode:", v12, 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  v14 = (char *)-[AudioPreferences walkingVoiceGuidance](v9, "walkingVoiceGuidance") + 1;
  if ((unint64_t)v14 >= 4)
    v15 = 0;
  else
    v15 = v14;
  objc_msgSend(v13, "setNavVoiceGuidanceLevel:forTransportMode:", v15, 2);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  v17 = (char *)-[AudioPreferences cyclingVoiceGuidance](v9, "cyclingVoiceGuidance") + 1;
  if ((unint64_t)v17 >= 4)
    v18 = 0;
  else
    v18 = v17;
  objc_msgSend(v16, "setNavVoiceGuidanceLevel:forTransportMode:", v18, 5);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v19, "setMapSettingsPauseSpokenAudioEnabled:", BOOL);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v20, "setMapSettingsFindMyCarEnabled:", v4);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v21, "setMapSettingsTransportMode:", v7);

  v22 = GEOConfigGetBOOL(MapsConfig_NavigationShowHeading, off_1014B2FD8);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v23, "setMapSettingsHeadingEnabled:", v22);

  v24 = GEOConfigGetBOOL(MapsConfig_NavigationShowSpeedLimit, off_1014B2FE8);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v25, "setMapSettingsSpeedLimitEnabled:", v24);

  objc_msgSend(a1, "updateDriveOptionsInformation:", v36);
  objc_msgSend(a1, "updateWalkOptionsInformation:", v36);
  objc_msgSend(a1, "updateCycleOptionsInformation:", v36);
  v26 = +[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v27, "setSuggestionsSiriEnabled:", v26);

  if (qword_1014D3790 != -1)
    dispatch_once(&qword_1014D3790, &stru_1011D9FF8);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3788, "path"));
  v29 = (void *)_CFPreferencesCopyAppValueWithContainer(CFSTR("NavVolumeSettingUseHFP"), CFSTR("com.apple.Maps"), v28);

  v30 = NavigationConfig_SpokenGuidanceUseHFP[1];
  if (v29)
  {
    if ((_GEOConfigHasValue(NavigationConfig_SpokenGuidanceUseHFP[0], v30) & 1) == 0)
    {
      v31 = objc_msgSend(v29, "BOOLValue");
      GEOConfigSetBOOL(NavigationConfig_SpokenGuidanceUseHFP[0], NavigationConfig_SpokenGuidanceUseHFP[1], v31);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
    _CFPreferencesSetValueWithContainer(CFSTR("NavVolumeSettingUseHFP"), 0, CFSTR("com.apple.Maps"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost, objc_msgSend(v32, "homeDirectory"));

    v33 = objc_msgSend(v29, "BOOLValue");
  }
  else
  {
    v33 = (id)GEOConfigGetBOOL(NavigationConfig_SpokenGuidanceUseHFP[0], v30);
  }
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v35, "setMapSettingsIsHandsFreeProfileEnabled:", v34);

  objc_msgSend(a1, "updateiCloudStateInformation");
  objc_msgSend(a1, "updateNotificationsStateInformation");

}

+ (void)updateNotificationsStateInformation
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "notificationSettings"));

  v3 = objc_msgSend(v5, "authorizationStatus") == (id)2 || objc_msgSend(v5, "authorizationStatus") == (id)3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v4, "setMapSettingsNotificationsEnabled:", v3);

}

+ (void)updateButtonsInformationAQI:(BOOL)a3 weather:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v6, "setMapUiShownAqiShown:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v7, "setMapUiShownWeatherShown:", v4);

}

+ (void)updateButtonsInformationLookAround:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v4, "setLookAroundEntryIconShown:", v3);

}

+ (void)updateDriveOptionsInformation:(id)a3
{
  id v3;
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  DrivePreferences *v8;

  v3 = a3;
  v8 = -[DrivePreferences initWithDefaults:]([DrivePreferences alloc], "initWithDefaults:", v3);

  v4 = -[DrivePreferences avoidTolls](v8, "avoidTolls");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v5, "setMapSettingsAvoidTolls:", v4);

  v6 = -[DrivePreferences avoidHighways](v8, "avoidHighways");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v7, "setMapSettingsAvoidHighways:", v6);

}

+ (void)updateWalkOptionsInformation:(id)a3
{
  id v3;
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  WalkPreferences *v10;

  v3 = a3;
  v10 = -[WalkPreferences initWithDefaults:]([WalkPreferences alloc], "initWithDefaults:", v3);

  v4 = -[WalkPreferences avoidHills](v10, "avoidHills");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v5, "setMapSettingsWalkingAvoidHills:", v4);

  v6 = -[WalkPreferences avoidBusyRoads](v10, "avoidBusyRoads");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v7, "setMapSettingsWalkingAvoidBusyRoads:", v6);

  v8 = -[WalkPreferences avoidStairs](v10, "avoidStairs");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v9, "setMapSettingsWalkingAvoidStairs:", v8);

}

+ (void)updateCycleOptionsInformation:(id)a3
{
  id v3;
  _BOOL8 v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  CyclePreferences *v10;

  v3 = a3;
  v10 = -[CyclePreferences initWithDefaults:]([CyclePreferences alloc], "initWithDefaults:", v3);

  v4 = -[CyclePreferences avoidHills](v10, "avoidHills");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v5, "setMapSettingsAvoidHills:", v4);

  v6 = -[CyclePreferences avoidBusyRoads](v10, "avoidBusyRoads");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v7, "setMapSettingsAvoidBusyRoads:", v6);

  v8 = -[CyclePreferences ebike](v10, "ebike");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v9, "setMapSettingsEBike:", v8);

}

+ (void)updateiCloudStateInformation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MapsSyncService shared](_TtC8MapsSync15MapsSyncService, "shared"));
  objc_msgSend(v2, "cloudKitSyncAllowedWithCompletionHandler:", &stru_1011D9FD8);

}

+ (void)updatePreciseLocationInformation
{
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v3 = objc_msgSend(v2, "isLocationServicesAuthorizationNeeded");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v5 = objc_msgSend(v4, "isLocationServicesApproved");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v7 = objc_msgSend(v6, "isAuthorizedForPreciseLocation");

  if (v7)
    v8 = 2;
  else
    v8 = 3;
  if (v3 | v5 ^ 1)
    v9 = 1;
  else
    v9 = v8;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v10, "setMapSettingsLocationPrecisionType:", v9);

}

+ (void)setUserProfileUserIsLoggedIntoICloud:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v4, "setUserProfileUserIsLoggedIntoICloud:", v3);

}

+ (void)setUserProfileAvailableActions:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v4, "setUserProfileAvailableActions:", v3);

}

@end
