@implementation INIntentCodableDescription(Workflow)

- (id)wf_actionParameterDefinitionsWithOverrides:()Workflow
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFParameterDefinition *v16;
  WFParameterDefinition *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v42;
  id obj;
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  const __CFString *v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v4 = objc_opt_new();
  v5 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v6 = (void *)v4;
  v44 = a1;
  objc_msgSend(a1, "displayOrderedAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (objc_msgSend(v12, "isConfigurable"))
        {
          objc_msgSend(v12, "propertyName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            v17 = [WFParameterDefinition alloc];
            v16 = -[WFParameterDefinition initWithDictionary:](v17, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
          }
          v18 = v16;

          if (objc_msgSend(v12, "supportsDynamicEnumeration"))
            v19 = objc_opt_class();
          else
            v19 = objc_msgSend(v12, "wf_parameterClass");
          v20 = v19;
          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "wf_updatedParameterDefinition:parameterClass:localizer:", v18, v20, v21);
            v22 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "propertyName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v22, v23);

            objc_msgSend(v12, "propertyName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v24);

            v18 = (void *)v22;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v9);
  }
  v42 = v6;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v44, "displayOrderedAttributes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v44, "wf_relationResourceDefinitionForAttribute:parameters:overrides:", v29, v5, v45);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(v29, "propertyName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v32, "objectForKey:", CFSTR("RequiredResources"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v33, "initWithArray:", v34);

          objc_msgSend(v35, "addObject:", v30);
          v56 = CFSTR("RequiredResources");
          v57 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "definitionByAddingEntriesInDictionary:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "propertyName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, v38);

        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v26);
  }

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __83__INIntentCodableDescription_Workflow__wf_actionParameterDefinitionsWithOverrides___block_invoke;
  v46[3] = &unk_1E7AEDE48;
  v47 = v5;
  v39 = v5;
  objc_msgSend(v42, "if_map:", v46);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)wf_relationResourceDefinitionForAttribute:()Workflow parameters:overrides:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "relationship");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "parentCodableAttribute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v11 = (void *)objc_opt_new();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("WFResourceClass"));

      objc_msgSend(v10, "parentCodableAttribute");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "propertyName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", CFSTR("Key"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = (void *)v17;
      else
        v19 = v15;
      v20 = v19;

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("WFParameterKey"));
      v21 = objc_msgSend(v10, "relation") - 1;
      if (v21 <= 8 && ((0x17Du >> v21) & 1) != 0)
        v22 = *off_1E7AEDED0[v21];
      else
        v22 = 0;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("WFParameterRelation"));
      objc_msgSend(v10, "values");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __103__INIntentCodableDescription_Workflow__wf_relationResourceDefinitionForAttribute_parameters_overrides___block_invoke;
      v29 = &unk_1E7AEDEB0;
      v30 = v7;
      v31 = v10;
      objc_msgSend(v23, "if_map:", &v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("WFParameterValues"), v26, v27, v28, v29);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
