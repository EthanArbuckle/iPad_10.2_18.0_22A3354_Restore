@implementation WFContentItemFilterAction

- (int64_t)tableTemplateRowCount
{
  WFContentItemFilterAction *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  WFContentItemFilterAction.tableTemplateRowCount.getter();
  v4 = v3;

  return v4;
}

- (int64_t)tableTemplateCompoundType
{
  WFContentItemFilterAction *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  WFContentItemFilterAction.tableTemplateCompoundType.getter();
  v4 = v3;

  return v4;
}

- (void)setTableTemplateCompoundType:(int64_t)a3
{
  WFContentItemFilterAction *v4;

  v4 = self;
  WFContentItemFilterAction.tableTemplateCompoundType.setter(a3);

}

- (id)swift_rowForContentPropertyName:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  WFContentItemFilterAction *v7;
  Swift::String v8;
  void *v9;

  v4 = sub_1C1B0F224();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  v9 = (void *)WFContentItemFilterAction.row(forContentPropertyName:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (WFContentPredicate)contentPredicate
{
  WFContentItemFilterAction *v2;
  id v3;

  v2 = self;
  v3 = WFContentItemFilterAction.contentPredicate.getter();

  return (WFContentPredicate *)v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFContentItemFilterAction;
  -[WFAction localizedNameWithContext:](&v14, sel_localizedNameWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction workflow](self, "workflow");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[WFContentItemFilterAction tableTemplateRowCount](self, "tableTemplateRowCount");

    if (v8 >= 1)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedStringResourceWithKey(CFSTR("%@ Where"), CFSTR("%@ Where"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localize:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v11, v5);
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
    }
  }

  return v5;
}

- (id)parameterSummary
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WFActionParameterSummary *v11;

  -[WFAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[WFContentItemFilterAction tableTemplateRowCount](self, "tableTemplateRowCount") > 0;
  else
    v4 = 0;

  if (-[objc_class hasLibrary](-[WFAction contentItemClass](self, "contentItemClass"), "hasLibrary"))
  {
    -[WFContentItemFilterAction inputParameterKey](self, "inputParameterKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItemFilterAction parameterStateForKey:](self, "parameterStateForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "variable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (-[WFContentItemFilterAction hasMultipleFilterConditions](self, "hasMultipleFilterConditions"))
      {
        if (v7)
          -[WFContentItemFilterAction localizedParameterSummaryStringForFilterWithMultipleFilterConditions](self, "localizedParameterSummaryStringForFilterWithMultipleFilterConditions");
        else
          -[WFContentItemFilterAction localizedParameterSummaryStringForFindWithMultipleFilterConditions](self, "localizedParameterSummaryStringForFindWithMultipleFilterConditions");
      }
      else if (v7)
      {
        -[WFContentItemFilterAction localizedParameterSummaryStringForFilterWithFilterConditions](self, "localizedParameterSummaryStringForFilterWithFilterConditions");
      }
      else
      {
        -[WFContentItemFilterAction localizedParameterSummaryStringForFindWithFilterConditions](self, "localizedParameterSummaryStringForFindWithFilterConditions");
      }
    }
    else if (v7)
    {
      -[WFContentItemFilterAction localizedParameterSummaryStringForFilter](self, "localizedParameterSummaryStringForFilter");
    }
    else
    {
      -[WFContentItemFilterAction localizedParameterSummaryStringForFind](self, "localizedParameterSummaryStringForFind");
    }
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;

  }
  else
  {
    if (v4)
    {
      if (-[WFContentItemFilterAction hasMultipleFilterConditions](self, "hasMultipleFilterConditions"))
        -[WFContentItemFilterAction localizedParameterSummaryStringForFilterWithMultipleFilterConditions](self, "localizedParameterSummaryStringForFilterWithMultipleFilterConditions");
      else
        -[WFContentItemFilterAction localizedParameterSummaryStringForFilterWithFilterConditions](self, "localizedParameterSummaryStringForFilterWithFilterConditions");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFContentItemFilterAction localizedParameterSummaryStringForFilter](self, "localizedParameterSummaryStringForFilter");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v8;
  }
  v11 = -[WFActionParameterSummary initWithString:]([WFActionParameterSummary alloc], "initWithString:", v10);

  return v11;
}

- (id)localizedParameterSummaryStringForFind
{
  return WFLocalizedStringResourceWithKey(CFSTR("Find ${WFContentItemInputParameter}"), CFSTR("Find ${WFContentItemInputParameter}"));
}

- (id)localizedParameterSummaryStringForFindWithFilterConditions
{
  return WFLocalizedStringResourceWithKey(CFSTR("Find ${WFContentItemInputParameter} where"), CFSTR("Find ${WFContentItemInputParameter} where"));
}

- (id)localizedParameterSummaryStringForFindWithMultipleFilterConditions
{
  __CFString *v2;

  if (-[WFContentItemFilterAction tableTemplateCompoundType](self, "tableTemplateCompoundType"))
    v2 = CFSTR("FIND_FILTER_TITLE_FORMAT_FIND_ALL");
  else
    v2 = CFSTR("FIND_FILTER_TITLE_FORMAT_FIND_ANY");
  WFLocalizedStringResourceWithKey(v2, CFSTR("Find ${WFContentItemInputParameter} where ${WFCompoundType} of the following are true"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedParameterSummaryStringForFilter
{
  return WFLocalizedStringResourceWithKey(CFSTR("Filter ${WFContentItemInputParameter}"), CFSTR("Filter ${WFContentItemInputParameter}"));
}

- (id)localizedParameterSummaryStringForFilterWithFilterConditions
{
  return WFLocalizedStringResourceWithKey(CFSTR("Filter ${WFContentItemInputParameter} where "), CFSTR("Filter ${WFContentItemInputParameter} where "));
}

- (id)localizedParameterSummaryStringForFilterWithMultipleFilterConditions
{
  __CFString *v2;

  if (-[WFContentItemFilterAction tableTemplateCompoundType](self, "tableTemplateCompoundType"))
    v2 = CFSTR("FIND_FILTER_TITLE_FORMAT_FILTER_ALL");
  else
    v2 = CFSTR("FIND_FILTER_TITLE_FORMAT_FILTER_ANY");
  WFLocalizedStringResourceWithKey(v2, CFSTR("Filter ${WFContentItemInputParameter} where ${WFCompoundType} of the following are true"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("WFContentItemSortOrder"));

  if (v9)
  {
    WFLocalizedContentPropertyPossibleValueMarker(v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v14.receiver = self;
    v14.super_class = (Class)WFContentItemFilterAction;
    -[WFAction createStateForParameter:fromSerializedRepresentation:](&v14, sel_createStateForParameter_fromSerializedRepresentation_, v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFContentItemFilterAction;
    -[WFAction createStateForParameter:fromSerializedRepresentation:](&v13, sel_createStateForParameter_fromSerializedRepresentation_, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)localizedPluralDescription
{
  void *v3;
  uint64_t v4;

  -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedPluralFilterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "canLowercaseTypeDescription"))
  {
    objc_msgSend(v3, "localizedLowercaseString");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v4 = a3;
  -[WFContentItemFilterAction localizedPluralDescription](self, "localizedPluralDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[objc_class hasLibrary](-[WFAction contentItemClass](self, "contentItemClass"), "hasLibrary");
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
  {
    WFLocalizedStringResourceWithKey(CFSTR("WFContentItemFilterAction - Library description summary"), CFSTR("Searches for the %@ in your library that match the given criteria."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedStringResourceWithKey(CFSTR("WFContentItemFilterAction - Description summary"), CFSTR("Given a list of %@, this action returns the %@ that match the given criteria."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v5;
  }
  objc_msgSend(v7, "localizedStringWithFormat:", v9, v5, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)localizedDescriptionInputWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WFContentItemFilterAction localizedPluralDescription](self, "localizedPluralDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[objc_class hasLibrary](-[WFAction contentItemClass](self, "contentItemClass"), "hasLibrary");
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
  {
    v8 = CFSTR("WFContentItemFilterAction - Library description input");
    v9 = CFSTR("If provided, the action will search through the %@ passed as input.");
  }
  else
  {
    v8 = CFSTR("WFContentItemFilterAction - Description input");
    v9 = CFSTR("The %@ to filter through.");
  }
  WFLocalizedStringResourceWithKey(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedStringWithFormat:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WFContentItemFilterAction localizedPluralDescription](self, "localizedPluralDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFContentItemFilterAction tableTemplateRowCount](self, "tableTemplateRowCount") < 2)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = CFSTR("WFContentItemFilterAction - Description result");
    v9 = CFSTR("The %@ that match the criteria.");
  }
  else
  {
    v6 = -[WFContentItemFilterAction tableTemplateCompoundType](self, "tableTemplateCompoundType");
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (v6)
    {
      v8 = CFSTR("WFContentItemFilterAction - All description result");
      v9 = CFSTR("The %@ that match all of the criteria.");
    }
    else
    {
      v8 = CFSTR("WFContentItemFilterAction - Any description result");
      v9 = CFSTR("The %@ that match any of the criteria.");
    }
  }
  WFLocalizedStringResourceWithKey(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("filter|sort|find|search|library"), CFSTR("filter|sort|find|search|library"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[objc_class hasLibrary](-[WFAction contentItemClass](self, "contentItemClass"), "hasLibrary"))
  {
    WFLocalizedStringResourceWithKey(CFSTR("get (Find/Filter search keyword)"), CFSTR("get"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }

  return v7;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  return (id)-[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](self, "contentItemClass", a3), "localizedPluralFilterDescription");
}

- (unint64_t)parameterCollapsingBehavior
{
  return 2;
}

- (BOOL)inputRequired
{
  return -[objc_class hasLibrary](-[WFAction contentItemClass](self, "contentItemClass"), "hasLibrary") ^ 1;
}

- (id)inputParameterKey
{
  return CFSTR("WFContentItemInputParameter");
}

- (void)initializeParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFContentItemFilterAction;
  -[WFAction initializeParameters](&v9, sel_initializeParameters);
  -[WFContentItemFilterAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFContentItemSortProperty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("WFContentItemSortOrder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);
  if (v3)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Random"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", objc_msgSend(v5, "isEqualToString:", v6));

  }
  else
  {
    objc_msgSend(v4, "setHidden:", 1);
  }
  if (-[objc_class hasLibrary](-[WFAction contentItemClass](self, "contentItemClass"), "hasLibrary"))
  {
    -[WFContentItemFilterAction inputParameterKey](self, "inputParameterKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction parameterForKey:](self, "parameterForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setContentItemClass:", -[WFAction contentItemClass](self, "contentItemClass"));
  }
  -[WFContentItemFilterAction updateCompoundParameterVisibility](self, "updateCompoundParameterVisibility");

}

- (void)updateCompoundParameterVisibility
{
  id v3;

  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCompoundType"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[WFContentItemFilterAction hasMultipleFilterConditions](self, "hasMultipleFilterConditions") ^ 1);

}

- (BOOL)hasMultipleFilterConditions
{
  return -[WFContentItemFilterAction tableTemplateRowCount](self, "tableTemplateRowCount") > 1;
}

- (void)wasAddedToWorkflow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFContentItemFilterAction;
  -[WFAction wasAddedToWorkflow:](&v4, sel_wasAddedToWorkflow_, a3);
  -[WFAction nameUpdated](self, "nameUpdated");
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFContentItemFilterAction;
  -[WFAction wasRemovedFromWorkflow:](&v4, sel_wasRemovedFromWorkflow_, a3);
  -[WFAction nameUpdated](self, "nameUpdated");
}

- (id)parameterStateForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFStringSubstitutableState *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("WFCompoundType")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WFContentItemFilterAction tableTemplateCompoundType](self, "tableTemplateCompoundType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFContentItemFilterAction;
    -[WFAction parameterStateForKey:](&v9, sel_parameterStateForKey_, v4);
    v7 = (WFStringSubstitutableState *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("WFCompoundType"))
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v29.receiver = self;
    v29.super_class = (Class)WFContentItemFilterAction;
    if (!-[WFAction setParameterState:forKey:](&v29, sel_setParameterState_forKey_, v6, v7))
      goto LABEL_8;
    -[WFAction nameUpdated](self, "nameUpdated");
    -[WFContentItemFilterAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFContentItemSortOrder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItemFilterAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFContentItemSortProperty"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("WFContentItemSortOrder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v10, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Random"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", objc_msgSend(v13, "isEqualToString:", v14));

    }
    else
    {
      objc_msgSend(v11, "setHidden:", 1);
    }
    objc_msgSend(v12, "reloadPossibleStates");
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFContentItemSortProperty")))
    {
      objc_msgSend(v12, "possibleStates");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v8);

      if ((v17 & 1) == 0)
      {
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Z to A"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v28;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Biggest First"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v27;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Latest First"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30[2] = v26;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Longest First"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30[3] = v18;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Descending"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30[4] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "value");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v20, "containsObject:", v21);

        objc_msgSend(v12, "possibleStates");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContentItemFilterAction setParameterState:forKey:](self, "setParameterState:forKey:", v23, CFSTR("WFContentItemSortOrder"));

      }
    }

LABEL_15:
    -[WFContentItemFilterAction updateCompoundParameterVisibility](self, "updateCompoundParameterVisibility");
    -[WFAction reloadAuxiliaryButton](self, "reloadAuxiliaryButton");
    v15 = 1;
    goto LABEL_16;
  }
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  if (-[WFContentItemFilterAction tableTemplateCompoundType](self, "tableTemplateCompoundType") != v9)
  {
    -[WFContentItemFilterAction setTableTemplateCompoundType:](self, "setTableTemplateCompoundType:", v9);
    goto LABEL_15;
  }

LABEL_8:
  v15 = 0;
LABEL_16:

  return v15;
}

- (id)sortablePropertyNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[objc_class allProperties](-[WFAction contentItemClass](self, "contentItemClass"), "allProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sortable = YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sortablePropertyDisplayNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[objc_class allProperties](-[WFAction contentItemClass](self, "contentItemClass"), "allProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sortable = YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_map:", &__block_literal_global_58549);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)disallowedVariableTypesForTableTemplate
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)parameterDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  WFParameterDefinition *v10;
  objc_class *v11;
  WFParameterDefinition *v12;
  objc_class *v13;
  void *v14;
  WFParameterDefinition *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  WFParameterDefinition *v19;
  objc_class *v20;
  WFParameterDefinition *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  WFParameterDefinition *v38;
  void *v39;
  WFParameterDefinition *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  WFParameterDefinition *v47;
  void *v48;
  void *v49;
  WFParameterDefinition *v50;
  void *v51;
  objc_class *v52;
  WFParameterDefinition *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  WFParameterDefinition *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  WFParameterDefinition *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  WFParameterDefinition *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  WFParameterDefinition *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  WFParameterDefinition *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  WFContentItemFilterAction *v103;
  void *v104;
  void *v105;
  _QWORD v106[2];
  _QWORD v107[5];
  _QWORD v108[5];
  _QWORD v109[2];
  void *v110;
  const __CFString *v111;
  _QWORD v112[8];
  _QWORD v113[8];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[6];
  _QWORD v117[6];
  _QWORD v118[3];
  _QWORD v119[3];
  void *v120;
  _QWORD v121[7];
  _QWORD v122[7];
  _QWORD v123[5];
  _QWORD v124[5];
  _QWORD v125[2];
  _QWORD v126[5];
  _QWORD v127[5];
  _QWORD v128[2];
  _QWORD v129[10];
  _QWORD v130[10];
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[8];

  v133[6] = *MEMORY[0x1E0C80C00];
  -[WFContentItemFilterAction sortablePropertyNames](self, "sortablePropertyNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItemFilterAction sortablePropertyDisplayNames](self, "sortablePropertyDisplayNames");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class typeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "typeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class pluralTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "pluralTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v4, "isEqualToString:", v5);

  v6 = objc_msgSend(v3, "count");
  -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedPluralFilterDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "canLowercaseTypeDescription"))
  {
    objc_msgSend(v7, "localizedLowercaseString");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (-[objc_class hasLibrary](-[WFAction contentItemClass](self, "contentItemClass"), "hasLibrary"))
    v9 = CFSTR("Whether or not to limit the number of %@ retrieved.");
  else
    v9 = CFSTR("Whether or not to limit the number of %@ that are passed as output.");
  WFLocalizedString(v9);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)MEMORY[0x1E0C99DE8];
  v10 = [WFParameterDefinition alloc];
  v131[0] = CFSTR("Class");
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v100;
  v132[1] = CFSTR("WFContentItemFilter");
  v131[1] = CFSTR("Key");
  v131[2] = CFSTR("ContentItemClass");
  NSStringFromClass(-[WFAction contentItemClass](self, "contentItemClass"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v132[2] = v99;
  v131[3] = CFSTR("DisallowedVariableTypes");
  -[WFContentItemFilterAction disallowedVariableTypesForTableTemplate](self, "disallowedVariableTypesForTableTemplate");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v132[3] = v98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = -[WFParameterDefinition initWithDictionary:](v10, "initWithDictionary:");
  v133[0] = v96;
  v12 = [WFParameterDefinition alloc];
  v129[0] = CFSTR("Class");
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = v95;
  v129[1] = CFSTR("Label");
  WFLocalizedStringResourceWithKey(CFSTR("Sort by (ContentItemFilter)"), CFSTR("Sort by"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v130[1] = v94;
  v103 = self;
  v129[2] = CFSTR("Description");
  v14 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Optionally, what to sort the %@ by."));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v7);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v130[2] = v92;
  v129[3] = CFSTR("DisallowedVariableTypes");
  v128[0] = CFSTR("Ask");
  v128[1] = CFSTR("Variable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v130[3] = v91;
  v130[4] = CFSTR("WFContentItemSortProperty");
  v129[4] = CFSTR("Key");
  v129[5] = CFSTR("Placeholder");
  WFLocalizedStringResourceWithKey(CFSTR("None"), CFSTR("None"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v130[5] = v90;
  v130[6] = MEMORY[0x1E0C9AAB0];
  v129[6] = CFSTR("AlwaysShowsButton");
  v129[7] = CFSTR("Items");
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Random"));
  v102 = v3;
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v130[7] = v86;
  v129[8] = CFSTR("ItemDisplayNames");
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Random"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyPossibleValue(v85);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "arrayByAddingObject:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v130[8] = v83;
  v129[9] = CFSTR("Hidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6 == 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v130[9] = v82;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 10);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[WFParameterDefinition initWithDictionary:](v12, "initWithDictionary:");
  v133[1] = v80;
  v15 = [WFParameterDefinition alloc];
  v126[0] = CFSTR("Class");
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v79;
  v126[1] = CFSTR("Label");
  WFLocalizedStringResourceWithKey(CFSTR("Order (ContentItemFilter)"), CFSTR("Order"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v78;
  v126[2] = CFSTR("Description");
  v17 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("The order to sort the %@ in."));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringWithFormat:", v7);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v127[2] = v76;
  v126[3] = CFSTR("DisallowedVariableTypes");
  v125[0] = CFSTR("Ask");
  v125[1] = CFSTR("Variable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
  v18 = objc_claimAutoreleasedReturnValue();
  v126[4] = CFSTR("Key");
  v75 = (void *)v18;
  v127[3] = v18;
  v127[4] = CFSTR("WFContentItemSortOrder");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 5);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[WFParameterDefinition initWithDictionary:](v15, "initWithDictionary:");
  v133[2] = v71;
  v19 = [WFParameterDefinition alloc];
  v123[0] = CFSTR("Class");
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v70;
  v123[1] = CFSTR("Label");
  WFLocalizedStringResourceWithKey(CFSTR("Limit (ContentItemFilter)"), CFSTR("Limit"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v124[1] = v69;
  v123[2] = CFSTR("Description");
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v104, v7);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v124[2] = v68;
  v124[3] = MEMORY[0x1E0C9AAA0];
  v123[3] = CFSTR("DefaultValue");
  v123[4] = CFSTR("Key");
  v124[4] = CFSTR("WFContentItemLimitEnabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[WFParameterDefinition initWithDictionary:](v19, "initWithDictionary:");
  v133[3] = v66;
  v21 = [WFParameterDefinition alloc];
  v121[0] = CFSTR("Class");
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v65;
  v121[1] = CFSTR("Description");
  v23 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("The maximum number of %@."));
  v101 = v7;
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringWithFormat:", v7);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v63;
  v122[2] = CFSTR("WFContentItemLimitNumber");
  v121[2] = CFSTR("Key");
  v121[3] = CFSTR("StepperNoun");
  if (v73)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = CFSTR("%d Items");
    objc_msgSend(CFSTR("%d Items"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ (Pluralization)"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    WFLocalizedStringResourceWithKey(v27, CFSTR("%d Items"));
    v28 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[objc_class countDescription](-[WFAction contentItemClass](v103, "contentItemClass"), "countDescription");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v28;
  v122[3] = v28;
  v121[4] = CFSTR("StepperPrefix");
  WFLocalizedStringResourceWithKey(CFSTR("Get (ContentItemFilter)"), CFSTR("Get"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v122[4] = v74;
  v122[5] = &unk_1E7B8BE48;
  v121[5] = CFSTR("DefaultValue");
  v121[6] = CFSTR("RequiredResources");
  v118[0] = CFSTR("WFResourceClass");
  v118[1] = CFSTR("WFParameterKey");
  v119[0] = CFSTR("WFParameterRelationResource");
  v119[1] = CFSTR("WFContentItemLimitEnabled");
  v118[2] = CFSTR("WFParameterValue");
  v119[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v122[6] = v61;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 7);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[WFParameterDefinition initWithDictionary:](v21, "initWithDictionary:", v60);
  v133[4] = v59;
  v54 = [WFParameterDefinition alloc];
  v116[0] = CFSTR("Class");
  v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v58;
  v117[1] = CFSTR("WFCompoundType");
  v116[1] = CFSTR("Key");
  v116[2] = CFSTR("Items");
  objc_msgSend(&unk_1E7B8BE60, "stringValue");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v57;
  objc_msgSend(&unk_1E7B8BE78, "stringValue");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v30;
  v116[3] = CFSTR("ItemDisplayNames");
  WFLocalizedStringResourceWithKey(CFSTR("Any (find/filter)"), CFSTR("Any"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v31;
  WFLocalizedStringResourceWithKey(CFSTR("All (find/filter)"), CFSTR("All"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v117[3] = v33;
  v116[4] = CFSTR("DefaultValue");
  objc_msgSend(&unk_1E7B8BE60, "stringValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v117[4] = v34;
  v116[5] = CFSTR("DisallowedVariableTypes");
  +[WFParameter allInsertableVariableTypes](WFParameter, "allInsertableVariableTypes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v117[5] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[WFParameterDefinition initWithDictionary:](v54, "initWithDictionary:", v37);
  v133[5] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "arrayWithArray:", v39);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v35) = -[objc_class hasLibrary](-[WFAction contentItemClass](v103, "contentItemClass"), "hasLibrary");
  v40 = [WFParameterDefinition alloc];
  if ((_DWORD)v35)
  {
    v112[0] = CFSTR("Class");
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = v42;
    v113[1] = CFSTR("WFContentItemInputParameter");
    v112[1] = CFSTR("Key");
    v112[2] = CFSTR("Label");
    -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](v103, "contentItemClass"), "localizedPluralFilterDescription");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v113[2] = v43;
    v112[3] = CFSTR("Placeholder");
    -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](v103, "contentItemClass"), "localizedPluralFilterDescription");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v113[3] = v44;
    v112[4] = CFSTR("Items");
    v111 = CFSTR("Library");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v113[4] = v45;
    v112[5] = CFSTR("ItemDisplayNames");
    WFLocalizedStringResourceWithKey(CFSTR("Library (WFContentItemInputParameter)"), CFSTR("Library"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
    v47 = (WFParameterDefinition *)objc_claimAutoreleasedReturnValue();
    v113[5] = v47;
    v113[6] = CFSTR("Library");
    v112[6] = CFSTR("DefaultValue");
    v112[7] = CFSTR("DisallowedVariableTypes");
    v109[0] = CFSTR("CurrentDate");
    v109[1] = CFSTR("Ask");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v113[7] = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[WFParameterDefinition initWithDictionary:](v40, "initWithDictionary:", v49);
    v51 = v89;
    objc_msgSend(v89, "addObject:", v50);

  }
  else
  {
    v107[0] = CFSTR("Class");
    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = v42;
    v108[1] = CFSTR("WFContentItemInputParameter");
    v107[1] = CFSTR("Key");
    v107[2] = CFSTR("Label");
    -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](v103, "contentItemClass"), "localizedPluralFilterDescription");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v108[2] = v43;
    v107[3] = CFSTR("Placeholder");
    -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](v103, "contentItemClass"), "localizedPluralFilterDescription");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v108[3] = v44;
    v107[4] = CFSTR("DisallowedVariableTypes");
    v106[0] = CFSTR("CurrentDate");
    v106[1] = CFSTR("Ask");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v108[4] = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[WFParameterDefinition initWithDictionary:](v40, "initWithDictionary:", v46);
    v51 = v89;
    objc_msgSend(v89, "addObject:", v47);
  }

  return v51;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[WFContentItemFilterAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFContentItemSortProperty"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[objc_class allProperties](-[WFAction contentItemClass](self, "contentItemClass"), "allProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectMatchingKey:value:", CFSTR("name"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;

    }
    else
    {
      -[objc_class allProperties](-[WFAction contentItemClass](self, "contentItemClass"), "allProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectMatchingKey:value:", CFSTR("displayName"), v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    v11 = (void *)objc_msgSend(v8, "propertyClass");
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Ascending"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Descending"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "hasPossibleValues") & 1) == 0)
    {
      if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
        || objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
      {
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("A to Z"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v15;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Z to A"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v16;
        v17 = v23;
      }
      else if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
             || (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
             || objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
      {
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Smallest First"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v15;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Biggest First"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v16;
        v17 = v22;
      }
      else if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
      {
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Oldest First"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v15;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Latest First"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v16;
        v17 = v21;
      }
      else
      {
        if (!objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
          goto LABEL_16;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Shortest First"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v15;
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Longest First"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v16;
        v17 = v20;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v18 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v18;
    }
LABEL_16:
    objc_msgSend(v14, "if_map:", &__block_literal_global_339);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyPossibleValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WFContentQuery)query
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContentItemSortProperty"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Random"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D13F08], "randomSortDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[objc_class allProperties](-[WFAction contentItemClass](self, "contentItemClass"), "allProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContentItemSortProperty"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectMatchingKey:value:", CFSTR("name"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Z to A"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Biggest First"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Latest First"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v12;
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Longest First"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v13;
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Descending"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContentItemSortOrder"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "containsObject:", v16);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D13F08], "sortDescriptorWithProperty:ascending:comparator:", v9, v17 ^ 1u, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContentItemFilterAction contentPredicate](self, "contentPredicate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13F00]), "initWithPredicate:", v19);
  objc_msgSend(v20, "setSortDescriptors:", v18);
  v21 = -[WFContentItemFilterAction slice](self, "slice");
  objc_msgSend(v20, "setSlice:", v21, v22);

  return (WFContentQuery *)v20;
}

- (_WFContentSlice)slice
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  _WFContentSlice result;

  v3 = *MEMORY[0x1E0D141C8];
  v4 = *(_QWORD *)(MEMORY[0x1E0D141C8] + 8);
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContentItemLimitNumber"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContentItemLimitEnabled"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
    v9 = v6;
  else
    v9 = v4;
  if (v8)
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v10 = v3;
  result.var1 = v9;
  result.var0 = v10;
  return result;
}

- (unint64_t)mode
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;

  -[WFContentItemFilterAction inputParameterKey](self, "inputParameterKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItemFilterAction parameterStateForKey:](self, "parameterStateForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[objc_class hasLibrary](-[WFAction contentItemClass](self, "contentItemClass"), "hasLibrary"))
  {
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Library"));

    v7 = v6 ^ 1u;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  if (-[WFContentItemFilterAction mode](self, "mode"))
  {
    -[WFContentItemFilterAction query](self, "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItemFilterAction runFilterWithInput:query:](self, "runFilterWithInput:query:", v4, v5);

  }
  else
  {
    v6 = -[WFAction contentItemClass](self, "contentItemClass");
    -[WFContentItemFilterAction query](self, "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction contentPermissionRequestor](self, "contentPermissionRequestor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__WFContentItemFilterAction_runAsynchronouslyWithInput___block_invoke;
    v9[3] = &unk_1E7AF7CC8;
    v9[4] = self;
    -[objc_class runQuery:withItems:permissionRequestor:completionHandler:](v6, "runQuery:withItems:permissionRequestor:completionHandler:", v7, 0, v8, v9);

  }
}

- (void)runFilterWithInput:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a4;
  v7 = a3;
  v8 = -[WFAction contentItemClass](self, "contentItemClass");
  -[WFAction contentPermissionRequestor](self, "contentPermissionRequestor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__WFContentItemFilterAction_runFilterWithInput_query___block_invoke;
  v10[3] = &unk_1E7AF7CF0;
  v10[4] = self;
  objc_msgSend(v7, "generateCollectionByEvaluatingQuery:forContentItemClass:permissionRequestor:completionHandler:", v6, v8, v9, v10);

}

- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  uint64_t v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  uint64_t v25;
  objc_class *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[WFContentItemFilterAction inputRequired](self, "inputRequired"))
  {
    v53.receiver = self;
    v53.super_class = (Class)WFContentItemFilterAction;
    v8 = -[WFAction canHandleInputOfContentClasses:withSupportedClasses:](&v53, sel_canHandleInputOfContentClasses_withSupportedClasses_, v6, v7);
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v9 = v7;
    v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v35)
    {
      v10 = *(_QWORD *)v50;
      v39 = v7;
      v40 = v6;
      v38 = v9;
      v34 = *(_QWORD *)v50;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(v9);
          v36 = v11;
          v12 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v11);
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v13 = v6;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v46;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v46 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
                if (objc_msgSend(v18, "isSubclassOfClass:", v12))
                {
                  v19 = -[WFAction contentItemClass](self, "contentItemClass");
                  if (v19 != (objc_class *)objc_opt_class()
                    || v18 != (void *)objc_opt_class() && v18 != (void *)objc_opt_class())
                  {
                    if ((v20 = -[WFAction contentItemClass](self, "contentItemClass"),
                          v21 = objc_opt_class(),
                          v22 = -[WFAction contentItemClass](self, "contentItemClass"),
                          v22 != (objc_class *)objc_opt_class())
                      && v20 != (objc_class *)v21
                      || v18 != (void *)objc_opt_class() && v18 != (void *)objc_opt_class())
                    {
LABEL_57:

                      v8 = 1;
                      v7 = v39;
                      v6 = v40;
                      goto LABEL_58;
                    }
                  }
                }
                else if (v12 == objc_opt_class()
                       && v18 != (void *)objc_opt_class()
                       && v18 != (void *)objc_opt_class()
                       && v18 != (void *)objc_opt_class()
                       && v18 != (void *)objc_opt_class()
                       && v18 != (void *)objc_opt_class()
                       && v18 != (void *)objc_opt_class()
                       && v18 != (void *)objc_opt_class()
                       && v18 != (void *)objc_opt_class())
                {
                  v23 = -[WFAction contentItemClass](self, "contentItemClass");
                  if (v23 != (objc_class *)objc_opt_class()
                    || v18 != (void *)objc_opt_class() && v18 != (void *)objc_opt_class())
                  {
                    if ((v24 = -[WFAction contentItemClass](self, "contentItemClass"),
                          v25 = objc_opt_class(),
                          v26 = -[WFAction contentItemClass](self, "contentItemClass"),
                          v26 != (objc_class *)objc_opt_class())
                      && v24 != (objc_class *)v25
                      || v18 != (void *)objc_opt_class() && v18 != (void *)objc_opt_class())
                    {
                      v43 = 0u;
                      v44 = 0u;
                      v41 = 0u;
                      v42 = 0u;
                      objc_msgSend(v18, "allSupportedTypes");
                      obj = (id)objc_claimAutoreleasedReturnValue();
                      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                      if (v27)
                      {
                        v28 = v27;
                        v29 = *(_QWORD *)v42;
                        while (2)
                        {
                          for (i = 0; i != v28; ++i)
                          {
                            if (*(_QWORD *)v42 != v29)
                              objc_enumerationMutation(obj);
                            v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v31, "isDeclared") & 1) != 0)
                            {

                              goto LABEL_57;
                            }
                          }
                          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                          if (v28)
                            continue;
                          break;
                        }
                      }

                    }
                  }
                }
                ++v17;
              }
              while (v17 != v15);
              v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
              v15 = v32;
            }
            while (v32);
          }

          v11 = v36 + 1;
          v7 = v39;
          v6 = v40;
          v9 = v38;
          v10 = v34;
        }
        while (v36 + 1 != v35);
        v35 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v35);
    }

    v8 = 0;
  }
LABEL_58:

  return v8;
}

void __54__WFContentItemFilterAction_runFilterWithInput_query___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __56__WFContentItemFilterAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0D13EA8];
  v7 = a3;
  objc_msgSend(v5, "collectionWithItems:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", v6);

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
}

WFStringSubstitutableState *__58__WFContentItemFilterAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFStringSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

uint64_t __57__WFContentItemFilterAction_sortablePropertyDisplayNames__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedName");
}

@end
