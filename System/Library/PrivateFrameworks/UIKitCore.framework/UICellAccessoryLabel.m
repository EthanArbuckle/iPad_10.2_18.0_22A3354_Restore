@implementation UICellAccessoryLabel

- (id)_identifier
{
  return CFSTR("Label");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryLabel;
  v4 = -[UICellAccessory copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[NSString copy](self->_text, "copy");
    v6 = (void *)*((_QWORD *)v4 + 7);
    *((_QWORD *)v4 + 7) = v5;

    objc_storeStrong((id *)v4 + 8, self->_font);
    *((_BYTE *)v4 + 48) = self->_adjustsFontForContentSizeCategory;
  }
  return v4;
}

- (UICellAccessoryLabel)initWithText:(NSString *)text
{
  NSString *v5;
  UICellAccessoryLabel *v6;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  UIFont *font;
  void *v12;
  objc_super v13;

  v5 = text;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICellAccessory.m"), 730, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)UICellAccessoryLabel;
  v6 = -[UICellAccessory init](&v13, sel_init);
  if (v6)
  {
    v7 = -[NSString copy](v5, "copy");
    v8 = v6->_text;
    v6->_text = (NSString *)v7;

    -[UICellAccessory setReservedLayoutWidth:](v6, "setReservedLayoutWidth:", 0.0);
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v9 = objc_claimAutoreleasedReturnValue();
    font = v6->_font;
    v6->_font = (UIFont *)v9;

    v6->_adjustsFontForContentSizeCategory = 1;
  }

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (int64_t)_systemType
{
  return 7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  UIFont *v7;
  UIFont *v8;
  UIFont *v9;
  BOOL v10;
  int v11;
  BOOL v12;
  void *v13;
  UIFont *v14;
  BOOL v15;
  int v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UICellAccessoryLabel;
  if (-[UICellAccessory isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (void *)v5[7];
    v7 = self->_text;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        goto LABEL_17;
      v11 = -[UIFont isEqual:](v7, "isEqual:", v8);

      if (!v11)
        goto LABEL_18;
    }
    v13 = (void *)v5[8];
    v7 = self->_font;
    v14 = v13;
    if (v7 == v14)
    {

      goto LABEL_21;
    }
    v9 = v14;
    if (v7)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      v16 = -[UIFont isEqual:](v7, "isEqual:", v14);

      if (!v16)
        goto LABEL_18;
LABEL_21:
      v12 = self->_adjustsFontForContentSizeCategory == *((unsigned __int8 *)v5 + 48);
      goto LABEL_22;
    }
LABEL_17:

LABEL_18:
    v12 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 201;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICellAccessoryLabel;
  return -[UICellAccessory _canDirectlyUpdateExistingAccessoryViewFrom:](&v4, sel__canDirectlyUpdateExistingAccessoryViewFrom_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryLabel)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  void *v5;
  UICellAccessoryLabel *v6;
  UICellAccessoryLabel *v7;
  uint64_t v8;
  UIFont *font;
  objc_super v11;

  v4 = coder;
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)UICellAccessoryLabel;
    v6 = -[UICellAccessory initWithCoder:](&v11, sel_initWithCoder_, v4);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_text, v5);
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("font"));
      v8 = objc_claimAutoreleasedReturnValue();
      font = v7->_font;
      v7->_font = (UIFont *)v8;

      v7->_adjustsFontForContentSizeCategory = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("adjustsFontForContentSizeCategory"));
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryLabel;
  v4 = a3;
  -[UICellAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, CFSTR("text"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_font, CFSTR("font"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_adjustsFontForContentSizeCategory, CFSTR("adjustsFontForContentSizeCategory"));

}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICellAccessoryLabel;
  v3 = -[UICellAccessory hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_text, "hash") ^ v3;
  return v4 ^ -[UIFont hash](self->_font, "hash") ^ self->_adjustsFontForContentSizeCategory;
}

- (void)setFont:(UIFont *)font
{
  objc_storeStrong((id *)&self->_font, font);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)adjustsFontForContentSizeCategory
{
  self->_adjustsFontForContentSizeCategory = adjustsFontForContentSizeCategory;
}

@end
