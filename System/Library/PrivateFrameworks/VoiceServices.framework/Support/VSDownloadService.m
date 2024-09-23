@implementation VSDownloadService

- (VSDownloadService)initWithType:(unint64_t)a3
{
  void *v5;
  VSDownloadService *v6;

  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VSDownloadService initWithType:assetsManager:](self, "initWithType:assetsManager:", a3, v5);

  return v6;
}

- (VSDownloadService)initWithType:(unint64_t)a3 assetsManager:(id)a4
{
  id v7;
  VSDownloadService *v8;
  VSDownloadService *v9;
  NSLock *v10;
  NSLock *updateLock;
  uint64_t v12;
  VSSiriServerConfiguration *serverConfig;
  uint64_t v14;
  VSPreferencesInterface *preferenceInterface;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VSDownloadService;
  v8 = -[VSDownloadService init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    updateLock = v9->_updateLock;
    v9->_updateLock = v10;

    objc_storeStrong((id *)&v9->_assetsManager, a4);
    +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    serverConfig = v9->_serverConfig;
    v9->_serverConfig = (VSSiriServerConfiguration *)v12;

    objc_msgSend(MEMORY[0x24BEC0DC8], "defaultInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    preferenceInterface = v9->_preferenceInterface;
    v9->_preferenceInterface = (VSPreferencesInterface *)v14;

  }
  return v9;
}

- (void)updateVoicesAndVoiceResources
{
  void *v2;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  VSDownloadService *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  VSDownloadService *v42;
  NSObject *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  VSDownloadService *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableAssetUpdate");

  if (v5)
  {
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_DEFAULT, "Asset update is disabled in internal settings.", buf, 2u);
    }
  }
  else
  {
    -[NSLock lock](self->_updateLock, "lock");
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_DEFAULT, "Start updating voice and voice resources.", buf, 2u);
    }

    v42 = self;
    -[VSDownloadService preferenceInterface](self, "preferenceInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subscribedVoicesForClientID:accessoryID:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v10 = v9;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    v43 = v10;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v54 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          VSGetLogDefault();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "clientID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "accessoryID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v15, "accessoryID");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithFormat:", CFSTR("on accessory %@"), v2);
              self = (VSDownloadService *)objc_claimAutoreleasedReturnValue();
              v20 = self;
            }
            else
            {
              v20 = (VSDownloadService *)&stru_24DD8EF88;
            }
            objc_msgSend(v15, "voice");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v60 = v17;
            v61 = 2112;
            v62 = v20;
            v63 = 2114;
            v64 = v21;
            _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_DEFAULT, "%@ %@ has a subscribed voice: %{public}@", buf, 0x20u);

            if (v18)
            {

            }
            v10 = v43;
          }

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v12);
    }

    -[NSObject valueForKey:](v10, "valueForKey:", CFSTR("voice"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSDownloadService assetsManager](v42, "assetsManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resetCache");

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v23;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v50 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v30, "languages");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObjectsFromArray:", v31);

          +[VSDownloadService inProgressDownloadVoiceKeys](VSDownloadService, "inProgressDownloadVoiceKeys");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "voiceKey");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v32, "containsObject:", v33);

          if (v34)
          {
            VSGetLogDefault();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v30, "descriptiveKey");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v60 = v36;
              _os_log_impl(&dword_21AA84000, v35, OS_LOG_TYPE_DEFAULT, "Voice download is in progress, skip new download. %@", buf, 0xCu);

            }
          }
          else
          {
            -[VSDownloadService updateVoiceIfNeeded:](v42, "updateVoiceIfNeeded:", v30);
          }
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v27);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = v25;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v46 != v40)
            objc_enumerationMutation(v37);
          -[VSDownloadService updateTrialVoiceResourceWithLanguage:](v42, "updateTrialVoiceResourceWithLanguage:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k));
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v39);
    }

    -[NSLock unlock](v42->_updateLock, "unlock");
    v6 = v43;
  }

}

- (void)updateVoiceIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  _BOOL4 v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  unint64_t type;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint8_t buf[4];
  _BYTE v46[10];
  __int16 v47;
  int v48;
  __int16 v49;
  _BOOL4 v50;
  __int16 v51;
  int v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSGetLogEvent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v46 = v4;
    _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_DEFAULT, "Updating target voice: %@", buf, 0xCu);
  }

  -[VSDownloadService assetsManager](self, "assetsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectVoiceForLang:name:type:gender:footprint:", v8, v9, objc_msgSend(v4, "type"), objc_msgSend(v4, "gender"), objc_msgSend(v4, "footprint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "voiceData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "footprint") == 1;

  }
  else
  {
    v12 = 1;
  }
  objc_msgSend(v4, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "voiceData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqual:", v16) ^ 1;

  }
  else
  {
    v17 = 0;
  }

  -[VSDownloadService preferenceInterface](self, "preferenceInterface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastTTSRequestDate");
  v19 = objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceDate:", v19);
    v22 = v21 < 604800.0;

  }
  else
  {
    v22 = 1;
  }
  -[VSDownloadService serverConfig](self, "serverConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shouldDelayVoiceUpdate");

  v41 = (void *)v19;
  switch(self->_type)
  {
    case 0uLL:
      v25 = v12;
      if (((v12 | v17) & 1) != 0)
        goto LABEL_17;
      v26 = 0;
      v27 = v22 & ~v24;
      break;
    case 1uLL:
      v25 = v12;
      if (v12)
      {
LABEL_17:
        v26 = 0;
        goto LABEL_21;
      }
      v26 = 0;
      v27 = v17 | v24 ^ 1;
      break;
    case 2uLL:
      v25 = v12;
      if (v12)
        v27 = 1;
      else
        v27 = objc_msgSend(MEMORY[0x24BEC0E18], "isHomeHub") & v17;
      v26 = objc_msgSend(MEMORY[0x24BEC0E18], "isWatch") ^ 1;
      break;
    case 3uLL:
      v25 = v12;
      v26 = 1;
LABEL_21:
      v27 = 1;
      break;
    default:
      v25 = v12;
      v26 = 0;
      v27 = 0;
      break;
  }
  VSGetLogEvent();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    type = self->_type;
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)v46 = v27;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v26;
    v47 = 1024;
    v48 = type;
    v49 = 1024;
    v50 = v25;
    v51 = 1024;
    v52 = v17;
    v53 = 1024;
    v54 = v22;
    v55 = 1024;
    v56 = v24;
    _os_log_impl(&dword_21AA84000, v28, OS_LOG_TYPE_DEFAULT, "Voice update decision: shouldDownload:%d, canUseBattery:%d. Reason: triggerType:%d, compactVoiceSelected:%d, mismatchedVoiceName:%d, activeSiriUser:%d, serverExperimentDelay:%d", buf, 0x2Cu);
  }

  if ((v27 & 1) != 0)
  {
    objc_msgSend(v4, "voiceKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSDownloadService addInProgressDownloadVoiceKey:](VSDownloadService, "addInProgressDownloadVoiceKey:", v30);
    objc_msgSend(MEMORY[0x24BEC0DA0], "downloadOptionsWithBattery:", v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAllowsCellularAccess:", 0);
    -[VSDownloadService assetsManager](self, "assetsManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __41__VSDownloadService_updateVoiceIfNeeded___block_invoke;
    v42[3] = &unk_24DD8E7A8;
    v43 = v4;
    v44 = v30;
    v33 = v30;
    objc_msgSend(v32, "downloadVoiceAsset:options:progressUpdateHandler:", v43, v31, v42);

LABEL_34:
    v36 = v41;
    goto LABEL_35;
  }
  objc_msgSend(v10, "voiceData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "type") != 4 || !objc_msgSend(MEMORY[0x24BEC0DA8], "isANECompilationPlatform"))
  {

    goto LABEL_34;
  }
  objc_msgSend(v10, "voiceData");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v41;
  if (objc_msgSend(v35, "isVoiceReadyToUse"))
  {

  }
  else
  {
    v37 = objc_msgSend(MEMORY[0x24BEC0E18], "isWatch");

    if ((v37 & 1) == 0)
    {
      VSGetLogDefault();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "voiceData");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "voiceKey");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v46 = v40;
        _os_log_impl(&dword_21AA84000, v38, OS_LOG_TYPE_DEFAULT, "Downloaded voice is not ready to use. Start ANE compiling immediately for voice: %@", buf, 0xCu);

      }
      +[VSDownloadService triggerNeuralCompiling](VSDownloadService, "triggerNeuralCompiling");
    }
  }
LABEL_35:

}

- (void)updateTrialVoiceResourceWithLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSGetLogEvent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_DEFAULT, "Updating VoiceResource for '%{public}@'", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x24BEC0E30]);
  v9 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLanguages:", v7);

  -[VSDownloadService assetsManager](self, "assetsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadVoiceResource:options:completion:", v6, 0, 0);

}

- (void)cancelDownloadForAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  dispatch_semaphore_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSLock lock](self->_updateLock, "lock");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "voiceKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[VSDownloadService removeInProgressDownloadVoiceKey:](VSDownloadService, "removeInProgressDownloadVoiceKey:", v12);

        -[VSDownloadService assetsManager](self, "assetsManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "preferredDownloadForVoice:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v15 = dispatch_semaphore_create(0);
  -[VSDownloadService assetsManager](self, "assetsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __45__VSDownloadService_cancelDownloadForAssets___block_invoke;
  v18[3] = &unk_24DD8E7D0;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "cancelDownloads:completion:", v5, v18);

  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  -[NSLock unlock](self->_updateLock, "unlock");

}

- (unint64_t)type
{
  return self->_type;
}

- (VSMobileAssetsManager)assetsManager
{
  return self->_assetsManager;
}

- (void)setAssetsManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetsManager, a3);
}

- (VSSiriServerConfiguration)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerConfig:(id)a3
{
  objc_storeStrong((id *)&self->_serverConfig, a3);
}

- (VSPreferencesInterface)preferenceInterface
{
  return self->_preferenceInterface;
}

- (void)setPreferenceInterface:(id)a3
{
  objc_storeStrong((id *)&self->_preferenceInterface, a3);
}

- (NSLock)updateLock
{
  return self->_updateLock;
}

- (void)setUpdateLock:(id)a3
{
  objc_storeStrong((id *)&self->_updateLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateLock, 0);
  objc_storeStrong((id *)&self->_preferenceInterface, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong((id *)&self->_assetsManager, 0);
}

intptr_t __45__VSDownloadService_cancelDownloadForAssets___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __41__VSDownloadService_updateVoiceIfNeeded___block_invoke(uint64_t a1, double a2, float a3)
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  double v9;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "descriptiveKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = a3;
    v12 = 2048;
    v13 = a2;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, "Voice asset downloading progress: %.2f, remainingTime: %.2f, voice: %@", (uint8_t *)&v10, 0x20u);

  }
  if (a3 < 0.0 || a3 >= 1.0)
    +[VSDownloadService removeInProgressDownloadVoiceKey:](VSDownloadService, "removeInProgressDownloadVoiceKey:", *(_QWORD *)(a1 + 40));
  if (a3 >= 1.0
    && objc_msgSend(*(id *)(a1 + 32), "type") == 4
    && objc_msgSend(MEMORY[0x24BEC0DA8], "isANECompilationPlatform")
    && (objc_msgSend(MEMORY[0x24BEC0E18], "isWatch") & 1) == 0)
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "voiceKey");
      v9 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_21AA84000, v8, OS_LOG_TYPE_DEFAULT, "Start ANE compiling immediately for voice: %@", (uint8_t *)&v10, 0xCu);

    }
    +[VSDownloadService triggerNeuralCompiling](VSDownloadService, "triggerNeuralCompiling");
  }
}

uint64_t __50__VSDownloadService_updateVoicesAndVoiceResources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(a2, "type"))
    v5 = objc_msgSend(v4, "type") == 0;
  else
    v5 = -1;

  return v5;
}

+ (id)downloadQueue
{
  if (downloadQueue_onceToken != -1)
    dispatch_once(&downloadQueue_onceToken, &__block_literal_global_1957);
  return (id)downloadQueue_downloadQueue;
}

+ (id)inProgressDownloadVoiceKeys
{
  if (inProgressDownloadVoiceKeys_onceToken != -1)
    dispatch_once(&inProgressDownloadVoiceKeys_onceToken, &__block_literal_global_18);
  return (id)inProgressDownloadVoiceKeys___inProgressDownloads;
}

+ (void)addInProgressDownloadVoiceKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  pthread_mutex_lock(&__inProgressDownloadVoiceKeysLock);
  objc_msgSend(a1, "inProgressDownloadVoiceKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  pthread_mutex_unlock(&__inProgressDownloadVoiceKeysLock);
}

+ (void)removeInProgressDownloadVoiceKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  pthread_mutex_lock(&__inProgressDownloadVoiceKeysLock);
  objc_msgSend(a1, "inProgressDownloadVoiceKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  pthread_mutex_unlock(&__inProgressDownloadVoiceKeysLock);
}

+ (void)triggerNeuralCompiling
{
  objc_msgSend(MEMORY[0x24BEC0D80], "useSiriTTSService");
  xpc_activity_run();
}

void __43__VSDownloadService_triggerNeuralCompiling__block_invoke_45(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    VSGetLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4[0] = 67109120;
      v4[1] = a2;
      _os_log_error_impl(&dword_21AA84000, v3, OS_LOG_TYPE_ERROR, "Triggered 'com.apple.voiced.neural-compiling' with error %d", (uint8_t *)v4, 8u);
    }

  }
}

void __43__VSDownloadService_triggerNeuralCompiling__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    VSGetLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4[0] = 67109120;
      v4[1] = a2;
      _os_log_error_impl(&dword_21AA84000, v3, OS_LOG_TYPE_ERROR, "Triggered 'com.apple.sirittsd.neuralCompiling' with error %d", (uint8_t *)v4, 8u);
    }

  }
}

void __48__VSDownloadService_inProgressDownloadVoiceKeys__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v1 = (void *)inProgressDownloadVoiceKeys___inProgressDownloads;
  inProgressDownloadVoiceKeys___inProgressDownloads = (uint64_t)v0;

}

void __34__VSDownloadService_downloadQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.voiced.downloadQueue", v2);
  v1 = (void *)downloadQueue_downloadQueue;
  downloadQueue_downloadQueue = (uint64_t)v0;

}

@end
