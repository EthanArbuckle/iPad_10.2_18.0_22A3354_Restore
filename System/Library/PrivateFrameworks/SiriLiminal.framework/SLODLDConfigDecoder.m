@implementation SLODLDConfigDecoder

- (SLODLDConfigDecoder)initWithConfigFile:(id)a3
{
  id v4;
  SLODLDConfigDecoder *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SLODLDConfigDecoder *v14;
  uint64_t v15;
  NSString *resourcePath;
  NSObject *v17;
  NSString *v18;
  NSDictionary *dictionary;
  NSObject *v21;
  NSString *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSString *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SLODLDConfigDecoder;
  v5 = -[SLODLDConfigDecoder init](&v23, sel_init);
  if (!v5)
  {
LABEL_12:
    v14 = v5;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE28430], "decodeJsonFromFile:", v4);
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_9:
      objc_msgSend(v4, "stringByDeletingLastPathComponent");
      v15 = objc_claimAutoreleasedReturnValue();
      resourcePath = v5->_resourcePath;
      v5->_resourcePath = (NSString *)v15;

      v17 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v5->_resourcePath;
        *(_DWORD *)buf = 136315394;
        v25 = "-[SLODLDConfigDecoder initWithConfigFile:]";
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_213B50000, v17, OS_LOG_TYPE_DEFAULT, "%s Decoded config at path: %@", buf, 0x16u);
      }
      dictionary = v5->_dictionary;
      v5->_dictionary = v7;

      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing config for regex matcher %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1540];
  v28 = CFSTR("reason");
  v29[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 115, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {

    goto LABEL_9;
  }
  v13 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v21 = v13;
    objc_msgSend(v12, "localizedDescription");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[SLODLDConfigDecoder initWithConfigFile:]";
    v26 = 2112;
    v27 = v22;
    _os_log_error_impl(&dword_213B50000, v21, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);

  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)getConfigVersion
{
  return -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("version"));
}

- (unint64_t)getInputType
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("inputType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("PostITN")) & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("PreITN")))
  {
    v3 = 2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)getOutputSpecs
{
  return -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("outputSpecs"));
}

- (unint64_t)getPreProcessorType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE28430], "getOdldValueForKey:categoryKey:configDict:", CFSTR("preprocessing"), *MEMORY[0x24BE28528], self->_dictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("regexMapConfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (unint64_t)getTokenizerType
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE28430], "getOdldValueForKey:categoryKey:configDict:", CFSTR("tokenizer"), *MEMORY[0x24BE28528], self->_dictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spmModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (id)getRegexMapConfig
{
  void *v3;
  void *v4;
  NSString *resourcePath;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE28430], "getOdldValueForKey:categoryKey:configDict:", CFSTR("preprocessing"), *MEMORY[0x24BE28528], self->_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("regexMapConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    resourcePath = self->_resourcePath;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("regexMapConfig"));
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

- (id)getSPMModelFile
{
  void *v3;
  void *v4;
  NSString *resourcePath;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE28430], "getOdldValueForKey:categoryKey:configDict:", CFSTR("tokenizer"), *MEMORY[0x24BE28528], self->_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("spmModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    resourcePath = self->_resourcePath;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("spmModel"));
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

- (id)getSPMEncoderOptions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE28430], "getOdldValueForKey:categoryKey:configDict:", CFSTR("tokenizer"), *MEMORY[0x24BE28528], self->_dictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spmEncodeOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spmEncodeOptions"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)getBertModelFile
{
  return (id)objc_msgSend(MEMORY[0x24BE28430], "getOdldModelFileFromConfigDict:resourcePath:", self->_dictionary, self->_resourcePath);
}

- (id)getOdldModelBnnsIrWeightFile
{
  void *v3;
  void *v4;
  void *v5;
  NSString *resourcePath;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE28430], "getOdldValueForKey:categoryKey:configDict:", CFSTR("BnnsIrWeightFile"), *MEMORY[0x24BE28528], self->_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLODLDConfigDecoder getBertModelFile](self, "getBertModelFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasSuffix:", *MEMORY[0x24BE282E8])
    && (objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BnnsIrWeightFile")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    resourcePath = self->_resourcePath;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BnnsIrWeightFile"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getBertModelOutputNodes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE28430], "getOdldValueForKey:categoryKey:configDict:", *MEMORY[0x24BE28520], *MEMORY[0x24BE28528], self->_dictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("outputNodeName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("outputNodeName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)isSPMModelMmapable
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE28430], "getOdldValueForKey:categoryKey:configDict:", CFSTR("tokenizer"), *MEMORY[0x24BE28528], self->_dictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mmapModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mmapModel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");

  }
  return (char)v3;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (void)setResourcePath:(id)a3
{
  objc_storeStrong((id *)&self->_resourcePath, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end
