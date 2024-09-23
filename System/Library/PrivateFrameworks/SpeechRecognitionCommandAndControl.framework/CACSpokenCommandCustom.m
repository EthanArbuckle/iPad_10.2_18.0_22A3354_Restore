@implementation CACSpokenCommandCustom

- (CACSpokenCommandCustom)initWithCommandIdentifier:(id)a3
{
  id v4;
  CACSpokenCommandCustom *v5;
  id *p_isa;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CACSpokenCommandCustom *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[CACSpokenCommand initWithProperties:](self, "initWithProperties:", 0);
  if (v5)
  {
    p_isa = (id *)&v5->super.super.isa;
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertiesForCommandIdentifier:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = p_isa[11];
    p_isa[11] = (id)v8;

    objc_msgSend(p_isa[11], "objectForKey:", CFSTR("CustomCommands"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bestLocaleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        if (objc_msgSend(v18, "length", (_QWORD)v28))
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v15)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v20 = v18;

      if (!v20)
      {
        v26 = 0;
        goto LABEL_23;
      }
      objc_msgSend(p_isa, "setIdentifier:", v4);
      objc_msgSend(p_isa, "setStrings:", v13);
      objc_msgSend(p_isa, "setPrimaryCommand:", v20);
      objc_msgSend(p_isa, "setAction:", sel_handleSpokenCommand_);
      objc_msgSend(p_isa[11], "objectForKey:", CFSTR("CustomType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("PasteText")) & 1) != 0
        || objc_msgSend(v19, "isEqualToString:", CFSTR("PasteBoard")))
      {
        objc_msgSend(p_isa, "contextEvaluation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v22, kCACCommandContextRequiresFocusedEditableText);

      }
      objc_msgSend(p_isa[11], "objectForKey:", CFSTR("CustomScope"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23
        && (objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.speech.SystemWideScope")) & 1) == 0)
      {
        objc_msgSend(p_isa, "contextEvaluation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v25, kCACCommandContextRequiresOneOfAppIdentifiers);

      }
    }
    else
    {
LABEL_10:
      v19 = v13;
      v20 = p_isa;
      p_isa = 0;
    }
    v26 = (CACSpokenCommandCustom *)p_isa;

    p_isa = v20;
LABEL_23:

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)handleSpokenCommand:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  dispatch_time_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  CACSpokenCommandCustom *v42;
  _QWORD v43[4];
  NSObject *v44;
  CACSpokenCommandCustom *v45;
  _QWORD v46[4];
  NSObject *v47;
  CACSpokenCommandCustom *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  _QWORD block[4];
  NSObject *v55;
  CACSpokenCommandCustom *v56;
  BOOL v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[CACSpokenCommandCustom customProperties](self, "customProperties", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CustomType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PasteText")))
  {
    -[CACSpokenCommand setCompletionDeterminedManually:](self, "setCompletionDeterminedManually:", 1);
    v6 = -[CACSpokenCommand isRestrictedForAAC](self, "isRestrictedForAAC");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke;
    block[3] = &unk_24F2AD520;
    v57 = v6;
    v55 = v4;
    v56 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v7 = v55;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("RunShortcutsWorkflow")))
  {
    -[CACSpokenCommand setCompletionDeterminedManually:](self, "setCompletionDeterminedManually:", 1);
    objc_msgSend(v4, "objectForKey:", CFSTR("CustomShortcutsWorkflow"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortcutForIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performShortcut:", v9);

    }
    else
    {
      CACLogShortcuts();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CACSpokenCommandCustom handleSpokenCommand:].cold.1((uint64_t)v7, v23, v24, v25, v26, v27, v28, v29);

    }
    v30 = dispatch_time(0, 3000000000);
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_28;
    v53[3] = &unk_24F2AA860;
    v53[4] = self;
    dispatch_after(v30, MEMORY[0x24BDAC9B8], v53);

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PasteBoard")))
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "focusedElement");
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v38 = v5;
      -[CACSpokenCommand setCompletionDeterminedManually:](self, "setCompletionDeterminedManually:", 1);
      objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_new();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v39 = v4;
      objc_msgSend(v4, "objectForKey:", CFSTR("CustomPasteBoard"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v50 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKey:", CFSTR("CustomPasteBoardType"), v37);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("CustomPasteBoardData"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              v21 = v19 == 0;
            else
              v21 = 1;
            if (!v21)
              objc_msgSend(v12, "setObject:forKey:", v20, v19);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        }
        while (v15);
      }

      v58 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setItems:", v22);

      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_2;
      v46[3] = &unk_24F2AAD70;
      v7 = v7;
      v47 = v7;
      v48 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v46);

      v5 = v38;
      v4 = v39;
    }
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("RunGesture")))
  {
    -[CACSpokenCommand setCompletionDeterminedManually:](self, "setCompletionDeterminedManually:", 1);
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_3;
    v43[3] = &unk_24F2AAD70;
    v44 = v4;
    v45 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v43);
    v7 = v44;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("RunUserActionFlow")))
  {
    -[CACSpokenCommand setCompletionDeterminedManually:](self, "setCompletionDeterminedManually:", 1);
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_46;
    v40[3] = &unk_24F2AAD70;
    v41 = v4;
    v42 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v40);
    v7 = v41;
  }
  else
  {
    CACLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CACSpokenCommandCustom handleSpokenCommand:].cold.2((uint64_t)v5, v7, v31, v32, v33, v34, v35, v36);
  }

}

uint64_t __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_BYTE *)(a1 + 48))
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.PasteNotAllowedForAAC"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayMessageString:type:", v3, 1);
  }
  else
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("CustomTextToInsert"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertDictatedString:", v3);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setExecuting:", 0);
}

uint64_t __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
}

uint64_t __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cacPerformTextPaste");
  return objc_msgSend(*(id *)(a1 + 40), "setExecuting:", 0);
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v2 = (void *)MEMORY[0x24BDD1620];
  v3 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CustomGesture"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "unarchivedObjectOfClass:fromData:error:", v3, v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;

  if (v5)
  {
    +[CACSpokenCommandGestureManager mainScreenGestureManager](CACSpokenCommandGestureManager, "mainScreenGestureManager");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject performGesture:](v7, "performGesture:", v5);
  }
  else
  {
    CACLogAccessibility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_3_cold_1((uint64_t)v6, (id *)(a1 + 32));
  }

  objc_msgSend(*(id *)(a1 + 40), "setExecuting:", 0);
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_46(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v2 = (void *)MEMORY[0x24BDD1620];
  v3 = objc_opt_class();
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CustomUserActionFlow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "unarchivedObjectOfClass:fromData:error:", v3, v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v6)
  {
    +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_2_51;
    v10[3] = &unk_24F2AB760;
    v10[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "beginExecutingRecordedUserActionFlow:completionBlock:", v6, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setExecuting:", 0);
    CACLogAccessibility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_46_cold_1((uint64_t)v7, v4);

  }
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_2_51(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setExecuting:", 0);
  if (objc_msgSend(v7, "code"))
  {
    objc_msgSend(v7, "localizedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayMessageString:type:", v6, 1);

    }
  }

}

- (void)_setCustomProperties:(id)a3
{
  objc_storeStrong((id *)&self->_customProperties, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSpokenCommand:", self);
  -[CACSpokenCommandCustom customProperties](self, "customProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setCustomProperties:", v5);

  -[CACSpokenCommandCustom primaryCommand](self, "primaryCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrimaryCommand:", v6);

  return v4;
}

- (BOOL)isCustomCommand
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CACSpokenCommand strings](self, "strings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, self->_customProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)customProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)primaryCommand
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPrimaryCommand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCommand, 0);
  objc_storeStrong((id *)&self->_customProperties, 0);
}

- (void)handleSpokenCommand:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_229A40000, a2, a3, "Unable to perform shortcut with identifier: %@. No longer exists?", a5, a6, a7, a8, 2u);
}

- (void)handleSpokenCommand:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_229A40000, a2, a3, "Unhandled custom spoken command type: %@", a5, a6, a7, a8, 2u);
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_3_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "objectForKeyedSubscript:", CFSTR("CustomGesture"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_6(&dword_229A40000, v3, v4, "Unable to unarchive gesture. Error: %@, data: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __46__CACSpokenCommandCustom_handleSpokenCommand___block_invoke_46_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "objectForKeyedSubscript:", CFSTR("CustomUserActionFlow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_6(&dword_229A40000, v3, v4, "Unable to unarchive user action flow. Error: %@, data: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

@end
