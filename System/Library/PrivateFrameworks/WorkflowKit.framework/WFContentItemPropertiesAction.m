@implementation WFContentItemPropertiesAction

- (id)properties
{
  void *v2;
  void *v3;
  void *v4;

  -[objc_class allProperties](-[WFAction contentItemClass](self, "contentItemClass"), "allProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("gettable = YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedNameWithContext:(id)a3
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
  objc_super v14;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFContentItemPropertiesAction;
    -[WFAction localizedNameWithContext:](&v14, sel_localizedNameWithContext_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLocalizedStringResourceWithKey(CFSTR("WFContentItemPropertiesAction - Action Name"), CFSTR("Get Details of %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedPluralFilterDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedCapitalizedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "localize:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)parameterSummary
{
  WFActionParameterSummary *v2;
  void *v3;
  WFActionParameterSummary *v4;

  v2 = [WFActionParameterSummary alloc];
  WFLocalizedStringResourceWithKey(CFSTR("Get ${WFContentItemPropertyName} from ${WFInput}"), CFSTR("Get ${WFContentItemPropertyName} from ${WFInput}"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFActionParameterSummary initWithString:](v2, "initWithString:", v3);

  return v4;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedPluralFilterDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "canLowercaseTypeDescription"))
  {
    objc_msgSend(v5, "localizedLowercaseString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedStringResourceWithKey(CFSTR("Gets a specific piece of information from the %@ passed into the action."), CFSTR("Gets a specific piece of information from the %@ passed into the action."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedStringWithFormat:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[WFContentItemPropertiesAction selectedProperty](self, "selectedProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
  }
  else
  {
    WFLocalizedStringResourceWithKey(CFSTR("The piece of information"), CFSTR("The piece of information"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFContentItemPropertiesAction;
  v3 = a3;
  -[WFAction localizedKeywordsWithContext:](&v10, sel_localizedKeywordsWithContext_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringResourceWithKey(CFSTR("property|properties|fetch"), CFSTR("property|properties|fetch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v5, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)inputRequired
{
  return 1;
}

- (id)inputParameterKey
{
  return CFSTR("WFInput");
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[WFContentItemPropertiesAction selectedProperty](self, "selectedProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v18[0] = objc_msgSend(v3, "valueItemClass");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[WFContentItemPropertiesAction properties](self, "properties", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "valueItemClass"));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)selectedProperty
{
  void *v3;
  void *v4;
  void *v5;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFContentItemPropertyName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class propertyForName:](-[WFAction contentItemClass](self, "contentItemClass"), "propertyForName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFContentItemPropertiesAction;
  v7 = -[WFAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFContentItemPropertyName")))
    -[WFAction outputDetailsUpdated](self, "outputDetailsUpdated");

  return v7;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[WFContentItemPropertiesAction selectedProperty](self, "selectedProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFContentItemPropertiesAction selectedProperty](self, "selectedProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFAction outputDictionary](self, "outputDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("OutputName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[objc_class localizedPluralFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedPluralFilterDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedCapitalizedString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedStringResourceWithKey(CFSTR("WFContentItemPropertiesAction - Action Output Name"), CFSTR("Details of %@"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localize:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v15, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "localize:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
LABEL_6:

  return v9;
}

- (id)outputMeasurementUnitType
{
  void *v2;
  void *v3;

  -[WFContentItemPropertiesAction selectedProperty](self, "selectedProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementUnitType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)parameterDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WFParameterDefinition *v20;
  WFParameterDefinition *v21;
  void *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[WFContentItemAction defaultProperty](self, "defaultProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("Class"));

  objc_msgSend(v5, "setValue:forKey:", CFSTR("WFContentItemPropertyName"), CFSTR("Key"));
  WFLocalizedStringResourceWithKey(CFSTR("Detail (ContentItemProperties)"), CFSTR("Detail"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("Label"));

  -[WFContentItemPropertiesAction properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "if_compactMap:", &__block_literal_global_13012);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("Items"));

  -[WFContentItemPropertiesAction properties](self, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_compactMap:", &__block_literal_global_154_13013);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("ItemDisplayNames"));

  if (v4)
  {
    +[WFStringSubstitutableState serializedRepresentationFromValue:](WFStringSubstitutableState, "serializedRepresentationFromValue:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("DefaultValue"));

  }
  else
  {
    objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("DefaultValue"));
  }
  v14 = (void *)objc_opt_new();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v16, CFSTR("Class"));

  -[WFContentItemPropertiesAction inputParameterKey](self, "inputParameterKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v17, CFSTR("Key"));

  -[objc_class localizedFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedFilterDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v18, CFSTR("Label"));

  -[objc_class localizedFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedFilterDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v19, CFSTR("Placeholder"));

  v20 = -[WFParameterDefinition initWithDictionary:]([WFParameterDefinition alloc], "initWithDictionary:", v5);
  v24[0] = v20;
  v21 = -[WFParameterDefinition initWithDictionary:]([WFParameterDefinition alloc], "initWithDictionary:", v14);
  v24[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)runAsynchronouslyWithInput:(id)a3
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
  void *v13;
  objc_class *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContentItemPropertyName"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class propertyForName:](-[WFAction contentItemClass](self, "contentItemClass"), "propertyForName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D13EC0];
    objc_msgSend(v4, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "contentItems:haveContentProperties:", v8, v9))
    {

    }
    else
    {
      objc_msgSend(v4, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForKey:", CFSTR("class"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItemAction inputContentClasses](self, "inputContentClasses");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObjectCommonWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = -[WFAction contentItemClass](self, "contentItemClass");
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __60__WFContentItemPropertiesAction_runAsynchronouslyWithInput___block_invoke;
        v15[3] = &unk_1E7AED920;
        v15[4] = self;
        v16 = v6;
        objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v14, v15);

        goto LABEL_8;
      }
    }
    -[WFContentItemPropertiesAction finishWithItems:property:coercionPerformed:](self, "finishWithItems:property:coercionPerformed:", v4, v6, 0);
  }
  else
  {
    -[WFAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }
LABEL_8:

}

- (void)finishWithItems:(id)a3 property:(id)a4 coercionPerformed:(BOOL)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v8 = a4;
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke;
  v11[3] = &unk_1E7AED948;
  v13 = a5;
  v12 = v8;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke_3;
  v10[3] = &unk_1E7AF7CF0;
  v9 = v8;
  objc_msgSend(a3, "transformItemsAndFlattenUsingBlock:completionHandler:", v11, v10);

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 40))
  {
    v7 = *(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "supportedPropertyForProperty:", *(_QWORD *)(a1 + 32));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke_2;
    v9[3] = &unk_1E7AF8250;
    v10 = v6;
    objc_msgSend(v8, "getValuesForObject:completionHandler:", v5, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

uint64_t __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__WFContentItemPropertiesAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a4;
  v7 = objc_msgSend(v9, "numberOfItems");
  v8 = *(void **)(a1 + 32);
  if (v7)
    objc_msgSend(v8, "finishWithItems:property:coercionPerformed:", v9, *(_QWORD *)(a1 + 40), 1);
  else
    objc_msgSend(v8, "finishRunningWithError:", v6);

}

uint64_t __53__WFContentItemPropertiesAction_parameterDefinitions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedName");
}

uint64_t __53__WFContentItemPropertiesAction_parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
