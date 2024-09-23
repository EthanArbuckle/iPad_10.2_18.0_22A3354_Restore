@implementation _UIFocusGroupMap

- (_UIFocusGroupMap)initWithItems:(id)a3 coordinateSpace:(id)a4
{
  return -[_UIFocusGroupMap initWithItems:standInItemsMap:coordinateSpace:](self, "initWithItems:standInItemsMap:coordinateSpace:", a3, 0, a4);
}

- (_UIFocusGroupMap)initWithItems:(id)a3 standInItemsMap:(id)a4 coordinateSpace:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _UIFocusGroupMap *v13;
  _UIFocusGroupMap *v14;
  uint64_t v15;
  NSMapTable *environmentToGroupMap;
  uint64_t v17;
  NSMapTable *identifierToGroupMap;
  uint64_t v19;
  NSMapTable *identifierToPrimaryItemMap;
  uint64_t v21;
  _UIFocusGroup *nullGroup;
  void *v24;
  void *v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusGroupMap.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusGroupMap.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_UIFocusGroupMap;
  v13 = -[_UIFocusGroupMap init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_coordinateSpace, a5);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    environmentToGroupMap = v14->_environmentToGroupMap;
    v14->_environmentToGroupMap = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    identifierToGroupMap = v14->_identifierToGroupMap;
    v14->_identifierToGroupMap = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    identifierToPrimaryItemMap = v14->_identifierToPrimaryItemMap;
    v14->_identifierToPrimaryItemMap = (NSMapTable *)v19;

    +[_UIFocusGroup nullGroupWithCoordinateSpace:](_UIFocusGroup, "nullGroupWithCoordinateSpace:", v12);
    v21 = objc_claimAutoreleasedReturnValue();
    nullGroup = v14->_nullGroup;
    v14->_nullGroup = (_UIFocusGroup *)v21;

    objc_storeStrong((id *)&v14->_standInItemsMap, a4);
    -[_UIFocusGroupMap _indexItems:](v14, "_indexItems:", v9);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 56), self->_coordinateSpace);
  +[_UIFocusGroup nullGroupWithCoordinateSpace:](_UIFocusGroup, "nullGroupWithCoordinateSpace:", self->_coordinateSpace);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v5;

  v7 = -[NSMapTable copy](self->_standInItemsMap, "copy");
  v8 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v7;

  v9 = -[NSMapTable copy](self->_identifierToPrimaryItemMap, "copy");
  v10 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v9;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable keyEnumerator](self->_identifierToGroupMap, "keyEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nextObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    do
    {
      -[NSMapTable objectForKey:](self->_identifierToGroupMap, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "_deepCopyWithNewIdentifierToGroupMap:", v11);

      objc_msgSend(v12, "nextObject");
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    while (v17);
  }

  objc_storeStrong((id *)(v4 + 16), v11);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable keyEnumerator](self->_environmentToGroupMap, "keyEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "nextObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    do
    {
      -[NSMapTable objectForKey:](self->_environmentToGroupMap, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setObject:forKey:", v24, v21);
      objc_msgSend(v19, "nextObject");
      v25 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v25;
    }
    while (v25);
  }

  v26 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v18;

  return (id)v4;
}

- (void)_indexItems:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int has_internal_diagnostics;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id obj;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8);
        if (!v6)
        {
          +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (has_internal_diagnostics)
        {
          if (v6 != v11)
          {
            __UIFaultDebugAssertLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Indexing focus items of different focus systems in a single focus group map is unsupported and leads to undefined behavior. This is a UIKit bug.", buf, 2u);
            }

          }
        }
        else if (v6 != v11)
        {
          v15 = _indexItems____s_category;
          if (!_indexItems____s_category)
          {
            v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v15, (unint64_t *)&_indexItems____s_category);
          }
          v16 = *(NSObject **)(v15 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Indexing focus items of different focus systems in a single focus group map is unsupported and leads to undefined behavior. This is a UIKit bug.", buf, 2u);
          }
        }
        -[_UIFocusGroupMap _indexEnvironment:](self, "_indexEnvironment:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](self->_standInItemsMap, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(v12, "_insertItem:", v9);

        ++v8;
      }
      while (v5 != v8);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v5 = v17;
    }
    while (v17);
  }
  else
  {
    v6 = 0;
  }

}

- (id)_indexEnvironment:(id)a3
{
  id v5;
  _UIFocusGroup *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  _UIFocusGroup *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _UIFocusGroup *v15;
  _UIFocusGroup *v16;
  _UIFocusGroup *v17;
  void *v18;
  NSMapTable *identifierToGroupMap;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusGroupMap.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  if (self->_focusGroups)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusGroupMap.m"), 125, CFSTR("This map has already calculated its focus groups. Later changes in this map are not allowed. This is a UIKit bug."));

  }
  -[NSMapTable objectForKey:](self->_environmentToGroupMap, "objectForKey:", v5);
  v6 = (_UIFocusGroup *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_msgSend(v5, sel_allowsWeakReference);
    if (v5 && (v7 & 1) != 0)
    {
      _UIFocusGroupUnresolvedIdentifierForEnvironment(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[NSMapTable objectForKey:](self->_identifierToGroupMap, "objectForKey:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (_UIFocusGroup *)v9;
          -[NSMapTable setObject:forKey:](self->_environmentToGroupMap, "setObject:forKey:", v9, v5);
LABEL_23:
          -[_UIFocusGroup _updateWithEnvironment:](v10, "_updateWithEnvironment:", v5);
          v6 = v10;

          goto LABEL_24;
        }
      }
      objc_msgSend(v5, "parentFocusEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        if (!v8)
        {
          v10 = self->_nullGroup;
          goto LABEL_22;
        }
        v16 = [_UIFocusGroup alloc];
        -[_UIFocusGroupMap coordinateSpace](self, "coordinateSpace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[_UIFocusGroup initWithIdentifier:parentGroup:coordinateSpace:](v16, "initWithIdentifier:parentGroup:coordinateSpace:", v8, 0, v12);
        goto LABEL_19;
      }
      -[_UIFocusGroupMap _indexEnvironment:](self, "_indexEnvironment:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (v8)
          goto LABEL_15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusGroupMap.m"), 165, CFSTR("Found a parent environment but could not create a parent group. This is a UIKit bug."));

        if (v8)
        {
LABEL_15:
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v8, "isEqualToString:", v13);

          if (!v14)
          {
            v17 = [_UIFocusGroup alloc];
            -[_UIFocusGroupMap coordinateSpace](self, "coordinateSpace");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[_UIFocusGroup initWithIdentifier:parentGroup:coordinateSpace:](v17, "initWithIdentifier:parentGroup:coordinateSpace:", v8, v12, v18);

            goto LABEL_21;
          }
        }
      }
      v15 = v12;
LABEL_19:
      v10 = v15;
LABEL_21:

LABEL_22:
      -[NSMapTable setObject:forKey:](self->_environmentToGroupMap, "setObject:forKey:", v10, v5);
      identifierToGroupMap = self->_identifierToGroupMap;
      -[_UIFocusGroup identifier](v10, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](identifierToGroupMap, "setObject:forKey:", v10, v20);

      goto LABEL_23;
    }
    v6 = self->_nullGroup;
  }
LABEL_24:

  return v6;
}

- (NSArray)focusGroups
{
  NSArray *focusGroups;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  focusGroups = self->_focusGroups;
  if (!focusGroups)
  {
    v4 = (void *)objc_opt_new();
    __addChildFocusGroupsRecursively(self->_nullGroup, v4);
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    v6 = self->_focusGroups;
    self->_focusGroups = v5;

    focusGroups = self->_focusGroups;
  }
  return focusGroups;
}

- (NSArray)focusItems
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[_UIFocusGroupMap focusGroups](self, "focusGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "primaryItem", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(v9, "items");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
            continue;
        }
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (id)focusGroupForItem:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusGroupMap.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  -[NSMapTable objectForKey:](self->_environmentToGroupMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusGroupMap focusGroups](self, "focusGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; focusGroups: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)visualDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _UIASCIIArtFramesRenderer *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_UIFocusGroupMap focusGroups](self, "focusGroups", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "boundingBox");
        objc_msgSend(v9, "valueWithCGRect:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v11 = -[_UIASCIIArtFramesRenderer initWithFrames:]([_UIASCIIArtFramesRenderer alloc], "initWithFrames:", v3);
  -[_UIASCIIArtFramesRenderer visualDescription](v11, "visualDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (UICoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_focusGroups, 0);
  objc_storeStrong((id *)&self->_standInItemsMap, 0);
  objc_storeStrong((id *)&self->_nullGroup, 0);
  objc_storeStrong((id *)&self->_identifierToPrimaryItemMap, 0);
  objc_storeStrong((id *)&self->_identifierToGroupMap, 0);
  objc_storeStrong((id *)&self->_environmentToGroupMap, 0);
}

@end
