@implementation _UICellAccessoryConfigurationMultiselect

- (int64_t)_systemType
{
  return 5;
}

- (id)_identifier
{
  return CFSTR("Multiselect");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfigurationMultiselect)initWithCoder:(id)a3
{
  id v4;
  _UICellAccessoryConfigurationMultiselect *v5;
  uint64_t v6;
  UIColor *selectedTintColor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICellAccessoryConfigurationMultiselect;
  v5 = -[_UICellAccessoryConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedTintColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    selectedTintColor = v5->_selectedTintColor;
    v5->_selectedTintColor = (UIColor *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationMultiselect;
  v4 = a3;
  -[_UICellAccessoryConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedTintColor, CFSTR("selectedTintColor"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationMultiselect;
  v4 = -[_UICellAccessoryConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 4, self->_selectedTintColor);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;
  BOOL v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UICellAccessoryConfigurationMultiselect;
  if (-[_UICellAccessoryConfiguration isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (void *)v5[4];
    v7 = self->_selectedTintColor;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v11 = 1;
    }
    else
    {
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        v11 = 0;
      else
        v11 = -[UIColor isEqual:](v7, "isEqual:", v8);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void)setSelectedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedTintColor, 0);
}

@end
