@implementation SXDOMAnalyzerModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(v5, "components");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SXDOMAnalyzerModifier analyzeComponents:parent:DOM:](self, "analyzeComponents:parent:DOM:", v6, 0, v5);

}

- (void)analyzeComponents:(id)a3 parent:(id)a4 DOM:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v25 = a5;
  objc_msgSend(v25, "analysis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v7;
  v27 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(v10);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addComponent:type:role:", v13, v14, objc_msgSend(v12, "role"));

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v12, "classification");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "defaultComponentStyleIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v9, "addComponentStyle:component:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), v13);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v18);
        }

        objc_msgSend(v12, "style");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v12, "style");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addComponentStyle:component:", v22, v13);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SXDOMAnalyzerModifier analyzeTextComponent:analysis:](self, "analyzeTextComponent:analysis:", v12, v9);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SXDOMAnalyzerModifier analyzeScalableImageComponent:analysis:](self, "analyzeScalableImageComponent:analysis:", v12, v9);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[SXDOMAnalyzerModifier analyzeButtonComponent:analysis:](self, "analyzeButtonComponent:analysis:", v12, v9);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[SXDOMAnalyzerModifier analyzeGalleryComponent:analysis:](self, "analyzeGalleryComponent:analysis:", v12, v9);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  -[SXDOMAnalyzerModifier analyzeDataTableComponent:DOM:](self, "analyzeDataTableComponent:DOM:", v12, v25);
              }
            }
          }
        }
        objc_msgSend(v10, "componentsForContainerComponentWithIdentifier:", v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          -[SXDOMAnalyzerModifier analyzeComponents:parent:DOM:](self, "analyzeComponents:parent:DOM:", v23, v12, v25);
        if (v8)
        {
          objc_msgSend(v8, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addComponent:parent:", v13, v24);

        }
      }
      v27 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v27);
  }

}

- (void)analyzeTextComponent:(id)a3 analysis:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "classification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultTextStyleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v7, "addComponentTextStyle:component:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14++), v8);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  objc_msgSend(v6, "textStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "textStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addComponentTextStyle:component:", v16, v8);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "inlineTextStyles", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[SXDOMAnalyzerModifier analyzeInlineTextStyle:component:analysis:](self, "analyzeInlineTextStyle:component:analysis:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), v6, v7);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v19);
  }

}

- (void)analyzeButtonComponent:(id)a3 analysis:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "classification", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultTextStyleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v6, "addComponentTextStyle:component:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  objc_msgSend(v5, "textStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addComponentTextStyle:component:", v14, v7);

}

- (void)analyzeScalableImageComponent:(id)a3 analysis:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "captionComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v9, "captionComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDOMAnalyzerModifier analyzeFormattedText:component:analysis:](self, "analyzeFormattedText:component:analysis:", v8, v9, v6);

  }
}

- (void)analyzeGalleryComponent:(id)a3 analysis:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v6, "items", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "captionComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXDOMAnalyzerModifier analyzeFormattedText:component:analysis:](self, "analyzeFormattedText:component:analysis:", v13, v6, v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)analyzeDataTableComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "style");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "tableStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analysis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDOMAnalyzerModifier analyzeDataTableStyle:component:analysis:](self, "analyzeDataTableStyle:component:analysis:", v10, v7, v11);
}

- (void)analyzeFormattedText:(id)a3 component:(id)a4 analysis:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v9, "classification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultTextStyleIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v10, "addComponentTextStyle:component:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v17++), v11);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v15);
  }

  objc_msgSend(v8, "textStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v8, "textStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addComponentTextStyle:component:", v19, v11);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v8, "inlineTextStyles", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[SXDOMAnalyzerModifier analyzeInlineTextStyle:component:analysis:](self, "analyzeInlineTextStyle:component:analysis:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v24++), v9, v10);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v22);
  }

}

- (void)analyzeInlineTextStyle:(id)a3 component:(id)a4 analysis:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "textStyle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addTextStyle:component:", v10, v9);
}

- (void)analyzeDataTableStyle:(id)a3 component:(id)a4 analysis:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v9, "classification", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultTextStyleIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
        objc_msgSend(v9, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addComponentTextStyle:component:", v17, v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  objc_msgSend(v8, "cells");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOMAnalyzerModifier analyzeDataTableCellStyle:component:analysis:](self, "analyzeDataTableCellStyle:component:analysis:", v19, v9, v10);

  objc_msgSend(v8, "headerCells");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDOMAnalyzerModifier analyzeDataTableCellStyle:component:analysis:](self, "analyzeDataTableCellStyle:component:analysis:", v20, v9, v10);

}

- (void)analyzeDataTableCellStyle:(id)a3 component:(id)a4 analysis:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "textStyles", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addComponentTextStyle:component:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

@end
