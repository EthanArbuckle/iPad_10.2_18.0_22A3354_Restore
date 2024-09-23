@implementation SBHFloatingDockVisualConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
    *(CGSize *)((char *)result + 8) = self->_maximumEditingIconSize;
  return result;
}

- (void)setMaximumEditingIconSize:(CGSize)a3
{
  self->_maximumEditingIconSize = a3;
}

- (BOOL)isEqual:(id)a3
{
  SBHFloatingDockVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (SBHFloatingDockVisualConfiguration *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0
      && self->_maximumEditingIconSize.height == v4->_maximumEditingIconSize.height
      && self->_maximumEditingIconSize.width == v4->_maximumEditingIconSize.width;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_maximumEditingIconSize.width + self->_maximumEditingIconSize.height);
}

- (NSString)description
{
  return (NSString *)-[SBHFloatingDockVisualConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHFloatingDockVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHFloatingDockVisualConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[SBHFloatingDockVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHFloatingDockVisualConfiguration maximumEditingIconSize](self, "maximumEditingIconSize");
  v5 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("maximumEditingIconSize"));
  return v4;
}

- (CGSize)maximumEditingIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumEditingIconSize.width;
  height = self->_maximumEditingIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
