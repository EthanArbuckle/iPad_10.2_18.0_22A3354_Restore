@implementation WFRemindersSmartListParameterState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v23 = CFSTR("identifier");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.reminders.smartlist.%@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v11;
      v11 = (id)v13;
    }
    else
    {
      getWFActionsLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "+[WFRemindersSmartListParameterState valueFromSerializedRepresentation:variableProvider:parameter:]";
        v21 = 2114;
        v22 = v11;
        _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_DEFAULT, "%s Found unexpected Reminders Smart List: %{public}@", buf, 0x16u);
      }

      v14 = v11;
      v11 = 0;
    }
  }
  else
  {

    v14 = 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___WFRemindersSmartListParameterState;
  objc_msgSendSuper2(&v18, sel_valueFromSerializedRepresentation_variableProvider_parameter_, v11, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)legacySerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v3, "value");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v4, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "instanceIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "lastObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
