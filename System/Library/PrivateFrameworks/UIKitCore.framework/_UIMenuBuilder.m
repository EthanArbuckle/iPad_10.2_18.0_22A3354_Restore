@implementation _UIMenuBuilder

- (void)setSystem:(id)a3
{
  objc_storeWeak((id *)&self->_system, a3);
}

- (_UIMenuBuilder)initWithRootMenu:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v9;
  void *v10;
  id v11[6];
  _OWORD v12[3];

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.menu.root"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 201, CFSTR("initial root menu needs root identifier"));

  }
  memset(v12, 0, sizeof(v12));
  _UIAnalyzeMenu((uint64_t)v12, v5);
  if (!*((_QWORD *)&v12[0] + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 205, CFSTR("initial root menu inconsistent"));

  }
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40(v11, (id *)v12);
  if (self)
    self = -[_UIMenuBuilder initWithSystem:analysis:](self, "initWithSystem:analysis:", 0, v11);
  else
    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40(v11);
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)v12);

  return self;
}

- (_UIMenuBuilder)initWithSystem:(id)a3 analysis:(id *)a4
{
  id v6;
  _UIMenuBuilder *v7;
  _UIMenuBuilder *v8;
  NSArray *keyCommandsCache;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIMenuBuilder;
  v7 = -[_UIMenuBuilder init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_system, v6);
    objc_storeStrong((id *)&v8->_analysis.keyCommands, a4->var0);
    objc_storeStrong((id *)&v8->_analysis.menus, a4->var1);
    objc_storeStrong((id *)&v8->_analysis.actions, a4->var2);
    objc_storeStrong((id *)&v8->_analysis.commands, a4->var3);
    objc_storeStrong((id *)&v8->_analysis.parentMenuIdentifiers, a4->var4);
    objc_storeStrong((id *)&v8->_analysis.commandParentMenuIdentifiers, a4->var5);
    keyCommandsCache = v8->_keyCommandsCache;
    v8->_keyCommandsCache = 0;

  }
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40(&a4->var0);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIMenuBuilder *v4;
  id WeakRetained;
  id v7[6];

  v4 = [_UIMenuBuilder alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_system);
  v7[1] = (id)-[NSMutableDictionary mutableCopy](self->_analysis.menus, "mutableCopy", -[NSMutableSet mutableCopy](self->_analysis.keyCommands, "mutableCopy"));
  v7[2] = (id)-[NSMutableDictionary mutableCopy](self->_analysis.actions, "mutableCopy");
  v7[3] = (id)-[_UICommandIdentifierDictionary copy](self->_analysis.commands, "copy");
  v7[4] = (id)-[NSMutableDictionary mutableCopy](self->_analysis.parentMenuIdentifiers, "mutableCopy");
  v7[5] = (id)-[_UICommandIdentifierDictionary copy](self->_analysis.commandParentMenuIdentifiers, "copy");
  if (v4)
    v4 = -[_UIMenuBuilder initWithSystem:analysis:](v4, "initWithSystem:analysis:", WeakRetained, v7);
  else
    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40(v7);

  return v4;
}

- (id)menuForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_analysis.menus, "objectForKeyedSubscript:", a3);
}

- (id)actionForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_analysis.actions, "objectForKey:", a3);
}

- (id)commandForAction:(SEL)a3 propertyList:(id)a4
{
  return -[_UICommandIdentifierDictionary objectForAction:propertyList:](self->_analysis.commands, "objectForAction:propertyList:", a3, a4);
}

- (void)_setNeedsRecacheCommands
{
  NSArray *keyCommandsCache;

  keyCommandsCache = self->_keyCommandsCache;
  self->_keyCommandsCache = 0;

}

- (void)_recacheCommandsIfNeeded
{
  NSArray *v3;
  void *v4;
  NSArray *keyCommandsCache;

  if (!self->_keyCommandsCache)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", CFSTR("com.apple.menu.root"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIRecursivelyCacheCommandsInMenu(v4, v3);

    keyCommandsCache = self->_keyCommandsCache;
    self->_keyCommandsCache = v3;

  }
}

- (NSArray)_keyCommands
{
  -[_UIMenuBuilder _recacheCommandsIfNeeded](self, "_recacheCommandsIfNeeded");
  return self->_keyCommandsCache;
}

- (id)_parentOfMenuForIdentifier:(id)a3 commandForIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UICommandIdentifierDictionary *commandParentMenuIdentifiers;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    commandParentMenuIdentifiers = self->_analysis.commandParentMenuIdentifiers;
    v11 = objc_msgSend(v8, "action");
    objc_msgSend(v9, "propertyList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICommandIdentifierDictionary objectForAction:propertyList:](commandParentMenuIdentifiers, "objectForAction:propertyList:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_analysis.parentMenuIdentifiers, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 262, CFSTR("no identifier"));

    v13 = 0;
  }

  return v13;
}

- (id)_firstValidMenuWithinIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)_isInternallyConsistent
{
  void *v3;
  BOOL v4;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_analysis.parentMenuIdentifiers, "objectForKeyedSubscript:", CFSTR("com.apple.menu.root"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", CFSTR("com.apple.menu.root"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    _UIAnalyzeMenu((uint64_t)&v7, v5);
    v4 = *((_QWORD *)&v7 + 1)
      && -[NSMutableSet isEqualToSet:](self->_analysis.keyCommands, "isEqualToSet:", (_QWORD)v7)
      && -[NSMutableDictionary isEqualToDictionary:](self->_analysis.menus, "isEqualToDictionary:", *((_QWORD *)&v7 + 1))&& -[NSMutableDictionary isEqualToDictionary:](self->_analysis.actions, "isEqualToDictionary:", (_QWORD)v8)&& -[_UICommandIdentifierDictionary isEqual:](self->_analysis.commands, "isEqual:", *((_QWORD *)&v8 + 1))&& -[NSMutableDictionary isEqualToDictionary:](self->_analysis.parentMenuIdentifiers, "isEqualToDictionary:", (_QWORD)v9)&& -[_UICommandIdentifierDictionary isEqual:](self->_analysis.commandParentMenuIdentifiers, "isEqual:", *((_QWORD *)&v9 + 1));
    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)&v7);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_replaceMenu:(id)a3 withMenu:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *menus;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *i;
  NSMutableDictionary *parentMenuIdentifiers;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  menus = self->_analysis.menus;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](menus, "setObject:forKeyedSubscript:", v7, v9);

  v23 = v6;
  v10 = v7;
  v11 = 0;
  v12 = v10;
  for (i = v23; ; i = v11)
  {
    parentMenuIdentifiers = self->_analysis.parentMenuIdentifiers;
    objc_msgSend(i, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](parentMenuIdentifiers, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      break;
    objc_msgSend(v17, "children");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v19, "setObject:atIndexedSubscript:", v12, objc_msgSend(v19, "indexOfObject:", i));
    v11 = v17;

    objc_msgSend(v11, "menuByReplacingChildren:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = self->_analysis.menus;
    objc_msgSend(v20, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, v22);

    v12 = v20;
  }

}

- (void)replaceMenuForIdentifier:(id)a3 withMenu:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableDictionary *parentMenuIdentifiers;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
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
  id obj[2];
  id v69[2];
  id v70[2];
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.menu.root")))
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.menu.root"));

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 321, CFSTR("cannot replace root with non-root"));

    }
  }
  ++self->__changeCount;
  *(_OWORD *)v69 = 0u;
  *(_OWORD *)v70 = 0u;
  *(_OWORD *)obj = 0u;
  _UIAnalyzeMenu((uint64_t)obj, v7);
  if (!obj[1])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 327, CFSTR("replacement menu has duplicate submenu, command or key command, or a key command is missing input or action"));

  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.menu.root")))
  {
    objc_storeStrong((id *)&self->_analysis.keyCommands, obj[0]);
    objc_storeStrong((id *)&self->_analysis.menus, obj[1]);
    objc_storeStrong((id *)&self->_analysis.actions, v69[0]);
    objc_storeStrong((id *)&self->_analysis.commands, v69[1]);
    objc_storeStrong((id *)&self->_analysis.parentMenuIdentifiers, v70[0]);
    objc_storeStrong((id *)&self->_analysis.commandParentMenuIdentifiers, v70[1]);
LABEL_8:
    -[_UIMenuBuilder _setNeedsRecacheCommands](self, "_setNeedsRecacheCommands");
    ++self->__actualChangeCount;
    goto LABEL_40;
  }
  -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v66 = 0u;
    v67 = 0u;
    v65 = 0u;
    _UIAnalyzeMenu((uint64_t)&v65, v11);
    if (!*((_QWORD *)&v65 + 1))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 346, CFSTR("old menu inconsistent"));

    }
    v12 = (void *)-[NSMutableSet mutableCopy](self->_analysis.keyCommands, "mutableCopy");
    objc_msgSend(v12, "minusSet:", (_QWORD)v65);
    v54 = v11;
    if (objc_msgSend(v12, "intersectsSet:", obj[0]))
    {
      _UILogSetDuplicatesExisting(obj[0], v12);
      v13 = 1;
    }
    else
    {
      v53 = v12;
      v14 = (void *)-[NSMutableDictionary mutableCopy](self->_analysis.menus, "mutableCopy");
      objc_msgSend(*((id *)&v65 + 1), "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectsForKeys:", v15);

      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v16 = obj[1];
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v62;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v62 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v29 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(obj[1], "allKeys");
              v55 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setWithArray:", v55);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v14, "allKeys");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setWithArray:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              _UILogSetDuplicatesExisting(v26, v32);

              goto LABEL_37;
            }
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
          if (v17)
            continue;
          break;
        }
      }

      v16 = (id)-[NSMutableDictionary mutableCopy](self->_analysis.actions, "mutableCopy");
      objc_msgSend((id)v66, "allKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectsForKeys:", v21);

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = v69[0];
      v22 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v58;
        while (2)
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v58 != v23)
              objc_enumerationMutation(v55);
            objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v33 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v69[0], "allKeys");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setWithArray:", v26);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v16, "allKeys");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setWithArray:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              _UILogSetDuplicatesExisting(v34, v37);

              goto LABEL_37;
            }
          }
          v22 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
          if (v22)
            continue;
          break;
        }
      }

      v55 = (id)-[_UICommandIdentifierDictionary copy](self->_analysis.commands, "copy");
      objc_msgSend(v55, "removeEntriesFromDictionary:", *((_QWORD *)&v66 + 1));
      if (objc_msgSend(v55, "intersectsEntriesFromDictionary:", v69[1]))
      {
        objc_msgSend(v69[1], "intersectingIdentifiersFromDictionary:", v55);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = _UILogCommandIdentifierDictionaryDuplicatesExisting___s_category;
        if (!_UILogCommandIdentifierDictionaryDuplicatesExisting___s_category)
        {
          v27 = __UILogCategoryGetNode("MenuBuilder", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v27, (unint64_t *)&_UILogCommandIdentifierDictionaryDuplicatesExisting___s_category);
        }
        v28 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v74 = v26;
          _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Duplicates existing -- \n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", buf, 0xCu);
        }
LABEL_37:
        v13 = 1;
      }
      else
      {
        objc_msgSend(v53, "unionSet:", obj[0]);
        objc_msgSend(v14, "addEntriesFromDictionary:", obj[1]);
        objc_msgSend(v16, "addEntriesFromDictionary:", v69[0]);
        objc_msgSend(v55, "addEntriesFromDictionary:", v69[1]);
        objc_storeStrong((id *)&self->_analysis.keyCommands, v53);
        objc_storeStrong((id *)&self->_analysis.menus, v14);
        objc_storeStrong((id *)&self->_analysis.actions, v16);
        objc_storeStrong((id *)&self->_analysis.commands, v55);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_analysis.parentMenuIdentifiers, "objectForKeyedSubscript:", v6);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 397, CFSTR("no such parent"));

        }
        -[NSMutableDictionary removeObjectForKey:](self->_analysis.parentMenuIdentifiers, "removeObjectForKey:", v6);
        parentMenuIdentifiers = self->_analysis.parentMenuIdentifiers;
        objc_msgSend((id)v67, "allKeys");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectsForKeys:](parentMenuIdentifiers, "removeObjectsForKeys:", v39);

        -[NSMutableDictionary addEntriesFromDictionary:](self->_analysis.parentMenuIdentifiers, "addEntriesFromDictionary:", v70[0]);
        v40 = self->_analysis.parentMenuIdentifiers;
        objc_msgSend(v7, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v26, v41);

        -[_UICommandIdentifierDictionary removeEntriesFromDictionary:](self->_analysis.commandParentMenuIdentifiers, "removeEntriesFromDictionary:", *((_QWORD *)&v67 + 1));
        -[_UICommandIdentifierDictionary addEntriesFromDictionary:](self->_analysis.commandParentMenuIdentifiers, "addEntriesFromDictionary:", v70[1]);
        objc_msgSend(v7, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v40) = objc_msgSend(v42, "isEqualToString:", v6);

        if ((_DWORD)v40)
        {
          -[_UIMenuBuilder _replaceMenu:withMenu:](self, "_replaceMenu:withMenu:", v54, v7);
        }
        else
        {
          -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v26);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v43)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 414, CFSTR("no such parent menu"));

          }
          objc_msgSend(v43, "children");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v44, "mutableCopy");

          v46 = objc_msgSend(v45, "indexOfObject:", v54);
          if (v46 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 417, CFSTR("menu not found in parent"));

          }
          objc_msgSend(v45, "setObject:atIndexedSubscript:", v7, v46);
          objc_msgSend(v43, "menuByReplacingChildren:", v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIMenuBuilder _replaceMenu:withMenu:](self, "_replaceMenu:withMenu:", v43, v47);

        }
        v13 = 0;
      }

      v12 = v53;
    }

    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)&v65);
    if (!v13)
      goto LABEL_8;
  }
LABEL_40:
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40(obj);

}

- (void)replaceChildrenOfMenuForIdentifier:(id)a3 fromChildrenBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "menuByReplacingChildren:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMenuBuilder replaceMenuForIdentifier:withMenu:](self, "replaceMenuForIdentifier:withMenu:", v12, v11);

  }
}

- (void)_insertMenu:(id)a3 intoParentMenu:(id)a4 newParentMenu:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableDictionary *parentMenuIdentifiers;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
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
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  _UIAnalyzeMenu((uint64_t)&v50, v9);
  if (!*((_QWORD *)&v50 + 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 443, CFSTR("inserted menu has duplicate submenu, command or key command, or a key command is missing input or action"));

  }
  if (-[NSMutableSet intersectsSet:](self->_analysis.keyCommands, "intersectsSet:", (_QWORD)v50))
  {
    _UILogSetDuplicatesExisting((void *)v50, self->_analysis.keyCommands);
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v12 = *((id *)&v50 + 1);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v47 != v14)
            objc_enumerationMutation(v12);
          -[NSMutableDictionary objectForKey:](self->_analysis.menus, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v25 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(*((id *)&v50 + 1), "allKeys");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setWithArray:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x1E0C99E60];
            -[NSMutableDictionary allKeys](self->_analysis.menus, "allKeys");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setWithArray:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            _UILogSetDuplicatesExisting(v27, v30);

            goto LABEL_30;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v13)
          continue;
        break;
      }
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = (id)v51;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v43;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v17);
          -[NSMutableDictionary objectForKey:](self->_analysis.actions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j), (_QWORD)v42);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v31 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend((id)v51, "allKeys");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setWithArray:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)MEMORY[0x1E0C99E60];
            -[NSMutableDictionary allKeys](self->_analysis.actions, "allKeys");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setWithArray:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            _UILogSetDuplicatesExisting(v33, v36);

            goto LABEL_30;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        if (v18)
          continue;
        break;
      }
    }

    if (-[_UICommandIdentifierDictionary intersectsEntriesFromDictionary:](self->_analysis.commands, "intersectsEntriesFromDictionary:", *((_QWORD *)&v51 + 1)))
    {
      objc_msgSend(*((id *)&v51 + 1), "intersectingIdentifiersFromDictionary:", self->_analysis.commands);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = _UILogCommandIdentifierDictionaryDuplicatesExisting___s_category;
      if (!_UILogCommandIdentifierDictionaryDuplicatesExisting___s_category)
      {
        v23 = __UILogCategoryGetNode("MenuBuilder", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&_UILogCommandIdentifierDictionaryDuplicatesExisting___s_category);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v22;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Duplicates existing -- \n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", buf, 0xCu);
      }

    }
    else
    {
      -[NSMutableSet unionSet:](self->_analysis.keyCommands, "unionSet:", (_QWORD)v50);
      -[NSMutableDictionary addEntriesFromDictionary:](self->_analysis.menus, "addEntriesFromDictionary:", *((_QWORD *)&v50 + 1));
      -[NSMutableDictionary addEntriesFromDictionary:](self->_analysis.actions, "addEntriesFromDictionary:", (_QWORD)v51);
      -[_UICommandIdentifierDictionary addEntriesFromDictionary:](self->_analysis.commands, "addEntriesFromDictionary:", *((_QWORD *)&v51 + 1));
      -[NSMutableDictionary addEntriesFromDictionary:](self->_analysis.parentMenuIdentifiers, "addEntriesFromDictionary:", (_QWORD)v52);
      objc_msgSend(v10, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      parentMenuIdentifiers = self->_analysis.parentMenuIdentifiers;
      objc_msgSend(v9, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](parentMenuIdentifiers, "setObject:forKeyedSubscript:", v37, v39);

      -[_UICommandIdentifierDictionary addEntriesFromDictionary:](self->_analysis.commandParentMenuIdentifiers, "addEntriesFromDictionary:", *((_QWORD *)&v52 + 1));
      v11[2](v11);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIMenuBuilder _replaceMenu:withMenu:](self, "_replaceMenu:withMenu:", v10, v40);

      -[_UIMenuBuilder _setNeedsRecacheCommands](self, "_setNeedsRecacheCommands");
      ++self->__actualChangeCount;
    }
  }
LABEL_30:
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)&v50);

}

- (void)insertSiblingMenu:(id)a3 beforeMenuForIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _UIMenuBuilder *v18;
  id v19;
  SEL v20;

  v13 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.menu.root")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 492, CFSTR("cannot insert before root menu"));

  }
  ++self->__changeCount;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_analysis.parentMenuIdentifiers, "objectForKeyedSubscript:", v7, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 501, CFSTR("no such parent menu"));

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke;
    v15[3] = &unk_1E16DEB40;
    v16 = v9;
    v20 = a2;
    v17 = v7;
    v18 = self;
    v19 = v14;
    v10 = v9;
    -[_UIMenuBuilder _insertMenu:intoParentMenu:newParentMenu:](self, "_insertMenu:intoParentMenu:newParentMenu:", v19, v10, v15);

  }
}

- (void)insertSiblingMenu:(id)a3 afterMenuForIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _UIMenuBuilder *v18;
  id v19;
  SEL v20;

  v13 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.menu.root")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 518, CFSTR("cannot insert after root menu"));

  }
  ++self->__changeCount;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_analysis.parentMenuIdentifiers, "objectForKeyedSubscript:", v7, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 527, CFSTR("no such parent menu"));

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke;
    v15[3] = &unk_1E16DEB40;
    v16 = v9;
    v20 = a2;
    v17 = v7;
    v18 = self;
    v19 = v14;
    v10 = v9;
    -[_UIMenuBuilder _insertMenu:intoParentMenu:newParentMenu:](self, "_insertMenu:intoParentMenu:newParentMenu:", v19, v10, v15);

  }
}

- (void)insertChildMenu:(id)a3 atStartOfMenuForIdentifier:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a3;
  ++self->__changeCount;
  -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61___UIMenuBuilder_insertChildMenu_atStartOfMenuForIdentifier___block_invoke;
    v9[3] = &unk_1E16DEB68;
    v10 = v6;
    v11 = v8;
    -[_UIMenuBuilder _insertMenu:intoParentMenu:newParentMenu:](self, "_insertMenu:intoParentMenu:newParentMenu:", v11, v10, v9);

  }
}

- (void)insertChildMenu:(id)a3 atEndOfMenuForIdentifier:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v8 = a3;
  ++self->__changeCount;
  -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59___UIMenuBuilder_insertChildMenu_atEndOfMenuForIdentifier___block_invoke;
    v9[3] = &unk_1E16DEB68;
    v10 = v6;
    v11 = v8;
    -[_UIMenuBuilder _insertMenu:intoParentMenu:newParentMenu:](self, "_insertMenu:intoParentMenu:newParentMenu:", v11, v10, v9);

  }
}

- (void)removeMenuForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *menus;
  void *v9;
  NSMutableDictionary *actions;
  void *v11;
  NSMutableDictionary *parentMenuIdentifiers;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.menu.root")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 576, CFSTR("cannot remove root menu"));

  }
  ++self->__changeCount;
  -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_analysis.parentMenuIdentifiers, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 587, CFSTR("no such parent identifier"));

    }
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    _UIAnalyzeMenu((uint64_t)&v22, v6);
    if (!*((_QWORD *)&v22 + 1))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 591, CFSTR("old menu inconsistent"));

    }
    -[NSMutableSet minusSet:](self->_analysis.keyCommands, "minusSet:", (_QWORD)v22);
    menus = self->_analysis.menus;
    objc_msgSend(*((id *)&v22 + 1), "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](menus, "removeObjectsForKeys:", v9);

    actions = self->_analysis.actions;
    objc_msgSend((id)v23, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](actions, "removeObjectsForKeys:", v11);

    -[_UICommandIdentifierDictionary removeEntriesFromDictionary:](self->_analysis.commands, "removeEntriesFromDictionary:", *((_QWORD *)&v23 + 1));
    parentMenuIdentifiers = self->_analysis.parentMenuIdentifiers;
    objc_msgSend((id)v24, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](parentMenuIdentifiers, "removeObjectsForKeys:", v13);

    -[NSMutableDictionary removeObjectForKey:](self->_analysis.parentMenuIdentifiers, "removeObjectForKey:", v5);
    -[_UICommandIdentifierDictionary removeEntriesFromDictionary:](self->_analysis.commandParentMenuIdentifiers, "removeEntriesFromDictionary:", *((_QWORD *)&v24 + 1));
    -[_UIMenuBuilder menuForIdentifier:](self, "menuForIdentifier:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuBuilder.m"), 603, CFSTR("no such parent menu"));

    }
    objc_msgSend(v14, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "removeObject:", v6);
    objc_msgSend(v14, "menuByReplacingChildren:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMenuBuilder _replaceMenu:withMenu:](self, "_replaceMenu:withMenu:", v14, v17);

    -[_UIMenuBuilder _setNeedsRecacheCommands](self, "_setNeedsRecacheCommands");
    ++self->__actualChangeCount;

    __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)&v22);
  }

}

- (UIMenuSystem)system
{
  return (UIMenuSystem *)objc_loadWeakRetained((id *)&self->_system);
}

- (unint64_t)_changeCount
{
  return self->__changeCount;
}

- (unint64_t)_actualChangeCount
{
  return self->__actualChangeCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_system);
  objc_storeStrong((id *)&self->_keyCommandsCache, 0);
  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)&self->_analysis.keyCommands);
}

- (id)_internalDiffForDiffv1:(id)a3
{
  id v4;
  _UICommandInternalDiff *v5;
  uint64_t v6;
  _UICommandInternalDiff *v7;
  void *v8;
  _UICommandInternalDiff *v9;
  void *v10;
  _UICommandInternalDiff *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _UICommandInternalDiff *v20;
  _UICommandInternalDiff *v22;
  void *v23;
  id obj;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _UICommandInternalDiff *v39;
  _QWORD v40[5];
  _UICommandInternalDiff *v41;
  _QWORD v42[5];
  _UICommandInternalDiff *v43;
  _QWORD aBlock[5];
  _UICommandInternalDiff *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(_UICommandInternalDiff);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke;
  aBlock[3] = &unk_1E16E00A0;
  aBlock[4] = self;
  v7 = v5;
  v45 = v7;
  v8 = _Block_copy(aBlock);
  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_2;
  v42[3] = &unk_1E16E00C8;
  v42[4] = self;
  v9 = v7;
  v43 = v9;
  v10 = _Block_copy(v42);
  v40[0] = v6;
  v40[1] = 3221225472;
  v40[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_3;
  v40[3] = &unk_1E16E00F0;
  v40[4] = self;
  v11 = v9;
  v41 = v11;
  v12 = _Block_copy(v40);
  v38[0] = v6;
  v38[1] = 3221225472;
  v38[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_4;
  v38[3] = &unk_1E16E0118;
  v38[4] = self;
  v22 = v11;
  v39 = v22;
  v13 = _Block_copy(v38);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = v4;
  objc_msgSend(v4, "changes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v17);
        v32[0] = v6;
        v32[1] = 3221225472;
        v32[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_5;
        v32[3] = &unk_1E16E0140;
        v19 = v8;
        v33 = v19;
        v30[0] = v6;
        v30[1] = 3221225472;
        v30[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_6;
        v30[3] = &unk_1E16E0168;
        v31 = v12;
        v27[0] = v6;
        v27[1] = 3221225472;
        v27[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_7;
        v27[3] = &unk_1E16E0190;
        v28 = v19;
        v29 = v10;
        v25[0] = v6;
        v25[1] = 3221225472;
        v25[2] = __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_8;
        v25[3] = &unk_1E16E01B8;
        v26 = v13;
        objc_msgSend(v18, "acceptItemInsertionVisit:itemDeletionVisit:menuInsertionVisit:menuDeletionVisit:", v32, v30, v27, v25, v22);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v15);
  }

  v20 = v22;
  return v20;
}

- (void)_patchInternalDiff:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v4, "menuDeletes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        -[_UIMenuBuilder removeMenuForIdentifier:](self, "removeMenuForIdentifier:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v7);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v4, "itemDeletes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v14);
        objc_msgSend(v4, "itemDeletes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke;
        v49[3] = &unk_1E16B2B18;
        v50 = v17;
        v18 = v17;
        -[_UIMenuBuilder replaceChildrenOfMenuForIdentifier:fromChildrenBlock:](self, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", v15, v49);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v12);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v4, "inserts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v46;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v22);
        objc_msgSend(v4, "inserts");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_4;
        v43[3] = &unk_1E16B2B18;
        v44 = v25;
        v26 = v25;
        -[_UIMenuBuilder replaceChildrenOfMenuForIdentifier:fromChildrenBlock:](self, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", v23, v43);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    }
    while (v20);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v4, "replacements");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v40;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v31);
        objc_msgSend(v4, "replacements");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_3_16;
        v37[3] = &unk_1E16B2B18;
        v38 = v34;
        v35 = v34;
        -[_UIMenuBuilder replaceChildrenOfMenuForIdentifier:fromChildrenBlock:](self, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", v32, v37);

        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    }
    while (v29);
  }

}

- (void)_patch:(id)a3
{
  id v4;

  -[_UIMenuBuilder _internalDiffForDiffv1:](self, "_internalDiffForDiffv1:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIMenuBuilder _patchInternalDiff:](self, "_patchInternalDiff:", v4);

}

@end
