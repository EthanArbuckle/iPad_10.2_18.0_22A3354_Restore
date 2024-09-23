@implementation _LTDMAAssetModel

- (_LTDMAAssetModel)initWithMAAsset:(id)a3
{
  id v5;
  _LTDMAAssetModel *v6;
  _LTDMAAssetModel *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _LTAssetProgress *progress;
  _LTDMAAssetModel *v12;
  NSObject *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTDMAAssetModel;
  v6 = -[_LTDMAAssetModel init](&v15, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v6->_maAsset, a3);
  if (!v7->_maAsset)
  {
    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_LTDMAAssetModel initWithMAAsset:].cold.1(v13);
    goto LABEL_8;
  }
  v8 = (void *)MEMORY[0x24BDF63B8];
  -[_LTDMAAssetModel identifier](v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "discreteProgressWithIdentifier:totalUnitCount:", v9, -[_LTDMAAssetModel downloadSize](v7, "downloadSize"));
  v10 = objc_claimAutoreleasedReturnValue();
  progress = v7->_progress;
  v7->_progress = (_LTAssetProgress *)v10;

  if (-[_LTDMAAssetModel isInstalled](v7, "isInstalled"))
    -[_LTAssetProgress setOfflineState:](v7->_progress, "setOfflineState:", 2);
  v12 = v7;
LABEL_9:

  return v12;
}

+ (id)modelFromAsset:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_attributes
{
  return (id)-[MAAsset attributes](self->_maAsset, "attributes");
}

- (NSString)identifier
{
  NSString *identifier;
  NSString **p_identifier;
  void *v5;
  unint64_t v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  const __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;

  p_identifier = &self->_identifier;
  identifier = self->_identifier;
  if (!identifier)
  {
    -[_LTDMAAssetModel assetName](self, "assetName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_storeStrong((id *)p_identifier, v5);
LABEL_15:

      identifier = *p_identifier;
      return identifier;
    }
    v6 = -[_LTDMAAssetModel assetType](self, "assetType");
    switch(v6)
    {
      case 5uLL:
        v10 = *p_identifier;
        v11 = CFSTR("LanguageDetectorAssets-en-US");
        break;
      case 4uLL:
        v10 = *p_identifier;
        v11 = CFSTR("SpeechEndpoint-en-US");
        break;
      case 2uLL:
        -[_LTDMAAssetModel assetLanguage](self, "assetLanguage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("ASR-"), "stringByAppendingString:", v7);
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = self->_identifier;
        self->_identifier = v8;

        goto LABEL_15;
      default:
        v12 = _LTOSLogAssets();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[_LTDMAAssetModel identifier].cold.1((uint64_t)self, v12, v13, v14, v15, v16, v17, v18);
        -[_LTDMAAssetModel assetId](self, "assetId");
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        v10 = self->_identifier;
        self->_identifier = v19;
LABEL_14:

        goto LABEL_15;
    }
    *p_identifier = &v11->isa;
    goto LABEL_14;
  }
  return identifier;
}

- (NSString)assetId
{
  return (NSString *)-[MAAsset assetId](self->_maAsset, "assetId");
}

- (NSString)assetName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AssetName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssetName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)coreAssetName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[_LTDMAAssetModel assetName](self, "assetName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_LTDMAAssetModel assetType](self, "assetType") == 6
    && (objc_msgSend(v3, "containsString:", CFSTR("-partial")) & 1) != 0)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    if ((unint64_t)objc_msgSend(v5, "count") >= 4
      && (objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 3),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("partial")),
          v6,
          v7))
    {
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "count") - 2);
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "count") - 2);
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR("-"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[_LTDMAAssetModel coreAssetName].cold.1((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
      v8 = v3;
    }
    v9 = v8;

  }
  else
  {
    v9 = v3;
  }

  return (NSString *)v9;
}

- (NSString)assetTypeName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)objc_opt_new();
  }

  return (NSString *)v6;
}

- (unint64_t)assetType
{
  unint64_t v2;
  void *v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v2 = (unint64_t)self;
  v24 = *MEMORY[0x24BDAC8D0];
  -[_LTDMAAssetModel assetTypeName](self, "assetTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "characterAtIndex:", 0);
    if (v4 > 76)
    {
      switch(v4)
      {
        case 'M':
          v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("MT")) == 0;
          v6 = 6;
          break;
        case 'P':
          v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("PB")) == 0;
          v6 = 7;
          break;
        case 'e':
          v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("endpointer")) == 0;
          v6 = 4;
          break;
        default:
LABEL_27:
          v17 = _LTOSLogAssets();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v22 = 138543362;
            v23 = v3;
            _os_log_impl(&dword_2491B9000, v17, OS_LOG_TYPE_INFO, "No matching MA asset model type for %{public}@", (uint8_t *)&v22, 0xCu);
          }
          objc_msgSend((id)v2, "_attributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("__Empty"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend((id)v2, "_attributes");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("__Empty"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v2) = objc_msgSend(v21, "isEqualToString:", CFSTR("Empty"));

          }
          else
          {
            LODWORD(v2) = objc_msgSend(0, "isEqualToString:", CFSTR("Empty"));
          }

          v2 = v2;
          goto LABEL_26;
      }
    }
    else
    {
      switch(v4)
      {
        case 'A':
          v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("ASR")) == 0;
          v6 = 2;
          break;
        case 'C':
          v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("Config")) == 0;
          v6 = 3;
          break;
        case 'L':
          v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("LID")) == 0;
          v6 = 5;
          break;
        default:
          goto LABEL_27;
      }
    }
    if (v5)
      v2 = 0;
    else
      v2 = v6;
    goto LABEL_26;
  }
  objc_msgSend((id)v2, "maAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.MobileAsset.SpeechEndpointAssets")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.MobileAsset.LanguageDetectorAssets")) & 1) != 0)
  {
    v2 = 5;
  }
  else
  {
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTDMAAssetModel assetType].cold.1(v2, v9, v10, v11, v12, v13, v14, v15);
    v2 = 0;
  }

LABEL_26:
  return v2;
}

- (NSString)managedAssetType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AssetType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssetType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)objc_opt_new();
  }

  return (NSString *)v6;
}

- (int64_t)assetVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AssetVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssetVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v7 = objc_msgSend(0, "integerValue");
  }

  return v7;
}

- (NSString)assetBuild
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Build"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Build"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (int64_t)formatVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FormatVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FormatVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v7 = objc_msgSend(0, "integerValue");
  }

  return v7;
}

- (int64_t)contentVersion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE66A90];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE66A90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = objc_msgSend(0, "integerValue");
  }

  return v8;
}

- (NSURL)getLocalFileUrl
{
  return (NSURL *)-[MAAsset getLocalFileUrl](self->_maAsset, "getLocalFileUrl");
}

- (int64_t)downloadSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE66AA0];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE66AA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = objc_msgSend(0, "integerValue");
  }

  return v8;
}

- (int64_t)unarchivedSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE66AB8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE66AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = objc_msgSend(0, "integerValue");
  }

  return v8;
}

- (BOOL)isPremiumTextLID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Footprint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Footprint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Premium"));

  }
  else
  {
    v7 = objc_msgSend(0, "isEqualToString:", CFSTR("Premium"));
  }

  return v7;
}

+ (id)splitANECapabilityFromIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("0")) & 1) != 0 || objc_msgSend(v6, "integerValue") >= 1)
  {
    objc_msgSend(v5, "removeLastObject");
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("-"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = v3;
    v10[1] = CFSTR("0");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (int64_t)requiredCapabilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  if (-[_LTDMAAssetModel assetType](self, "assetType") != 6)
    return 0;
  v3 = (void *)objc_opt_class();
  -[_LTDMAAssetModel assetName](self, "assetName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "splitANECapabilityFromIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (NSString)assetLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Language"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset attributes](self->_maAsset, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Language"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSArray)supportedLanguages
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Languages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v3, "lt_ensureElementType:", objc_opt_class()))
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {

    v3 = 0;
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (unint64_t)state
{
  unint64_t v3;
  unint64_t result;
  void *v5;
  unint64_t v6;

  if (!-[MAAsset state](self->_maAsset, "state"))
    -[MAAsset refreshState](self->_maAsset, "refreshState");
  v3 = -[MAAsset state](self->_maAsset, "state");
  result = 1;
  switch(v3)
  {
    case 0uLL:
    case 6uLL:
      result = v3;
      break;
    case 1uLL:
      -[_LTDMAAssetModel progress](self, "progress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "offlineState");

      if (v6 >= 4)
        goto LABEL_8;
      result = 3 - v6;
      break;
    case 2uLL:
      return result;
    case 3uLL:
      result = 5;
      break;
    case 4uLL:
LABEL_8:
      result = 2;
      break;
    case 5uLL:
      result = 4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)refreshState
{
  return -[MAAsset refreshState](self->_maAsset, "refreshState");
}

- (BOOL)isAvailable
{
  return -[_LTDMAAssetModel state](self, "state") == 3 || -[_LTDMAAssetModel state](self, "state") == 0;
}

- (BOOL)isDownloading
{
  return -[_LTDMAAssetModel state](self, "state") == 2;
}

- (BOOL)canBePurged
{
  return -[_LTDMAAssetModel state](self, "state") != 4;
}

- (BOOL)isInstalled
{
  unint64_t v3;
  void *v5;
  char v6;

  v3 = -[_LTDMAAssetModel state](self, "state");
  if (v3 > 6)
    return 0;
  if (((1 << v3) & 0x72) != 0)
    return 1;
  if (((1 << v3) & 0xC) != 0)
    return 0;
  -[_LTDMAAssetModel progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  return v6;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[MAAsset attributes](self->_maAsset, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (_LTAssetProgress)progress
{
  return self->_progress;
}

- (MAAsset)maAsset
{
  return self->_maAsset;
}

- (void)setMaAsset:(id)a3
{
  objc_storeStrong((id *)&self->_maAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_maAsset, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithMAAsset:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Failed to initialize an LTDMAAssetModel with a nil MAAsset", v1, 2u);
}

- (void)identifier
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Failed to derive an asset identifier for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)coreAssetName
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Failed to derive core asset name for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)assetType
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Failed to derive an asset type for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

@end
