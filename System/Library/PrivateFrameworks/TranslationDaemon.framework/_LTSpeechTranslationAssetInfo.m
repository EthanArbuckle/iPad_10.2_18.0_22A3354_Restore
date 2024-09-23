@implementation _LTSpeechTranslationAssetInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ <-> %@ | %@ %@"), v4, v6, self->_offlineConfig, self->_allAssets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_LTSpeechTranslationAssetInfo)initWithInstalledAssets:(id)a3 catalogAssets:(id)a4 localePair:(id)a5 offlineConfig:(id)a6 assetManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _LTSpeechTranslationAssetInfo *v17;
  _LTSpeechTranslationAssetInfo *v18;
  uint64_t v19;
  NSArray *modelURLs;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  _LTSpeechTranslationAssetInfo *v26;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_LTSpeechTranslationAssetInfo;
  v17 = -[_LTSpeechTranslationAssetInfo init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetManager, a7);
    objc_storeStrong((id *)&v18->_offlineConfig, a6);
    objc_storeStrong((id *)&v18->_localePair, a5);
    objc_msgSend(v16, "modelURLsForLanguagePair:", v14);
    v19 = objc_claimAutoreleasedReturnValue();
    modelURLs = v18->_modelURLs;
    v18->_modelURLs = (NSArray *)v19;

    -[_LTDOfflineConfigurationModel pairAssetList](v18->_offlineConfig, "pairAssetList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTDOfflineConfigurationModel pairAssetConfigFile](v18->_offlineConfig, "pairAssetConfigFile");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v21)
      v24 = v22 == 0;
    else
      v24 = 1;
    if (v24)
    {
      v25 = _LTOSLogAssets();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[_LTSpeechTranslationAssetInfo initWithInstalledAssets:catalogAssets:localePair:offlineConfig:assetManager:].cold.1((uint64_t)&v18->_offlineConfig, v25);
    }
    -[_LTSpeechTranslationAssetInfo _referenceAssets:catalogAssets:](v18, "_referenceAssets:catalogAssets:", v12, v13);
    v18->_needsUpdate = -[_LTSpeechTranslationAssetInfo updateAvailableInAssets:](v18, "updateAvailableInAssets:", v13);
    if ((objc_msgSend(v14, "isPassthrough") & 1) == 0
      && !-[NSArray count](v18->_missingAssets, "count")
      && -[NSArray count](v18->_allAssets, "count")
      && !-[_LTSpeechTranslationAssetInfo _validateSymlinksForAssets:](v18, "_validateSymlinksForAssets:", v18->_mtAssets))
    {
      +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:](_LTSpeechTranslationAssetInfo, "_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:", v14, v18->_mtAssets, 0);
    }
    v26 = v18;

  }
  return v18;
}

- (void)createSymlinkDirectoryForMTAssets
{
  if (!-[NSArray count](self->_missingAssets, "count"))
  {
    if (-[NSArray count](self->_allAssets, "count"))
      +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:](_LTSpeechTranslationAssetInfo, "_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:", self->_localePair, self->_mtAssets, 0);
  }
}

- (void)_referenceAssets:(id)a3 catalogAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  _LTDAssetModel *v14;
  id v15;
  _LTDAssetModel *sourceASRModel;
  _LTDAssetModel *v17;
  void *v18;
  void *v19;
  _LTDAssetModel *v20;
  id v21;
  _LTDAssetModel *targetASRModel;
  _LTDAssetModel *v23;
  void *v24;
  _LTDAssetModel *v25;
  _LTDAssetModel *v26;
  _LTDAssetModel *v27;
  void *v28;
  void *v29;
  _LTDAssetModel *v30;
  _LTDAssetModel *v31;
  _LTDAssetModel *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  uint64_t v48;
  NSArray *mtAssets;
  uint64_t v50;
  NSArray *allAssets;
  uint64_t v52;
  NSArray *missingAssets;
  uint64_t v54;
  NSArray *missingMTAssets;
  id v56;
  _LTSpeechTranslationAssetInfo *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_LTDOfflineConfigurationModel pairAssetList](self->_offlineConfig, "pairAssetList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = _os_feature_enabled_impl();
  -[_LTLocalePair sourceLocale](self->_localePair, "sourceLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 & 1) != 0)
  {
    v56 = v6;
    v69 = 0;
    +[_LTDAssetService matchingASRAssetForLocale:error:](_LTDAssetService, "matchingASRAssetForLocale:error:", v13, &v69);
    v14 = (_LTDAssetModel *)objc_claimAutoreleasedReturnValue();
    v15 = v69;
    sourceASRModel = self->_sourceASRModel;
    self->_sourceASRModel = v14;

    v17 = self->_sourceASRModel;
    if (v17)
    {
      if (-[_LTDAssetModel isInstalled](v17, "isInstalled"))
        v18 = v10;
      else
        v18 = v59;
      objc_msgSend(v18, "addObject:", self->_sourceASRModel);
    }
    -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v15;
    +[_LTDAssetService matchingASRAssetForLocale:error:](_LTDAssetService, "matchingASRAssetForLocale:error:", v19, &v68);
    v20 = (_LTDAssetModel *)objc_claimAutoreleasedReturnValue();
    v21 = v68;

    targetASRModel = self->_targetASRModel;
    self->_targetASRModel = v20;

    v23 = self->_targetASRModel;
    if (v23)
    {
      if (-[_LTDAssetModel isInstalled](v23, "isInstalled"))
        v24 = v10;
      else
        v24 = v59;
      objc_msgSend(v24, "addObject:", self->_targetASRModel);
    }

    v6 = v56;
  }
  else
  {
    +[_LTDAssetService matchingASRAssetInAssets:forLocale:](_LTDAssetService, "matchingASRAssetInAssets:forLocale:", v7, v13);
    v25 = (_LTDAssetModel *)objc_claimAutoreleasedReturnValue();
    v26 = self->_sourceASRModel;
    self->_sourceASRModel = v25;

    v27 = self->_sourceASRModel;
    if (v27)
    {
      if (-[_LTDAssetModel isInstalled](v27, "isInstalled"))
        v28 = v10;
      else
        v28 = v59;
      objc_msgSend(v28, "addObject:", self->_sourceASRModel);
    }
    -[_LTLocalePair targetLocale](self->_localePair, "targetLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_LTDAssetService matchingASRAssetInAssets:forLocale:](_LTDAssetService, "matchingASRAssetInAssets:forLocale:", v7, v29);
    v30 = (_LTDAssetModel *)objc_claimAutoreleasedReturnValue();
    v31 = self->_targetASRModel;
    self->_targetASRModel = v30;

    v32 = self->_targetASRModel;
    if (v32)
    {
      if (-[_LTDAssetModel isInstalled](v32, "isInstalled"))
        v33 = v10;
      else
        v33 = v59;
      objc_msgSend(v33, "addObject:", self->_targetASRModel);
    }
  }
  v57 = self;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v34 = v6;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v65 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v39, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "containsObject:", v40)
          && ((objc_msgSend(v39, "isMTModel") & 1) != 0 || objc_msgSend(v39, "isPhrasebook")))
        {
          objc_msgSend(v11, "addObject:", v39);
          objc_msgSend(v10, "addObject:", v39);
          objc_msgSend(v9, "removeObject:", v40);
        }

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v9, "count"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v56 = v7;
    v41 = v7;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v61 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
          objc_msgSend(v46, "identifier", v56);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "containsObject:", v47)
            && ((objc_msgSend(v46, "isMTModel") & 1) != 0 || objc_msgSend(v46, "isPhrasebook")))
          {
            objc_msgSend(v59, "addObject:", v46);
            objc_msgSend(v58, "addObject:", v46);
            objc_msgSend(v9, "removeObject:", v47);
          }

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v43);
    }

    v7 = v56;
  }
  v48 = objc_msgSend(v11, "copy", v56);
  mtAssets = v57->_mtAssets;
  v57->_mtAssets = (NSArray *)v48;

  v50 = objc_msgSend(v10, "copy");
  allAssets = v57->_allAssets;
  v57->_allAssets = (NSArray *)v50;

  v52 = objc_msgSend(v59, "copy");
  missingAssets = v57->_missingAssets;
  v57->_missingAssets = (NSArray *)v52;

  v54 = objc_msgSend(v58, "copy");
  missingMTAssets = v57->_missingMTAssets;
  v57->_missingMTAssets = (NSArray *)v54;

}

- (BOOL)updateAvailableInAssets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = self->_allAssets;
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              if ((objc_msgSend(v9, "isNewerCompatibleVersionThan:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j)) & 1) != 0)
              {

                v15 = 1;
                goto LABEL_19;
              }
            }
            v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v6);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

- (id)speechModelURLForLocale:(id)a3
{
  _LTLocalePair *localePair;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;

  localePair = self->_localePair;
  v5 = a3;
  -[_LTLocalePair sourceLocale](localePair, "sourceLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  v8 = 40;
  if (v7)
    v8 = 32;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "getLocalFileUrl");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)speechModelVersionForLocale:(id)a3
{
  _LTLocalePair *localePair;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  localePair = self->_localePair;
  v5 = a3;
  -[_LTLocalePair targetLocale](localePair, "targetLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  v8 = 32;
  if (v7)
    v8 = 40;
  v9 = objc_msgSend(*(id *)((char *)&self->super.isa + v8), "assetVersion");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)translationModelURLs
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_allAssets;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "getLocalFileUrl", (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return self->_modelURLs;
}

- (BOOL)isCompletePassthroughModel
{
  int v3;

  v3 = -[_LTLocalePair isPassthrough](self->_localePair, "isPassthrough");
  if (v3)
    LOBYTE(v3) = -[_LTDAssetModel isInstalled](self->_sourceASRModel, "isInstalled");
  return v3;
}

- (BOOL)isCompleteBidirectionalModel
{
  BOOL v3;
  _LTDAssetModel *sourceASRModel;
  int v5;
  _LTDAssetModel *targetASRModel;
  int v7;
  int64_t v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[_LTSpeechTranslationAssetInfo _validateSymlinksForAssets:](self, "_validateSymlinksForAssets:", self->_mtAssets))
  {
    v3 = 1;
  }
  else
  {
    -[_LTSpeechTranslationAssetInfo createSymlinkDirectoryForMTAssets](self, "createSymlinkDirectoryForMTAssets");
    v3 = -[_LTSpeechTranslationAssetInfo _validateSymlinksForAssets:](self, "_validateSymlinksForAssets:", self->_mtAssets);
  }
  sourceASRModel = self->_sourceASRModel;
  if (sourceASRModel)
    v5 = -[_LTDAssetModel isInstalled](sourceASRModel, "isInstalled");
  else
    v5 = 1;
  targetASRModel = self->_targetASRModel;
  if (targetASRModel)
    v7 = -[_LTDAssetModel isInstalled](targetASRModel, "isInstalled");
  else
    v7 = 1;
  v8 = -[_LTSpeechTranslationAssetInfo _mtModelOfflineState](self, "_mtModelOfflineState");
  v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109632;
    v11[1] = v5;
    v12 = 1024;
    v13 = v7;
    v14 = 1024;
    v15 = v8 == 2;
    _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Models - sourceASR: %{BOOL}i, targetASR: %{BOOL}i, mt: %{BOOL}i", (uint8_t *)v11, 0x14u);
  }
  if (v8 == 2)
    return v3 & v5 & v7;
  else
    return 0;
}

- (int64_t)_mtModelOfflineState
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_missingAssets, "count"))
    return 0;
  if ((_anyDownloading(self->_mtAssets) & 1) != 0)
    return 1;
  v4 = self->_modelURLs;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x24BDD1580];
        v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(v10, "defaultManager", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v11) = objc_msgSend(v12, "fileExistsAtPath:", v13);
        if (!(_DWORD)v11)
        {

          return 0;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (_allInstalled(self->_mtAssets))
    return 2;
  else
    return 0;
}

- (id)availabilityInfo
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63F8]), "initWithLocales:", self->_localePair);
  v4 = -[_LTSpeechTranslationAssetInfo _mtModelOfflineState](self, "_mtModelOfflineState");
  _LTOfflineStateString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMtState:", v5);

  -[_LTDAssetModel stateDescription](self->_sourceASRModel, "stateDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceASRState:", v6);

  -[_LTDAssetModel stateDescription](self->_targetASRModel, "stateDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetASRState:", v7);

  if (v4 == 2
    || -[_LTLocalePair isPassthrough](self->_localePair, "isPassthrough")
    && _allInstalled(self->_allAssets)
    && !-[NSArray count](self->_missingAssets, "count"))
  {
    v8 = 2;
  }
  else
  {
    v8 = _anyDownloading(self->_allAssets);
  }
  objc_msgSend(v3, "setPairState:", v8);
  objc_msgSend(v3, "setNeedsUpdate:", self->_needsUpdate);
  return v3;
}

+ (id)_languagePairDirectoryForLocalePair:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[_LTOfflineAssetManager assetDirectory](_LTOfflineAssetManager, "assetDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canonicalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_validateSymlinksForAssets:(id)a3
{
  void **p_missingAssets;
  NSObject *v5;
  char v6;
  void *v7;
  _LTLocalePair **p_localePair;
  _LTLocalePair *localePair;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _LTLocalePair *v15;
  int v17;
  _LTLocalePair *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_missingAssets = (void **)&self->_missingAssets;
  if (-[NSArray count](self->_missingAssets, "count", a3) || !-[NSArray count](self->_allAssets, "count"))
  {
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_LTSpeechTranslationAssetInfo _validateSymlinksForAssets:].cold.1((uint64_t)self, p_missingAssets, v5);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    localePair = self->_localePair;
    p_localePair = &self->_localePair;
    +[_LTSpeechTranslationAssetInfo _languagePairDirectoryForLocalePair:](_LTSpeechTranslationAssetInfo, "_languagePairDirectoryForLocalePair:", localePair);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("mt-quasar-config.json"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "fileExistsAtPath:", v12);

    v13 = _LTOSLogAssets();
    v14 = v13;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = *p_localePair;
        v17 = 138543362;
        v18 = v15;
        _os_log_impl(&dword_2491B9000, v14, OS_LOG_TYPE_INFO, "Asset symlink skip accounting for %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[_LTSpeechTranslationAssetInfo _validateSymlinksForAssets:].cold.2();
    }

  }
  return v6;
}

+ (void)_createSymlink:(id)a3 target:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = a4;
  v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[_LTSpeechTranslationAssetInfo _createSymlink:target:error:].cold.2(v9, v7);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createSymbolicLinkAtPath:withDestinationPath:error:", v11, v12, a5);

  if (*a5)
  {
    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[_LTSpeechTranslationAssetInfo _createSymlink:target:error:].cold.1();
  }

}

+ (void)_createSymlinksFromDirectory:(id)a3 target:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id obj;
  id v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, a5);

  if (*a5)
  {
    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_LTSpeechTranslationAssetInfo _createSymlinksFromDirectory:target:error:].cold.3();
  }
  else
  {
    objc_msgSend(v8, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v13, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (*a5)
    {
      v15 = _LTOSLogAssets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[_LTSpeechTranslationAssetInfo _createSymlinksFromDirectory:target:error:].cold.2();
    }
    else
    {
      v27 = a1;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v25 = v14;
      obj = v14;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v9, "URLByAppendingPathComponent:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "URLByAppendingPathComponent:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 0;
            objc_msgSend(v22, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v23, &v28);

            if (v28)
            {
              v24 = _LTOSLogAssets();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                +[_LTSpeechTranslationAssetInfo _createSymlinksFromDirectory:target:error:].cold.1(v33, v24, v22, &v34);
              objc_msgSend(v27, "_createSymlinksFromDirectory:target:error:", v22, v21, a5);
            }
            else
            {
              objc_msgSend(v27, "_createSymlink:target:error:", v22, v21, a5);
            }
            if (*a5)
            {

              goto LABEL_22;
            }

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v17)
            continue;
          break;
        }
      }
LABEL_22:

      v14 = v25;
    }

  }
}

+ (BOOL)_createSymlinkDirectoryForLocalePair:(id)a3 assets:(id)a4 validateIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id obj;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint8_t buf[4];
  id v104;
  __int16 v105;
  void *v106;
  _BYTE v107[128];
  uint64_t v108;

  v5 = a5;
  v108 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && objc_msgSend(v9, "count"))
  {
    if ((objc_msgSend(v8, "isPassthrough") & 1) != 0 || objc_msgSend(v8, "isVariantPair"))
    {
      v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = v11;
        objc_msgSend(v8, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v104 = v13;
        _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_INFO, "Skipping symlinks creation for passthrough / variant pair %{public}@", buf, 0xCu);

      }
      goto LABEL_7;
    }
    v16 = _LTOSLogAssets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = v16;
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v104 = v18;
      _os_log_impl(&dword_2491B9000, v17, OS_LOG_TYPE_INFO, "Updating symlinks for %{public}@", buf, 0xCu);

    }
    v102 = 0;
    +[_LTDAssetService configAssetIfAvailableWithError:](_LTDAssetService, "configAssetIfAvailableWithError:", &v102);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v102;
    if (v20)
    {
      v21 = v20;
      v22 = _LTOSLogAssets();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.10();
      v14 = 0;
      goto LABEL_74;
    }
    objc_msgSend(v19, "getLocalFileUrl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v28 = _LTOSLogAssets();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.1(v28);
      v21 = 0;
      v14 = 0;
      goto LABEL_73;
    }
    v101 = 0;
    +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:", &v101);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v101;
    if (v25)
    {
      v21 = v25;
      v26 = _LTOSLogAssets();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.9();
      v14 = 0;
      v27 = v24;
      goto LABEL_72;
    }
    objc_msgSend(v8, "canonicalIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v24;
    objc_msgSend(v24, "offlinePairConfigurationWithIdentifier:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = v30;
    objc_msgSend(v30, "pairAssetConfigFile");
    v31 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)v31;
    if (!v31)
    {
      v46 = _LTOSLogAssets();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.2(v46);
      v21 = 0;
      v14 = 0;
      v45 = v30;
      v27 = v81;
LABEL_71:

LABEL_72:
LABEL_73:

LABEL_74:
      goto LABEL_8;
    }
    v32 = v31;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_languagePairDirectoryForLocalePair:", v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByAppendingPathComponent:", v32);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v23;
    v85 = v33;
    if (v5)
    {
      v35 = v19;
      v36 = v34;
      objc_msgSend(v34, "URLByAppendingPathComponent:", CFSTR("mt-quasar-config.json"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 0;
      objc_msgSend(v33, "destinationOfSymbolicLinkAtPath:error:", v38, &v100);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v100;

      v89 = v37;
      objc_msgSend(v37, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v33, "fileExistsAtPath:", v41) || v40)
      {

      }
      else
      {
        objc_msgSend(v79, "path");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v39, "isEqualToString:", v42);

        if (v43)
        {
          v44 = _LTOSLogAssets();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v104 = v8;
            _os_log_impl(&dword_2491B9000, v44, OS_LOG_TYPE_INFO, "Skipping symlink directory creation, found quasar symlink on disk for %{public}@", buf, 0xCu);
          }

          v21 = 0;
          v14 = 0;
          v19 = v35;
          v23 = v83;
          v45 = v80;
          v27 = v81;
          goto LABEL_70;
        }
      }

      v19 = v35;
      v23 = v83;
      v33 = v85;
      v34 = v36;
    }
    v78 = v34;
    objc_msgSend(v34, "URLByAppendingPathExtension:", CFSTR("tmp"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeItemAtURL:error:", v47, 0);
    v99 = 0;
    objc_msgSend(v33, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v47, 1, 0, &v99);
    v89 = v47;
    v77 = v99;
    if (v77)
    {
      v48 = _LTOSLogAssets();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v14 = 0;
        v45 = v80;
        v27 = v81;
        goto LABEL_69;
      }
      v21 = v77;
      +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.8((uint64_t)v47);
      v14 = 0;
      v45 = v80;
      v27 = v81;
      v36 = v34;
LABEL_70:

      goto LABEL_71;
    }
    objc_msgSend(v47, "URLByAppendingPathComponent:", CFSTR("mt-quasar-config.json"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "path");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0;
    objc_msgSend(v33, "createSymbolicLinkAtPath:withDestinationPath:error:", v50, v51, &v98);
    v52 = v98;

    v76 = v52;
    if (v52)
    {
      v53 = _LTOSLogAssets();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.7();
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v19);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    obj = v10;
    v54 = v85;
    v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    if (!v88)
      goto LABEL_58;
    v87 = *(_QWORD *)v95;
LABEL_44:
    v55 = 0;
    while (1)
    {
      if (*(_QWORD *)v95 != v87)
        objc_enumerationMutation(obj);
      v56 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v55);
      if (objc_msgSend(v56, "isMTModel"))
        break;
      if (objc_msgSend(v56, "isPhrasebook"))
      {
        objc_msgSend(v56, "identifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "identifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKeyedSubscript:", v57, v62);

        objc_msgSend(v47, "URLByAppendingPathComponent:", v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "getLocalFileUrl");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = _LTOSLogAssets();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v104 = v63;
          v105 = 2114;
          v106 = v59;
          _os_log_impl(&dword_2491B9000, v64, OS_LOG_TYPE_INFO, "Creating link from %{public}@ to %{public}@", buf, 0x16u);
        }
        objc_msgSend(v59, "path");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "path");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0;
        objc_msgSend(v85, "createSymbolicLinkAtPath:withDestinationPath:error:", v65, v66, &v92);
        v61 = v92;

        if (v61)
        {
          v69 = _LTOSLogAssets();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.6();

          v19 = v75;
          v23 = v83;
          v45 = v80;
          v27 = v81;
          v54 = v85;
          goto LABEL_66;
        }

        v23 = v83;
        v54 = v85;
        goto LABEL_55;
      }
LABEL_56:
      if (v88 == ++v55)
      {
        v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
        if (v88)
          goto LABEL_44;
LABEL_58:

        v19 = v75;
        if (v76)
        {
          v61 = 0;
          v45 = v80;
          v27 = v81;
LABEL_67:
          objc_msgSend(v54, "removeItemAtURL:error:", v47, 0);
          v14 = 0;
        }
        else
        {
          v91 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v86, 0, &v91);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v91;
          if (v61)
          {
            v71 = _LTOSLogAssets();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.4();
          }
          objc_msgSend(v47, "URLByAppendingPathComponent:", CFSTR("assets.json"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "writeToURL:atomically:", v72, 1);

          objc_msgSend(v85, "removeItemAtURL:error:", v78, 0);
          v90 = 0;
          objc_msgSend(v85, "moveItemAtURL:toURL:error:", v47, v78, &v90);
          v73 = v90;
          if (v73)
          {
            v74 = _LTOSLogAssets();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.3();
          }

          v14 = 1;
          v23 = v83;
          v45 = v80;
          v27 = v81;
        }

LABEL_69:
        v21 = v77;
        v36 = v78;
        goto LABEL_70;
      }
    }
    objc_msgSend(v56, "coreAssetName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "identifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setObject:forKeyedSubscript:", v57, v58);

    objc_msgSend(v47, "URLByAppendingPathComponent:", v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "getLocalFileUrl");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    objc_msgSend(a1, "_createSymlinksFromDirectory:target:error:", v60, v59, &v93);
    v61 = v93;

    if (v61)
    {
      v67 = _LTOSLogAssets();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:].cold.5();
      v19 = v75;
      v45 = v80;
      v27 = v81;
LABEL_66:

      v47 = v89;
      goto LABEL_67;
    }
LABEL_55:

    v47 = v89;
    goto LABEL_56;
  }
LABEL_7:
  v14 = 0;
LABEL_8:

  return v14;
}

- (void)downloadAssetsUserInitiated:(BOOL)a3 queue:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  NSObject *v8;
  NSObject *v9;
  _LTLocalePair *localePair;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _LTLocalePair *v20;
  NSObject *v21;
  void *v22;
  NSObject *queue;
  id v24;
  NSArray *obj;
  _QWORD block[4];
  id v27;
  __int128 *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  __int128 *p_buf;
  _QWORD *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  _LTLocalePair *v42;
  uint8_t v43[4];
  uint64_t v44;
  uint8_t v45[128];
  __int128 buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v6 = a3;
  v51 = *MEMORY[0x24BDAC8D0];
  queue = a4;
  v24 = a5;
  if (-[NSArray count](self->_missingAssets, "count"))
  {
    v8 = dispatch_group_create();
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      localePair = self->_localePair;
      v11 = v9;
      -[_LTLocalePair identifier](localePair, "identifier", queue);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, "Requested to download asset for: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__10;
    v49 = __Block_byref_object_dispose__10;
    v50 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__10;
    v41[4] = __Block_byref_object_dispose__10;
    v42 = self->_localePair;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__10;
    v39[4] = __Block_byref_object_dispose__10;
    -[NSArray arrayByAddingObjectsFromArray:](self->_missingMTAssets, "arrayByAddingObjectsFromArray:", self->_mtAssets);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = self->_missingAssets;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v36;
      v15 = v6 | 2;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v18 = _LTOSLogAssets();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v43 = 138543362;
            v44 = v17;
            _os_log_impl(&dword_2491B9000, v18, OS_LOG_TYPE_INFO, "Starting download for asset with attributes: %{public}@", v43, 0xCu);
          }
          dispatch_group_enter(v8);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke;
          v31[3] = &unk_251A13AB0;
          p_buf = &buf;
          v34 = v41;
          v32 = v8;
          +[_LTDAssetService downloadAsset:options:progress:completion:](_LTDAssetService, "downloadAsset:options:progress:completion:", v17, v15, 0, v31);

        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v13);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78___LTSpeechTranslationAssetInfo_downloadAssetsUserInitiated_queue_completion___block_invoke_22;
    block[3] = &unk_251A11528;
    v28 = &buf;
    v29 = v41;
    v30 = v39;
    v27 = v24;
    dispatch_group_notify(v8, queue, block);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v19 = _LTOSLogAssets();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = self->_localePair;
      v21 = v19;
      -[_LTLocalePair identifier](v20, "identifier", queue);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_2491B9000, v21, OS_LOG_TYPE_INFO, "No downloadable assets missing asset for: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    if (v24)
      (*((void (**)(id, _QWORD))v24 + 2))(v24, 0);
  }

}

- (void)purgeAssetUserInitiated:(BOOL)a3 queue:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  NSObject *v7;
  _LTOfflineAssetManager *assetManager;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  NSObject *queue;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  void *v40;
  _QWORD block[4];
  id v42;
  __int128 *v43;
  id v44;
  _QWORD v45[5];
  NSObject *v46;
  __int128 *p_buf;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t v59[4];
  void *v60;
  __int16 v61;
  _BOOL4 v62;
  __int128 buf;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;

  v6 = a3;
  v68 = *MEMORY[0x24BDAC8D0];
  queue = a4;
  v34 = a5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[_LTOfflineAssetManager assetDirectory](_LTOfflineAssetManager, "assetDirectory");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTOfflineAssetManager assetIdentifierReferenceCountDictionary](self->_assetManager, "assetIdentifierReferenceCountDictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _LTOSLogAssets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    assetManager = self->_assetManager;
    v9 = v7;
    -[_LTOfflineAssetManager assetIdentifierReferenceCountDictionary](assetManager, "assetIdentifierReferenceCountDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Reference counts before purge %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__10;
  v66 = __Block_byref_object_dispose__10;
  v67 = 0;
  v11 = dispatch_group_create();
  -[_LTLocalePair identifier](self->_localePair, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "URLByAppendingPathComponent:", v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v36, "fileExistsAtPath:", v13);

  if ((v14 & 1) != 0)
  {
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 138543618;
      v60 = v37;
      v61 = 1024;
      v62 = v6;
      _os_log_impl(&dword_2491B9000, v15, OS_LOG_TYPE_DEFAULT, "Starting purge for %{public}@; userInitiated: %{BOOL}i",
        v59,
        0x12u);
    }
    v56 = 0;
    objc_msgSend(v36, "removeItemAtURL:error:", v37, &v56);
    v32 = v56;
    if (v32)
    {
      v16 = _LTOSLogAssets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[_LTSpeechTranslationAssetInfo purgeAssetUserInitiated:queue:completion:].cold.1((uint64_t)v37);
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v18 = self->_allAssets;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24 || objc_msgSend(v24, "integerValue") <= 1)
            objc_msgSend(v17, "addObject:", v22);

        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v19);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v17;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v49 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          v29 = (id)_LTOSLogAssets();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v28, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v59 = 138543362;
            v60 = v30;
            _os_log_impl(&dword_2491B9000, v29, OS_LOG_TYPE_INFO, "Starting purge for asset %{public}@", v59, 0xCu);

          }
          dispatch_group_enter(v11);
          v45[0] = MEMORY[0x24BDAC760];
          v45[1] = 3221225472;
          v45[2] = __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke;
          v45[3] = &unk_251A13AD8;
          v45[4] = v28;
          p_buf = &buf;
          v46 = v11;
          +[_LTDAssetService purgeAsset:completion:](_LTDAssetService, "purgeAsset:completion:", v28, v45);

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v25);
    }

    objc_initWeak((id *)v59, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74___LTSpeechTranslationAssetInfo_purgeAssetUserInitiated_queue_completion___block_invoke_25;
    block[3] = &unk_251A13B00;
    objc_copyWeak(&v44, (id *)v59);
    v43 = &buf;
    v42 = v34;
    dispatch_group_notify(v11, queue, block);

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)v59);

  }
  else
  {
    v31 = _LTOSLogAssets();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v59 = 138543362;
      v60 = v37;
      _os_log_impl(&dword_2491B9000, v31, OS_LOG_TYPE_INFO, "Language pair directory doesn't exist %{public}@; nothing to purge",
        v59,
        0xCu);
    }
    v32 = 0;
  }

  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURLs, 0);
  objc_storeStrong((id *)&self->_missingMTAssets, 0);
  objc_storeStrong((id *)&self->_missingAssets, 0);
  objc_storeStrong((id *)&self->_mtAssets, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_targetASRModel, 0);
  objc_storeStrong((id *)&self->_sourceASRModel, 0);
  objc_storeStrong((id *)&self->_offlineConfig, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

- (void)initWithInstalledAssets:(uint64_t)a1 catalogAssets:(void *)a2 localePair:offlineConfig:assetManager:.cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v2, v5, "Malformed config asset %@", v6);

  OUTLINED_FUNCTION_9();
}

- (void)_validateSymlinksForAssets:(void *)a3 .cold.1(uint64_t a1, void **a2, void *a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  v8 = objc_msgSend(*(id *)(a1 + 48), "count");
  v9 = 138543874;
  v10 = v4;
  v11 = 2048;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  _os_log_error_impl(&dword_2491B9000, v6, OS_LOG_TYPE_ERROR, "Asset symlink validation for %{public}@ failed due to missing assets %zu or no assets %zu", (uint8_t *)&v9, 0x20u);

}

- (void)_validateSymlinksForAssets:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Asset on disk quasar symlink not found for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlink:target:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to link model file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlink:(void *)a1 target:(void *)a2 error:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = a2;
  v7 = 2114;
  v8 = v4;
  _os_log_debug_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEBUG, "Creating link from %{public}@ to %{public}@", (uint8_t *)&v5, 0x16u);

}

+ (void)_createSymlinksFromDirectory:(void *)a3 target:(_QWORD *)a4 error:.cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_debug_impl(&dword_2491B9000, v7, OS_LOG_TYPE_DEBUG, "File is a directory, further descending: %{public}@", a1, 0xCu);

}

+ (void)_createSymlinksFromDirectory:target:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to obtain content of locale model files directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinksFromDirectory:target:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to create model directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinkDirectoryForLocalePair:(void *)a1 assets:validateIfNeeded:.cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "assetVersion");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v1, v2, "Failed to get local file URL for configuration [ver: %zd]", v3);

  OUTLINED_FUNCTION_9();
}

+ (void)_createSymlinkDirectoryForLocalePair:(void *)a1 assets:validateIfNeeded:.cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "canonicalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v1, v3, "Failed to find offline configuration for pair: %{public}@", v4);

  OUTLINED_FUNCTION_9();
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to rename temp language pair directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to serialize JSON data for asset identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to create symlinks for model directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to link model file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to link mt-quasar-config.json: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinkDirectoryForLocalePair:(uint64_t)a1 assets:validateIfNeeded:.cold.8(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v1, v2, "Failed to create directory '%{public}@': %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read offline configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_createSymlinkDirectoryForLocalePair:assets:validateIfNeeded:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read asset configuration: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)purgeAssetUserInitiated:(uint64_t)a1 queue:completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v1, v2, "Error deleting directory %{public}@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_2();
}

@end
