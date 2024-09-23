@implementation WFModuleSummaryTemplateBuilder

- (WFModuleSummaryTemplateBuilder)initWithFormatString:(id)a3
{
  id v4;
  WFModuleSummaryTemplateBuilder *v5;
  uint64_t v6;
  NSString *formatString;
  WFModuleSummaryTemplateBuilder *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFModuleSummaryTemplateBuilder;
  v5 = -[WFModuleSummaryTemplateBuilder init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSArray)parameterKeys
{
  -[WFModuleSummaryTemplateBuilder itemizeFormatStringIfNeeded](self, "itemizeFormatStringIfNeeded");
  return self->_parameterKeys;
}

- (void)itemizeFormatStringIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  -[WFModuleSummaryTemplateBuilder formatString](self, "formatString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[WFModuleSummaryTemplateBuilder formatItems](self, "formatItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      v7 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDD1798], "_intents_sharedFormatRegularExpression");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = &v22;
      v24 = 0x3010000000;
      v26 = 0;
      v27 = 0;
      v25 = &unk_226909C59;
      v9 = objc_msgSend(v3, "length");
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __61__WFModuleSummaryTemplateBuilder_itemizeFormatStringIfNeeded__block_invoke;
      v17 = &unk_24EE24BC8;
      v21 = &v22;
      v10 = v3;
      v18 = v10;
      v11 = v6;
      v19 = v11;
      v12 = v7;
      v20 = v12;
      objc_msgSend(v8, "enumerateMatchesInString:options:range:usingBlock:", v10, 0, 0, v9, &v14);
      objc_msgSend(v10, "substringFromIndex:", v23[5] + v23[4], v14, v15, v16, v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
        objc_msgSend(v11, "addObject:", v13);
      -[WFModuleSummaryTemplateBuilder setFormatItems:](self, "setFormatItems:", v11);
      -[WFModuleSummaryTemplateBuilder setParameterKeys:](self, "setParameterKeys:", v12);

      _Block_object_dispose(&v22, 8);
    }
  }

}

- (id)contentByEnumeratingSummaryWithParameterSlotBuilder:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  WFModuleSummaryTemplateBuilder *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[WFModuleSummaryTemplateBuilder itemizeFormatStringIfNeeded](self, "itemizeFormatStringIfNeeded");
  -[WFModuleSummaryTemplateBuilder formatItems](self, "formatItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[WFModuleSummaryTemplateBuilder formatItems](self, "formatItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSArray objectAtIndex:](self->_parameterKeys, "objectAtIndex:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v14);
            v15 = self;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObjectsFromArray:", v16);

            self = v15;
            ++v10;

          }
          else
          {
            objc_msgSend(v7, "addObject:", v13);
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildContentWithParameters:(id)a3 editableParameters:(id)a4 parameterStates:(id)a5 variableBeingEdited:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  WFModuleSummaryTemplateBuilder *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  WFModuleSummaryTemplateBuilder *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v27 = self;
  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v19, "key", v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v19, v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v16);
  }

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __116__WFModuleSummaryTemplateBuilder_buildContentWithParameters_editableParameters_parameterStates_variableBeingEdited___block_invoke;
  v28[3] = &unk_24EE24C18;
  v29 = v13;
  v30 = v10;
  v31 = v11;
  v32 = v27;
  v33 = v12;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  v24 = v13;
  -[WFModuleSummaryTemplateBuilder contentByEnumeratingSummaryWithParameterSlotBuilder:](v27, "contentByEnumeratingSummaryWithParameterSlotBuilder:", v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (void)setParameterKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)formatItems
{
  return self->_formatItems;
}

- (void)setFormatItems:(id)a3
{
  objc_storeStrong((id *)&self->_formatItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatItems, 0);
  objc_storeStrong((id *)&self->_parameterKeys, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

id __116__WFModuleSummaryTemplateBuilder_buildContentWithParameters_editableParameters_parameterStates_variableBeingEdited___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v33;
  void *v34;
  id v35;
  id obj;
  int v37;
  _QWORD v38[5];
  id v39;
  NSObject *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;
  _QWORD v52[4];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "conformsToProtocol:", &unk_2558EAAA0))
  {
    getWFGeneralLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[WFModuleSummaryTemplateBuilder buildContentWithParameters:editableParameters:parameterStates:variableBeing"
            "Edited:]_block_invoke";
      v48 = 2114;
      v49 = v3;
      _os_log_impl(&dword_226666000, v5, OS_LOG_TYPE_FAULT, "%s Did not find matching parameter for ${%{public}@}", buf, 0x16u);
    }
    goto LABEL_30;
  }
  v5 = v4;
  v37 = objc_msgSend(a1[5], "containsObject:", v5);
  objc_msgSend(a1[6], "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_29;
    if (-[NSObject allowsMultipleValues](v5, "allowsMultipleValues"))
    {
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_opt_class(), "slotsForMultipleParameterState:inParameter:", v6, v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
            goto LABEL_21;
        }
      }
      -[NSObject moduleSummarySlotForState:](v5, "moduleSummarySlotForState:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifierBySettingArrayIndex:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIdentifier:", v16);

        v52[0] = v14;
        v17 = (void *)MEMORY[0x24BDBCE30];
        v18 = v52;
LABEL_18:
        objc_msgSend(v17, "arrayWithObjects:count:", v18, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    else
    {
      -[NSObject moduleSummarySlotForState:](v5, "moduleSummarySlotForState:", v6);
      v19 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v19;
      if (v19)
      {
        v51 = v19;
        v17 = (void *)MEMORY[0x24BDBCE30];
        v18 = &v51;
        goto LABEL_18;
      }
    }
    v7 = 0;
LABEL_20:

    if (v7)
      goto LABEL_21;
LABEL_29:

LABEL_30:
    obj = 0;
    goto LABEL_31;
  }
  -[NSObject moduleSummarySlotsForState:](v5, "moduleSummarySlotsForState:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentAttributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length") != 0;

  if (WFShouldShowAddButtonForParameter(v5, v10, v6, objc_msgSend(v7, "count")))
  {
    +[WFSlotTemplateSlot addingSlotWithKey:](WFSlotTemplateSlot, "addingSlotWithKey:", CFSTR("_array_add_"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  if (!v7)
    goto LABEL_29;
LABEL_21:
  v33 = v6;
  v34 = v4;
  v35 = v3;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v7;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v43;
    v23 = *MEMORY[0x24BEBB318];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v25, "setEnabled:", objc_msgSend(v25, "isEnabled") & v37);
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject key](v5, "key");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "identifierBySettingParameterKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setIdentifier:", v28);

        objc_msgSend(v25, "contentAttributedString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "contentAttributedString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "length");
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __116__WFModuleSummaryTemplateBuilder_buildContentWithParameters_editableParameters_parameterStates_variableBeingEdited___block_invoke_2;
        v38[3] = &unk_24EE24BF0;
        v38[4] = v25;
        v39 = a1[5];
        v40 = v5;
        v41 = a1[8];
        objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v31, 0, v38);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v21);
  }

  v4 = v34;
  v3 = v35;
LABEL_31:

  return obj;
}

void __116__WFModuleSummaryTemplateBuilder_buildContentWithParameters_editableParameters_parameterStates_variableBeingEdited___block_invoke_2(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
    v6 = v9;
    if (objc_msgSend(v5, "isEnabled"))
      v7 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(a1 + 48));
    else
      v7 = 0;
    objc_msgSend(v6, "setEnabled:", v7);
    objc_msgSend(v6, "variable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelected:", v8 == *(void **)(a1 + 56));

    v4 = v9;
  }

}

void __61__WFModuleSummaryTemplateBuilder_itemizeFormatStringIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "substringWithRange:", v3, objc_msgSend(v5, "range") - v3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v5, "rangeAtIndex:", 1);
  objc_msgSend(v6, "substringWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
  v12 = objc_msgSend(v5, "range");
  v14 = v13;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v15 + 32) = v12;
  *(_QWORD *)(v15 + 40) = v14;

}

+ (BOOL)formatString:(id)a3 containsParameterKey:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("${%@}"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "containsString:", v7);

  return (char)v5;
}

+ (id)slotsForMultipleParameterState:(id)a3 inParameter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23 = a4;
  objc_msgSend(v5, "variable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v23, "moduleSummarySlotForState:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "variable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "populateWithVariable:", v8);

    if (v7)
    {
      v31[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v5, "parameterStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count") && !objc_msgSend(v23, "isRangedSizeArray"))
    goto LABEL_13;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __77__WFModuleSummaryTemplateBuilder_slotsForMultipleParameterState_inParameter___block_invoke;
  v24[3] = &unk_24EE24C40;
  v10 = v23;
  v25 = v10;
  v26 = &v27;
  objc_msgSend(v7, "if_compactMap:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isRangedSizeArray"))
  {
    v12 = objc_msgSend(v10, "arraySizeRangeForCHSWidgetFamily:", 3);
    if (objc_msgSend(v11, "count") < v12)
    {
      v13 = objc_msgSend(v11, "count");
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v12 - v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "count");
      if (v15 < (uint64_t)v12)
      {
        do
        {
          objc_msgSend(v10, "moduleSummarySlotForState:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifierBySettingArrayIndex:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setIdentifier:", v18);

          objc_msgSend(v16, "setEnabled:", v15 == objc_msgSend(v11, "count"));
          objc_msgSend(v14, "addObject:", v16);

          ++v15;
        }
        while (v12 != v15);
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v14);
      v20 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v20;
    }
  }
  if (WFShouldShowAddButtonForParameter(v10, *((unsigned __int8 *)v28 + 24) != 0, v5, objc_msgSend(v11, "count")))
  {
    +[WFSlotTemplateSlot addingSlotWithKey:](WFSlotTemplateSlot, "addingSlotWithKey:", CFSTR("_array_add_"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObject:", v21);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v11;
  }

  _Block_object_dispose(&v27, 8);
LABEL_16:

  return v9;
}

id __77__WFModuleSummaryTemplateBuilder_slotsForMultipleParameterState_inParameter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "moduleSummarySlotForState:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifierBySettingArrayIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v7);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v5, "contentAttributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "length") != 0;

  }
  return v5;
}

@end
