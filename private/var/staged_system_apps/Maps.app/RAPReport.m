@implementation RAPReport

- (RAPReport)init
{
  RAPReport *result;

  result = (RAPReport *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (RAPReport)initWithContext:(id)a3 submitter:(id)a4
{
  id v7;
  id v8;
  RAPReport *v9;
  RAPReport *v10;
  NSMutableArray *v11;
  NSMutableArray *photosWithMetadata;
  uint64_t v13;
  NSDate *creationDate;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPReport;
  v9 = -[RAPReport init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_submitter, a4);
    v11 = objc_opt_new(NSMutableArray);
    photosWithMetadata = v10->_photosWithMetadata;
    v10->_photosWithMetadata = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v13;

    -[RAPReport _setNeedsUpdate](v10, "_setNeedsUpdate");
  }

  return v10;
}

- (void)setInitialQuestion:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_initialQuestion)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_initialQuestion, a3);
    -[RAPReport _setNeedsUpdate](self, "_setNeedsUpdate");
    v5 = v6;
  }

}

- (void)addPhotoWithMetadata:(id)a3
{
  -[NSMutableArray addObject:](self->_photosWithMetadata, "addObject:", a3);
}

- (void)removePhotosOfType:(int64_t)a3
{
  NSMutableArray *photosWithMetadata;
  void *v4;
  _QWORD v5[5];

  photosWithMetadata = self->_photosWithMetadata;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006B72F8;
  v5[3] = &unk_1011C0318;
  v5[4] = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v5));
  -[NSMutableArray filterUsingPredicate:](photosWithMetadata, "filterUsingPredicate:", v4);

}

- (BOOL)canCreateSubmittableProblem
{
  -[RAPReport updateIfNeeded](self, "updateIfNeeded");
  return self->_canCreateSubmittableProblem;
}

- (void)_setNeedsUpdate
{
  _QWORD block[5];

  if (!self->_willUpdate)
  {
    self->_willUpdate = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006B73B8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateIfNeeded
{
  if (self->_willUpdate)
  {
    self->_willUpdate = 0;
    -[RAPReport _update](self, "_update");
  }
}

- (void)_update
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self, "initialQuestion"));
  v4 = objc_msgSend(v3, "_isRecursivelyComplete");

  if (self->_canCreateSubmittableProblem != v4)
  {
    self->_canCreateSubmittableProblem = v4;
    -[RAPReport _invokeChangeHandlers](self, "_invokeChangeHandlers");
  }
}

- (id)newFeedbackRequestParameters
{
  id v3;
  id v4;
  void *v5;

  v3 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  v4 = objc_alloc_init((Class)GEORPFeedbackSubmissionParameters);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self, "initialQuestion"));
  objc_msgSend(v5, "_fillSubmissionParameters:", v4);

  objc_msgSend(v3, "setSubmissionParameters:", v4);
  return v3;
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = objc_msgSend(v6, "copy");
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v10, v11);

}

- (void)removeObserver:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
}

- (void)_invokeChangeHandlers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_observers, "keyEnumerator", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8));
        ((void (**)(_QWORD, RAPReport *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_mapContext
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self, "initialQuestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_alternateMapViewContext"));

  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
  return v4;
}

- (id)_placeContext
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self, "initialQuestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_alternatePlaceContext"));

  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
  return v4;
}

- (id)_directionsRecording
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self, "initialQuestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_alternateDirectionsRecording"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directionsRecording"));

  }
  return v4;
}

- (id)_auxiliaryControlsRecording
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self, "initialQuestion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_alternateAuxiliaryControlsRecording"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentlyConnectedAuxiliaryControls"));

  }
  return v4;
}

- (id)_navigationSettings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id BOOL;
  id v10;
  unsigned int v11;
  _QWORD *v12;
  id Integer;
  void *v14;

  v2 = (void *)objc_opt_new(GEORPNavigationSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v2, "setDistanceUnits:", 0);
  if (qword_1014D2E30 != -1)
    dispatch_once(&qword_1014D2E30, &stru_1011C0428);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2E28, "path"));
  v5 = (void *)_CFPreferencesCopyAppValueWithContainer(CFSTR("NavVolumeSettingPauseSpokenAudio"), CFSTR("com.apple.Maps"), v4);

  v6 = NavigationConfig_SpokenGuidancePauseSpokenAudio[1];
  if (v5)
  {
    if ((_GEOConfigHasValue(NavigationConfig_SpokenGuidancePauseSpokenAudio[0], v6) & 1) == 0)
    {
      v7 = objc_msgSend(v5, "BOOLValue");
      GEOConfigSetBOOL(NavigationConfig_SpokenGuidancePauseSpokenAudio[0], NavigationConfig_SpokenGuidancePauseSpokenAudio[1], v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
    _CFPreferencesSetValueWithContainer(CFSTR("NavVolumeSettingPauseSpokenAudio"), 0, CFSTR("com.apple.Maps"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost, objc_msgSend(v8, "homeDirectory"));

    BOOL = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    BOOL = (id)GEOConfigGetBOOL(NavigationConfig_SpokenGuidancePauseSpokenAudio[0], v6);
  }
  v10 = BOOL;

  objc_msgSend(v2, "setPauseSpokenAudio:", v10);
  v11 = objc_msgSend(v3, "effectiveTransportType");
  if (v11)
  {
    if (v11 == 3)
    {
      v12 = NavigationConfig_SpokenGuidanceLevel_Cycling;
    }
    else
    {
      if (v11 != 2)
      {
        Integer = 0;
        goto LABEL_16;
      }
      v12 = NavigationConfig_SpokenGuidanceLevel_Walking;
    }
  }
  else
  {
    v12 = NavigationConfig_SpokenGuidanceLevel_Driving;
  }
  Integer = (id)GEOConfigGetInteger(*v12, v12[1]);
LABEL_16:
  objc_msgSend(v2, "setMuteSpeechOverride:", objc_msgSend(v3, "voiceGuidanceLevel") != Integer);
  objc_msgSend(v2, "setSpeechEnabled:", 1);
  objc_msgSend(v2, "setMaxAlternateRouteCount:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentVoiceLanguage"));
  objc_msgSend(v2, "setVoiceLanguage:", v14);

  objc_msgSend(v2, "setUserPreferredTransportType:", GEOGetUserPreferredTransportType(objc_msgSend(v2, "setShouldUseGuidanceEventManager:", 1)));
  return v2;
}

- (void)_prepareRequestParametersForSubmission:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  RAPPhoto *v38;
  id v39;
  void *v40;
  id v41;
  RAPPhoto *v42;
  RAPPhotoWithMetadata *v43;
  double v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commonContext"));

  if (!v6)
  {
    v6 = (void *)objc_opt_new(GEORPFeedbackCommonContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
    objc_msgSend(v7, "setCommonContext:", v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedUserPath"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](self, "combinedUserPath"));
  v10 = v9;
  if (v8)
  {
    v11 = objc_msgSend(v9, "nativePathsCount");

    if (v11)
    {
      v12 = 0;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](self, "combinedUserPath"));
        v14 = objc_msgSend(v13, "nativePathAtIndex:", v12);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedUserPath"));
        objc_msgSend(v15, "addNativePath:", v14);

        ++v12;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](self, "combinedUserPath"));
        v17 = objc_msgSend(v16, "nativePathsCount");

      }
      while (v12 < (unint64_t)v17);
    }
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport combinedUserPath](self, "combinedUserPath", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "webPaths"));

    v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v83 != v21)
            objc_enumerationMutation(v10);
          v23 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedUserPath"));
          objc_msgSend(v24, "addWebPath:", v23);

        }
        v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
      }
      while (v20);
    }
  }
  else
  {
    objc_msgSend(v6, "setCombinedUserPath:", v9);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  objc_msgSend(v6, "setDeviceGmtOffset:", objc_msgSend(v25, "secondsFromGMT"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "reportedPlace"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "mapItem"));
  v29 = objc_msgSend(v28, "_isMapItemTypeBrand");

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "commonContext"));
    objc_msgSend(v31, "setPinType:", 8);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _auxiliaryControlsRecording](self, "_auxiliaryControlsRecording"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "auxiliaryControls"));
  v34 = objc_msgSend(v33, "mutableCopy");
  objc_msgSend(v6, "setAuxiliaryControls:", v34);

  if (objc_msgSend(v32, "hasOriginatingAuxiliaryControlIndex"))
    objc_msgSend(v6, "setOriginatingAuxiliaryControlIndex:", objc_msgSend(v32, "originatingAuxiliaryControlIndex"));
  v35 = objc_alloc_init((Class)GEORPMapLocation);
  objc_msgSend(v6, "setMapLocation:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _mapContext](self, "_mapContext"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mapSnapshotImageData"));

  if (v37)
  {
    v38 = [RAPPhoto alloc];
    v39 = objc_alloc((Class)UIImage);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mapSnapshotImageData"));
    v41 = objc_msgSend(v39, "initWithData:", v40);
    v42 = -[RAPPhoto initWithPhoto:date:location:](v38, "initWithPhoto:date:location:", v41, 0, 0);

    v43 = -[RAPPhotoWithMetadata initWithRAPPhoto:photoType:]([RAPPhotoWithMetadata alloc], "initWithRAPPhoto:photoType:", v42, 0);
    -[RAPReport addPhotoWithMetadata:](self, "addPhotoWithMetadata:", v43);

  }
  -[RAPQuestion _prepareForSubmission](self->_initialQuestion, "_prepareForSubmission");
  objc_msgSend(v36, "mapZoomLevel");
  *(float *)&v44 = v44;
  objc_msgSend(v35, "setZoomLevel:", v44);
  v45 = objc_msgSend(v36, "mapType");
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mapRegion"));
  objc_msgSend(v35, "_setMapType:region:", v45, v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mapVisibleTileSets"));
  v48 = objc_msgSend(v47, "mutableCopy");
  objc_msgSend(v6, "setVisibleTileSets:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _navigationSettings](self, "_navigationSettings"));
  objc_msgSend(v6, "setNavigationSettings:", v49);

  objc_msgSend(v6, "setClientCreatedAt:", CFAbsoluteTimeGetCurrent());
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "reportedPlace"));

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "reportedPlace"));
    v54 = (unint64_t)objc_msgSend(v53, "source");

    if (v54 <= 9)
      objc_msgSend(v6, "setPinType:", dword_100E39D78[v54]);
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "reportedPlace"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "mapItem"));
  v58 = objc_msgSend(v57, "_isMapItemTypeBrand");

  if (v58)
    objc_msgSend(v6, "setPinType:", 8);
  if (objc_msgSend(v6, "pinType") == 6)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "reportedPlace"));

    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceInfo"));

      if (!v61)
      {
        v62 = objc_alloc_init((Class)GEORPSourceInfo);
        objc_msgSend(v6, "setSourceInfo:", v62);

      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "reportedPlace"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "sourceApplication"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceInfo"));
      objc_msgSend(v66, "setSourceApplication:", v65);

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "reportedPlace"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "sourceURL"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sourceInfo"));
      objc_msgSend(v70, "setSourceUrl:", v69);

    }
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
  objc_msgSend(v6, "setIsSprMap:", objc_msgSend(v71, "isSprMap"));

  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "commonContext"));
  v74 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "searchCommon"));

  if (!v74)
  {
    v74 = objc_alloc_init((Class)GEORPSearchCommonContext);
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "commonContext"));
    objc_msgSend(v76, "setSearchCommon:", v74);

  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "currentSearchString"));
  objc_msgSend(v74, "setLastSearchString:", v78);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "currentUserTypedSearchString"));
  objc_msgSend(v74, "setLastUserTypedSearchString:", v80);

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
  objc_msgSend(v81, "setFeedbackType");

}

- (id)devicePushToken
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1006B82B0;
  v15 = sub_1006B82C0;
  v16 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPushDaemonRemoteProxy sharedInstance](MSPMapsPushDaemonRemoteProxy, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006B82C8;
  v8[3] = &unk_1011BFAB8;
  v10 = &v11;
  v4 = v2;
  v9 = v4;
  objc_msgSend(v3, "fetchDevicePushToken:", v8);

  v5 = dispatch_time(0, 1000000000);
  v6 = 0;
  if (!dispatch_semaphore_wait(v4, v5))
    v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)submitWithPrivacyRequestHandler:(id)a3 willStartSubmitting:(id)a4 didFinishSubmitting:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  unsigned __int8 v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[5];
  _QWORD *v16;
  id v17;
  _QWORD *v18;
  unsigned __int8 v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RAPReport updateIfNeeded](self, "updateIfNeeded");
  -[RAPReport _shouldEnableCommunityID](self, "_shouldEnableCommunityID");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1006B84D0;
  v24[3] = &unk_1011AC860;
  v24[4] = self;
  v11 = objc_retainBlock(v24);
  if (-[RAPReport canCreateSubmittableProblem](self, "canCreateSubmittableProblem"))
  {
    v12 = +[RAPPrivacy hasReceivedPrivacyConsent](RAPPrivacy, "hasReceivedPrivacyConsent");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1006B84D8;
    v20[3] = &unk_1011C0390;
    v20[4] = self;
    v21 = v9;
    v13 = v11;
    v22 = v13;
    v23 = v10;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1006B8D78;
    v15[3] = &unk_1011C03B8;
    v15[4] = self;
    v16 = objc_retainBlock(v20);
    v19 = v12;
    v17 = v8;
    v18 = v13;
    v14 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

  }
  else
  {
    ((void (*)(_QWORD *))v11[2])(v11);
  }

}

- (BOOL)_shouldEnableCommunityID
{
  int IsEnabled_RAPCommunityID;
  void *v4;
  unsigned __int8 v5;

  IsEnabled_RAPCommunityID = MapsFeature_IsEnabled_RAPCommunityID(self, a2);
  if (IsEnabled_RAPCommunityID)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self, "initialQuestion"));
    v5 = objc_msgSend(v4, "isAnonymous");

    LOBYTE(IsEnabled_RAPCommunityID) = v5;
  }
  return IsEnabled_RAPCommunityID;
}

- (void)_buildUserInfoWithRequestParams:(id)a3 CompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  RAPReport *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[RAPReport _shouldEnableCommunityID](self, "_shouldEnableCommunityID"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ServerEvaluationStatusMapsSync shared](_TtC4Maps30ServerEvaluationStatusMapsSync, "shared"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1006B9094;
    v14[3] = &unk_1011C0408;
    v15 = v6;
    v16 = self;
    v17 = v7;
    objc_msgSend(v8, "fetchRAPStatusWithCompletion:", v14);

  }
  else
  {
    if ((sub_1003DF9A0() & 1) != 0)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport devicePushToken](self, "devicePushToken"));
      if (sub_100434624(CFSTR("RAPContactBackByEmailPreference")) == (id)1)
      {
        v12 = sub_1003DDA94();
        v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
      }
      else
      {
        v10 = 0;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport preferredEmailAddress](self, "preferredEmailAddress"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPFeedbackUserInfo userCredentialsForContactBackEmailAddress:userEnteredEmailAddress:pushToken:](GEORPFeedbackUserInfo, "userCredentialsForContactBackEmailAddress:userEnteredEmailAddress:pushToken:", v10, v13, v9));

    }
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

  }
}

- (id)_buildRequestParamsWithError:(id *)a3
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t Log;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint8_t buf[8];

  v5 = -[RAPReport newFeedbackRequestParameters](self, "newFeedbackRequestParameters");
  if (sub_1003E14E0())
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submissionParameters"));
    v7 = objc_msgSend(v6, "isPersonalizedMapsFeedback");

    if (v7)
    {
      v8 = sub_1003E1848();
      if (!(_DWORD)v8)
      {
        v9 = GEOErrorDomain(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v27 = kCFErrorDebugDescriptionKey;
        v11 = CFSTR("Cannot submit personalized Maps RAP due to privacy");
LABEL_19:
        *(_QWORD *)buf = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v27, 1));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, -10, v24));

        v21 = v25;
LABEL_20:
        v22 = 0;
        *a3 = v21;
        goto LABEL_21;
      }
      goto LABEL_13;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submissionParameters"));
  if (objc_msgSend(v12, "isDirectionsFeedback"))
  {
    v13 = sub_1003E0740();

    if (v13)
    {
      v14 = sub_1003E1848();
      if (!(_DWORD)v14)
      {
        v15 = GEOErrorDomain(v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v27 = kCFErrorDebugDescriptionKey;
        v11 = CFSTR("Cannot submit directions RAP due to privacy");
        goto LABEL_19;
      }
LABEL_13:
      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsRAP");
      v20 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "RAP suppressed without user-visible error (invalid request)", buf, 2u);
      }

      v21 = 0;
      goto LABEL_20;
    }
  }
  else
  {

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submissionParameters"));
  if (objc_msgSend(v16, "isTransitFeedback"))
  {
    v17 = sub_1003E1178();

    if (v17)
    {
      v18 = sub_1003E1848();
      if (!(_DWORD)v18)
      {
        v23 = GEOErrorDomain(v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v27 = kCFErrorDebugDescriptionKey;
        v11 = CFSTR("Cannot submit transit RAP due to privacy");
        goto LABEL_19;
      }
      goto LABEL_13;
    }
  }
  else
  {

  }
  -[RAPReport _prepareRequestParametersForSubmission:](self, "_prepareRequestParametersForSubmission:", v5);
  v22 = v5;
LABEL_21:

  return v22;
}

- (id)_saveRAPInfoToMapsSyncWithRequestParams:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  RapUserProfileRecord *v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
  v6 = objc_msgSend(v5, "type");

  v7 = 0;
  v8 = v6;
  v9 = 0;
  v10 = 0;
  switch(v8)
  {
    case 0u:
    case 1u:
    case 5u:
    case 6u:
    case 7u:
    case 0xBu:
    case 0xEu:
    case 0xFu:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self, "_context"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reportedPlace"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geoMapItem"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v14));
      goto LABEL_3;
    case 2u:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "details"));
      v17 = objc_msgSend(v16, "hasPoiFeedback");

      if (!v17)
        goto LABEL_19;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "details"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "poiFeedback"));
      goto LABEL_16;
    case 3u:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "details"));
      v23 = objc_msgSend(v22, "hasTransitPoiFeedback");

      if (!v23)
        goto LABEL_19;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "details"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "transitPoiFeedback"));
      goto LABEL_16;
    case 4u:
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "details"));
      v26 = objc_msgSend(v25, "hasAddressPointFeedback");

      if (!v26)
        goto LABEL_19;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "details"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "addressPointFeedback"));
      goto LABEL_16;
    case 8u:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _directionsRecording](self, "_directionsRecording"));
      goto LABEL_20;
    case 9u:
      goto LABEL_22;
    case 0xAu:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "details"));
      v29 = objc_msgSend(v28, "hasPoiEnrichmentUpdate");

      if (!v29)
        goto LABEL_19;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "details"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "poiEnrichmentUpdate"));
      goto LABEL_16;
    case 0xCu:
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "details"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "curatedCollectionFeedback"));
      v45 = objc_msgSend(v44, "hasCuratedCollectionContext");

      if (!v45)
        goto LABEL_19;
      v46 = objc_alloc((Class)MKMapItemIdentifier);
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "details"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "curatedCollectionFeedback"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "curatedCollectionContext"));
      v51 = objc_msgSend(v50, "curatedCollectionMuid");
      v52 = objc_msgSend(v46, "initWithMUID:resultProviderID:coordinate:", v51, 0, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v52));
      v7 = 0;
      goto LABEL_21;
    case 0xDu:
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "details"));
      v32 = objc_msgSend(v31, "hasPoiImageFeedback");

      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "details"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "poiImageFeedback"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "poiImageContext"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "place"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "geoMapItem"));

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v38));
LABEL_3:
        v7 = 0;
        v9 = 0;
      }
      else
      {
LABEL_19:
        v7 = 0;
LABEL_20:
        v9 = 0;
LABEL_21:
        v10 = 0;
      }
LABEL_22:
      v53 = objc_alloc_init(RapUserProfileRecord);
      -[RapUserProfileRecord setMapItemStorage:](v53, "setMapItemStorage:", v10);
      -[RapUserProfileRecord setCuratedCollectionIdentifier:](v53, "setCuratedCollectionIdentifier:", v9);
      -[RapUserProfileRecord setDirections:](v53, "setDirections:", v7);
      -[RapUserProfileRecord setMuninViewState:](v53, "setMuninViewState:", 0);

      return v53;
    case 0x10u:
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submissionParameters"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "details"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localityFeedback"));
LABEL_16:
      v39 = v20;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "place"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "geoMapItem"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v41));
      goto LABEL_3;
    default:
      v9 = 0;
      v10 = 0;
      goto LABEL_22;
  }
}

- (void)_anonymizePhotos:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  -[RAPReport removePhotosOfType:](self, "removePhotosOfType:", 1);
  -[RAPReport removePhotosOfType:](self, "removePhotosOfType:", 4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directionsFeedback"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsCorrections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instructionCorrections"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "setPhotoId:", 0);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_anonymizeScreenshots:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  -[RAPReport removePhotosOfType:](self, "removePhotosOfType:", 0);
  -[RAPReport removePhotosOfType:](self, "removePhotosOfType:", 5);
  -[RAPReport removePhotosOfType:](self, "removePhotosOfType:", 2);
  -[RAPReport removePhotosOfType:](self, "removePhotosOfType:", 3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directionsFeedback"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsCorrections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instructionCorrections"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "setRouteStepScreenshotImageId:", 0);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_anonymizeLocations:(id)a3 traits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSMutableArray *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSMutableArray *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSMutableArray *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "clearSessionId");
  objc_msgSend(v6, "clearLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "details"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionsFeedback"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "directionsContext"));

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionsWaypointPlaceInfos"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v81;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v81 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)v14), "clearLocations");
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    }
    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionsRequests"));
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = objc_opt_new(NSMutableArray);
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionsRequests"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v77;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v77 != v21)
            objc_enumerationMutation(v18);
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v22), "copy");
          objc_msgSend(v23, "clearLocations");
          objc_msgSend(v23, "setRequestTime:", 0.0);
          -[NSMutableArray addObject:](v17, "addObject:", v23);

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
      }
      while (v20);
    }

    objc_msgSend(v9, "setDirectionsRequests:", v17);
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionsResponses"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v73;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v73 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)v28), "clearLocations");
        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    }
    while (v26);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startWaypoint"));
  objc_msgSend(v29, "setOrigin:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startWaypoint"));
  objc_msgSend(v30, "setAutocompleteEntry:", 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startWaypoint"));
  objc_msgSend(v31, "setSearchString:", 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endWaypoint"));
  objc_msgSend(v32, "setOrigin:", 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endWaypoint"));
  objc_msgSend(v33, "setAutocompleteEntry:", 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endWaypoint"));
  objc_msgSend(v34, "setSearchString:", 0);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "details"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "transitPoiFeedback"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "directionsRequests"));
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    v39 = objc_opt_new(NSMutableArray);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "directionsRequests"));
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v69;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v69 != v43)
            objc_enumerationMutation(v40);
          v45 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v44), "copy");
          objc_msgSend(v45, "clearLocations");
          objc_msgSend(v45, "setRequestTime:", 0.0);
          -[NSMutableArray addObject:](v39, "addObject:", v45);

          v44 = (char *)v44 + 1;
        }
        while (v42 != v44);
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
      }
      while (v42);
    }

    objc_msgSend(v36, "setDirectionsRequests:", v39);
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "directionsResponses"));
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v65;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v65 != v49)
          objc_enumerationMutation(v46);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v50), "clearLocations");
        v50 = (char *)v50 + 1;
      }
      while (v48 != v50);
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
    }
    while (v48);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commonContext"));
  if (objc_msgSend(v51, "pinType") == 4)
    objc_msgSend(v51, "setPinType:", 2);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v52 = self->_photosWithMetadata;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v61;
    do
    {
      v56 = 0;
      do
      {
        if (*(_QWORD *)v61 != v55)
          objc_enumerationMutation(v52);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v56), "anonymizeLocation");
        v56 = (char *)v56 + 1;
      }
      while (v54 != v56);
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
    }
    while (v54);
  }

  if (objc_msgSend(v5, "isPersonalizedMapsFeedback"))
  {
    objc_msgSend(v51, "clearUserPaths");
    objc_msgSend(v51, "addUserPath:", 1);
    objc_msgSend(v51, "addUserPath:", 7);
    objc_msgSend(v51, "addUserPath:", 10);
    objc_msgSend(v51, "addUserPath:", 10);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "details"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "addressPointFeedback"));
    objc_msgSend(v58, "setPersonalizedMaps:", 0);

  }
}

- (void)_anonymizeDirectionsRequestsAndResponsesIfNeeded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *k;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSMutableArray *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *m;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "details"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directionsFeedback"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directionsContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsRequests"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    if (sub_1003E0AA8())
    {
      objc_msgSend(v6, "setDirectionsRequests:", 0);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsWaypointPlaceInfos"));
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v49 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "setPlaceRequest:", 0);
          }
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        }
        while (v11);
      }
    }
    else
    {
      v9 = objc_opt_new(NSMutableArray);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsRequests"));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(_QWORD *)v45 != v17)
              objc_enumerationMutation(v14);
            v19 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j), "copy");
            if ((sub_1003DF630() & 1) == 0)
              objc_msgSend(v19, "clearDeviceHistoricalLocations");
            objc_msgSend(v19, "clearSessionId");
            -[NSMutableArray addObject:](v9, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        }
        while (v16);
      }

      objc_msgSend(v6, "setDirectionsRequests:", v9);
    }

  }
  if (sub_1003E0E10())
  {
    objc_msgSend(v6, "setDirectionsResponses:", 0);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "directionsWaypointPlaceInfos"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v41;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)k), "setPlaceResponse:", 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      }
      while (v22);
    }

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "details"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "transitPoiFeedback"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "directionsRequests"));
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    if (sub_1003E0AA8())
    {
      objc_msgSend(v26, "setDirectionsRequests:", 0);
    }
    else
    {
      v29 = objc_opt_new(NSMutableArray);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "directionsRequests", 0));
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v37;
        do
        {
          for (m = 0; m != v32; m = (char *)m + 1)
          {
            if (*(_QWORD *)v37 != v33)
              objc_enumerationMutation(v30);
            v35 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)m), "copy");
            if ((sub_1003DF630() & 1) == 0)
              objc_msgSend(v35, "clearDeviceHistoricalLocations");
            objc_msgSend(v35, "clearSessionId");
            -[NSMutableArray addObject:](v29, "addObject:", v35);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        }
        while (v32);
      }

      objc_msgSend(v26, "setDirectionsRequests:", v29);
    }
  }
  if (sub_1003E0E10())
    objc_msgSend(v26, "setDirectionsResponses:", 0);

}

- (GEORPUserPath)combinedUserPath
{
  GEORPUserPath *combinedUserPath;
  GEORPUserPath *v4;
  GEORPUserPath *v5;

  combinedUserPath = self->_combinedUserPath;
  if (!combinedUserPath)
  {
    v4 = (GEORPUserPath *)objc_alloc_init((Class)GEORPUserPath);
    v5 = self->_combinedUserPath;
    self->_combinedUserPath = v4;

    combinedUserPath = self->_combinedUserPath;
  }
  return combinedUserPath;
}

- (RAPQuestion)initialQuestion
{
  return self->_initialQuestion;
}

- (RAPAppStateProtocol)_context
{
  return self->_context;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCombinedUserPath:(id)a3
{
  objc_storeStrong((id *)&self->_combinedUserPath, a3);
}

- (NSString)preferredEmailAddress
{
  return self->_preferredEmailAddress;
}

- (void)setPreferredEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)previousFeedbackID
{
  return self->_previousFeedbackID;
}

- (void)setPreviousFeedbackID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousFeedbackID, 0);
  objc_storeStrong((id *)&self->_preferredEmailAddress, 0);
  objc_storeStrong((id *)&self->_combinedUserPath, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_initialQuestion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_reportContext, 0);
  objc_storeStrong((id *)&self->_photosWithMetadata, 0);
}

@end
