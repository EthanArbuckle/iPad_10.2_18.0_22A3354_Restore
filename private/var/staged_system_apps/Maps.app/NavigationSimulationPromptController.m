@implementation NavigationSimulationPromptController

+ (void)promptIfNeededForSimulationForRoute:(id)a3 navigationTracePlayback:(BOOL)a4 continueWithOptions:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  void (*v24)(_QWORD *, __int128 *, _QWORD);
  __int128 v25;
  _UNKNOWN **v26;
  uint64_t v27;
  void (*v28)(_QWORD *, __int128 *, _QWORD);
  __int128 v29;
  void *v30;
  unsigned int v31;
  _UNKNOWN **v32;
  void *v33;
  void *v34;
  void *v35;
  _UNKNOWN **v36;
  int v37;
  int BOOL;
  unsigned int v39;
  _QWORD *v40;
  _QWORD v41[4];
  id v42;
  _QWORD *v43;
  _BYTE *v44;
  uint64_t v45;
  unsigned __int8 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _BYTE buf[24];
  const char *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v6 = a4;
  v8 = a3;
  v40 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v39 = objc_msgSend(v9, "isInternalInstall");

  BOOL = GEOConfigGetBOOL(NavigationConfig_SimulationShouldShowPrompt[0], NavigationConfig_SimulationShouldShowPrompt[1]);
  v37 = GEOConfigGetBOOL(NavigationConfig_SimulationEnabled[0], NavigationConfig_SimulationEnabled[1]);
  v10 = sub_100432DFC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (v6)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v12;
    if (BOOL)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
    if (v37)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    v17 = v16;
    if (v39)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    v19 = v18;
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v54 = (const char *)v17;
    LOWORD(v55) = 2112;
    *(_QWORD *)((char *)&v55 + 2) = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "isNavigationTracePlayback=%@ showNavigationSimulationPrompt=%@ navigationSimulationEnabled=%@ isInternalInstall=%@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x5810000000;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = "";
  v58 = 0;
  +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions](StartNavigationDetailsBuilder, "defaultNavigationDetailsOptions");
  v20 = objc_msgSend(v8, "transportType") - 1;
  if (v20 > 5)
    v21 = 1;
  else
    v21 = qword_100E3F4E0[v20];
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeAttributes"));
  v23 = objc_msgSend(v22, "hasTimepoint");

  if (v6)
  {
    v24 = (void (*)(_QWORD *, __int128 *, _QWORD))v40[2];
    v25 = *(_OWORD *)(*(_QWORD *)&buf[8] + 48);
    v47 = *(_OWORD *)(*(_QWORD *)&buf[8] + 32);
    v48 = v25;
    v49 = *(_OWORD *)(*(_QWORD *)&buf[8] + 64);
    v50 = *(_QWORD *)(*(_QWORD *)&buf[8] + 80);
    v24(v40, &v47, 0);
  }
  else if ((v39 & BOOL) != 0)
  {
    v26 = &off_1012743B8;
    switch(v21)
    {
      case 1:
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        v31 = objc_msgSend(v30, "isCurrentlyConnectedToAnyCarScene");

        if (v31)
          v32 = &off_1012743E8;
        else
          v32 = &off_101274400;
        v26 = (_UNKNOWN **)objc_msgSend(v32, "mutableCopy");
        break;
      case 2:
      case 5:
        v26 = &off_1012743D0;
        break;
      case 3:
        break;
      default:
        v26 = (_UNKNOWN **)&__NSArray0__struct;
        break;
    }
    v51[0] = CFSTR("kMapsInterruptionActions");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "actionsForPromptOptions:", v26));
    v51[1] = CFSTR("kMapsInterruptionTitle");
    v52[0] = v33;
    v52[1] = CFSTR("Navigation Simulation");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51, 2));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100C4E444;
    v41[3] = &unk_1011EA000;
    v36 = v26;
    v42 = v36;
    v43 = v40;
    v44 = buf;
    v45 = v21;
    v46 = v23;
    objc_msgSend(v35, "interruptApplicationWithKind:userInfo:completionHandler:", 12, v34, v41);

  }
  else
  {
    v27 = *(_QWORD *)&buf[8];
    if (v37)
      *(_BYTE *)(*(_QWORD *)&buf[8] + 32) = 1;
    v28 = (void (*)(_QWORD *, __int128 *, _QWORD))v40[2];
    v29 = *(_OWORD *)(v27 + 48);
    v47 = *(_OWORD *)(v27 + 32);
    v48 = v29;
    v49 = *(_OWORD *)(v27 + 64);
    v50 = *(_QWORD *)(v27 + 80);
    v28(v40, &v47, 0);
  }
  _Block_object_dispose(buf, 8);

}

+ (id)actionsForPromptOptions:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = sub_100C4E5F0((__CFString *)objc_msgSend(v10, "unsignedIntegerValue", (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsInterruptionAction actionWithTitle:cancels:handler:](MapsInterruptionAction, "actionWithTitle:cancels:handler:", v12, objc_msgSend(v10, "unsignedIntegerValue") == 0, 0));
        -[NSMutableArray addObject:](v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

@end
