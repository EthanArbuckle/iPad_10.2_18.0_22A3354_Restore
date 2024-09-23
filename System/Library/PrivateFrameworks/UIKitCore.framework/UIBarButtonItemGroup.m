@implementation UIBarButtonItemGroup

- (id)_items
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

+ (UIBarButtonItemGroup)fixedGroupWithRepresentativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items
{
  NSArray *v5;
  UIBarButtonItem *v6;
  uint64_t v7;
  void *v8;

  v5 = items;
  v6 = representativeItem;
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBarButtonItems:representativeItem:", v5, v6);

  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

  *(_BYTE *)(v7 + 24) &= 0xCFu;
  return (UIBarButtonItemGroup *)(id)v7;
}

- (BOOL)reverseEnumerateVisibleItems:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    if ((*(_BYTE *)(a1 + 24) & 1) == 0)
    {
      v6 = *(void **)(a1 + 8);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __53__UIBarButtonItemGroup_reverseEnumerateVisibleItems___block_invoke;
      v8[3] = &unk_1E16B5A50;
      v9 = v3;
      v10 = &v11;
      objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v8);

      v5 = *((_BYTE *)v12 + 24) != 0;
    }
    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (void)setHidden:(BOOL)hidden
{
  char groupFlags;
  id v5;

  groupFlags = (char)self->_groupFlags;
  if (((((groupFlags & 1) == 0) ^ hidden) & 1) == 0)
  {
    *(_BYTE *)&self->_groupFlags = groupFlags & 0xFE | hidden;
    -[UIBarButtonItemGroup _owner](self, "_owner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_groupDidUpdateVisibility:", self);

  }
}

- (UIBarButtonItemGroup)init
{
  return -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](self, "initWithBarButtonItems:representativeItem:", MEMORY[0x1E0C9AA60], 0);
}

- (BOOL)_isCritical
{
  return 0;
}

- (NSArray)barButtonItems
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_barButtonItems, "copy");
}

- (BOOL)enumerateVisibleItems:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    if ((*(_BYTE *)(a1 + 24) & 1) == 0)
    {
      v6 = *(void **)(a1 + 8);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __46__UIBarButtonItemGroup_enumerateVisibleItems___block_invoke;
      v8[3] = &unk_1E16B5A50;
      v9 = v3;
      v10 = &v11;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

      v5 = *((_BYTE *)v12 + 24) != 0;
    }
    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (double)_contextualExpandedPadding
{
  return 0.0;
}

- (BOOL)isHidden
{
  return *(_BYTE *)&self->_groupFlags & 1;
}

void __46__UIBarButtonItemGroup_enumerateVisibleItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isHidden") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 0;
  }

}

void __53__UIBarButtonItemGroup_reverseEnumerateVisibleItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isHidden") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 0;
  }

}

- (BOOL)_canCollapse
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return *(_QWORD *)(result + 32)
        && (!dyld_program_sdk_at_least() || (objc_msgSend(*(id *)(v1 + 32), "isSpaceItem") & 1) == 0);
  }
  return result;
}

- (UIBarButtonItem)representativeItem
{
  return self->_representativeItem;
}

- (void)_setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void)setBarButtonItems:(NSArray *)barButtonItems
{
  NSArray *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = barButtonItems;
  if ((*(_BYTE *)&self->_groupFlags & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItemGroup.m"), 161, CFSTR("You cannot change the barButtonItems of system owned UIBarButtonItemGroups"));

  }
  if (!-[NSArray isEqualToArray:](v5, "isEqualToArray:", self->_barButtonItems))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_barButtonItems);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minusSet:", v7);

    }
    _UIBarButtonGroupCheckArguments(v5, self->_representativeItem);
    if (v5)
      v8 = v5;
    else
      v8 = (NSArray *)MEMORY[0x1E0C9AA60];
    v9 = (NSMutableArray *)-[NSArray mutableCopy](v8, "mutableCopy");
    v10 = self->_barButtonItems;
    self->_barButtonItems = v9;

    _UIBarButtonGroupAssign(self->_barButtonItems, self);
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "allObjects");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15++), "_setButtonGroup:isRepresentative:", 0, 0, (_QWORD)v18);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }

    }
    else
    {
      v11 = 0;
    }
    -[UIBarButtonItemGroup _owner](self, "_owner", (_QWORD)v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_groupDidUpdateItems:removedItems:", self, v11);

  }
}

- (_UIBarButtonItemGroupOwner)_owner
{
  return (_UIBarButtonItemGroupOwner *)objc_loadWeakRetained((id *)&self->_owner);
}

- (UIBarButtonItemGroup)initWithBarButtonItems:(NSArray *)barButtonItems representativeItem:(UIBarButtonItem *)representativeItem
{
  NSArray *v6;
  UIBarButtonItem *v7;
  UIBarButtonItemGroup *v8;
  NSArray *v9;
  uint64_t v10;
  NSMutableArray *v11;
  objc_super v13;

  v6 = barButtonItems;
  v7 = representativeItem;
  v13.receiver = self;
  v13.super_class = (Class)UIBarButtonItemGroup;
  v8 = -[UIBarButtonItemGroup init](&v13, sel_init);
  if (v8)
  {
    _UIBarButtonGroupCheckArguments(v6, v7);
    if (v6)
      v9 = v6;
    else
      v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    v10 = -[NSArray mutableCopy](v9, "mutableCopy");
    v11 = v8->_barButtonItems;
    v8->_barButtonItems = (NSMutableArray *)v10;

    _UIBarButtonGroupAssign(v8->_barButtonItems, v8);
    objc_storeStrong((id *)&v8->_representativeItem, representativeItem);
    _UIBarButtonGroupAssignRepresentative(v8->_representativeItem, v8);
  }

  return v8;
}

- (BOOL)_disabledExpansion
{
  return 0;
}

- (BOOL)_shouldAlwaysCollapse
{
  return self->_shouldAlwaysCollapse;
}

- (id)_customizationIdentifier
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)_relinquishOwnership:(uint64_t)a1
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  if (a1)
  {
    v2 = (id *)(a1 + 56);
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2);

    v4 = WeakRetained;
    if (WeakRetained == v3)
    {
      objc_storeWeak(v2, 0);
      v4 = WeakRetained;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__notifyWillRequestMenuRepresentation, 0);
  objc_storeStrong(&self->__notifyPrepareForLayout, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_menuRepresentation, 0);
  objc_storeStrong((id *)&self->_representativeItem, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);
}

- (void)setRepresentativeItem:(UIBarButtonItem *)representativeItem
{
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *v13;

  v5 = representativeItem;
  if ((*(_BYTE *)&self->_groupFlags & 2) != 0)
  {
    v13 = v5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItemGroup.m"), 218, CFSTR("You cannot change the representativeItem of system owned UIBarButtonItemGroups"));

    v5 = v13;
  }
  if (self->_representativeItem != v5)
  {
    v12 = v5;
    _UIBarButtonGroupCheckArguments(self->_barButtonItems, v5);
    _UIBarButtonGroupAssignRepresentative(self->_representativeItem, 0);
    v6 = self->_representativeItem;
    v7 = v12;
    v8 = self->_representativeItem;
    self->_representativeItem = v7;
    v9 = v6;

    _UIBarButtonGroupAssignRepresentative(self->_representativeItem, self);
    -[UIBarButtonItemGroup _owner](self, "_owner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_groupDidUpdateRepresentative:fromRepresentative:", self, v9);

    v5 = v12;
  }

}

- (void)_removeBarButtonItem:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (dyld_program_sdk_at_least())
  {
    if ((*(_BYTE *)&self->_groupFlags & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItemGroup.m"), 50, CFSTR("Taking barButtonItems from a system owned UIBarButtonItemGroup is not expected and may result in unexpected behavior."));

    }
  }
  else if ((*(_BYTE *)&self->_groupFlags & 2) != 0)
  {
    v10 = _removeBarButtonItem____s_category;
    if (!_removeBarButtonItem____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_removeBarButtonItem____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Taking barButtonItems from a system owned UIBarButtonItemGroup is not expected and may result in unexpected behavior.", v12, 2u);
    }
  }
  if (-[NSMutableArray count](self->_barButtonItems, "count"))
  {
    v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_barButtonItems, "indexOfObjectIdenticalTo:", v5);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_barButtonItems, "removeObjectAtIndex:", v7);
      -[UIBarButtonItemGroup _owner](self, "_owner");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_groupDidUpdateItems:removedItems:", self, v9);

    }
  }

}

- (void)_removeRepresentative:(id)a3
{
  UIBarButtonItem *v5;
  void *v6;
  UIBarButtonItem *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = (UIBarButtonItem *)a3;
  if (dyld_program_sdk_at_least())
  {
    if ((*(_BYTE *)&self->_groupFlags & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarButtonItemGroup.m"), 63, CFSTR("Taking barButtonItems from a system owned UIBarButtonItemGroup is not expected and may result in unexpected behavior."));

    }
  }
  else if ((*(_BYTE *)&self->_groupFlags & 2) != 0)
  {
    v9 = _removeRepresentative____s_category;
    if (!_removeRepresentative____s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_removeRepresentative____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Taking barButtonItems from a system owned UIBarButtonItemGroup is not expected and may result in unexpected behavior.", v11, 2u);
    }
  }
  if (self->_representativeItem == v5)
  {
    self->_representativeItem = 0;
    v7 = v5;

    -[UIBarButtonItemGroup _owner](self, "_owner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_groupDidUpdateRepresentative:fromRepresentative:", self, v7);

  }
}

- (UIBarButtonItemGroup)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIBarButtonItemGroup *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *barButtonItems;
  uint64_t v10;
  UIBarButtonItem *representativeItem;
  uint64_t v12;
  UIMenuElement *menuRepresentation;
  char v14;
  uint64_t v15;
  NSString *customizationIdentifier;
  objc_super v18;

  v4 = coder;
  v18.receiver = self;
  v18.super_class = (Class)UIBarButtonItemGroup;
  v5 = -[UIBarButtonItemGroup init](&v18, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBarButtonItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v6 = (void *)MEMORY[0x1E0C9AA60];
    v8 = objc_msgSend(v6, "mutableCopy");
    barButtonItems = v5->_barButtonItems;
    v5->_barButtonItems = (NSMutableArray *)v8;

    _UIBarButtonGroupAssign(v5->_barButtonItems, v5);
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIRepresentativeItem"));
    v10 = objc_claimAutoreleasedReturnValue();
    representativeItem = v5->_representativeItem;
    v5->_representativeItem = (UIBarButtonItem *)v10;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIMenuRepresentation"));
    v12 = objc_claimAutoreleasedReturnValue();
    menuRepresentation = v5->_menuRepresentation;
    v5->_menuRepresentation = (UIMenuElement *)v12;

    *(_BYTE *)&v5->_groupFlags = *(_BYTE *)&v5->_groupFlags & 0xFE | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIGroupHidden"));
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIShowInOverflow")))
      v14 = 8;
    else
      v14 = 0;
    *(_BYTE *)&v5->_groupFlags = *(_BYTE *)&v5->_groupFlags & 0xF7 | v14;
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UICustomizationIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    customizationIdentifier = v5->_customizationIdentifier;
    v5->_customizationIdentifier = (NSString *)v15;

    if (v5->_customizationIdentifier)
      *(_BYTE *)&v5->_groupFlags = (16
                                  * (-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UICustomizationDisposition")) & 3)) | *(_BYTE *)&v5->_groupFlags & 0xCF;
    _UIBarButtonGroupAssignRepresentative(v5->_representativeItem, v5);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSMutableArray *barButtonItems;
  UIBarButtonItem *representativeItem;
  UIMenuElement *menuRepresentation;
  char groupFlags;
  NSString *customizationIdentifier;
  id v10;

  v4 = a3;
  barButtonItems = self->_barButtonItems;
  v10 = v4;
  if (barButtonItems)
  {
    objc_msgSend(v4, "encodeObject:forKey:", barButtonItems, CFSTR("UIBarButtonItems"));
    v4 = v10;
  }
  representativeItem = self->_representativeItem;
  if (representativeItem)
  {
    objc_msgSend(v10, "encodeObject:forKey:", representativeItem, CFSTR("UIRepresentativeItem"));
    v4 = v10;
  }
  menuRepresentation = self->_menuRepresentation;
  if (menuRepresentation)
  {
    objc_msgSend(v10, "encodeObject:forKey:", menuRepresentation, CFSTR("UIMenuRepresentation"));
    v4 = v10;
  }
  groupFlags = (char)self->_groupFlags;
  if ((groupFlags & 1) != 0)
  {
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("UIGroupHidden"));
    v4 = v10;
    groupFlags = (char)self->_groupFlags;
  }
  if ((groupFlags & 8) != 0)
  {
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("UIShowInOverflow"));
    v4 = v10;
  }
  customizationIdentifier = self->_customizationIdentifier;
  if (customizationIdentifier)
  {
    objc_msgSend(v10, "encodeObject:forKey:", customizationIdentifier, CFSTR("UICustomizationIdentifier"));
    objc_msgSend(v10, "encodeInteger:forKey:", ((unint64_t)*(_BYTE *)&self->_groupFlags >> 4) & 3, CFSTR("UICustomizationDisposition"));
    v4 = v10;
  }

}

- (BOOL)isDisplayingRepresentativeItem
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIBarButtonItem view](self->_representativeItem, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)alwaysAvailable
{
  return (*(_BYTE *)&self->_groupFlags >> 3) & 1;
}

- (void)setAlwaysAvailable:(BOOL)alwaysAvailable
{
  char v3;

  if (alwaysAvailable)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_groupFlags = *(_BYTE *)&self->_groupFlags & 0xF7 | v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIBarButtonItemGroup;
  -[UIBarButtonItemGroup description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if ((*(_BYTE *)&self->_groupFlags & 1) != 0)
    objc_msgSend(v4, "appendString:", CFSTR(" hidden"));
  if (self->_customizationIdentifier)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" customizationIdentifier='%@'"), self->_customizationIdentifier);
    objc_msgSend(v4, "appendString:", off_1E16B5A70[((unint64_t)*(_BYTE *)&self->_groupFlags >> 4) & 3]);
  }
  if ((*(_BYTE *)&self->_groupFlags & 8) != 0)
    objc_msgSend(v4, "appendString:", CFSTR(" alwaysAvailable"));
  if (self->_representativeItem)
    objc_msgSend(v4, "appendFormat:", CFSTR(" representativeItem=%@"), self->_representativeItem);
  if (-[NSMutableArray count](self->_barButtonItems, "count"))
  {
    -[NSMutableArray componentsJoinedByString:](self->_barButtonItems, "componentsJoinedByString:", CFSTR("\n\t"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" barButtonItems={\n\t%@\n}"), v5);

  }
  if (self->_menuRepresentation)
    objc_msgSend(v4, "appendFormat:", CFSTR(" menuRepresentation=%@"), self->_menuRepresentation);
  return v4;
}

+ (UIBarButtonItemGroup)movableGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier representativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items
{
  NSArray *v7;
  UIBarButtonItem *v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v7 = items;
  v8 = representativeItem;
  v9 = customizationIdentifier;
  v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBarButtonItems:representativeItem:", v7, v8);

  v11 = -[NSString copy](v9, "copy");
  v12 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v11;

  *(_BYTE *)(v10 + 24) = *(_BYTE *)(v10 + 24) & 0xCF | 0x10;
  return (UIBarButtonItemGroup *)(id)v10;
}

+ (UIBarButtonItemGroup)optionalGroupWithCustomizationIdentifier:(NSString *)customizationIdentifier inDefaultCustomization:(BOOL)inDefaultCustomization representativeItem:(UIBarButtonItem *)representativeItem items:(NSArray *)items
{
  _BOOL4 v7;
  NSArray *v9;
  UIBarButtonItem *v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;

  v7 = inDefaultCustomization;
  v9 = items;
  v10 = representativeItem;
  v11 = customizationIdentifier;
  v12 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBarButtonItems:representativeItem:", v9, v10);

  v13 = -[NSString copy](v11, "copy");
  v14 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v13;

  if (v7)
    v15 = 32;
  else
    v15 = 48;
  *(_BYTE *)(v12 + 24) = *(_BYTE *)(v12 + 24) & 0xCF | v15;
  return (UIBarButtonItemGroup *)(id)v12;
}

- (void)setMenuRepresentation:(UIMenuElement *)menuRepresentation
{
  UIMenuElement *v4;
  UIMenuElement *v5;

  if (self->_menuRepresentation != menuRepresentation)
  {
    v4 = (UIMenuElement *)-[UIMenuElement copy](menuRepresentation, "copy");
    v5 = self->_menuRepresentation;
    self->_menuRepresentation = v4;

    -[UIBarButtonItemGroup _sendNeedsToolbarUpdate](self, "_sendNeedsToolbarUpdate");
  }
}

- (UIBarButtonItemGroup)initWithCustomizationIdentifier_dci:(id)a3 representativeItem:(id)a4 items:(id)a5
{
  return -[UIBarButtonItemGroup initWithCustomizationIdentifier_dci:inDefaultCustomization:representativeItem:items:](self, "initWithCustomizationIdentifier_dci:inDefaultCustomization:representativeItem:items:", a3, 1, a4, a5);
}

- (UIBarButtonItemGroup)initWithCustomizationIdentifier_dci:(id)a3 inDefaultCustomization:(BOOL)a4 representativeItem:(id)a5 items:(id)a6
{
  _BOOL4 v8;
  id v11;
  UIBarButtonItemGroup *v12;
  uint64_t v13;
  NSString *customizationIdentifier;
  char groupFlags;
  char v16;
  void *v17;

  v8 = a4;
  v11 = a3;
  v12 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](self, "initWithBarButtonItems:representativeItem:", a6, a5);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    customizationIdentifier = v12->_customizationIdentifier;
    v12->_customizationIdentifier = (NSString *)v13;

    groupFlags = (char)v12->_groupFlags;
    if (v12->_customizationIdentifier)
    {
      if (v8)
        v16 = groupFlags & 0xCF | 0x20;
      else
        v16 = groupFlags | 0x30;
      *(_BYTE *)&v12->_groupFlags = v16;
    }
    else
    {
      *(_BYTE *)&v12->_groupFlags = groupFlags & 0xCF;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("UIBarButtonItemGroup.m"), 358, CFSTR("Cannot create a group with inDefaultCustomization=NO and customizationIdentifier==nil"));

      }
    }
  }

  return v12;
}

- (NSString)_dci_customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (BOOL)_dci_isInDefaultCustomization
{
  if (self)
    LOBYTE(self) = (~*(_BYTE *)&self->_groupFlags & 0x30) != 0;
  return (char)self;
}

- (BOOL)_isSystemGroup
{
  if (self)
    LODWORD(self) = (*(_BYTE *)&self->_groupFlags >> 1) & 1;
  return (char)self;
}

- (double)_minimumLeadingSpace
{
  return 0.0;
}

- (double)_minimumTrailingSpace
{
  return 0.0;
}

- (id)_synthesizedMenuElements
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_barButtonItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isHidden", (_QWORD)v13) & 1) == 0)
        {
          objc_msgSend(v9, "_effectiveMenuRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_representativeItemMenu
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "_synthesizedMenuElements");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_effectiveMenuRepresentation
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  if (a1)
  {
    v2 = a1[9];
    if (v2)
      (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, a1);
    v3 = (void *)a1[5];
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(a1, "_synthesizedMenuElements");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count") == 1)
        objc_msgSend(v5, "firstObject");
      else
        +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, 0, 1, v5);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_validateAllItems
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_barButtonItems;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_executeValidationHandler", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[UIBarButtonItem _executeValidationHandler](self->_representativeItem, "_executeValidationHandler");
}

- (void)_ib_setCustomizationIdentifier:(id)a3
{
  NSString *v4;
  NSString *customizationIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  customizationIdentifier = self->_customizationIdentifier;
  self->_customizationIdentifier = v4;

  if (!self->_customizationIdentifier)
    *(_BYTE *)&self->_groupFlags &= 0xCFu;
}

- (void)_ib_setCustomizationDisposition:(int64_t)a3
{
  *(_BYTE *)&self->_groupFlags = *(_BYTE *)&self->_groupFlags & 0xCF | (16 * (a3 & 3));
}

- (UIMenuElement)menuRepresentation
{
  return self->_menuRepresentation;
}

- (id)_notifyPrepareForLayout
{
  return self->__notifyPrepareForLayout;
}

- (void)set_notifyPrepareForLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)_notifyWillRequestMenuRepresentation
{
  return self->__notifyWillRequestMenuRepresentation;
}

- (void)set_notifyWillRequestMenuRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)_expandStyle
{
  return self->_expandStyle;
}

- (void)_setExpandStyle:(unint64_t)a3
{
  self->_expandStyle = a3;
}

- (void)_setShouldAlwaysCollapse:(BOOL)a3
{
  self->_shouldAlwaysCollapse = a3;
}

@end
