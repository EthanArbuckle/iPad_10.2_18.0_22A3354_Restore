@implementation ICContentMapping

- (ICContentMapping)initWithDefinition:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSDictionary *v7;
  NSDictionary *definition;
  ICContentMapping *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("ContentMappingClass"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((!v5 || NSClassFromString(v5)) && (self = -[ICContentMapping init](self, "init")) != 0)
  {
    v7 = (NSDictionary *)objc_msgSend(v4, "copy");
    definition = self->_definition;
    self->_definition = v7;

    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)sourceType
{
  void *v2;
  void *v3;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SourceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)destinationType
{
  void *v2;
  void *v3;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DestinationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sourceKey
{
  void *v2;
  void *v3;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SourceKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)destinationKey
{
  void *v2;
  void *v3;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DestinationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)valueMapping
{
  void *v2;
  void *v3;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ValueMapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)skipURLEncoding
{
  void *v2;
  void *v3;
  char v4;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SkipURLEncoding"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (WFParameterDefinition)parameterUI
{
  void *v2;
  void *v3;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ParameterUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFParameterDefinition *)v3;
}

- (id)parameterDefault
{
  void *v2;
  void *v3;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ParameterDefault"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsMultipleItems
{
  void *v2;
  void *v3;
  char v4;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MultipleItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)inputRequired
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[ICContentMapping definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("InputRequired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[ICContentMapping sourceType](self, "sourceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("Input"));

  }
  return v5;
}

- (NSOrderedSet)contentItemClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  Class v13;
  void *v14;
  Class v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ICContentMapping definition](self, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ItemClasses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICContentMapping definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("ItemClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = NSClassFromString(*(NSString **)(*((_QWORD *)&v19 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v3, "addObject:", v13, (_QWORD)v19);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", objc_opt_class());
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    -[ICContentMapping definition](self, "definition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("ItemClass"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v15 = NSClassFromString((NSString *)v8);
    if (v15)
      objc_msgSend(v3, "addObject:", v15);
  }

  v16 = v3;
LABEL_16:
  v17 = v16;

  return (NSOrderedSet *)v17;
}

- (void)getContentCollection:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICContentMapping sourceType](self, "sourceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("Input")))
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("Parameter")))
      goto LABEL_20;
    -[ICContentMapping sourceKey](self, "sourceKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v14;
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v15;
LABEL_17:
      v12 = v18;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)MEMORY[0x1E0D13EA8];
      v26[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "collectionWithItems:", v20);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17)
      {
        objc_msgSend(v17, "contentCollection");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (!v15)
      {
        v12 = 0;
LABEL_18:

        if (v12)
          goto LABEL_19;
LABEL_20:
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
        goto LABEL_21;
      }
      v23 = (void *)MEMORY[0x1E0D13EA8];
      objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "collectionWithItems:", v24);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_18;
  }
  v12 = v9;
  if (!v12)
    goto LABEL_20;
LABEL_19:
  -[ICContentMapping contentItemClasses](self, "contentItemClasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generateCollectionByCoercingToItemClasses:completionHandler:", v22, v8);

LABEL_21:
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__ICContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E7AF0CF8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[ICContentMapping getContentCollection:withInput:parameters:](self, "getContentCollection:withInput:parameters:", v10, a4, a5);

}

- (NSDictionary)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
}

void __65__ICContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(v7, "numberOfItems") != 1)
    goto LABEL_6;
  objc_msgSend(v7, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "number");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "BOOLValue");

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
LABEL_6:
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__ICContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v17[3] = &unk_1E7AF43A8;
    v16 = *(id *)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v16;
    objc_msgSend(v7, "getStringRepresentation:", v17);

  }
}

void __65__ICContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v3 = a2;
  if (v3)
  {
    v15 = v3;
    objc_msgSend(*(id *)(a1 + 32), "definition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("ValuePrefix"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    WFEnforceClass(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "definition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ValueSuffix"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    WFEnforceClass(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "stringByAppendingString:", v15);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v12;
    }
    else
    {
      v13 = v15;
    }
    v16 = v13;
    if (v11)
    {
      objc_msgSend(v13, "stringByAppendingString:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

@end
