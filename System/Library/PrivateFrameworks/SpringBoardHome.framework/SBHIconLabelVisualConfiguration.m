@implementation SBHIconLabelVisualConfiguration

- (double)baselineOffsetFromImage
{
  return self->_baselineOffsetFromImage;
}

- (double)height
{
  return self->_height;
}

- (double)extraWidth
{
  return self->_extraWidth;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (SBHIconLabelVisualConfiguration)init
{
  SBHIconLabelVisualConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconLabelVisualConfiguration;
  result = -[SBHIconLabelVisualConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_height = 26.0;
    *(_OWORD *)&result->_fontSize = xmmword_1D01910E0;
  }
  return result;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void)setExtraWidth:(double)a3
{
  self->_extraWidth = a3;
}

- (void)setBaselineOffsetFromImage:(double)a3
{
  self->_baselineOffsetFromImage = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_fontSize;
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_baselineOffsetFromImage;
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_height;
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_extraWidth;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconLabelVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  double *v7;
  BOOL v8;

  v4 = (SBHIconLabelVisualConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = self->_height == v7[3]
        && self->_baselineOffsetFromImage == v7[2]
        && self->_fontSize == v7[1]
        && self->_extraWidth == v7[4];

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
  return (unint64_t)(self->_fontSize + self->_baselineOffsetFromImage + self->_height + self->_extraWidth);
}

- (NSString)description
{
  return (NSString *)-[SBHIconLabelVisualConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconLabelVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHIconLabelVisualConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v8;

  -[SBHIconLabelVisualConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLabelVisualConfiguration fontSize](self, "fontSize");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("fontSize"));
  -[SBHIconLabelVisualConfiguration baselineOffsetFromImage](self, "baselineOffsetFromImage");
  v6 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("baselineOffsetFromImage"));
  -[SBHIconLabelVisualConfiguration height](self, "height");
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("height"));
  -[SBHIconLabelVisualConfiguration extraWidth](self, "extraWidth");
  v8 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("extraWidth"));
  return v4;
}

@end
