@implementation ICCheckCoreSpotlightClientStateLaunchTask

- (void)runLaunchTask
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  void *v22;

  if (!ICUseCoreDataCoreSpotlightIntegration(self))
  {
    v3 = kICReindexOnLaunchKey;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", kICReindexOnLaunchKey));
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) != 0)
      return;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", kICSpotlightClientStateDataKey));
    v7 = os_log_create("com.apple.notes", "LaunchTask");
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Client State from defaults: %@", buf, 0xCu);
      }

      if (!*((_BYTE *)v18 + 24))
      {
        v9 = dispatch_semaphore_create(0);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchableIndex"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10010CB60;
        v13[3] = &unk_1005552D0;
        v16 = &v17;
        v14 = v6;
        v12 = v9;
        v15 = v12;
        objc_msgSend(v11, "fetchLastClientStateWithCompletionHandler:", v13);

        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        if (!*((_BYTE *)v18 + 24))
          goto LABEL_16;
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No client state found from defaults.", buf, 2u);
      }

      *((_BYTE *)v18 + 24) = 1;
    }
    +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", &__kCFBooleanTrue, v3);
LABEL_16:

    _Block_object_dispose(&v17, 8);
    return;
  }
  v2 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_10040C200(v2);

}

@end
