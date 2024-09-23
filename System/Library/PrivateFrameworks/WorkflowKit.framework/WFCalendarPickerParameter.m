@implementation WFCalendarPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFCalendarPickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFCalendarPickerParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *stateQueue;
  WFCalendarPickerParameter *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFCalendarPickerParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v21, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AllowsAllCalendars"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowsAllCalendars = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("HidesReadOnlyCalendars"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    WFEnforceClass(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hidesReadOnlyCalendars = objc_msgSend(v11, "BOOLValue");

    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v14, v16);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v17;

    -[WFDynamicEnumerationParameter setDataSource:](v5, "setDataSource:", v5);
    v19 = v5;
  }

  return v5;
}

- (void)wasAddedToWorkflow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFCalendarPickerParameter;
  -[WFParameter wasAddedToWorkflow](&v5, sel_wasAddedToWorkflow);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getEKEventStoreChangedNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_reloadPossibleStates, v4, 0);

}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFCalendarPickerParameter;
  -[WFParameter wasRemovedFromWorkflow](&v5, sel_wasRemovedFromWorkflow);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getEKEventStoreChangedNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

}

- (void)clearPossibleStates
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[WFCalendarPickerParameter stateQueue](self, "stateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WFCalendarPickerParameter_clearPossibleStates__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)WFCalendarPickerParameter;
  -[WFDynamicEnumerationParameter clearPossibleStates](&v4, sel_clearPossibleStates);
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  WFCalendarPickerParameter *v14;
  id v15;

  v7 = a3;
  v8 = a5;
  -[WFCalendarPickerParameter stateQueue](self, "stateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  block[3] = &unk_1E7AF8378;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[WFCalendarPickerParameter defaultSerializedCalendarRepresentation](self, "defaultSerializedCalendarRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFCalendarPickerParameter defaultSerializedCalendarRepresentation](self, "defaultSerializedCalendarRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, 0);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __97__WFCalendarPickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
    v10[3] = &unk_1E7AF6938;
    v10[4] = self;
    v11 = v7;
    -[WFCalendarPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:](self, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", v6, 0, v10);

  }
}

- (void)possibleStatesDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFCalendarPickerParameter;
  -[WFDynamicEnumerationParameter possibleStatesDidChange](&v3, sel_possibleStatesDidChange);
  -[WFDynamicEnumerationParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;

  v4 = a4;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allCalendars");

  if (v6)
  {
    v7 = CFSTR("All Calendars");
  }
  else
  {
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Found in Mail"));

    if (v10)
    {
      v7 = CFSTR("Found in Mail");
    }
    else
    {
      objc_msgSend(v4, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "calendarTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Birthdays"));

      if (!v13)
      {
        objc_msgSend(v4, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "calendarTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      v7 = CFSTR("Birthdays");
    }
  }
  WFLocalizedString(v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v14;
}

- (id)enumeration:(id)a3 accessoryColorForPossibleState:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarRGBAValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC79F8];
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarRGBAValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithRGBAValue:", objc_msgSend(v9, "unsignedIntValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFGetWorkflowEventStore();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "calendarsForEntityType:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v12;
    v10 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v13);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v16, "title", (_QWORD)v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "calendarTitle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "isEqualToString:", v19);

          if ((v20 & 1) != 0)
          {
            v21 = (void *)MEMORY[0x1E0DC79F8];
            objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithCGColor:", objc_msgSend(v16, "CGColor"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "colorWithRGBAValue:", objc_msgSend(v22, "RGBAValue"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v10 = (void *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v10;
}

- (BOOL)allowsAllCalendars
{
  return self->_allowsAllCalendars;
}

- (BOOL)hidesReadOnlyCalendars
{
  return self->_hidesReadOnlyCalendars;
}

- (id)defaultSerializedCalendarRepresentation
{
  return self->_defaultSerializedCalendarRepresentation;
}

- (void)setDefaultSerializedCalendarRepresentation:(id)a3
{
  objc_storeStrong(&self->_defaultSerializedCalendarRepresentation, a3);
}

- (INObjectCollection)calendarsCollection
{
  return self->_calendarsCollection;
}

- (void)setCalendarsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_calendarsCollection, a3);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_calendarsCollection, 0);
  objc_storeStrong(&self->_defaultSerializedCalendarRepresentation, 0);
}

void __97__WFCalendarPickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a3;
  objc_msgSend(v4, "defaultSerializedCalendarRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

}

void __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void (**v4)(id);
  void *v5;
  void *v6;
  void *v7;
  WFCalendarSubstitutableState *v8;
  WFEKCalendarDescriptor *v9;
  WFCalendarSubstitutableState *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  void *v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(a1[5], "calendarsCollection"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    v4 = (void (**)(id))a1[6];
    objc_msgSend(a1[5], "calendarsCollection");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4);

  }
  else
  {
    WFGetWorkflowEventStore();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultCalendarForNewEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = [WFCalendarSubstitutableState alloc];
    v9 = -[WFEKCalendarDescriptor initWithAllCalendars]([WFEKCalendarDescriptor alloc], "initWithAllCalendars");
    v10 = -[WFVariableSubstitutableParameterState initWithValue:](v8, "initWithValue:", v9);

    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__28071;
    v37 = __Block_byref_object_dispose__28072;
    v38 = 0;
    if (objc_msgSend(a1[5], "allowsAllCalendars"))
    {
      v11 = objc_alloc(MEMORY[0x1E0CBDA20]);
      v40[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithTitle:items:", 0, v12);

      objc_msgSend(v7, "addObject:", v13);
    }
    objc_msgSend(v5, "sourcesEnabledForEntityType:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_124;
    v30[3] = &unk_1E7AF0878;
    v30[4] = a1[5];
    v15 = v6;
    v31 = v15;
    v32 = &v33;
    objc_msgSend(v14, "if_compactMap:", v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObjectsFromArray:", v19);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithSections:", v7);
    objc_msgSend(a1[5], "setCalendarsCollection:", v20);

    if (objc_msgSend(a1[5], "allowsAllCalendars"))
    {
      -[WFVariableSubstitutableParameterState serializedRepresentation](v10, "serializedRepresentation");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = a1[5];
      v23 = (void *)v22[35];
      v22[35] = v21;
    }
    else
    {
      v24 = a1[5];
      v25 = (id)v34[5];
      v23 = (void *)v24[35];
      v24[35] = v25;
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4;
    block[3] = &unk_1E7AF76F0;
    v26 = a1[6];
    block[4] = a1[5];
    v29 = v26;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(&v33, 8);
  }
}

id __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "calendarsForEntityType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
  v20[3] = &unk_1E7AF0828;
  v20[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "objectsPassingTest:", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3;
  v17[3] = &unk_1E7AF0850;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v18 = v10;
  v19 = v11;
  objc_msgSend(v9, "if_map:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = objc_alloc(MEMORY[0x1E0CBDA20]);
    objc_msgSend(v3, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithTitle:items:", v14, v12);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "calendarsCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

BOOL __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = !objc_msgSend(*(id *)(a1 + 32), "hidesReadOnlyCalendars")
    || objc_msgSend(v3, "allowsContentModifications");

  return v4;
}

WFCalendarSubstitutableState *__91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  WFCalendarSubstitutableState *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = -[WFCalendarSubstitutableState initWithCalendar:]([WFCalendarSubstitutableState alloc], "initWithCalendar:", v3);
  v5 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3);

  if (v5)
  {
    -[WFVariableSubstitutableParameterState serializedRepresentation](v4, "serializedRepresentation");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return v4;
}

uint64_t __48__WFCalendarPickerParameter_clearPossibleStates__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDefaultSerializedCalendarRepresentation:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCalendarsCollection:", 0);
}

@end
