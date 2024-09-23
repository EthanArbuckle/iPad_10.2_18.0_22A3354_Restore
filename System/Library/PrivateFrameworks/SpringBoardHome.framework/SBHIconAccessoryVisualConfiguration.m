@implementation SBHIconAccessoryVisualConfiguration

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
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
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_fontSize;
    *((_OWORD *)result + 1) = self->_size;
    *((_OWORD *)result + 2) = self->_offset;
  }
  return result;
}

- (SBHIconAccessoryVisualConfiguration)init
{
  SBHIconAccessoryVisualConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconAccessoryVisualConfiguration;
  result = -[SBHIconAccessoryVisualConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_fontSize = xmmword_1D0193E60;
    result->_offset.y = 11.0;
    *(_OWORD *)&result->_size.height = xmmword_1D0193E70;
  }
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconAccessoryVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  double *v7;
  BOOL v9;

  v4 = (SBHIconAccessoryVisualConfiguration *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v9 = self->_size.width == v7[2]
        && self->_size.height == v7[3]
        && self->_offset.y == v7[5]
        && self->_offset.x == v7[4];

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_fontSize + self->_size.width + self->_size.height + self->_offset.x + self->_offset.y);
}

- (NSString)description
{
  return (NSString *)-[SBHIconAccessoryVisualConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconAccessoryVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHIconAccessoryVisualConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;

  -[SBHIconAccessoryVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconAccessoryVisualConfiguration fontSize](self, "fontSize");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("fontSize"));
  -[SBHIconAccessoryVisualConfiguration size](self, "size");
  v6 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("size"));
  -[SBHIconAccessoryVisualConfiguration offset](self, "offset");
  v7 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("offset"));
  return v4;
}

- (double)fontSize
{
  return self->_fontSize;
}

@end
