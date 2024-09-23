@implementation CLSEntityNetModel

- (CLSEntityNetModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  int v3;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CLSEntityNetModel *v11;
  CLSEntityNetModel *v12;
  objc_super v14;
  id v15;
  uint8_t buf[4];
  _BYTE v17[18];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_opt_class(), "baseSceneAnalysisVersionWithSceneAnalysisVersion:", a3);
  if (v5)
  {
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "_sceneTaxonomyIdentifierForBaseVersion:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v15 = 0;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72440]), "initWithIdentifier:error:", v7, &v15);
      v9 = v15;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "digest");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v17 = v6;
          *(_WORD *)&v17[4] = 2112;
          *(_QWORD *)&v17[6] = v10;
          _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Setting up EntityNet model version %d using scene taxonomy with digest '%@'", buf, 0x12u);

        }
        goto LABEL_14;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v17 = v7;
        *(_WORD *)&v17[8] = 2112;
        *(_QWORD *)&v17[10] = v9;
        _os_log_error_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error instantiating scene taxonomy for version %@, using latest: %@", buf, 0x16u);
      }

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72440]), "initWithLatestTaxonomy");
    if (!v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error instantiating latest scene taxonomy", buf, 2u);
      }
      v11 = 0;
      goto LABEL_20;
    }
LABEL_14:
    v14.receiver = self;
    v14.super_class = (Class)CLSEntityNetModel;
    v12 = -[CLSTaxonomyBasedModel initWithSceneTaxonomy:](&v14, sel_initWithSceneTaxonomy_, v8);
    if (v12)
      v12->_version = v6;
    self = v12;

    v11 = self;
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v17 = v3;
    *(_WORD *)&v17[4] = 2112;
    *(_QWORD *)&v17[6] = objc_opt_class();
    _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (id)initForTesting
{
  return -[CLSEntityNetModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 99);
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7F000000) == 0;
}

- (id)modelInfo
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (BOOL)nodeIsSupported:(id)a3
{
  return 1;
}

- (BOOL)nodeRefIsSupported:(void *)a3
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;

  v3 = 96;
  if (a3 < 0x60)
    v3 = 0;
  if (a3 >= 0x63)
    return 99;
  else
    return v3;
}

+ (id)_sceneTaxonomyIdentifierForBaseVersion:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("84");
  if (a3 != 96)
    v3 = 0;
  if (a3 == 99)
    return CFSTR("99");
  else
    return (id)v3;
}

+ (NSString)name
{
  return (NSString *)CFSTR("EntityNet");
}

+ (unint64_t)latestVersion
{
  return 99;
}

@end
