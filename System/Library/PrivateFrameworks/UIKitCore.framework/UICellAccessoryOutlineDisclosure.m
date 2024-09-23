@implementation UICellAccessoryOutlineDisclosure

- (UICellAccessoryOutlineDisclosure)init
{
  UICellAccessoryOutlineDisclosure *v2;
  UICellAccessoryOutlineDisclosure *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryOutlineDisclosure;
  v2 = -[UICellAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UICellAccessory setReservedLayoutWidth:](v2, "setReservedLayoutWidth:", 0.0);
  return v3;
}

- (int64_t)_systemType
{
  return 6;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 206;
}

- (id)_identifier
{
  return CFSTR("OutlineDisclosure");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryOutlineDisclosure)initWithCoder:(id)a3
{
  id v4;
  UICellAccessoryOutlineDisclosure *v5;
  uint64_t v6;
  UIImage *customImage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICellAccessoryOutlineDisclosure;
  v5 = -[UICellAccessory initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customImage"));
    v6 = objc_claimAutoreleasedReturnValue();
    customImage = v5->__customImage;
    v5->__customImage = (UIImage *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryOutlineDisclosure;
  v4 = a3;
  -[UICellAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("style"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->__customImage, CFSTR("customImage"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UICellAccessoryOutlineDisclosure;
  v4 = -[UICellAccessory copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = (id *)v4;
  if (v4)
  {
    v4[6] = self->_style;
    v6 = objc_msgSend(self->_actionHandler, "copy");
    v7 = v5[7];
    v5[7] = (id)v6;

    objc_storeStrong(v5 + 8, self->__customImage);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v9;
  UIImage *v10;
  UIImage *v11;
  UIImage *v12;
  BOOL v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UICellAccessoryOutlineDisclosure;
  if (-[UICellAccessory isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = v5;
    if (self->_style == *((_QWORD *)v5 + 6) && self->_actionHandler == (id)*((_QWORD *)v5 + 7))
    {
      v9 = (void *)*((_QWORD *)v5 + 8);
      v10 = self->__customImage;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        v7 = 1;
      }
      else
      {
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (v13)
          v7 = 0;
        else
          v7 = -[UIImage isEqual:](v10, "isEqual:", v11);
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryOutlineDisclosure;
  if (-[UICellAccessory _canDirectlyUpdateExistingAccessoryViewFrom:](&v7, sel__canDirectlyUpdateExistingAccessoryViewFrom_, v4))
  {
    v5 = self->_style == v4[6];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)rotationAngle
{
  return 1.57079633;
}

- (UICellAccessoryOutlineDisclosureStyle)style
{
  return self->_style;
}

- (void)setStyle:(UICellAccessoryOutlineDisclosureStyle)style
{
  self->_style = style;
}

- (void)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(void *)actionHandler
{
  objc_setProperty_nonatomic_copy(self, a2, actionHandler, 56);
}

- (UIImage)_customImage
{
  return self->__customImage;
}

- (void)_setCustomImage:(id)a3
{
  objc_storeStrong((id *)&self->__customImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customImage, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
