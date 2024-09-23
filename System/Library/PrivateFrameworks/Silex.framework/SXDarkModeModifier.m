@implementation SXDarkModeModifier

- (SXDarkModeModifier)initWithPolicyHandler:(id)a3 configuration:(id)a4 namespacedObjectFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXDarkModeModifier *v12;
  SXDarkModeModifier *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXDarkModeModifier;
  v12 = -[SXDarkModeModifier init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_policyHandler, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_namespacedObjectFactory, a5);
  }

  return v13;
}

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  SXDarkModePolicyHandler *policyHandler;
  void *v9;
  SXDarkModePolicyHandler *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  SXDarkModeModifier *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  policyHandler = self->_policyHandler;
  objc_msgSend(v7, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(policyHandler) = -[SXDarkModePolicyHandler shouldApplyDarkModeToDOM:layoutOptions:](policyHandler, "shouldApplyDarkModeToDOM:layoutOptions:", v6, v9);

  if ((_DWORD)policyHandler)
  {
    v10 = self->_policyHandler;
    objc_msgSend(v6, "documentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = -[SXDarkModePolicyHandler shouldApplyDarkModeToDocumentStyle:DOM:layoutOptions:](v10, "shouldApplyDarkModeToDocumentStyle:DOM:layoutOptions:", v11, v6, v12);

    if ((_DWORD)v10)
    {
      objc_msgSend(v6, "documentStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedDocumentStyle:context:](self, "invertedDocumentStyle:context:", v13, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDocumentStyle:", v14);

    }
    objc_msgSend(v6, "components");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __40__SXDarkModeModifier_modifyDOM_context___block_invoke;
    v16[3] = &unk_24D68A1A8;
    v17 = v6;
    v18 = self;
    v19 = v7;
    objc_msgSend(v15, "enumerateComponentsWithBlock:", v16);

  }
}

uint64_t __40__SXDarkModeModifier_modifyDOM_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "analysis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToComponent:DOM:", v6, *(_QWORD *)(a1 + 32));
  if ((_DWORD)v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "invertedComponent:context:", v6, *(_QWORD *)(a1 + 48));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 != v6)
      objc_msgSend(v5, "replaceComponent:withComponent:", v6, v10);
    v55 = v9;
    v56 = v7;
    v54 = v10;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToComponentStylesForComponent:DOM:", v6, *(_QWORD *)(a1 + 32)))
    {
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend(v7, "componentStylesForComponent:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v74;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v74 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v15);
            objc_msgSend(*(id *)(a1 + 32), "componentStyles");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18
              && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToComponentStyle:component:DOM:", v18, v6, *(_QWORD *)(a1 + 32)))
            {
              objc_msgSend(*(id *)(a1 + 40), "invertComponentStyle:component:DOM:context:", v18, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
            }

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        }
        while (v13);
      }

      v9 = v55;
      v7 = v56;
      v10 = v54;
    }
    v52 = v5;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:DOM:", v6, *(_QWORD *)(a1 + 32)))
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v7, "componentTextStylesForComponent:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v70;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v70 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v23);
            objc_msgSend(*(id *)(a1 + 32), "componentTextStyles", v52);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKey:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26
              && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToBackgroundColorsOfComponentTextStyle:component:DOM:", v26, v6, *(_QWORD *)(a1 + 32)))
            {
              objc_msgSend(*(id *)(a1 + 40), "invertBackgroundColorsOfComponentTextStyle:component:DOM:context:", v26, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
            }

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
        }
        while (v21);
      }

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      objc_msgSend(v56, "textStylesForComponent:", v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v66;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v66 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v31);
            objc_msgSend(*(id *)(a1 + 32), "textStyles", v52);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKey:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34
              && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToBackgroundColorsOfTextStyle:component:DOM:", v34, v6, *(_QWORD *)(a1 + 32)))
            {
              objc_msgSend(*(id *)(a1 + 40), "invertBackgroundColorsOfTextStyle:component:DOM:context:", v34, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
            }

            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
        }
        while (v29);
      }

      v5 = v52;
      v10 = v54;
      v9 = v55;
      v7 = v56;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToTextStyleForegroundColorsForComponent:DOM:", v6, *(_QWORD *)(a1 + 32), v52))
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend(v7, "componentTextStylesForComponent:", v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v62;
        do
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v62 != v38)
              objc_enumerationMutation(v35);
            v40 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v39);
            objc_msgSend(*(id *)(a1 + 32), "componentTextStyles");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "objectForKey:", v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42
              && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToForegroundColorsOfComponentTextStyle:component:DOM:", v42, v6, *(_QWORD *)(a1 + 32)))
            {
              objc_msgSend(*(id *)(a1 + 40), "invertForegroundColorsOfComponentTextStyle:component:DOM:context:", v42, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
            }

            ++v39;
          }
          while (v37 != v39);
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
        }
        while (v37);
      }

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      objc_msgSend(v56, "textStylesForComponent:", v8);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v58;
        do
        {
          v47 = 0;
          do
          {
            if (*(_QWORD *)v58 != v46)
              objc_enumerationMutation(v43);
            v48 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v47);
            objc_msgSend(*(id *)(a1 + 32), "textStyles");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectForKey:", v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (v50
              && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldApplyDarkModeToForegroundColorsOfTextStyle:component:DOM:", v50, v6, *(_QWORD *)(a1 + 32)))
            {
              objc_msgSend(*(id *)(a1 + 40), "invertForegroundColorsOfTextStyle:component:DOM:context:", v50, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
            }

            ++v47;
          }
          while (v45 != v47);
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v77, 16);
        }
        while (v45);
      }

      v5 = v53;
      v10 = v54;
      v9 = v55;
      v7 = v56;
    }

  }
  return v9;
}

- (void)invertComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v10;
  SXNamespacedObjectFactory *namespacedObjectFactory;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a5;
  v10 = a6;
  namespacedObjectFactory = self->_namespacedObjectFactory;
  v12 = a4;
  objc_msgSend(a3, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXNamespacedObjectFactory createNamespacedReferenceForComponentStyle:component:DOM:](namespacedObjectFactory, "createNamespacedReferenceForComponentStyle:component:DOM:", v13, v14, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v20, "componentStyles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedComponentStyle:context:](self, "invertedComponentStyle:context:", v17, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v20, "componentStyles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v15);

    }
  }

}

- (void)invertBackgroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SXNamespacedObjectFactory *namespacedObjectFactory;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v23, "analysis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "namespacedObjectReferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  namespacedObjectFactory = self->_namespacedObjectFactory;
  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXNamespacedObjectFactory createNamespacedReferenceForComponentTextStyle:component:DOM:](namespacedObjectFactory, "createNamespacedReferenceForComponentTextStyle:component:DOM:", v16, v17, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v23, "componentTextStyles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedComponentTextStyleBackgroundColors:context:](self, "invertedComponentTextStyleBackgroundColors:context:", v20, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v23, "componentTextStyles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v18);

    }
  }

}

- (void)invertForegroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SXNamespacedObjectFactory *namespacedObjectFactory;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "analysis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "namespacedObjectReferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentTextStyleIdentifierForNamespacedComponentTextStyleIdentifier:component:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v17, "isEqualToString:", v18);

  if ((_DWORD)v16)
  {
    namespacedObjectFactory = self->_namespacedObjectFactory;
    objc_msgSend(v12, "identifier");
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "identifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[SXNamespacedObjectFactory createNamespacedReferenceForComponentTextStyle:component:DOM:](namespacedObjectFactory, "createNamespacedReferenceForComponentTextStyle:component:DOM:", v20, v12, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)v20;
  }
  else
  {
    objc_msgSend(v12, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v21)
  {
    objc_msgSend(v10, "componentTextStyles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedComponentTextStyleForegroundColors:context:](self, "invertedComponentTextStyleForegroundColors:context:", v23, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v10, "componentTextStyles");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v21);

    }
  }

}

- (void)invertBackgroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SXNamespacedObjectFactory *namespacedObjectFactory;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v23, "analysis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "namespacedObjectReferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  namespacedObjectFactory = self->_namespacedObjectFactory;
  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXNamespacedObjectFactory createNamespacedReferenceForTextStyle:component:DOM:](namespacedObjectFactory, "createNamespacedReferenceForTextStyle:component:DOM:", v16, v17, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v23, "textStyles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedTextStyleBackgroundColors:context:](self, "invertedTextStyleBackgroundColors:context:", v20, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v23, "textStyles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v18);

    }
  }

}

- (void)invertForegroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  SXNamespacedObjectFactory *namespacedObjectFactory;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v27, "analysis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "namespacedObjectReferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textStyleIdentifierForNamespacedTextStyleIdentifier:component:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if (v19)
  {
    namespacedObjectFactory = self->_namespacedObjectFactory;
    objc_msgSend(v12, "identifier");
    v21 = objc_claimAutoreleasedReturnValue();

    -[SXNamespacedObjectFactory createNamespacedReferenceForTextStyle:component:DOM:](namespacedObjectFactory, "createNamespacedReferenceForTextStyle:component:DOM:", v21, v15, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    v17 = (void *)v21;
  }
  else
  {
    objc_msgSend(v12, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v22)
  {
    objc_msgSend(v27, "textStyles");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedTextStyleForegroundColors:context:](self, "invertedTextStyleForegroundColors:context:", v24, v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v27, "textStyles");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v22);

    }
  }

}

- (id)invertedDocumentStyle:(id)a3 context:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  SXDocumentStyle *v20;
  void *v21;
  SXDocumentStyle *v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "JSONRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x24BDBD1B8];
  v10 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v6, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("backgroundColor"));

  objc_msgSend(v6, "topBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("topBackgroundColor"));

  objc_msgSend(v6, "topBackgroundGradient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v6, "topBackgroundGradient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedLinearGradient:](self, "invertedLinearGradient:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("topBackgroundGradient"));

  }
  v20 = [SXDocumentStyle alloc];
  objc_msgSend(v7, "specVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[SXJSONObject initWithJSONObject:andVersion:](v20, "initWithJSONObject:andVersion:", v10, v21);
  return v22;
}

- (id)invertedComponentStyle:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SXComponentStyle *v26;
  void *v27;
  SXComponentStyle *v28;

  v6 = a3;
  if (v6)
  {
    v7 = a4;
    objc_msgSend(v6, "JSONRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v6, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("backgroundColor"));

    }
    objc_msgSend(v6, "fill");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "fill");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedGradientFill:](self, "invertedGradientFill:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("fill"));

    }
    objc_msgSend(v6, "shadow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "shadow");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedComponentShadow:](self, "invertedComponentShadow:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("shadow"));

    }
    objc_msgSend(v6, "border");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "border");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedBorder:](self, "invertedBorder:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("border"));

    }
    objc_msgSend(v6, "tableStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v6, "tableStyle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedDataTableStyle:](self, "invertedDataTableStyle:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("tableStyle"));

    }
    v26 = [SXComponentStyle alloc];
    objc_msgSend(v7, "specVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = -[SXJSONObject initWithJSONObject:andVersion:](v26, "initWithJSONObject:andVersion:", v9, v27);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)invertedComponentTextStyleBackgroundColors:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SXComponentTextStyle *v17;
  void *v18;
  SXComponentTextStyle *v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "JSONRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v6, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("backgroundColor"));

    }
    objc_msgSend(v6, "linkStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "linkStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextStyleBackgroundColors:context:](self, "invertedTextStyleBackgroundColors:context:", v14, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "JSONRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("linkStyle"));

    }
    v17 = [SXComponentTextStyle alloc];
    objc_msgSend(v7, "specVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SXJSONObject initWithJSONObject:andVersion:](v17, "initWithJSONObject:andVersion:", v9, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)invertedComponentTextStyleForegroundColors:(id)a3 context:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SXComponentTextStyle *v32;
  void *v33;
  SXComponentTextStyle *v34;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "JSONRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v6, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "textColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("textColor"));

    }
    objc_msgSend(v6, "stroke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "stroke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextStroke:](self, "invertedTextStroke:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("stroke"));

    }
    objc_msgSend(v6, "textShadow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "textShadow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextStroke:](self, "invertedTextStroke:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("textShadow"));

    }
    objc_msgSend(v6, "dropCapStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v6, "dropCapStyle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedDropCapStyle:](self, "invertedDropCapStyle:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("dropCapStyle"));

    }
    objc_msgSend(v6, "underline");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v6, "underline");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextDecoration:](self, "invertedTextDecoration:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("underline"));

    }
    objc_msgSend(v6, "strikethrough");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v6, "strikethrough");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextDecoration:](self, "invertedTextDecoration:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("strikethrough"));

    }
    objc_msgSend(v6, "linkStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v6, "linkStyle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextStyleForegroundColors:context:](self, "invertedTextStyleForegroundColors:context:", v29, v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "JSONRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, CFSTR("linkStyle"));

    }
    v32 = [SXComponentTextStyle alloc];
    objc_msgSend(v7, "specVersion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SXJSONObject initWithJSONObject:andVersion:](v32, "initWithJSONObject:andVersion:", v9, v33);

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)invertedTextStyleBackgroundColors:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SXTextStyle *v13;
  void *v14;
  SXTextStyle *v15;

  v6 = a3;
  if (v6)
  {
    v7 = a4;
    objc_msgSend(v6, "JSONRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v6, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("backgroundColor"));

    }
    v13 = [SXTextStyle alloc];
    objc_msgSend(v7, "specVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[SXJSONObject initWithJSONObject:andVersion:](v13, "initWithJSONObject:andVersion:", v9, v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)invertedTextStyleForegroundColors:(id)a3 context:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SXTextStyle *v25;
  void *v26;
  SXTextStyle *v27;

  v6 = a3;
  if (v6)
  {
    v7 = a4;
    objc_msgSend(v6, "JSONRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v6, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "textColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("textColor"));

    }
    objc_msgSend(v6, "stroke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "stroke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextStroke:](self, "invertedTextStroke:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("stroke"));

    }
    objc_msgSend(v6, "textShadow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "textShadow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextStroke:](self, "invertedTextStroke:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("textShadow"));

    }
    objc_msgSend(v6, "underline");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v6, "underline");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextDecoration:](self, "invertedTextDecoration:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("underline"));

    }
    objc_msgSend(v6, "strikethrough");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v6, "strikethrough");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDarkModeModifier invertedTextDecoration:](self, "invertedTextDecoration:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("strikethrough"));

    }
    v25 = [SXTextStyle alloc];
    objc_msgSend(v7, "specVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = -[SXJSONObject initWithJSONObject:andVersion:](v25, "initWithJSONObject:andVersion:", v9, v26);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)invertedTextStroke:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("color"));

  }
  return v6;
}

- (id)invertedTextShadow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("color"));

  return v6;
}

- (id)invertedDropCapStyle:(id)a3
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

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("textColor"));

  }
  objc_msgSend(v4, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("backgroundColor"));

  }
  return v6;
}

- (id)invertedTextDecoration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("color"));

  }
  return v6;
}

- (id)invertedGradientFill:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "colorStops");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v21 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v4;
    objc_msgSend(v4, "colorStops");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "JSONRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          objc_msgSend(v14, "color");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v14, "color");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v18, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("color"));

          }
          objc_msgSend(v8, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    v6 = v21;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v8, CFSTR("colorStops"));

    v4 = v22;
  }

  return v6;
}

- (id)invertedLinearGradient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "colorStops");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v21 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v4;
    objc_msgSend(v4, "colorStops");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "JSONRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          objc_msgSend(v14, "color");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v14, "color");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v18, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("color"));

          }
          objc_msgSend(v8, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    v6 = v21;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v8, CFSTR("colorStops"));

    v4 = v22;
  }

  return v6;
}

- (id)invertedComponentShadow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("color"));

  return v6;
}

- (id)invertedBorder:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "all");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "all");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedStrokeStyle:](self, "invertedStrokeStyle:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("all"));

  }
  objc_msgSend(v4, "top");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "top");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedStrokeStyle:](self, "invertedStrokeStyle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("top"));

  }
  objc_msgSend(v4, "right");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "right");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedStrokeStyle:](self, "invertedStrokeStyle:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("right"));

  }
  objc_msgSend(v4, "bottom");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "bottom");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedStrokeStyle:](self, "invertedStrokeStyle:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("bottom"));

  }
  objc_msgSend(v4, "left");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "left");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedStrokeStyle:](self, "invertedStrokeStyle:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("left"));

  }
  return v6;
}

- (id)invertedStrokeStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("color"));

  return v6;
}

- (id)invertedComponent:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  SXLineComponent *v9;
  SXLineComponent *v10;
  SXLineComponent *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SXLineComponent *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = (SXLineComponent *)v6;
  v10 = v9;
  v11 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    -[SXJSONObject JSONRepresentation](v9, "JSONRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    -[SXLineComponent stroke](v10, "stroke");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXDarkModeModifier invertedStrokeStyle:](self, "invertedStrokeStyle:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("stroke"));

    v16 = [SXLineComponent alloc];
    objc_msgSend(v7, "specVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SXJSONObject initWithJSONObject:andVersion:](v16, "initWithJSONObject:andVersion:", v13, v17);

  }
  return v11;
}

- (id)invertedDataTableStyle:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "headerRows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "headerRows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableRowStyle:](self, "invertedDataTableRowStyle:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("headerRows"));

  }
  objc_msgSend(v4, "headerColumns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "headerColumns");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableColumnStyle:](self, "invertedDataTableColumnStyle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("headerColumns"));

  }
  objc_msgSend(v4, "headerCells");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "headerCells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableCellStyle:](self, "invertedDataTableCellStyle:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("headerCells"));

  }
  objc_msgSend(v4, "rows");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "rows");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableRowStyle:](self, "invertedDataTableRowStyle:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("rows"));

  }
  objc_msgSend(v4, "columns");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "columns");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableColumnStyle:](self, "invertedDataTableColumnStyle:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("columns"));

  }
  objc_msgSend(v4, "cells");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "cells");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableCellStyle:](self, "invertedDataTableCellStyle:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("cells"));

  }
  return v6;
}

- (id)invertedDataTableRowStyle:(id)a3
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
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("backgroundColor"));

  }
  objc_msgSend(v4, "divider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "divider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableBorder:](self, "invertedDataTableBorder:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("divider"));

  }
  objc_msgSend(v4, "conditional");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "conditional", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          -[SXDarkModeModifier invertedDataTableRowStyle:](self, "invertedDataTableRowStyle:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("conditional"));
  }

  return v6;
}

- (id)invertedDataTableColumnStyle:(id)a3
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
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("backgroundColor"));

  }
  objc_msgSend(v4, "divider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "divider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableBorder:](self, "invertedDataTableBorder:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("divider"));

  }
  objc_msgSend(v4, "conditional");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "conditional", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          -[SXDarkModeModifier invertedDataTableColumnStyle:](self, "invertedDataTableColumnStyle:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("conditional"));
  }

  return v6;
}

- (id)invertedDataTableCellStyle:(id)a3
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
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("backgroundColor"));

  }
  objc_msgSend(v4, "border");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "border");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableBorderSides:](self, "invertedDataTableBorderSides:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("border"));

  }
  objc_msgSend(v4, "conditional");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "conditional", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          -[SXDarkModeModifier invertedDataTableCellStyle:](self, "invertedDataTableCellStyle:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("conditional"));
  }

  return v6;
}

- (id)invertedDataTableBorder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDarkModeModifier invertColor:defaultColor:](self, "invertColor:defaultColor:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("color"));

  return v6;
}

- (id)invertedDataTableBorderSides:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "JSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "top");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "top");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableBorder:](self, "invertedDataTableBorder:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("top"));

  }
  objc_msgSend(v4, "right");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "right");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableBorder:](self, "invertedDataTableBorder:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("right"));

  }
  objc_msgSend(v4, "bottom");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "bottom");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableBorder:](self, "invertedDataTableBorder:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("bottom"));

  }
  objc_msgSend(v4, "left");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "left");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDarkModeModifier invertedDataTableBorder:](self, "invertedDataTableBorder:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("left"));

  }
  return v6;
}

- (id)invertColor:(id)a3 defaultColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[SXDarkModeConfiguration colors](self->_configuration, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SXDarkModeConfiguration colors](self->_configuration, "colors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hex");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_16;
    }
    -[SXDarkModeConfiguration saturationThreshold](self->_configuration, "saturationThreshold");
    v14 = v13;
    v15 = -[SXDarkModeConfiguration inversionBehavior](self->_configuration, "inversionBehavior");
    if (v15 == 2)
    {
      v20 = 0.0;
      objc_msgSend(v6, "getHue:saturation:lightness:alpha:", 0, &v20, 0, 0);
      v16 = v20;
      if (v20 <= v14)
      {
        objc_msgSend(v6, "invertedLightness", v20);
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v18 = (void *)v17;

        v6 = v18;
      }
    }
    else
    {
      if (v15 != 1)
      {
        if (v15)
          goto LABEL_15;
        v20 = 0.0;
        objc_msgSend(v6, "getHue:saturation:brightness:alpha:", 0, &v20, 0, 0);
        v16 = v20;
        if (v20 > v14)
          goto LABEL_15;
        objc_msgSend(v6, "invertedRGB", v20);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      v20 = 0.0;
      objc_msgSend(v6, "getHue:saturation:brightness:alpha:", 0, &v20, 0, 0);
      v16 = v20;
      if (v20 <= v14)
      {
        objc_msgSend(v6, "invertedBrightness", v20);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
LABEL_15:
    objc_msgSend(v6, "hex", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v7, "hex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v12;
}

- (SXDarkModePolicyHandler)policyHandler
{
  return self->_policyHandler;
}

- (SXDarkModeConfiguration)configuration
{
  return self->_configuration;
}

- (SXNamespacedObjectFactory)namespacedObjectFactory
{
  return self->_namespacedObjectFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespacedObjectFactory, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_policyHandler, 0);
}

@end
