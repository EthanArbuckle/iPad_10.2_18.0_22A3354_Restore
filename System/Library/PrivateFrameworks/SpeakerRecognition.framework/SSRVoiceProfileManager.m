@implementation SSRVoiceProfileManager

- (SSRVoiceProfileManager)init
{
  return -[SSRVoiceProfileManager initWithEndpointId:](self, "initWithEndpointId:", 0);
}

- (SSRVoiceProfileManager)initWithEndpointId:(id)a3
{
  id v4;
  SSRVoiceProfileManager *v5;
  void *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSUUID *endpointUUID;
  NSString *lastRepromptedDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSRVoiceProfileManager;
  v5 = -[SSRVoiceProfileManager init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentDeviceCategory = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v6);

    v7 = dispatch_queue_create("com.apple.cs.profileManager", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(v4, "copy");
    endpointUUID = v5->_endpointUUID;
    v5->_endpointUUID = (NSUUID *)v9;

    lastRepromptedDate = v5->_lastRepromptedDate;
    v5->_lastRepromptedDate = (NSString *)CFSTR("<unset>");

  }
  return v5;
}

- (id)getSATEnrollmentPath
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfileManager SSRSpeakerProfilesBasePath](self, "SSRSpeakerProfilesBasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

  v6 = 0;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDBCE30];
    -[SSRVoiceProfileManager SSRSpeakerProfilesBasePath](self, "SSRSpeakerProfilesBasePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)isSpeakerRecognitionAvailable
{
  return 1;
}

- (id)baseDir
{
  void *v2;
  void *v3;

  if (objc_msgSend(MEMORY[0x24BE28488], "isDarwinOS"))
  {
    objc_msgSend(CFSTR("/var/mobile"), "stringByAppendingPathComponent:", CFSTR("Library"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CPSharedResourcesDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Library"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)SSRSpeakerProfilesBasePath
{
  void *v2;
  void *v3;

  -[SSRVoiceProfileManager baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("VoiceTrigger/SAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)SSRBasePathForAppDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SSRVoiceProfileManager baseDir](self, "baseDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("VoiceTrigger/SAT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)modelDirectoryPathForProfile:(id)a3
{
  return (id)objc_msgSend(a3, "voiceProfileModelFilePathForRecognizerType:spIdType:", 2, 1);
}

- (void)discardSiriEnrollmentForLanguageCode:(id)a3
{
  id v3;

  v3 = -[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:](self, "discardSiriEnrollmentForProfileId:forLanguageCode:", 0, a3);
}

- (id)discardSiriEnrollmentForProfileId:(id)a3 forLanguageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  os_log_t *v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SSRVoiceProfileManager _getVoiceProfilesForSiriProfileId:withLanguageCode:](self, "_getVoiceProfilesForSiriProfileId:withLanguageCode:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v21 = v7;
  v22 = v6;
  if (!v8)
  {
    v19 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]";
      v30 = 2114;
      v31 = v6;
      v32 = 2114;
      v33 = v7;
      _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Profile not available for %{public}@ & %{public}@ - Bailing out", buf, 0x20u);
    }
    goto LABEL_15;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v7, v6);
  if (!v10)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v24;
  v14 = (os_log_t *)MEMORY[0x24BE284B8];
  do
  {
    for (i = 0; i != v11; ++i)
    {
      v16 = v12;
      if (*(_QWORD *)v24 != v13)
        objc_enumerationMutation(v9);
      v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      -[SSRVoiceProfileManager deleteUserVoiceProfile:](self, "deleteUserVoiceProfile:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v18 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v29 = "-[SSRVoiceProfileManager discardSiriEnrollmentForProfileId:forLanguageCode:]";
          v30 = 2114;
          v31 = v17;
          v32 = 2114;
          v33 = v12;
          _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete %{public}@ with error %{public}@", buf, 0x20u);
        }
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v11);
LABEL_16:

  return v12;
}

- (id)_getVoiceProfilesForSiriProfileId:(id)a3 withLanguageCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:](self, "provisionedVoiceProfilesForAppDomain:withLocale:", CFSTR("com.apple.siri"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if ((CSIsCommunalDevice() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v23 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v10)
        goto LABEL_14;
      v11 = v10;
      v12 = *(_QWORD *)v25;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v14, "siriProfileId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", v6))
          {

          }
          else
          {
            objc_msgSend(v14, "profileID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v6);

            if (!v17)
              continue;
          }
          objc_msgSend(v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (!v11)
        {
LABEL_14:

          if (objc_msgSend(v8, "count"))
            v18 = v8;
          else
            v18 = 0;
          v19 = v18;

          v7 = v23;
          goto LABEL_25;
        }
      }
    }
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v21 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[SSRVoiceProfileManager _getVoiceProfilesForSiriProfileId:withLanguageCode:]";
        v31 = 2114;
        v32 = v7;
        _os_log_error_impl(&dword_2117D4000, v21, OS_LOG_TYPE_ERROR, "%s ERR: More than one Siri Voice Profiles - %{public}@", buf, 0x16u);
      }
    }
    v19 = v7;
  }
  else
  {
    v20 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[SSRVoiceProfileManager _getVoiceProfilesForSiriProfileId:withLanguageCode:]";
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s ERR: No configured Siri Profiles", buf, 0xCu);
    }
    v19 = 0;
  }
LABEL_25:

  return v19;
}

- (id)newVoiceProfileWithLocale:(id)a3 withAppDomain:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SSRVoiceProfile initNewVoiceProfileWithLocale:withAppDomain:]([SSRVoiceProfile alloc], "initNewVoiceProfileWithLocale:withAppDomain:", v6, v5);

  return v7;
}

- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateVoiceProfile:withUserName:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addUtterances:(id)a3 toProfile:(id)a4 withContext:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  SSRVoiceProfileManager *v35;
  void (**v36)(id, void *);
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__6056;
  v42 = __Block_byref_object_dispose__6057;
  v43 = 0;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: profile is nil - Bailing out"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[SSRVoiceProfileManager addUtterances:toProfile:withContext:withCompletion:]";
      v52 = 2114;
      v53 = v20;
      _os_log_error_impl(&dword_2117D4000, v25, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!v13)
        goto LABEL_14;
    }
    else if (!v13)
    {
      goto LABEL_14;
    }
    v26 = (void *)MEMORY[0x24BDD1540];
    v48 = CFSTR("reason");
    v49 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 713, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v28);

    goto LABEL_14;
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Context is nil - Bailing out"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[SSRVoiceProfileManager addUtterances:toProfile:withContext:withCompletion:]";
      v52 = 2114;
      v53 = v20;
      _os_log_error_impl(&dword_2117D4000, v29, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!v13)
        goto LABEL_14;
    }
    else if (!v13)
    {
      goto LABEL_14;
    }
    v30 = (void *)MEMORY[0x24BDD1540];
    v46 = CFSTR("reason");
    v47 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 713, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v32);

    goto LABEL_14;
  }
  objc_msgSend(v11, "addUtterances:spIdType:", v10, objc_msgSend(v12, "spIdType"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v39[5];
  v39[5] = v15;

  if (!v39[5])
  {
    v39[5] = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __77__SSRVoiceProfileManager_addUtterances_toProfile_withContext_withCompletion___block_invoke;
    v33[3] = &unk_24CC85B18;
    v37 = &v38;
    v36 = v13;
    v34 = v11;
    v35 = self;
    objc_msgSend(v14, "addUserVoiceProfile:withContext:withCompletion:", v34, v12, v33);

    v20 = v36;
    goto LABEL_14;
  }
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "profileID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v39[5], "localizedDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("ERR: Failed to copy %@ to %@, error: %@"), v10, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "-[SSRVoiceProfileManager addUtterances:toProfile:withContext:withCompletion:]";
    v52 = 2114;
    v53 = v20;
    _os_log_error_impl(&dword_2117D4000, v21, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    if (!v13)
      goto LABEL_14;
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v22 = (void *)MEMORY[0x24BDD1540];
    v44 = CFSTR("reason");
    v45 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 721, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v24);

  }
LABEL_14:

  _Block_object_dispose(&v38, 8);
}

- (void)isImplicitTrainingRequiredForVoiceProfileId:(id)a3 locale:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __88__SSRVoiceProfileManager_isImplicitTrainingRequiredForVoiceProfileId_locale_completion___block_invoke;
  v23[3] = &unk_24CC85B40;
  v10 = v7;
  v24 = v10;
  v11 = v8;
  v25 = v11;
  v12 = v9;
  v26 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x212BE197C](v23);
  +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "installedAssetOfType:forLanguage:", 3, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", v10, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    && objc_msgSend(v15, "satImplicitTrainingEnabled")
    && v16
    && v17
    && (objc_msgSend(v17, "locale"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "isEqualToString:", v11),
        v18,
        v19))
  {
    objc_msgSend(v16, "isImplicitTrainingRequiredToVoiceProfile:withAsset:completion:", v17, v15, v13);
  }
  else
  {
    v20 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v17, "locale");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v28 = "-[SSRVoiceProfileManager isImplicitTrainingRequiredForVoiceProfileId:locale:completion:]";
      v29 = 2114;
      v30 = v15;
      v31 = 2114;
      v32 = v16;
      v33 = 2114;
      v34 = v17;
      v35 = 2114;
      v36 = v22;
      _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s Implicit training not needed since: asset(%{public}@), profileStore(%{public}@), profile(%{public}@), profile locale(%{public}@)", buf, 0x34u);

    }
    v13[2](v13, 0, 0);
  }

}

- (void)notifyImplicitTrainingUtteranceAvailable:(id)a3 forVoiceProfileId:(id)a4 withRecordDeviceInfo:(id)a5 withRecordCtxt:(id)a6 withVoiceTriggerCtxt:(id)a7 withOtherCtxt:(id)a8 assetToUse:(id)a9 withCompletion:(id)a10
{
  id v16;
  id v17;
  id v18;
  __CFString *v19;
  id v20;
  void (**v21)(_QWORD, _QWORD);
  os_log_t *v22;
  NSObject *v23;
  const __CFString *v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  void *v32;
  char v33;
  os_log_t v34;
  const char *v35;
  os_log_t v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  BOOL v51;
  void *v52;
  int v53;
  NSObject *queue;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  os_log_t v60;
  const char *v61;
  os_log_t v62;
  NSObject *v63;
  uint32_t v64;
  void *v65;
  int v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  uint64_t v79;
  id v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  id *v95;
  NSObject *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  __CFString *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  id v110;
  id v111;
  __CFString *v112;
  id v113;
  void (**v114)(_QWORD, _QWORD);
  _BYTE *v115;
  _BYTE *v116;
  _QWORD *v117;
  _QWORD v118[4];
  id v119[5];
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  _QWORD v126[5];
  id v127;
  _QWORD block[4];
  id v129;
  SSRVoiceProfileManager *v130;
  id v131;
  __CFString *v132;
  id v133;
  id v134;
  id v135;
  void (**v136)(_QWORD, _QWORD);
  _QWORD v137[4];
  __CFString *v138;
  id v139;
  _QWORD *v140;
  _QWORD v141[5];
  id v142;
  char v143;
  uint8_t v144[4];
  const char *v145;
  __int16 v146;
  id v147;
  __int16 v148;
  uint64_t v149;
  _BYTE v150[24];
  uint64_t (*v151)(uint64_t, uint64_t);
  void (*v152)(uint64_t);
  id v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  _BYTE buf[24];
  uint64_t (*v159)(uint64_t, uint64_t);
  void (*v160)(uint64_t);
  id v161;
  const __CFString *v162;
  _QWORD v163[4];

  v163[1] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v106 = a5;
  v107 = a6;
  v105 = a7;
  v104 = a8;
  v103 = a9;
  v18 = a10;
  v143 = 0;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x3032000000;
  v141[3] = __Block_byref_object_copy__6056;
  v141[4] = __Block_byref_object_dispose__6057;
  v142 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE28460]), "initWithDescription:", CFSTR("ImplicitTraining"));
  v137[0] = MEMORY[0x24BDAC760];
  v137[1] = 3221225472;
  v137[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke;
  v137[3] = &unk_24CC85B68;
  v19 = (__CFString *)v17;
  v138 = v19;
  v140 = v141;
  v20 = v18;
  v139 = v20;
  v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BE197C](v137);
  v22 = (os_log_t *)MEMORY[0x24BE284B8];
  v23 = (id)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    if (v19)
      v24 = v19;
    else
      v24 = CFSTR("primary");
    objc_msgSend(v106, "route");
    v25 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v107, "type");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordD"
                         "eviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 2114;
    v159 = v25;
    LOWORD(v160) = 1024;
    *(_DWORD *)((char *)&v160 + 2) = v26;
    _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Received implicit utterance for %{public}@ from %{public}@ with context %d", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "shouldDisableImplicitTraining");

  if (!v28)
  {
    if (!v16)
    {
      v36 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      v35 = "%s ERR: FilePath is nil - Bailing out";
      v37 = v36;
      v38 = 12;
LABEL_32:
      _os_log_error_impl(&dword_2117D4000, v37, OS_LOG_TYPE_ERROR, v35, buf, v38);
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "fileExistsAtPath:isDirectory:", v32, &v143);

    if ((v33 & 1) == 0)
    {
      v34 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      v35 = "%s ERR: Training utterance doesnt exist at %@ - Bailing out";
LABEL_31:
      v37 = v34;
      v38 = 22;
      goto LABEL_32;
    }
    if (v143)
    {
      v34 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      v35 = "%s ERR: Training utterance is marked as directory at %@ - Bailing out";
      goto LABEL_31;
    }
    if (!v105)
    {
      v29 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      v30 = "%s VoiceTriggerEventInfo is nil - Bailing out";
      goto LABEL_9;
    }
    v39 = *MEMORY[0x24BE28558];
    objc_msgSend(v105, "objectForKeyedSubscript:", *MEMORY[0x24BE28558]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40 == 0;

    if (v41)
    {
      v29 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      v30 = "%s kVTEILanguageCode is nil - Bailing out";
      goto LABEL_9;
    }
    objc_msgSend(v105, "objectForKeyedSubscript:", v39);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "objectForKeyedSubscript:", *MEMORY[0x24BE285D0]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42 == 0;

    if (v43)
    {
      v47 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      v48 = "%s ERR: trigger score not found in VTEI - Bailing out";
    }
    else
    {
      objc_msgSend(v105, "objectForKeyedSubscript:", *MEMORY[0x24BE28560]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("Siri"));

      if (v45)
      {
        v46 = *v22;
        if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withR"
                               "ecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
          _os_log_impl(&dword_2117D4000, v46, OS_LOG_TYPE_DEFAULT, "%s kVTEITriggeredPhrase is JS - Bailing out", buf, 0xCu);
        }
        goto LABEL_48;
      }
      v49 = *MEMORY[0x24BE285A0];
      objc_msgSend(v105, "objectForKeyedSubscript:", *MEMORY[0x24BE285A0]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v50 == 0;

      if (v51)
      {
        v53 = 0;
      }
      else
      {
        objc_msgSend(v105, "objectForKeyedSubscript:", v49);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "BOOLValue");

      }
      if (((CSIsCommunalDevice() | v53) & 1) != 0)
      {
        if (objc_msgSend(v107, "type") == 21)
        {
          queue = self->_queue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_63;
          block[3] = &unk_24CC85BB8;
          v129 = v106;
          v130 = self;
          v131 = v16;
          v132 = v19;
          v133 = v105;
          v134 = v102;
          v135 = v104;
          v136 = v21;
          dispatch_async(queue, block);

          v55 = v129;
LABEL_99:

          goto LABEL_49;
        }
        if (objc_msgSend(v107, "type") == 6)
        {
          if (v103)
          {
            v56 = v103;
            v57 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:w"
                                   "ithRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v56;
              _os_log_impl(&dword_2117D4000, v57, OS_LOG_TYPE_DEFAULT, "%s Using asset %{public}@ provided by caller", buf, 0x16u);
            }
          }
          else
          {
            +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "installedAssetOfType:forLanguage:", 3, v102);
            v59 = objc_claimAutoreleasedReturnValue();

            v56 = (id)v59;
            if (!v59)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get asset for locale %@"), v102);
              v68 = objc_claimAutoreleasedReturnValue();
              v69 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId"
                                     ":withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:"
                                     "withCompletion:]";
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v68;
                _os_log_error_impl(&dword_2117D4000, v69, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
              }
              v70 = (void *)MEMORY[0x24BDD1540];
              v162 = CFSTR("reason");
              v163[0] = v68;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v163, &v162, 1);
              v71 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 802, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v21)[2](v21, v72);
              v100 = (__CFString *)v68;
              v99 = (void *)v71;
              v55 = 0;

              goto LABEL_98;
            }
          }
          v55 = v56;
          if ((objc_msgSend(v56, "satImplicitTrainingEnabled") & 1) == 0)
          {
            v62 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:w"
                                   "ithRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v102;
              v61 = "%s Implicit training not enabled for %{public}@";
              v63 = v62;
              v64 = 22;
LABEL_63:
              _os_log_impl(&dword_2117D4000, v63, OS_LOG_TYPE_DEFAULT, v61, buf, v64);
              goto LABEL_64;
            }
            goto LABEL_64;
          }
          if (CSIsCommunalDevice())
          {
            if (!v19)
            {
              v60 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId"
                                     ":withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:"
                                     "withCompletion:]";
                v61 = "%s sharedSiriId is nil - Bailing out";
LABEL_62:
                v63 = v60;
                v64 = 12;
                goto LABEL_63;
              }
              goto LABEL_64;
            }
          }
          else if (objc_msgSend(MEMORY[0x24BE28488], "isIOSDeviceSupportingBargeIn"))
          {
            objc_msgSend(v105, "objectForKeyedSubscript:", *MEMORY[0x24BE28570]);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "isEqualToString:", *MEMORY[0x24BE28550]);

            if (v66)
            {
              v60 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId"
                                     ":withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:"
                                     "withCompletion:]";
                v61 = "%s Rejecting barge-in utterance from adding to voice profile";
                goto LABEL_62;
              }
LABEL_64:
              v21[2](v21, 0);
              goto LABEL_99;
            }
          }
          if (v106)
          {
            objc_msgSend(v106, "route");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              objc_msgSend(v106, "route");
              v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v100 = CFSTR("unknown");
            }

          }
          else
          {
            v100 = CFSTR("unknown");
          }
          v73 = (void *)MEMORY[0x24BDD17C8];
          v74 = (uint64_t)v107;
          if (v107)
            v74 = objc_msgSend(v107, "type");
          objc_msgSend(v73, "stringWithFormat:", CFSTR("%lld"), v74);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", v19, v102);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v159 = __Block_byref_object_copy__6056;
          v160 = __Block_byref_object_dispose__6057;
          v161 = 0;
          v98 = v75;
          if (!v75)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Voice Profile not found for %@ - Bailing out"), v19);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v150 = 136315394;
              *(_QWORD *)&v150[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:"
                                    "withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
              *(_WORD *)&v150[12] = 2114;
              *(_QWORD *)&v150[14] = v82;
              _os_log_error_impl(&dword_2117D4000, v83, OS_LOG_TYPE_ERROR, "%s %{public}@", v150, 0x16u);
            }
            v84 = (void *)MEMORY[0x24BDD1540];
            v156 = *MEMORY[0x24BDD0FC8];
            v157 = v82;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 731, v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v21)[2](v21, v86);

            goto LABEL_97;
          }
          objc_msgSend(v75, "locale");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "isEqualToString:", v102);

          if ((v77 & 1) == 0)
          {
            v87 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v98, "locale");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "stringWithFormat:", CFSTR("ERR: Voice Profile locale %@ not matching with %@ - Bailing out"), v88, v102);
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            v90 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v150 = 136315394;
              *(_QWORD *)&v150[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:"
                                    "withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
              *(_WORD *)&v150[12] = 2114;
              *(_QWORD *)&v150[14] = v89;
              _os_log_error_impl(&dword_2117D4000, v90, OS_LOG_TYPE_ERROR, "%s %{public}@", v150, 0x16u);
            }
            v91 = (void *)MEMORY[0x24BDD1540];
            v154 = *MEMORY[0x24BDD0FC8];
            v155 = v89;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 732, v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v21)[2](v21, v93);

            goto LABEL_97;
          }
          objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("shouldRecordPayload"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "BOOLValue");

          *(_QWORD *)v150 = 0;
          *(_QWORD *)&v150[8] = v150;
          *(_QWORD *)&v150[16] = 0x3032000000;
          v151 = __Block_byref_object_copy__6056;
          v152 = __Block_byref_object_dispose__6057;
          v153 = v16;
          v126[0] = 0;
          v126[1] = v126;
          v126[2] = 0x3032000000;
          v126[3] = __Block_byref_object_copy__6056;
          v126[4] = __Block_byref_object_dispose__6057;
          v127 = 0;
          v120 = 0;
          v121 = &v120;
          v122 = 0x3032000000;
          v123 = __Block_byref_object_copy__6056;
          v124 = __Block_byref_object_dispose__6057;
          v80 = v153;
          v125 = v80;
          if (CSIsCommunalDevice())
          {
            if ((v79 & 1) == 0)
            {
              v81 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v144 = 136315394;
                v145 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDev"
                       "iceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
                v146 = 2114;
                v147 = v80;
                _os_log_impl(&dword_2117D4000, v81, OS_LOG_TYPE_DEFAULT, "%s Privacy disallowed implicit utterance %{public}@ - skipping", v144, 0x16u);
              }
              v21[2](v21, 0);
              goto LABEL_96;
            }
          }
          else
          {
            v118[0] = MEMORY[0x24BDAC760];
            v118[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_78;
            v118[3] = &unk_24CC85BE8;
            v119[1] = buf;
            v119[2] = &v120;
            v119[3] = v150;
            v119[4] = v126;
            v118[1] = 3221225472;
            v119[0] = v98;
            +[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:](SSRUtils, "segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:", v80, v105, v79, v118);
            v94 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            if (v94)
            {
              v95 = v119;
              v96 = *v22;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v144 = 136315650;
                v145 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDev"
                       "iceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
                v146 = 2114;
                v147 = v80;
                v148 = 2114;
                v149 = v94;
                _os_log_error_impl(&dword_2117D4000, v96, OS_LOG_TYPE_ERROR, "%s ERR: Failed to segment %{public}@ with %{public}@ - Bailing out", v144, 0x20u);
                v94 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              }
              v21[2](v21, v94);
              goto LABEL_95;
            }

          }
          v97 = v121[5];
          v108[0] = MEMORY[0x24BDAC760];
          v108[1] = 3221225472;
          v108[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_81;
          v108[3] = &unk_24CC85C10;
          v115 = buf;
          v109 = v105;
          v110 = v80;
          v116 = v150;
          v111 = v99;
          v112 = v100;
          v113 = v98;
          v117 = v126;
          v114 = v21;
          objc_msgSend(v101, "addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:withCompletion:", v97, v113, v55, v111, v112, v108);

          v95 = &v109;
LABEL_95:

LABEL_96:
          _Block_object_dispose(&v120, 8);

          _Block_object_dispose(v126, 8);
          _Block_object_dispose(v150, 8);

LABEL_97:
          _Block_object_dispose(buf, 8);

LABEL_98:
          goto LABEL_99;
        }
LABEL_48:
        v21[2](v21, 0);
LABEL_49:

        goto LABEL_19;
      }
      v47 = *v22;
      if (!os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecor"
                           "dDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
      v48 = "%s ERR: SAT did not trigger!!! - Bailing out";
    }
    _os_log_error_impl(&dword_2117D4000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
    goto LABEL_48;
  }
  v29 = *v22;
  if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordD"
                         "eviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]";
    v30 = "%s Implicit training has been disabled -- Bailing out";
LABEL_9:
    _os_log_impl(&dword_2117D4000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
  }
LABEL_18:
  v21[2](v21, 0);
LABEL_19:

  _Block_object_dispose(v141, 8);
}

- (id)getUserVoiceProfileUpdateDirectory
{
  void *v3;
  void *v4;

  -[SSRVoiceProfileManager _CSSATDownloadPath](self, "_CSSATDownloadPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:](self, "_getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getCacheDirectoryForAppDomain:(id)a3
{
  void *v4;
  void *v5;

  -[SSRVoiceProfileManager _CSSATCachePathForAppDomain:](self, "_CSSATCachePathForAppDomain:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:](self, "_getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)notifyUserVoiceProfileDownloadReadyForUser:(id)a3 getData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  SSRVoiceProfileManager *v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__6056;
  v21[4] = __Block_byref_object_dispose__6057;
  v22 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SSRVoiceProfileManager_notifyUserVoiceProfileDownloadReadyForUser_getData_completion___block_invoke;
  block[3] = &unk_24CC85C38;
  v18 = v9;
  v19 = v10;
  v16 = v8;
  v17 = self;
  v20 = v21;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, block);

  _Block_object_dispose(v21, 8);
}

- (void)notifyUserVoiceProfileUpdateReady
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SSRVoiceProfileManager_notifyUserVoiceProfileUpdateReady__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_checkIfDownloadRequiredForProfileId:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  BOOL v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((CSIsIOS() & 1) != 0 || (CSIsCommunalDevice() & 1) != 0 || (CSIsOSX() & 1) != 0)
  {
    v5 = CSIsCommunalDevice();
    if (v4 || !v5)
    {
      if ((CSIsCommunalDevice() & 1) == 0)
      {
        v9 = (void *)MEMORY[0x24BE28488];
        -[NSUUID UUIDString](self->_endpointUUID, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "getSiriLanguageWithEndpointId:fallbackLanguage:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isMarkedSATEnrolled"))
        {
          v13 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            v15 = 136315394;
            v16 = "-[SSRVoiceProfileManager _checkIfDownloadRequiredForProfileId:]";
            v17 = 2114;
            v18 = v11;
            _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Skipping download for language [%{public}@] since we already have enrollment data for this language", (uint8_t *)&v15, 0x16u);
          }

          goto LABEL_16;
        }

      }
      v7 = 1;
      goto LABEL_19;
    }
    v6 = *MEMORY[0x24BE284B8];
    v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[SSRVoiceProfileManager _checkIfDownloadRequiredForProfileId:]";
      v8 = "%s Skipping download for tvOS when shared id is nil";
LABEL_15:
      _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
LABEL_16:
      v7 = 0;
    }
  }
  else
  {
    v6 = *MEMORY[0x24BE284B8];
    v7 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[SSRVoiceProfileManager _checkIfDownloadRequiredForProfileId:]";
      v8 = "%s Skipping download for unsupported OS";
      goto LABEL_15;
    }
  }
LABEL_19:

  return v7;
}

- (id)_downloadAndEnrollVoiceProfileForProfileId:(id)a3 withDownloadTriggerBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  unint64_t currentDeviceCategory;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __94__SSRVoiceProfileManager__downloadAndEnrollVoiceProfileForProfileId_withDownloadTriggerBlock___block_invoke;
  v21[3] = &unk_24CC85CB0;
  v21[4] = self;
  v8 = v6;
  v22 = v8;
  v9 = v7;
  v23 = v9;
  v10 = MEMORY[0x212BE197C](v21);
  v11 = (void (**)(_QWORD, _QWORD))v10;
  currentDeviceCategory = self->_currentDeviceCategory;
  if (currentDeviceCategory == 2)
  {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 5);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v17 = 0;
      goto LABEL_16;
    }
    v15 = (void *)v18;
    v11[2](v11, self->_currentDeviceCategory);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (currentDeviceCategory == 4)
  {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 5);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13
      && (v11[2](v11, 2),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          (v13 = v14) != 0))
    {
      v11[2](v11, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v13 = v13;
        v16 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]";
          v26 = 2112;
          v27 = v8;
          v28 = 2114;
          v29 = v13;
          _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s Failed to enroll siriProfileId %@ with %{public}@", buf, 0x20u);
        }
        v17 = v13;
        goto LABEL_14;
      }
    }
    else
    {
      v15 = 0;
    }
    v17 = 0;
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v19 = v17;

  return v19;
}

- (void)_downloadVoiceProfileForProfileId:(id)a3 forDeviceCategory:(unint64_t)a4 withDownloadTriggerBlock:(id)a5 withCompletion:(id)a6
{
  void (**v10)(id, void *, _QWORD);
  void *v11;
  NSUUID *endpointUUID;
  id v13;
  void *v14;
  void *v15;
  os_log_t *v16;
  NSObject *v17;
  NSUUID *v18;
  SSRVoiceProfileMetaContext *v19;
  void *v20;
  void *v21;
  SSRVoiceProfileMetaContext *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSUUID *v27;
  NSUUID *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  const __CFString *v37;
  NSUUID *v38;
  const __CFString *v39;
  NSUUID *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  NSUUID *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v36 = a5;
  v10 = (void (**)(id, void *, _QWORD))a6;
  v11 = (void *)MEMORY[0x24BE28488];
  endpointUUID = self->_endpointUUID;
  v13 = a3;
  -[NSUUID UUIDString](endpointUUID, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getSiriLanguageWithEndpointId:fallbackLanguage:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (os_log_t *)MEMORY[0x24BE284B8];
  v17 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_endpointUUID;
    *(_DWORD *)buf = 136315650;
    v42 = "-[SSRVoiceProfileManager _downloadVoiceProfileForProfileId:forDeviceCategory:withDownloadTriggerBlock:withCompletion:]";
    v43 = 2112;
    v44 = v18;
    v45 = 2112;
    v46 = v15;
    _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s endPointId:%@, currentLanguageCode:%@", buf, 0x20u);
  }
  v19 = [SSRVoiceProfileMetaContext alloc];
  if (CSIsCommunalDevice())
    v20 = v15;
  else
    v20 = 0;
  +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SSRVoiceProfileMetaContext initWithSharedSiriId:languageCode:productCategory:version:](v19, "initWithSharedSiriId:languageCode:productCategory:version:", v13, v20, v21, &unk_24CC9A0D0);

  -[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryForProfileId:forDeviceCategory:forVoiceProfileVersion:](self, "_getUserVoiceProfileDownloadCacheDirectoryForProfileId:forDeviceCategory:forVoiceProfileVersion:", v13, a4, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SAT download path is nil - Bailing out"));
    v27 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v33 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[SSRVoiceProfileManager _downloadVoiceProfileForProfileId:forDeviceCategory:withDownloadTriggerBlock:withCompletion:]";
      v43 = 2114;
      v44 = v27;
      _os_log_error_impl(&dword_2117D4000, v33, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v34 = (void *)MEMORY[0x24BDD1540];
    v39 = CFSTR("reason");
    v40 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 718, v35);
    v28 = (NSUUID *)objc_claimAutoreleasedReturnValue();

    v25 = v36;
    if (v10)
      v10[2](v10, v28, 0);
    goto LABEL_17;
  }
  v24 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v23);
  v25 = v36;
  (*((void (**)(id, SSRVoiceProfileMetaContext *, void *))v36 + 2))(v36, v22, v23);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (NSUUID *)v26;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Download for %@ failed with %@"), v22, v26);
    v28 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v29 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[SSRVoiceProfileManager _downloadVoiceProfileForProfileId:forDeviceCategory:withDownloadTriggerBlock:withCompletion:]";
      v43 = 2114;
      v44 = v28;
      _os_log_error_impl(&dword_2117D4000, v29, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v30 = (void *)MEMORY[0x24BDD1540];
    v37 = CFSTR("reason");
    v38 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 712, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v10[2](v10, v32, 0);

LABEL_17:
    goto LABEL_21;
  }
  if (v10)
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v23);
  v27 = 0;
LABEL_21:

}

- (id)_enrollVoiceProfileForSiriProfileId:(id)a3 fromCacheDirectoryPath:(id)a4 withCategoryType:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  SSRVoiceProfileManager *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  SSRVoiceProfileRetrainingContext *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  const __CFString *v23;
  _UNKNOWN **v24;
  uint64_t i;
  SSRVoiceProfileRetrainingContext *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSUUID *endpointUUID;
  int v33;
  int v34;
  id v35;
  void *v36;
  char v37;
  SSRVoiceProfileRetrainingContext *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  uint32_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  SSRVoiceProfileRetrainingContext *v59;
  NSObject *v60;
  SSRVoiceProfileRetrainingContext *v61;
  id *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  int v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  SSRVoiceProfileRetrainingContext *v82;
  NSObject *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  const __CFString *v90;
  os_log_t v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  char log;
  NSObject *loga;
  SSRVoiceProfileRetrainingContext *v98;
  void *v99;
  id v100;
  void *v101;
  SSRVoiceProfileRetrainingContext *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  __CFString *v107;
  SSRVoiceProfileManager *v108;
  void *v109;
  _QWORD v110[4];
  NSObject *v111;
  SSRVoiceProfileRetrainingContext *v112;
  SSRVoiceProfileRetrainingContext *v113;
  uint64_t *v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id obj;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  const __CFString *v127;
  SSRVoiceProfileRetrainingContext *v128;
  const __CFString *v129;
  SSRVoiceProfileRetrainingContext *v130;
  const __CFString *v131;
  SSRVoiceProfileRetrainingContext *v132;
  _QWORD v133[2];
  _QWORD v134[2];
  const __CFString *v135;
  SSRVoiceProfileRetrainingContext *v136;
  uint8_t buf[4];
  const char *v138;
  __int16 v139;
  SSRVoiceProfileRetrainingContext *v140;
  __int16 v141;
  double v142;
  __int16 v143;
  void *v144;
  _BYTE v145[128];
  const __CFString *v146;
  _QWORD v147[4];

  v147[1] = *MEMORY[0x24BDAC8D0];
  v107 = (__CFString *)a3;
  v104 = a4;
  v108 = self;
  -[SSRVoiceProfileManager SSRSpeakerProfilesBasePath](self, "SSRSpeakerProfilesBasePath");
  v7 = objc_claimAutoreleasedReturnValue();
  v101 = (void *)v7;
  v121 = 0;
  v122 = &v121;
  v123 = 0x3032000000;
  v124 = __Block_byref_object_copy__6056;
  v125 = __Block_byref_object_dispose__6057;
  v126 = 0;
  if (!v104 || !v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SourcePath (%@) or DestinationPath (%@) is nil - Bailing out"), v104, v7);
    v17 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
      v139 = 2114;
      v140 = v17;
      _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v19 = (void *)MEMORY[0x24BDD1540];
    v127 = CFSTR("reason");
    v128 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 722, v20);
    v100 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v7);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id *)(v122 + 5);
  obj = (id)v122[5];
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v104, &obj);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, obj);

  AFPreferencesSupportedLanguages();
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v122[5];
  v11 = v108;
  if (v10)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed to get contents of %@ with error %@"), v104, v13);
    v103 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();

    v14 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
      v139 = 2114;
      v140 = v103;
      _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v15 = (void *)MEMORY[0x24BDD1540];
    v146 = CFSTR("reason");
    v147[0] = v103;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v147, &v146, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 722, v16);
    v100 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v103 = v95;
  v22 = -[SSRVoiceProfileRetrainingContext countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v116, v145, 16);
  if (!v22)
  {
    log = 0;
    goto LABEL_95;
  }
  log = 0;
  v105 = *(_QWORD *)v117;
  if (v107)
    v23 = v107;
  else
    v23 = CFSTR("Primary User");
  v90 = v23;
  v24 = &off_24CC84000;
  do
  {
    v106 = v22;
    for (i = 0; i != v106; ++i)
    {
      if (*(_QWORD *)v117 != v105)
        objc_enumerationMutation(v103);
      v26 = *(SSRVoiceProfileRetrainingContext **)(*((_QWORD *)&v116 + 1) + 8 * i);
      if (v109 && (objc_msgSend(v109, "containsObject:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i)) & 1) == 0)
      {
        v44 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
          v139 = 2114;
          v140 = v26;
          v141 = 2114;
          v142 = *(double *)&v109;
          _os_log_impl(&dword_2117D4000, v44, OS_LOG_TYPE_DEFAULT, "%s Language %{public}@ not supported in %{public}@ - Skipping", buf, 0x20u);
        }
        goto LABEL_70;
      }
      objc_msgSend(v104, "stringByAppendingPathComponent:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BE28488];
      -[NSUUID UUIDString](v11->_endpointUUID, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "getSiriLanguageWithEndpointId:fallbackLanguage:", v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        endpointUUID = v108->_endpointUUID;
        *(_DWORD *)buf = 136315650;
        v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
        v139 = 2112;
        v140 = (SSRVoiceProfileRetrainingContext *)endpointUUID;
        v141 = 2112;
        v142 = *(double *)&v30;
        _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s endPointId:%@, currentLanguageCode:%@", buf, 0x20u);
      }
      v33 = CSIsCommunalDevice();
      if (v30)
        v34 = v33;
      else
        v34 = 0;
      if (v34 == 1)
      {
        if ((-[SSRVoiceProfileRetrainingContext isEqualToString:](v26, "isEqualToString:", v30) & 1) != 0)
        {
          if (+[SSRUtils isSpeakerRecognitionSupportedInLocale:](SSRUtils, "isSpeakerRecognitionSupportedInLocale:", v30))
          {
            goto LABEL_31;
          }
          v69 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            v139 = 2114;
            v140 = (SSRVoiceProfileRetrainingContext *)v107;
            v141 = 2114;
            v142 = *(double *)&v30;
            v46 = v69;
            v47 = "%s Skipping profile download for %{public}@ - voiceId not supported in %{public}@";
            v48 = 32;
LABEL_60:
            _os_log_impl(&dword_2117D4000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, v48);
          }
        }
        else
        {
          v45 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            v139 = 2114;
            v140 = (SSRVoiceProfileRetrainingContext *)v107;
            v141 = 2114;
            v142 = *(double *)&v26;
            v143 = 2114;
            v144 = v30;
            v46 = v45;
            v47 = "%s Skipping profile download for %{public}@ - %{public}@ not matching current %{public}@";
            v48 = 42;
            goto LABEL_60;
          }
        }

        goto LABEL_70;
      }
LABEL_31:
      +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", v107, v26);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        if (CSIsCommunalDevice())
        {
          objc_msgSend(v24[64], "sharedInstance");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "checkIfVoiceProfile:needsUpdatedWith:withCategory:", v35, v27, a5);

          if ((v37 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Skipping profile Update for %@ in %@"), v107, v26);
            v38 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();
            v39 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
              v139 = 2114;
              v140 = v38;
              _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
            }
            v40 = (void *)MEMORY[0x24BDD1540];
            v135 = CFSTR("reason");
            v136 = v38;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 748, v41);
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = (void *)v122[5];
            v122[5] = v42;

            log = 1;
LABEL_44:

LABEL_70:
            v11 = v108;
            continue;
          }
        }
        else if (objc_msgSend(v35, "isMarkedSATEnrolled"))
        {
          v49 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            v139 = 2114;
            v140 = v26;
            _os_log_impl(&dword_2117D4000, v49, OS_LOG_TYPE_DEFAULT, "%s Skipping language [%{public}@] since we already have enrollment data for this language", buf, 0x16u);
          }
          goto LABEL_44;
        }
      }
      v50 = (void *)MEMORY[0x212BE17E4]();
      objc_msgSend(v24[64], "sharedInstance");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (v35)
      {
        v53 = (id)objc_msgSend(v51, "deleteUserVoiceProfile:", v35);
      }
      else
      {
        v35 = -[SSRVoiceProfile initNewVoiceProfileWithLocale:withAppDomain:]([SSRVoiceProfile alloc], "initNewVoiceProfileWithLocale:withAppDomain:", v26, CFSTR("com.apple.siri"));
        objc_msgSend(v35, "setSharedSiriProfileId:", v107);
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v27);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "importVoiceProfileAtPath:", v54);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v122[5];
      v122[5] = v55;

      if (v122[5])
      {
        v57 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v35, "locale");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringWithFormat:", CFSTR("ERR: Failed to import profile %@ for %@"), v58, v107);
        v59 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();

        v60 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          goto LABEL_65;
        goto LABEL_66;
      }
      if ((objc_msgSend(v35, "markSATEnrollmentSuccess") & 1) == 0)
      {
        v70 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v35, "locale");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "stringWithFormat:", CFSTR("ERR: Migrated language %@ for %@ but failed to mark SAT enrollment"), v71, v107);
        v59 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();

        v60 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
LABEL_65:
          *(_DWORD *)buf = 136315394;
          v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
          v139 = 2114;
          v140 = v59;
          _os_log_error_impl(&dword_2117D4000, v60, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
LABEL_66:
        v68 = 5;
        goto LABEL_67;
      }
      if ((objc_msgSend(v35, "markSATEnrollmentMigrated") & 1) == 0)
      {
        v72 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v35, "locale");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "stringWithFormat:", CFSTR("ERR: Failed to mark migrated for %@ in language %@"), v107, v73);
        v59 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();

        v60 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          goto LABEL_65;
        goto LABEL_66;
      }
      if (CSIsCommunalDevice())
      {
        v133[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
        v133[1] = CFSTR("SSRVoiceRetrainingSpIdType");
        v134[0] = v35;
        v134[1] = &unk_24CC9A0E8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v134, v133, 2);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = [SSRVoiceProfileRetrainingContext alloc];
        v62 = (id *)(v122 + 5);
        v115 = (id)v122[5];
        v59 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:](v61, "initWithVoiceRetrainingContext:error:", v99, &v115);
        objc_storeStrong(v62, v115);
        if (v122[5])
        {
          v63 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v35, "profileID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "stringWithFormat:", CFSTR("Failed to init retrainCtxt for profileID %@ with error %@"), v64, v122[5]);
          v98 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();

          v65 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            v139 = 2112;
            v140 = v98;
            _os_log_error_impl(&dword_2117D4000, v65, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
          }
          v66 = (void *)MEMORY[0x24BDD1540];
          v131 = CFSTR("reason");
          v132 = v98;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 756, v67);
          v100 = (id)objc_claimAutoreleasedReturnValue();
          v68 = 1;
          goto LABEL_84;
        }

      }
      else
      {
        v59 = 0;
      }
      v94 = v50;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_alloc_init(MEMORY[0x24BE28408]);
      objc_msgSend(v74, "enter");
      +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = MEMORY[0x24BDAC760];
      v110[1] = 3221225472;
      v110[2] = __102__SSRVoiceProfileManager__enrollVoiceProfileForSiriProfileId_fromCacheDirectoryPath_withCategoryType___block_invoke;
      v110[3] = &unk_24CC85C60;
      v114 = &v121;
      v76 = v35;
      v111 = v76;
      v112 = v26;
      v98 = (SSRVoiceProfileRetrainingContext *)v74;
      v113 = v98;
      v91 = v76;
      objc_msgSend(v75, "addUserVoiceProfile:withContext:withCompletion:", v76, v59, v110);

      v24 = &off_24CC84000;
      v50 = v94;
      v77 = -[SSRVoiceProfileRetrainingContext waitWithTimeout:](v98, "waitWithTimeout:", dispatch_time(0, 10000000000));
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "timeIntervalSinceDate:", v99);
      v79 = v78 * 1000.0;
      if (v77)
      {
        v80 = (void *)MEMORY[0x24BDD17C8];
        -[NSObject siriProfileId](v91, "siriProfileId");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "stringWithFormat:", CFSTR("userAddition timedout for siriProfileId %@ after %fms"), v81, *(_QWORD *)&v79);
        v82 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();

        v83 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
          v139 = 2112;
          v140 = v82;
          _os_log_error_impl(&dword_2117D4000, v83, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
        }

      }
      else
      {
        v84 = (void *)v122[5];
        if (!v84)
        {
          v85 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            v139 = 2114;
            v140 = (SSRVoiceProfileRetrainingContext *)v90;
            v141 = 2048;
            v142 = v79;
            _os_log_impl(&dword_2117D4000, v85, OS_LOG_TYPE_DEFAULT, "%s Successfully added %{public}@ in %.2fms", buf, 0x20u);
            v85 = *MEMORY[0x24BE284B8];
          }
          loga = v85;
          if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject locale](v91, "locale");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
            v139 = 2114;
            v140 = (SSRVoiceProfileRetrainingContext *)v107;
            v141 = 2114;
            v142 = *(double *)&v86;
            _os_log_impl(&dword_2117D4000, loga, OS_LOG_TYPE_DEFAULT, "%s Sucessfully enrolled %{public}@ for language %{public}@", buf, 0x20u);

          }
          if (v108->_currentDeviceCategory - 1 <= 2)
            v87 = -[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:](v108, "_enableVoiceTriggerIfLanguageMatches:", v26);
          v68 = 0;
          log = 1;
          goto LABEL_83;
        }
        v92 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
          v139 = 2114;
          v140 = (SSRVoiceProfileRetrainingContext *)v107;
          v141 = 2114;
          v142 = *(double *)&v26;
          v143 = 2114;
          v144 = v84;
          _os_log_error_impl(&dword_2117D4000, v92, OS_LOG_TYPE_ERROR, "%s ERR: Failed migrating Voice profile with ID %{public}@ for language %{public}@ with error %{public}@", buf, 0x2Au);
        }
      }
      v68 = 5;
LABEL_83:

      v67 = v111;
LABEL_84:

LABEL_67:
      objc_autoreleasePoolPop(v50);

      if (v68 == 5)
        goto LABEL_70;
      v11 = v108;
      if (v68)
        goto LABEL_8;
    }
    v22 = -[SSRVoiceProfileRetrainingContext countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v116, v145, 16);
  }
  while (v22);
LABEL_95:

  if (log & 1 | ((CSIsCommunalDevice() & 1) == 0) || v122[5])
  {

    v100 = (id)v122[5];
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to enroll user - %@"), v107);
  v103 = (SSRVoiceProfileRetrainingContext *)objc_claimAutoreleasedReturnValue();
  v88 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v138 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]";
    v139 = 2114;
    v140 = v103;
    _os_log_error_impl(&dword_2117D4000, v88, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  v89 = (void *)MEMORY[0x24BDD1540];
  v129 = CFSTR("reason");
  v130 = v103;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 747, v16);
  v100 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
LABEL_12:
  _Block_object_dispose(&v121, 8);

  return v100;
}

- (id)_enableVoiceTriggerIfLanguageMatches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  int v29;
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CSNotBackedupPreferencesValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE28488];
  -[NSUUID UUIDString](self->_endpointUUID, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSiriLanguageWithEndpointId:fallbackLanguage:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (os_log_t *)MEMORY[0x24BE284B8];
  v10 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136315906;
    v30 = "-[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:]";
    v31 = 2114;
    v32 = *(double *)&v4;
    v33 = 2114;
    v34 = v5;
    v35 = 2114;
    v36 = v8;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s language: %{public}@, enableVTAfterSyncLanguage: %{public}@, currSiriLanguage: %{public}@", (uint8_t *)&v29, 0x2Au);
  }
  if (v5 && v8)
  {
    v11 = objc_msgSend(v4, "isEqualToString:", v8);
    v12 = *v9;
    if (v11)
    {
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 136315650;
        v30 = "-[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:]";
        v31 = 2114;
        v32 = *(double *)&v8;
        v33 = 2114;
        v34 = v5;
        _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Enabling VoiceTrigger Upon VoiceProfile sync for language: %{public}@ and enrolled language: %{public}@", (uint8_t *)&v29, 0x20u);
      }
      _CSNotBackedupPreferencesSetValueForKey();
      CSNotBackedupInternalPreferencesSynchronize();
      objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setVoiceTriggerEnabled:", 1);

      if (objc_msgSend(MEMORY[0x24BE28488], "supportRemoteDarwinVoiceTrigger"))
      {
        objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setVoiceTriggerEnabled:sender:deviceType:endpointId:", 1, self, 3, 0);

      }
      if (CSIsInternalBuild())
      {
        _CSNotBackedupPreferencesValueForKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EnableVTUponVoiceProfileSync"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("EnableVTUponVoiceProfileSync"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("timestamp"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_alloc_init(MEMORY[0x24BDD1500]);
            objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setLocale:", v21);

            objc_msgSend(v20, "setDateFormat:", CFSTR("yyyyMMdd-HH:mm:ss"));
            objc_msgSend(v20, "dateFromString:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "timeIntervalSinceDate:", v22);
            v25 = v24;
            if (v24 > 604800.0)
            {
              v26 = *v9;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v29 = 136315394;
                v30 = "-[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:]";
                v31 = 2048;
                v32 = v25;
                _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, "%s Triggering ABC logging since VoiceProfile download took %f secs", (uint8_t *)&v29, 0x16u);
              }
              objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "submitVoiceTriggerIssueReport:", *MEMORY[0x24BE28510]);

            }
          }
        }

      }
      goto LABEL_22;
    }
  }
  else
  {
    v12 = *v9;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136315394;
    v30 = "-[SSRVoiceProfileManager _enableVoiceTriggerIfLanguageMatches:]";
    v31 = 2114;
    v32 = *(double *)&v4;
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Not enabling VoiceTrigger Upon VoiceProfile sync for language: %{public}@", (uint8_t *)&v29, 0x16u);
  }
LABEL_22:

  return 0;
}

- (id)_getUserVoiceProfileDownloadCacheDirectoryForProfileId:(id)a3 forDeviceCategory:(unint64_t)a4 forVoiceProfileVersion:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  if (a4 == 3)
  {
    -[SSRVoiceProfileManager baseDir](self, "baseDir");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a5)
      v11 = CFSTR("Caches/VoiceTrigger/SATUpdateNewerZone");
    else
      v11 = CFSTR("Caches/VoiceTrigger/SATUpdate");
    objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[SSRVoiceProfileManager baseDir](self, "baseDir");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("Caches/VoiceTrigger/SATUpdate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%d_%d"), a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", v10);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
LABEL_8:

  }
  -[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:](self, "_getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  const char *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, 0);

  v6 = 0;
  if (v5)
  {
    v7 = (os_log_t *)MEMORY[0x24BE284B8];
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:]";
      _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s PHS update directory already exists, remove before we move forward", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v10 = objc_msgSend(v9, "removeItemAtPath:error:", v3, &v19);
    v6 = v19;

    if ((v10 & 1) == 0)
    {
      v15 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:]";
        v16 = "%s Failed to delete PHS update directory";
        goto LABEL_15;
      }
LABEL_12:

      v14 = 0;
      goto LABEL_13;
    }
  }
  v11 = v6;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v6;
  v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v18);
  v6 = v18;

  if ((v13 & 1) == 0)
  {
    v15 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SSRVoiceProfileManager _getUserVoiceProfileDownloadCacheDirectoryWithUpdatePath:]";
      v16 = "%s Failed to create PHS update directory";
LABEL_15:
      _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }

LABEL_8:
  v14 = v3;
LABEL_13:

  return v14;
}

- (void)notifyUserVoiceProfileUploadCompleteForSiriProfileId:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__SSRVoiceProfileManager_notifyUserVoiceProfileUploadCompleteForSiriProfileId_withError___block_invoke;
  block[3] = &unk_24CC861E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)uploadUserVoiceProfileForSiriProfileId:(id)a3 withUploadTrigger:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SSRVoiceProfileManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94__SSRVoiceProfileManager_uploadUserVoiceProfileForSiriProfileId_withUploadTrigger_completion___block_invoke;
  v15[3] = &unk_24CC85D00;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (id)getUserVoiceProfileUploadPathWithEnrolledLanguageList:(id *)a3
{
  NSObject *v4;
  NSObject *queue;
  id v7;
  _QWORD v8[6];
  __int128 buf;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (CSIsCommunalDevice())
  {
    v4 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]";
      _os_log_error_impl(&dword_2117D4000, v4, OS_LOG_TYPE_ERROR, "%s Legacy upload API called on Horseman - Bailing out", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__6056;
    v12 = __Block_byref_object_dispose__6057;
    -[SSRVoiceProfileManager _CSSATLegacyUploadPath](self, "_CSSATLegacyUploadPath");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __80__SSRVoiceProfileManager_getUserVoiceProfileUploadPathWithEnrolledLanguageList___block_invoke;
    v8[3] = &unk_24CC864E8;
    v8[4] = self;
    v8[5] = &buf;
    dispatch_sync(queue, v8);
    v7 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    return v7;
  }
}

- (void)notifyUserVoiceProfileUploadComplete
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SSRVoiceProfileManager_notifyUserVoiceProfileUploadComplete__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_getVoiceProfilePathsToBeUploadedForSiriProfileId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  SSRVoiceProfileMetaContext *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  NSObject *p_super;
  const char *v23;
  uint32_t v24;
  os_log_t v25;
  os_log_t v26;
  void *v27;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  AFPreferencesSupportedLanguages();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CSIsCommunalDevice();
  if (v3 || !v6)
  {
    v29 = v3;
    +[SSRUtils getVoiceProfilesForSiriProfileId:](SSRUtils, "getVoiceProfilesForSiriProfileId:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (!v10)
      goto LABEL_26;
    v11 = v10;
    v12 = *(_QWORD *)v32;
    v13 = (os_log_t *)MEMORY[0x24BE284B8];
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "locale");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v5, "containsObject:", v16);

          if ((v17 & 1) == 0)
          {
            v21 = *v13;
            if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
              continue;
            v18 = v21;
            objc_msgSend(v15, "locale");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v36 = "-[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:]";
            v37 = 2114;
            v38 = v20;
            v39 = 2114;
            v40 = v5;
            p_super = &v18->super;
            v23 = "%s Unsupported languagecode %{public}@ in %{public}@ - Skipping";
            v24 = 32;
LABEL_20:
            _os_log_impl(&dword_2117D4000, p_super, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
            goto LABEL_23;
          }
        }
        if (!objc_msgSend(v15, "voiceProfileVersion"))
        {
          v25 = *v13;
          if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            continue;
          v18 = v25;
          objc_msgSend(v15, "locale");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v36 = "-[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:]";
          v37 = 2114;
          v38 = v20;
          v39 = 2048;
          v40 = 0;
          v41 = 2048;
          v42 = 1;
          p_super = &v18->super;
          v23 = "%s Skipping uploading %{public}@ legacy version (%lu) of voice profile, current version %lu";
          v24 = 42;
          goto LABEL_20;
        }
        if ((objc_msgSend(v15, "isMarkedSATEnrolled") & 1) != 0)
        {
          v18 = -[SSRVoiceProfileMetaContext initWithVoiceProfile:]([SSRVoiceProfileMetaContext alloc], "initWithVoiceProfile:", v15);
          +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", self->_currentDeviceCategory);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSRVoiceProfileMetaContext setProductCategory:](v18, "setProductCategory:", v19);

          -[SSRVoiceProfileMetaContext setVersion:](v18, "setVersion:", &unk_24CC9A0D0);
          objc_msgSend(v15, "voiceProfileBasePath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v18, v20);
        }
        else
        {
          v26 = *v13;
          if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            continue;
          v18 = v26;
          objc_msgSend(v15, "locale");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "profileID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v36 = "-[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:]";
          v37 = 2114;
          v38 = v20;
          v39 = 2112;
          v40 = v27;
          _os_log_impl(&dword_2117D4000, &v18->super, OS_LOG_TYPE_DEFAULT, "%s Skipping uploading %{public}@ voice profile for profileId %@", buf, 0x20u);

        }
LABEL_23:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      if (!v11)
      {
LABEL_26:
        v8 = v4;

        v3 = v29;
        goto LABEL_27;
      }
    }
  }
  v7 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:]";
    _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: siriProfileId is nil - Bailing out", buf, 0xCu);
  }
  v8 = 0;
LABEL_27:

  return v8;
}

- (void)_copyExplicitEnrollmentFilesFromPath:(id)a3 toPath:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  SSRVoiceProfileManager *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void (**v44)(id, id, _QWORD);
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  const __CFString *v58;
  void *v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v57 = 0;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v9;
  LOBYTE(a5) = objc_msgSend(v47, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v57);
  v51 = v57;
  if ((a5 & 1) != 0)
  {
    v44 = v10;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enumeratorAtPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    if (v14)
    {
      v15 = v14;
      v50 = 0;
      v16 = *(_QWORD *)v54;
      v45 = v13;
      v46 = v8;
LABEL_4:
      v17 = 0;
      v48 = v15;
      while (1)
      {
        if (*(_QWORD *)v54 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v17);
        objc_msgSend(v8, "stringByAppendingPathComponent:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[SSRVoiceProfileManager _isDirectory:](self, "_isDirectory:", v19);

        if (v20)
          goto LABEL_23;
        v21 = v16;
        v22 = self;
        objc_msgSend(v18, "pathExtension");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "containsString:", CFSTR("audiocache")))
        {
          v24 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v61 = "-[SSRVoiceProfileManager _copyExplicitEnrollmentFilesFromPath:toPath:withCompletion:]";
            v62 = 2112;
            v63 = v18;
            _os_log_impl(&dword_2117D4000, v24, OS_LOG_TYPE_DEFAULT, "%s Skipping audiocache file %@", buf, 0x16u);
          }
          goto LABEL_22;
        }
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("wav")) & 1) != 0
          || objc_msgSend(v23, "isEqualToString:", CFSTR("json")))
        {
          break;
        }
LABEL_22:

        self = v22;
        v16 = v21;
LABEL_23:
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
          if (v15)
            goto LABEL_4;
          goto LABEL_33;
        }
      }
      v25 = v13;
      objc_msgSend(v8, "stringByAppendingPathComponent:", v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringByAppendingPathComponent:", v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("enrollment_version.json"));

      if ((v29 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v26);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:](SSRVoiceProfileMetadataManager, "getUtteranceEnrollmentType:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31 && (objc_msgSend(v31, "isEqualToString:", CFSTR("implicit")) & 1) != 0)
        {

          v13 = v25;
          v8 = v46;
LABEL_21:
          v15 = v48;
          goto LABEL_22;
        }

      }
      v32 = objc_msgSend(v23, "isEqualToString:", CFSTR("wav"));
      objc_msgSend(v27, "stringByDeletingLastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v33);

      v52 = 0;
      LODWORD(v33) = objc_msgSend(v47, "copyItemAtPath:toPath:error:", v26, v27, &v52);
      v34 = v52;
      if (!(_DWORD)v33 || v34)
      {
        v51 = v34;
        v37 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v61 = "-[SSRVoiceProfileManager _copyExplicitEnrollmentFilesFromPath:toPath:withCompletion:]";
          v62 = 2114;
          v63 = v26;
          v64 = 2114;
          v65 = v27;
          v66 = 2114;
          v67 = v51;
          _os_log_error_impl(&dword_2117D4000, v37, OS_LOG_TYPE_ERROR, "%s Cannot copy file %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
        }
        v38 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v51, "localizedDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("Failed to copy to SATUpload Diretory : %@"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = (void *)MEMORY[0x24BDD1540];
        v58 = CFSTR("reason");
        v59 = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 721, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v44;
        v44[2](v44, v43, 0);

        v13 = v45;
        v8 = v46;
        goto LABEL_34;
      }
      v50 += v32;

      v51 = 0;
      v13 = v45;
      v8 = v46;
      goto LABEL_21;
    }
    v50 = 0;
LABEL_33:

    v10 = v44;
    v44[2](v44, 0, v50);
LABEL_34:

    v36 = v51;
  }
  else
  {
    v35 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v61 = "-[SSRVoiceProfileManager _copyExplicitEnrollmentFilesFromPath:toPath:withCompletion:]";
      v62 = 2114;
      v63 = v9;
      v64 = 2114;
      v65 = v51;
      _os_log_error_impl(&dword_2117D4000, v35, OS_LOG_TYPE_ERROR, "%s Cannot create %{public}@ with error %{public}@ - Skipping language", buf, 0x20u);
    }
    v36 = v51;
    v10[2](v10, v51, 0);
  }

}

- (id)_copyVoiceProfileAtPath:(id)a3 toPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  id *v22;
  char v23;
  id *v24;
  int v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id obj;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  _BYTE v82[10];
  _BYTE v83[10];
  _QWORD v84[2];
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v53 = a4;
  v49 = v5;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils getContentsOfDirectory:](SSRUtils, "getContentsOfDirectory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__6056;
  v77 = __Block_byref_object_dispose__6057;
  v78 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v89, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v62;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v10);
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringByAppendingPathComponent:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v16))
        {

LABEL_9:
          objc_msgSend(v11, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = MEMORY[0x24BDAC760];
          v56[1] = 3221225472;
          v56[2] = __57__SSRVoiceProfileManager__copyVoiceProfileAtPath_toPath___block_invoke;
          v56[3] = &unk_24CC85D28;
          v58 = &v73;
          v20 = v12;
          v57 = v20;
          v59 = &v69;
          v60 = &v65;
          -[SSRVoiceProfileManager _copyExplicitEnrollmentFilesFromPath:toPath:withCompletion:](self, "_copyExplicitEnrollmentFilesFromPath:toPath:withCompletion:", v19, v15, v56);

          if (v74[5])
          {
            v34 = (id)*MEMORY[0x24BE284B8];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v11, "path");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = v74[5];
              *(_DWORD *)buf = 136315906;
              v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
              v81 = 2114;
              *(_QWORD *)v82 = v45;
              *(_WORD *)&v82[8] = 2114;
              *(_QWORD *)v83 = v15;
              *(_WORD *)&v83[8] = 2114;
              v84[0] = v46;
              _os_log_error_impl(&dword_2117D4000, v34, OS_LOG_TYPE_ERROR, "%s ERR: Failed to copy from %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);

            }
            v33 = (id)v74[5];
            v21 = v57;
            v12 = v20;
LABEL_38:

            goto LABEL_39;
          }
          v21 = v57;
LABEL_11:

          goto LABEL_12;
        }
        +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v12, "isEqualToString:", v17);

        if (v18)
          goto LABEL_9;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("meta_version.json")) & 1) != 0
          || objc_msgSend(v12, "isEqualToString:", CFSTR("enrollment_version.json")))
        {
          objc_msgSend(v15, "stringByDeletingLastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (id *)(v74 + 5);
          v55 = (id)v74[5];
          v23 = objc_msgSend(v50, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v55);
          objc_storeStrong(v22, v55);
          if ((v23 & 1) == 0)
          {
            v43 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              v48 = v74[5];
              *(_DWORD *)buf = 136315650;
              v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
              v81 = 2114;
              *(_QWORD *)v82 = v21;
              *(_WORD *)&v82[8] = 2114;
              *(_QWORD *)v83 = v48;
              _os_log_error_impl(&dword_2117D4000, v43, OS_LOG_TYPE_ERROR, "%s Cannot create %{public}@ with error %{public}@ - Skipping language", buf, 0x20u);
            }
            v33 = (id)v74[5];
            goto LABEL_38;
          }
          v24 = (id *)(v74 + 5);
          v54 = (id)v74[5];
          v25 = objc_msgSend(v50, "copyItemAtPath:toPath:error:", v13, v15, &v54);
          objc_storeStrong(v24, v54);
          v26 = v74;
          if (!v25 || v74[5])
          {
            v37 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              v47 = v26[5];
              *(_DWORD *)buf = 136315906;
              v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
              v81 = 2114;
              *(_QWORD *)v82 = v13;
              *(_WORD *)&v82[8] = 2114;
              *(_QWORD *)v83 = v15;
              *(_WORD *)&v83[8] = 2114;
              v84[0] = v47;
              _os_log_error_impl(&dword_2117D4000, v37, OS_LOG_TYPE_ERROR, "%s ERR: Cannot copy file %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
              v26 = v74;
            }
            v38 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend((id)v26[5], "localizedDescription");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", CFSTR("Failed to copy to SATUpload Diretory : %@"), v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = (void *)MEMORY[0x24BDD1540];
            v87 = CFSTR("reason");
            v88 = v40;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 721, v42);
            v33 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_38;
          }
          goto LABEL_11;
        }
LABEL_12:

        ++v10;
      }
      while (v8 != v10);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v89, 16);
      v8 = v27;
    }
    while (v27);
  }

  v28 = v70[3];
  if (v28 > 2 || (unint64_t)v66[3] > 2)
  {
    v35 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v36 = v66[3];
      *(_DWORD *)buf = 136316162;
      v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
      v81 = 1026;
      *(_DWORD *)v82 = v28;
      *(_WORD *)&v82[4] = 1026;
      *(_DWORD *)&v82[6] = v36;
      *(_WORD *)v83 = 2112;
      *(_QWORD *)&v83[2] = v49;
      LOWORD(v84[0]) = 2112;
      *(_QWORD *)((char *)v84 + 2) = v53;
      _os_log_impl(&dword_2117D4000, v35, OS_LOG_TYPE_DEFAULT, "%s Successfully copied {%{public}d,%{public}d} utterances from %@ to %@", buf, 0x2Cu);
    }
    v33 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Number of training utterances copied from %@ to %@ is too less %ld"), v49, v53, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:]";
      v81 = 2114;
      *(_QWORD *)v82 = v29;
      _os_log_error_impl(&dword_2117D4000, v30, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v31 = (void *)MEMORY[0x24BDD1540];
    v85 = CFSTR("reason");
    v86 = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 733, v32);
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_39:
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  return v33;
}

- (id)_prepareVoiceProfileWithSiriProfileId:(id)a3 withUploadBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void (**v69)(id, void *, void *);
  uint64_t v70;
  SSRVoiceProfileManager *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  id v89;
  _BYTE v90[128];
  const __CFString *v91;
  void *v92;
  const __CFString *v93;
  _QWORD v94[4];

  v94[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v69 = (void (**)(id, void *, void *))a4;
  v71 = self;
  -[SSRVoiceProfileManager _CSSATUploadPathForSiriProfileId:](self, "_CSSATUploadPathForSiriProfileId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fileExistsAtPath:", v7))
  {
    v77 = 0;
    v9 = objc_msgSend(v8, "removeItemAtPath:error:", v7, &v77);
    v10 = v77;
    v11 = v10;
    if ((v9 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v10, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Cannot delete existing SATUpload Diretory : %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
        v84 = 2114;
        v85 = v14;
        _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      v16 = (void *)MEMORY[0x24BDD1540];
      v93 = CFSTR("reason");
      v94[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v19 = 708;
LABEL_37:
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), v19, v17);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
  }
  else
  {
    v11 = 0;
  }
  v20 = v11;
  v76 = v11;
  v21 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v76);
  v11 = v76;

  if ((v21 & 1) == 0)
  {
    v47 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "localizedDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringWithFormat:", CFSTR("Cannot create SAT Upload Directory : %@"), v48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
      v84 = 2114;
      v85 = v14;
      _os_log_error_impl(&dword_2117D4000, v49, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v50 = (void *)MEMORY[0x24BDD1540];
    v91 = CFSTR("reason");
    v92 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v50;
    v19 = 709;
    goto LABEL_37;
  }
  -[SSRVoiceProfileManager _getVoiceProfilePathsToBeUploadedForSiriProfileId:](v71, "_getVoiceProfilePathsToBeUploadedForSiriProfileId:", v6);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
  if (v23)
  {
    v24 = v23;
    v65 = v8;
    v66 = v6;
    v70 = *(_QWORD *)v73;
    v67 = v22;
    v68 = v7;
    while (2)
    {
      v25 = 0;
      v26 = v11;
      do
      {
        if (*(_QWORD *)v73 != v70)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v25);
        objc_msgSend(v22, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "languageCode");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingPathComponent:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = -[SSRVoiceProfileManager _copyVoiceProfileAtPath:toPath:](v71, "_copyVoiceProfileAtPath:toPath:", v27, v30);
        v31 = *MEMORY[0x24BE284B8];
        v32 = *MEMORY[0x24BE284B8];
        if (v11)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
            v84 = 2112;
            v85 = v27;
            v86 = 2112;
            v87 = v30;
            v88 = 2114;
            v89 = v11;
            _os_log_error_impl(&dword_2117D4000, v31, OS_LOG_TYPE_ERROR, "%s Cannot copy voice profile from %@ to %@ with error %{public}@", buf, 0x2Au);
          }
          v33 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v30);
        }
        else
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
            v84 = 2112;
            v85 = v27;
            _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s Triggering upload of voice profile %@", buf, 0x16u);
          }
          v69[2](v69, v28, v30);
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            v35 = (void *)v34;
            v51 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v28, "languageCode");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "localizedDescription");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stringWithFormat:", CFSTR("Failed to upload %@ with error %@ - Bailing out"), v52, v53);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v54 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
              v84 = 2114;
              v85 = v36;
              _os_log_error_impl(&dword_2117D4000, v54, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            }
            v55 = (void *)MEMORY[0x24BDD1540];
            v80 = CFSTR("reason");
            v81 = v36;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 717, v56);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_41;
          }
          objc_msgSend(v27, "stringByAppendingPathComponent:", CFSTR("enrollment_version.json"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSRUtils getVoiceProfileIdentityFromVersionFilePath:](SSRUtils, "getVoiceProfileIdentityFromVersionFilePath:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)*MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            v38 = v37;
            objc_msgSend(v28, "productCategory");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
            v84 = 2114;
            v85 = v36;
            v86 = 2112;
            v87 = v30;
            v88 = 2114;
            v89 = v39;
            _os_log_impl(&dword_2117D4000, v38, OS_LOG_TYPE_DEFAULT, "%s Upload of voice profile with identifier %{public}@ at %@ with category %{public}@ completed successfully", buf, 0x2Au);

          }
          if (CSIsIOS())
          {
            if ((CSIsCommunalDevice() & 1) == 0)
            {
              objc_msgSend(v28, "languageCode");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = -[SSRVoiceProfileManager _isMarkedForVoiceProfileTrainingSyncForLanguage:](v71, "_isMarkedForVoiceProfileTrainingSyncForLanguage:", v40);

              if (v41)
              {
                +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", 5);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setProductCategory:", v42);

                v43 = *MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
                  v84 = 2112;
                  v85 = v27;
                  _os_log_impl(&dword_2117D4000, v43, OS_LOG_TYPE_DEFAULT, "%s Triggering upload of explicit voice profile %@", buf, 0x16u);
                }
                v69[2](v69, v28, v30);
                v44 = objc_claimAutoreleasedReturnValue();
                if (v44)
                {
                  v56 = (void *)v44;
                  v58 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v28, "languageCode");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "localizedDescription");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "stringWithFormat:", CFSTR("Failed to upload %@ with error %@ - Bailing out"), v59, v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();

                  v62 = *MEMORY[0x24BE284B8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
                    v84 = 2114;
                    v85 = v61;
                    _os_log_error_impl(&dword_2117D4000, v62, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
                  }
                  v63 = (void *)MEMORY[0x24BDD1540];
                  v78 = CFSTR("reason");
                  v79 = v61;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 717, v64);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
                  v8 = v65;
                  v6 = v66;

                  v11 = 0;
                  v17 = v67;
                  v7 = v68;
                  goto LABEL_43;
                }
                v45 = *MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v83 = "-[SSRVoiceProfileManager _prepareVoiceProfileWithSiriProfileId:withUploadBlock:]";
                  v84 = 2112;
                  v85 = v30;
                  _os_log_impl(&dword_2117D4000, v45, OS_LOG_TYPE_DEFAULT, "%s Upload of explicit voice profile at %@ completed successfully", buf, 0x16u);
                }
              }
            }
          }

          v22 = v67;
          v7 = v68;
        }

        ++v25;
        v26 = v11;
      }
      while (v24 != v25);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
      if (v24)
        continue;
      break;
    }
    v17 = v22;
    v46 = 0;
    v14 = v17;
    v8 = v65;
    v6 = v66;
  }
  else
  {
    v17 = v22;
    v46 = 0;
LABEL_43:
    v14 = v17;
  }
LABEL_44:

  return v46;
}

- (void)_markVoiceProfileTrainingSyncForLanguage:(id)a3
{
  char *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (char *)a3;
  v4 = *MEMORY[0x24BE284B8];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[SSRVoiceProfileManager _markVoiceProfileTrainingSyncForLanguage:]";
      v7 = 2114;
      v8 = v3;
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Setting VoiceProfile Training Sync for language: %{public}@", (uint8_t *)&v5, 0x16u);
    }
    _CSNotBackedupPreferencesSetValueForKey();
    CSNotBackedupInternalPreferencesSynchronize();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SSRVoiceProfileManager _markVoiceProfileTrainingSyncForLanguage:]";
    v7 = 2082;
    v8 = "-[SSRVoiceProfileManager _markVoiceProfileTrainingSyncForLanguage:]";
    _os_log_error_impl(&dword_2117D4000, v4, OS_LOG_TYPE_ERROR, "%s ERR: %{public}s: Bailing out as language is nil!", (uint8_t *)&v5, 0x16u);
  }

}

- (BOOL)_isMarkedForVoiceProfileTrainingSyncForLanguage:(id)a3
{
  id v3;
  char *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    _CSNotBackedupPreferencesValueForKey();
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_7;
    v5 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "-[SSRVoiceProfileManager _isMarkedForVoiceProfileTrainingSyncForLanguage:]";
      v11 = 2114;
      v12 = v4;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile training sync language: %{public}@, VoiceProfile language: %{public}@", (uint8_t *)&v9, 0x20u);
    }
    if (objc_msgSend(v3, "isEqualToString:", v4))
    {
      _CSNotBackedupPreferencesSetValueForKey();
      CSNotBackedupInternalPreferencesSynchronize();
      v6 = 1;
    }
    else
    {
LABEL_7:
      v6 = 0;
    }

  }
  else
  {
    v7 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[SSRVoiceProfileManager _isMarkedForVoiceProfileTrainingSyncForLanguage:]";
      v11 = 2082;
      v12 = "-[SSRVoiceProfileManager _isMarkedForVoiceProfileTrainingSyncForLanguage:]";
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: %{public}s: Bailing out as language is nil!", (uint8_t *)&v9, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)getCachedVoiceProfileAvailabilityMetaBlob
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  dispatch_time_t v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  intptr_t v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  intptr_t v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6056;
  v32 = __Block_byref_object_dispose__6057;
  v33 = 0;
  objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]";
      v5 = "%s ERR: Unknown device - returning nil";
      v6 = v8;
      v7 = 12;
      goto LABEL_8;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_15;
  }
  v3 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v2);
  if (v3 == 1)
  {
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]";
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s NonAOP device-category - returning nil", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (!v3)
  {
    v4 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]";
      v36 = 2114;
      v37 = (intptr_t)v2;
      v5 = "%s ERR: Unknown device-category for device: %{public}@";
      v6 = v4;
      v7 = 22;
LABEL_8:
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v11 = objc_alloc_init(MEMORY[0x24BE092B8]);
  v12 = dispatch_time(0, 100000000);
  v13 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __67__SSRVoiceProfileManager_getCachedVoiceProfileAvailabilityMetaBlob__block_invoke;
  v25 = &unk_24CC85D58;
  v15 = v13;
  v26 = v15;
  v27 = &v28;
  objc_msgSend(v11, "getDevicesWithAvailablePHSAssetsOnDeviceCheck:", &v22);
  v16 = dispatch_semaphore_wait(v15, v12);
  objc_msgSend(MEMORY[0x24BDBCE60], "date", v22, v23, v24, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v14);
  v19 = v18;
  v20 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]";
    v36 = 2048;
    v37 = v16;
    v38 = 2048;
    v39 = v19 * 1000.0;
    _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s CachedVoiceProfileFetch: Done Waiting with timedOut=%ld, waitTimeMs: %fms", buf, 0x20u);
  }
  v10 = (id)v29[5];

LABEL_15:
  _Block_object_dispose(&v28, 8);

  return v10;
}

- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3 withBackupMetaBlob:(id)a4
{
  char *v5;
  id v6;
  uint64_t v7;
  char *v8;
  os_log_t *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  char *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  os_log_t v17;
  const char *v18;
  os_log_t v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v23;
  char *v24;
  id v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  _UNKNOWN **v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject **v37;
  void *v38;
  NSObject *v39;
  char *v40;
  void *v41;
  _BOOL4 v43;
  _BOOL4 v44;
  os_log_t v46;
  NSObject *v47;
  char *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  char *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (char *)v7;
  v9 = (os_log_t *)MEMORY[0x24BE284B8];
  if (!v6)
  {
    v16 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
      v69 = 2114;
      v70 = v5;
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_INFO, "%s metaBlob is nil. Returning false, language: %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (v7)
  {
    v10 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v7);
    if (v10)
    {
      if (v5)
      {
        v11 = v10;
        v66 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v66);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (char *)v66;
        v14 = *v9;
        if (v13)
        {
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
            v69 = 2114;
            v70 = v13;
            _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed to deserialize metaBlob with error %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v14;
            +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v11);
            v24 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
            v69 = 2114;
            v70 = v8;
            v71 = 2114;
            v72 = v24;
            v73 = 2114;
            v74 = v12;
            _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Looking VoiceProfile for CurrDevice: %{public}@{%{public}@} in metablob %{public}@", buf, 0x2Au);

          }
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v25 = v12;
          v54 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
          if (v54)
          {
            v55 = *(_QWORD *)v63;
            v52 = v6;
            v53 = v5;
            v56 = v8;
            v51 = v25;
            v49 = v12;
            do
            {
              for (i = 0; i != v54; ++i)
              {
                if (*(_QWORD *)v63 != v55)
                  objc_enumerationMutation(v25);
                v27 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                if (objc_msgSend(v27, "isEqualToString:", v5, v49))
                {
                  v50 = i;
                  objc_msgSend(v25, "objectForKeyedSubscript:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  v61 = 0u;
                  obj = v28;
                  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
                  v30 = &off_24CC84000;
                  if (v29)
                  {
                    v31 = v29;
                    v32 = *(_QWORD *)v59;
                    while (2)
                    {
                      for (j = 0; j != v31; ++j)
                      {
                        if (*(_QWORD *)v59 != v32)
                          objc_enumerationMutation(obj);
                        v34 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                        v35 = objc_msgSend(v30[47], "deviceCategoryForDeviceProductType:", v34);
                        v36 = *v9;
                        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                        {
                          v37 = v9;
                          v38 = v30[47];
                          v39 = v36;
                          objc_msgSend(v38, "deviceCategoryStringRepresentationForCategoryType:", v11);
                          v40 = (char *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v30[47], "deviceCategoryStringRepresentationForCategoryType:", v35);
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 136316162;
                          v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
                          v69 = 2114;
                          v70 = v56;
                          v71 = 2114;
                          v72 = v40;
                          v73 = 2114;
                          v74 = v34;
                          v75 = 2114;
                          v76 = v41;
                          _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s currDevice=[%{public}@ : {%{public}@}] ; syncedDevice=[%{public}@ : {%{public}@}]",
                            buf,
                            0x34u);

                          v30 = &off_24CC84000;
                          v36 = *v37;
                        }
                        v43 = v11 == 4 && v35 == 2;
                        v44 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
                        if (v35 == v11 || v43)
                        {
                          if (v44)
                          {
                            *(_DWORD *)buf = 136315138;
                            v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
                            _os_log_impl(&dword_2117D4000, v36, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MATCH", buf, 0xCu);
                          }

                          v15 = 1;
                          v6 = v52;
                          v5 = v53;
                          v8 = (char *)v56;
                          v13 = 0;
                          v12 = v49;
                          goto LABEL_59;
                        }
                        if (v44)
                        {
                          *(_DWORD *)buf = 136315138;
                          v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
                          _os_log_impl(&dword_2117D4000, v36, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MIS-MATCH", buf, 0xCu);
                        }
                        v9 = (os_log_t *)MEMORY[0x24BE284B8];
                      }
                      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v77, 16);
                      if (v31)
                        continue;
                      break;
                    }
                  }

                  v6 = v52;
                  v5 = v53;
                  v8 = (char *)v56;
                  v25 = v51;
                  v13 = 0;
                  i = v50;
                }
              }
              v54 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
              v12 = v49;
            }
            while (v54);
          }

          v46 = *v9;
          v15 = 0;
          if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            goto LABEL_59;
          v47 = v46;
          +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v11);
          v48 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
          v69 = 2114;
          v70 = v8;
          v71 = 2114;
          v72 = v48;
          _os_log_impl(&dword_2117D4000, v47, OS_LOG_TYPE_DEFAULT, "%s CurrDevice: [%{public}@ : {%{public}@}] DOES NOT have VoiceProfile synced in iCloud", buf, 0x20u);

        }
        v15 = 0;
LABEL_59:

        goto LABEL_20;
      }
      v17 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
        v69 = 2082;
        v70 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
        v18 = "%s ERR: %{public}s: Bailing out as language is nil!";
        goto LABEL_17;
      }
    }
    else
    {
      v19 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
        v69 = 2114;
        v70 = v8;
        v71 = 2114;
        v72 = v5;
        v18 = "%s ERR: Unknown device-category for device: %{public}@, languageCode: %{public}@";
        v20 = v19;
        v21 = 32;
LABEL_18:
        _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, v18, buf, v21);
      }
    }
  }
  else
  {
    v17 = (os_log_t)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:]";
      v69 = 2114;
      v70 = v5;
      v18 = "%s ERR: Unknown device. Returning false, language: %{public}@";
LABEL_17:
      v20 = v17;
      v21 = 22;
      goto LABEL_18;
    }
  }
LABEL_19:
  v13 = 0;
  v15 = 0;
LABEL_20:

  return v15;
}

- (void)isVoiceProfileUploadedToiCloudForLanguageCode:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void **v24;
  const __CFString **v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(id, void *, _QWORD);
  unint64_t v36;
  BOOL v37;
  const __CFString *v38;
  id v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Unknown product type. Returning false, language: %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
      v46 = 2114;
      v47 = v11;
      _os_log_error_impl(&dword_2117D4000, v21, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v42 = CFSTR("reason");
    v43 = v11;
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = &v43;
    v25 = &v42;
    goto LABEL_18;
  }
  v8 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v7);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Unknown device-category for device: %@, languageCode: %@"), v7, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
      v46 = 2114;
      v47 = v11;
      _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v40 = CFSTR("reason");
    v41 = v11;
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = &v41;
    v25 = &v40;
LABEL_18:
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 711, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v20, 0);
    goto LABEL_19;
  }
  v9 = v8;
  +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", 0, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v17 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
      v46 = 2114;
      v47 = v5;
      _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s Querying VoiceProfile upload state on %{public}@", buf, 0x16u);
    }
    v18 = objc_alloc_init(MEMORY[0x24BE092B8]);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __92__SSRVoiceProfileManager_isVoiceProfileUploadedToiCloudForLanguageCode_withCompletionBlock___block_invoke;
    v30[3] = &unk_24CC85D80;
    v31 = v18;
    v32 = 0;
    v35 = v6;
    v33 = v7;
    v36 = v9;
    v34 = v5;
    v37 = v11 != 0;
    v19 = v18;
    objc_msgSend(v19, "getDevicesWithAvailablePHSAssetsOnDeviceCheck:", v30);

    v20 = v31;
    goto LABEL_19;
  }
  objc_msgSend(v10, "getExplicitEnrollmentUtterancesForType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(v11, "getExplicitEnrollmentUtterancesForType:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (objc_msgSend(v11, "isMarkedSATEnrolled") && (unint64_t)(v15 + v13) >= 3)
  {
    v16 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
      v46 = 2114;
      v47 = v5;
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s Triggering VoiceProfile upload for %{public}@", buf, 0x16u);
    }
    notify_post("com.apple.voicetrigger.PHSProfileModified");
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Improper VoiceProfile detected: %@, languageCode: %@"), v7, v5);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]";
    v46 = 2114;
    v47 = v19;
    _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  v28 = (void *)MEMORY[0x24BDD1540];
  v38 = CFSTR("reason");
  v39 = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 711, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v29, 0);

LABEL_19:
}

- (id)createEnrollmentId
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE284B8];
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating an enrollmentID...", (uint8_t *)&v21, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateWhenEnrollmentIdForVoiceProfileiCloudMetricsWasCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enrollmentIdForVoiceProfileiCloudMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s No enrollmentId exists, create new one", (uint8_t *)&v21, 0xCu);
    }
    -[SSRVoiceProfileManager _createAndSetNewEnrollmentId](self, "_createAndSetNewEnrollmentId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v13, "setMonth:", -6);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v13, v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v6, "compare:", v15);
    v17 = *v3;
    v18 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
    if (v16 == -1)
    {
      if (v18)
      {
        v21 = 136315394;
        v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s The date %@ is older than 6 months ago.", (uint8_t *)&v21, 0x16u);
      }
      -[SSRVoiceProfileManager _createAndSetNewEnrollmentId](self, "_createAndSetNewEnrollmentId");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v18)
      {
        v21 = 136315394;
        v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s The date %@ is within 6 months. Reusing enrollment ID", (uint8_t *)&v21, 0x16u);
        v17 = *v3;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315394;
        v22 = "-[SSRVoiceProfileManager createEnrollmentId]";
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s Returning enrollment ID %@...", (uint8_t *)&v21, 0x16u);
      }
      v19 = v8;
    }
    v11 = v19;

  }
  return v11;
}

- (id)_createAndSetNewEnrollmentId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnrollmentIdForVoiceProfileiCloudMetrics:on:", v4, v2);

  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SSRVoiceProfileManager _createAndSetNewEnrollmentId]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Returning enrollment ID %@...", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (void)emitMetricEnrollmentId:(id)a3 isVoiceProfileiCloudSyncSuccess:(BOOL)a4 failureReasonIfAny:(id)a5 forLocale:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  os_log_t *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  _BYTE v17[22];
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v8 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (os_log_t *)MEMORY[0x24BE284B8];
  v13 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    *(_DWORD *)v17 = 136315906;
    *(_QWORD *)&v17[4] = "-[SSRVoiceProfileManager emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:]";
    if (v8)
      v14 = CFSTR("YES");
    *(_WORD *)&v17[12] = 2112;
    *(_QWORD *)&v17[14] = v9;
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Emitting voice profile icloud sync metrics for enrollmentID %@, isSuccess %@, for reason %@...", v17, 0x2Au);
  }
  objc_msgSend(MEMORY[0x24BE284A0], "sharedLogger", *(_OWORD *)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logVoiceProfileICloudSyncFinishedForEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:", v9, v8, v10, v11);

  v16 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)&v17[4] = "-[SSRVoiceProfileManager emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:]";
    _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s Finished emitting voice profile icloud sync metrics.", v17, 0xCu);
  }

}

- (BOOL)hasVoiceProfileIniCloudForLanguageCode:(id)a3
{
  char *v4;
  void *v5;
  char *v6;
  _UNKNOWN **v7;
  unint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _UNKNOWN **v28;
  void *v29;
  _BOOL4 v31;
  _BOOL4 v32;
  os_log_t v34;
  BOOL v35;
  void *v36;
  NSObject *v37;
  char *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  NSObject *v43;
  const __CFString *v44;
  SSRVoiceProfileManager *v45;
  void *v46;
  char *v47;
  SSRVoiceProfileManager *v49;
  void *v50;
  char *v51;
  id v52;
  const char *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  char *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  -[SSRVoiceProfileManager createEnrollmentId](self, "createEnrollmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v39 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
LABEL_33:
      v44 = CFSTR("Unknown device");
      v45 = self;
      v46 = v5;
      v47 = v4;
LABEL_34:
      -[SSRVoiceProfileManager emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:](v45, "emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:", v46, 0, v44, v47);
      v35 = 0;
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315394;
    v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
    v60 = 2114;
    v61 = v4;
    v40 = "%s ERR: Unknown device. Returning false, language: %{public}@";
    v41 = v39;
    v42 = 22;
LABEL_44:
    _os_log_error_impl(&dword_2117D4000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);
    goto LABEL_33;
  }
  v7 = &off_24CC84000;
  v8 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v6);
  if (!v8)
  {
    v43 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_DWORD *)buf = 136315650;
    v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
    v60 = 2114;
    v61 = v6;
    v62 = 2114;
    v63 = v4;
    v40 = "%s ERR: Unknown device-category for device: %{public}@, languageCode: %{public}@";
    v41 = v43;
    v42 = 32;
    goto LABEL_44;
  }
  v9 = (os_log_t *)MEMORY[0x24BE284B8];
  v10 = *MEMORY[0x24BE284B8];
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
      v60 = 2082;
      v61 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
      _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ERR: %{public}s: Bailing out as language is nil!", buf, 0x16u);
    }
    v44 = CFSTR("Unknown language");
    v45 = self;
    v46 = v5;
    v47 = 0;
    goto LABEL_34;
  }
  v11 = v8;
  v50 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v10;
    +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v11);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
    v60 = 2114;
    v61 = v6;
    v62 = 2114;
    v63 = v13;
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Searching for synced-VoiceProfile for CurrDevice: %{public}@{%{public}@}", buf, 0x20u);

  }
  v53 = v6;
  v49 = self;
  v51 = v4;
  -[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:](self, "devicesWithVoiceProfileIniCloudForLanguage:", v4);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v55;
    v52 = v14;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v55 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        v20 = objc_msgSend(v7[47], "deviceCategoryForDeviceProductType:", v19);
        v21 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v7[47];
          v23 = v21;
          objc_msgSend(v22, "deviceCategoryStringRepresentationForCategoryType:", v11);
          v24 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7[47], "deviceCategoryStringRepresentationForCategoryType:", v20);
          v25 = v16;
          v26 = v11;
          v27 = v17;
          v28 = v7;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
          v60 = 2114;
          v61 = v53;
          v62 = 2114;
          v63 = v24;
          v64 = 2114;
          v65 = v19;
          v66 = 2114;
          v67 = v29;
          _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s currDevice=[%{public}@ : {%{public}@}] ; syncedDevice=[%{public}@ : {%{public}@}]",
            buf,
            0x34u);

          v7 = v28;
          v17 = v27;
          v11 = v26;
          v16 = v25;

          v14 = v52;
          v9 = (os_log_t *)MEMORY[0x24BE284B8];

          v21 = *v9;
        }
        v31 = v11 == 4 && v20 == 2;
        v32 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v20 == v11 || v31)
        {
          if (v32)
          {
            *(_DWORD *)buf = 136315138;
            v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
            _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MATCH", buf, 0xCu);
          }
          v35 = 1;
          v5 = v50;
          v4 = v51;
          -[SSRVoiceProfileManager emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:](v49, "emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:", v50, 1, CFSTR("not-applicable, no-failure"), v51);

          v6 = (char *)v53;
          goto LABEL_38;
        }
        if (v32)
        {
          *(_DWORD *)buf = 136315138;
          v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
          _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MIS-MATCH", buf, 0xCu);
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      if (v16)
        continue;
      break;
    }
  }

  v5 = v50;
  v4 = v51;
  -[SSRVoiceProfileManager emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:](v49, "emitMetricEnrollmentId:isVoiceProfileiCloudSyncSuccess:failureReasonIfAny:forLocale:", v50, 0, CFSTR("Voice Profile Mismatch"), v51);
  v34 = *v9;
  v35 = 0;
  v6 = (char *)v53;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v7[47];
    v37 = v34;
    objc_msgSend(v36, "deviceCategoryStringRepresentationForCategoryType:", v11);
    v38 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v59 = "-[SSRVoiceProfileManager hasVoiceProfileIniCloudForLanguageCode:]";
    v60 = 2114;
    v61 = v53;
    v62 = 2114;
    v63 = v38;
    _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s CurrDevice: [%{public}@ : {%{public}@}] DOES NOT have VoiceProfile synced in iCloud", buf, 0x20u);

    v35 = 0;
  }
LABEL_38:

LABEL_39:
  return v35;
}

- (void)enableVoiceTriggerUponVoiceProfileSyncForLanguage:(id)a3
{
  char *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (char *)a3;
  v4 = *MEMORY[0x24BE284B8];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[SSRVoiceProfileManager enableVoiceTriggerUponVoiceProfileSyncForLanguage:]";
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Will Enable VoiceTrigger after VoiceProfile sync for language: %{public}@", buf, 0x16u);
    }
    _CSNotBackedupPreferencesSetValueForKey();
    if (CSIsInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _CSNotBackedupPreferencesValueForKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = objc_msgSend(v6, "mutableCopy");

        v5 = (void *)v8;
      }
      objc_msgSend(MEMORY[0x24BE28488], "deviceBuildVersion", CFSTR("buildVersion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = CFSTR("timestamp");
      v13[0] = v9;
      +[SSRUtils timeStampString](SSRUtils, "timeStampString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("EnableVTUponVoiceProfileSync"));
      _CSNotBackedupPreferencesSetValueForKey();

    }
    CSNotBackedupInternalPreferencesSynchronize();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[SSRVoiceProfileManager enableVoiceTriggerUponVoiceProfileSyncForLanguage:]";
    v16 = 2082;
    v17 = "-[SSRVoiceProfileManager enableVoiceTriggerUponVoiceProfileSyncForLanguage:]";
    _os_log_error_impl(&dword_2117D4000, v4, OS_LOG_TYPE_ERROR, "%s ERR: %{public}s: Bailing out as language is nil!", buf, 0x16u);
  }

}

- (id)devicesWithVoiceProfileIniCloudForLanguage:(id)a3
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  void *v6;
  id v7;
  dispatch_semaphore_t v8;
  dispatch_time_t v9;
  id v10;
  NSObject *v11;
  intptr_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  id v17;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  _BYTE *v22;
  uint8_t v23[4];
  const char *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (NSObject **)MEMORY[0x24BE284B8];
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s \nlanguageCode: %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BE092B8]);
  v8 = dispatch_semaphore_create(0);
  v9 = dispatch_time(0, 5000000000);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__6056;
  v31 = __Block_byref_object_dispose__6057;
  v32 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__SSRVoiceProfileManager_devicesWithVoiceProfileIniCloudForLanguage___block_invoke;
  v19[3] = &unk_24CC85DA8;
  v10 = v3;
  v20 = v10;
  v22 = buf;
  v11 = v8;
  v21 = v11;
  objc_msgSend(v7, "getDevicesWithAvailablePHSAssetsForLanguage:completion:", v10, v19);
  v12 = dispatch_semaphore_wait(v11, v9);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *v4;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 136315650;
      v24 = "-[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:]";
      v25 = 2050;
      v26 = *(double *)&v12;
      v27 = 1026;
      v28 = 5000;
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Timedout waiting for AFSettingsConnection:getDevicesWithAvailablePHSAssetsForLanguage: %{public}ld, waitedFor: %{public}d, Returning nil", v23, 0x1Cu);
    }
  }
  else
  {
    v15 = v14;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "timeIntervalSinceDate:", v6);
      *(_DWORD *)v23 = 136315394;
      v24 = "-[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:]";
      v25 = 2050;
      v26 = v16 * 1000.0;
      _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s timeToRet(AFSettingsConnection:getDevicesWithAvailablePHSAssetsForLanguage:): %{public}fms", v23, 0x16u);
    }

  }
  v17 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v17;
}

- (BOOL)_isDirectory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v7;

  v7 = 0;
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v7);

  return v7;
}

- (id)_CSSATLegacyUploadPath
{
  void *v2;
  void *v3;

  -[SSRVoiceProfileManager baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Caches/VoiceTrigger/SATLegacyUpload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)provisionedVoiceProfilesForAppDomain:(id)a3 withLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userVoiceProfilesForAppDomain:forLocale:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_6076);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[SSRVoiceProfileManager provisionedVoiceProfilesForAppDomain:withLocale:]";
      v15 = 2114;
      v16 = v5;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s voiceProfileArray is nil for %{public}@ and %{public}@!", (uint8_t *)&v13, 0x20u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)provisionedVoiceProfilesForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SSRVoiceProfileMetaContext *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userVoiceProfilesForLocale:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v5 && objc_msgSend(v5, "count"))
  {
    v19 = v4;
    v20 = v3;
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:");
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_196);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SSRVoiceProfileMetaContext initWithVoiceProfile:]([SSRVoiceProfileMetaContext alloc], "initWithVoiceProfile:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSRVoiceProfileMetaContext setProductCategory:](v13, "setProductCategory:", v14);

          -[SSRVoiceProfileMetaContext setVersion:](v13, "setVersion:", &unk_24CC9A0D0);
          objc_msgSend(v6, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }
    v15 = v6;

    v4 = v19;
    v3 = v20;
  }
  else
  {
    v16 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SSRVoiceProfileManager provisionedVoiceProfilesForLocale:]";
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s voiceProfileArray is nil!", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (id)voiceProfileForId:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userVoiceProfileForVoiceProfileID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getVoiceProfileAnalyticsForAppDomain:(id)a3 withLocale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  float v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userVoiceProfilesForAppDomain:forLocale:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 3;
    v33 = v6;
    objc_msgSend(v11, "installedAssetOfType:forLanguage:", 3, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13;
    if ((CSIsCommunalDevice() & 1) == 0)
    {
      if ((CSIsIOS() & 1) != 0 || CSIsAppleSiliconMac())
      {
        objc_msgSend(v14, "psrCombinationWeight");
        if (((v15 == 1.0) & objc_msgSend(v14, "useTDTIEnrollment")) != 0)
          v12 = 3;
        else
          v12 = 1;
      }
      else
      {
        v12 = 1;
      }
    }
    v32 = v7;
    v34 = v5;
    v31 = v14;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v9;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v31);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "profileID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("profileID"));

          v24 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v21, "getExplicitEnrollmentUtterancesForType:", v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v26, CFSTR("numExplicitUtt"));

          v27 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v21, "getImplicitEnrollmentUtterancesForType:", v12);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v29, CFSTR("numImplicitUtt"));

          objc_msgSend(v10, "addObject:", v22);
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v18);
    }

    v6 = v33;
    v5 = v34;
    v7 = v32;
  }
  else
  {
    v16 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[SSRVoiceProfileManager getVoiceProfileAnalyticsForAppDomain:withLocale:]";
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s voiceProfileArray is nil!", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)isVoiceTriggerRepromptRequired
{
  void *v2;
  double v3;
  double v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  _BOOL4 v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  dispatch_semaphore_t v22;
  dispatch_time_t v23;
  NSObject *v24;
  NSObject *v25;
  double v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  NSObject *v30;
  double v31;
  NSObject *v32;
  const __CFString *v33;
  void *v34;
  double v35;
  double v36;
  NSObject *v37;
  void *v38;
  int v39;
  NSObject *v40;
  const __CFString *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSString *lastRepromptedDate;
  void *v48;
  id v51;
  _QWORD v52[4];
  NSObject *v53;
  _BYTE *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t v67[4];
  const char *v68;
  __int16 v69;
  double v70;
  __int16 v71;
  void *v72;
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  v4 = v3;

  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Checking if isVoiceTriggerRepromptRequired...", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "forceRePromptVoiceTrigger");

  v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Checking if already reprompted...", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateWhenVoiceTriggerRePrompted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if (v8)
      v13 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Force re-prompt preference config value %@", buf, 0x16u);
    v12 = *v5;
  }
  v14 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (!v14)
      goto LABEL_18;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    v18 = "%s Not RePrompted before";
    v19 = v12;
LABEL_17:
    _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
LABEL_18:
    v20 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s Setting up AFSettingsConnection...", buf, 0xCu);
    }
    v51 = objc_alloc_init(MEMORY[0x24BE092B8]);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dispatch_semaphore_create(0);
    v23 = dispatch_time(0, 5000000000);
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v74 = __Block_byref_object_copy__6056;
    v75 = __Block_byref_object_dispose__6057;
    v76 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__6056;
    v61 = __Block_byref_object_dispose__6057;
    v62 = 0;
    v24 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 136315138;
      v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      _os_log_impl(&dword_2117D4000, v24, OS_LOG_TYPE_DEFAULT, "%s Fetching active account using AFSettingConnection...", v67, 0xCu);
    }
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __56__SSRVoiceProfileManager_isVoiceTriggerRepromptRequired__block_invoke;
    v52[3] = &unk_24CC85E48;
    v54 = buf;
    v55 = &v57;
    v56 = &v63;
    v25 = v22;
    v53 = v25;
    objc_msgSend(v51, "fetchActiveAccount:", v52);
    v26 = COERCE_DOUBLE(dispatch_semaphore_wait(v25, v23));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *v5;
    if (v26 == 0.0)
    {
      v30 = v28;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v27, "timeIntervalSinceDate:", v21);
        *(_DWORD *)v67 = 136315394;
        v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
        v69 = 2050;
        v70 = v31 * 1000.0;
        _os_log_impl(&dword_2117D4000, v30, OS_LOG_TYPE_DEFAULT, "%s timeToRet(AFSettingsConnection:fetchActiveAccount:): %{public}fms", v67, 0x16u);
      }

    }
    else if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 136315650;
      v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      v69 = 2050;
      v70 = v26;
      v71 = 1026;
      LODWORD(v72) = 5000;
      _os_log_impl(&dword_2117D4000, v28, OS_LOG_TYPE_DEFAULT, "%s Timedout waiting for AFSettingsConnection:fetchActiveAccount: %{public}ld, waitedFor: %{public}d, Returning false", v67, 0x1Cu);
    }
    v32 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v64 + 24))
        *(double *)&v33 = COERCE_DOUBLE(CFSTR("YES"));
      else
        *(double *)&v33 = COERCE_DOUBLE(CFSTR("NO"));
      *(_DWORD *)v67 = 136315394;
      v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      v69 = 2112;
      v70 = *(double *)&v33;
      _os_log_impl(&dword_2117D4000, v32, OS_LOG_TYPE_DEFAULT, "%s Result of isVoiceTriggerRepromptRequired is %@...", v67, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "systemUptime");
    v36 = v35;

    v37 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v67 = 136315394;
      v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
      v69 = 2050;
      v70 = (v36 - v4) * 1000.0;
      _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s isVoiceTriggerRePrompt required check if re prompt is required took %{public}.3fms", v67, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "forceSetRePromptRequired");

    if ((CSIsInternalBuild() & v39 & 1) != 0)
    {
      v40 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        if (*((_BYTE *)v64 + 24))
          *(double *)&v41 = COERCE_DOUBLE(CFSTR("YES"));
        else
          *(double *)&v41 = COERCE_DOUBLE(CFSTR("NO"));
        *(_DWORD *)v67 = 136315394;
        v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
        v69 = 2112;
        v70 = *(double *)&v41;
        _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s Forcing isRePromptRequired to YES overriding it's original value of: %@", v67, 0x16u);
      }
      *((_BYTE *)v64 + 24) = v39;
      if (v39)
        goto LABEL_45;
    }
    else if (*((_BYTE *)v64 + 24))
    {
LABEL_45:
      v42 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setLocale:", v43);

      objc_msgSend(v42, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringFromDate:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        lastRepromptedDate = self->_lastRepromptedDate;
        *(_DWORD *)v67 = 136315650;
        v68 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
        v69 = 2112;
        v70 = *(double *)&lastRepromptedDate;
        v71 = 2112;
        v72 = v45;
        _os_log_impl(&dword_2117D4000, v46, OS_LOG_TYPE_DEFAULT, "%s RePrompted. Updating _lastRepromptedDate from %@ to %@", v67, 0x20u);
      }
      objc_storeStrong((id *)&self->_lastRepromptedDate, v45);
      objc_msgSend(MEMORY[0x24BE28490], "sharedLogger");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "logRePromptFinishedWithSiriSpeechID:withRePromptDate:withIsRePrompted:withLocale:", v58[5], self->_lastRepromptedDate, *((unsigned __int8 *)v64 + 24), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

      v29 = *((_BYTE *)v64 + 24) != 0;
      goto LABEL_50;
    }
    v29 = 0;
LABEL_50:

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v63, 8);
    goto LABEL_51;
  }
  if (v14)
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Already RePrompted on %@", buf, 0x16u);
  }
  v15 = CSIsInternalBuild() & v8;
  v16 = *v5;
  v17 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
  if (v15 == 1)
  {
    if (!v17)
      goto LABEL_18;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    v18 = "%s Force re-prompt enabled. Continuing with RePrompt..";
    v19 = v16;
    goto LABEL_17;
  }
  if (v17)
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]";
    _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s RePrompt is not required. Return false.", buf, 0xCu);
  }
  v29 = 0;
LABEL_51:

  return v29;
}

- (void)isVoiceTriggerRepromptRequiredWithCompletion:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequiredWithCompletion:]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s not-implemented. return false.", (uint8_t *)&v4, 0xCu);
  }
}

- (id)voiceTriggerRepromptFinished
{
  os_log_t *v3;
  NSObject *v4;
  NSString *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE284B8];
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SSRVoiceProfileManager voiceTriggerRepromptFinished]";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Running VoiceTriggerRePromptFinised...", (uint8_t *)&v10, 0xCu);
  }
  v5 = self->_lastRepromptedDate;
  v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[SSRVoiceProfileManager voiceTriggerRepromptFinished]";
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Storing VoiceTriggerRePromptFinished on date %@", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "voiceTriggerRePromptFinishedWithDate:", v5);

  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SSRVoiceProfileManager voiceTriggerRepromptFinished]";
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Done VoiceTriggerRePromptFinised!", (uint8_t *)&v10, 0xCu);
  }

  return 0;
}

- (void)voiceTriggerRepromptFinishedWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD))a3;
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SSRVoiceProfileManager voiceTriggerRepromptFinishedWithCompletion:]";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Not-implemented", (uint8_t *)&v5, 0xCu);
  }
  v3[2](v3, 0);

}

- (void)triggerVoiceProfileMigrationWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "migrateVoiceProfilesIfNeededWithCompletionBlock:", v3);

}

- (void)migrateTDVoiceProfilesToTDTI
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t i;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE28488], "getSiriLanguageWithFallback:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userVoiceProfilesForAppDomain:forLocale:", CFSTR("com.apple.siri"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = (os_log_t *)MEMORY[0x24BE284B8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "copyTDAudioToTDTI");
        v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          objc_msgSend(v11, "voiceProfileBasePath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v20 = "-[SSRVoiceProfileManager migrateTDVoiceProfilesToTDTI]";
          v21 = 2112;
          v22 = v14;
          _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Triggering td profile migration for profile: %@", buf, 0x16u);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v7);
  }

}

- (void)triggerInvalidSiriProfileCleanupFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cleanupInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:", v6, v5);

}

- (BOOL)triggerVoiceProfileDuplicatesCleanup
{
  void *v2;
  char v3;

  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cleanupDuplicatedProfiles");

  return v3;
}

- (void)triggerVoiceProfileCleanupWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanupVoiceProfileStore:", v3);

}

- (void)cleanupVoiceProfileModelFilesForLocale:(id)a3 withAsset:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cleanupVoiceProfileModelFilesForLocale:withAsset:", v6, v5);

}

- (void)pruneImplicitUtterancesOfProfile:(id)a3 withAsset:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  SSRVoiceProfilePruner *v8;

  v5 = a4;
  v6 = a3;
  v8 = objc_alloc_init(SSRVoiceProfilePruner);
  if (CSIsCommunalDevice())
    v7 = 3;
  else
    v7 = 1;
  -[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:](v8, "pruneVoiceProfile:forSpIdType:withAsset:", v6, v7, v5);

}

- (void)triggerVoiceProfileDownload
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.PHSProfileDownloadTrigger"), 0);

}

- (void)triggerRetrainingVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (v7)
  {
    +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profileID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userVoiceProfileForVoiceProfileID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "retrainVoiceProfile:withContext:withCompletion:", v12, v8, v9);
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "profileID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("ERR: Voice Profile not found for Id %@ - Bailing out"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SSRVoiceProfileManager triggerRetrainingVoiceProfile:withContext:withCompletion:]";
        v29 = 2114;
        v30 = v18;
        _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      v20 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FC8];
      v24 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 731, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v22);

      v12 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Voice Profile sent as nil - Bailing out"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SSRVoiceProfileManager triggerRetrainingVoiceProfile:withContext:withCompletion:]";
      v29 = 2114;
      v30 = v10;
      _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v26 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 731, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v15);

  }
}

- (id)markSATEnrollmentSuccessForVoiceProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "markSATEnrollmentSuccess"))
    {
      if (CSIsIOS() && (CSIsCommunalDevice() & 1) == 0)
      {
        objc_msgSend(v4, "locale");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVoiceProfileManager _markVoiceProfileTrainingSyncForLanguage:](self, "_markVoiceProfileTrainingSyncForLanguage:", v6);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v20 = __Block_byref_object_copy__6056;
      v21 = __Block_byref_object_dispose__6057;
      v22 = 0;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __66__SSRVoiceProfileManager_markSATEnrollmentSuccessForVoiceProfile___block_invoke;
      v18[3] = &unk_24CC85E70;
      v18[4] = buf;
      objc_msgSend(v5, "addUserVoiceProfile:withContext:withCompletion:", v4, 0, v18);
      v7 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "profileID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("ERR: Failed in marking Enrollment as Successful for profile %@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v13;
        _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      v15 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FC8];
      v24 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 723, v16);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Voice Profile sent as nil - Bailing out"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v26[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 731, v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)isSATEnrolledForSiriProfileId:(id)a3 forLanguageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  char v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SSRVoiceProfileStorePrefs sharedStorePrefs](SSRVoiceProfileStorePrefs, "sharedStorePrefs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "getVoiceProfileStoreVersion");

  if (v9 == -1)
  {
    v12 = -[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:](self, "_isLegacyEnrollmentMarkedWith:forLanguageCode:", CFSTR("enrollment_completed"), v7);
  }
  else
  {
    +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "-[SSRVoiceProfileManager isSATEnrolledForSiriProfileId:forLanguageCode:]";
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Profiles already migrated, check for enrollment on %{public}@ on profile %{public}@", (uint8_t *)&v14, 0x20u);
    }
    if (v10)
      v12 = objc_msgSend(v10, "isMarkedSATEnrolled");
    else
      v12 = 0;

  }
  return v12;
}

- (BOOL)isSATEnrollmentMigratedForSiriProfileId:(id)a3 forLanguageCode:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isMarkedSATMigrated");
  else
    v6 = 0;

  return v6;
}

- (BOOL)_isRemoteVoiceTriggerAvailable
{
  return 0;
}

- (id)deleteUserVoiceProfile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  NSObject *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Voice Profile passed is nil - Bailing out"));
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[SSRVoiceProfileManager deleteUserVoiceProfile:]";
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v12, 0x16u);
    }
    v10 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 731, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteUserVoiceProfile:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v3, "profileID");
      v8 = objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[SSRVoiceProfileManager deleteUserVoiceProfile:]";
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v5;
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete Voice Profile %{public}@ with error %{public}@", (uint8_t *)&v12, 0x20u);
LABEL_8:

    }
  }

  return v5;
}

- (void)deleteAllVoiceProfilesForAppDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t i;
  void *v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  SSRVoiceProfileManager *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  SSRVoiceProfileManager *v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v28 = self;
  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v3;
  objc_msgSend(v4, "userVoiceProfilesForAppDomain:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    v9 = (os_log_t *)MEMORY[0x24BE284B8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v4, "deleteUserVoiceProfile:", v11, v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            v14 = v13;
            objc_msgSend(v11, "profileID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v37 = "-[SSRVoiceProfileManager deleteAllVoiceProfilesForAppDomain:]";
            v38 = 2114;
            v39 = v15;
            v40 = 2114;
            v41 = v12;
            _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete Voice Profile %{public}@ with error %{public}@", buf, 0x20u);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v7);
  }
  v16 = v28;
  -[SSRVoiceProfileManager SSRBasePathForAppDomain:](v28, "SSRBasePathForAppDomain:", v29, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v17, 0))
  {
    v31 = 0;
    objc_msgSend(v18, "removeItemAtPath:error:", v17, &v31);
    v19 = v31;
    if (v19)
    {
      v20 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v24 = v20;
        objc_msgSend(v19, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v37 = "-[SSRVoiceProfileManager deleteAllVoiceProfilesForAppDomain:]";
        v38 = 2112;
        v39 = v17;
        v40 = 2112;
        v41 = v25;
        _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s Couldn't delete SAT directory at path %@ %@", buf, 0x20u);

      }
    }

  }
  -[SSRVoiceProfileManager _CSSATCachePath](v16, "_CSSATCachePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v21, 0))
  {
    v30 = 0;
    objc_msgSend(v18, "removeItemAtPath:error:", v21, &v30);
    v22 = v30;
    if (v22)
    {
      v23 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v26 = v23;
        objc_msgSend(v22, "localizedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v37 = "-[SSRVoiceProfileManager deleteAllVoiceProfilesForAppDomain:]";
        v38 = 2112;
        v39 = v21;
        v40 = 2112;
        v41 = v27;
        _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s Couldn't delete SAT cache directory at path %@ %@", buf, 0x20u);

      }
    }

  }
}

- (id)_CSSATCachePath
{
  return (id)objc_msgSend(0, "stringByAppendingPathComponent:", CFSTR("Library/Caches/VoiceTrigger"));
}

- (id)_CSSATDownloadPath
{
  void *v2;
  void *v3;

  -[SSRVoiceProfileManager baseDir](self, "baseDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Caches/VoiceTrigger/SATUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_CSSATCachePathForAppDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Caches/VoiceTrigger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  -[SSRVoiceProfileManager baseDir](self, "baseDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_CSSATUploadPathForSiriProfileId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Caches/VoiceTrigger/SATUpload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  -[SSRVoiceProfileManager baseDir](self, "baseDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_isLegacyEnrollmentMarkedWith:(id)a3 forLanguageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  NSObject **v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v17 = *MEMORY[0x24BE284B8];
    v16 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v22 = 136315138;
    v23 = "-[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:]";
    _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s Language Code is nil!", (uint8_t *)&v22, 0xCu);
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  -[SSRVoiceProfileManager SSRSpeakerProfilesBasePath](self, "SSRSpeakerProfilesBasePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v9, 0))
  {
    v18 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315394;
      v23 = "-[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:]";
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s SAT path doesnt exist - %@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_17;
  }
  objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("td/audio"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v11, 0))
  {
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self ENDSWITH '.wav'"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 || !objc_msgSend(v15, "count"))
  {
    v19 = (NSObject **)MEMORY[0x24BE284B8];
    v20 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = "-[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:]";
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s No Audio file exists when enrollment marker is set, remove marker", (uint8_t *)&v22, 0xCu);
      v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "-[SSRVoiceProfileManager _isLegacyEnrollmentMarkedWith:forLanguageCode:]";
      v24 = 2114;
      v25 = v13;
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s Contents of audio dir - %{public}@", (uint8_t *)&v22, 0x16u);
    }
    objc_msgSend(v10, "removeItemAtPath:error:", v11, 0);

    goto LABEL_16;
  }

  v16 = 1;
LABEL_19:

  return v16;
}

- (void)importVoiceProfile:(id)a3 appDomain:(id)a4 withSharedUserId:(id)a5 withLocale:(id)a6 withAsset:(id)a7 withCompletion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(_QWORD, _QWORD);
  id v21;
  void *v22;
  id *v23;
  const __CFString **v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  os_log_t *v29;
  NSObject *v30;
  NSObject *v31;
  SSRVoiceProfileRetrainingContext *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  SSRVoiceProfileRetrainingContext *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  void (**v46)(_QWORD, _QWORD);
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  const __CFString *v60;
  id v61;
  _QWORD v62[2];
  _QWORD v63[5];

  v63[2] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __108__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_withCompletion___block_invoke;
  v52[3] = &unk_24CC85E98;
  v19 = v18;
  v53 = v19;
  v20 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BE197C](v52);
  if (v13 && v14 && v16)
  {
    v21 = -[SSRVoiceProfile initNewVoiceProfileWithLocale:withAppDomain:]([SSRVoiceProfile alloc], "initNewVoiceProfileWithLocale:withAppDomain:", v16, v14);
    objc_msgSend(v21, "setSharedSiriProfileId:", v15);
    v39 = v15;
    if (v17)
    {
      v62[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
      v62[1] = CFSTR("SSRVoiceRetrainingAsset");
      v63[0] = v21;
      v63[1] = v17;
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = (id *)v63;
      v24 = (const __CFString **)v62;
      v25 = 2;
    }
    else
    {
      v60 = CFSTR("SSRVoiceRetrainingVoiceProfile");
      v61 = v21;
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = &v61;
      v24 = &v60;
      v25 = 1;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
    v51 = 0;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]([SSRVoiceProfileRetrainingContext alloc], "initWithVoiceRetrainingContext:error:", v42, &v51);
    v26 = v51;
    +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v26;
    objc_msgSend(v27, "subpathsOfDirectoryAtPath:error:", v13, &v50);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v50;

    v29 = (os_log_t *)MEMORY[0x24BE284B8];
    v30 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v55 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:withCompletion:]";
      v56 = 2112;
      v57 = v43;
      _os_log_impl(&dword_2117D4000, v30, OS_LOG_TYPE_DEFAULT, "%s fileList - %@", buf, 0x16u);
    }
    v40 = v19;
    v41 = v17;
    if (v28)
    {
      v31 = *v29;
      if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v55 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:withCompletion:]";
        v56 = 2112;
        v57 = v13;
        v58 = 2112;
        v59 = v28;
        _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s ERR: Fetching contents of %@ failed with error - %@", buf, 0x20u);
      }
      ((void (**)(_QWORD, id))v20)[2](v20, v28);
      v32 = v38;
      v15 = v39;
      v33 = v37;
    }
    else
    {
      v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __108__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_withCompletion___block_invoke_232;
      v47[3] = &unk_24CC85EC0;
      v48 = v13;
      v35 = v34;
      v49 = v35;
      objc_msgSend(v43, "enumerateObjectsUsingBlock:", v47);
      v36 = *v29;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v55 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:withCompletion:]";
        v56 = 2112;
        v57 = v35;
        _os_log_impl(&dword_2117D4000, v36, OS_LOG_TYPE_DEFAULT, "%s wavList - %@", buf, 0x16u);
      }
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __108__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_withCompletion___block_invoke_242;
      v44[3] = &unk_24CC85B90;
      v45 = v21;
      v46 = v20;
      v33 = v37;
      v32 = v38;
      objc_msgSend(v37, "addUtterances:toProfile:withContext:withCompletion:", v35, v45, v38, v44);

      v15 = v39;
    }

    v19 = v40;
    v17 = v41;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 113, &unk_24CC9A068);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v20)[2](v20, v21);
  }

}

- (id)getAllContentsOfVoiceProfileStore
{
  void *v2;
  void *v3;

  +[SSRVoiceProfileStorePrefs sharedStorePrefs](SSRVoiceProfileStorePrefs, "sharedStorePrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllContentsOfVoiceProfileStorePrefs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)applyContentsToVoiceProfileStore:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SSRVoiceProfileStorePrefs sharedStorePrefs](SSRVoiceProfileStorePrefs, "sharedStorePrefs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyContentsToVoiceProfileStorePrefs:", v3);

}

- (unint64_t)currentDeviceCategory
{
  return self->_currentDeviceCategory;
}

- (void)setCurrentDeviceCategory:(unint64_t)a3
{
  self->_currentDeviceCategory = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (SSRRemoteControlClient)remoteControlClient
{
  return self->_remoteControlClient;
}

- (void)setRemoteControlClient:(id)a3
{
  objc_storeStrong((id *)&self->_remoteControlClient, a3);
}

- (NSString)lastRepromptedDate
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastRepromptedDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRepromptedDate, 0);
  objc_storeStrong((id *)&self->_remoteControlClient, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __108__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject **v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    v5 = (NSObject **)MEMORY[0x24BE284B8];
    v6 = *MEMORY[0x24BE284B8];
    if (v3 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:withCompletion:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s ERR: %@", (uint8_t *)&v7, 0x16u);
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315138;
      v8 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:withCompletion:]_block_invoke";
      _os_log_fault_impl(&dword_2117D4000, v6, OS_LOG_TYPE_FAULT, "%s No completionBlock provided to importVoice Profile", (uint8_t *)&v7, 0xCu);
    }
  }

}

void __108__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_withCompletion___block_invoke_232(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v16 = v3;
    v5 = objc_msgSend(v3, "hasSuffix:", CFSTR(".wav"));
    v4 = v16;
    if (v5)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isAbsolutePath"))
      {
        v6 = *(id *)(a1 + 32);
      }
      else
      {
        v7 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "currentDirectoryPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@"), v9, *(_QWORD *)(a1 + 32));
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file://%@/%@"), v6, v16);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = &stru_24CC88468;
      if (v10)
        v12 = (__CFString *)v10;
      v13 = v12;

      v14 = *(void **)(a1 + 40);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v13);

      objc_msgSend(v14, "addObject:", v15);
      v4 = v16;
    }
  }

}

void __108__SSRVoiceProfileManager_importVoiceProfile_appDomain_withSharedUserId_withLocale_withAsset_withCompletion___block_invoke_242(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "profileID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[SSRVoiceProfileManager importVoiceProfile:appDomain:withSharedUserId:withLocale:withAsset:withCompletion:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Adding utterances to profileID: %@ finished with err: %@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66__SSRVoiceProfileManager_markSATEnrollmentSuccessForVoiceProfile___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if ((a2 & 1) != 0)
  {
    if (CSIsIOS())
    {
      v7 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]_block_invoke";
        _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Triggering profile sync check", (uint8_t *)&v10, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.voiceprofilesync"), 0);

    }
  }
  else
  {
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[SSRVoiceProfileManager markSATEnrollmentSuccessForVoiceProfile:]_block_invoke";
      v12 = 2114;
      v13 = v6;
      _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed to add profile into the store with error %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  notify_post("com.apple.voicetrigger.PHSProfileModified");

}

void __56__SSRVoiceProfileManager_isVoiceTriggerRepromptRequired__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE284B8];
  v8 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v5, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315394;
    v20 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]_block_invoke";
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Active Assistant Account is %@", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(v5, "speechIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v11);
  v15 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315394;
    v20 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]_block_invoke";
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s speechIdentifier is %@", (uint8_t *)&v19, 0x16u);
  }
  +[VoiceTriggerRePromptUtil sharedInstance](VoiceTriggerRePromptUtil, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isRePromptableWithAssistantId:", v11);

  if (v17)
  {
    v18 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[SSRVoiceProfileManager isVoiceTriggerRepromptRequired]_block_invoke";
      _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s AssistantId required RePrompt", (uint8_t *)&v19, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __60__SSRVoiceProfileManager_provisionedVoiceProfilesForLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "dateAdded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "dateAdded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "dateAdded");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateAdded");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "compare:", v9);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

uint64_t __74__SSRVoiceProfileManager_provisionedVoiceProfilesForAppDomain_withLocale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "dateAdded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "dateAdded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "dateAdded");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateAdded");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "compare:", v9);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

void __69__SSRVoiceProfileManager_devicesWithVoiceProfileIniCloudForLanguage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 136315650;
    v10 = "-[SSRVoiceProfileManager devicesWithVoiceProfileIniCloudForLanguage:]_block_invoke";
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Devices with VoiceProfile in iCloud for language: %{public}@:%{public}@", (uint8_t *)&v9, 0x20u);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __92__SSRVoiceProfileManager_isVoiceProfileUploadedToiCloudForLanguageCode_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  char v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v44 = *(id *)(a1 + 32);
  v7 = (os_log_t *)MEMORY[0x24BE284B8];
  v8 = *MEMORY[0x24BE284B8];
  v9 = *MEMORY[0x24BE284B8];
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 72);
      v13 = v8;
      +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v61 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
      v62 = 2114;
      v63 = v11;
      v64 = 2114;
      v65 = v14;
      v66 = 2114;
      v67 = v5;
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Looking VoiceProfile for CurrDevice: %{public}@{%{public}@} in devices %{public}@", buf, 0x2Au);

    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
    if (v16)
    {
      v17 = v16;
      v42 = 0;
      v43 = v5;
      v45 = 0;
      v18 = *(_QWORD *)v57;
      v46 = *(_QWORD *)v57;
      v47 = v15;
      do
      {
        v19 = 0;
        v48 = v17;
        do
        {
          if (*(_QWORD *)v57 != v18)
          {
            v20 = v19;
            objc_enumerationMutation(v15);
            v19 = v20;
          }
          v49 = v19;
          v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v19);
          if (objc_msgSend(v21, "isEqualToString:", *(_QWORD *)(a1 + 56), v42, v43, v44))
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            obj = v22;
            v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v53;
              while (2)
              {
                v26 = 0;
                v50 = v24;
                do
                {
                  if (*(_QWORD *)v53 != v25)
                    objc_enumerationMutation(obj);
                  v27 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v26);
                  v28 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v27);
                  v29 = *v7;
                  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
                  {
                    v30 = *(_QWORD *)(a1 + 48);
                    v31 = a1;
                    v32 = *(_QWORD *)(a1 + 72);
                    v33 = v29;
                    +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v32);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v28);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136316162;
                    v61 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
                    v62 = 2114;
                    v63 = v30;
                    v64 = 2114;
                    v65 = v34;
                    v66 = 2114;
                    v67 = v27;
                    v68 = 2114;
                    v69 = v35;
                    _os_log_impl(&dword_2117D4000, v33, OS_LOG_TYPE_DEFAULT, "%s currDevice=[%{public}@ : {%{public}@}] ; syncedDevice=[%{public}@ : {%{public}@}]",
                      buf,
                      0x34u);

                    a1 = v31;
                    v7 = (os_log_t *)MEMORY[0x24BE284B8];

                    v24 = v50;
                  }
                  v36 = *(_QWORD *)(a1 + 72);
                  if (v28 == v36)
                  {
                    v37 = *v7;
LABEL_31:
                    v18 = v46;
                    v15 = v47;
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v61 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
                      _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MATCH", buf, 0xCu);
                    }
                    v45 = 1;
                    goto LABEL_34;
                  }
                  v37 = *v7;
                  if (v28 == 2 && v36 == 4)
                    goto LABEL_31;
                  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v61 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
                    _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile MIS-MATCH", buf, 0xCu);
                  }
                  ++v26;
                }
                while (v24 != v26);
                v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
                if (v24)
                  continue;
                break;
              }
              v18 = v46;
              v15 = v47;
LABEL_34:
              v17 = v48;
            }

          }
          v19 = v49 + 1;
        }
        while (v49 + 1 != v17);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
      }
      while (v17);

      v6 = v42;
      v5 = v43;
      if ((v45 & 1) != 0)
        goto LABEL_44;
    }
    else
    {

    }
    if (*(_BYTE *)(a1 + 80))
    {
      v39 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v40 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315394;
        v61 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
        v62 = 2114;
        v63 = v40;
        _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s VoiceProfile available locally for %{public}@, not uploaded yet", buf, 0x16u);
      }
    }
LABEL_44:
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_45;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v41 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v61 = "-[SSRVoiceProfileManager isVoiceProfileUploadedToiCloudForLanguageCode:withCompletionBlock:]_block_invoke";
    v62 = 2114;
    v63 = v41;
    _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s ERR: Fetching cached devices resulted in error %{public}@", buf, 0x16u);
  }
  v10 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_45:
  v10();

}

void __67__SSRVoiceProfileManager_getCachedVoiceProfileAvailabilityMetaBlob__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
      v36 = 2114;
      v37 = v6;
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Fetching cached devices resulted in error %{public}@", buf, 0x16u);
    }
    goto LABEL_26;
  }
  if (!v5)
  {
    v26 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
      _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, "%s Devices with voice profile is nil!", buf, 0xCu);
    }
    goto LABEL_26;
  }
  v28 = a1;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = v5;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    v13 = (os_log_t *)MEMORY[0x24BE284B8];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", 0, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isMarkedSATEnrolled"))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v15);

        }
        else
        {
          v18 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
            v36 = 2114;
            v37 = v15;
            _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s Skipping %{public}@ not locally present", buf, 0x16u);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v11);
  }

  a1 = v28;
  if (!v8 || !objc_msgSend(v8, "count"))
  {
LABEL_23:

    v6 = 0;
    v5 = v27;
LABEL_26:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_27;
  }
  v19 = (void *)MEMORY[0x24BDD1608];
  v20 = (void *)objc_msgSend(v8, "copy");
  v29 = 0;
  objc_msgSend(v19, "dataWithJSONObject:options:error:", v20, 0, &v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v29;

  v23 = *MEMORY[0x24BE284B8];
  if (v21 && !v22)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
      v36 = 2114;
      v37 = v9;
      _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Cached devices with VoiceProfile in iCloud: %{public}@", buf, 0x16u);
    }
    v24 = *(_QWORD *)(*(_QWORD *)(v28 + 40) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v21;

    goto LABEL_23;
  }
  v6 = 0;
  v5 = v27;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v35 = "-[SSRVoiceProfileManager getCachedVoiceProfileAvailabilityMetaBlob]_block_invoke";
    v36 = 2112;
    v37 = v21;
    v38 = 2112;
    v39 = v22;
    _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s ERR: error creating profilesJsonData: %@, err: %@", buf, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v28 + 32));

LABEL_27:
}

void __57__SSRVoiceProfileManager__copyVoiceProfileAtPath_toPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = *(void **)(a1 + 32);
  +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

  v8 = 56;
  if ((_DWORD)v6)
    v8 = 48;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + v8) + 8) + 24) = a3;

}

void __62__SSRVoiceProfileManager_notifyUserVoiceProfileUploadComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_CSSATLegacyUploadPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v3))
  {
    v9 = 0;
    v4 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &v9);
    v5 = v9;
    if ((v4 & 1) == 0)
    {
      v6 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v7 = v6;
        objc_msgSend(v5, "localizedDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v11 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUploadComplete]_block_invoke";
        v12 = 2114;
        v13 = v8;
        _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s Cannot delete existing SATUpload Diretory : %{public}@", buf, 0x16u);

      }
    }
  }
  else
  {
    v5 = 0;
  }

}

void __80__SSRVoiceProfileManager_getUserVoiceProfileUploadPathWithEnrolledLanguageList___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  BOOL v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  __int128 v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id obj;
  void *v62;
  void *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  id v76;
  uint8_t v77[128];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  id v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v2 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v76 = 0;
    v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v76);
    v6 = v76;
    if ((v5 & 1) == 0)
    {
      v7 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        objc_msgSend(v6, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
        v80 = 2114;
        v81 = (uint64_t)v9;
        v10 = "%s Cannot delete existing SATUpload Diretory : %{public}@";
LABEL_51:
        _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);

        goto LABEL_40;
      }
      goto LABEL_40;
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = v6;
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v75 = v6;
  v13 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v75);
  v6 = v75;

  if ((v13 & 1) == 0)
  {
    v43 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v8 = v43;
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
      v80 = 2114;
      v81 = (uint64_t)v9;
      v10 = "%s Cannot create SAT Upload Directory : %{public}@";
      goto LABEL_51;
    }
LABEL_40:
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(id *)(v44 + 40);
    *(_QWORD *)(v44 + 40) = 0;
    goto LABEL_49;
  }
  objc_msgSend(*(id *)(a1 + 32), "_getVoiceProfilePathsToBeUploadedForSiriProfileId:", 0);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
  if (v56)
  {
    v57 = *(_QWORD *)v72;
    *(_QWORD *)&v15 = 136315650;
    v53 = v15;
    v62 = v3;
    v54 = v14;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v72 != v57)
          objc_enumerationMutation(v14);
        v59 = v16;
        v17 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v16);
        objc_msgSend(v14, "objectForKeyedSubscript:", v17, v53);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "languageCode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v17;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingPathComponent:", v19);
        v21 = objc_claimAutoreleasedReturnValue();
        v60 = v20;
        objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("td"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v2 + 1408), "defaultManager");
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v23, "enumeratorAtPath:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v70 = v6;
        v63 = (void *)v21;
        LOBYTE(v23) = objc_msgSend(v62, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v70);
        v25 = v70;

        v58 = v24;
        if ((v23 & 1) != 0)
        {
          v55 = v19;
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          obj = v24;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v67;
            while (2)
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v67 != v28)
                  objc_enumerationMutation(obj);
                v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
                v31 = a1;
                v32 = *(void **)(a1 + 32);
                objc_msgSend(v22, "stringByAppendingPathComponent:", v30);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v32) = objc_msgSend(v32, "_isDirectory:", v33);

                if ((_DWORD)v32)
                {
                  objc_msgSend(v63, "stringByAppendingPathComponent:", v30);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v65 = v25;
                  v35 = objc_msgSend(v62, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v34, 1, 0, &v65);
                  v6 = v65;

                  if ((v35 & 1) == 0)
                  {
                    v45 = (void *)*MEMORY[0x24BE284B8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                    {
                      v51 = v45;
                      objc_msgSend(v63, "stringByAppendingPathComponent:", v30);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315394;
                      v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
                      v80 = 2114;
                      v81 = (uint64_t)v52;
                      _os_log_error_impl(&dword_2117D4000, v51, OS_LOG_TYPE_ERROR, "%s Cannot create directory(%{public}@)", buf, 0x16u);

                    }
                    v46 = *(_QWORD *)(*(_QWORD *)(v31 + 40) + 8);
                    v36 = *(void **)(v46 + 40);
                    *(_QWORD *)(v46 + 40) = 0;
LABEL_47:
                    v3 = v62;
                    v14 = v54;

                    goto LABEL_48;
                  }
                  v25 = v6;
                }
                else
                {
                  objc_msgSend(v30, "pathExtension");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v36, "isEqualToString:", CFSTR("wav")) & 1) != 0
                    || objc_msgSend(v36, "isEqualToString:", CFSTR("json")))
                  {
                    objc_msgSend(v22, "stringByAppendingPathComponent:", v30);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "stringByAppendingPathComponent:", v30);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();

                    v64 = 0;
                    v39 = objc_msgSend(v62, "copyItemAtPath:toPath:error:", v37, v38, &v64);
                    v40 = v64;
                    if (v39)
                      v41 = v40 == 0;
                    else
                      v41 = 0;
                    if (!v41)
                    {
                      v6 = v40;
                      v47 = *MEMORY[0x24BE284B8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = v53;
                        v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
                        v80 = 2114;
                        v81 = (uint64_t)v37;
                        v82 = 2114;
                        v83 = v38;
                        _os_log_error_impl(&dword_2117D4000, v47, OS_LOG_TYPE_ERROR, "%s Cannot copy file: %{public}@ to %{public}@", buf, 0x20u);
                      }
                      v49 = *(_QWORD *)(*(_QWORD *)(v31 + 40) + 8);
                      v50 = *(void **)(v49 + 40);
                      *(_QWORD *)(v49 + 40) = 0;

                      goto LABEL_47;
                    }

                    v25 = 0;
                  }

                }
                a1 = v31;
              }
              v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
              if (v27)
                continue;
              break;
            }
          }

          v6 = v25;
          v14 = v54;
          v19 = v55;
        }
        else
        {
          v42 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v53;
            v79 = "-[SSRVoiceProfileManager getUserVoiceProfileUploadPathWithEnrolledLanguageList:]_block_invoke";
            v80 = 2114;
            v81 = v21;
            v82 = 2114;
            v83 = v25;
            _os_log_error_impl(&dword_2117D4000, v42, OS_LOG_TYPE_ERROR, "%s Cannot create %{public}@ with error %{public}@ - Skipping language", buf, 0x20u);
          }
          v6 = v25;
        }
        v2 = 0x24BDD1000;

        v16 = v59 + 1;
      }
      while (v59 + 1 != v56);
      v56 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
      v3 = v62;
    }
    while (v56);
  }
LABEL_48:

LABEL_49:
}

void __94__SSRVoiceProfileManager_uploadUserVoiceProfileForSiriProfileId_withUploadTrigger_completion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  _QWORD v21[4];
  id v22;
  const __CFString *v23;
  __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE284B8];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("Primary User");
    if (*(_QWORD *)(a1 + 32))
      v4 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v26 = "-[SSRVoiceProfileManager uploadUserVoiceProfileForSiriProfileId:withUploadTrigger:completion:]_block_invoke";
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Upload trigger of voice profile of %@ ", buf, 0x16u);
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Unknown device category for device type %@ - Bailing out"), v10);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v11 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[SSRVoiceProfileManager uploadUserVoiceProfileForSiriProfileId:withUploadTrigger:completion:]_block_invoke";
      v27 = 2114;
      v28 = v7;
      _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v23 = CFSTR("reason");
      v24 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 711, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);

    }
    goto LABEL_15;
  }
  if ((CSIsIOS() & 1) != 0 || (CSIsOSX() & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __94__SSRVoiceProfileManager_uploadUserVoiceProfileForSiriProfileId_withUploadTrigger_completion___block_invoke_147;
    v21[3] = &unk_24CC85CD8;
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v5, "_prepareVoiceProfileWithSiriProfileId:withUploadBlock:", v6, v21);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, __CFString *))(v8 + 16))(v8, v7);

LABEL_15:
    return;
  }
  v16 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)MEMORY[0x24BE28488];
    v19 = v16;
    objc_msgSend(v18, "deviceProductType");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[SSRVoiceProfileManager uploadUserVoiceProfileForSiriProfileId:withUploadTrigger:completion:]_block_invoke";
    v27 = 2114;
    v28 = v20;
    _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s Upload not supported on %{public}@", buf, 0x16u);

  }
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, 0);
}

uint64_t __94__SSRVoiceProfileManager_uploadUserVoiceProfileForSiriProfileId_withUploadTrigger_completion___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__SSRVoiceProfileManager_notifyUserVoiceProfileUploadCompleteForSiriProfileId_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  os_log_t *v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  const __CFString *v12;
  char v13;
  id v14;
  os_log_t v15;
  NSObject *v16;
  __CFString *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_CSSATUploadPathForSiriProfileId:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  v6 = *MEMORY[0x24BE284B8];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v7)
      goto LABEL_11;
    v8 = *(const __CFString **)(a1 + 40);
    if (!v8)
      v8 = CFSTR("Primary User");
    *(_DWORD *)buf = 136315650;
    v20 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUploadCompleteForSiriProfileId:withError:]_block_invoke";
    v21 = 2112;
    v22 = v8;
    v23 = 2114;
    v24 = v4;
    v9 = "%s Upload of Voice Profile for %@ completed with error %{public}@";
    v10 = v6;
    v11 = 32;
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    v12 = CFSTR("Primary User");
    if (*(_QWORD *)(a1 + 40))
      v12 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v20 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUploadCompleteForSiriProfileId:withError:]_block_invoke";
    v21 = 2112;
    v22 = v12;
    v9 = "%s Upload of Voice Profile for %@ completed successfully";
    v10 = v6;
    v11 = 22;
  }
  _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_11:
  if (objc_msgSend(v2, "fileExistsAtPath:", v3))
  {
    v18 = 0;
    v13 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &v18);
    v14 = v18;
    if ((v13 & 1) == 0)
    {
      v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        objc_msgSend(v14, "localizedDescription");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v20 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUploadCompleteForSiriProfileId:withError:]_block_invoke";
        v21 = 2114;
        v22 = v17;
        _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete existing SATUpload diretory : %{public}@", buf, 0x16u);

      }
    }
  }
  else
  {
    v14 = 0;
  }

}

void __102__SSRVoiceProfileManager__enrollVoiceProfileForSiriProfileId_fromCacheDirectoryPath_withCategoryType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v6 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "profileID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v12 = 136315906;
    v13 = "-[SSRVoiceProfileManager _enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:]_block_invoke";
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Adding voiceprofile for %{public}@ in language %{public}@ completed with error %{public}@", (uint8_t *)&v12, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "leave");

}

id __94__SSRVoiceProfileManager__downloadAndEnrollVoiceProfileForProfileId_withDownloadTriggerBlock___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6056;
  v16 = __Block_byref_object_dispose__6057;
  v17 = 0;
  v4 = (void *)a1[4];
  v3 = (void *)a1[5];
  v5 = a1[6];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __94__SSRVoiceProfileManager__downloadAndEnrollVoiceProfileForProfileId_withDownloadTriggerBlock___block_invoke_2;
  v8[3] = &unk_24CC85C88;
  v10 = &v12;
  v11 = a2;
  v8[4] = v4;
  v9 = v3;
  objc_msgSend(v4, "_downloadVoiceProfileForProfileId:forDeviceCategory:withDownloadTriggerBlock:withCompletion:", v9, a2, v5, v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __94__SSRVoiceProfileManager__downloadAndEnrollVoiceProfileForProfileId_withDownloadTriggerBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  os_log_t *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v36 = *(_QWORD *)(a1 + 56);
      v37 = v7;
      +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke_2";
      v48 = 2114;
      v49 = v5;
      v50 = 2114;
      v51 = v38;
      _os_log_error_impl(&dword_2117D4000, v37, OS_LOG_TYPE_ERROR, "%s Failed to download voice profile with error %{public}@ and category %{public}@ ", buf, 0x20u);

    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = v5;
    v10 = *(id *)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
    goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 32), "_enrollVoiceProfileForSiriProfileId:fromCacheDirectoryPath:withCategoryType:", *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 56));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v14)
  {
    v16 = (os_log_t *)MEMORY[0x24BE284B8];
    v17 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 56);
      v20 = v17;
      +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
      v48 = 2112;
      v49 = v18;
      v50 = 2114;
      v51 = v21;
      _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s Successfully enrolled voice profile %@ with %{public}@ profile", buf, 0x20u);

    }
    if (!CSIsIOS())
      goto LABEL_20;
    v22 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
      _os_log_impl(&dword_2117D4000, v22, OS_LOG_TYPE_DEFAULT, "%s Triggering profile sync check", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v23, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.voiceprofilesync"), 0);
    goto LABEL_14;
  }
  objc_msgSend(v14, "domain");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v15 == CFSTR("com.apple.speakerrecognition"))
  {
    v24 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "code");

    if (v24 == 748)
    {
      v25 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(void **)(a1 + 40);
        v27 = *(_QWORD *)(a1 + 56);
        v28 = v25;
        +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
        v48 = 2112;
        v49 = v26;
        v50 = 2114;
        v51 = v29;
        _os_log_impl(&dword_2117D4000, v28, OS_LOG_TYPE_DEFAULT, "%s Skipped enrolling voice profile %@ with %{public}@ profile", buf, 0x20u);

      }
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = 0;

      goto LABEL_20;
    }
  }
  else
  {

  }
  v32 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v39 = *(void **)(a1 + 40);
    v40 = *(_QWORD *)(a1 + 56);
    v23 = v32;
    +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
    v48 = 2112;
    v49 = v39;
    v50 = 2114;
    v51 = v41;
    _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Failed in enrolling Voice profile %@ with category %{public}@ profile", buf, 0x20u);

LABEL_14:
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v34 = objc_msgSend(v33, "removeItemAtPath:error:", v6, &v45);
  v10 = v45;

  if ((v34 & 1) == 0)
  {
    v35 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v43 = v35;
      objc_msgSend(v42, "localizedDescription");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v47 = "-[SSRVoiceProfileManager _downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:]_block_invoke";
      v48 = 2114;
      v49 = v6;
      v50 = 2114;
      v51 = v44;
      _os_log_error_impl(&dword_2117D4000, v43, OS_LOG_TYPE_ERROR, "%s Failed to remove update path [%{public}@] upon migration completion, error: %{public}@", buf, 0x20u);

    }
  }
LABEL_23:

}

void __59__SSRVoiceProfileManager_notifyUserVoiceProfileUpdateReady__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id *v5;
  NSObject *v6;
  uint64_t *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  char v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint32_t v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  double v45;
  double v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  int v50;
  NSObject *v51;
  double v52;
  NSObject *v53;
  NSObject *v54;
  double v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  int v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  id *v70;
  char v71;
  double v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  id v88;
  _QWORD v89[4];
  id v90;
  void *v91;
  id v92;
  uint64_t *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id obj;
  char v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  uint8_t buf[4];
  const char *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  double v116;
  __int16 v117;
  void *v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v105 = 0;
  v106 = &v105;
  v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__6056;
  v109 = __Block_byref_object_dispose__6057;
  v110 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_CSSATDownloadPath");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "SSRSpeakerProfilesBasePath");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v104 = 0;
  v73 = (void *)v2;
  if (v85 && v2)
  {
    v78 = a1;
    +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v2);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id *)(v106 + 5);
    obj = (id)v106[5];
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v85, &obj);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v5, obj);

    v7 = v106;
    if (v106[5])
    {
      v8 = (id)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)v7[5], "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
        v113 = 2114;
        v114 = v9;
        _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_INFO, "%s Failed to get device hash list %{public}@", buf, 0x16u);

      }
LABEL_84:

      goto LABEL_85;
    }
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v75 = v6;
    v77 = -[NSObject countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
    if (!v77)
      goto LABEL_80;
    v76 = *(_QWORD *)v100;
    v74 = *MEMORY[0x24BE28518];
LABEL_9:
    v79 = 0;
    while (1)
    {
      if (*(_QWORD *)v100 != v76)
        objc_enumerationMutation(v75);
      v86 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v79);
      v10 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
        v113 = 2114;
        v114 = v86;
        _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Processing sync data from device hash: %{public}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "stringByAppendingPathComponent:", v86);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id *)(v106 + 5);
      v98 = (id)v106[5];
      objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v12, &v98);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v13, v98);

      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v84 = v14;
      v15 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
      if (v15)
        break;
LABEL_78:

      if (++v79 == v77)
      {
        v77 = -[NSObject countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
        if (!v77)
        {
LABEL_80:

          goto LABEL_81;
        }
        goto LABEL_9;
      }
    }
    v87 = *(_QWORD *)v95;
LABEL_16:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v95 != v87)
        objc_enumerationMutation(v84);
      v17 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v16);
      +[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:](SSRUtils, "getVoiceProfileForSiriProfileId:forLanguageCode:", 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && objc_msgSend(v18, "isMarkedSATEnrolled"))
      {
        v20 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
          v113 = 2114;
          v114 = v17;
          _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s Skipping language [%{public}@] since we already have enrollment data for this language", buf, 0x16u);
        }
        goto LABEL_58;
      }
      objc_msgSend(v85, "stringByAppendingPathComponent:", v86);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathComponent:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:", CFSTR("audio"));
      v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

      v104 = 0;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)&v24, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "fileExistsAtPath:isDirectory:", v26, &v104);
      if (v104)
        v28 = v27;
      else
        v28 = 0;

      if ((v28 & 1) != 0)
      {
        if (+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:](SSRUtils, "isCurrentDeviceCompatibleWithVoiceProfileAt:", v22))
        {
          +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:](SSRUtils, "getExplicitEnrollmentUtterancesFromDirectory:", *(_QWORD *)&v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v19)
            v32 = (id)objc_msgSend(v30, "deleteUserVoiceProfile:", v19);
          else
            v19 = -[SSRVoiceProfile initNewVoiceProfileWithLocale:withAppDomain:]([SSRVoiceProfile alloc], "initNewVoiceProfileWithLocale:withAppDomain:", v17, CFSTR("com.apple.siri"));
          objc_msgSend(v19, "addUtterances:spIdType:", v29, 1);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v106[5];
          v106[5] = v38;

          if (v106[5])
          {
            v40 = (id)*MEMORY[0x24BE284B8];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v19, "profileID");
              v55 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              objc_msgSend((id)v106[5], "localizedDescription");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              v113 = 2114;
              v114 = v29;
              v115 = 2114;
              v116 = v55;
              v117 = 2114;
              v118 = v56;
              _os_log_error_impl(&dword_2117D4000, v40, OS_LOG_TYPE_ERROR, "%s Error to copy profile from %{public}@ to %{public}@, error: %{public}@", buf, 0x2Au);

            }
            goto LABEL_56;
          }
          if (objc_msgSend(v19, "markSATEnrollmentSuccess"))
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_alloc_init(MEMORY[0x24BE28408]);
            objc_msgSend(v41, "enter");
            v89[0] = MEMORY[0x24BDAC760];
            v89[1] = 3221225472;
            v89[2] = __59__SSRVoiceProfileManager_notifyUserVoiceProfileUpdateReady__block_invoke_95;
            v89[3] = &unk_24CC85C60;
            v93 = &v105;
            v42 = v19;
            v90 = v42;
            v91 = v17;
            v43 = v41;
            v92 = v43;
            objc_msgSend(v31, "addUserVoiceProfile:withContext:withCompletion:", v42, 0, v89);
            v81 = v43;
            v44 = objc_msgSend(v43, "waitWithTimeout:", dispatch_time(0, 10000000000));
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "timeIntervalSinceDate:", v83);
            v46 = v45 * 1000.0;
            if (v44)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("userAddition timedout after %fms"), v45 * 1000.0, v73);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
                v113 = 2112;
                v114 = v47;
                _os_log_error_impl(&dword_2117D4000, v48, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
              }

LABEL_55:
LABEL_56:

              goto LABEL_57;
            }
            v52 = *((double *)v106 + 5);
            v53 = *MEMORY[0x24BE284B8];
            if (v52 != 0.0)
            {
              v54 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
                v113 = 2114;
                v114 = v17;
                v115 = 2114;
                v116 = v52;
                _os_log_error_impl(&dword_2117D4000, v54, OS_LOG_TYPE_ERROR, "%s ERR: Failed migrating Voice profile for language %{public}@ with error %{public}@", buf, 0x20u);
              }
              goto LABEL_55;
            }
            v57 = v53;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v42, "locale");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              v113 = 2114;
              v114 = v58;
              v115 = 2048;
              v116 = v46;
              _os_log_impl(&dword_2117D4000, v57, OS_LOG_TYPE_DEFAULT, "%s Successfully added %{public}@ in %.2fms", buf, 0x20u);

            }
            _CSNotBackedupPreferencesValueForKey();
            v80 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v59 = (void *)MEMORY[0x24BE28488];
            objc_msgSend(*(id *)(*(_QWORD *)(v78 + 32) + 24), "UUIDString");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "getSiriLanguageWithEndpointId:fallbackLanguage:", v60, 0);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            v62 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              v113 = 2114;
              v114 = v17;
              v115 = 2114;
              v116 = v80;
              v117 = 2114;
              v118 = v61;
              _os_log_impl(&dword_2117D4000, v62, OS_LOG_TYPE_DEFAULT, "%s language: %{public}@, enableVTAfterSyncLanguage: %{public}@, currSiriLanguage: %{public}@", buf, 0x2Au);
            }
            if (v80 == 0.0 || !v61)
            {
              v64 = *MEMORY[0x24BE284B8];
            }
            else
            {
              v63 = objc_msgSend(v17, "isEqualToString:", v61);
              v64 = *MEMORY[0x24BE284B8];
              if (v63)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
                  v113 = 2114;
                  v114 = v61;
                  v115 = 2114;
                  v116 = v80;
                  _os_log_impl(&dword_2117D4000, v64, OS_LOG_TYPE_DEFAULT, "%s Enabling VoiceTrigger Upon VoiceProfile sync for language: %{public}@ and enrolled language: %{public}@", buf, 0x20u);
                }
                _CSNotBackedupPreferencesSetValueForKey();
                CSNotBackedupInternalPreferencesSynchronize();
                objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "setVoiceTriggerEnabled:", 1);

                if (CSIsInternalBuild())
                {
                  objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "submitVoiceTriggerIssueReport:", v74);

                }
                goto LABEL_74;
              }
            }
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              v113 = 2114;
              v114 = v17;
              _os_log_impl(&dword_2117D4000, v64, OS_LOG_TYPE_DEFAULT, "%s Not enabling VoiceTrigger Upon VoiceProfile sync for language: %{public}@", buf, 0x16u);
            }
LABEL_74:
            v67 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              v113 = 2114;
              v114 = v17;
              _os_log_impl(&dword_2117D4000, v67, OS_LOG_TYPE_DEFAULT, "%s Sucessfully migrated language %{public}@", buf, 0x16u);
            }

          }
          else
          {
            v49 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              v113 = 2114;
              v114 = v17;
              _os_log_error_impl(&dword_2117D4000, v49, OS_LOG_TYPE_ERROR, "%s Migrated language %{public}@ but failed to mark SAT enrollment", buf, 0x16u);
            }
          }
          v50 = objc_msgSend(v19, "markSATEnrollmentMigrated");
          v51 = *MEMORY[0x24BE284B8];
          if (v50)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
              v113 = 2114;
              v114 = v17;
              _os_log_impl(&dword_2117D4000, v51, OS_LOG_TYPE_DEFAULT, "%s Sucessfully marked as migrated for language : %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
            v113 = 2114;
            v114 = v17;
            _os_log_error_impl(&dword_2117D4000, v51, OS_LOG_TYPE_ERROR, "%s Failed to mark migrated for language : %{public}@", buf, 0x16u);
          }
          goto LABEL_56;
        }
        v37 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
          v113 = 2114;
          v114 = v17;
          v34 = v37;
          v35 = "%s Skipping language [%{public}@] as voice profile not compatible";
          v36 = 22;
          goto LABEL_34;
        }
      }
      else
      {
        v33 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
          v113 = 2114;
          v114 = v17;
          v115 = 2114;
          v116 = v24;
          v34 = v33;
          v35 = "%s Skipping language [%{public}@] as file path doesnt exist - %{public}@";
          v36 = 32;
LABEL_34:
          _os_log_impl(&dword_2117D4000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
        }
      }
LABEL_57:

LABEL_58:
      if (v15 == ++v16)
      {
        v68 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
        v15 = v68;
        if (!v68)
          goto LABEL_78;
        goto LABEL_16;
      }
    }
  }
LABEL_81:
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v3);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (id *)(v106 + 5);
  v88 = (id)v106[5];
  v71 = objc_msgSend(v69, "removeItemAtPath:error:", v85, &v88);
  objc_storeStrong(v70, v88);

  if ((v71 & 1) == 0)
  {
    v6 = (id)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v106[5], "localizedDescription");
      v72 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v112 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
      v113 = 2114;
      v114 = v85;
      v115 = 2114;
      v116 = v72;
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s Failed to remove update path [%{public}@] upon migration completion, error: %{public}@", buf, 0x20u);

    }
    goto LABEL_84;
  }
LABEL_85:

  _Block_object_dispose(&v105, 8);
}

void __59__SSRVoiceProfileManager_notifyUserVoiceProfileUpdateReady__block_invoke_95(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  v6 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "profileID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v12 = 136315906;
    v13 = "-[SSRVoiceProfileManager notifyUserVoiceProfileUpdateReady]_block_invoke";
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Adding voiceprofile for %{public}@ in language %{public}@ completed with error %{public}@", (uint8_t *)&v12, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "leave");

}

void __88__SSRVoiceProfileManager_notifyUserVoiceProfileDownloadReadyForUser_getData_completion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  const __CFString *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void (*v12)(void);
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  const __CFString *v35;
  __CFString *v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE284B8];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("Primary User");
    if (*(_QWORD *)(a1 + 32))
      v4 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
    v31 = 2112;
    v32 = v4;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Enrolling voice profile of %@ ", buf, 0x16u);
  }
  if (!*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing downloadTriggerBlock - Bailing out"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
      v31 = 2114;
      v32 = v13;
      _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v15 = *(_QWORD *)(a1 + 56);
    if (!v15)
      goto LABEL_22;
    v16 = (void *)MEMORY[0x24BDD1540];
    v37 = CFSTR("reason");
    v38[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = 713;
    goto LABEL_21;
  }
  v5 = *(_QWORD **)(a1 + 40);
  if (!v5[1])
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Unknown device category for device type %@ - Bailing out"), v21);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v22 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
      v31 = 2114;
      v32 = v13;
      _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v15 = *(_QWORD *)(a1 + 56);
    if (!v15)
      goto LABEL_22;
    v23 = (void *)MEMORY[0x24BDD1540];
    v35 = CFSTR("reason");
    v36 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v23;
    v19 = 711;
LABEL_21:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), v19, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v24);

LABEL_22:
    return;
  }
  if ((objc_msgSend(v5, "_checkIfDownloadRequiredForProfileId:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v25 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
      v31 = 2114;
      v32 = v26;
      _os_log_impl(&dword_2117D4000, v25, OS_LOG_TYPE_DEFAULT, "%s Skipping download for voice profile: %{public}@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 40), "_downloadAndEnrollVoiceProfileForProfileId:withDownloadTriggerBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v9)
  {
LABEL_25:
    v27 = *(_QWORD *)(a1 + 56);
    if (!v27)
      return;
    v12 = *(void (**)(void))(v27 + 16);
    goto LABEL_27;
  }
  v10 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    v28 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v30 = "-[SSRVoiceProfileManager notifyUserVoiceProfileDownloadReadyForUser:getData:completion:]_block_invoke";
    v31 = 2112;
    v32 = v28;
    v33 = 2112;
    v34 = v9;
    _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s Failed enrolling %@ with error %@", buf, 0x20u);
  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
  {
    v12 = *(void (**)(void))(v11 + 16);
LABEL_27:
    v12();
  }
}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE284B8];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v5 = (const __CFString *)a1[4];
      if (!v5)
        v5 = CFSTR("primary");
      v10 = 136315650;
      v11 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      v14 = 2114;
      v15 = v3;
      _os_log_error_impl(&dword_2117D4000, v4, OS_LOG_TYPE_ERROR, "%s ERR: Finished implicit training for %@ with error %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("primary");
    if (a1[4])
      v6 = (const __CFString *)a1[4];
    v10 = 136315394;
    v11 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:withR"
          "ecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Finished implicit training for %@", (uint8_t *)&v10, 0x16u);
  }
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = a1[5];
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_63(uint64_t a1)
{
  void *v2;
  void *v3;
  SSRRemoteControlClient *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "remoteDeviceUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[SSRRemoteControlClient initWithRemoteDeviceUUID:]([SSRRemoteControlClient alloc], "initWithRemoteDeviceUUID:", v3);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "waitingForConnection:error:", 0, 3.0))
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(*(id *)(a1 + 48), "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 80);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_2;
    v15[3] = &unk_24CC85B90;
    v12 = *(_QWORD *)(a1 + 56);
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 88);
    objc_msgSend(v7, "addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt:locale:withOtherCtxt:completion:", v8, v12, v9, v10, v11, v15);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 88);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1001, &unk_24CC9A040);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  }
}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_78(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id obj;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) && CSIsOSX())
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "voiceProfileImplicitCacheDirPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v12);
    v13 = (void *)MEMORY[0x24BDBCF48];
    v22[0] = v12;
    v22[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPathComponents:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v20 + 40);
    +[SSRUtils encryptFileAt:andSaveTo:error:](SSRUtils, "encryptFileAt:andSaveTo:error:", v18, v19, &obj);
    objc_storeStrong((id *)(v20 + 40), obj);

  }
}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_81(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  os_log_t *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a2);
  if (v4)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "code");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v7 = *(void **)(v6 + 40);
    if (v5 == 757)
    {
      *(_QWORD *)(v6 + 40) = 0;

      v8 = *MEMORY[0x24BE284B8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 136315138;
      v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      v9 = "%s Voice Profile is full - Ignoring";
LABEL_10:
      _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (objc_msgSend(v7, "code") == 735)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = 0;

      v8 = *MEMORY[0x24BE284B8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 136315138;
      v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      v9 = "%s Implicit Policy not satisfied - Ignoring";
      goto LABEL_10;
    }
    v20 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 136315650;
      v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      v47 = 2114;
      v48 = v21;
      v49 = 2114;
      v50 = v22;
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s ERR: Failed to process implicit utterance %{public}@ with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE285C0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");

    +[SSRBiometricMatch sharedInstance](SSRBiometricMatch, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "getLastBiometricMatchForVoiceTriggerTimeStamp:", v11);

    v14 = *MEMORY[0x24BE28538];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x24BE28538]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

    }
    else
    {
      v17 = 0;
    }

    v23 = (os_log_t *)MEMORY[0x24BE284B8];
    v24 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
      v47 = 2114;
      v48 = v25;
      _os_log_impl(&dword_2117D4000, v24, OS_LOG_TYPE_DEFAULT, "%s Processed implicit utterance %{public}@ successfully", buf, 0x16u);
    }
    if ((CSIsCommunalDevice() & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v43) = 0;
      +[SSRVoiceProfileMetadataManager saveUtteranceMetadataForUtterance:enrollmentType:isHandheldEnrollment:triggerSource:audioInput:otherBiometricResult:containsPayload:](SSRVoiceProfileMetadataManager, "saveUtteranceMetadataForUtterance:enrollmentType:isHandheldEnrollment:triggerSource:audioInput:otherBiometricResult:containsPayload:", v26, CFSTR("implicit"), v17, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v13, v43);

      v27 = *(void **)(a1 + 64);
      v52[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v27, "addUtterances:spIdType:", v28, 1);

      v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      if (v30)
      {
        objc_msgSend(v30, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v44) = 1;
        +[SSRVoiceProfileMetadataManager saveUtteranceMetadataForUtterance:enrollmentType:isHandheldEnrollment:triggerSource:audioInput:otherBiometricResult:containsPayload:](SSRVoiceProfileMetadataManager, "saveUtteranceMetadataForUtterance:enrollmentType:isHandheldEnrollment:triggerSource:audioInput:otherBiometricResult:containsPayload:", v31, CFSTR("implicit"), v17, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v13, v44);

        v32 = *(void **)(a1 + 64);
        v51 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (id)objc_msgSend(v32, "addUtterances:spIdType:", v33, 3);

      }
      v35 = *v23;
      if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v46 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:w"
              "ithRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke";
        _os_log_impl(&dword_2117D4000, v35, OS_LOG_TYPE_DEFAULT, "%s Generate profile change notification", buf, 0xCu);
      }
      notify_post("com.apple.voicetrigger.PHSProfileModified");
    }
  }
LABEL_22:
  v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v36)
  {
    objc_msgSend(v36, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v37);

  }
  v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v38)
  {
    objc_msgSend(v38, "path");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v39);

  }
  if (CSIsOSX())
  {
    objc_msgSend(*(id *)(a1 + 64), "voiceProfileImplicitCacheDirPath");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v40);

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.speakermodelUpdated"), 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __182__SSRVoiceProfileManager_notifyImplicitTrainingUtteranceAvailable_forVoiceProfileId_withRecordDeviceInfo_withRecordCtxt_withVoiceTriggerCtxt_withOtherCtxt_assetToUse_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v7 = v4;
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[SSRVoiceProfileManager notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:wit"
            "hRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:]_block_invoke_2";
      v11 = 2114;
      v12 = v8;
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s Failed to add implicit training utterance to remote, error: %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__SSRVoiceProfileManager_isImplicitTrainingRequiredForVoiceProfileId_locale_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    v8 = a1[4];
    v9 = a1[5];
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v11 = 136315906;
    v12 = "-[SSRVoiceProfileManager isImplicitTrainingRequiredForVoiceProfileId:locale:completion:]_block_invoke";
    v13 = 2114;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s isImplicitTraining required for profileId %{public}@, locale(%{public}@) ? %{public}@", (uint8_t *)&v11, 0x2Au);
  }
  v10 = a1[6];
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

void __77__SSRVoiceProfileManager_addUtterances_toProfile_withContext_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.siri"));

    if ((v8 & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "markSATEnrollmentSuccess"))
      {
        if (CSIsIOS() && (CSIsCommunalDevice() & 1) == 0)
        {
          v9 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "locale");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_markVoiceProfileTrainingSyncForLanguage:", v10);

        }
        v11 = *(_QWORD *)(a1 + 48);
        if (v11)
          (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
        notify_post("com.apple.voicetrigger.PHSProfileModified");
      }
      else
      {
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 32), "profileID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("ERR: Failed in marking Enrollment as Successful for profile %@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v25 = "-[SSRVoiceProfileManager addUtterances:toProfile:withContext:withCompletion:]_block_invoke";
          v26 = 2114;
          v27 = v16;
          _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
        v18 = *(_QWORD *)(a1 + 48);
        if (v18)
        {
          v19 = (void *)MEMORY[0x24BDD1540];
          v22 = *MEMORY[0x24BDD0FC8];
          v23 = v16;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 723, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v21);

        }
      }
      goto LABEL_19;
    }
  }
  else
  {
    v12 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SSRVoiceProfileManager addUtterances:toProfile:withContext:withCompletion:]_block_invoke";
      v26 = 2114;
      v27 = v6;
      _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s ERR: Failed to add profile into the store with error %{public}@", buf, 0x16u);
    }
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
LABEL_19:

}

+ (id)sharedInstance
{
  return +[SSRVoiceProfileManager sharedInstanceWithEndpointId:](SSRVoiceProfileManager, "sharedInstanceWithEndpointId:", 0);
}

+ (id)sharedInstanceWithEndpointId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3
    && sharedInstanceWithEndpointId__sharedVoiceProfileManager
    && (objc_msgSend((id)sharedInstanceWithEndpointId__sharedVoiceProfileManager, "endpointUUID"),
        v4 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 != v3))
  {
    v5 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)sharedInstanceWithEndpointId__sharedVoiceProfileManager;
      v11 = v5;
      objc_msgSend(v10, "endpointUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v16 = "+[SSRVoiceProfileManager sharedInstanceWithEndpointId:]";
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v3;
      _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s sharedVoiceProfileManager already instantiated with a different endpointUUID. existing-endpointUUID:%@ requested-endpointUUID:%@", buf, 0x20u);

    }
    v6 = 0;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SSRVoiceProfileManager_sharedInstanceWithEndpointId___block_invoke;
    block[3] = &unk_24CC864B8;
    v7 = v3;
    v14 = v7;
    if (sharedInstanceWithEndpointId__onceToken == -1)
    {
      v8 = v7;
    }
    else
    {
      dispatch_once(&sharedInstanceWithEndpointId__onceToken, block);
      v8 = v14;
    }
    v6 = (id)sharedInstanceWithEndpointId__sharedVoiceProfileManager;

  }
  return v6;
}

+ (void)clearVTEnableAfterProfileSyncFlag
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[SSRVoiceProfileManager clearVTEnableAfterProfileSyncFlag]";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Clearing the VT enable flag upon profile sync", (uint8_t *)&v3, 0xCu);
  }
  _CSNotBackedupPreferencesSetValueForKey();
  CSNotBackedupInternalPreferencesSynchronize();
}

void __55__SSRVoiceProfileManager_sharedInstanceWithEndpointId___block_invoke(uint64_t a1)
{
  SSRVoiceProfileManager *v2;
  void *v3;

  SSRLogInitIfNeeded();
  v2 = -[SSRVoiceProfileManager initWithEndpointId:]([SSRVoiceProfileManager alloc], "initWithEndpointId:", *(_QWORD *)(a1 + 32));
  v3 = (void *)sharedInstanceWithEndpointId__sharedVoiceProfileManager;
  sharedInstanceWithEndpointId__sharedVoiceProfileManager = (uint64_t)v2;

}

@end
