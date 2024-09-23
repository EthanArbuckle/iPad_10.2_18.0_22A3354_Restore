@implementation MapsEventRecorder

+ (id)initializeDefaultRecorderWithTapToRadar:(BOOL)a3 window:(id)a4
{
  void *v4;
  _BOOL8 v5;
  id v6;
  MapsEventRecorder *v7;
  void *v8;
  id v9;

  v4 = (void *)qword_1014D3080;
  if (!qword_1014D3080)
  {
    v5 = a3;
    v6 = a4;
    v7 = objc_alloc_init(MapsEventRecorder);
    v8 = (void *)qword_1014D3080;
    qword_1014D3080 = (uint64_t)v7;

    objc_msgSend((id)qword_1014D3080, "setCurrentElement:", 24);
    objc_msgSend((id)qword_1014D3080, "setCurrentPhase:", 3);
    objc_msgSend((id)qword_1014D3080, "setPreviousPhase:", 3);
    objc_msgSend(v6, "frame");
    objc_msgSend((id)qword_1014D3080, "setWindowFrame:");
    objc_msgSend((id)qword_1014D3080, "setWindow:", v6);

    v9 = objc_alloc_init((Class)NSDate);
    objc_msgSend((id)qword_1014D3080, "setStartDate:", v9);

    objc_msgSend((id)qword_1014D3080, "setRecording:", 0);
    objc_msgSend((id)qword_1014D3080, "setPreviousTouchCount:", 0);
    objc_msgSend((id)qword_1014D3080, "setTouchCount:", 0);
    objc_msgSend((id)qword_1014D3080, "setTapToRadarEnabled:", v5);
    if (qword_1014D3088 != -1)
      dispatch_once(&qword_1014D3088, &stru_1011C5780);
    v4 = (void *)qword_1014D3080;
  }
  return v4;
}

+ (id)defaultRecorder
{
  return (id)qword_1014D3080;
}

- (void)clearDefaultRecorder
{
  void *v2;

  v2 = (void *)qword_1014D3080;
  qword_1014D3080 = 0;

}

+ (BOOL)isRecording
{
  BOOL result;

  result = qword_1014D3080;
  if (qword_1014D3080)
    return objc_msgSend((id)qword_1014D3080, "recording");
  return result;
}

- (void)beginRecordingWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[MapsEventRecorder showLoadingIndicator](self, "showLoadingIndicator");
  v5 = objc_msgSend(sub_100750008(), "sharedRecorder");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007500C0;
  v8[3] = &unk_1011B7758;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "startRecordingWithHandler:", v8);

}

- (void)endRecordingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[MapsEventRecorder showLoadingIndicator](self, "showLoadingIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOEventRecorderInstrumentation defaultInstrumentation](GEOEventRecorderInstrumentation, "defaultInstrumentation"));
  objc_msgSend(v5, "captureUIEvent:", CFSTR("<<<<<<<< RECORDING END <<<<<<<<"));

  -[MapsEventRecorder setRecording:](self, "setRecording:", 0);
  v6 = objc_msgSend(sub_100750008(), "sharedRecorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100750224;
  v9[3] = &unk_1011C57A8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "stopRecordingWithHandler:", v9);

}

- (void)attachTapToRadarWithPaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MapsRadarDraft *v14;
  id v15;
  NSObject *v16;
  MapsEventRecorder *v17;
  MapsEventRecorder *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  __CFString *v32;
  _BYTE v33[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarFileAttachment attachmentWithFileName:fileURL:](MapsRadarFileAttachment, "attachmentWithFileName:fileURL:", v11, v12));
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v7);
  }

  v14 = objc_opt_new(MapsRadarDraft);
  -[MapsRadarDraft addAttachments:](v14, "addAttachments:", v4);
  v15 = sub_1004319DC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self;
    v18 = v17;
    if (!v17)
    {
      v24 = CFSTR("<nil>");
      goto LABEL_17;
    }
    v19 = (objc_class *)objc_opt_class(v17);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_15;
      }

    }
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_15:

LABEL_17:
    *(_DWORD *)buf = 138543362;
    v32 = v24;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR from event recorder", buf, 0xCu);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsRadarController sharedInstance](MapsRadarController, "sharedInstance"));
  objc_msgSend(v25, "launchTTRWithRadar:", v14);

}

- (void)saveVideoFileToPhotoLibraryWithPaths:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSString *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(NSString **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (-[NSString containsString:](v8, "containsString:", CFSTR(".mp4")))
          UISaveVideoAtPathToSavedPhotosAlbum(v8, 0, 0, 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)recordEvent:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[MapsEventRecorder recording](self, "recording"))
  {
    -[MapsEventRecorder setInfo:](self, "setInfo:", 0);
    -[MapsEventRecorder setPreviousPhase:](self, "setPreviousPhase:", -[MapsEventRecorder currentPhase](self, "currentPhase"));
    -[MapsEventRecorder setCurrentPhase:](self, "setCurrentPhase:", +[MapsEventRecorder phaseOfEvent:](MapsEventRecorder, "phaseOfEvent:", v8));
    -[MapsEventRecorder setPreviousTouchCount:](self, "setPreviousTouchCount:", -[MapsEventRecorder touchCount](self, "touchCount"));
    -[MapsEventRecorder setTouchCount:](self, "setTouchCount:", +[MapsEventRecorder numberOfTouchesInEvent:](MapsEventRecorder, "numberOfTouchesInEvent:", v8));
    -[MapsEventRecorder setPreviousElement:](self, "setPreviousElement:", -[MapsEventRecorder currentElement](self, "currentElement"));
    v4 = -[MapsEventRecorder elementTypeInEvent:](self, "elementTypeInEvent:", v8);
    if (v4 != 23)
      -[MapsEventRecorder setCurrentElement:](self, "setCurrentElement:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder logMessageForEvent:](self, "logMessageForEvent:", v8));
    v6 = v5;
    if (v5 && (objc_msgSend(v5, "isEqualToString:", &stru_1011EB268) & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOEventRecorderInstrumentation defaultInstrumentation](GEOEventRecorderInstrumentation, "defaultInstrumentation"));
      objc_msgSend(v7, "captureUIEvent:", v6);

    }
  }

}

+ (unint64_t)phaseOfEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allTouches"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (unint64_t)objc_msgSend(v5, "phase");
  if (v6 > 3)
    v7 = 3;
  else
    v7 = qword_100E3A358[v6];

  return v7;
}

- (id)logMessageForEvent:(id)a3
{
  __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  unint64_t v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;

  if ((id)-[MapsEventRecorder touchCount](self, "touchCount", a3) == (id)2
    && (id)-[MapsEventRecorder previousTouchCount](self, "previousTouchCount") == (id)1)
  {
    v4 = CFSTR("The user stopped panning and started zooming");
    return v4;
  }
  if ((id)-[MapsEventRecorder touchCount](self, "touchCount") == (id)1
    && (id)-[MapsEventRecorder previousTouchCount](self, "previousTouchCount") == (id)2)
  {
    v4 = CFSTR("The user stopped zooming and started panning");
    return v4;
  }
  if (-[MapsEventRecorder currentPhase](self, "currentPhase"))
  {
    if ((id)-[MapsEventRecorder currentPhase](self, "currentPhase") == (id)1)
    {
      if ((id)-[MapsEventRecorder previousPhase](self, "previousPhase") == (id)2
        && (id)-[MapsEventRecorder previousElement](self, "previousElement") == (id)13)
      {
        v5 = -[MapsEventRecorder touchCount](self, "touchCount");
        v6 = CFSTR("The user began panning");
        v7 = CFSTR("The user started zooming");
        goto LABEL_22;
      }
      goto LABEL_56;
    }
    if ((id)-[MapsEventRecorder currentPhase](self, "currentPhase") != (id)2)
      goto LABEL_56;
    v10 = -[MapsEventRecorder currentElement](self, "currentElement");
    if (v10 > 15)
    {
      if (v10 != 16)
      {
        if (v10 == 18)
        {
          v4 = CFSTR("The user tapped the compass");
          return v4;
        }
        goto LABEL_56;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The user cleared the text in the search bar that contained the text \"%@\"), v12);
    }
    else
    {
      if (v10 != 6)
      {
        if (v10 == 13)
        {
          v5 = -[MapsEventRecorder touchCount](self, "touchCount");
          v6 = CFSTR("The user began touching the map");
          v7 = CFSTR("The user began zooming the map");
LABEL_22:
          if (v5 == 2)
            v4 = (__CFString *)v7;
          else
            v4 = (__CFString *)v6;
          return v4;
        }
LABEL_56:
        v4 = &stru_1011EB268;
        return v4;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The user tapped the search bar that currently contains the text \"%@\"), v12);
    }
LABEL_58:
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);

    return v4;
  }
  if ((id)-[MapsEventRecorder previousPhase](self, "previousPhase") != (id)1
    || (id)-[MapsEventRecorder previousElement](self, "previousElement") != (id)13)
  {
    v4 = CFSTR("The user pressed the current location button");
    switch(-[MapsEventRecorder currentElement](self, "currentElement"))
    {
      case 0uLL:
        return v4;
      case 1uLL:
      case 2uLL:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));

        if (!v11)
          goto LABEL_56;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The user pressed a button called %@"), v12);
        goto LABEL_58;
      case 3uLL:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));

        if (!v14)
          goto LABEL_56;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The user selected option %@ on the segmented control"), v12);
        goto LABEL_58;
      case 4uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));

        if (!v15)
          goto LABEL_56;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The user tapped a UITableViewCell titled %@"), v12);
        goto LABEL_58;
      case 5uLL:
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));

        if (!v16)
          goto LABEL_56;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The user tapped a UISwitch to the %@ state"), v12);
        goto LABEL_58;
      case 7uLL:
        v4 = CFSTR("The user pressed the settings button");
        return v4;
      case 8uLL:
        v4 = CFSTR("The user tapped the share button");
        return v4;
      case 9uLL:
        v4 = CFSTR("The user tapped the route button");
        return v4;
      case 0xAuLL:
        v4 = CFSTR("The user tapped the route button on the pin");
        return v4;
      case 0xBuLL:
        v4 = CFSTR("The user changed the route mode");
        return v4;
      case 0xCuLL:
        v4 = CFSTR("The user tapped more info on the pinned location");
        return v4;
      case 0xDuLL:
        v4 = CFSTR("The user tapped the map");
        return v4;
      case 0xEuLL:
        v4 = CFSTR("The user tapped the details button for the route");
        return v4;
      case 0xFuLL:
        v4 = CFSTR("The user pressed the cancel button in the share menu");
        return v4;
      case 0x11uLL:
        v17 = objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
        if (!v17
          || (v18 = (void *)v17,
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info")),
              v20 = objc_msgSend(v19, "isEqualToString:", &stru_1011EB268),
              v19,
              v18,
              (v20 & 1) != 0))
        {
          v4 = CFSTR("The user tapped one of the category buttons");
          return v4;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The user tapped the %@ button"), v12);
        break;
      case 0x13uLL:
        v4 = CFSTR("The user pressed a route option");
        return v4;
      case 0x14uLL:
        v4 = CFSTR("The user pressed the call button");
        return v4;
      case 0x15uLL:
        v4 = CFSTR("The user pressed the address cell");
        return v4;
      case 0x16uLL:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));

        if (!v21)
          goto LABEL_56;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEventRecorder info](self, "info"));
        v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The user tapped a view titled label %@"), v12);
        goto LABEL_58;
      default:
        goto LABEL_56;
    }
    goto LABEL_58;
  }
  v8 = -[MapsEventRecorder touchCount](self, "touchCount");
  v9 = CFSTR("The user finished panning");
  if (v8 == 2)
    v9 = CFSTR("The user finished zooming");
  v4 = v9;
  return v4;
}

- (unint64_t)elementTypeInEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __objc2_class **v36;
  void *i;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __objc2_class **v42;
  id v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  void *v50;
  unsigned __int8 v51;
  uint64_t v52;
  id v53;
  id v54;
  void *j;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  const __CFString *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  void *k;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  void *m;
  void *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id obj;
  id obja;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  MapsEventRecorder *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allTouches"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  if (!objc_msgSend(v5, "count"))
  {
    v18 = 23;
    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
  v10 = (objc_class *)objc_opt_class(v7);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (objc_class *)objc_opt_class(v9);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_opt_class(MapsRecordAnIssuePanView);
  if ((objc_opt_isKindOfClass(v7, v16) & 1) == 0)
  {
    v17 = objc_opt_class(MapsRecordAnIssuePanView);
    if ((objc_opt_isKindOfClass(v8, v17) & 1) == 0)
    {
      v96 = self;
      v18 = 23;
      if (!v7 || !v12)
        goto LABEL_5;
      v20 = objc_opt_class(UITextField);
      if ((objc_opt_isKindOfClass(v7, v20) & 1) != 0)
      {
        v21 = v15;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
        -[MapsEventRecorder setInfo:](v96, "setInfo:", v22);

        v15 = v21;
        v18 = 6;
        goto LABEL_5;
      }
      v90 = v15;
      v23 = objc_opt_class(UISegmentedControl);
      if ((objc_opt_isKindOfClass(v7, v23) & 1) != 0)
      {
        v24 = v7;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleForSegmentAtIndex:", objc_msgSend(v24, "selectedSegmentIndex")));

        -[MapsEventRecorder setInfo:](v96, "setInfo:", v25);
        v18 = 3;
LABEL_70:
        v15 = v90;
        goto LABEL_5;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("UINavigationButton")))
      {
        v26 = v7;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "title"));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "title"));
          -[MapsEventRecorder setInfo:](v96, "setInfo:", v28);

          v18 = 2;
          goto LABEL_70;
        }

      }
      v29 = objc_opt_class(UIButton);
      v91 = v12;
      v87 = v8;
      if ((objc_opt_isKindOfClass(v7, v29) & 1) != 0)
      {
        v30 = v7;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "titleLabel"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "text"));

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "titleLabel"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "text"));
          -[MapsEventRecorder setInfo:](v96, "setInfo:", v34);

          v18 = 1;
          v15 = v90;
LABEL_36:

          goto LABEL_5;
        }
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v86 = v30;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "subviews"));
        v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
        if (v92)
        {
          v35 = *(_QWORD *)v110;
          v36 = off_101198000;
          while (2)
          {
            for (i = 0; i != v92; i = (char *)i + 1)
            {
              if (*(_QWORD *)v110 != v35)
                objc_enumerationMutation(obj);
              v38 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
              v39 = objc_opt_class(v36[74]);
              if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
              {
                v40 = v9;
                v41 = v35;
                v42 = v36;
                v43 = v38;
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "text"));

                if (v44)
                {
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "text"));
                  -[MapsEventRecorder setInfo:](v96, "setInfo:", v45);

                  v18 = 1;
                  v15 = v90;
                  v12 = v91;
                  v30 = v86;
                  v9 = v40;
                  goto LABEL_35;
                }

                v36 = v42;
                v35 = v41;
                v9 = v40;
                v8 = v87;
              }
            }
            v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
            if (v92)
              continue;
            break;
          }
        }

        v12 = v91;
        if ((objc_msgSend(v91, "isEqualToString:", CFSTR("ResizableButton")) & 1) != 0)
        {
          v18 = 7;
LABEL_33:
          v15 = v90;
          v30 = v86;
          goto LABEL_36;
        }
        v15 = v90;
        v30 = v86;
        if ((objc_msgSend(v91, "isEqualToString:", CFSTR("DismissSettingsView")) & 1) != 0)
        {
          v18 = 7;
          goto LABEL_36;
        }
        if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MapsUserTrackingButton")) & 1) != 0
          || (objc_msgSend(v91, "isEqualToString:", CFSTR("MapsUserTrackingRoundedButton")) & 1) != 0)
        {
          v18 = 0;
          goto LABEL_36;
        }
        if (objc_msgSend(v91, "isEqualToString:", CFSTR("MapsLargerHitTargetButton")))
        {
          v30 = v86;
          objc_msgSend(v86, "frame");
          v47 = v46;
          -[MapsEventRecorder windowFrame](v96, "windowFrame");
          if (v47 >= v48 * 0.5)
            v18 = 8;
          else
            v18 = 9;
          v15 = v90;
          v12 = v91;
          goto LABEL_36;
        }
        v49 = objc_opt_class(UITextField);
        if ((objc_opt_isKindOfClass(v8, v49) & 1) != 0)
        {
          v8 = v87;
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "text"));
          -[MapsEventRecorder setInfo:](v96, "setInfo:", v50);

          v18 = 16;
          v12 = v91;
          goto LABEL_33;
        }
        if (objc_msgSend(v90, "isEqualToString:", CFSTR("MKPlaceDirectionsCell")))
        {
          v18 = 19;
          v15 = v90;
          v12 = v91;
          v30 = v86;
LABEL_35:
          v8 = v87;
          goto LABEL_36;
        }
        v12 = v91;
        v51 = objc_msgSend(v91, "isEqualToString:", CFSTR("CNTransportButton"));

        v8 = v87;
        if ((v51 & 1) != 0)
        {
          v18 = 20;
          goto LABEL_70;
        }
      }
      v52 = objc_opt_class(UITableViewCell);
      if ((objc_opt_isKindOfClass(v8, v52) & 1) != 0)
      {
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews"));
        v53 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
        if (v53)
        {
          v54 = v53;
          v93 = *(id *)v106;
          while (2)
          {
            for (j = 0; j != v54; j = (char *)j + 1)
            {
              if (*(id *)v106 != v93)
                objc_enumerationMutation(obja);
              v56 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v56, "isMemberOfClass:", objc_opt_class(UILabel)))
              {
                v57 = v56;
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "text"));

                if (v58)
                {
                  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "text"));
                  v62 = objc_msgSend(v61, "copy");
                  -[MapsEventRecorder setInfo:](v96, "setInfo:", v62);

                  v18 = 4;
                  v15 = v90;
                  v12 = v91;
                  goto LABEL_5;
                }

                v12 = v91;
              }
            }
            v54 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
            if (v54)
              continue;
            break;
          }
        }

      }
      v59 = objc_opt_class(UISwitch);
      if ((objc_opt_isKindOfClass(v8, v59) & 1) == 0)
      {
        v15 = v90;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("_MKSmallCalloutPassthroughButton")) & 1) != 0)
        {
          v18 = 12;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("DirectionsCalloutButton")) & 1) != 0)
        {
          v18 = 10;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MKNewAnnotationContainerView")) & 1) != 0)
        {
          v18 = 13;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MKCompassView")) & 1) != 0)
        {
          v18 = 18;
        }
        else
        {
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("BrowseItemView")))
          {
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v94 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews"));
            v63 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
            if (v63)
            {
              v64 = v63;
              v65 = *(_QWORD *)v102;
              while (2)
              {
                for (k = 0; k != v64; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v102 != v65)
                    objc_enumerationMutation(v94);
                  v67 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)k);
                  v68 = objc_opt_class(UILabel);
                  if ((objc_opt_isKindOfClass(v67, v68) & 1) != 0)
                  {
                    v69 = v64;
                    v70 = v65;
                    v71 = v67;
                    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "text"));

                    if (v72)
                    {
                      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "text"));
                      -[MapsEventRecorder setInfo:](v96, "setInfo:", v84);

                      goto LABEL_106;
                    }

                    v65 = v70;
                    v64 = v69;
                  }
                }
                v64 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
                if (v64)
                  continue;
                break;
              }
            }
LABEL_106:

            v18 = 17;
          }
          else
          {
            v73 = objc_opt_class(UIView);
            if ((objc_opt_isKindOfClass(v7, v73) & 1) != 0)
            {
              v99 = 0u;
              v100 = 0u;
              v97 = 0u;
              v98 = 0u;
              v95 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews"));
              v74 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
              if (v74)
              {
                v75 = v74;
                v76 = *(_QWORD *)v98;
                while (2)
                {
                  for (m = 0; m != v75; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v98 != v76)
                      objc_enumerationMutation(v95);
                    v78 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)m);
                    v79 = objc_opt_class(UILabel);
                    if ((objc_opt_isKindOfClass(v78, v79) & 1) != 0)
                    {
                      v80 = v75;
                      v81 = v76;
                      v82 = v78;
                      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "text"));

                      if (v83)
                      {
                        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "text"));
                        -[MapsEventRecorder setInfo:](v96, "setInfo:", v85);

                        v18 = 22;
                        goto LABEL_108;
                      }

                      v76 = v81;
                      v75 = v80;
                    }
                  }
                  v75 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
                  if (v75)
                    continue;
                  break;
                }
              }

            }
            v18 = 24;
          }
LABEL_108:
          v15 = v90;
          v12 = v91;
          v8 = v87;
        }
        goto LABEL_5;
      }
      if (objc_msgSend(v7, "isOn"))
        v60 = CFSTR("on");
      else
        v60 = CFSTR("off");
      -[MapsEventRecorder setInfo:](v96, "setInfo:", v60);
      v18 = 5;
      goto LABEL_70;
    }
  }
  v18 = 24;
LABEL_5:

LABEL_7:
  return v18;
}

+ (unint64_t)numberOfTouchesInEvent:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allTouches"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5;
}

- (void)addNavigationBarView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007517D4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removeNavigationBarView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007519E0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)showLoadingIndicator
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100751B34;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideLoadingIndicator
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100751CB8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (unint64_t)currentElement
{
  return self->_currentElement;
}

- (void)setCurrentElement:(unint64_t)a3
{
  self->_currentElement = a3;
}

- (unint64_t)previousElement
{
  return self->_previousElement;
}

- (void)setPreviousElement:(unint64_t)a3
{
  self->_previousElement = a3;
}

- (unint64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(unint64_t)a3
{
  self->_currentPhase = a3;
}

- (unint64_t)previousPhase
{
  return self->_previousPhase;
}

- (void)setPreviousPhase:(unint64_t)a3
{
  self->_previousPhase = a3;
}

- (CGRect)windowFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_windowFrame.origin.x;
  y = self->_windowFrame.origin.y;
  width = self->_windowFrame.size.width;
  height = self->_windowFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setWindowFrame:(CGRect)a3
{
  self->_windowFrame = a3;
}

- (unint64_t)previousTouchCount
{
  return self->_previousTouchCount;
}

- (void)setPreviousTouchCount:(unint64_t)a3
{
  self->_previousTouchCount = a3;
}

- (unint64_t)touchCount
{
  return self->_touchCount;
}

- (void)setTouchCount:(unint64_t)a3
{
  self->_touchCount = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)tapToRadarEnabled
{
  return self->_tapToRadarEnabled;
}

- (void)setTapToRadarEnabled:(BOOL)a3
{
  self->_tapToRadarEnabled = a3;
}

- (NSString)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (NSString)eventLogFilePath
{
  return self->_eventLogFilePath;
}

- (void)setEventLogFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_eventLogFilePath, a3);
}

- (NSString)eventLogMoviePath
{
  return self->_eventLogMoviePath;
}

- (void)setEventLogMoviePath:(id)a3
{
  objc_storeStrong((id *)&self->_eventLogMoviePath, a3);
}

- (UIView)navigationBarView
{
  return self->_navigationBarView;
}

- (void)setNavigationBarView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarView, a3);
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_navigationBarView, 0);
  objc_storeStrong((id *)&self->_eventLogMoviePath, 0);
  objc_storeStrong((id *)&self->_eventLogFilePath, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_destroyWeak((id *)&self->_window);
}

@end
