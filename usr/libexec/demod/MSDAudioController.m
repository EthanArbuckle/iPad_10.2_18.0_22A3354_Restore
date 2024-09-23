@implementation MSDAudioController

+ (id)sharedInstance
{
  if (qword_100175168 != -1)
    dispatch_once(&qword_100175168, &stru_10013D888);
  return (id)qword_100175160;
}

- (BOOL)setVolumeTo:(float)a3 forCategory:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController _NSStringFromVolumeCategory:](self, "_NSStringFromVolumeCategory:", a4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController avSystemController](self, "avSystemController"));
    objc_sync_enter(v7);
    -[MSDAudioController _initializeAVSystemControllerIfNeeded](self, "_initializeAVSystemControllerIfNeeded");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController avSystemController](self, "avSystemController"));
    *(float *)&v9 = a3;
    v10 = objc_msgSend(v8, "setVolumeTo:forCategory:mode:", v6, 0, v9);

    if ((v10 & 1) == 0)
    {
      v11 = sub_1000604F0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1000B74F0((uint64_t)v6, v12, a3);

    }
    objc_sync_exit(v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (float)getVolumeForCategory:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  float v11;
  float v13;

  v13 = 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController _NSStringFromVolumeCategory:](self, "_NSStringFromVolumeCategory:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController avSystemController](self, "avSystemController"));
    objc_sync_enter(v5);
    -[MSDAudioController _initializeAVSystemControllerIfNeeded](self, "_initializeAVSystemControllerIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController avSystemController](self, "avSystemController"));
    v7 = objc_msgSend(v6, "getVolume:forCategory:mode:", &v13, v4, 0);

    if ((v7 & 1) == 0)
    {
      v8 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000B7574((uint64_t)v4, v9, v10);

    }
    objc_sync_exit(v5);

    if (v7)
      v11 = v13;
    else
      v11 = -1.0;
  }
  else
  {
    v11 = -1.0;
  }

  return v11;
}

- (BOOL)addRouteToSystemMusicForSpeaker
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  CFTypeRef v11;
  unsigned int (*v12)(CFTypeRef, void *, void *);
  BOOL v13;
  id v14;
  NSObject *v15;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[16];
  CFTypeRef cf;
  uint64_t v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController _findRouteDescriptorWithUID:](self, "_findRouteDescriptorWithUID:", CFSTR("Speaker")));
  if (!v3)
  {
    v13 = 0;
    goto LABEL_15;
  }
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  v22 = kFigRoutingContextSelectRouteOptionKey_ClientRouteRequestID;
  v23 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  cf = 0;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Adding route for system music to speaker...", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000693C;
  v18[3] = &unk_10013D8B0;
  v10 = v4;
  v19 = v10;
  -[MSDAudioController _monitorRouteConfigUpdateForUUID:withCallback:](self, "_monitorRouteConfigUpdateForUUID:withCallback:", v6, v18);
  if (FigRoutingContextRemoteCopySystemMusicContext(kCFAllocatorDefault, 0, &cf))
  {
    v17 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000B7640();
    goto LABEL_11;
  }
  v11 = cf;
  v12 = *(unsigned int (**)(CFTypeRef, void *, void *))(*(_QWORD *)(CMBaseObjectGetVTable(cf) + 16) + 16);
  if (!v12 || v12(v11, v3, v7))
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000B75E0();
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v13 = 1;
LABEL_12:
  if (cf)
    CFRelease(cf);

LABEL_15:
  return v13;
}

- (BOOL)removeRouteToSystemMusicForSpeaker
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  CFTypeRef v11;
  unsigned int (*v12)(CFTypeRef, void *, void *);
  BOOL v13;
  id v14;
  NSObject *v15;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[16];
  CFTypeRef cf;
  uint64_t v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController _findRouteDescriptorWithUID:](self, "_findRouteDescriptorWithUID:", CFSTR("Speaker")));
  if (!v3)
  {
    v13 = 1;
    goto LABEL_15;
  }
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  v22 = kFigRoutingContextSelectRouteOptionKey_ClientRouteRequestID;
  v23 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  cf = 0;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Removing route for system music to speaker...", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006C08;
  v18[3] = &unk_10013D8B0;
  v10 = v4;
  v19 = v10;
  -[MSDAudioController _monitorRouteConfigUpdateForUUID:withCallback:](self, "_monitorRouteConfigUpdateForUUID:withCallback:", v6, v18);
  if (FigRoutingContextRemoteCopySystemMusicContext(kCFAllocatorDefault, 0, &cf))
  {
    v17 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000B7640();
    goto LABEL_11;
  }
  v11 = cf;
  v12 = *(unsigned int (**)(CFTypeRef, void *, void *))(*(_QWORD *)(CMBaseObjectGetVTable(cf) + 16) + 104);
  if (!v12 || v12(v11, v3, v7))
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000B76A0();
LABEL_11:

    v13 = 0;
    goto LABEL_12;
  }
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v13 = 1;
LABEL_12:
  if (cf)
    CFRelease(cf);

LABEL_15:
  return v13;
}

- (void)_initializeAVSystemControllerIfNeeded
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  uint8_t buf[16];
  uint64_t v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController avSystemController](self, "avSystemController"));

  if (!v3)
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Initializing AVSystemController!", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    -[MSDAudioController setAvSystemController:](self, "setAvSystemController:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController avSystemController](self, "avSystemController"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController avSystemController](self, "avSystemController"));
      v25 = AVSystemController_ServerConnectionDiedNotification;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
      v23 = 0;
      v10 = objc_msgSend(v8, "setAttribute:forKey:error:", v9, AVSystemController_SubscribeToNotificationsAttribute, &v23);
      v11 = v23;

      if ((v10 & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v12, "addObserver:selector:name:object:", self, "_handleAVSystemControllerDiedNotification:", AVSystemController_ServerConnectionDiedNotification, 0);

      }
      else
      {
        v21 = sub_1000604F0();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_1000B7730(v11, v22);

      }
    }
    else
    {
      v13 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000B7700(v11, v14, v15, v16, v17, v18, v19, v20);
    }

  }
}

- (id)_NSStringFromVolumeCategory:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("PhoneCall");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 3)
    return CFSTR("Audio/Video");
  else
    return (id)v3;
}

- (id)_findRouteDescriptorWithUID:(id)a3
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  CFTypeRef v13;
  unsigned int (*v14)(CFTypeRef, _QWORD, _QWORD);
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  CFTypeRef v40;
  unsigned int (*v41)(CFTypeRef, uint64_t, _QWORD);
  id v42;
  void *v43;
  id v44;
  id v46;
  void **v47;
  uint64_t v48;
  id (*v49)(uint64_t);
  void *v50;
  id v51;
  CFTypeRef cf;
  uint64_t v53;
  _UNKNOWN **v54;
  uint8_t buf[4];
  NSObject *v56;

  v4 = a3;
  cf = 0;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Searching for route with UID: %{public}@", buf, 0xCu);
  }

  v53 = kFigRouteDiscovererCreationOption_DiscovererType;
  v54 = &off_10014D6D0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
  if (FigRouteDiscovererXPCRemoteCreate(kCFAllocatorDefault, v7, &cf))
  {
    v46 = sub_1000604F0();
    v37 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1000B787C();
    v12 = 0;
    v16 = 0;
    v11 = 0;
    goto LABEL_16;
  }
  v8 = objc_alloc_init((Class)NSCondition);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10 = kFigRouteDiscovererNotification_AvailableRoutesChanged;
  v47 = _NSConcreteStackBlock;
  v48 = 3221225472;
  v49 = sub_1000072EC;
  v50 = &unk_10013D8D8;
  v11 = v8;
  v51 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, 0, 0, &v47));

  v13 = cf;
  v14 = *(unsigned int (**)(CFTypeRef, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable(cf) + 8) + 56);
  if (!v14
    || (v15 = kFigRouteDiscovererProperty_DiscoveryMode,
        v14(v13, kFigRouteDiscovererProperty_DiscoveryMode, kFigRouteDiscovererDiscoveryMode_DetailedDiscovery)))
  {
    v36 = sub_1000604F0();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1000B77BC();
    v16 = 0;
LABEL_16:
    v17 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 3.0, v47, v48, v49, v50));
  objc_msgSend(v11, "lock");
  while (1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController _findRouteDescriptorWithRouteUID:usingRouteDiscoverer:](self, "_findRouteDescriptorWithRouteUID:usingRouteDiscoverer:", v4, cf));
    if (v17)
      break;
    if ((objc_msgSend(v11, "waitUntilDate:", v16) & 1) == 0)
    {
      v18 = sub_1000604F0();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1000B784C(v19, v20, v21, v22, v23, v24, v25, v26);

      objc_msgSend(v11, "unlock");
      v27 = sub_1000604F0();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1000B781C(v28, v29, v30, v31, v32, v33, v34, v35);
      goto LABEL_20;
    }
  }
  objc_msgSend(v11, "unlock");
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", kFigEndpointDescriptorKey_RouteName));
  v38 = sub_1000604F0();
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v28;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Found route with name: %{public}@", buf, 0xCu);
  }

LABEL_20:
  v40 = cf;
  v41 = *(unsigned int (**)(CFTypeRef, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable(cf) + 8) + 56);
  if (!v41 || v41(v40, v15, kFigRouteDiscovererDiscoveryMode_None))
  {
    v42 = sub_1000604F0();
    v37 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1000B77BC();
    goto LABEL_24;
  }
LABEL_25:
  if (cf)
    CFRelease(cf);
  if (v12)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v43, "removeObserver:", v12);

  }
  v44 = v17;

  return v44;
}

- (id)_findRouteDescriptorWithRouteUID:(id)a3 usingRouteDiscoverer:(OpaqueFigRouteDiscoverer *)a4
{
  id v5;
  unsigned int (*v6)(OpaqueFigRouteDiscoverer *, _QWORD, const CFAllocatorRef, id *);
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];

  v5 = a3;
  v23 = 0;
  v6 = *(unsigned int (**)(OpaqueFigRouteDiscoverer *, _QWORD, const CFAllocatorRef, id *))(*(_QWORD *)(CMBaseObjectGetVTable(a4) + 8) + 48);
  if (!v6 || v6(a4, kFigRouteDiscovererProperty_AvailableRouteDescriptors, kCFAllocatorDefault, &v23))
  {
    v16 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000B78DC();
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v23;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      v11 = kFigEndpointDescriptorKey_RouteUID;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11, (_QWORD)v19));
          v15 = v14;
          if (v14 && objc_msgSend(v14, "isEqualToString:", v5))
          {
            v17 = v13;

            goto LABEL_17;
          }

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
  v17 = 0;
LABEL_17:

  return v17;
}

- (void)_monitorRouteConfigUpdateForUUID:(id)a3 withCallback:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v8 = kFigRoutingContextNotification_RouteConfigUpdated;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007624;
    v10[3] = &unk_10013D900;
    v11 = v5;
    v12 = 0;
    v13 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, 0, 0, v10));

  }
}

- (void)_handleAVSystemControllerDiedNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAudioController avSystemController](self, "avSystemController"));
  objc_sync_enter(v5);
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDAudioController: AVSystemController died!", v9, 2u);
  }

  -[MSDAudioController setAvSystemController:](self, "setAvSystemController:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, AVSystemController_ServerConnectionDiedNotification, 0);

  objc_sync_exit(v5);
}

- (AVSystemController)avSystemController
{
  return self->_avSystemController;
}

- (void)setAvSystemController:(id)a3
{
  objc_storeStrong((id *)&self->_avSystemController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avSystemController, 0);
}

@end
