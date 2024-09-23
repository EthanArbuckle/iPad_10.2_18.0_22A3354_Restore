@implementation _UIKeyShortcutHUDModel

+ (id)modelForCurrentMenu
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "_buildMenu");
  return v2;
}

- (_UIKeyShortcutHUDModel)init
{
  _UIKeyShortcutHUDModel *v2;
  uint64_t v3;
  NSMutableSet *modelKeyCommands;
  uint64_t v5;
  NSMapTable *modelKeyCommandToModelShortcutMap;
  uint64_t v7;
  NSMutableDictionary *modelKeyCommandToAppKeyCommandMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIKeyShortcutHUDModel;
  v2 = -[_UIKeyShortcutHUDModel init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    modelKeyCommands = v2->_modelKeyCommands;
    v2->_modelKeyCommands = (NSMutableSet *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 10);
    modelKeyCommandToModelShortcutMap = v2->_modelKeyCommandToModelShortcutMap;
    v2->_modelKeyCommandToModelShortcutMap = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    modelKeyCommandToAppKeyCommandMap = v2->_modelKeyCommandToAppKeyCommandMap;
    v2->_modelKeyCommandToAppKeyCommandMap = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (BOOL)isEmpty
{
  return -[_UIKeyShortcutHUDMenu isEmpty](self->_menu, "isEmpty");
}

- (id)modelKeyCommandsExcludingHUDCommands:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_modelKeyCommands;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v12, (_QWORD)v14) & 1) == 0)
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)searchMenuWithSearchText:(id)a3 maxSearchResultEntries:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  _UIKeyShortcutHUDModel *v29;
  id obj;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v8;
  if (objc_msgSend(v8, "length"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v29 = self;
    -[_UIKeyShortcutHUDMenu children](self->_menu, "children");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v33)
    {
      v9 = 0;
      v32 = *(_QWORD *)v52;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(obj);
        if (v9 + 1 >= a4)
          break;
        v35 = v10;
        v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v34 = v11;
        objc_msgSend(v11, "children");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v38)
        {
          v37 = *(_QWORD *)v48;
LABEL_10:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v48 != v37)
              objc_enumerationMutation(v36);
            if (v9 + 1 >= a4)
              break;
            v39 = v12;
            v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v12);
            objc_msgSend(v13, "hudTitle");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "localizedCaseInsensitiveContainsString:", v41);

            if (v15)
            {
              objc_msgSend(v40, "addObject:", v13);
              ++v9;
            }
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            objc_msgSend(v13, "displayableAlternates");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v44;
LABEL_18:
              v20 = 0;
              while (1)
              {
                if (*(_QWORD *)v44 != v19)
                  objc_enumerationMutation(v16);
                if (v9 + 1 >= a4)
                  break;
                v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v20);
                objc_msgSend(v13, "alternatesMap");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v23, "hudTitle");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "localizedCaseInsensitiveContainsString:", v41);

                if (v25)
                {
                  objc_msgSend(v40, "addObject:", v23);
                  ++v9;
                }

                if (v18 == ++v20)
                {
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
                  if (v18)
                    goto LABEL_18;
                  break;
                }
              }
            }

            v12 = v39 + 1;
            if (v39 + 1 == v38)
            {
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
              if (v38)
                goto LABEL_10;
              break;
            }
          }
        }

        if (objc_msgSend(v40, "count"))
        {
          objc_msgSend(v34, "menuByReplacingChildren:", v40);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v26);
          ++v9;

        }
        v10 = v35 + 1;
        if (v35 + 1 == v33)
        {
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
          if (v33)
            goto LABEL_4;
          break;
        }
      }
    }

    self = v29;
  }
  -[_UIKeyShortcutHUDMenu menuByReplacingChildren:](self->_menu, "menuByReplacingChildren:", v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)menuWithAlternatesForModifierFlags:(int64_t)a3
{
  void *v5;
  char v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  _UIKeyShortcutHUDMenu *v21;
  _UIKeyShortcutHUDMenu *v22;
  _UIKeyShortcutHUDModel *v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[_UIKeyShortcutHUDMenu children](self->_menu, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v28)
  {

    goto LABEL_23;
  }
  v24 = self;
  obj = v5;
  v6 = 0;
  v26 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v36 != v26)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      v9 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v8, "children");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v8, "children");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v13)
      {
        v14 = v13;
        v29 = v8;
        v30 = i;
        v15 = 0;
        v16 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
            objc_msgSend(v18, "shortcutToDisplayForModifierFlags:", a3);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v15 |= v19 != v18;
            v6 |= v19 != v18;
            objc_msgSend(v11, "addObject:", v19);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v14);

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v29, "menuByReplacingChildren:", v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v20);

          i = v30;
          goto LABEL_18;
        }
        v8 = v29;
        i = v30;
      }
      else
      {

      }
      objc_msgSend(v27, "addObject:", v8);
LABEL_18:

    }
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  }
  while (v28);

  self = v24;
  if ((v6 & 1) == 0)
  {
LABEL_23:
    v21 = self->_menu;
    goto LABEL_24;
  }
  -[_UIKeyShortcutHUDMenu menuByReplacingChildren:](v24->_menu, "menuByReplacingChildren:", v27);
  v21 = (_UIKeyShortcutHUDMenu *)objc_claimAutoreleasedReturnValue();
LABEL_24:
  v22 = v21;

  return v22;
}

- (id)modelShortcutForModelKeyCommand:(id)a3
{
  return -[NSMapTable objectForKey:](self->_modelKeyCommandToModelShortcutMap, "objectForKey:", a3);
}

- (id)appKeyCommandForSelectedKeyCommand:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_modelKeyCommandToAppKeyCommandMap, "objectForKey:", a3);
}

- (id)originalTargetForSelectedKeyCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableSet member:](self->_modelKeyCommands, "member:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDModel modelShortcutForModelKeyCommand:](self, "modelShortcutForModelKeyCommand:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_buildMenu
{
  void *v3;
  int v4;
  NSMapTable *v5;
  NSMapTable *displayableAppKeyCommandToModelShortcutMap;
  NSMapTable *v7;
  NSMapTable *appKeyCommandToModelKeyCommandMap;
  NSMutableSet *v9;
  NSMutableSet *performableAppKeyCommands;
  _UIMenuLeafValidation *v11;
  _UIMenuLeafValidation *validation;
  void *v13;
  NSMutableSet *v14;
  NSMutableSet *equivalentKeyCommandsInPriorityAlreadyEnumerated;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void *, _QWORD);
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t n;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _UIKeyShortcutHUDMenu *v59;
  _UIKeyShortcutHUDMenu *menu;
  NSMapTable *v61;
  NSMutableSet *v62;
  NSMutableSet *v63;
  NSMapTable *v64;
  _UIMenuLeafValidation *v65;
  uint64_t v66;
  id v67;
  void *v68;
  id obj;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD aBlock[4];
  id v92;
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  void *v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "_disableLayoutAwareShortcuts") & 1) == 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_isHardwareKeyboardAvailable");

    if (v4)
      self->_gsKeyboard = (__GSKeyboard *)objc_msgSend((id)UIApp, "_hardwareKeyboard");
  }
  v5 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 10);
  displayableAppKeyCommandToModelShortcutMap = self->_displayableAppKeyCommandToModelShortcutMap;
  self->_displayableAppKeyCommandToModelShortcutMap = v5;

  v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 10);
  appKeyCommandToModelKeyCommandMap = self->_appKeyCommandToModelKeyCommandMap;
  self->_appKeyCommandToModelKeyCommandMap = v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  performableAppKeyCommands = self->_performableAppKeyCommands;
  self->_performableAppKeyCommands = v9;

  v11 = (_UIMenuLeafValidation *)objc_opt_new();
  validation = self->_validation;
  self->_validation = v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  equivalentKeyCommandsInPriorityAlreadyEnumerated = self->_equivalentKeyCommandsInPriorityAlreadyEnumerated;
  self->_equivalentKeyCommandsInPriorityAlreadyEnumerated = v14;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)UIApp, "_responderForKeyEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDModel _responderBasedKeyCommandsStartingAtResponder:](self, "_responderBasedKeyCommandsStartingAtResponder:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIKeyShortcutHUDModel _sanitizedMainMenu](self, "_sanitizedMainMenu");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "children");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v19, "indexOfObjectPassingTest:", &__block_literal_global_307);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36___UIKeyShortcutHUDModel__buildMenu__block_invoke_2;
  aBlock[3] = &unk_1E16CD1C0;
  v67 = v16;
  v92 = v67;
  v70 = v13;
  v93 = v70;
  v20 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v21 = v18;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v88 != v24)
          objc_enumerationMutation(v21);
        v20[2](v20, *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
    }
    while (v23);
  }

  -[_UIKeyShortcutHUDModel _enumerateKeyCommandsInMenu:block:](self, "_enumerateKeyCommandsInMenu:block:", v68, v20);
  objc_msgSend(v70, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sortedArrayUsingDescriptors:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v29;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v84 != v32)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        objc_msgSend(v70, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v80;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v80 != v38)
                objc_enumerationMutation(v35);
              -[_UIKeyShortcutHUDModel _validateKeyCommandAndAlternates:](self, "_validateKeyCommandAndAlternates:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k));
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
          }
          while (v37);
        }

        -[NSMutableSet removeAllObjects](self->_equivalentKeyCommandsInPriorityAlreadyEnumerated, "removeAllObjects");
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
    }
    while (v31);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v41 = v21;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v76;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v76 != v44)
          objc_enumerationMutation(v41);
        -[NSMapTable objectForKey:](self->_displayableAppKeyCommandToModelShortcutMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * m));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
          objc_msgSend(v40, "addObject:", v46);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
    }
    while (v43);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v68, "children");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v72;
    do
    {
      for (n = 0; n != v50; ++n)
      {
        if (*(_QWORD *)v72 != v51)
          objc_enumerationMutation(v48);
        -[_UIKeyShortcutHUDModel _validatedHUDMenuFromUIMenu:](self, "_validatedHUDMenuFromUIMenu:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * n));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v53);

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
    }
    while (v50);
  }

  if (v66 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", CFSTR("com.apple.menu.application"), MEMORY[0x1E0C9AA60]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIKeyShortcutHUDMenu menuWithUIMenu:children:](_UIKeyShortcutHUDMenu, "menuWithUIMenu:children:", v54, v40);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v47, "objectAtIndexedSubscript:", v66);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeObjectAtIndex:", v66);
    objc_msgSend(v56, "children");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "arrayByAddingObjectsFromArray:", v40);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "menuByReplacingChildren:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v47, "insertObject:atIndex:", v55, 0);
  +[_UIKeyShortcutHUDMenu menuWithUIMenu:children:](_UIKeyShortcutHUDMenu, "menuWithUIMenu:children:", v68, v47);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyShortcutHUDModel _finalizedHUDMenuFromValidatedHUDMenu:](self, "_finalizedHUDMenuFromValidatedHUDMenu:", v58);
  v59 = (_UIKeyShortcutHUDMenu *)objc_claimAutoreleasedReturnValue();
  menu = self->_menu;
  self->_menu = v59;

  -[NSMapTable removeAllObjects](self->_displayableAppKeyCommandToModelShortcutMap, "removeAllObjects");
  v61 = self->_displayableAppKeyCommandToModelShortcutMap;
  self->_displayableAppKeyCommandToModelShortcutMap = 0;

  -[NSMutableSet removeAllObjects](self->_performableAppKeyCommands, "removeAllObjects");
  v62 = self->_performableAppKeyCommands;
  self->_performableAppKeyCommands = 0;

  v63 = self->_equivalentKeyCommandsInPriorityAlreadyEnumerated;
  self->_equivalentKeyCommandsInPriorityAlreadyEnumerated = 0;

  -[NSMapTable removeAllObjects](self->_appKeyCommandToModelKeyCommandMap, "removeAllObjects");
  v64 = self->_appKeyCommandToModelKeyCommandMap;
  self->_appKeyCommandToModelKeyCommandMap = 0;

  v65 = self->_validation;
  self->_gsKeyboard = 0;
  self->_validation = 0;

}

- (id)_responderBasedKeyCommandsStartingAtResponder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72___UIKeyShortcutHUDModel__responderBasedKeyCommandsStartingAtResponder___block_invoke;
  v8[3] = &unk_1E16CD320;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "_enumerateKeyCommandsInChainWithOptions:usingBlock:", 27, v8);

  return v6;
}

- (id)_sanitizedMainMenu
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id obj;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_rootMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __44___UIKeyShortcutHUDModel__sanitizedMainMenu__block_invoke;
        v15[3] = &unk_1E16CD1E8;
        v15[4] = self;
        v16 = v5;
        objc_msgSend(v11, "_acceptMenuVisit:leafVisit:", v15, &__block_literal_global_20_3);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "menuByReplacingChildren:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_menuByOmittingNonKeyCommandsInMenu:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id obj;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __62___UIKeyShortcutHUDModel__menuByOmittingNonKeyCommandsInMenu___block_invoke;
        v17[3] = &unk_1E16CD1E8;
        v17[4] = self;
        v18 = v5;
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __62___UIKeyShortcutHUDModel__menuByOmittingNonKeyCommandsInMenu___block_invoke_2;
        v15[3] = &unk_1E16BC880;
        v16 = v18;
        objc_msgSend(v11, "_acceptMenuVisit:leafVisit:", v17, v15);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "menuByReplacingChildren:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_enumerateKeyCommandsInMenu:(id)a3 block:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke;
        v16[3] = &unk_1E16CD258;
        v16[4] = self;
        v17 = v6;
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke_3;
        v14[3] = &unk_1E16CD280;
        v15 = v17;
        objc_msgSend(v12, "_acceptMenuVisit:leafVisit:", v16, v14);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (void)_validateKeyCommandAndAlternates:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIKeyShortcutHUDModel _validateBaseKeyCommand:usingAlternate:](self, "_validateBaseKeyCommand:usingAlternate:", v4, 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "alternates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[_UIKeyShortcutHUDModel _validateBaseKeyCommand:usingAlternate:](self, "_validateBaseKeyCommand:usingAlternate:", v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_validateBaseKeyCommand:(id)a3 usingAlternate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  char v18;
  char v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "_keyCommandUsingAlternate:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;
  if ((-[NSMutableSet containsObject:](self->_performableAppKeyCommands, "containsObject:", v8) & 1) == 0
    && (-[NSMutableSet containsObject:](self->_equivalentKeyCommandsInPriorityAlreadyEnumerated, "containsObject:", v9) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_equivalentKeyCommandsInPriorityAlreadyEnumerated, "addObject:", v9);
    objc_msgSend(v9, "_localizeWithGSKeyboard:automatically:force:", self->_gsKeyboard, _UIGetEnableLayoutAwareShortcutsAutomatic(), 0);
    v28 = 0;
    v10 = -[_UIKeyShortcutHUDModel _isKeyCommandPerformable:outTarget:](self, "_isKeyCommandPerformable:outTarget:", v9, &v28);
    v11 = v28;
    if (v10)
    {
      -[NSMutableSet addObject:](self->_performableAppKeyCommands, "addObject:", v9);
      objc_msgSend(v9, "_immutableCopy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_appKeyCommandToModelKeyCommandMap, "setObject:forKey:", v12, v9);
      -[NSMutableDictionary setObject:forKey:](self->_modelKeyCommandToAppKeyCommandMap, "setObject:forKey:", v9, v12);
      +[_UIKeyShortcutHUDShortcut shortcutWithUIKeyCommand:](_UIKeyShortcutHUDShortcut, "shortcutWithUIKeyCommand:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v11;
      objc_msgSend(v13, "setOriginalTarget:", v11);
      -[NSMapTable setObject:forKey:](self->_modelKeyCommandToModelShortcutMap, "setObject:forKey:", v13, v12);
      -[NSMutableSet addObject:](self->_modelKeyCommands, "addObject:", v12);
      objc_msgSend(v13, "uiKeyCommand");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "discoverabilityTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(v14, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v17, "length") != 0;

      }
      v18 = objc_msgSend(v14, "attributes");
      v19 = objc_msgSend(v14, "attributes");
      v20 = (v18 & 1) == 0 && v16;
      v21 = (v19 & 4) == 0 && v20;

      if (v21)
        -[NSMapTable setObject:forKey:](self->_displayableAppKeyCommandToModelShortcutMap, "setObject:forKey:", v13, v9);
      objc_msgSend(v13, "setBaseShortcutForAlternate:", v13);
      v11 = v27;
      if (v7)
      {
        -[NSMapTable objectForKey:](self->_appKeyCommandToModelKeyCommandMap, "objectForKey:", v6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](self->_modelKeyCommandToModelShortcutMap, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "alternatesMap");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v13, v7);

          objc_msgSend(v13, "setAlternateForBaseShortcut:", v7);
          objc_msgSend(v13, "setBaseShortcutForAlternate:", v24);
          if (v21)
          {
            objc_msgSend(v24, "displayableAlternates");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v7);

          }
        }

      }
    }

  }
}

- (BOOL)_isKeyCommandPerformable:(id)a3 outTarget:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  objc_msgSend((id)UIApp, "_unswizzledTargetInChainForAction:sender:", objc_msgSend(v6, "action"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  -[_UIMenuLeafValidation validatedCommandForTarget:command:alternate:sender:](self->_validation, "validatedCommandForTarget:command:alternate:sender:", v8, v6, 0, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9 == v6;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v9, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v12);

    objc_msgSend(v10, "discoverabilityTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDiscoverabilityTitle:", v13);

    objc_msgSend(v6, "setAttributes:", objc_msgSend(v10, "attributes"));
  }
  if (v8)
    v14 = (objc_msgSend(v6, "attributes") & 1) == 0;
  else
    v14 = 0;

  return v14;
}

- (id)_validatedHUDMenuFromUIMenu:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id obj;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __54___UIKeyShortcutHUDModel__validatedHUDMenuFromUIMenu___block_invoke;
        v17[3] = &unk_1E16CD1E8;
        v17[4] = self;
        v18 = v5;
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __54___UIKeyShortcutHUDModel__validatedHUDMenuFromUIMenu___block_invoke_2;
        v15[3] = &unk_1E16CD2A8;
        v15[4] = self;
        v16 = v18;
        objc_msgSend(v11, "_acceptMenuVisit:leafVisit:", v17, v15);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  +[_UIKeyShortcutHUDMenu menuWithUIMenu:children:](_UIKeyShortcutHUDMenu, "menuWithUIMenu:children:", v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_finalizedHUDMenuFromValidatedHUDMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = (void *)objc_opt_new();
        -[_UIKeyShortcutHUDModel _addShortcutsFromHUDMenu:toShortcutsArray:](self, "_addShortcutsFromHUDMenu:toShortcutsArray:", v11, v12);
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v11, "menuByReplacingChildren:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "menuByReplacingChildren:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_addShortcutsFromHUDMenu:(id)a3 toShortcutsArray:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __68___UIKeyShortcutHUDModel__addShortcutsFromHUDMenu_toShortcutsArray___block_invoke;
        v16[3] = &unk_1E16CD2D0;
        v16[4] = self;
        v17 = v6;
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __68___UIKeyShortcutHUDModel__addShortcutsFromHUDMenu_toShortcutsArray___block_invoke_2;
        v14[3] = &unk_1E16CD2F8;
        v15 = v17;
        objc_msgSend(v12, "_acceptMenuVisit:shortcutVisit:", v16, v14);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_modelKeyCommandToModelShortcutMap, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activeShortcuts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_menu, CFSTR("menu"));

}

- (_UIKeyShortcutHUDModel)initWithCoder:(id)a3
{
  id v4;
  _UIKeyShortcutHUDModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _UIKeyShortcutHUDMenu *menu;
  void *v23;
  int v24;
  NSMutableSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_UIKeyShortcutHUDModel init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("activeShortcuts"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v15);
          objc_msgSend(v16, "uiKeyCommand");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKeyShortcutHUDModel modelKeyCommands](v5, "modelKeyCommands");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v17);

          -[_UIKeyShortcutHUDModel modelKeyCommandToModelShortcutMap](v5, "modelKeyCommandToModelShortcutMap");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v16, v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v13);
    }

    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, CFSTR("menu"));
    v21 = objc_claimAutoreleasedReturnValue();
    menu = v5->_menu;
    v5->_menu = (_UIKeyShortcutHUDMenu *)v21;

    if ((objc_msgSend((id)UIApp, "_disableLayoutAwareShortcuts") & 1) == 0)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "_isHardwareKeyboardAvailable");

      if (v24)
        v5->_gsKeyboard = (__GSKeyboard *)objc_msgSend((id)UIApp, "_hardwareKeyboard");
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v25 = v5->_modelKeyCommands;
    v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v32;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v29++), "_localizeWithGSKeyboard:automatically:force:", v5->_gsKeyboard, _UIGetEnableLayoutAwareShortcutsAutomatic(), 0);
        }
        while (v27 != v29);
        v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v27);
    }

    v5->_gsKeyboard = 0;
  }

  return v5;
}

- (_UIKeyShortcutHUDMenu)menu
{
  return self->_menu;
}

- (NSMutableSet)modelKeyCommands
{
  return self->_modelKeyCommands;
}

- (void)setModelKeyCommands:(id)a3
{
  objc_storeStrong((id *)&self->_modelKeyCommands, a3);
}

- (NSMapTable)modelKeyCommandToModelShortcutMap
{
  return self->_modelKeyCommandToModelShortcutMap;
}

- (void)setModelKeyCommandToModelShortcutMap:(id)a3
{
  objc_storeStrong((id *)&self->_modelKeyCommandToModelShortcutMap, a3);
}

- (NSMutableDictionary)modelKeyCommandToAppKeyCommandMap
{
  return self->_modelKeyCommandToAppKeyCommandMap;
}

- (void)setModelKeyCommandToAppKeyCommandMap:(id)a3
{
  objc_storeStrong((id *)&self->_modelKeyCommandToAppKeyCommandMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelKeyCommandToAppKeyCommandMap, 0);
  objc_storeStrong((id *)&self->_modelKeyCommandToModelShortcutMap, 0);
  objc_storeStrong((id *)&self->_modelKeyCommands, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_validation, 0);
  objc_storeStrong((id *)&self->_appKeyCommandToModelKeyCommandMap, 0);
  objc_storeStrong((id *)&self->_equivalentKeyCommandsInPriorityAlreadyEnumerated, 0);
  objc_storeStrong((id *)&self->_performableAppKeyCommands, 0);
  objc_storeStrong((id *)&self->_displayableAppKeyCommandToModelShortcutMap, 0);
}

@end
