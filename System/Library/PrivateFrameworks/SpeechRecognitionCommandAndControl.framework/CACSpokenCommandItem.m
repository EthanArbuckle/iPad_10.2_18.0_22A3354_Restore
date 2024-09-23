@implementation CACSpokenCommandItem

+ (id)newCommandItemWithLocale:(id)a3 scope:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (__CFString *)a4;
  v6 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v8 = v5;
  else
    v8 = CFSTR("com.apple.speech.SystemWideScope");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v8, CFSTR("CustomScope"), *MEMORY[0x24BDBD270], CFSTR("Enabled"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueCustomCommandIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:properties:locale:", v10, v9, v6);

  objc_msgSend(v11, "setIsEdited:", 1);
  return v11;
}

- (CACSpokenCommandItem)initWithIdentifier:(id)a3 properties:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  CACSpokenCommandItem *v10;
  CACSpokenCommandItem *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *customDictionary;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CACSpokenCommandItem;
  v10 = -[CACSpokenCommandGroup initWithIdentifier:](&v15, sel_initWithIdentifier_, a3);
  v11 = v10;
  if (v10)
  {
    -[CACSpokenCommandItem setLocale:](v10, "setLocale:", v9);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    customDictionary = v11->_customDictionary;
    v11->_customDictionary = v12;

    -[CACSpokenCommandItem _reloadFromProperties:](v11, "_reloadFromProperties:", v8);
    v11->_isEdited = 0;
  }

  return v11;
}

- (CACSpokenCommandItem)initWithIdentifier:(id)a3
{
  return -[CACSpokenCommandItem initWithIdentifier:properties:locale:](self, "initWithIdentifier:properties:locale:", a3, 0, 0);
}

- (id)cloneWithoutCommands
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACSpokenCommandItem;
  -[CACSpokenCommandGroup cloneWithoutCommands](&v5, sel_cloneWithoutCommands);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", self->_locale);
  return v3;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isVisible
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  NSString *identifier;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "builtInCommandsTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CommandProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", self->super._identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  objc_msgSend(v5, "objectForKey:", CFSTR("VisibilityEvaluation"));
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ContextEvaluation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __33__CACSpokenCommandItem_isVisible__block_invoke;
  v23[3] = &unk_24F2ACDB0;
  v23[4] = &v24;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)v25[5], "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend((id)v25[5], "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[CACSpokenCommandManager doesEvaluatorKey:matchValue:](CACSpokenCommandManager, "doesEvaluatorKey:matchValue:", v11, v12);

        if (!v13)
        {
          CACLogAccessibility();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            identifier = self->super._identifier;
            *(_DWORD *)buf = 138412546;
            v31 = identifier;
            v32 = 2112;
            v33 = v11;
            _os_log_impl(&dword_229A40000, v15, OS_LOG_TYPE_INFO, "Hiding command %@ for failing evaluator %@", buf, 0x16u);
          }

          v14 = 0;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_13:

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __33__CACSpokenCommandItem_isVisible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  +[CACSpokenCommandManager hardwareEvaluatorKeys](CACSpokenCommandManager, "hardwareEvaluatorKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v14) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      if (v9)
      {
        v10 = v9;
        v11 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v10;
      }
      else
      {
        v12 = objc_opt_new();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v11 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v5, v14);
    }
  }
  else
  {

  }
}

- (BOOL)conflictsWithItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  CACSpokenCommandItem *v11;

  v4 = a3;
  if (-[CACSpokenCommandGroup isEnabled](self, "isEnabled") && objc_msgSend(v4, "isEnabled"))
  {
    -[CACSpokenCommandItem commandsArray](self, "commandsArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __42__CACSpokenCommandItem_conflictsWithItem___block_invoke;
    v9[3] = &unk_24F2ACDD8;
    v10 = v4;
    v11 = self;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

    v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __42__CACSpokenCommandItem_conflictsWithItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "commandsArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v8)
    goto LABEL_10;
  v9 = v8;
  v10 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      if (objc_msgSend(v12, "length"))
      {
        objc_msgSend(v12, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          *a4 = 1;
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "hasPrefix:", CFSTR("Custom.")) & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "hasPrefix:", CFSTR("Custom.")) & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 40), "customScope");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.speech.SystemWideScope")))
              {
                objc_msgSend(*(id *)(a1 + 40), "customScope");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  objc_msgSend(*(id *)(a1 + 32), "customScope");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.speech.SystemWideScope")) & 1) != 0)
                  {
                    v22 = 0;
                  }
                  else
                  {
                    objc_msgSend(*(id *)(a1 + 32), "customScope");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v23)
                    {
                      objc_msgSend(*(id *)(a1 + 40), "customScope");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(a1 + 32), "customScope");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v22 = objc_msgSend(v25, "isEqualToString:", v24) ^ 1;

                    }
                    else
                    {
                      v22 = 0;
                    }

                  }
                }
                else
                {
                  v22 = 0;
                }

                v15 = v22 ^ 1u;
                goto LABEL_17;
              }

            }
          }

          v15 = 1;
          goto LABEL_17;
        }
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
      continue;
    break;
  }
LABEL_10:
  v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)evaluateCommandPredicate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CACSpokenCommandItem commandsArray](self, "commandsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(v4, "evaluateWithObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9)) & 1) != 0)
        goto LABEL_18;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CACSpokenCommandItem searchAlternates](self, "searchAlternates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
LABEL_11:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(v4, "evaluateWithObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12)) & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v10)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v10) = 1;
  }
LABEL_19:

  return v10;
}

- (void)setIsEnabled:(BOOL)a3
{
  objc_super v3;

  self->_isEdited = 1;
  v3.receiver = self;
  v3.super_class = (Class)CACSpokenCommandItem;
  -[CACSpokenCommandGroup setIsEnabled:](&v3, sel_setIsEnabled_, a3);
}

- (void)setIsConfirmationRequired:(BOOL)a3
{
  objc_super v3;

  self->_isEdited = 1;
  v3.receiver = self;
  v3.super_class = (Class)CACSpokenCommandItem;
  -[CACSpokenCommandGroup setIsConfirmationRequired:](&v3, sel_setIsConfirmationRequired_, a3);
}

- (void)setCustomScope:(id)a3
{
  self->_isEdited = 1;
  -[NSMutableDictionary setValue:forKey:](self->_customDictionary, "setValue:forKey:", a3, CFSTR("CustomScope"));
}

- (NSString)customScope
{
  return (NSString *)-[NSMutableDictionary valueForKey:](self->_customDictionary, "valueForKey:", CFSTR("CustomScope"));
}

- (void)setCustomAppName:(id)a3
{
  self->_isEdited = 1;
  -[NSMutableDictionary setValue:forKey:](self->_customDictionary, "setValue:forKey:", a3, CFSTR("CustomAppName"));
}

- (NSString)customAppName
{
  return (NSString *)-[NSMutableDictionary valueForKey:](self->_customDictionary, "valueForKey:", CFSTR("CustomAppName"));
}

- (void)setCustomGesture:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  self->_isEdited = 1;
  if (v4)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (!v5)
    {
      CACLogPreferences();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CACSpokenCommandItem setCustomGesture:].cold.1();

    }
  }
  else
  {
    v5 = 0;
  }
  -[NSMutableDictionary setValue:forKey:](self->_customDictionary, "setValue:forKey:", v5, CFSTR("CustomGesture"));

}

- (AXReplayableGesture)customGesture
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[NSMutableDictionary valueForKey:](self->_customDictionary, "valueForKey:", CFSTR("CustomGesture"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (!v3)
    {
      CACLogPreferences();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CACSpokenCommandItem customGesture].cold.1();

    }
  }
  else
  {
    v3 = 0;
  }

  return (AXReplayableGesture *)v3;
}

- (void)setCustomUserActionFlow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  self->_isEdited = 1;
  if (v4)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (!v5)
    {
      CACLogPreferences();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CACSpokenCommandItem setCustomUserActionFlow:].cold.1();

    }
  }
  else
  {
    v5 = 0;
  }
  -[NSMutableDictionary setValue:forKey:](self->_customDictionary, "setValue:forKey:", v5, CFSTR("CustomUserActionFlow"));

}

- (CACRecordedUserActionFlow)customUserActionFlow
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[NSMutableDictionary valueForKey:](self->_customDictionary, "valueForKey:", CFSTR("CustomUserActionFlow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (!v3)
    {
      CACLogPreferences();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CACSpokenCommandItem customUserActionFlow].cold.1();

    }
  }
  else
  {
    v3 = 0;
  }

  return (CACRecordedUserActionFlow *)v3;
}

- (void)setCustomTextToInsert:(id)a3
{
  self->_isEdited = 1;
  -[NSMutableDictionary setValue:forKey:](self->_customDictionary, "setValue:forKey:", a3, CFSTR("CustomTextToInsert"));
}

- (NSString)customTextToInsert
{
  return (NSString *)-[NSMutableDictionary valueForKey:](self->_customDictionary, "valueForKey:", CFSTR("CustomTextToInsert"));
}

- (void)setCustomType:(id)a3
{
  self->_isEdited = 1;
  -[NSMutableDictionary setValue:forKey:](self->_customDictionary, "setValue:forKey:", a3, CFSTR("CustomType"));
}

- (NSString)customType
{
  return (NSString *)-[NSMutableDictionary valueForKey:](self->_customDictionary, "valueForKey:", CFSTR("CustomType"));
}

- (void)setCustomPasteBoard:(id)a3
{
  self->_isEdited = 1;
  -[NSMutableDictionary setValue:forKey:](self->_customDictionary, "setValue:forKey:", a3, CFSTR("CustomPasteBoard"));
}

- (NSArray)customPasteBoard
{
  return (NSArray *)-[NSMutableDictionary valueForKey:](self->_customDictionary, "valueForKey:", CFSTR("CustomPasteBoard"));
}

- (void)setCustomShortcutsWorkflowIdentifier:(id)a3
{
  self->_isEdited = 1;
  -[NSMutableDictionary setValue:forKey:](self->_customDictionary, "setValue:forKey:", a3, CFSTR("CustomShortcutsWorkflow"));
}

- (NSString)customShortcutsWorkflowIdentifier
{
  return (NSString *)-[NSMutableDictionary valueForKey:](self->_customDictionary, "valueForKey:", CFSTR("CustomShortcutsWorkflow"));
}

- (void)_setCustomCommandStrings:(id)a3 withLocale:(id)a4
{
  NSMutableDictionary *customDictionary;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  self->_isEdited = 1;
  customDictionary = self->_customDictionary;
  v7 = a3;
  -[NSMutableDictionary objectForKey:](customDictionary, "objectForKey:", CFSTR("CustomCommands"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_customDictionary, "setObject:forKey:", v8, CFSTR("CustomCommands"));
  }
  +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v9);

  -[CACSpokenCommandGroup setCommandsArray:](self, "setCommandsArray:", 0);
  -[CACSpokenCommandItem setDisplayString:](self, "setDisplayString:", 0);
  -[CACSpokenCommandItem setUntranslatedDisplayString:](self, "setUntranslatedDisplayString:", 0);

}

- (id)_customCommandStringsWithLocale:(id)a3
{
  NSMutableDictionary *customDictionary;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  customDictionary = self->_customDictionary;
  v4 = a3;
  -[NSMutableDictionary objectForKey:](customDictionary, "objectForKey:", CFSTR("CustomCommands"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities normalizedLocaleIdentifier:](CACLocaleUtilities, "normalizedLocaleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)primaryBuiltinCommandForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertiesForCommandIdentifier:localeIdentifier:", self->super._identifier, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("BuiltInStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_updateBuiltInCommandsWithLocale:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFStringTokenizer *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __CFStringTokenizer *v18;
  __CFStringTokenizer *v19;
  CFStringRef v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  CFRange v25;
  CFRange CurrentTokenRange;
  CFRange v27;
  CFRange v28;

  v24 = a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "propertiesForCommandIdentifier:localeIdentifier:", self->super._identifier, v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("BuiltInStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommandGroup setCommandsArray:](self, "setCommandsArray:", v6);

  v7 = (__CFString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (objc_msgSend(v5, "count"))
  {
    v22 = v4;
    v21 = v5;
    objc_msgSend(v5, "objectAtIndex:", 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25.length = -[__CFString length](v8, "length");
    v25.location = 0;
    v9 = CFStringTokenizerCreate(0, v8, v25, 0, 0);
    while (CFStringTokenizerAdvanceToNextToken(v9))
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v9);
      v10 = (__CFString *)CFStringCreateWithSubstring(0, v8, CurrentTokenRange);
      objc_msgSend(v23, "builtInCommandsStringsTableForLocaleIdentifier:", v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD17C8];
      -[__CFString lowercaseString](v10, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("CommandSynonym.%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        -[__CFString appendFormat:](v7, "appendFormat:", CFSTR("%@ "), v15);
      CFRelease(v10);

    }
    CFRelease(v9);

    v4 = v22;
    v5 = v21;
  }
  -[CACSpokenCommandItem setSearchAlternates:](self, "setSearchAlternates:", 0);
  objc_msgSend(v4, "objectForKey:", CFSTR("SearchAlternates"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    -[__CFString appendString:](v7, "appendString:", v16);
  if (-[__CFString length](v7, "length"))
  {
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v27.length = -[__CFString length](v7, "length");
    v27.location = 0;
    v18 = CFStringTokenizerCreate(0, v7, v27, 0, 0);
    v19 = v18;
    while (CFStringTokenizerAdvanceToNextToken(v18))
    {
      v28 = CFStringTokenizerGetCurrentTokenRange(v19);
      v20 = CFStringCreateWithSubstring(0, v7, v28);
      objc_msgSend(v17, "addObject:", v20);
      CFRelease(v20);
      v18 = v19;
    }
    CFRelease(v19);
    if (objc_msgSend(v17, "count"))
      -[CACSpokenCommandItem setSearchAlternates:](self, "setSearchAlternates:", v17);

  }
}

- (void)_reloadFromProperties:(id)a3
{
  id v4;
  NSString **p_identifier;
  NSObject *v6;
  NSObject *v7;
  NSString *locale;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;

  v4 = a3;
  p_identifier = &self->super._identifier;
  if (self->super._identifier)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    locale = self->_locale;
    if (locale)
    {
      v9 = locale;
    }
    else
    {
      -[NSObject bestLocaleIdentifier](v6, "bestLocaleIdentifier");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v11 = -[NSString length](*p_identifier, "length");
    if (v4
      || !v11
      || (-[NSObject propertiesForCommandIdentifier:localeIdentifier:](v7, "propertiesForCommandIdentifier:localeIdentifier:", *p_identifier, v10), (v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("Enabled"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACSpokenCommandItem setIsEnabled:](self, "setIsEnabled:", objc_msgSend(v12, "BOOLValue"));

      objc_msgSend(v4, "objectForKey:", CFSTR("ConfirmationRequired"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACSpokenCommandItem setIsConfirmationRequired:](self, "setIsConfirmationRequired:", objc_msgSend(v13, "BOOLValue"));

      if (self->super._isCustom)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("CustomCommands"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[NSMutableDictionary objectForKey:](self->_customDictionary, "objectForKey:", CFSTR("CustomCommands"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addEntriesFromDictionary:", v14);
          -[NSMutableDictionary setObject:forKey:](self->_customDictionary, "setObject:forKey:", v16, CFSTR("CustomCommands"));

        }
        v32 = (void *)v14;
        -[CACSpokenCommandGroup setCommandsArray:](self, "setCommandsArray:", 0);
        -[CACSpokenCommandItem setDisplayString:](self, "setDisplayString:", 0);
        -[CACSpokenCommandItem setUntranslatedDisplayString:](self, "setUntranslatedDisplayString:", 0);
        objc_msgSend(v4, "objectForKey:", CFSTR("CustomScope"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACSpokenCommandItem setCustomScope:](self, "setCustomScope:", v17);

        objc_msgSend(v4, "objectForKey:", CFSTR("CustomType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACSpokenCommandItem setCustomType:](self, "setCustomType:", v18);

        objc_msgSend(v4, "objectForKey:", CFSTR("CustomGesture"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v34 = 0;
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v19, &v34);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v34;
          if (!v20)
          {
            CACLogPreferences();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[CACSpokenCommandItem customGesture].cold.1();

          }
        }
        else
        {
          v20 = 0;
        }
        -[CACSpokenCommandItem setCustomGesture:](self, "setCustomGesture:", v20);
        objc_msgSend(v4, "objectForKey:", CFSTR("CustomTextToInsert"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACSpokenCommandItem setCustomTextToInsert:](self, "setCustomTextToInsert:", v23);

        objc_msgSend(v4, "valueForKey:", CFSTR("CustomUserActionFlow"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v33 = 0;
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v24, &v33);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v33;
          if (!v25)
          {
            CACLogPreferences();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[CACSpokenCommandItem customUserActionFlow].cold.1();

          }
        }
        else
        {
          v25 = 0;
        }
        -[CACSpokenCommandItem setCustomUserActionFlow:](self, "setCustomUserActionFlow:", v25);
        objc_msgSend(v4, "objectForKey:", CFSTR("CustomAppName"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACSpokenCommandItem setCustomAppName:](self, "setCustomAppName:", v28);

        objc_msgSend(v4, "objectForKey:", CFSTR("CustomPasteBoard"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACSpokenCommandItem setCustomPasteBoard:](self, "setCustomPasteBoard:", v29);

        objc_msgSend(v4, "objectForKey:", CFSTR("CustomShortcutsWorkflow"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACSpokenCommandItem setCustomShortcutsWorkflowIdentifier:](self, "setCustomShortcutsWorkflowIdentifier:", v30);

      }
      else
      {
        -[CACSpokenCommandItem _updateBuiltInCommandsWithLocale:](self, "_updateBuiltInCommandsWithLocale:", v10);
      }
      self->_isEdited = 0;
    }
    else
    {
      CACLogGeneral();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CACSpokenCommandItem _reloadFromProperties:].cold.2((uint64_t *)&self->super._identifier, v31);

      v4 = 0;
    }

  }
  else
  {
    CACLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CACSpokenCommandItem _reloadFromProperties:].cold.1(v7);
  }

}

- (void)refreshDataFromPreferences
{
  -[CACSpokenCommandItem _reloadFromProperties:](self, "_reloadFromProperties:", 0);
}

- (void)_saveKey:(id)a3 toDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_customDictionary, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKey:", v7, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, v9);

  }
}

- (void)removeFromPreferences
{
  id v3;

  if (self->super._isCustom)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removePropertiesForCommandIdentifier:", self->super._identifier);

  }
}

- (id)dictionaryForSavingToPreferences
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  if (self->_isEdited)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CACSpokenCommandGroup isEnabled](self, "isEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Enabled"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CACSpokenCommandGroup isConfirmationRequired](self, "isConfirmationRequired"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ConfirmationRequired"));

    if (-[CACSpokenCommandGroup isCustom](self, "isCustom"))
    {
      objc_msgSend(v3, "addEntriesFromDictionary:", self->_customDictionary);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __56__CACSpokenCommandItem_dictionaryForSavingToPreferences__block_invoke;
      v10[3] = &unk_24F2AC618;
      v3 = v3;
      v11 = v3;
      +[؋ enumerateKeysAndObjectsUsingBlock:](&unk_24F2CF710, "enumerateKeysAndObjectsUsingBlock:", v10);
      -[CACSpokenCommandItem customType](self, "customType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[CACSpokenCommandItem customType](self, "customType");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[؋ objectForKeyedSubscript:](&unk_24F2CF710, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          -[CACSpokenCommandItem _saveKey:toDictionary:](self, "_saveKey:toDictionary:", v8, v3);

      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __56__CACSpokenCommandItem_dictionaryForSavingToPreferences__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x24BDBCEF8];
  v5 = a3;
  objc_msgSend(v4, "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, v5);

}

- (void)saveToPreferences
{
  void *v3;
  id v4;

  -[CACSpokenCommandItem dictionaryForSavingToPreferences](self, "dictionaryForSavingToPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperties:forCommandIdentifier:", v4, self->super._identifier);

    self->_isEdited = 0;
  }

}

- (void)setValue:(id)a3 forKey:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a4;
  v8 = a5;
  v9 = a3;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("CustomCommands")))
    -[CACSpokenCommandItem _setCustomCommandStrings:withLocale:](self, "_setCustomCommandStrings:withLocale:", v9, v8);
  else
    -[CACSpokenCommandItem setValue:forKey:](self, "setValue:forKey:", v9, v10);

}

- (id)valueForKey:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("CustomCommands")))
    -[CACSpokenCommandItem _customCommandStringsWithLocale:](self, "_customCommandStringsWithLocale:", v7);
  else
    -[CACSpokenCommandItem valueForKey:](self, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
  -[CACSpokenCommandGroup setCommandsArray:](self, "setCommandsArray:", 0);
  -[CACSpokenCommandItem setDisplayString:](self, "setDisplayString:", 0);
  -[CACSpokenCommandItem setUntranslatedDisplayString:](self, "setUntranslatedDisplayString:", 0);
}

- (id)commandsArray
{
  NSString *locale;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;

  if (!self->super._commandsArray)
  {
    locale = self->_locale;
    if (self->super._isCustom)
    {
      -[CACSpokenCommandItem _customCommandStringsWithLocale:](self, "_customCommandStringsWithLocale:", locale);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (NSString *)objc_msgSend(v4, "mutableCopy");

      if (v5)
      {
        -[CACSpokenCommandGroup setCommandsArray:](self, "setCommandsArray:", v5);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACSpokenCommandGroup setCommandsArray:](self, "setCommandsArray:", v6);

      }
    }
    else
    {
      if (locale)
      {
        v5 = locale;
      }
      else
      {
        +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bestLocaleIdentifier");
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();

      }
      -[CACSpokenCommandItem _updateBuiltInCommandsWithLocale:](self, "_updateBuiltInCommandsWithLocale:", v5);
    }

  }
  return self->super._commandsArray;
}

- (void)setDisplayString:(id)a3
{
  objc_super v3;

  self->_isEdited = 1;
  v3.receiver = self;
  v3.super_class = (Class)CACSpokenCommandItem;
  -[CACSpokenCommandGroup setDisplayString:](&v3, sel_setDisplayString_, a3);
}

- (id)displayString
{
  NSString *displayString;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  displayString = self->super._displayString;
  if (!displayString)
  {
    -[CACSpokenCommandItem commandsArray](self, "commandsArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "length"))
        -[CACSpokenCommandItem setDisplayString:](self, "setDisplayString:", v7);

    }
    displayString = self->super._displayString;
    if (!displayString)
    {
      -[CACSpokenCommandItem setDisplayString:](self, "setDisplayString:", &stru_24F2ADCC8);
      displayString = self->super._displayString;
    }
  }
  return displayString;
}

- (id)untranslatedDisplayStringAndLocale:(id *)a3
{
  CACSpokenCommandItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  BOOL v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  id *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  CACSpokenCommandItem *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v4 = self;
  v57 = *MEMORY[0x24BDAC8D0];
  if (!self->_untranslatedDisplayString)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userSelectableLocaleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (-[CACSpokenCommandItem locale](v4, "locale"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      v45 = a3;
      v8 = (void *)MEMORY[0x24BDBCEB8];
      -[NSMutableDictionary objectForKey:](v4->_customDictionary, "objectForKey:", CFSTR("CustomCommands"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[CACSpokenCommandItem locale](v4, "locale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "indexOfObject:", v12);

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v11, "removeObjectAtIndex:", v13);
      v43 = v6;
      v44 = v5;
      v51 = v4;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v14 = v6;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = 0;
        v19 = *(_QWORD *)v53;
        v48 = v14;
        v50 = v11;
        v46 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v53 != v19)
              objc_enumerationMutation(v14);
            v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            if (v21 && objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i)))
            {
              v22 = v17;
              -[CACSpokenCommandItem _customCommandStringsWithLocale:](v51, "_customCommandStringsWithLocale:", v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "count"))
              {
                objc_msgSend(v23, "objectAtIndex:", 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v24 = 0;
              }
              objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet", v43, v44);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "length");

              if (v27)
              {
                v28 = v24;

                v29 = v21;
                -[CACSpokenCommandItem locale](v51, "locale");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = +[CACLocaleUtilities isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:", v29, v30);

                v14 = v48;
                if (v31)
                {
                  v32 = v28;
                  v4 = v51;
                  a3 = v45;
                  v6 = v43;
                  v5 = v44;
                  goto LABEL_35;
                }
              }
              else
              {
                v29 = v22;
                v28 = v18;
                v14 = v48;
              }

              v17 = v29;
              v18 = v28;
              v11 = v50;
              v19 = v46;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v16);
      }
      else
      {
        v18 = 0;
        v17 = 0;
      }
      v47 = v18;

      v28 = v17;
      v4 = v51;
      a3 = v45;
      v6 = v43;
      v5 = v44;
    }
    else
    {
      v47 = 0;
      v28 = 0;
    }
    objc_msgSend(v5, "bestLocaleIdentifier", v43, v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommandItem locale](v4, "locale");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34
      && (v35 = (void *)v34,
          -[CACSpokenCommandItem locale](v4, "locale"),
          v36 = (void *)objc_claimAutoreleasedReturnValue(),
          v37 = objc_msgSend(v33, "isEqualToString:", v36),
          v36,
          v35,
          (v37 & 1) != 0))
    {
      v32 = v47;
    }
    else
    {
      v50 = v33;
      -[CACSpokenCommandItem _customCommandStringsWithLocale:](v4, "_customCommandStringsWithLocale:", v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v38;
      if (objc_msgSend(v38, "count"))
      {
        objc_msgSend(v38, "objectAtIndex:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "length");

      if (v41)
      {
        v32 = v23;

        v29 = v50;
        v14 = v49;
LABEL_35:

        v28 = v29;
      }
      else
      {
        v32 = v47;
        v14 = v49;
      }

      v33 = v50;
    }

    if (v32 && v28)
    {
      -[CACSpokenCommandItem setUntranslatedDisplayString:](v4, "setUntranslatedDisplayString:", v32);
      -[CACSpokenCommandItem setUntranslatedLocale:](v4, "setUntranslatedLocale:", v28);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v4->_untranslatedLocale);
  return v4->_untranslatedDisplayString;
}

- (id)sortString
{
  void *v3;
  uint64_t v4;

  -[CACSpokenCommandItem displayString](self, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[CACSpokenCommandItem untranslatedDisplayStringAndLocale:](self, "untranslatedDisplayStringAndLocale:", 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (void)setIsCollapsed:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSString *locale;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x24BDBD1C0];
  if (a3)
    v4 = (void *)MEMORY[0x24BDBD1C8];
  v13 = v4;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  locale = self->_locale;
  if (locale)
  {
    v8 = locale;
  }
  else
  {
    objc_msgSend(v5, "bestLocaleIdentifier");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v6, "propertiesForCommandIdentifier:localeIdentifier:", self->super._identifier, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v11)
  {
    objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("Collapsed"));
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperties:forCommandIdentifier:", v11, self->super._identifier);

  }
}

- (BOOL)isCollapsed
{
  void *v3;
  void *v4;
  NSString *locale;
  NSString *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  locale = self->_locale;
  if (locale)
  {
    v6 = locale;
  }
  else
  {
    objc_msgSend(v3, "bestLocaleIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertiesForCommandIdentifier:localeIdentifier:", self->super._identifier, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("Collapsed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSMutableDictionary allKeys](self->_customDictionary, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Keys: %@, Dictionary: %@"), v4, self->_customDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copy
{
  CACSpokenCommandItem *v3;
  void *v4;
  uint64_t v5;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = [CACSpokenCommandItem alloc];
  -[CACSpokenCommandGroup identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CACSpokenCommandItem initWithIdentifier:](v3, "initWithIdentifier:", v4);

  objc_storeStrong((id *)(v5 + 48), self->_customDictionary);
  objc_storeStrong((id *)(v5 + 56), self->_searchAlternates);
  objc_storeStrong((id *)(v5 + 64), self->_locale);
  objc_storeStrong((id *)(v5 + 72), self->_untranslatedDisplayString);
  objc_storeStrong((id *)(v5 + 80), self->_untranslatedLocale);
  objc_storeStrong((id *)(v5 + 88), self->_commandInfo);
  *(_BYTE *)(v5 + 96) = self->_isEdited;
  -[CACSpokenCommandItem searchAlternates](self, "searchAlternates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend((id)v5, "setSearchAlternates:", v7);

  -[CACSpokenCommandItem customScope](self, "customScope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend((id)v5, "setCustomScope:", v9);

  -[CACSpokenCommandItem customAppName](self, "customAppName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend((id)v5, "setCustomAppName:", v11);

  -[CACSpokenCommandItem customTextToInsert](self, "customTextToInsert");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend((id)v5, "setCustomTextToInsert:", v13);

  -[CACSpokenCommandItem customType](self, "customType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend((id)v5, "setCustomType:", v15);

  -[CACSpokenCommandItem customPasteBoard](self, "customPasteBoard");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend((id)v5, "setCustomPasteBoard:", v17);

  -[CACSpokenCommandItem customShortcutsWorkflowIdentifier](self, "customShortcutsWorkflowIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend((id)v5, "setCustomShortcutsWorkflowIdentifier:", v19);

  -[CACSpokenCommandItem locale](self, "locale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend((id)v5, "setLocale:", v21);

  -[CACSpokenCommandItem untranslatedDisplayString](self, "untranslatedDisplayString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend((id)v5, "setUntranslatedDisplayString:", v23);

  -[CACSpokenCommandItem untranslatedLocale](self, "untranslatedLocale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend((id)v5, "setUntranslatedLocale:", v25);

  -[CACSpokenCommandItem customUserActionFlow](self, "customUserActionFlow");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "setCustomUserActionFlow:", v26);

  -[CACSpokenCommandItem customGesture](self, "customGesture");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "setCustomGesture:", v27);

  -[CACSpokenCommandItem commandInfo](self, "commandInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "setCommandInfo:", v28);

  objc_msgSend((id)v5, "setIsEdited:", -[CACSpokenCommandItem isEdited](self, "isEdited"));
  return (id)v5;
}

- (NSArray)searchAlternates
{
  return self->_searchAlternates;
}

- (void)setSearchAlternates:(id)a3
{
  objc_storeStrong((id *)&self->_searchAlternates, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)untranslatedDisplayString
{
  return self->_untranslatedDisplayString;
}

- (void)setUntranslatedDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_untranslatedDisplayString, a3);
}

- (NSString)untranslatedLocale
{
  return self->_untranslatedLocale;
}

- (void)setUntranslatedLocale:(id)a3
{
  objc_storeStrong((id *)&self->_untranslatedLocale, a3);
}

- (id)commandInfo
{
  return self->_commandInfo;
}

- (void)setCommandInfo:(id)a3
{
  objc_storeStrong(&self->_commandInfo, a3);
}

- (BOOL)isEdited
{
  return self->_isEdited;
}

- (void)setIsEdited:(BOOL)a3
{
  self->_isEdited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commandInfo, 0);
  objc_storeStrong((id *)&self->_untranslatedLocale, 0);
  objc_storeStrong((id *)&self->_untranslatedDisplayString, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_searchAlternates, 0);
  objc_storeStrong((id *)&self->_customDictionary, 0);
}

- (void)setCustomGesture:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_229A40000, v0, v1, "Unable to serialize gesture %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)customGesture
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_229A40000, v0, v1, "Unable to deserialize gesture %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)setCustomUserActionFlow:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_229A40000, v0, v1, "Unable to serialize user action flow %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)customUserActionFlow
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_229A40000, v0, v1, "Unable to deserialize user action flow %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_reloadFromProperties:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A40000, log, OS_LOG_TYPE_ERROR, "No Identifier", v1, 2u);
}

- (void)_reloadFromProperties:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "No Properties for %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
