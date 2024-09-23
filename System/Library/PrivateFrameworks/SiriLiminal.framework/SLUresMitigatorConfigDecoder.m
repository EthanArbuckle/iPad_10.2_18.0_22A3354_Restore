@implementation SLUresMitigatorConfigDecoder

- (SLUresMitigatorConfigDecoder)initWithConfigFile:(id)a3 errOut:(id *)a4
{
  id v6;
  SLUresMitigatorConfigDecoder *v7;
  uint64_t v8;
  NSString *resourcePath;
  uint64_t v10;
  NSDictionary *configDict;
  NSDictionary *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  SLUresMitigatorConfigDecoder *v23;
  objc_super v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SLUresMitigatorConfigDecoder;
  v7 = -[SLUresMitigatorConfigDecoder init](&v25, sel_init);
  if (!v7)
    goto LABEL_11;
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v8 = objc_claimAutoreleasedReturnValue();
  resourcePath = v7->_resourcePath;
  v7->_resourcePath = (NSString *)v8;

  objc_msgSend(MEMORY[0x24BE28430], "decodeJsonFromFile:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  configDict = v7->_configDict;
  v7->_configDict = (NSDictionary *)v10;

  v12 = v7->_configDict;
  if (v12)
  {
    -[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *MEMORY[0x24BE28530]);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[NSDictionary objectForKeyedSubscript:](v7->_configDict, "objectForKeyedSubscript:", CFSTR("InputOpsMap"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSDictionary objectForKeyedSubscript:](v7->_configDict, "objectForKeyedSubscript:", CFSTR("OutputMap"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing config for Ures %@"), v7->_configDict);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD1540];
  v26 = CFSTR("reason");
  v27[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 105, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {

LABEL_11:
    v23 = v7;
    goto LABEL_12;
  }
  v22 = objc_retainAutorelease(v21);
  *a4 = v22;

  v23 = 0;
LABEL_12:

  return v23;
}

- (id)getModelFile
{
  uint64_t v3;
  void *v4;
  NSString *resourcePath;
  void *v6;
  void *v7;

  v3 = *MEMORY[0x24BE28530];
  -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", *MEMORY[0x24BE28530]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    resourcePath = self->_resourcePath;
    -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)getBnnsIrWeightFile
{
  void *v3;
  NSString *resourcePath;
  void *v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", CFSTR("BnnsIrWeightFile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    resourcePath = self->_resourcePath;
    -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", CFSTR("BnnsIrWeightFile"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)getVersion
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", CFSTR("Version"));
}

- (id)getInputOpsMap
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", CFSTR("InputOpsMap"));
}

- (id)getOutputMap
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", CFSTR("OutputMap"));
}

- (id)getSupportedInputOrigins
{
  return -[NSDictionary objectForKeyedSubscript:](self->_configDict, "objectForKeyedSubscript:", CFSTR("SupportedInputOrigins"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_configDict, 0);
}

@end
