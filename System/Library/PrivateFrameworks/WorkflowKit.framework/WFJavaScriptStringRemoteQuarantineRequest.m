@implementation WFJavaScriptStringRemoteQuarantineRequest

- (WFJavaScriptStringRemoteQuarantineRequest)initWithWorkflow:(id)a3 runtimeType:(unint64_t)a4 targetURL:(id)a5 preRuntimeVariableString:(id)a6 runtimeString:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  WFJavaScriptStringRemoteQuarantineRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSDictionary *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSDictionary *preRuntimeJavaScriptSerializedRepresentation;
  uint64_t v28;
  NSString *preRuntimeJavaScriptString;
  WFJavaScriptStringRemoteQuarantineRequest *v30;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v33.receiver = self;
  v33.super_class = (Class)WFJavaScriptStringRemoteQuarantineRequest;
  v16 = -[WFBaseRemoteQuarantineRequest init](&v33, sel_init);
  if (v16)
  {
    v32 = v13;
    objc_msgSend(v12, "actions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v16->_actionList, v19);
    if (!v18)

    v16->_runtimeType = a4;
    objc_storeStrong((id *)&v16->_targetURL, a5);
    objc_msgSend(v14, "serializedRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_class();
    v22 = v20;
    if (v22 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v35 = "WFEnforceClass";
        v36 = 2114;
        v37 = v22;
        v38 = 2114;
        v39 = v25;
        v40 = 2114;
        v41 = v21;
        v26 = v25;
        _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v23 = 0;
    }
    else
    {
      v23 = (NSDictionary *)v22;
    }

    preRuntimeJavaScriptSerializedRepresentation = v16->_preRuntimeJavaScriptSerializedRepresentation;
    v16->_preRuntimeJavaScriptSerializedRepresentation = v23;

    objc_msgSend(v14, "stringByReplacingVariablesWithNames");
    v28 = objc_claimAutoreleasedReturnValue();
    preRuntimeJavaScriptString = v16->_preRuntimeJavaScriptString;
    v16->_preRuntimeJavaScriptString = (NSString *)v28;

    objc_storeStrong((id *)&v16->_runtimeJavaScriptString, a7);
    v30 = v16;
    v13 = v32;
  }

  return v16;
}

- (id)policyFunctionName
{
  return CFSTR("decidePolicyForQuarantineRequest");
}

- (id)defaultLocalizedPromptTitle
{
  return WFLocalizedString(CFSTR("Allow JavaScript access to the web page?"));
}

- (id)defaultLocalizedPromptMessage
{
  return WFLocalizedString(CFSTR("This will give the JavaScript full access to the web page including all data"));
}

- (id)defaultLocalizedDeniedErrorTitle
{
  return WFLocalizedString(CFSTR("Unsafe JavaScript"));
}

- (id)defaultLocalizedDeniedErrorMessage
{
  return WFLocalizedString(CFSTR("This JavaScript is similar to a script that is known to be unsafe. For your security it will not run."));
}

- (unint64_t)runtimeType
{
  return self->_runtimeType;
}

- (void)setRuntimeType:(unint64_t)a3
{
  self->_runtimeType = a3;
}

- (NSURL)targetURL
{
  return self->_targetURL;
}

- (void)setTargetURL:(id)a3
{
  objc_storeStrong((id *)&self->_targetURL, a3);
}

- (NSDictionary)preRuntimeJavaScriptSerializedRepresentation
{
  return self->_preRuntimeJavaScriptSerializedRepresentation;
}

- (NSString)preRuntimeJavaScriptString
{
  return self->_preRuntimeJavaScriptString;
}

- (NSString)runtimeJavaScriptString
{
  return self->_runtimeJavaScriptString;
}

- (void)setRuntimeJavaScriptString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)actionList
{
  return self->_actionList;
}

- (void)setActionList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionList, 0);
  objc_storeStrong((id *)&self->_runtimeJavaScriptString, 0);
  objc_storeStrong((id *)&self->_preRuntimeJavaScriptString, 0);
  objc_storeStrong((id *)&self->_preRuntimeJavaScriptSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFJavaScriptStringRemoteQuarantineRequest;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("runtimeType");
  v7[1] = CFSTR("targetURL");
  v8[0] = CFSTR("runtimeType");
  v8[1] = CFSTR("targetURL");
  v7[2] = CFSTR("preRuntimeJavaScriptSerializedRepresentation");
  v7[3] = CFSTR("preRuntimeJavaScriptString");
  v8[2] = CFSTR("preRuntimeJavaScriptSerializedRepresentation");
  v8[3] = CFSTR("preRuntimeJavaScriptString");
  v7[4] = CFSTR("runtimeJavaScriptString");
  v7[5] = CFSTR("actionList");
  v8[4] = CFSTR("runtimeJavaScriptString");
  v8[5] = CFSTR("actionList");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

@end
