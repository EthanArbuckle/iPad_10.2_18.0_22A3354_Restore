@implementation _UICellAccessoryConfigurationOutlineDisclosure

+ (id)new
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCellSelectionTogglesExpansionState:", 1);
}

- (_UICellAccessoryConfigurationOutlineDisclosure)init
{
  return -[_UICellAccessoryConfigurationOutlineDisclosure initWithCellSelectionTogglesExpansionState:](self, "initWithCellSelectionTogglesExpansionState:", 1);
}

- (_UICellAccessoryConfigurationOutlineDisclosure)initWithImage:(id)a3
{
  id v5;
  _UICellAccessoryConfigurationOutlineDisclosure *v6;
  _UICellAccessoryConfigurationOutlineDisclosure *v7;

  v5 = a3;
  v6 = -[_UICellAccessoryConfigurationOutlineDisclosure initWithCellSelectionTogglesExpansionState:](self, "initWithCellSelectionTogglesExpansionState:", 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__customImage, a3);

  return v7;
}

- (_UICellAccessoryConfigurationOutlineDisclosure)initWithCellSelectionTogglesExpansionState:(BOOL)a3
{
  _UICellAccessoryConfigurationOutlineDisclosure *v4;
  _UICellAccessoryConfigurationOutlineDisclosure *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  v4 = -[_UICellAccessoryConfiguration init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[_UICellAccessoryConfiguration setUsesDefaultLayoutWidth:](v4, "setUsesDefaultLayoutWidth:", 0);
    v5->_cellSelectionTogglesExpansionState = a3;
    v5->_rotationAngle = 1.57079633;
  }
  return v5;
}

- (int64_t)_systemType
{
  return 6;
}

- (id)_identifier
{
  return CFSTR("OutlineDisclosure");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfigurationOutlineDisclosure)initWithCoder:(id)a3
{
  id v4;
  _UICellAccessoryConfigurationOutlineDisclosure *v5;
  uint64_t v6;
  UIImage *customImage;
  double v8;
  uint64_t v9;
  UIColor *selectedTintColor;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  v5 = -[_UICellAccessoryConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customImage"));
    v6 = objc_claimAutoreleasedReturnValue();
    customImage = v5->__customImage;
    v5->__customImage = (UIImage *)v6;

    v5->_cellSelectionTogglesExpansionState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cellSelectionTogglesExpansionState"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rotationAngle"));
    v5->_rotationAngle = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedTintColor"));
    v9 = objc_claimAutoreleasedReturnValue();
    selectedTintColor = v5->_selectedTintColor;
    v5->_selectedTintColor = (UIColor *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  v4 = a3;
  -[_UICellAccessoryConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->__customImage, CFSTR("customImage"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_cellSelectionTogglesExpansionState, CFSTR("cellSelectionTogglesExpansionState"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rotationAngle"), self->_rotationAngle);
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedTintColor, CFSTR("selectedTintColor"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  v4 = -[_UICellAccessoryConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 32) = self->_cellSelectionTogglesExpansionState;
    objc_storeStrong(v4 + 7, self->__customImage);
    v5[5] = *(id *)&self->_rotationAngle;
    objc_storeStrong(v5 + 6, self->_selectedTintColor);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  double *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;
  UIImage *v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  if (-[_UICellAccessoryConfiguration isEqual:](&v15, sel_isEqual_, v4))
  {
    v5 = (double *)v4;
    v6 = v5;
    if (self->_cellSelectionTogglesExpansionState == *((unsigned __int8 *)v5 + 32))
    {
      v7 = (void *)*((_QWORD *)v5 + 7);
      v8 = self->__customImage;
      v9 = v7;
      if (v8 == v9)
      {

      }
      else
      {
        v10 = v9;
        if (v8)
          v11 = v9 == 0;
        else
          v11 = 1;
        if (v11)
        {

          goto LABEL_14;
        }
        v13 = -[UIImage isEqual:](v8, "isEqual:", v9);

        if (!v13)
          goto LABEL_14;
      }
      if (self->_rotationAngle == v6[5])
      {
        v12 = self->_selectedTintColor == (UIColor *)*((_QWORD *)v6 + 6);
        goto LABEL_15;
      }
    }
LABEL_14:
    v12 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->__customImage, a3);
}

- (UIImage)image
{
  UIImage *customImage;

  customImage = self->__customImage;
  if (customImage)
    return customImage;
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward"));
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)cellSelectionTogglesExpansionState
{
  return self->_cellSelectionTogglesExpansionState;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void)setSelectedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTintColor, a3);
}

- (UIImage)_customImage
{
  return self->__customImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customImage, 0);
  objc_storeStrong((id *)&self->_selectedTintColor, 0);
}

@end
