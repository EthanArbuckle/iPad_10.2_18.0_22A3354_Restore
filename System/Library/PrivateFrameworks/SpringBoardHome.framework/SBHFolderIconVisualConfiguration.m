@implementation SBHFolderIconVisualConfiguration

- (CGSize)gridCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_gridCellSize.width;
  height = self->_gridCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)gridCellSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_gridCellSpacing.width;
  height = self->_gridCellSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *(CGSize *)((char *)result + 8) = self->_gridCellSize;
    *(CGSize *)((char *)result + 24) = self->_gridCellSpacing;
  }
  return result;
}

- (SBHFolderIconVisualConfiguration)init
{
  SBHFolderIconVisualConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHFolderIconVisualConfiguration;
  result = -[SBHFolderIconVisualConfiguration init](&v9, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #8.0 }
    result->_gridCellSize = _Q0;
    __asm { FMOV            V0.2D, #2.0 }
    result->_gridCellSpacing = _Q0;
  }
  return result;
}

- (void)setGridCellSpacing:(CGSize)a3
{
  self->_gridCellSpacing = a3;
}

- (void)setGridCellSize:(CGSize)a3
{
  self->_gridCellSize = a3;
}

- (BOOL)isEqual:(id)a3
{
  SBHFolderIconVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;
  BOOL v8;

  v4 = (SBHFolderIconVisualConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v8 = (isKindOfClass & 1) != 0
      && (self->_gridCellSize.width == v4->_gridCellSize.width
        ? (v7 = self->_gridCellSize.height == v4->_gridCellSize.height)
        : (v7 = 0),
          v7)
      && self->_gridCellSpacing.height == v4->_gridCellSpacing.height
      && self->_gridCellSpacing.width == v4->_gridCellSpacing.width;
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_gridCellSize.width
                          + self->_gridCellSize.height
                          + self->_gridCellSpacing.width
                          + self->_gridCellSpacing.height);
}

- (NSString)description
{
  return (NSString *)-[SBHFolderIconVisualConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHFolderIconVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHFolderIconVisualConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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

  -[SBHFolderIconVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHFolderIconVisualConfiguration gridCellSize](self, "gridCellSize");
  v5 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("gridCellSize"));
  -[SBHFolderIconVisualConfiguration gridCellSpacing](self, "gridCellSpacing");
  v6 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("gridCellSpacing"));
  return v4;
}

@end
