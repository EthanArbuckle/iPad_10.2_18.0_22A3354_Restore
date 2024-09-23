@implementation MFBayAdoption

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100149368;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA078 != -1)
    dispatch_once(&qword_1005AA078, block);
  return (OS_os_log *)(id)qword_1005AA070;
}

+ (id)openMessageInNewWindowActionWithMessage:(id)a3 messageList:(id)a4 preparation:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100149520;
  v15[3] = &unk_100520738;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v9 = v19;
  v10 = v17;
  v11 = v16;
  v12 = v18;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindowSceneActivationAction actionWithIdentifier:alternateAction:configurationProvider:](UIWindowSceneActivationAction, "actionWithIdentifier:alternateAction:configurationProvider:", 0, 0, v15));

  return v13;
}

+ (void)openComposeWithContext:(id)a3 presentationSource:(id)a4 requestingScene:(id)a5
{
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "composeWindowSceneActivationConfigurationWithContext:presentationSource:requestingScene:", a3, v8, a5));
  v10 = objc_opt_respondsToSelector(v8, "mui_setAsTargetedSourceOnSceneConfiguration:");
  if ((v8 == 0) | v10 & 1)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MFBayAdoption log](MFBayAdoption, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Open compose from presentation source: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MFBayAdoption log](MFBayAdoption, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100393A04((uint64_t)v8, v11, v12);
  }

  if ((v10 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v13, "_requestSceneSessionActivationWithConfiguration:errorHandler:", v9, &stru_100520758);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userActivity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "options"));
    objc_msgSend(v13, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v14, v15, &stru_100520778);

  }
}

+ (id)composeWindowSceneActivationConfigurationWithContext:(id)a3 presentationSource:(id)a4 requestingScene:(id)a5
{
  id v5;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc((Class)NSUserActivity);
  v12 = objc_msgSend(v11, "initWithActivityType:", MSMailActivityHandoffTypeComposeWithStreams);
  v13 = objc_alloc((Class)NSMutableDictionary);
  v29 = MSMailActivityHandoffTypeKey;
  v30 = MSMailActivityHandoffTypeComposeSansStreams;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v15 = objc_msgSend(v13, "initWithDictionary:", v14);

  v16 = (unint64_t)objc_msgSend(v8, "composeType");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "autosaveIdentifier"));
  if (v8)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "compositionValues"));
    v28 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v28));
    v5 = v28;

    if (!v19)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[MFBayAdoption log](MFBayAdoption, "log"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100393AF0((uint64_t)v5, v20, v21);

    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, MSMailActivityHandoffComposeKeyCompositionValues);

  }
  if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 2 && v17)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, MSMailActivityHandoffComposeKeyAutosaveID);
  objc_msgSend(v12, "setUserInfo:", v15);
  v22 = v17;
  if (!v17)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  }
  v23 = MSMailComposeWindowTargetContentIdentifierWithIdentifier(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v12, "setTargetContentIdentifier:", v24);

  if (!v17)
  {

  }
  v25 = objc_alloc_init((Class)UIWindowSceneActivationRequestOptions);
  objc_msgSend(v25, "setRequestingScene:", v10);
  objc_msgSend(v25, "setPreferredPresentationStyle:", 2);
  v26 = objc_msgSend(objc_alloc((Class)UIWindowSceneActivationConfiguration), "initWithUserActivity:", v12);
  objc_msgSend(v9, "mui_setAsTargetedSourceOnSceneConfiguration:", v26);
  objc_msgSend(v26, "setOptions:", v25);

  return v26;
}

+ (id)openMessageInNewWindowConfigurationWithMessageListItem:(id)a3 messageList:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[24];

  v5 = a3;
  v6 = a4;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100149F54;
  v22 = &unk_1005207A0;
  v7 = v5;
  v23 = v7;
  v8 = v6;
  v24 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState stateWithBuilder:](ConversationViewRestorationState, "stateWithBuilder:", &v19));
  if (v9)
  {
    v10 = objc_alloc((Class)NSUserActivity);
    v11 = MSMailActivityHandoffTypeDisplayMessage;
    v12 = objc_msgSend(v10, "initWithActivityType:", MSMailActivityHandoffTypeDisplayMessage, v19, v20, v21, v22, v23);
    v26[0] = v11;
    v25[0] = MSMailActivityHandoffTypeKey;
    v25[1] = MSMailActivityHandoffDisplayMessageKeyRestorationState;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryRepresentation"));
    v26[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    -[NSObject setUserInfo:](v12, "setUserInfo:", v14);

    v15 = objc_msgSend(objc_alloc((Class)UIWindowSceneActivationConfiguration), "initWithUserActivity:", v12);
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[MFBayAdoption log](MFBayAdoption, "log", v19, v20, v21, v22, v23));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_publicDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
      sub_100393B5C(v16, v17, buf, v12);
    }
    v15 = 0;
  }

  return v15;
}

+ (void)requestShelfPresentationForSceneWithIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = NSClassFromString(CFSTR("SBSApplicationMultiwindowService"));
  if (v3)
  {
    v4 = objc_alloc_init(v3);
    if ((objc_opt_respondsToSelector(v4, "requestShelfPresentationForSceneWithIdentifier:") & 1) != 0
      && (objc_opt_respondsToSelector(v4, "invalidate") & 1) != 0)
    {
      objc_msgSend(v4, "requestShelfPresentationForSceneWithIdentifier:", v5);
      objc_msgSend(v4, "invalidate");
    }

  }
}

+ (void)migrateDockedDrafts:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id obj;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  void *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v17 = v7;
    v8 = dispatch_group_create();
    v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = SBSCreateOpenApplicationService();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storedUserActivity"));
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10014A35C;
          v23[3] = &unk_10051D830;
          v24 = v9;
          v25 = v14;
          v26 = v8;
          sub_10014A388((uint64_t)a1, v15, v19, v23);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10014A418;
    block[3] = &unk_10051E618;
    v21 = v9;
    v22 = v17;
    v16 = v9;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    v7 = v17;
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

+ (void)migrateQuickReplyDraft:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = SBSCreateOpenApplicationService();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10014AE30;
  v11[3] = &unk_10051C658;
  v10 = v7;
  v12 = v10;
  sub_10014A554((uint64_t)a1, v6, v9, 0, v11);

}

@end
