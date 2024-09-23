@implementation CLSSceneModel

- (CLSSceneModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  int v3;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CLSSceneModel *v12;
  CLSSceneModel *v13;
  objc_super v15;
  id v16;
  uint8_t buf[4];
  _BYTE v18[18];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_opt_class(), "baseSceneAnalysisVersionWithSceneAnalysisVersion:", a3);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72440]), "initWithIdentifier:error:", v8, &v16);
    v10 = v16;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "digest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v18 = v6;
        *(_WORD *)&v18[4] = 2112;
        *(_QWORD *)&v18[6] = v11;
        _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Setting up scene model version %d using scene taxonomy with digest '%@'", buf, 0x12u);

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v18 = v8;
        *(_WORD *)&v18[8] = 2112;
        *(_QWORD *)&v18[10] = v10;
        _os_log_error_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version %@, using latest: %@", buf, 0x16u);
      }
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72440]), "initWithLatestTaxonomy");
      if (!v9)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error instantiating latest scene taxonomy", buf, 2u);
        }
        v12 = 0;
        goto LABEL_14;
      }
    }
    v15.receiver = self;
    v15.super_class = (Class)CLSSceneModel;
    v13 = -[CLSTaxonomyBasedModel initWithSceneTaxonomy:](&v15, sel_initWithSceneTaxonomy_, v9);
    if (v13)
      v13->_version = v6;
    self = v13;

    v12 = self;
LABEL_14:

    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v18 = v3;
    *(_WORD *)&v18[4] = 2112;
    *(_QWORD *)&v18[6] = objc_opt_class();
    _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (id)initForTesting
{
  return -[CLSSceneModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 84);
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return a3 >> 4 < 0x271 || (a3 & 0x80000000) != 0;
}

- (id)modelInfo
{
  return objc_alloc_init(MEMORY[0x24BDBCEB8]);
}

- (BOOL)nodeIsSupported:(id)a3
{
  return objc_msgSend(a3, "networkId") == 1;
}

- (BOOL)nodeRefIsSupported:(void *)a3
{
  return PFSceneTaxonomyNodeNetworkId() == 1;
}

- (id)confidenceThresholdBySceneIdentifierForSceneNames:(id)a3 withThresholdType:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "lowercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v11);
        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);

  }
  v17.receiver = self;
  v17.super_class = (Class)CLSSceneModel;
  -[CLSTaxonomyBasedModel confidenceThresholdBySceneIdentifierForSceneNames:withThresholdType:](&v17, sel_confidenceThresholdBySceneIdentifierForSceneNames_withThresholdType_, v7, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)version
{
  return self->_version;
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;

  v3 = 33;
  if (a3 < 0x21)
    v3 = 0;
  if (a3 >= 0x54)
    return 84;
  else
    return v3;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Scene");
}

+ (unint64_t)latestVersion
{
  return 84;
}

@end
