@implementation WFIntentAppPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFIntentAppPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFIntentAppPickerParameter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSString *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSString *intentName;
  WFIntentAppPickerParameter *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFIntentAppPickerParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v16, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("IntentName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v18 = "WFEnforceClass";
        v19 = 2114;
        v20 = v8;
        v21 = 2114;
        v22 = v11;
        v23 = 2114;
        v24 = v7;
        v12 = v11;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = (NSString *)v8;
    }

    intentName = v5->_intentName;
    v5->_intentName = v9;

    v14 = v5;
  }

  return v5;
}

- (void)possibleStatesDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFIntentAppPickerParameter;
  -[WFDynamicEnumerationParameter possibleStatesDidChange](&v3, sel_possibleStatesDidChange);
  -[WFDynamicEnumerationParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
}

- (BOOL)alwaysShowsButton
{
  return 1;
}

- (NSString)intentName
{
  return self->_intentName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentName, 0);
}

@end
