@implementation WFDurationQuantityFieldParameter

- (WFDurationQuantityFieldParameter)initWithDefinition:(id)a3
{
  WFDurationQuantityFieldParameter *v3;
  WFDurationQuantityFieldParameter *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  WFDurationQuantityFieldParameter *v8;
  objc_super v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)WFDurationQuantityFieldParameter;
  v3 = -[WFQuantityFieldParameter initWithDefinition:](&v10, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFQuantityFieldParameter possibleUnits](v3, "possibleUnits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v11[0] = CFSTR("sec");
      v11[1] = CFSTR("min");
      v11[2] = CFSTR("hr");
      v11[3] = CFSTR("days");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFQuantityFieldParameter setPossibleUnits:](v4, "setPossibleUnits:", v7);

    }
    v8 = v4;
  }

  return v4;
}

- (unint64_t)possibleCalendarUnits
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[WFQuantityFieldParameter possibleUnits](self, "possibleUnits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "possibleCalendarUnitsForUnits:", v4);

  return v5;
}

- (void)setPossibleCalendarUnits:(unint64_t)a3
{
  __int16 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_opt_new();
  if ((v3 & 0x80) != 0)
  {
    objc_msgSend(v5, "addObject:", CFSTR("sec"));
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("min"));
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v5, "addObject:", CFSTR("hr"));
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v5, "addObject:", CFSTR("days"));
  if ((v3 & 0x2000) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v5, "addObject:", CFSTR("months"));
    if ((v3 & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v5, "addObject:", CFSTR("weeks"));
  if ((v3 & 8) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v3 & 4) != 0)
LABEL_8:
    objc_msgSend(v5, "addObject:", CFSTR("years"));
LABEL_9:
  -[WFQuantityFieldParameter setPossibleUnits:](self, "setPossibleUnits:", v5);

}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "unitString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WFDurationQuantityPossibleUnits();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unitString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("sec")))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("seconds");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("min")))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("minutes");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("hr")))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("hours");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("days")))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("days");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("weeks")))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("weeks");
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("months")))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("months");
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("years")))
    {
      v11 = 0;
      goto LABEL_16;
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("years");
  }
  WFLocalizedPluralString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, objc_msgSend(v7, "intValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v11;
}

- (id)stateForDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[WFQuantityFieldParameter possibleUnits](self, "possibleUnits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateForDuration:possibleUnits:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  WFNumberStringSubstitutableState *v14;
  WFQuantityParameterState *v15;
  void *v16;

  -[WFParameter definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("DefaultUnit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("min");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  -[WFParameter definition](self, "definition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("DefaultValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  WFEnforceClass(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = -[WFNumberStringSubstitutableState initWithValue:]([WFNumberStringSubstitutableState alloc], "initWithValue:", v13);
  else
    v14 = 0;
  v15 = -[WFQuantityParameterState initWithMagnitudeState:unitString:]([WFQuantityParameterState alloc], "initWithMagnitudeState:unitString:", v14, v9);
  -[WFQuantityParameterState serializedRepresentation](v15, "serializedRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isTimePickerParameter
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("hr"), CFSTR("min"), CFSTR("sec"), 0);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[WFQuantityFieldParameter possibleUnits](self, "possibleUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToSet:", v3);
  return (char)v5;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

+ (unint64_t)possibleCalendarUnitsForUnits:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("sec")))
        {
          v6 |= 0x80uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("min")))
        {
          v6 |= 0x40uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("hr")))
        {
          v6 |= 0x20uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("days")))
        {
          v6 |= 0x10uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("weeks")))
        {
          v6 |= 0x2000uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("months")))
        {
          v6 |= 8uLL;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("years")))
        {
          v6 |= 4uLL;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)unitStringIsDurationUnit:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  WFDurationQuantityPossibleUnits();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (unint64_t)calendarUnitFromUnitString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sec")) & 1) != 0)
  {
    v4 = 128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("min")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hr")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("days")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("weeks")) & 1) != 0)
  {
    v4 = 0x2000;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("months")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("years")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 128;
  }

  return v4;
}

+ (id)stateForDuration:(double)a3 possibleUnits:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  WFNumberStringSubstitutableState *v26;
  WFQuantityParameterState *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "possibleCalendarUnitsForUnits:", v6);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:toDate:options:", v9, v7, v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v29 = v8;
    v16 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v19 = objc_msgSend((id)objc_opt_class(), "calendarUnitFromUnitString:", v18);
        if (objc_msgSend(v11, "valueForComponent:", v19))
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v29;
          objc_msgSend(v21, "components:fromDate:toDate:options:", v19, v7, v29, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = objc_msgSend(v22, "valueForComponent:", v19);
          v23 = v18;

          v12 = v23;
          goto LABEL_12;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v15)
        continue;
      break;
    }
    v20 = 0;
    v8 = v29;
  }
  else
  {
    v20 = 0;
  }
LABEL_12:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[WFNumberStringSubstitutableState initWithValue:]([WFNumberStringSubstitutableState alloc], "initWithValue:", v25);
  v27 = -[WFQuantityParameterState initWithMagnitudeState:unitString:]([WFQuantityParameterState alloc], "initWithMagnitudeState:unitString:", v26, v12);

  return v27;
}

@end
