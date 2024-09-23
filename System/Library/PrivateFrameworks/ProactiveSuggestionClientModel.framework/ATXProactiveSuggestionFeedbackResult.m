@implementation ATXProactiveSuggestionFeedbackResult

- (ATXProactiveSuggestionFeedbackResult)initWithConsumerSubType:(unsigned __int8)a3 sessionType:(int64_t)a4 clientCacheUpdate:(id)a5 uiCacheUpdate:(id)a6 context:(id)a7
{
  id v13;
  id v14;
  id v15;
  ATXProactiveSuggestionFeedbackResult *v16;
  ATXProactiveSuggestionFeedbackResult *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)ATXProactiveSuggestionFeedbackResult;
  v16 = -[ATXProactiveSuggestionFeedbackResult init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_consumerSubType = a3;
    v16->_sessionType = a4;
    objc_storeStrong((id *)&v16->_clientCacheUpdate, a5);
    objc_storeStrong((id *)&v17->_uiCacheUpdate, a6);
    objc_storeStrong((id *)&v17->_context, a7);
  }

  return v17;
}

- (id)validContextClassNames
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1AF421DC4](self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ATXPredictionContext"), CFSTR("ATXUIFeedbackTestPredictionContext"), 0);
  objc_autoreleasePoolPop(v2);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumerSubType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("consumerSubType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sessionType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("sessionType"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_clientCacheUpdate, CFSTR("clientCache"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_uiCacheUpdate, CFSTR("clientCache"));
  if (self->_context)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("contextString"));

  }
}

- (ATXProactiveSuggestionFeedbackResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXProactiveSuggestionFeedbackResult *v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSString *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *aClassNamea;
  NSString *aClassName;
  void *v42;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_blending_ecosystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("consumerSubType"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionFeedbackResult"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerSubtypeForString:found:", v8, 0);
      if ((_DWORD)v12)
      {
        v13 = v12;
        v14 = (void *)MEMORY[0x1E0D81610];
        v15 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v15, CFSTR("sessionType"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionFeedbackResult"), -1, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17
          || (objc_msgSend(v4, "error"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
        {
          v10 = 0;
LABEL_34:

          goto LABEL_4;
        }
        v19 = (void *)MEMORY[0x1E0D81610];
        v20 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("clientCache"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionFeedbackResult"), -1, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22
          || (objc_msgSend(v4, "error"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v23, v23))
        {
          v10 = 0;
LABEL_33:

          goto LABEL_34;
        }
        v42 = v22;
        v24 = (void *)MEMORY[0x1E0D81610];
        v25 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v25, CFSTR("clientCache"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionFeedbackResult"), -1, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          v10 = 0;
          v22 = v42;
          goto LABEL_32;
        }
        objc_msgSend(v4, "error");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v42;
        if (v28)
        {
          v10 = 0;
LABEL_32:

          goto LABEL_33;
        }
        aClassNamea = (NSString *)MEMORY[0x1E0D81610];
        v29 = objc_opt_class();
        __atxlog_handle_blending_ecosystem();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:](aClassNamea, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v29, CFSTR("contextString"), v4, 0, CFSTR("com.apple.proactive.ATXProactiveSuggestionFeedbackResult"), -1, v30);
        aClassName = (NSString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v10 = 0;
          v32 = aClassName;
          v22 = v42;
LABEL_31:

          goto LABEL_32;
        }
        v32 = aClassName;
        if (aClassName)
        {
          -[ATXProactiveSuggestionFeedbackResult validContextClassNames](self, "validContextClassNames");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "containsObject:", aClassName);

          if (!v34)
          {
            v38 = 0;
            v32 = aClassName;
            v22 = v42;
            goto LABEL_27;
          }
          v32 = aClassName;
          if (NSClassFromString(aClassName))
          {
            v35 = (void *)MEMORY[0x1E0D81610];
            v36 = objc_opt_class();
            __atxlog_handle_blending_ecosystem();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v36, CFSTR("contextString"), v4, 1, CFSTR("com.apple.proactive.ATXProactiveSuggestionFeedbackResult"), -1, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend(v4, "error");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v39)
                goto LABEL_25;
            }
          }
          else
          {
            v38 = 0;
          }
          v10 = 0;
          v22 = v42;
          goto LABEL_30;
        }
        v38 = 0;
LABEL_25:
        v22 = v42;
LABEL_27:
        self = -[ATXProactiveSuggestionFeedbackResult initWithConsumerSubType:sessionType:clientCacheUpdate:uiCacheUpdate:context:](self, "initWithConsumerSubType:sessionType:clientCacheUpdate:uiCacheUpdate:context:", v13, objc_msgSend(v17, "integerValue"), v22, v27, v38);
        v10 = self;
LABEL_30:

        goto LABEL_31;
      }
    }
  }
  v10 = 0;
LABEL_4:

  return v10;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (ATXClientModelCacheUpdate)clientCacheUpdate
{
  return self->_clientCacheUpdate;
}

- (ATXBlendingModelUICacheUpdate)uiCacheUpdate
{
  return self->_uiCacheUpdate;
}

- (ATXProactiveSuggestionFeedbackContextProtocol)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uiCacheUpdate, 0);
  objc_storeStrong((id *)&self->_clientCacheUpdate, 0);
}

@end
