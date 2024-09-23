@implementation WFEnumerationParameter

- (WFEnumerationParameter)initWithDefinition:(id)a3
{
  id v4;
  WFEnumerationParameter *v5;
  WFEnumerationParameter *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  void *v25;
  NSArray *v26;
  WFEnumerationParameter *v27;
  NSArray *v28;
  id v29;
  NSArray *staticPossibleStates;
  NSArray *v31;
  NSArray *displayNames;
  NSArray *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSArray *subtitles;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSArray *symbolNames;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __CFString *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  __CFString *v55;
  WFEnumerationParameter *v56;
  _QWORD v58[4];
  NSArray *v59;
  WFEnumerationParameter *v60;
  NSArray *v61;
  id v62;
  BOOL v63;
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)WFEnumerationParameter;
  v5 = -[WFParameter initWithDefinition:](&v64, sel_initWithDefinition_, v4);
  v6 = v5;
  if (v5)
  {
    if (-[WFParameter allowsMultipleValues](v5, "allowsMultipleValues"))
    {
      v6->_alwaysShowsButton = 1;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("AlwaysShowsButton"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      WFEnforceClass(v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_alwaysShowsButton = objc_msgSend(v9, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("HideClearButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_hideClearButton = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PreferParameterValuePicker"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    WFEnforceClass(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_prefersParameterValuePicker = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("Items"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    WFEnforceClass(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("ItemDisplayNames"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    WFEnforceClass(v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v18, "count");
    v23 = v22 == objc_msgSend(v21, "count");
    v24 = (void *)objc_opt_new();
    v25 = (void *)objc_opt_new();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __45__WFEnumerationParameter_initWithDefinition___block_invoke;
    v58[3] = &unk_1E7AEAAE8;
    v26 = v24;
    v59 = v26;
    v27 = v6;
    v60 = v27;
    v28 = v25;
    v63 = v23;
    v61 = v28;
    v62 = v21;
    v29 = v21;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v58);
    staticPossibleStates = v27->_staticPossibleStates;
    v27->_staticPossibleStates = v26;
    v31 = v26;

    displayNames = v27->_displayNames;
    v27->_displayNames = v28;
    v33 = v28;

    objc_msgSend(v4, "objectForKey:", CFSTR("ItemSubtitles"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_class();
    WFEnforceClass(v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    subtitles = v27->_subtitles;
    v27->_subtitles = (NSArray *)v36;

    objc_msgSend(v4, "objectForKey:", CFSTR("ItemIconNames"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_opt_class();
    WFEnforceClass(v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    symbolNames = v27->_symbolNames;
    v27->_symbolNames = (NSArray *)v40;

    objc_msgSend(v4, "objectForKey:", CFSTR("ProvidesLocalizedValues"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_opt_class();
    WFEnforceClass(v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (!v44)
      v44 = (void *)MEMORY[0x1E0C9AAB0];
    v27->_providesLocalizedValuesForSummary = objc_msgSend(v44, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("SelectionType"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_opt_class();
    WFEnforceClass(v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v48;
    if (v48)
      v50 = (__CFString *)v48;
    else
      v50 = CFSTR("Checkmark");
    objc_storeStrong((id *)&v27->_selectionType, v50);

    objc_msgSend(v4, "objectForKey:", CFSTR("TableViewStyle"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_opt_class();
    WFEnforceClass(v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v53;
    if (v53)
      v55 = (__CFString *)v53;
    else
      v55 = CFSTR("Plain");
    objc_storeStrong((id *)&v27->_tableViewStyle, v55);

    v56 = v27;
  }

  return v6;
}

void __45__WFEnumerationParameter_initWithDefinition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v19 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DC8];
    v6 = v19;
    objc_msgSend(v5, "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocale:", v7);

    objc_msgSend(v6, "localize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocale:", v9);

    objc_msgSend(v6, "localize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "singleStateClass");
    v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", v8);
    objc_msgSend(v11, "addObject:", v12);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "singleStateClass");
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", v19);
  objc_msgSend(v13, "addObject:", v14);

  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "localize");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = 0;
      goto LABEL_12;
    }
    v16 = v15;
  }
  v17 = v16;
LABEL_12:
  if (v17)
    v18 = v17;
  else
    v18 = v19;
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);

LABEL_16:
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[WFEnumerationParameter staticPossibleStates](self, "staticPossibleStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFEnumerationParameter symbolNames](self, "symbolNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[WFEnumerationParameter staticPossibleStates](self, "staticPossibleStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 == v9)
    {
      -[WFEnumerationParameter staticPossibleStates](self, "staticPossibleStates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfObject:", v4);

      -[WFEnumerationParameter symbolNames](self, "symbolNames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v11 >= v13)
      {
        v15 = 0;
      }
      else
      {
        -[WFEnumerationParameter symbolNames](self, "symbolNames");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "wf_isEmpty") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0DC7B70], "systemImageNamed:configuration:renderingMode:", v15, 0, 2);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

          goto LABEL_10;
        }
      }
      v5 = 0;
      goto LABEL_9;
    }
    v5 = 0;
  }
LABEL_10:

  return v5;
}

- (NSArray)symbolNames
{
  return self->_symbolNames;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v5 = 0;
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if (!-[WFParameter doNotLocalizeValues](self, "doNotLocalizeValues"))
  {
    -[WFEnumerationParameter staticPossibleStates](self, "staticPossibleStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[WFEnumerationParameter displayNames](self, "displayNames");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      -[WFEnumerationParameter staticPossibleStates](self, "staticPossibleStates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v10 == v12)
      {
        -[WFEnumerationParameter staticPossibleStates](self, "staticPossibleStates");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "indexOfObject:", v4);

        -[WFEnumerationParameter displayNames](self, "displayNames");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v14 < v16)
        {
          -[WFEnumerationParameter displayNames](self, "displayNames");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_7;
        }
      }
    }
    else
    {

    }
    goto LABEL_6;
  }
  v5 = v5;
  v6 = v5;
LABEL_7:

  return v6;
}

- (NSArray)staticPossibleStates
{
  return self->_staticPossibleStates;
}

- (NSArray)displayNames
{
  return self->_displayNames;
}

- (id)localizedSubtitleLabelForPossibleState:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFEnumerationParameter staticPossibleStates](self, "staticPossibleStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (-[WFEnumerationParameter subtitles](self, "subtitles"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 >= v8))
  {
    v10 = 0;
  }
  else
  {
    -[WFEnumerationParameter subtitles](self, "subtitles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (NSArray)subtitles
{
  return self->_subtitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolNames, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_staticPossibleStates, 0);
  objc_storeStrong((id *)&self->_tableViewStyle, 0);
  objc_storeStrong((id *)&self->_selectionType, 0);
}

- (void)possibleStatesDidChange
{
  -[WFParameter stateValidityCriteriaDidChange](self, "stateValidityCriteriaDidChange");
  -[WFParameter attributesDidChange](self, "attributesDidChange");
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)setPossibleStatesFromRemoteSource:(id)a3
{
  objc_storeStrong((id *)&self->_staticPossibleStates, a3);
}

- (NSArray)possibleStatesForLocalization
{
  void *v3;

  if (-[WFEnumerationParameter providesLocalizedValuesForSummary](self, "providesLocalizedValuesForSummary"))
  {
    -[WFEnumerationParameter staticPossibleStates](self, "staticPossibleStates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (id)localizedTitleForButtonWithState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (-[WFParameter allowsMultipleValues](self, "allowsMultipleValues")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFEnumerationParameter localizedLabelForMultipleState:](self, "localizedLabelForMultipleState:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFEnumerationParameter localizedLabelForPossibleState:](self, "localizedLabelForPossibleState:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)localizedLabelForMultipleState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "parameterStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E40];
  -[WFEnumerationParameter possibleStates](self, "possibleStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFEnumerationParameter localizedTitleForButtonWithState:](self, "localizedTitleForButtonWithState:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToSet:", v13))
    {
      v14 = objc_msgSend(v5, "count");

      if (v14 >= 3)
      {
        -[WFEnumerationParameter localizedLabelForMultipleCompleteState:](self, "localizedLabelForMultipleCompleteState:", v4);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
    }
    else
    {

    }
    -[WFEnumerationParameter statesForMultipleStateLabelWithStates:](self, "statesForMultipleStateLabelWithStates:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEnumerationParameter localizedLabelForPossibleState:inMultipleState:](self, "localizedLabelForPossibleState:inMultipleState:", v15, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 2)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFEnumerationParameter localizedLabelForPossibleState:inMultipleState:](self, "localizedLabelForPossibleState:inMultipleState:", v17, v4);
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedPluralString(CFSTR("%ld more"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v17, objc_msgSend(v9, "count") - 1);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && v19)
    {
      v20 = (void *)MEMORY[0x1E0CB3738];
      v24[0] = v16;
      v24[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringByJoiningStrings:", v21);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v16)
        v22 = v16;
      else
        v22 = v19;
      v10 = v22;
    }

    goto LABEL_21;
  }
  WFLocalizedString(CFSTR("Choose"));
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v10 = (id)v11;
LABEL_22:

  return v10;
}

- (id)statesForMultipleStateLabelWithStates:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__WFEnumerationParameter_statesForMultipleStateLabelWithStates___block_invoke;
  v4[3] = &unk_1E7AEAB10;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedLabelForMultipleCompleteState:(id)a3
{
  return WFLocalizedString(CFSTR("All"));
}

- (id)accessoryColorForPossibleState:(id)a3
{
  return 0;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  return 0;
}

- (BOOL)hidesAccessoryIconInEditor
{
  return 0;
}

- (BOOL)hidesSubtitleInEditor
{
  return 0;
}

- (BOOL)preferParameterValuePicker
{
  return self->_prefersParameterValuePicker;
}

- (BOOL)preferContextMenu
{
  if (-[WFEnumerationParameter preferParameterValuePicker](self, "preferParameterValuePicker"))
    return 0;
  else
    return !-[WFParameter allowsMultipleValues](self, "allowsMultipleValues");
}

- (BOOL)displaysMultipleValueEditor
{
  return 0;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "variable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFParameter supportedVariableTypes](self, "supportedVariableTypes");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "variable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);

LABEL_21:
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!-[WFParameter allowsMultipleValues](self, "allowsMultipleValues"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEnumerationParameter.m"), 253, CFSTR("Multiple state found in parameter that doesn't support multiple values"));

    }
    objc_msgSend(v5, "parameterStates");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v7);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[WFEnumerationParameter possibleStates](self, "possibleStates");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __48__WFEnumerationParameter_parameterStateIsValid___block_invoke;
          v26[3] = &unk_1E7AF38D8;
          v26[4] = v15;
          v17 = objc_msgSend(v16, "indexOfObjectPassingTest:", v26);

          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v10 = 0;
            goto LABEL_20;
          }
        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
          continue;
        break;
      }
      v10 = 1;
    }
    else
    {
      v10 = 1;
    }
LABEL_20:

    goto LABEL_21;
  }
  -[WFEnumerationParameter possibleStates](self, "possibleStates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v5);

  if ((v19 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[WFEnumerationParameter possibleStates](self, "possibleStates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __48__WFEnumerationParameter_parameterStateIsValid___block_invoke_2;
    v24[3] = &unk_1E7AF38D8;
    v25 = v5;
    objc_msgSend(v20, "indexesOfObjectsPassingTest:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v21, "count") == 1;
  }
LABEL_22:

  return v10;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  BOOL v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  WFEnumerationParameter *v20;
  void (**v21)(id, _QWORD);
  BOOL v22;
  _QWORD v23[4];
  id v24;
  WFEnumerationParameter *v25;
  _QWORD *v26;
  BOOL v27;
  _QWORD v28[3];
  char v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  if (-[WFEnumerationParameter liveUpdatesPossibleStatesInEditor](self, "liveUpdatesPossibleStatesInEditor"))
  {
    v13[2](v13, 0);
  }
  else
  {
    v14 = -[WFParameter allowsMultipleValues](self, "allowsMultipleValues");
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 0;
    -[WFEnumerationParameter possibleStates](self, "possibleStates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke;
    v23[3] = &unk_1E7AEAB60;
    v27 = v14;
    v25 = self;
    v26 = v28;
    v24 = v11;
    v17[0] = v16;
    v17[1] = 3221225472;
    v17[2] = __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke_3;
    v17[3] = &unk_1E7AEAB88;
    v21 = v13;
    v22 = v14;
    v18 = v10;
    v19 = v12;
    v20 = self;
    objc_msgSend(v15, "if_mapAsynchronously:completionHandler:", v23, v17);

    _Block_object_dispose(v28, 8);
  }

}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    objc_msgSend(v4, "selectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v12 = objc_alloc(-[WFEnumerationParameter singleStateClass](self, "singleStateClass"));
          objc_msgSend(v11, "serializedPossibleState");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v12, "initWithSerializedRepresentation:variableProvider:parameter:", v13, 0, self);

          if (v14)
          {
            objc_msgSend(v5, "addObject:", v14);
          }
          else
          {
            getWFWorkflowExecutionLogObject();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v11, "serializedPossibleState");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v26 = "-[WFEnumerationParameter parameterStateFromDialogResponse:]";
              v27 = 2112;
              v28 = v16;
              _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_FAULT, "%s Failed to instantiate selected parameter state from serializedRepresentation: %@", buf, 0x16u);

            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v8);
    }

    if (-[WFParameter allowsMultipleValues](self, "allowsMultipleValues"))
    {
      v17 = objc_msgSend(objc_alloc(-[WFParameter stateClass](self, "stateClass")), "initWithParameterStates:", v5);
    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
    v4 = v20;

  }
  else
  {

    v18 = 0;
  }

  return v18;
}

- (BOOL)alwaysShowsButton
{
  return self->_alwaysShowsButton;
}

- (BOOL)hideClearButton
{
  return self->_hideClearButton;
}

- (BOOL)liveUpdatesPossibleStatesInEditor
{
  return self->_liveUpdatesPossibleStatesInEditor;
}

- (NSString)selectionType
{
  return self->_selectionType;
}

- (NSString)tableViewStyle
{
  return self->_tableViewStyle;
}

- (BOOL)providesLocalizedValuesForSummary
{
  return self->_providesLocalizedValuesForSummary;
}

- (BOOL)prefersParameterValuePicker
{
  return self->_prefersParameterValuePicker;
}

void __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  char v23;

  v6 = a2;
  v7 = a4;
  if (*(_BYTE *)(a1 + 56)
    && objc_msgSend(v6, "stateIsEquivalent:", *(_QWORD *)(a1 + 32))
    && (v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), !*(_BYTE *)(v8 + 24)))
  {
    v9 = 1;
    *(_BYTE *)(v8 + 24) = 1;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "serializedRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localizedLabelForPossibleState:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localizedSubtitleLabelForPossibleState:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accessoryImageForPossibleState:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13FD0]), "initWithTitle:subtitle:image:", v11, v12, v13);
  objc_msgSend(MEMORY[0x1E0D13FC8], "itemWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke_2;
  v19[3] = &unk_1E7AEAB38;
  v23 = v9;
  v20 = v15;
  v21 = v10;
  v22 = v7;
  v16 = v7;
  v17 = v10;
  v18 = v15;
  objc_msgSend(v18, "encodedTypedValueWithCompletion:", v19);

}

void __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = (objc_class *)MEMORY[0x1E0DC79E0];
  v5 = a2;
  v6 = [v4 alloc];
  v7 = *(unsigned __int8 *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "key");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithItems:allowsMultipleSelection:message:attribution:prompt:parameterKey:", v5, v7, 0, v8, v9, v11);

  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v10);
}

void __99__WFEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  WFDialogContentListItem *v4;

  v3 = a2;
  v4 = -[WFDialogContentListItem initWithContentItem:encodedTypedValue:selected:serializedPossibleState:]([WFDialogContentListItem alloc], "initWithContentItem:encodedTypedValue:selected:serializedPossibleState:", *(_QWORD *)(a1 + 32), v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __48__WFEnumerationParameter_parameterStateIsValid___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateIsEquivalent:", a2);
}

uint64_t __48__WFEnumerationParameter_parameterStateIsValid___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stateIsEquivalent:", a2);
}

uint64_t __64__WFEnumerationParameter_statesForMultipleStateLabelWithStates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "possibleStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v8);

  objc_msgSend(v5, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "possibleStates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:", v7);

  objc_msgSend(v12, "numberWithUnsignedInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "compare:", v15);

  return v16;
}

- (BOOL)wf_supportsSearch
{
  return 0;
}

- (BOOL)wf_allowsMultipleSelection
{
  return 0;
}

- (BOOL)wf_usesTogglesForSelection
{
  void *v2;
  char v3;

  -[WFEnumerationParameter selectionType](self, "selectionType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Toggle"));

  return v3;
}

- (BOOL)wf_usesGroupTableViewStyle
{
  void *v2;
  char v3;

  -[WFEnumerationParameter tableViewStyle](self, "tableViewStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("InsetGrouped"));

  return v3;
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 1;
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0CBDA10]);
  -[WFEnumerationParameter possibleStates](self, "possibleStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithItems:", v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__WFEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v11[3] = &unk_1E7AF76F0;
  v12 = v8;
  v13 = v5;
  v9 = v8;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

- (BOOL)wf_alwaysScaleIconImage
{
  return 0;
}

uint64_t __91__WFEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

@end
