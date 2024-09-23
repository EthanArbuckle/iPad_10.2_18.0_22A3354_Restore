@implementation NFATLMobileSettings

+ (BOOL)findAID:(id)a3 filterType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  BOOL v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v6 = a3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getFilterWithType:", a4));
  v7 = v21;
  if (!objc_msgSend(v21, "count"))
    goto LABEL_14;
  if (a4 == 2)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v21;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v30 = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v12, 0, &v30));
          v14 = v30;
          v26 = 0;
          v27 = &v26;
          v28 = 0x2020000000;
          v29 = 0;
          v15 = objc_msgSend(v6, "length");
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_1001EA6B4;
          v25[3] = &unk_1002EAE48;
          v25[4] = &v26;
          objc_msgSend(v13, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, 0, v15, v25);
          v16 = *((_BYTE *)v27 + 24) == 0;
          _Block_object_dispose(&v26, 8);

          if (!v16)
          {

            v19 = 1;
            v7 = v21;
            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v9)
          continue;
        break;
      }
    }

    v7 = v21;
    goto LABEL_14;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001EA6D4;
  v22[3] = &unk_1002EAE70;
  v23 = v6;
  v24 = a4;
  v17 = objc_msgSend(v21, "indexOfObjectPassingTest:", v22);
  v7 = v21;
  v18 = objc_msgSend(v21, "count");

  if (v17 >= v18)
  {
LABEL_14:
    v19 = 0;
    goto LABEL_16;
  }
  v19 = 1;
LABEL_16:

  return v19;
}

+ (id)_getFilterWithType:(int64_t)a3
{
  NSObject *v6;
  _UNKNOWN **v7;
  uint64_t v8;
  float v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  float v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  float v26;
  _UNKNOWN **v27;
  void *v28;
  uint64_t v29;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *v31;
  _BOOL4 v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  objc_class *v37;
  int v38;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  _UNKNOWN **v44;
  uint64_t v45;
  const char *v46;
  const __CFString *v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  double v57;

  if ((objc_opt_respondsToSelector(AppletTranslator, "getNFCSettings") & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[AppletTranslator getNFCSettings](AppletTranslator, "getNFCSettings"));
    v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("Version")));
    if (v7
      && (v8 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      && (objc_msgSend(v7, "floatValue"), v9 >= 1.0))
    {
      v27 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("ISO7816_SELECT_BLACKLIST")));

      if (!v27)
      {
        v7 = 0;
        goto LABEL_16;
      }
      v7 = v27;
      v40 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v27, v40) & 1) != 0)
      {
        v27 = 0;
        switch(a3)
        {
          case 0:
            v41 = CFSTR("AID_FILTER_EXACT");
            goto LABEL_35;
          case 1:
            v41 = CFSTR("AID_FILTER_PREFIX");
            goto LABEL_35;
          case 2:
            v41 = CFSTR("AID_FILTER_REGEX");
LABEL_35:
            v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v41));
            goto LABEL_40;
          case 3:
            v43 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("ISO7816_SELECT_PACE_APP_LIST")));

            if (v43)
              v7 = (_UNKNOWN **)v43;
            else
              v7 = &off_100305F98;
            goto LABEL_41;
          case 4:
            v47 = CFSTR("F049442E43484E");
            v42 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
LABEL_40:
            v44 = (_UNKNOWN **)v42;

            v7 = v44;
            goto LABEL_41;
          case 5:
            goto LABEL_16;
          default:
LABEL_41:
            v45 = objc_opt_class(NSArray);
            if ((objc_opt_isKindOfClass(v7, v45) & 1) == 0)
              goto LABEL_15;
            v7 = v7;
            v27 = v7;
            break;
        }
        goto LABEL_16;
      }
    }
    else
    {
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v12 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        objc_msgSend(v7, "floatValue");
        v18 = 45;
        if (isMetaClass)
          v18 = 43;
        v12(3, "%c[%{public}s %{public}s]:%i Invalid config version: %f", v18, ClassName, Name, 88, v17);
      }
      v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v20 = NFSharedLogGetLogger(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = object_getClass(a1);
        if (class_isMetaClass(v22))
          v23 = 43;
        else
          v23 = 45;
        v24 = object_getClassName(a1);
        v25 = sel_getName(a2);
        objc_msgSend(v7, "floatValue");
        *(_DWORD *)buf = 67110146;
        v49 = v23;
        v50 = 2082;
        v51 = v24;
        v52 = 2082;
        v53 = v25;
        v54 = 1024;
        v55 = 88;
        v56 = 2048;
        v57 = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid config version: %f", buf, 0x2Cu);
      }

    }
LABEL_15:
    v27 = 0;
LABEL_16:

    goto LABEL_27;
  }
  v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v29 = NFLogGetLogger(v28);
  if (v29)
  {
    v30 = (void (*)(uint64_t, const char *, ...))v29;
    v31 = object_getClass(a1);
    v32 = class_isMetaClass(v31);
    v33 = object_getClassName(a1);
    v46 = sel_getName(a2);
    v34 = 45;
    if (v32)
      v34 = 43;
    v30(3, "%c[%{public}s %{public}s]:%i Unable to read NFC settings from ATL", v34, v33, v46, 78);
  }
  v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v36 = NFSharedLogGetLogger(v35);
  v6 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v37 = object_getClass(a1);
    if (class_isMetaClass(v37))
      v38 = 43;
    else
      v38 = 45;
    *(_DWORD *)buf = 67109890;
    v49 = v38;
    v50 = 2082;
    v51 = object_getClassName(a1);
    v52 = 2082;
    v53 = sel_getName(a2);
    v54 = 1024;
    v55 = 78;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unable to read NFC settings from ATL", buf, 0x22u);
  }
  v27 = 0;
LABEL_27:

  return v27;
}

@end
