@implementation SBContinuousExposeAutoLayoutSpace

- (SBContinuousExposeAutoLayoutSpace)initWithItems:(id)a3
{
  id v5;
  SBContinuousExposeAutoLayoutSpace *v6;
  uint64_t v7;
  NSArray *items;
  void *v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeAutoLayoutSpace;
  v6 = -[SBContinuousExposeAutoLayoutSpace init](&v11, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SBContinuousExposeAutoLayoutSpace.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

    }
    v7 = objc_msgSend(v5, "copy");
    items = v6->_items;
    v6->_items = (NSArray *)v7;

  }
  return v6;
}

- (id)autoLayoutItemForDisplayItemIfExists:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_items;
    v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "displayItem", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if (v11)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)autoLayoutItemForDisplayItem:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  -[SBContinuousExposeAutoLayoutSpace autoLayoutItemForDisplayItemIfExists:](self, "autoLayoutItemForDisplayItemIfExists:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeAutoLayoutSpace.m"), 55, CFSTR("Expected to get an auto layout item for displayItem: '%@' in auto layout space: '%@'"), v5, self);

  }
  return v6;
}

- (BOOL)containsDisplayItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBContinuousExposeAutoLayoutSpace autoLayoutItemForDisplayItemIfExists:](self, "autoLayoutItemForDisplayItemIfExists:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBContinuousExposeAutoLayoutSpace _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBContinuousExposeAutoLayoutSpace _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)_copyWithClass:(Class)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CGSize size;
  CGSize v14;
  CGSize v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "mutableCopy", (_QWORD)v17);
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend([a3 alloc], "initWithItems:", v5);
  objc_storeStrong((id *)(v12 + 24), self->_configuration);
  size = self->_boundingBox.size;
  *(CGPoint *)(v12 + 32) = self->_boundingBox.origin;
  *(CGSize *)(v12 + 48) = size;
  v14 = self->_stageArea.size;
  *(CGPoint *)(v12 + 64) = self->_stageArea.origin;
  *(CGSize *)(v12 + 80) = v14;
  v15 = self->_compactedBoundingBox.size;
  *(CGPoint *)(v12 + 96) = self->_compactedBoundingBox.origin;
  *(CGSize *)(v12 + 112) = v15;
  *(_BYTE *)(v12 + 8) = self->_stripVisible;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  SBContinuousExposeAutoLayoutSpace *v4;
  uint64_t v5;
  SBContinuousExposeAutoLayoutSpace *v6;
  SBContinuousExposeAutoLayoutSpace *v7;
  BOOL v8;
  CGRect *v9;
  void *v10;
  objc_super v12;

  v4 = (SBContinuousExposeAutoLayoutSpace *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeAutoLayoutSpace;
    if (-[SBContinuousExposeAutoLayoutSpace isEqual:](&v12, sel_isEqual_, v4))
    {
      v5 = objc_opt_class();
      v6 = v4;
      if (v5)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
      v9 = v7;

      if (v9)
      {
        -[CGRect items](v9, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = BSEqualArrays()
          && CGRectEqualToRect(self->_boundingBox, v9[1])
          && CGRectEqualToRect(self->_stageArea, v9[2])
          && CGRectEqualToRect(self->_compactedBoundingBox, v9[3])
          && self->_stripVisible == LOBYTE(v9->origin.y);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_items);
  v5 = (id)objc_msgSend(v3, "appendCGRect:", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  v6 = (id)objc_msgSend(v3, "appendCGRect:", self->_stageArea.origin.x, self->_stageArea.origin.y, self->_stageArea.size.width, self->_stageArea.size.height);
  v7 = (id)objc_msgSend(v3, "appendCGRect:", self->_compactedBoundingBox.origin.x, self->_compactedBoundingBox.origin.y, self->_compactedBoundingBox.size.width, self->_compactedBoundingBox.size.height);
  v8 = (id)objc_msgSend(v3, "appendBool:", self->_stripVisible);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (id)description
{
  return -[SBContinuousExposeAutoLayoutSpace descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBContinuousExposeAutoLayoutSpace succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBContinuousExposeAutoLayoutSpace descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[SBContinuousExposeAutoLayoutSpace succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("stageArea"), self->_stageArea.origin.x, self->_stageArea.origin.y, self->_stageArea.size.width, self->_stageArea.size.height);
  v6 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("boundingBox"), self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", self->_items, CFSTR("items"), 0);
  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (SBContinuousExposeAutoLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
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

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (CGRect)stageArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_stageArea.origin.x;
  y = self->_stageArea.origin.y;
  width = self->_stageArea.size.width;
  height = self->_stageArea.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStageArea:(CGRect)a3
{
  self->_stageArea = a3;
}

- (CGRect)compactedBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_compactedBoundingBox.origin.x;
  y = self->_compactedBoundingBox.origin.y;
  width = self->_compactedBoundingBox.size.width;
  height = self->_compactedBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCompactedBoundingBox:(CGRect)a3
{
  self->_compactedBoundingBox = a3;
}

- (BOOL)isStripVisible
{
  return self->_stripVisible;
}

- (void)setStripVisible:(BOOL)a3
{
  self->_stripVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
