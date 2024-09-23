@implementation KTSelfValidationURIDiagnostics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[KTSelfValidationURIDiagnostics ktVerificationInfoDiagnosticsJson](self, "ktVerificationInfoDiagnosticsJson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("KTVerificationInfo"));

  -[KTSelfValidationURIDiagnostics transparentDataDiagnosticsJson](self, "transparentDataDiagnosticsJson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("transparentData"));

  -[KTSelfValidationURIDiagnostics result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("result"));

  -[KTSelfValidationURIDiagnostics requestTime](self, "requestTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[KTSelfValidationURIDiagnostics requestTime](self, "requestTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("requestTime"));

  }
  -[KTSelfValidationURIDiagnostics error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDE84F8];
    -[KTSelfValidationURIDiagnostics error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cleanseErrorForXPC:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("error"));

  }
}

- (KTSelfValidationURIDiagnostics)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  KTSelfValidationURIDiagnostics *v17;
  KTSelfValidationURIDiagnostics *v18;
  void *v19;
  const __CFString *v20;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = a3;
  +[KTSelfValidationDiagnostics jsonClasses](KTSelfValidationDiagnostics, "jsonClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("KTVerificationInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[KTSelfValidationDiagnostics jsonClasses](KTSelfValidationDiagnostics, "jsonClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("transparentData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("error"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_0 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_0, &__block_literal_global_0);
    v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v13, OS_LOG_TYPE_ERROR, "KTSelfValidationURIDiagnostics: ktVerificationInfoDiagnosticsJson missing", buf, 2u);
    }
  }
  v14 = v8;
  if (!v8)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_0 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_0, &__block_literal_global_16);
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_21A250000, v15, OS_LOG_TYPE_ERROR, "KTSelfValidationURIDiagnostics: transparentDataDiagnosticsJson missing", v23, 2u);
    }
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_0 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_0, &__block_literal_global_18);
    v16 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21A250000, v16, OS_LOG_TYPE_ERROR, "KTSelfValidationURIDiagnostics: result missing", v22, 2u);
    }
    v14 = (void *)MEMORY[0x24BDBD1B8];
  }
  v17 = objc_alloc_init(KTSelfValidationURIDiagnostics);
  v18 = v17;
  if (v6)
    v19 = v6;
  else
    v19 = (void *)MEMORY[0x24BDBD1B8];
  -[KTSelfValidationURIDiagnostics setKtVerificationInfoDiagnosticsJson:](v17, "setKtVerificationInfoDiagnosticsJson:", v19);
  -[KTSelfValidationURIDiagnostics setTransparentDataDiagnosticsJson:](v18, "setTransparentDataDiagnosticsJson:", v14);
  if (v9)
    v20 = v9;
  else
    v20 = CFSTR("-");
  -[KTSelfValidationURIDiagnostics setResult:](v18, "setResult:", v20);
  -[KTSelfValidationURIDiagnostics setError:](v18, "setError:", v11);
  -[KTSelfValidationURIDiagnostics setRequestTime:](v18, "setRequestTime:", v12);

  return v18;
}

void __48__KTSelfValidationURIDiagnostics_initWithCoder___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __48__KTSelfValidationURIDiagnostics_initWithCoder___block_invoke_15()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

void __48__KTSelfValidationURIDiagnostics_initWithCoder___block_invoke_17()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_0;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_0 = (uint64_t)v0;

}

- (BOOL)isEqual:(id)a3
{
  KTSelfValidationURIDiagnostics *v4;
  KTSelfValidationURIDiagnostics *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;

  v4 = (KTSelfValidationURIDiagnostics *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[KTSelfValidationURIDiagnostics ktVerificationInfoDiagnosticsJson](self, "ktVerificationInfoDiagnosticsJson");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[KTSelfValidationURIDiagnostics ktVerificationInfoDiagnosticsJson](v5, "ktVerificationInfoDiagnosticsJson");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        -[KTSelfValidationURIDiagnostics transparentDataDiagnosticsJson](self, "transparentDataDiagnosticsJson");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTSelfValidationURIDiagnostics transparentDataDiagnosticsJson](v5, "transparentDataDiagnosticsJson");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
        {
          -[KTSelfValidationURIDiagnostics result](self, "result");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[KTSelfValidationURIDiagnostics result](v5, "result");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "isEqual:", v13);

          if ((_DWORD)v14)
          {
            -[KTSelfValidationURIDiagnostics error](self, "error");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {

            }
            else
            {
              -[KTSelfValidationURIDiagnostics error](v5, "error");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
                goto LABEL_13;
            }
            -[KTSelfValidationURIDiagnostics error](v5, "error");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v19 = (void *)MEMORY[0x24BDE84F8];
              -[KTSelfValidationURIDiagnostics error](self, "error");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "cleanseErrorForXPC:", v13);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)MEMORY[0x24BDE84F8];
              -[KTSelfValidationURIDiagnostics error](v5, "error");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "cleanseErrorForXPC:", v22);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v20, "isEqual:", v14);

              if (v23)
              {
LABEL_13:
                -[KTSelfValidationURIDiagnostics requestTime](self, "requestTime");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24
                  && (-[KTSelfValidationURIDiagnostics requestTime](self, "requestTime"),
                      v13 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[KTSelfValidationURIDiagnostics requestTime](v5, "requestTime"),
                      v14 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v13, "compare:", v14)))
                {
                  v25 = 1;
                }
                else
                {
                  -[KTSelfValidationURIDiagnostics requestTime](self, "requestTime");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v27)
                  {
                    v25 = 0;
                  }
                  else
                  {
                    -[KTSelfValidationURIDiagnostics requestTime](v5, "requestTime");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = v28 != 0;

                  }
                  if (!v24)
                    goto LABEL_24;
                }

LABEL_24:
                v16 = !v25;
                goto LABEL_17;
              }
            }
          }
        }
      }
      v16 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v16 = 0;
  }
LABEL_18:

  return v16;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTSelfValidationURIDiagnostics result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTSelfValidationURIDiagnostics result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("result"));

  }
  -[KTSelfValidationURIDiagnostics transparentDataDiagnosticsJson](self, "transparentDataDiagnosticsJson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[KTSelfValidationURIDiagnostics transparentDataDiagnosticsJson](self, "transparentDataDiagnosticsJson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("transparentData"));

  }
  -[KTSelfValidationURIDiagnostics ktVerificationInfoDiagnosticsJson](self, "ktVerificationInfoDiagnosticsJson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[KTSelfValidationURIDiagnostics ktVerificationInfoDiagnosticsJson](self, "ktVerificationInfoDiagnosticsJson");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("KTVerificationInfo"));

  }
  -[KTSelfValidationURIDiagnostics error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[KTSelfValidationURIDiagnostics error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TransparencyError diagnosticError:](TransparencyError, "diagnosticError:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("error"));

  }
  -[KTSelfValidationURIDiagnostics requestTime](self, "requestTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[KTSelfValidationURIDiagnostics requestTime](self, "requestTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "kt_dateToString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("requestTime"));

    -[KTSelfValidationURIDiagnostics requestTime](self, "requestTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "kt_toISO_8601_UTCString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("requestTimeReadable"));

  }
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3))
    v18 = v3;
  else
    v18 = 0;

  return (NSDictionary *)v18;
}

- (id)description
{
  void *v2;
  void *v3;

  -[KTSelfValidationURIDiagnostics diagnosticsJsonDictionary](self, "diagnosticsJsonDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)ktVerificationInfoDiagnosticsJson
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKtVerificationInfoDiagnosticsJson:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)transparentDataDiagnosticsJson
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransparentDataDiagnosticsJson:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)result
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)requestTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequestTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_transparentDataDiagnosticsJson, 0);
  objc_storeStrong((id *)&self->_ktVerificationInfoDiagnosticsJson, 0);
}

@end
