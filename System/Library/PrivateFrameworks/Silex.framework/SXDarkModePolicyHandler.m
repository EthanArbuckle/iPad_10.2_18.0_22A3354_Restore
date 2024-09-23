@implementation SXDarkModePolicyHandler

- (SXDarkModePolicyHandler)initWithDocumentProvider:(id)a3 darkModeConfiguration:(id)a4
{
  id v7;
  id v8;
  SXDarkModePolicyHandler *v9;
  SXDarkModePolicyHandler *v10;
  uint64_t v11;
  NSMutableArray *exceptions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXDarkModePolicyHandler;
  v9 = -[SXDarkModePolicyHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_darkModeConfiguration, a4);
    objc_storeStrong((id *)&v10->_documentProvider, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    exceptions = v10->_exceptions;
    v10->_exceptions = (NSMutableArray *)v11;

  }
  return v10;
}

- (void)addPolicyException:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_exceptions, "addObject:");
}

- (BOOL)shouldApplyDarkModeToDOM:(id)a3 layoutOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "documentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v6, "documentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_luminance");
    v14 = v13;

    if (v14 <= 0.5)
    {
LABEL_12:
      v15 = 0;
      goto LABEL_13;
    }
  }
  else
  {

  }
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v7, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceStyle");

    if (v17 != 2
      || !-[SXDarkModeConfiguration isAutoDarkModeEnabled](self->_darkModeConfiguration, "isAutoDarkModeEnabled"))
    {
      goto LABEL_12;
    }
    -[SXDocumentProviding document](self->_documentProvider, "document");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorScheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && !objc_msgSend(v19, "automaticDarkModeEnabled"))
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v6, "analysis");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "conditionalObjectAnalysis");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "documentStyleConditionTypes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", SXConditionPreferredColorScheme);

      v15 = v23 ^ 1;
    }

  }
LABEL_13:

  return v15;
}

- (BOOL)shouldApplyDarkModeToDocumentStyle:(id)a3 DOM:(id)a4 layoutOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (UIAccessibilityIsInvertColorsEnabled()
    || (objc_msgSend(v10, "traitCollection"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "userInterfaceStyle"),
        v11,
        v12 == 2))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = self->_exceptions;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && !objc_msgSend(v18, "shouldApplyDarkModeToDocumentStyle:DOM:", v8, v9, (_QWORD)v23))
          {
            LOBYTE(v21) = 0;
            goto LABEL_14;
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(v9, "analysis");
    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray conditionalObjectAnalysis](v13, "conditionalObjectAnalysis");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "documentStyleConditionTypes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", SXConditionPreferredColorScheme) ^ 1;

LABEL_14:
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (BOOL)shouldApplyDarkModeToComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_exceptions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v13, "shouldApplyDarkModeToComponent:DOM:", v6, v7, (_QWORD)v19))
        {
          LOBYTE(v17) = 0;
          goto LABEL_12;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }

  objc_msgSend(v7, "analysis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conditionalObjectAnalysis");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "conditionTypesUsedByComponent:", v16);
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  v17 = -[NSMutableArray containsObject:](v8, "containsObject:", SXConditionPreferredColorScheme) ^ 1;
LABEL_12:

  return v17;
}

- (BOOL)shouldApplyDarkModeToComponentStylesForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_exceptions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v13, "shouldApplyDarkModeToComponentStylesForComponent:DOM:", v6, v7, (_QWORD)v16))
        {
          v14 = 0;
          goto LABEL_12;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)shouldApplyDarkModeToComponentStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_exceptions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToComponentStyle:component:DOM:", v8, v9, v10, (_QWORD)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(v10, "analysis");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conditionalObjectAnalysis");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conditionTypesUsedByComponentStyle:", v19);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  v20 = -[NSMutableArray containsObject:](v11, "containsObject:", SXConditionPreferredColorScheme) ^ 1;
LABEL_12:

  return v20;
}

- (BOOL)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_exceptions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v13, "shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:DOM:", v6, v7, (_QWORD)v16))
        {
          v14 = 0;
          goto LABEL_12;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)shouldApplyDarkModeToBackgroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_exceptions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToBackgroundColorsOfComponentTextStyle:component:DOM:", v8, v9, v10, (_QWORD)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(v10, "analysis");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conditionalObjectAnalysis");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conditionTypesUsedByComponentTextStyle:", v19);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  v20 = -[NSMutableArray containsObject:](v11, "containsObject:", SXConditionPreferredColorScheme) ^ 1;
LABEL_12:

  return v20;
}

- (BOOL)shouldApplyDarkModeToBackgroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_exceptions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToBackgroundColorsOfTextStyle:component:DOM:", v8, v9, v10, (_QWORD)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(v10, "analysis");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conditionalObjectAnalysis");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conditionTypesUsedByTextStyle:", v19);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  v20 = -[NSMutableArray containsObject:](v11, "containsObject:", SXConditionPreferredColorScheme) ^ 1;
LABEL_12:

  return v20;
}

- (BOOL)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_exceptions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v13, "shouldApplyDarkModeToTextStyleForegroundColorsForComponent:DOM:", v6, v7, (_QWORD)v16))
        {
          v14 = 0;
          goto LABEL_12;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)shouldApplyDarkModeToForegroundColorsOfComponentTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_exceptions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToForegroundColorsOfComponentTextStyle:component:DOM:", v8, v9, v10, (_QWORD)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(v10, "analysis");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conditionalObjectAnalysis");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conditionTypesUsedByComponentTextStyle:", v19);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  v20 = -[NSMutableArray containsObject:](v11, "containsObject:", SXConditionPreferredColorScheme) ^ 1;
LABEL_12:

  return v20;
}

- (BOOL)shouldApplyDarkModeToForegroundColorsOfTextStyle:(id)a3 component:(id)a4 DOM:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_exceptions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v16, "shouldApplyDarkModeToForegroundColorsOfTextStyle:component:DOM:", v8, v9, v10, (_QWORD)v22))
        {
          LOBYTE(v20) = 0;
          goto LABEL_12;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(v10, "analysis");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "conditionalObjectAnalysis");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conditionTypesUsedByTextStyle:", v19);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  v20 = -[NSMutableArray containsObject:](v11, "containsObject:", SXConditionPreferredColorScheme) ^ 1;
LABEL_12:

  return v20;
}

- (SXDarkModeConfiguration)darkModeConfiguration
{
  return self->_darkModeConfiguration;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (NSMutableArray)exceptions
{
  return self->_exceptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptions, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_darkModeConfiguration, 0);
}

@end
