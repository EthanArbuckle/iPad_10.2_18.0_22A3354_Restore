@implementation _UIFocusGroup

+ (id)nullGroupWithCoordinateSpace:(id)a3
{
  id v3;
  _UIFocusNullGroup *v4;

  v3 = a3;
  v4 = -[_UIFocusGroup initWithIdentifier:parentGroup:coordinateSpace:]([_UIFocusNullGroup alloc], "initWithIdentifier:parentGroup:coordinateSpace:", CFSTR("com.apple.UIKit.null"), 0, v3);

  return v4;
}

- (_UIFocusGroup)initWithIdentifier:(id)a3 parentGroup:(id)a4 coordinateSpace:(id)a5
{
  id v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  void *v22;
  void *v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && objc_msgSend(v9, "length"))
  {
    if (v11)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusGroup.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier && identifier.length > 0"));

    if (v11)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusGroup.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace"));

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)_UIFocusGroup;
  v12 = -[_UIFocusGroup init](&v24, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    v14 = (void *)*((_QWORD *)v12 + 5);
    *((_QWORD *)v12 + 5) = v13;

    v15 = objc_opt_new();
    v16 = (void *)*((_QWORD *)v12 + 2);
    *((_QWORD *)v12 + 2) = v15;

    v17 = objc_opt_new();
    v18 = (void *)*((_QWORD *)v12 + 3);
    *((_QWORD *)v12 + 3) = v17;

    objc_storeStrong((id *)v12 + 7, a5);
    v19 = *MEMORY[0x1E0C9D628];
    v20 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v12 + 104) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v12 + 120) = v20;
    *(_OWORD *)(v12 + 72) = v19;
    *(_OWORD *)(v12 + 88) = v20;
    objc_storeWeak((id *)v12 + 6, v10);
    objc_msgSend(v10, "_insertChildGroup:", v12);
  }

  return (_UIFocusGroup *)v12;
}

- (id)_deepCopyWithNewIdentifierToGroupMap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CGPoint origin;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[_UIFocusGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[_UIFocusGroup coordinateSpace](self, "coordinateSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "initWithIdentifier:parentGroup:coordinateSpace:", v5, 0, v8);

    v9 = -[NSMutableArray mutableCopy](self->_items, "mutableCopy");
    v10 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v9;

    origin = self->_boundingBox.origin;
    *(CGSize *)(v6 + 120) = self->_boundingBox.size;
    *(CGPoint *)(v6 + 104) = origin;
    objc_storeStrong((id *)(v6 + 32), self->_primaryItem);
    *($546F5FAF285445718FA5F4302CBDC21D *)(v6 + 8) = self->_flags;
    objc_msgSend(v4, "setObject:forKey:", v6, v5);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[_UIFocusGroup childGroups](self, "childGroups", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "_deepCopyWithNewIdentifierToGroupMap:", v4);
          v17 = (id *)objc_claimAutoreleasedReturnValue();
          objc_storeWeak(v17 + 6, (id)v6);
          objc_msgSend((id)v6, "_insertChildGroup:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

  }
  return (id)v6;
}

- (void)_insertChildGroup:(id)a3
{
  -[NSMutableArray addObject:](self->_childGroups, "addObject:", a3);
  -[_UIFocusGroup _invalidateChildGroupOrder](self, "_invalidateChildGroupOrder");
}

- (void)_insertItem:(id)a3
{
  -[NSMutableArray addObject:](self->_items, "addObject:", a3);
  -[_UIFocusGroup _invalidateItemOrder](self, "_invalidateItemOrder");
}

- (void)_updateWithEnvironment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;
  CGRect v12;

  v5 = a3;
  v11 = v5;
  if (!self->_owningEnvironment)
  {
    objc_storeStrong((id *)&self->_owningEnvironment, a3);
    v5 = v11;
  }
  _UIFocusItemSafeCast(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v12.origin.x = _UIFocusItemFrameInCoordinateSpace(v6, self->_coordinateSpace);
    v12.origin.y = v8;
    v12.size.width = v9;
    v12.size.height = v10;
    self->_boundingBox = CGRectUnion(self->_boundingBox, v12);
  }

}

- (NSArray)childGroups
{
  -[_UIFocusGroup _validateChildGroupOrderIfNecessary](self, "_validateChildGroupOrderIfNecessary");
  return (NSArray *)(id)-[NSMutableArray copy](self->_childGroups, "copy");
}

- (NSArray)items
{
  -[_UIFocusGroup _validateItemOrderIfNecessary](self, "_validateItemOrderIfNecessary");
  return (NSArray *)(id)-[NSMutableArray copy](self->_items, "copy");
}

- (UIFocusItem)primaryItem
{
  -[_UIFocusGroup _validatePrimaryItemIfNecessary](self, "_validatePrimaryItemIfNecessary");
  return self->_primaryItem;
}

- (CGRect)primaryRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UIFocusGroup _validatePrimaryRectIfNeccessary](self, "_validatePrimaryRectIfNeccessary");
  x = self->_primaryRect.origin.x;
  y = self->_primaryRect.origin.y;
  width = self->_primaryRect.size.width;
  height = self->_primaryRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_invalidateItemOrder
{
  *(_BYTE *)&self->_flags &= ~1u;
  -[_UIFocusGroup _invalidatePrimaryItem](self, "_invalidatePrimaryItem");
}

- (void)_validateItemOrderIfNecessary
{
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    *(_BYTE *)&self->_flags |= 1u;
    if (-[NSMutableArray count](self->_items, "count"))
      -[NSMutableArray sortUsingComparator:](self->_items, "sortUsingComparator:", &__block_literal_global_369);
  }
}

- (void)_invalidateChildGroupOrder
{
  *(_BYTE *)&self->_flags &= ~2u;
  -[_UIFocusGroup _invalidatePrimaryRect](self, "_invalidatePrimaryRect");
}

- (void)_validateChildGroupOrderIfNecessary
{
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    *(_BYTE *)&self->_flags |= 2u;
    if (-[NSMutableArray count](self->_childGroups, "count"))
      -[NSMutableArray sortUsingComparator:](self->_childGroups, "sortUsingComparator:", &__block_literal_global_14_5);
  }
}

- (void)_invalidatePrimaryItem
{
  *(_BYTE *)&self->_flags &= ~4u;
  -[_UIFocusGroup _invalidatePrimaryRect](self, "_invalidatePrimaryRect");
}

- (void)_validatePrimaryItemIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  UIFocusItem *v20;
  UIFocusItem *primaryItem;
  void *v22;
  _UIFocusGroup *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    *(_BYTE *)&self->_flags |= 4u;
    if (-[NSMutableArray count](self->_items, "count"))
    {
      -[NSMutableArray firstObject](self->_items, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "focusedItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v4;
      objc_msgSend(v4, "_focusGroupHistory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusGroup identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastFocusedItemForGroupIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v23 = self;
      -[_UIFocusGroup items](self, "items");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = 0;
        v14 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            v17 = _UIFocusGroupPriorityForItem(v16, v5, v8);
            if (v17 > v13)
            {
              v18 = v17;
              v19 = v16;

              v12 = v19;
              v13 = v18;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      primaryItem = v23->_primaryItem;
      v23->_primaryItem = (UIFocusItem *)v12;

    }
    else
    {
      v20 = self->_primaryItem;
      self->_primaryItem = 0;

    }
  }
}

- (void)_invalidatePrimaryRect
{
  *(_BYTE *)&self->_flags &= ~8u;
}

- (void)_validatePrimaryRectIfNeccessary
{
  CGSize v3;
  UIFocusItem *v4;
  void *v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGSize size;
  UIFocusItem *v29;
  CGRect v30;

  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    *(_BYTE *)&self->_flags |= 8u;
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_primaryRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_primaryRect.size = v3;
    -[_UIFocusGroup _validatePrimaryItemIfNecessary](self, "_validatePrimaryItemIfNecessary");
    v4 = self->_primaryItem;
    if (v4
      || (-[_UIFocusGroup _validateItemOrderIfNecessary](self, "_validateItemOrderIfNecessary"),
          -[NSMutableArray firstObject](self->_items, "firstObject"),
          (v4 = (UIFocusItem *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v29 = v4;
      -[_UIFocusGroup coordinateSpace](self, "coordinateSpace");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = _UIFocusItemFrameInCoordinateSpace(v29, v5);
      v8 = v7;
      v10 = v9;
      v12 = v11;

      v30.origin.x = v6;
      v30.origin.y = v8;
      v30.size.width = v10;
      v30.size.height = v12;
      if (!CGRectIsNull(v30))
      {
        self->_primaryRect.origin.x = v6;
        self->_primaryRect.origin.y = v8;
        self->_primaryRect.size.width = v10;
        self->_primaryRect.size.height = v12;
LABEL_12:

        return;
      }
    }
    else
    {
      v29 = 0;
    }
    -[_UIFocusGroup _validateChildGroupOrderIfNecessary](self, "_validateChildGroupOrderIfNecessary");
    -[NSMutableArray firstObject](self->_childGroups, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[_UIFocusGroup coordinateSpace](self, "coordinateSpace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "primaryRect");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(v13, "coordinateSpace");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "convertRect:fromCoordinateSpace:", v23, v16, v18, v20, v22);
      self->_primaryRect.origin.x = v24;
      self->_primaryRect.origin.y = v25;
      self->_primaryRect.size.width = v26;
      self->_primaryRect.size.height = v27;

    }
    else
    {
      size = self->_boundingBox.size;
      self->_primaryRect.origin = self->_boundingBox.origin;
      self->_primaryRect.size = size;
    }

    goto LABEL_12;
  }
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _UIFocusGroup *v4;
  _UIFocusGroup *v5;
  BOOL v6;

  v4 = (_UIFocusGroup *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_UIFocusGroup isEqualToFocusGroup:](self, "isEqualToFocusGroup:", v5);

  return v6;
}

- (BOOL)isEqualToFocusGroup:(id)a3
{
  return -[NSString isEqual:](self->_identifier, "isEqual:", *((_QWORD *)a3 + 5));
}

- (id)description
{
  void *v3;
  NSString *identifier;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  NSStringFromCGRect(self->_boundingBox);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_primaryRect);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; boundingBox: %@; primaryRect: %@>"), identifier, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *identifier;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  NSStringFromCGRect(self->_boundingBox);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_primaryRect);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@; boundingBox: %@; primaryRect: %@; items: %@>"),
    v5,
    self,
    identifier,
    v7,
    v8,
    self->_items);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_UIFocusGroup)parentGroup
{
  return (_UIFocusGroup *)objc_loadWeakRetained((id *)&self->_parentGroup);
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UICoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (UIFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_destroyWeak((id *)&self->_parentGroup);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_primaryItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_childGroups, 0);
}

@end
