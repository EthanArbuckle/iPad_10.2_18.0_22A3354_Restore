@implementation _LTDAssetModel

- (_LTDAssetModel)initWithProvider:(id)a3
{
  id v5;
  _LTDAssetModel *v6;
  _LTDAssetModel *v7;
  _LTDAssetModel *v8;
  NSObject *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LTDAssetModel;
  v6 = -[_LTDAssetModel init](&v11, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v6->_provider, a3);
  if (!v5)
  {
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTDAssetModel initWithProvider:].cold.1(v9);
    goto LABEL_6;
  }
  v8 = v7;
LABEL_7:

  return v8;
}

+ (id)descriptionForAssetState:(unint64_t)a3
{
  if (a3 > 6)
    return CFSTR("Undefined");
  else
    return off_251A11588[a3];
}

- (NSString)identifier
{
  return (NSString *)-[_LTDAssetModelProtocol identifier](self->_provider, "identifier");
}

- (_LTAssetProgress)progress
{
  return (_LTAssetProgress *)-[_LTDAssetModelProtocol progress](self->_provider, "progress");
}

- (NSString)assetId
{
  return (NSString *)-[_LTDAssetModelProtocol assetId](self->_provider, "assetId");
}

- (NSString)assetLanguage
{
  return (NSString *)-[_LTDAssetModelProtocol assetLanguage](self->_provider, "assetLanguage");
}

- (NSString)assetName
{
  return (NSString *)-[_LTDAssetModelProtocol assetName](self->_provider, "assetName");
}

- (NSString)coreAssetName
{
  return (NSString *)-[_LTDAssetModelProtocol coreAssetName](self->_provider, "coreAssetName");
}

- (NSString)assetTypeName
{
  return (NSString *)-[_LTDAssetModelProtocol assetTypeName](self->_provider, "assetTypeName");
}

- (int64_t)assetVersion
{
  return -[_LTDAssetModelProtocol assetVersion](self->_provider, "assetVersion");
}

- (NSString)assetBuild
{
  return (NSString *)-[_LTDAssetModelProtocol assetBuild](self->_provider, "assetBuild");
}

- (int64_t)contentVersion
{
  return -[_LTDAssetModelProtocol contentVersion](self->_provider, "contentVersion");
}

- (int64_t)downloadSize
{
  return -[_LTDAssetModelProtocol downloadSize](self->_provider, "downloadSize");
}

- (int64_t)formatVersion
{
  return -[_LTDAssetModelProtocol formatVersion](self->_provider, "formatVersion");
}

- (NSURL)getLocalFileUrl
{
  return (NSURL *)-[_LTDAssetModelProtocol getLocalFileUrl](self->_provider, "getLocalFileUrl");
}

- (BOOL)isPremiumTextLID
{
  return -[_LTDAssetModelProtocol isPremiumTextLID](self->_provider, "isPremiumTextLID");
}

- (NSString)managedAssetType
{
  return (NSString *)-[_LTDAssetModelProtocol managedAssetType](self->_provider, "managedAssetType");
}

- (int64_t)requiredCapabilityIdentifier
{
  return -[_LTDAssetModelProtocol requiredCapabilityIdentifier](self->_provider, "requiredCapabilityIdentifier");
}

- (unint64_t)state
{
  return -[_LTDAssetModelProtocol state](self->_provider, "state");
}

- (NSArray)supportedLanguages
{
  return (NSArray *)-[_LTDAssetModelProtocol supportedLanguages](self->_provider, "supportedLanguages");
}

- (int64_t)unarchivedSize
{
  return -[_LTDAssetModelProtocol unarchivedSize](self->_provider, "unarchivedSize");
}

- (unint64_t)assetType
{
  return -[_LTDAssetModelProtocol assetType](self->_provider, "assetType");
}

- (BOOL)shouldPurgeWithLocale
{
  unint64_t v3;

  v3 = -[_LTDAssetModel assetType](self, "assetType");
  return v3 <= 8 && ((1 << v3) & 0x1C4) != 0 && -[_LTDAssetModel canBePurged](self, "canBePurged");
}

- (BOOL)isMultiLocaleAsset
{
  return -[_LTDAssetModel assetType](self, "assetType") == 6;
}

- (BOOL)isANEModel
{
  return -[_LTDAssetModel requiredCapabilityIdentifier](self, "requiredCapabilityIdentifier") != 0;
}

- (BOOL)isASRModel
{
  return -[_LTDAssetModel assetType](self, "assetType") == 2;
}

- (BOOL)isConfig
{
  return -[_LTDAssetModel assetType](self, "assetType") == 3;
}

- (BOOL)isEmpty
{
  return -[_LTDAssetModel assetType](self, "assetType") == 1;
}

- (BOOL)isMTModel
{
  return -[_LTDAssetModel assetType](self, "assetType") == 6;
}

- (BOOL)isPhrasebook
{
  return -[_LTDAssetModel assetType](self, "assetType") == 7;
}

- (BOOL)isTTSModel
{
  return -[_LTDAssetModel assetType](self, "assetType") == 8;
}

- (id)stateDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "descriptionForAssetState:", -[_LTDAssetModelProtocol state](self->_provider, "state"));
}

- (id)status
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDF63F0]);
  -[_LTDAssetModel identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDAssetModel progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithLocaleIdentifier:progress:", v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _LTDAssetModel *v4;
  _LTDAssetModel *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  BOOL v20;

  v4 = (_LTDAssetModel *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_LTDAssetModelProtocol identifier](self->_provider, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTDAssetModel identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
        goto LABEL_13;
      -[_LTDAssetModelProtocol managedAssetType](self->_provider, "managedAssetType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTDAssetModel managedAssetType](v5, "managedAssetType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_13;
      v12 = -[_LTDAssetModelProtocol assetType](self->_provider, "assetType");
      if (v12 != -[_LTDAssetModel assetType](v5, "assetType"))
        goto LABEL_13;
      -[_LTDAssetModelProtocol assetName](self->_provider, "assetName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTDAssetModel assetName](v5, "assetName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (!v15)
        goto LABEL_13;
      if (-[_LTDAssetModel assetType](self, "assetType") != 2 && -[_LTDAssetModel assetType](self, "assetType") != 5
        || (-[_LTDAssetModelProtocol assetLanguage](self->_provider, "assetLanguage"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            -[_LTDAssetModel assetLanguage](v5, "assetLanguage"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v16, "isEqualToString:", v17),
            v17,
            v16,
            v18))
      {
        v19 = -[_LTDAssetModelProtocol requiredCapabilityIdentifier](self->_provider, "requiredCapabilityIdentifier");
        v20 = v19 == -[_LTDAssetModel requiredCapabilityIdentifier](v5, "requiredCapabilityIdentifier");
      }
      else
      {
LABEL_13:
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (BOOL)refreshState
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[_LTDAssetModelProtocol refreshState](self->_provider, "refreshState");
  else
    return 0;
}

- (BOOL)isAvailable
{
  return -[_LTDAssetModelProtocol isAvailable](self->_provider, "isAvailable");
}

- (BOOL)isDownloading
{
  return -[_LTDAssetModelProtocol isDownloading](self->_provider, "isDownloading");
}

- (BOOL)isInstalled
{
  return -[_LTDAssetModelProtocol isInstalled](self->_provider, "isInstalled");
}

- (BOOL)canBePurged
{
  return -[_LTDAssetModelProtocol canBePurged](self->_provider, "canBePurged");
}

- (BOOL)supportsLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  if ((-[_LTDAssetModel assetType](self, "assetType") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[_LTDAssetModel supportedLanguages](self, "supportedLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_ltCsLocaleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v5, "containsObject:", v6);
  }
  else
  {
    -[_LTDAssetModel assetLanguage](self, "assetLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_ltLocaleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v5, "isEqualToString:", v6);
  }
  v8 = v7;

  return v8;
}

- (int64_t)compareAssetVersionReversed:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = -[_LTDAssetModel assetVersion](self, "assetVersion");
  if (v5 == objc_msgSend(v4, "assetVersion"))
  {
    v6 = -[_LTDAssetModel requiredCapabilityIdentifier](self, "requiredCapabilityIdentifier");
    if (v6 == objc_msgSend(v4, "requiredCapabilityIdentifier"))
    {
      v7 = 0;
      goto LABEL_9;
    }
    v8 = -[_LTDAssetModel requiredCapabilityIdentifier](self, "requiredCapabilityIdentifier");
    v9 = objc_msgSend(v4, "requiredCapabilityIdentifier");
  }
  else
  {
    v8 = -[_LTDAssetModel assetVersion](self, "assetVersion");
    v9 = objc_msgSend(v4, "assetVersion");
  }
  if (v8 > v9)
    v7 = -1;
  else
    v7 = 1;
LABEL_9:

  return v7;
}

- (BOOL)isNewerVersionThan:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (-[_LTDAssetModel isEqual:](self, "isEqual:", v4))
  {
    v5 = -[_LTDAssetModel assetVersion](self, "assetVersion");
    v6 = v5 > objc_msgSend(v4, "assetVersion");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isNewerCompatibleVersionThan:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[_LTDAssetModel _isCompatibleWithThisDevice](self, "_isCompatibleWithThisDevice"))
    v5 = -[_LTDAssetModel isNewerVersionThan:](self, "isNewerVersionThan:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isCompatibleWithThisDevice
{
  int64_t v3;
  int64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v3 = -[_LTDAssetModel requiredCapabilityIdentifier](self, "requiredCapabilityIdentifier");
  if (v3 > +[_LTDANEService capability](_LTDANEService, "capability"))
    return 0;
  v5 = -[_LTDAssetModel formatVersion](self, "formatVersion");
  if (!v5)
    return 1;
  v6 = v5;
  objc_msgSend(MEMORY[0x24BE2E738], "minimumSupportedConfigurationVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(MEMORY[0x24BE2E738], "maximumSupportedConfigurationVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  return v6 >= v8 && v6 <= v10;
}

- (unint64_t)downloadPriority
{
  unint64_t v2;

  v2 = -[_LTDAssetModel assetType](self, "assetType");
  if (v2 > 8)
    return 99;
  else
    return qword_249338580[v2];
}

- (int64_t)compareDownloadPriority:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[_LTDAssetModel downloadPriority](self, "downloadPriority");
  v6 = objc_msgSend(v4, "downloadPriority");

  if (v5 > v6)
    return 1;
  else
    return -1;
}

+ (id)localeIdentifiersForLanguageName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _LTPreferencesSupportedLocales(1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 2)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Var"));

    if (!v8)
    {
      v29[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v23 = v5;
    v21 = v6;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v9;
  }
  else
  {
    v21 = v6;
    v23 = v5;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = v4;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "_ltLocaleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("_"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v3, "isEqualToString:", v17);

        if (v18)
          objc_msgSend(v23, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  v5 = v23;
  v19 = (void *)objc_msgSend(v23, "copy");
  v6 = v21;
  v4 = v22;
LABEL_16:

  return v19;
}

- (id)localeIdentifiers
{
  NSArray *localeIdentifiers;
  _LTDAssetModel *v5;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  NSArray *v19;
  void *v20;
  uint64_t v21;
  unint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSArray *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x24BDAC8D0];
  localeIdentifiers = self->_localeIdentifiers;
  if (localeIdentifiers)
    return localeIdentifiers;
  v5 = self;
  objc_sync_enter(v5);
  v6 = self->_localeIdentifiers;
  if (!v6)
  {
    -[_LTDAssetModel identifier](v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("-"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    switch(-[_LTDAssetModel assetType](v5, "assetType"))
    {
      case 2uLL:
      case 8uLL:
        if (objc_msgSend(v37, "count") != 2)
          goto LABEL_25;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
        v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v11 = self->_localeIdentifiers;
        self->_localeIdentifiers = v10;

        break;
      case 4uLL:
      case 5uLL:
        v12 = (void *)objc_opt_new();
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        -[_LTDAssetModel supportedLanguages](v5, "supportedLanguages");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v39;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v39 != v15)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v16), "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v17);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v14);
        }

        v18 = (NSArray *)objc_msgSend(v12, "copy");
        v19 = self->_localeIdentifiers;
        self->_localeIdentifiers = v18;

        break;
      case 6uLL:
        v20 = (void *)objc_opt_new();
        v21 = objc_msgSend(v37, "indexOfObject:", CFSTR("partial"));
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          for (i = 2; i < objc_msgSend(v37, "count"); ++i)
          {
            objc_msgSend(v37, "objectAtIndexedSubscript:", i);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "rangeOfCharacterFromSet:", v24);

            if (v25 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v26 = (void *)objc_opt_class();
              objc_msgSend(v37, "objectAtIndexedSubscript:", i);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "localeIdentifiersForLanguageName:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "addObjectsFromArray:", v28);
            }
          }
        }
        else
        {
          v32 = v21 + 1;
          if (v21 + 1 < (unint64_t)objc_msgSend(v37, "count"))
          {
            v33 = (void *)objc_opt_class();
            objc_msgSend(v37, "objectAtIndexedSubscript:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "localeIdentifiersForLanguageName:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "addObjectsFromArray:", v35);
          }
        }
        v30 = (NSArray *)objc_msgSend(v20, "copy");
        goto LABEL_29;
      case 7uLL:
        if (objc_msgSend(v37, "count") != 2)
          goto LABEL_25;
        v29 = (void *)objc_opt_class();
        objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localeIdentifiersForLanguageName:", v20);
        v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_29:
        v36 = self->_localeIdentifiers;
        self->_localeIdentifiers = v30;

        break;
      default:
LABEL_25:
        v31 = self->_localeIdentifiers;
        self->_localeIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

        break;
    }

    objc_sync_exit(v5);
    localeIdentifiers = self->_localeIdentifiers;
    return localeIdentifiers;
  }
  v7 = v6;
  objc_sync_exit(v5);

  return v7;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDAssetModel identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDAssetModel assetTypeName](self, "assetTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDAssetModel stateDescription](self, "stateDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDAssetModel progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@ (%@) %@ %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (_LTDAssetModelProtocol)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
}

- (void)initWithProvider:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Cannot initialize an LTDAssetModel with a nil provider", v1, 2u);
}

@end
