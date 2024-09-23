@implementation PXTilingChange

- (PXTilingChange)init
{
  PXTilingChange *result;
  __int128 v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXTilingChange;
  result = -[PXTilingChange init](&v5, sel_init);
  if (result)
  {
    v3 = *(_OWORD *)off_1E50B7FF8;
    v4 = *((_OWORD *)off_1E50B7FF8 + 1);
    result->_initialReferenceSize = *(CGSize *)off_1E50B8810;
    *(_OWORD *)&result->_initialContentInset.top = v3;
    *(_OWORD *)&result->_initialContentInset.bottom = v4;
  }
  return result;
}

- (BOOL)isIdentity
{
  void *v2;
  BOOL v3;

  -[PXTilingChange events](self, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)recordLayout:(id)a3
{
  id v5;
  PXTilingLayout **p_initialLayout;
  PXTilingLayout *initialLayout;
  id v8;

  v5 = a3;
  initialLayout = self->_initialLayout;
  p_initialLayout = &self->_initialLayout;
  if (!initialLayout)
  {
    v8 = v5;
    objc_storeStrong((id *)p_initialLayout, a3);
    v5 = v8;
  }

}

- (void)recordReferenceSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  if (PXSizeIsNull())
  {
    self->_initialReferenceSize.width = width;
    self->_initialReferenceSize.height = height;
  }
}

- (void)recordContentInset:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (PXEdgeInsetsIsNull())
  {
    self->_initialContentInset.top = top;
    self->_initialContentInset.left = left;
    self->_initialContentInset.bottom = bottom;
    self->_initialContentInset.right = right;
  }
}

- (void)recordCompositionInvalidationContexts:(id)a3
{
  NSArray *v4;
  NSArray *compositionInvalidationContexts;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (!self->_compositionInvalidationContexts)
    {
      v4 = (NSArray *)objc_msgSend(v6, "copy");
      goto LABEL_6;
    }
    if ((objc_msgSend(v6, "isEqualToArray:") & 1) == 0)
    {
      -[NSArray arrayByAddingObjectsFromArray:](self->_compositionInvalidationContexts, "arrayByAddingObjectsFromArray:", self->_compositionInvalidationContexts);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      compositionInvalidationContexts = self->_compositionInvalidationContexts;
      self->_compositionInvalidationContexts = v4;

    }
  }

}

- (void)addEvent:(id)a3
{
  id v4;
  NSMutableArray *events;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  events = self->_events;
  v8 = v4;
  if (!events)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_events;
    self->_events = v6;

    v4 = v8;
    events = self->_events;
  }
  -[NSMutableArray addObject:](events, "addObject:", v4);

}

- (NSArray)events
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_events, "copy");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  PXTilingLayout *initialLayout;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  initialLayout = self->_initialLayout;
  NSStringFromCGSize(self->_initialReferenceSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, initialLayout=%@, initialReferenceSize=%@, events=%@"), v4, self, initialLayout, v6, self->_events);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_compositionInvalidationContexts)
    objc_msgSend(v7, "appendFormat:", CFSTR(", compositionInvalidationContexts=%@"), self->_compositionInvalidationContexts);
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (PXTilingLayout)toLayout
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXTilingChange initialLayout](self, "initialLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXTilingChange events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 1)
        {
          objc_msgSend(v10, "layout");
          v11 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v11;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (PXTilingLayout *)v3;
}

- (CGSize)toReferenceSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;

  v23 = *MEMORY[0x1E0C80C00];
  -[PXTilingChange initialReferenceSize](self, "initialReferenceSize");
  v4 = v3;
  v6 = v5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PXTilingChange events](self, "events", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "type") == 2)
        {
          objc_msgSend(v13, "referenceSize");
          v4 = v14;
          v6 = v15;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  v16 = v4;
  v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)toContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  UIEdgeInsets result;

  v31 = *MEMORY[0x1E0C80C00];
  -[PXTilingChange initialContentInset](self, "initialContentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PXTilingChange events](self, "events", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reverseObjectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v17, "type") == 3)
        {
          objc_msgSend(v17, "contentInset");
          v4 = v18;
          v6 = v19;
          v8 = v20;
          v10 = v21;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  v22 = v4;
  v23 = v6;
  v24 = v8;
  v25 = v10;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (BOOL)coordinateSpaceDidChange
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  -[PXTilingChange events](self, "events", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "type") == 4)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)defaultAnimationOptionsForTilingController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXTilingChange compositionInvalidationContexts](self, "compositionInvalidationContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXTilingControllerCompositionInvalidationContext defaultAnimationOptionsForTilingController:withInvalidationContexts:](PXTilingControllerCompositionInvalidationContext, "defaultAnimationOptionsForTilingController:withInvalidationContexts:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)invalidationContexts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXTilingChange events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 5)
        {
          objc_msgSend(v9, "context");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (PXTilingLayout)initialLayout
{
  return self->_initialLayout;
}

- (CGSize)initialReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialReferenceSize.width;
  height = self->_initialReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)initialContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_initialContentInset.top;
  left = self->_initialContentInset.left;
  bottom = self->_initialContentInset.bottom;
  right = self->_initialContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSArray)compositionInvalidationContexts
{
  return self->_compositionInvalidationContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionInvalidationContexts, 0);
  objc_storeStrong((id *)&self->_initialLayout, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
