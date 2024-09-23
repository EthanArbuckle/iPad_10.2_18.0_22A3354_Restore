@implementation WFParameter(WFVariableMenuProvider)

- (id)variableMenuElementsWithVariable:()WFVariableMenuProvider parameterState:variableProvider:variableUIDelegate:setVariableHandler:
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  unsigned int v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  uint64_t v53;
  void *v54;
  void *v55;
  unsigned int v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  char isKindOfClass;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  id v97;
  id v98;
  id obj;
  id obja;
  id v101;
  id v102;
  void *v103;
  id v104;
  _QWORD v105[4];
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[5];
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  id v126;
  id v127;
  id v128;
  id v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _QWORD v132[6];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v79 = a4;
  v104 = a5;
  v13 = a6;
  v101 = a7;
  if (objc_msgSend((id)objc_msgSend(a1, "stateClass"), "instancesRespondToSelector:", sel_initWithVariable_))
  {
    objc_msgSend(a1, "supportedVariableTypes");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v104, "availableVariableNames", v79);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)v14;
  v102 = v12;
  v81 = v13;
  v92 = a1;
  if (objc_msgSend(a1, "shouldShowVariable:allowedVariableTypes:variableProvider:variableUIDelegate:", *MEMORY[0x24BEC4750], v14, v104, v13))
  {
    v15 = objc_alloc(MEMORY[0x24BEC1610]);
    objc_msgSend(MEMORY[0x24BEC1398], "colorWithSystemColor:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14D0], "clearBackground");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "initWithSymbolName:symbolColor:background:", CFSTR("wand.and.stars"), v16, v17);

    WFLocalizedString(CFSTR("Select Variable"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x24BEC5178]);
    v125[0] = MEMORY[0x24BDAC760];
    v125[1] = 3221225472;
    v125[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke;
    v125[3] = &unk_24EE25628;
    v126 = v82;
    v127 = v13;
    v21 = v104;
    v128 = v21;
    v22 = v101;
    v129 = v22;
    v95 = (void *)v19;
    v97 = (id)v18;
    v93 = (void *)objc_msgSend(v20, "initWithTitle:subtitle:icon:handler:", v19, 0, v18, v125);
    objc_msgSend(v89, "addObject:");
    v23 = objc_alloc_init(MEMORY[0x24BEC4198]);
    objc_msgSend(v23, "setVariableProvider:", v21);
    objc_msgSend(v23, "setUserDefinedVariableNames:", v83);
    objc_msgSend(v21, "availableOutputActions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOutputActions:", v24);

    objc_msgSend(v80, "containedVariables");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCurrentVariables:", v25);

    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v90 = v23;
    objc_msgSend(v23, "suggestedVariables");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v133, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v122 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
          v31 = v12;
          v32 = v12;
          v33 = v30;
          v34 = v33;
          if (v33 == v32)
          {
            v35 = 1;
          }
          else
          {
            v35 = 0;
            if (v31 && v33)
              v35 = objc_msgSend(v32, "isEqual:", v33);
          }

          v36 = objc_alloc(MEMORY[0x24BEC5178]);
          objc_msgSend(v34, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "icon");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v119[0] = MEMORY[0x24BDAC760];
          v119[1] = 3221225472;
          v119[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_3;
          v119[3] = &unk_24EE25B28;
          v39 = v22;
          v119[4] = v34;
          v120 = v39;
          v40 = (void *)objc_msgSend(v36, "initWithTitle:subtitle:icon:state:handler:", v37, 0, v38, v35, v119);

          objc_msgSend(v103, "addObject:", v40);
          v12 = v102;
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v133, 16);
      }
      while (v27);
    }

    v13 = v81;
    a1 = v92;
  }
  v41 = *MEMORY[0x24BEC4760];
  v96 = *MEMORY[0x24BEC4758];
  v132[0] = *MEMORY[0x24BEC4758];
  v88 = v41;
  v132[1] = v41;
  v86 = *MEMORY[0x24BEC4770];
  v87 = *MEMORY[0x24BEC4768];
  v132[2] = *MEMORY[0x24BEC4768];
  v132[3] = v86;
  v84 = *MEMORY[0x24BEC4780];
  v85 = *MEMORY[0x24BEC4778];
  v132[4] = *MEMORY[0x24BEC4780];
  v132[5] = v85;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v132, 6);
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v98 = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
  v43 = v82;
  if (v42)
  {
    v44 = v42;
    v45 = *(_QWORD *)v116;
    v91 = *(_QWORD *)v116;
    do
    {
      v46 = 0;
      v94 = v44;
      do
      {
        if (*(_QWORD *)v116 != v45)
          objc_enumerationMutation(v98);
        v47 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)v46);
        if (objc_msgSend(a1, "shouldShowVariable:allowedVariableTypes:variableProvider:variableUIDelegate:", v47, v43, v104, v13))
        {
          obja = v46;
          if (v47 == v96 || v47 == v88 || v47 == v87 || v47 == v86)
          {
            v63 = (void *)objc_opt_new();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
          }
          else
          {
            if (v47 != v85)
            {
              if (v47 != v84)
                goto LABEL_45;
              v113 = 0u;
              v114 = 0u;
              v111 = 0u;
              v112 = 0u;
              v48 = v83;
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
              if (v49)
              {
                v50 = v49;
                v51 = *(_QWORD *)v112;
                do
                {
                  for (j = 0; j != v50; ++j)
                  {
                    if (*(_QWORD *)v112 != v51)
                      objc_enumerationMutation(v48);
                    v53 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * j);
                    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4140]), "initWithName:variableProvider:aggrandizements:", v53, v104, 0);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v12, "name");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      v56 = objc_msgSend(v55, "isEqualToString:", v53);

                    }
                    else
                    {
                      v56 = 0;
                    }
                    v57 = objc_alloc(MEMORY[0x24BEC5178]);
                    objc_msgSend(v54, "name");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "icon");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    v108[0] = MEMORY[0x24BDAC760];
                    v108[1] = 3221225472;
                    v108[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_4;
                    v108[3] = &unk_24EE25B28;
                    v60 = v101;
                    v109 = v54;
                    v110 = v60;
                    v61 = v54;
                    v62 = (void *)objc_msgSend(v57, "initWithTitle:subtitle:icon:state:handler:", v58, 0, v59, v56, v108);

                    objc_msgSend(v103, "addObject:", v62);
                    v12 = v102;
                  }
                  v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
                }
                while (v50);
                v13 = v81;
                v43 = v82;
LABEL_43:
                v45 = v91;
                a1 = v92;
              }

              v44 = v94;
              v46 = obja;
              goto LABEL_45;
            }
            v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4048]), "initWithVariableProvider:aggrandizements:", v104, 0);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "name");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "name");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              isKindOfClass = objc_msgSend(v70, "isEqualToString:", v71);

            }
            else
            {
              isKindOfClass = 0;
            }
          }
          v65 = objc_alloc(MEMORY[0x24BEC5178]);
          objc_msgSend(v63, "name");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "icon");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = MEMORY[0x24BDAC760];
          v105[1] = 3221225472;
          v105[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_5;
          v105[3] = &unk_24EE25B28;
          v68 = v101;
          v106 = v63;
          v107 = v68;
          v48 = v63;
          v69 = (void *)objc_msgSend(v65, "initWithTitle:subtitle:icon:state:handler:", v66, 0, v67, isKindOfClass & 1, v105);

          objc_msgSend(v89, "addObject:", v69);
          goto LABEL_43;
        }
LABEL_45:
        v46 = (char *)v46 + 1;
      }
      while (v46 != (id)v44);
      v72 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
      v44 = v72;
    }
    while (v72);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v89, "count"))
  {
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC5180]), "initWithMenuElements:", v89);
    objc_msgSend(v73, "addObject:", v74);

  }
  if (objc_msgSend(v103, "count"))
  {
    v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC5180]), "initWithMenuElements:", v103);
    objc_msgSend(v75, "setStyle:", 2);
    WFLocalizedStringWithKey(CFSTR("Variables… (user defined + suggested)"), CFSTR("Variables…"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setTitle:", v76);

    objc_msgSend(v75, "setOnlyDisplayTitleWhenCollapsed:", 1);
    objc_msgSend(v73, "addObject:", v75);

  }
  if (objc_msgSend(v73, "count"))
    v77 = v73;
  else
    v77 = 0;

  return v77;
}

- (uint64_t)shouldShowVariable:()WFVariableMenuProvider allowedVariableTypes:variableProvider:variableUIDelegate:
{
  id v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a5;
  if (!objc_msgSend(a4, "containsObject:", v9))
    goto LABEL_16;
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEC4750]))
  {
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEC4758]) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEC4760]) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEC4768]) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEC4770]) & 1) != 0)
    {
      v12 = 1;
      goto LABEL_17;
    }
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEC4780]))
    {
      objc_msgSend(v10, "availableVariableNames");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v14 = v13;
      v12 = objc_msgSend(v13, "count") != 0;

      goto LABEL_17;
    }
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BEC4778]))
    {
      objc_msgSend(v10, "workflowInputClasses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v11 = objc_msgSend(v10, "hasAvailableActionOutputVariables");
  if (a6)
    v12 = v11;
  else
    v12 = 0;
LABEL_17:

  return v12;
}

- (id)clearButtonMenuItemWithVariable:()WFVariableMenuProvider parameterState:setVariableHandler:
{
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = CFSTR("Clear Variable");
  }
  else
  {
    objc_msgSend(a1, "defaultSerializedRepresentation");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (!v9 || v12)
    {
      v14 = objc_msgSend(a1, "allowsMultipleValues");

      if (!v14)
      {
        v21 = 0;
        goto LABEL_8;
      }
    }
    v11 = CFSTR("Clear");
  }
  v15 = objc_alloc(MEMORY[0x24BEC1610]);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1398]), "initWithSystemColor:", 2);
  objc_msgSend(MEMORY[0x24BEC14D0], "clearBackground");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithSymbolName:symbolColor:background:", CFSTR("xmark"), v16, v17);

  WFLocalizedString(v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x24BEC5178]);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __105__WFParameter_WFVariableMenuProvider__clearButtonMenuItemWithVariable_parameterState_setVariableHandler___block_invoke;
  v23[3] = &unk_24EE251C8;
  v24 = v10;
  v21 = (void *)objc_msgSend(v20, "initWithTitle:icon:isDestructive:handler:", v19, v18, 1, v23);

LABEL_8:
  return v21;
}

@end
