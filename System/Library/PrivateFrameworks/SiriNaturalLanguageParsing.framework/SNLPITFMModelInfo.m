@implementation SNLPITFMModelInfo

- (SNLPITFMModelInfo)initWithType:(unint64_t)a3 loggingComponent:(int)a4 errorDomain:(id)a5
{
  id v9;
  SNLPITFMModelInfo *v10;
  SNLPITFMModelInfo *v11;
  void *v12;
  uint64_t loggingComponent;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  NSString *loggingComponentString;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SNLPITFMModelInfo;
  v10 = -[SNLPITFMModelInfo init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_loggingComponent = a4;
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_errorDomain, a5);
    v12 = (void *)MEMORY[0x1E0CB3940];
    loggingComponent = v11->_loggingComponent;
    if (loggingComponent >= 8)
    {
      SNLPOSLoggerForCategory(4);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "<UNDEFINED_COMPONENT>";
        v22 = 2048;
        v23 = loggingComponent;
        _os_log_impl(&dword_1C2196000, v15, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", buf, 0x16u);
      }

      v14 = "<UNDEFINED_COMPONENT>";
    }
    else
    {
      v14 = off_1E7BED840[loggingComponent];
    }
    objc_msgSend(v12, "stringWithUTF8String:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    loggingComponentString = v11->_loggingComponentString;
    v11->_loggingComponentString = (NSString *)v16;

  }
  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (int)loggingComponent
{
  return self->_loggingComponent;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (NSString)loggingComponentString
{
  return self->_loggingComponentString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingComponentString, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

+ (id)stringForModelType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E7BED7A8[a3];
}

@end
