@implementation TransparencyFollowup

+ (BOOL)isFollowupEnabled
{
  if (qword_1002A44B0 != -1)
    dispatch_once(&qword_1002A44B0, &stru_10023B610);
  return byte_1002A44A8;
}

+ (id)instance
{
  if (qword_1002A44C8 != -1)
    dispatch_once(&qword_1002A44C8, &stru_10023B670);
  return (id)qword_1002A44A0;
}

- (TransparencyFollowup)initWithAnalytics:(id)a3
{
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  id v23;
  TransparencyFollowup *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  objc_super v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t v35[128];
  __int128 buf;
  Class (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;

  v23 = a3;
  v30.receiver = self;
  v30.super_class = (Class)TransparencyFollowup;
  v24 = -[TransparencyFollowup init](&v30, "init");
  if (v24)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v4 = (void *)qword_1002A44D8;
    v34 = qword_1002A44D8;
    if (!qword_1002A44D8)
    {
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v37 = sub_10001B5A4;
      v38 = &unk_10023B958;
      v39 = &v31;
      sub_10001B5A4((uint64_t)&buf);
      v4 = (void *)v32[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v31, 8);
    v6 = objc_msgSend([v5 alloc], "initWithClientIdentifier:", CFSTR("com.apple.transparency.followupclient"));
    -[TransparencyFollowup setController:](v24, "setController:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[TransparencyFollowup setFollowUpItems:](v24, "setFollowUpItems:", v7);

    v8 = (uint64_t)v23;
    if (!v23)
      v8 = objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    v23 = (id)v8;
    -[TransparencyFollowup setLogger:](v24, "setLogger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup controller](v24, "controller"));
    v29 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pendingFollowUpItems:", &v29));
    v22 = v29;

    if (!v10 && v22)
    {
      if (qword_1002A44B8 != -1)
        dispatch_once(&qword_1002A44B8, &stru_10023B690);
      v11 = qword_1002A44C0;
      if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v22;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "failed to get pending follow up items: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("eventId")));

          if (v18)
          {
            v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v18);
            if (v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](v24, "followUpItems"));
              objc_msgSend(v20, "setObject:forKey:", v16, v19);

            }
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v13);
    }

    -[TransparencyFollowup startFollowupStatusSampler](v24, "startFollowupStatusSampler");
  }

  return v24;
}

- (id)detailsAction:(unint64_t)a3 eventId:(id)a4 infoLink:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY")));
  v11 = sub_10001858C();
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_VIEW_DETAILS_LABEL")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionWithLabel:url:", v12, v10));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("eventId"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("type"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_10025BDD0, CFSTR("action"));
  if (v8)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("infoLink"));
  objc_msgSend(v13, "setUserInfo:", v14);

  return v13;
}

- (id)settingsAction:(unint64_t)a3 eventId:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY")));
  v8 = sub_10001858C();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_VIEW_SETTINGS_LABEL")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionWithLabel:url:", v9, v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("eventId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("type"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", &off_10025BDE8, CFSTR("action"));
  objc_msgSend(v10, "setUserInfo:", v11);

  return v10;
}

- (id)ignoreAction
{
  id v3;
  void *v4;
  void *v5;

  v3 = sub_10001858C();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_CLEAR_WARNING_LABEL")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionWithLabel:url:", v4, 0));

  objc_msgSend(v5, "setUserInfo:", &off_10025C558);
  return v5;
}

- (id)notification:(id)a3 message:(id)a4 activateAction:(id)a5 clearAction:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v13 = (void *)qword_1002A44E8;
  v21 = qword_1002A44E8;
  if (!qword_1002A44E8)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001B6FC;
    v17[3] = &unk_10023B958;
    v17[4] = &v18;
    sub_10001B6FC((uint64_t)v17);
    v13 = (void *)v19[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v18, 8);
  v15 = objc_alloc_init(v14);
  objc_msgSend(v15, "setTitle:", v9);
  objc_msgSend(v15, "setActivateAction:", v11);
  objc_msgSend(v15, "setClearAction:", v12);
  objc_msgSend(v15, "setFirstNotificationDelay:", 0.0);
  objc_msgSend(v15, "setFrequency:", 0.0);
  objc_msgSend(v15, "setInformativeText:", v10);

  return v15;
}

- (id)createSelfFollowup:(id)a3 infoLink:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)sub_100018B18());
  objc_msgSend(v8, "setUniqueIdentifier:", CFSTR("com.apple.transparency.ValidateSelfFailed"));
  v9 = sub_100018BD0();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setGroupIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_ERROR_TITLE")));
  objc_msgSend(v8, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_SELF_ERROR")));
  objc_msgSend(v8, "setInformativeText:", v12);

  objc_msgSend(v8, "setDisplayStyle:", 0);
  objc_msgSend(v8, "setExtensionIdentifier:", CFSTR("com.apple.TransparencyUI.FollowUpExtension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup detailsAction:eventId:infoLink:](self, "detailsAction:eventId:infoLink:", 0, v7, v6));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup ignoreAction](self, "ignoreAction"));
  v20[0] = v13;
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v8, "setActions:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "informativeText"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup notification:message:activateAction:clearAction:](self, "notification:message:activateAction:clearAction:", v16, v17, v13, v14));

  objc_msgSend(v8, "setNotification:", v18);
  return v8;
}

- (id)createSMTFollowup:(id)a3 infoLink:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)sub_100018B18());
  objc_msgSend(v8, "setUniqueIdentifier:", CFSTR("com.apple.transparency.AuditFailure"));
  v9 = sub_100018BD0();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setGroupIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_ERROR_TITLE")));
  objc_msgSend(v8, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_DATA_ERROR")));
  objc_msgSend(v8, "setInformativeText:", v12);

  objc_msgSend(v8, "setDisplayStyle:", 0);
  objc_msgSend(v8, "setExtensionIdentifier:", CFSTR("com.apple.TransparencyUI.FollowUpExtension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup detailsAction:eventId:infoLink:](self, "detailsAction:eventId:infoLink:", 1, v7, v6));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup ignoreAction](self, "ignoreAction"));
  v20[0] = v13;
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v8, "setActions:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "informativeText"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup notification:message:activateAction:clearAction:](self, "notification:message:activateAction:clearAction:", v16, v17, v13, v14));

  objc_msgSend(v8, "setNotification:", v18);
  return v8;
}

- (id)createTreeRollFollowup:(id)a3 infoLink:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)sub_100018B18());
  objc_msgSend(v8, "setUniqueIdentifier:", CFSTR("com.apple.transparency.TreeRollDetected"));
  v9 = sub_100018BD0();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setGroupIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_RESET_TITLE")));
  objc_msgSend(v8, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_RESET")));
  objc_msgSend(v8, "setInformativeText:", v12);

  objc_msgSend(v8, "setDisplayStyle:", 0);
  objc_msgSend(v8, "setExtensionIdentifier:", CFSTR("com.apple.TransparencyUI.FollowUpExtension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup detailsAction:eventId:infoLink:](self, "detailsAction:eventId:infoLink:", 3, v7, v6));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup settingsAction:eventId:](self, "settingsAction:eventId:", 3, v7));
  v20[0] = v13;
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v8, "setActions:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "informativeText"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup notification:message:activateAction:clearAction:](self, "notification:message:activateAction:clearAction:", v16, v17, v13, v14));

  objc_msgSend(v8, "setNotification:", v18);
  return v8;
}

- (id)createTLTResetFollowup:(id)a3 infoLink:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)sub_100018B18());
  objc_msgSend(v8, "setUniqueIdentifier:", CFSTR("com.apple.transparency.TLTResetDetected"));
  v9 = sub_100018BD0();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setGroupIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_RESET_TITLE")));
  objc_msgSend(v8, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_RESET")));
  objc_msgSend(v8, "setInformativeText:", v12);

  objc_msgSend(v8, "setDisplayStyle:", 0);
  objc_msgSend(v8, "setExtensionIdentifier:", CFSTR("com.apple.TransparencyUI.FollowUpExtension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup detailsAction:eventId:infoLink:](self, "detailsAction:eventId:infoLink:", 5, v7, v6));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup ignoreAction](self, "ignoreAction"));
  v20[0] = v13;
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v8, "setActions:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "informativeText"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup notification:message:activateAction:clearAction:](self, "notification:message:activateAction:clearAction:", v16, v17, v13, v14));

  objc_msgSend(v8, "setNotification:", v18);
  return v8;
}

- (id)createDisableTransparencyFollowup:(id)a3 infoLink:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)sub_100018B18());
  objc_msgSend(v8, "setUniqueIdentifier:", CFSTR("com.apple.transparency.TreeRollDetected"));
  objc_msgSend(v8, "setUserInfo:", &off_10025C580);
  v9 = sub_100018BD0();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setGroupIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_IDS_DISABLE_TITLE")));
  objc_msgSend(v8, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_IDS_DISABLE")));
  objc_msgSend(v8, "setInformativeText:", v12);

  objc_msgSend(v8, "setDisplayStyle:", 0);
  objc_msgSend(v8, "setExtensionIdentifier:", CFSTR("com.apple.TransparencyUI.FollowUpExtension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup detailsAction:eventId:infoLink:](self, "detailsAction:eventId:infoLink:", 6, v7, v6));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup settingsAction:eventId:](self, "settingsAction:eventId:", 6, v7));
  v20[0] = v13;
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v8, "setActions:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "informativeText"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup notification:message:activateAction:clearAction:](self, "notification:message:activateAction:clearAction:", v16, v17, v13, v14));

  objc_msgSend(v8, "setNotification:", v18);
  return v8;
}

- (id)createOptOutFollowup:(id)a3 infoLink:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)sub_100018B18());
  objc_msgSend(v8, "setUniqueIdentifier:", CFSTR("com.apple.transparency.OptOut"));
  v9 = sub_100018BD0();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setGroupIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_DISABLED_TITLE")));
  objc_msgSend(v8, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup _localizedKTStringForKey:](self, "_localizedKTStringForKey:", CFSTR("KT_DISABLED")));
  objc_msgSend(v8, "setInformativeText:", v12);

  objc_msgSend(v8, "setDisplayStyle:", 0);
  objc_msgSend(v8, "setExtensionIdentifier:", CFSTR("com.apple.TransparencyUI.FollowUpExtension"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup detailsAction:eventId:infoLink:](self, "detailsAction:eventId:infoLink:", 4, v7, v6));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup ignoreAction](self, "ignoreAction"));
  v20[0] = v13;
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v8, "setActions:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "informativeText"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup notification:message:activateAction:clearAction:](self, "notification:message:activateAction:clearAction:", v16, v17, v13, v14));

  objc_msgSend(v8, "setNotification:", v18);
  return v8;
}

- (id)itemForType:(unint64_t)a3 eventId:(id)a4 infoLink:(id)a5
{
  id v8;
  id v9;
  TransparencyFollowup *v10;

  v8 = a4;
  v9 = a5;
  switch(a3)
  {
    case 0uLL:
      v10 = (TransparencyFollowup *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup createSelfFollowup:infoLink:](self, "createSelfFollowup:infoLink:", v8, v9));
      goto LABEL_9;
    case 1uLL:
      v10 = (TransparencyFollowup *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup createSMTFollowup:infoLink:](self, "createSMTFollowup:infoLink:", v8, v9));
      goto LABEL_9;
    case 2uLL:
      v10 = (TransparencyFollowup *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup createSTHFollowup:infoLink:](self, "createSTHFollowup:infoLink:", v8, v9));
      goto LABEL_9;
    case 3uLL:
      v10 = (TransparencyFollowup *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup createTreeRollFollowup:infoLink:](self, "createTreeRollFollowup:infoLink:", v8, v9));
      goto LABEL_9;
    case 4uLL:
      v10 = (TransparencyFollowup *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup createOptOutFollowup:infoLink:](self, "createOptOutFollowup:infoLink:", v8, v9));
      goto LABEL_9;
    case 5uLL:
      v10 = (TransparencyFollowup *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup createTLTResetFollowup:infoLink:](self, "createTLTResetFollowup:infoLink:", v8, v9));
      goto LABEL_9;
    case 6uLL:
      v10 = (TransparencyFollowup *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup createDisableTransparencyFollowup:infoLink:](self, "createDisableTransparencyFollowup:infoLink:", v8, v9));
LABEL_9:
      self = v10;
      break;
    default:
      break;
  }

  return self;
}

- (BOOL)postFollowup:(id)a3 type:(unint64_t)a4 eventId:(id)a5 errorCode:(int64_t)a6 optInState:(id)a7 infoLink:(id)a8 additionalInfo:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  const __CFString *v44;
  void *v45;
  uint8_t buf[4];
  unint64_t v47;
  __int16 v48;
  unint64_t v49;

  v41 = a3;
  v15 = a5;
  v16 = a7;
  v42 = a8;
  v17 = a9;
  if (qword_1002A44B8 != -1)
    dispatch_once(&qword_1002A44B8, &stru_10023B6B0);
  v18 = qword_1002A44C0;
  if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v47 = a4;
    v48 = 2112;
    v49 = (unint64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received a postFollowup call of type: %lu eventId: %@", buf, 0x16u);
  }
  if (v16)
  {
    if (objc_msgSend(v16, "state") && objc_msgSend(v16, "state") != (id)2)
    {
      if (v15)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup itemForType:eventId:infoLink:](self, "itemForType:eventId:infoLink:", a4, v15, v42));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, CFSTR("application"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v21, CFSTR("type"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v22, CFSTR("eventId"));

        objc_msgSend(v40, "addEntriesFromDictionary:", v17);
        objc_msgSend(v39, "setUserInfo:", v40);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
        objc_sync_enter(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v15));
        v26 = v25 == 0;

        if (v26)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
          objc_msgSend(v28, "setObject:forKey:", v39, v15);
        }
        else
        {
          if (qword_1002A44B8 != -1)
            dispatch_once(&qword_1002A44B8, &stru_10023B730);
          v27 = qword_1002A44C0;
          if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v47 = (unint64_t)v15;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "skipping follow up due to existing follow up for eventId %{public}@", buf, 0xCu);
          }
          v28 = v39;
          v39 = 0;
        }

        objc_sync_exit(v23);
        if (v39)
        {
          if (qword_1002A44B8 != -1)
            dispatch_once(&qword_1002A44B8, &stru_10023B750);
          v33 = qword_1002A44C0;
          if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v47 = (unint64_t)v15;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "posting follow up for eventId %{public}@", buf, 0xCu);
          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup controller](self, "controller"));
          v43 = 0;
          v35 = objc_msgSend(v34, "postFollowUpItem:error:", v39, &v43);
          v36 = v43;

          if ((v35 & 1) == 0)
          {
            if (qword_1002A44B8 != -1)
              dispatch_once(&qword_1002A44B8, &stru_10023B770);
            v37 = qword_1002A44C0;
            if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              v47 = a4;
              v48 = 2112;
              v49 = (unint64_t)v36;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "failed to post follow up type %lu: %@", buf, 0x16u);
            }
          }

        }
      }
      else
      {
        if (qword_1002A44B8 != -1)
          dispatch_once(&qword_1002A44B8, &stru_10023B710);
        v29 = qword_1002A44C0;
        if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "no eventId passed, not much we can do", buf, 2u);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup logger](self, "logger"));
        v44 = CFSTR("type");
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
        v45 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
        objc_msgSend(v30, "logHardFailureForEventNamed:withAttributes:", CFSTR("PostFollowUpMissEvent"), v32);

      }
    }
    else
    {
      if (qword_1002A44B8 != -1)
        dispatch_once(&qword_1002A44B8, &stru_10023B6F0);
      v19 = qword_1002A44C0;
      if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v47 = (unint64_t)v16;
        v48 = 2048;
        v49 = a4;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "opt-in state %@ follow up type %lu", buf, 0x16u);
      }
    }
  }
  else
  {
    if (qword_1002A44B8 != -1)
      dispatch_once(&qword_1002A44B8, &stru_10023B6D0);
    v20 = qword_1002A44C0;
    if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to post follow up due to missing optIn state", buf, 2u);
    }
    if (a10)
      *a10 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -178, CFSTR("failed to post follow up due to missing optIn state")));
  }

  return v16 != 0;
}

- (BOOL)clearAllFollowups:(id *)a3
{
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  id v14;

  if (qword_1002A44B8 != -1)
    dispatch_once(&qword_1002A44B8, &stru_10023B790);
  v5 = qword_1002A44C0;
  if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "clearing all Transparency followups", (uint8_t *)&v13, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup controller](self, "controller"));
  v7 = objc_msgSend(v6, "clearPendingFollowUpItems:", a3);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
    objc_msgSend(v9, "removeAllObjects");

    objc_sync_exit(v8);
  }
  else
  {
    if (qword_1002A44B8 != -1)
      dispatch_once(&qword_1002A44B8, &stru_10023B7B0);
    v10 = qword_1002A44C0;
    if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v11 = *a3;
      else
        v11 = 0;
      v13 = 138412290;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to clear Transparency followups: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  return v7;
}

- (BOOL)clearFollowupsByType:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id obj;
  char v27;
  id v29;
  id v31;
  uint64_t v32;
  TransparencyFollowup *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  void *v42;
  _BYTE v43[128];

  v29 = a3;
  v33 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
  objc_sync_enter(obj);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v7)
  {
    v32 = *(_QWORD *)v35;
    v27 = 1;
    v31 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v31);
        v9 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](v33, "followUpItems"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
          v13 = v12 == 0;

          if (!v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("application")));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type")));
            v17 = objc_msgSend(v16, "unsignedIntegerValue");

            if (v17 == (id)a4 && objc_msgSend(v15, "isEqualToString:", v29))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup controller](v33, "controller"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
              v42 = v19;
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
              v21 = objc_msgSend(v18, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v20, a5);

              if (v21)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](v33, "followUpItems"));
                objc_msgSend(v22, "removeObjectForKey:", v9);

              }
              else
              {
                if (qword_1002A44B8 != -1)
                  dispatch_once(&qword_1002A44B8, &stru_10023B7D0);
                v23 = qword_1002A44C0;
                if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
                {
                  v24 = a5;
                  if (a5)
                    v24 = *a5;
                  *(_DWORD *)buf = 138412546;
                  v39 = v9;
                  v40 = 2112;
                  v41 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to clear tree reset CFU for event id %@ with error: %@", buf, 0x16u);
                }
                v27 = 0;
              }
            }

          }
        }

        v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      v6 = v31;
      v7 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v7);
  }
  else
  {
    v27 = 1;
  }

  objc_sync_exit(obj);
  return v27 & 1;
}

- (BOOL)clearFollowup:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup controller](self, "controller"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
  v18 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v10 = objc_msgSend(v7, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v9, a4);

  if (v10)
  {
    v11 = objc_alloc((Class)NSUUID);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("eventId")));
    v14 = objc_msgSend(v11, "initWithUUIDString:", v13);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
      objc_sync_enter(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
      objc_msgSend(v16, "removeObjectForKey:", v14);

      objc_sync_exit(v15);
    }

  }
  return v10;
}

- (id)getPendingFollowups
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  objc_sync_exit(v3);
  return v5;
}

- (BOOL)clearFollowups:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id obj;
  id v21;
  char v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  void *v33;
  _BYTE v34[128];

  v5 = a3;
  if (v5)
  {
    v21 = v5;
    if (objc_msgSend(v5, "count"))
    {
      obj = (id)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
      objc_sync_enter(obj);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v23 = v21;
      v6 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v26;
        v22 = 1;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v26 != v7)
              objc_enumerationMutation(v23);
            v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems", obj));
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

            if (v11)
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup controller](self, "controller"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
              v33 = v13;
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
              v15 = objc_msgSend(v12, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v14, a4);

              if (v15)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
                objc_msgSend(v16, "removeObjectForKey:", v9);

              }
              else
              {
                if (qword_1002A44B8 != -1)
                  dispatch_once(&qword_1002A44B8, &stru_10023B7F0);
                v17 = qword_1002A44C0;
                if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
                {
                  v18 = a4;
                  if (a4)
                    v18 = *a4;
                  *(_DWORD *)buf = 138412546;
                  v30 = v9;
                  v31 = 2112;
                  v32 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to clear followup for event id %@ with error: %@", buf, 0x16u);
                }
                v22 = 0;
              }
            }

            v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        }
        while (v6);
      }
      else
      {
        v22 = 1;
      }

      objc_sync_exit(obj);
    }
    else
    {
      v22 = 1;
    }
    v5 = v21;
  }
  else
  {
    v22 = 1;
  }

  return v22 & 1;
}

- (id)_localizedKTStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  const __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  __CFString *v37;
  _BYTE v38[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/Transparency.framework")));
  v5 = v4;
  v6 = &unk_1002A4000;
  v7 = &unk_1002A4000;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizations"));
    if (v8)
    {
      v9 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), kCFPreferencesAnyApplication, CFSTR("mobile"), kCFPreferencesAnyHost);
      v11 = objc_opt_class(NSArray, v10);
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v8, v9));
        if (objc_msgSend(v12, "count"))
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v14)
          {
            v15 = v14;
            v29 = v8;
            v16 = *(_QWORD *)v31;
            while (2)
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(_QWORD *)v31 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(const __CFString **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
                v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:localization:", v3, 0, CFSTR("Localizable-NARWHAL"), v18));
                if (v19)
                {
                  v20 = (__CFString *)v19;
                  v6 = &unk_1002A4000;
                  if (qword_1002A44B8 != -1)
                    dispatch_once(&qword_1002A44B8, &stru_10023B830);
                  v8 = v29;
                  v7 = &unk_1002A4000;
                  v24 = qword_1002A44C0;
                  if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    v35 = v18;
                    v36 = 2114;
                    v37 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "followup localized string (%{public}@) = %{public}@", buf, 0x16u);
                  }
                  goto LABEL_46;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              if (v15)
                continue;
              break;
            }
            v20 = 0;
            v8 = v29;
            v7 = &unk_1002A4000;
            v6 = (_QWORD *)&unk_1002A4000;
          }
          else
          {
            v20 = 0;
          }
LABEL_46:

          if (v20)
            goto LABEL_47;
          goto LABEL_37;
        }
        if (qword_1002A44B8 != -1)
          dispatch_once(&qword_1002A44B8, &stru_10023B850);
        v25 = qword_1002A44C0;
        if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "failed to get preferred localizations", buf, 2u);
        }

      }
      else
      {
        if (qword_1002A44B8 != -1)
          dispatch_once(&qword_1002A44B8, &stru_10023B870);
        v23 = qword_1002A44C0;
        if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to get languages for the current user", buf, 2u);
        }
      }

    }
    else
    {
      if (qword_1002A44B8 != -1)
        dispatch_once(&qword_1002A44B8, &stru_10023B890);
      v22 = qword_1002A44C0;
      if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = CFSTR("/System/Library/PrivateFrameworks/Transparency.framework");
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to get localizations from the localization bundle (%{public}@)", buf, 0xCu);
      }
    }
LABEL_37:
    if (v6[151] != -1)
      dispatch_once(&qword_1002A44B8, &stru_10023B8B0);
    v26 = *((_QWORD *)v7 + 152);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to get localized string for the current user localization", buf, 2u);
    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v3, v3, CFSTR("Localizable-NARWHAL")));
    if (v6[151] != -1)
      dispatch_once(&qword_1002A44B8, &stru_10023B8D0);
    v27 = *((_QWORD *)v7 + 152);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "followup localized string = %{public}@", buf, 0xCu);
    }
LABEL_47:

    goto LABEL_48;
  }
  if (qword_1002A44B8 != -1)
    dispatch_once(&qword_1002A44B8, &stru_10023B810);
  v21 = qword_1002A44C0;
  if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v35 = CFSTR("/System/Library/PrivateFrameworks/Transparency.framework");
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to get the localization bundle (%{public}@)", buf, 0xCu);
  }
  v20 = (__CFString *)v3;
LABEL_48:

  return v20;
}

- (id)ktFollowupStatus
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  NSObject *v23;
  id obj;
  id v26;
  uint64_t v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (+[TransparencyFollowup isFollowupEnabled](TransparencyFollowup, "isFollowupEnabled"))
  {
    obj = (id)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
    objc_sync_enter(obj);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v5;
    v6 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v6)
    {
      v27 = *(_QWORD *)v31;
      do
      {
        v29 = v6;
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v26);
          v8 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup followUpItems](self, "followUpItems"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "notification"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "creationDate"));

            if (v12)
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[SFAnalytics fuzzyDaysSinceDate:](SFAnalytics, "fuzzyDaysSinceDate:", v12)));
            else
              v13 = 0;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ktcfu-%@-days"), v14));

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIdentifier"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ktcfu-%@-count"), v16));

            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v15));
            v19 = v18;
            if (!v18 || ((unint64_t)objc_msgSend(v18, "compare:", v13) & 0x8000000000000000) != 0)
              objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v17));
            v21 = (char *)objc_msgSend(v20, "integerValue");

            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21 + 1));
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, v17);

          }
        }
        v6 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v6);
    }

    objc_sync_exit(obj);
    if (qword_1002A44B8 != -1)
      dispatch_once(&qword_1002A44B8, &stru_10023B8F0);
    v23 = qword_1002A44C0;
    if (os_log_type_enabled((os_log_t)qword_1002A44C0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v2;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Analytics for KT CFUs are %@", buf, 0xCu);
    }
  }
  return v2;
}

- (void)startFollowupStatusSampler
{
  void *v3;
  double v4;
  _QWORD v5[4];
  id v6;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyFollowup logger](self, "logger"));
  v4 = SFAnalyticsSamplerIntervalOncePerReport;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B4F4;
  v5[3] = &unk_10023B918;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "addMultiSamplerForName:withTimeInterval:block:", CFSTR("transparencyFollowupStatus"), v5, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (FLFollowUpController)controller
{
  return (FLFollowUpController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)followUpItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFollowUpItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_followUpItems, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
