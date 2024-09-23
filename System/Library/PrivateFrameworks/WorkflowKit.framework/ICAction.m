@implementation ICAction

- (ICAction)initWithDefinition:(id)a3 app:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSString *v19;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  ICAction *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  NSString *v31;
  objc_class *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSDictionary *definition;
  uint64_t v37;
  NSArray *inputMapping;
  uint64_t v39;
  NSArray *outputMapping;
  void *v42;
  id obj;
  NSString *v44;
  id v45;
  void *v46;
  ICAction *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("ActionClass"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && !NSClassFromString(v8))
  {
    v23 = 0;
  }
  else
  {
    obj = a4;
    v44 = v9;
    v45 = v7;
    objc_msgSend(v6, "objectForKey:", CFSTR("InputMapping"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0x1E0C99000uLL;
    v47 = self;
    v48 = v6;
    v46 = v10;
    if (objc_msgSend(v10, "count"))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v54;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v54 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKey:", CFSTR("ContentMappingClass"));
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            v20 = NSClassFromString(v19);
            if (!v20)
              v20 = (objc_class *)objc_opt_class();

            v21 = objc_msgSend([v20 alloc], "initWithDefinition:", v18);
            if (!v21)
            {
              v23 = 0;
              self = v47;
              v6 = v48;
              v10 = v46;
              goto LABEL_36;
            }
            v22 = (void *)v21;
            objc_msgSend(v12, "addObject:", v21);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          if (v15)
            continue;
          break;
        }
      }

      self = v47;
      v6 = v48;
      v10 = v46;
      v11 = 0x1E0C99000;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("OutputMapping"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
    {
      v13 = (id)objc_msgSend(objc_alloc(*(Class *)(v11 + 3560)), "initWithCapacity:", objc_msgSend(v24, "count"));
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v42 = v24;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v50;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v50 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
            objc_msgSend(v30, "objectForKey:", CFSTR("ContentMappingClass"));
            v31 = (NSString *)objc_claimAutoreleasedReturnValue();
            v32 = NSClassFromString(v31);
            if (!v32)
              v32 = (objc_class *)objc_opt_class();

            v33 = objc_msgSend([v32 alloc], "initWithDefinition:", v30);
            if (!v33)
            {

              v23 = 0;
              self = v47;
              v6 = v48;
              v10 = v46;
              v24 = v42;
              goto LABEL_35;
            }
            v34 = (void *)v33;
            objc_msgSend(v13, "addObject:", v33);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v27)
            continue;
          break;
        }
      }

      self = v47;
      v6 = v48;
      v10 = v46;
      v24 = v42;
    }
    else
    {
      v13 = 0;
    }
    v23 = -[ICAction init](self, "init");
    if (v23)
    {
      v35 = objc_msgSend(v6, "copy");
      definition = v23->_definition;
      v23->_definition = (NSDictionary *)v35;

      objc_storeStrong((id *)&v23->_app, obj);
      v37 = objc_msgSend(v12, "copy");
      inputMapping = v23->_inputMapping;
      v23->_inputMapping = (NSArray *)v37;

      v39 = objc_msgSend(v13, "copy");
      outputMapping = v23->_outputMapping;
      v23->_outputMapping = (NSArray *)v39;

      self = v23;
      v23 = self;
    }
    else
    {
      self = 0;
    }
LABEL_35:

LABEL_36:
    v9 = v44;
    v7 = v45;
  }

  return v23;
}

- (NSArray)capabilities
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Capabilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WFActionParameterSummary)parameterSummaryDefinition
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ParameterSummary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFActionParameterSummary *)v3;
}

- (NSString)inputParameterSourceKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("InputMapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectMatchingKey:value:", CFSTR("SourceType"), CFSTR("Input"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SourceKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICAction definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[ICAction app](self, "app");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (NSString)category
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Category"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)localizedSubcategoryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Subcategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_NSLocalizedStringResource)keywords
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ActionKeywords"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_NSLocalizedStringResource *)v3;
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CreationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)lastModifiedDate
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("LastModifiedDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isDiscontinued
{
  void *v2;
  void *v3;
  char v4;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Discontinued"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isDiscoverable
{
  void *v2;
  void *v3;
  char v4;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Discoverable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (WFActionDescriptionDefinition)descriptionDefinition
{
  void *v2;
  WFActionDescriptionDefinition *v3;
  WFActionDescriptionDefinition *v4;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Description"));
  v3 = (WFActionDescriptionDefinition *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = [WFActionDescriptionDefinition alloc];
    v3 = -[WFActionDescriptionDefinition initWithDictionary:](v4, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  }
  return v3;
}

- (BOOL)inputRequired
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICAction inputMapping](self, "inputMapping", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "sourceType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Input"));

        if (v10)
          v5 |= objc_msgSend(v8, "inputRequired");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)inputsMultipleItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICAction inputMapping](self, "inputMapping", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "sourceType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Input"));

        if (v10)
          v5 |= objc_msgSend(v8, "supportsMultipleItems");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)outputsMultipleItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICAction outputMapping](self, "outputMapping", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "sourceType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Output"));

        if (v10)
          v5 |= objc_msgSend(v8, "supportsMultipleItems");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)neverSuggested
{
  void *v2;
  void *v3;
  char v4;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SuggestedNever"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSArray)inputContentClasses
{
  NSArray *inputContentClasses;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  inputContentClasses = self->_inputContentClasses;
  if (!inputContentClasses)
  {
    v4 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[ICAction inputMapping](self, "inputMapping", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "sourceType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Input"));

          if (v12)
          {
            objc_msgSend(v10, "contentItemClasses");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "unionOrderedSet:", v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "array");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = self->_inputContentClasses;
    self->_inputContentClasses = v14;

    inputContentClasses = self->_inputContentClasses;
  }
  return inputContentClasses;
}

- (NSArray)outputContentClasses
{
  NSArray *outputContentClasses;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  outputContentClasses = self->_outputContentClasses;
  if (!outputContentClasses)
  {
    v4 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[ICAction outputMapping](self, "outputMapping", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "destinationType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Output"));

          if (v12)
          {
            objc_msgSend(v10, "contentItemClasses");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "unionOrderedSet:", v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "array");
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = self->_outputContentClasses;
    self->_outputContentClasses = v14;

    outputContentClasses = self->_outputContentClasses;
  }
  return outputContentClasses;
}

- (BOOL)skipItemClassesSupportingInput
{
  void *v2;
  void *v3;
  char v4;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SkipItemClassesSupportingInput"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)createsWFAction
{
  void *v2;
  void *v3;
  char v4;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CreatesWFAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (NSString)wfActionClassName
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFActionClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)requiredResourceNames
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RequiredResourceNames"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  ICAction *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (ICAction *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICAction definition](self, "definition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAction definition](v4, "definition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[ICAction app](self, "app");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAction app](v4, "app");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)ICAction;
  -[ICAction description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionLocalizationContext defaultContext](WFActionLocalizationContext, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAction localizedNameWithContext:](self, "localizedNameWithContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAction app](self, "app");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ from %@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)processInput:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id *v22;
  id *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[5];
  NSObject *v42;
  id v43;
  _QWORD v44[5];
  NSObject *v45;
  _QWORD v46[2];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  id v52;
  _QWORD aBlock[4];
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[3];
  char v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v33 = a4;
  v31 = a5;
  v8 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v62 = 0;
  objc_msgSend(v33, "objectForKey:", CFSTR("DisableCallback"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v62 = v13;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__37005;
  v59[4] = __Block_byref_object_dispose__37006;
  v60 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke;
  aBlock[3] = &unk_1E7AF27D0;
  v28 = v11;
  v54 = v28;
  v57 = v59;
  v30 = v9;
  v55 = v30;
  v29 = v10;
  v56 = v29;
  v58 = v61;
  v14 = _Block_copy(aBlock);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__37005;
  v51[4] = __Block_byref_object_dispose__37006;
  v52 = 0;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[ICAction inputMapping](self, "inputMapping");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v19, "destinationType", v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("Clipboard"));
        dispatch_group_enter(v8);
        if (v21)
        {
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_2;
          v44[3] = &unk_1E7AF2828;
          v46[0] = v14;
          v44[4] = v19;
          v45 = v8;
          v46[1] = v51;
          objc_msgSend(v19, "getContentCollection:withInput:parameters:", v44, v32, v33);
          v22 = (id *)&v45;
          v23 = (id *)v46;
        }
        else
        {
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_5;
          v41[3] = &unk_1E7AF2850;
          v43 = v14;
          v41[4] = v19;
          v42 = v8;
          objc_msgSend(v19, "getStringRepresentation:withInput:parameters:", v41, v32, v33);
          v22 = (id *)&v42;
          v23 = &v43;
        }

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    }
    while (v16);
  }

  dispatch_get_global_queue(0, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_6;
  block[3] = &unk_1E7AF2878;
  v37 = v31;
  v38 = v51;
  v35 = v30;
  v36 = v29;
  v39 = v59;
  v40 = v61;
  v25 = v29;
  v26 = v30;
  v27 = v31;
  dispatch_group_notify(v8, v24, block);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v59, 8);

  _Block_object_dispose(v61, 8);
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (ICApp)app
{
  return self->_app;
}

- (NSArray)inputMapping
{
  return self->_inputMapping;
}

- (NSArray)outputMapping
{
  return self->_outputMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMapping, 0);
  objc_storeStrong((id *)&self->_inputMapping, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_outputContentClasses, 0);
  objc_storeStrong((id *)&self->_inputContentClasses, 0);
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a2;
  v9 = a3;
  v10 = a5;
  v11 = *(void **)(a1 + 32);
  v12 = a4;
  objc_msgSend(v11, "lock");
  if (v10)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a5);
  objc_msgSend(v9, "valueMapping");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v12);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v12;
  v17 = v16;

  objc_msgSend(v9, "destinationType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("URLSubstitution")))
  {
    if ((objc_msgSend(v9, "skipURLEncoding") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v20, "removeCharactersInString:", CFSTR("?&="));
      -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v17, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v17 = (__CFString *)v21;
    }
    v22 = v32;
    v23 = *(void **)(a1 + 40);
    if (v17)
      v24 = v17;
    else
      v24 = &stru_1E7AFA810;
LABEL_12:
    objc_msgSend(v23, "setObject:forKey:", v24, v22);
    goto LABEL_27;
  }
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("URLQueryValue")))
  {
    v25 = -[__CFString length](v17, "length");
    if (v13)
      v26 = v15 == 0;
    else
      v26 = 0;
    v27 = !v26;
    if (v25 && v27)
    {
      v28 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByAddingPercentEncodingWithAllowedCharacters:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v17, v30);

      goto LABEL_26;
    }
  }
  else
  {
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("URLQueryFlag")))
    {
      if (!-[__CFString BOOLValue](v17, "BOOLValue"))
        goto LABEL_27;
      v31 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKey:", v29, v32);
LABEL_26:

      goto LABEL_27;
    }
    if (!objc_msgSend(v18, "isEqualToString:", CFSTR("DisableCallback")))
    {
      if (!objc_msgSend(v18, "isEqualToString:", CFSTR("ExtensionItemUserInfo")))
        goto LABEL_27;
      v23 = *(void **)(a1 + 48);
      if (v17)
        v24 = v17;
      else
        v24 = &stru_1E7AFA810;
      v22 = v32;
      goto LABEL_12;
    }
    if (-[__CFString BOOLValue](v17, "BOOLValue"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
LABEL_27:
  objc_msgSend(*(id *)(a1 + 32), "unlock");

}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "destinationKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    if (objc_msgSend(v12, "inputRequired"))
      v13 = v9;
    else
      v13 = 0;
    (*(void (**)(uint64_t, void *, void *, _QWORD, id))(v10 + 16))(v10, v11, v12, 0, v13);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    if (!v7)
      v7 = (id)objc_opt_new();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_3;
    block[3] = &unk_1E7AF8A80;
    v17 = *(_QWORD *)(a1 + 56);
    v7 = v7;
    v15 = v7;
    v16 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "destinationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, id, id))(v5 + 16))(v5, v9, *(_QWORD *)(a1 + 32), v8, v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_7;
  aBlock[3] = &unk_1E7AF9520;
  aBlock[4] = *(_QWORD *)(a1 + 56);
  v2 = _Block_copy(aBlock);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(_QWORD);
  _QWORD aBlock[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 8) + 40))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_8;
    aBlock[3] = &unk_1E7AF9520;
    aBlock[4] = v1;
    v2 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v2[2](v2);
    else
      dispatch_sync(MEMORY[0x1E0C80D38], v2);

  }
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[objc_class generalPasteboard](getUIPasteboardClass_37009(), "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  getUIPasteboardOptionLocalOnly();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItems:options:", v3, v5);

}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)getUIPasteboardClass_37009(), "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v2, "items");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  getUIPasteboardOptionLocalOnly();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_4;
  v10[3] = &unk_1E7AF2800;
  v9 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v9, "copyToPasteboard:options:completionHandler:", v3, v8, v10);

}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
