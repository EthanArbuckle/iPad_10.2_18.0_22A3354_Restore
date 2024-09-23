@implementation WFCalendarSubstitutableState

- (id)legacySerializedRepresentation
{
  void *v3;
  __CFString *v4;
  void *v5;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "allCalendars") & 1) != 0)
  {
    v4 = &stru_1E7AFA810;
  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calendarTitle");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (WFCalendarSubstitutableState)initWithCalendar:(id)a3
{
  id v4;
  WFEKCalendarDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  WFEKCalendarDescriptor *v13;
  WFCalendarSubstitutableState *v14;
  objc_super v16;

  v4 = a3;
  v5 = [WFEKCalendarDescriptor alloc];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = (void *)MEMORY[0x1E0DC79F8];
  v10 = objc_msgSend(v4, "CGColor");

  objc_msgSend(v9, "colorWithCGColor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v11, "RGBAValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFEKCalendarDescriptor initWithCalendarTitle:identifier:RGBAValue:](v5, "initWithCalendarTitle:identifier:RGBAValue:", v6, v7, v12);

  v16.receiver = self;
  v16.super_class = (Class)WFCalendarSubstitutableState;
  v14 = -[WFVariableSubstitutableParameterState initWithValue:](&v16, sel_initWithValue_, v13);

  return v14;
}

- (WFCalendarSubstitutableState)initWithRemindersList:(id)a3
{
  id v4;
  WFEKCalendarDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  WFEKCalendarDescriptor *v9;
  WFCalendarSubstitutableState *v10;
  objc_super v12;

  v4 = a3;
  v5 = [WFEKCalendarDescriptor alloc];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFEKCalendarDescriptor initWithCalendarTitle:identifier:RGBAValue:](v5, "initWithCalendarTitle:identifier:RGBAValue:", v6, v8, 0);

  v12.receiver = self;
  v12.super_class = (Class)WFCalendarSubstitutableState;
  v10 = -[WFVariableSubstitutableParameterState initWithValue:](&v12, sel_initWithValue_, v9);

  return v10;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  WFCalendarSubstitutableState *v11;
  id v12;
  id v13;

  v10[1] = 3221225472;
  v10[2] = __89__WFCalendarSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v10[3] = &unk_1E7AF6EF8;
  v11 = self;
  v12 = a3;
  v13 = a5;
  v9.receiver = v11;
  v9.super_class = (Class)WFCalendarSubstitutableState;
  v10[0] = MEMORY[0x1E0C809B0];
  v7 = v13;
  v8 = v12;
  -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v9, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, a4, v10);

}

void __89__WFCalendarSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5
    || (objc_msgSend(*(id *)(a1 + 32), "variable"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "variable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__WFCalendarSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v11[3] = &unk_1E7AF4D28;
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "getObjectRepresentationForClass:context:completionHandler:", v9, v10, v11);

  }
}

void __89__WFCalendarSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;
  WFEKCalendarDescriptor *v10;
  void (*v11)(uint64_t, _QWORD, WFEKCalendarDescriptor *);
  id v12;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  if (v7)
  {
    v9 = a5;
    v10 = -[WFEKCalendarDescriptor initWithCalendarTitle:identifier:RGBAValue:]([WFEKCalendarDescriptor alloc], "initWithCalendarTitle:identifier:RGBAValue:", v12, 0, 0);
    (*(void (**)(uint64_t, WFEKCalendarDescriptor *, id))(v8 + 16))(v8, v10, v9);

  }
  else
  {
    v11 = *(void (**)(uint64_t, _QWORD, WFEKCalendarDescriptor *))(v8 + 16);
    v10 = a5;
    v11(v8, 0, v10);
  }

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  WFEKCalendarDescriptor *v18;
  WFEKCalendarDescriptor *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  int v32;
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IsAllCalendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v20 = v12;

    v21 = objc_msgSend(v20, "BOOLValue");
    if (v21)
    {
      v19 = -[WFEKCalendarDescriptor initWithAllCalendars]([WFEKCalendarDescriptor alloc], "initWithAllCalendars");
    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Title"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;
      }
      else
      {
        v23 = 0;
      }
      v24 = v23;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Identifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
      }
      else
      {
        v26 = 0;
      }
      v27 = v26;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RGBAValue"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
      }
      else
      {
        v29 = 0;
      }
      v30 = v29;

      v19 = -[WFEKCalendarDescriptor initWithCalendarTitle:identifier:RGBAValue:]([WFEKCalendarDescriptor alloc], "initWithCalendarTitle:identifier:RGBAValue:", v24, v27, v30);
    }
    v15 = v10;
  }
  else
  {

    v13 = objc_opt_class();
    v14 = v10;
    if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v32 = 136315906;
        v33 = "WFEnforceClass";
        v34 = 2114;
        v35 = v14;
        v36 = 2114;
        v37 = (id)objc_opt_class();
        v38 = 2114;
        v39 = v13;
        v17 = v37;
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v32, 0x2Au);

      }
      v15 = 0;
    }
    else
    {
      v15 = v14;
    }

    if (objc_msgSend(v15, "isEqualToString:", &stru_1E7AFA810))
    {
      v18 = -[WFEKCalendarDescriptor initWithAllCalendars]([WFEKCalendarDescriptor alloc], "initWithAllCalendars");
    }
    else
    {
      if (!v15)
      {
        v19 = 0;
        goto LABEL_39;
      }
      v18 = -[WFEKCalendarDescriptor initWithCalendarTitle:identifier:RGBAValue:]([WFEKCalendarDescriptor alloc], "initWithCalendarTitle:identifier:RGBAValue:", v15, 0, 0);
    }
    v19 = v18;
  }
LABEL_39:

  return v19;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFCalendarSubstitutableState.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFEKCalendarDescriptor class]]"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "allCalendars"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("IsAllCalendar"));

  if ((objc_msgSend(v5, "allCalendars") & 1) == 0)
  {
    objc_msgSend(v5, "calendarTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, CFSTR("Title"));

    objc_msgSend(v5, "calendarIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v9, CFSTR("Identifier"));

    objc_msgSend(v5, "calendarRGBAValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, CFSTR("RGBAValue"));

  }
  return v6;
}

@end
