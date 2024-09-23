@implementation _UICellAccessoryConfigurationBadge

- (_UICellAccessoryConfigurationBadge)initWithText:(id)a3
{
  id v5;
  _UICellAccessoryConfigurationBadge *v6;
  uint64_t v7;
  NSString *text;
  uint64_t v9;
  UIFont *font;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICellAccessoryConfiguration.m"), 422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UICellAccessoryConfigurationBadge;
  v6 = -[_UICellAccessoryConfiguration init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    text = v6->_text;
    v6->_text = (NSString *)v7;

    -[_UICellAccessoryConfiguration setUsesDefaultLayoutWidth:](v6, "setUsesDefaultLayoutWidth:", 0);
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v9 = objc_claimAutoreleasedReturnValue();
    font = v6->_font;
    v6->_font = (UIFont *)v9;

    v6->_adjustsFontForContentSizeCategory = 1;
  }

  return v6;
}

- (int64_t)_systemType
{
  return 7;
}

- (id)_identifier
{
  return CFSTR("Badge");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfigurationBadge)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _UICellAccessoryConfigurationBadge *v6;
  _UICellAccessoryConfigurationBadge *v7;
  uint64_t v8;
  UIFont *font;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UICellAccessoryConfigurationBadge;
    v6 = -[_UICellAccessoryConfiguration initWithCoder:](&v11, sel_initWithCoder_, v4);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_text, v5);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("font"));
      v8 = objc_claimAutoreleasedReturnValue();
      font = v7->_font;
      v7->_font = (UIFont *)v8;

      v7->_adjustsFontForContentSizeCategory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("adjustsFontForContentSizeCategory"));
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
  v5.super_class = (Class)_UICellAccessoryConfigurationBadge;
  v4 = a3;
  -[_UICellAccessoryConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, CFSTR("text"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_font, CFSTR("font"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_adjustsFontForContentSizeCategory, CFSTR("adjustsFontForContentSizeCategory"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UICellAccessoryConfigurationBadge;
  v4 = -[_UICellAccessoryConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[NSString copy](self->_text, "copy");
    v6 = (void *)*((_QWORD *)v4 + 5);
    *((_QWORD *)v4 + 5) = v5;

    objc_storeStrong((id *)v4 + 6, self->_font);
    *((_BYTE *)v4 + 32) = self->_adjustsFontForContentSizeCategory;
  }
  return v4;
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
  v18.super_class = (Class)_UICellAccessoryConfigurationBadge;
  if (-[_UICellAccessoryConfiguration isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (void *)v5[5];
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
    v13 = (void *)v5[6];
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
      v12 = self->_adjustsFontForContentSizeCategory == *((unsigned __int8 *)v5 + 32);
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

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICellAccessoryConfigurationBadge;
  v3 = -[_UICellAccessoryConfiguration hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_text, "hash") ^ v3;
  return v4 ^ -[UIFont hash](self->_font, "hash") ^ self->_adjustsFontForContentSizeCategory;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
