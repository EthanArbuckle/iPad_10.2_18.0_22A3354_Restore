@implementation WFTimeZonePickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFTimeZonePickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFTimeZonePickerParameter *v5;
  objc_class *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *stateQueue;
  void *v13;
  id v14;
  void *v15;
  WFTimeZonePickerParameter *v16;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFTimeZonePickerParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v18, sel_initWithDefinition_, v4);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v8, v10);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v11;

    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v13 = (void *)getALCityManagerClass_softClass;
    v23 = getALCityManagerClass_softClass;
    if (!getALCityManagerClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getALCityManagerClass_block_invoke;
      v19[3] = &unk_1E7AF9520;
      v19[4] = &v20;
      __getALCityManagerClass_block_invoke((uint64_t)v19);
      v13 = (void *)v21[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v20, 8);
    objc_msgSend(v14, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeZonePickerParameter setCityManager:](v5, "setCityManager:", v15);

    -[WFDynamicEnumerationParameter setDataSource:](v5, "setDataSource:", v5);
    v16 = v5;
  }

  return v5;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  -[WFTimeZonePickerParameter stateQueue](self, "stateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v9[3] = &unk_1E7AF76F0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "alCityIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_8;
    v8 = (void *)v7;
    -[WFTimeZonePickerParameter cityManager](self, "cityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alCityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "citiesWithIdentifiers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isChineseRegionCelluarDevice"))
      {
        +[WFTimeZonePickerParameter sensitiveCities](WFTimeZonePickerParameter, "sensitiveCities");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "alCityIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "containsObject:", v17);

      }
      else
      {
        v18 = 0;
      }

      objc_msgSend(v14, "displayNameIncludingCountry:", v18);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      objc_msgSend(v5, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedCityName");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v20;

  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (NSArray)calendarStates
{
  return self->_calendarStates;
}

- (void)setCalendarStates:(id)a3
{
  objc_storeStrong((id *)&self->_calendarStates, a3);
}

- (ALCityManager)cityManager
{
  return self->_cityManager;
}

- (void)setCityManager:(id)a3
{
  objc_storeStrong((id *)&self->_cityManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityManager, 0);
  objc_storeStrong((id *)&self->_calendarStates, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

void __91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "cityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_20655);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_116);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_map:", &__block_literal_global_118);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithItems:", v5);
  objc_msgSend(v6, "setUsesIndexedCollation:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

WFTimeZonePickerParameterState *__91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  WFTimeZonePickerParameterState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFTimeZonePickerParameterState alloc], "initWithValue:", v2);

  return v3;
}

uint64_t __91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedCityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedCityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

WFTimeZoneDescriptor *__91__WFTimeZonePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFTimeZoneDescriptor *v3;

  v2 = a2;
  v3 = -[WFTimeZoneDescriptor initWithALCity:]([WFTimeZoneDescriptor alloc], "initWithALCity:", v2);

  return v3;
}

+ (id)sensitiveCities
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E7B8D8B0);
}

@end
