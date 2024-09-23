@implementation WFRemindersListPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFRemindersListPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFRemindersListPickerParameter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  WFRemindersListPickerParameter *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFRemindersListPickerParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v15, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AllowsAllLists"));
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
        v17 = "WFEnforceClass";
        v18 = 2114;
        v19 = v8;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v7;
        v12 = v11;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }

    v5->_allowsAllLists = objc_msgSend(v9, "BOOLValue");
    v13 = v5;
  }

  return v5;
}

- (void)wasAddedToWorkflow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemindersListPickerParameter;
  -[WFParameter wasAddedToWorkflow](&v5, sel_wasAddedToWorkflow);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getREMStoreClass(), "storeDidChangeNotificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_storeDidChange, v4, 0);

  -[WFRemindersListPickerParameter reloadStates](self, "reloadStates");
}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemindersListPickerParameter;
  -[WFParameter wasRemovedFromWorkflow](&v5, sel_wasRemovedFromWorkflow);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getREMStoreClass(), "storeDidChangeNotificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

}

- (void)storeDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WFRemindersListPickerParameter_storeDidChange__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)reloadStates
{
  void *v3;
  void *v4;
  void *v5;
  WFCalendarSubstitutableState *v6;
  WFEKCalendarDescriptor *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  WFCalendarSubstitutableState *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  WFRemindersListPickerParameter *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D14070], "allLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D14070], "defaultList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = [WFCalendarSubstitutableState alloc];
  v7 = -[WFEKCalendarDescriptor initWithAllCalendars]([WFEKCalendarDescriptor alloc], "initWithAllCalendars");
  v8 = -[WFVariableSubstitutableParameterState initWithValue:](v6, "initWithValue:", v7);

  if (-[WFRemindersListPickerParameter allowsAllLists](self, "allowsAllLists"))
    objc_msgSend(v5, "addObject:", v8);
  v22 = (void *)v8;
  v23 = self;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v15 = -[WFCalendarSubstitutableState initWithRemindersList:]([WFCalendarSubstitutableState alloc], "initWithRemindersList:", v14);
        objc_msgSend(v5, "addObject:", v15);
        objc_msgSend(v4, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (v18)
        {
          -[WFVariableSubstitutableParameterState serializedRepresentation](v15, "serializedRepresentation");
          v19 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v19;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  -[WFRemindersListPickerParameter setListStates:](v23, "setListStates:", v5);
  if (-[WFRemindersListPickerParameter allowsAllLists](v23, "allowsAllLists"))
  {
    v20 = v22;
    objc_msgSend(v22, "serializedRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemindersListPickerParameter setDefaultSerializedListRepresentation:](v23, "setDefaultSerializedListRepresentation:", v21);

  }
  else
  {
    -[WFRemindersListPickerParameter setDefaultSerializedListRepresentation:](v23, "setDefaultSerializedListRepresentation:", v11);
    v20 = v22;
  }
  -[WFEnumerationParameter possibleStatesDidChange](v23, "possibleStatesDidChange");
  -[WFParameter defaultSerializedRepresentationDidChange](v23, "defaultSerializedRepresentationDidChange");

}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allCalendars");

  if (v5)
  {
    WFLocalizedString(CFSTR("All Lists"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v7 = (void *)getREMDisplayNameUtilsClass_softClass;
    v16 = getREMDisplayNameUtilsClass_softClass;
    if (!getREMDisplayNameUtilsClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getREMDisplayNameUtilsClass_block_invoke;
      v12[3] = &unk_1E7AF9520;
      v12[4] = &v13;
      __getREMDisplayNameUtilsClass_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v3, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendarTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayNameFromListName:isPlaceholder:", v10, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)accessoryColorForPossibleState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarRGBAValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC79F8];
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarRGBAValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithRGBAValue:", objc_msgSend(v8, "unsignedIntValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D14070], "allLists");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v11 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v10);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "name", (_QWORD)v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "calendarTitle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "isEqualToString:", v16);

          if ((v17 & 1) != 0)
          {
            v18 = (void *)MEMORY[0x1E0DC79F8];
            objc_msgSend(v13, "color");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "colorWithRemindersColor:", v19);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v9 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v9;
}

- (BOOL)allowsAllLists
{
  return self->_allowsAllLists;
}

- (id)defaultSerializedListRepresentation
{
  return self->_defaultSerializedListRepresentation;
}

- (void)setDefaultSerializedListRepresentation:(id)a3
{
  objc_storeStrong(&self->_defaultSerializedListRepresentation, a3);
}

- (NSArray)listStates
{
  return self->_listStates;
}

- (void)setListStates:(id)a3
{
  objc_storeStrong((id *)&self->_listStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listStates, 0);
  objc_storeStrong(&self->_defaultSerializedListRepresentation, 0);
}

uint64_t __48__WFRemindersListPickerParameter_storeDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadStates");
}

@end
