@implementation PRPosterHomeScreenCustomizationConfiguration

- (PRPosterHomeScreenCustomizationConfiguration)initWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isDimmed:(BOOL)a5 iconUserInterfaceSize:(id)a6 iconUserInterfaceStyleType:(id)a7
{
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  PRPosterHomeScreenCustomizationConfiguration *v16;
  void *v17;
  void *v18;
  PUIDiscreteGradientVariatedCustomStyle *v19;
  PUIDiscreteGradientVariatedCustomStyle *tintColorStyle;
  uint64_t v21;
  UIColor *suggestedTintColor;
  __CFString *v23;
  __CFString *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  v26.receiver = self;
  v26.super_class = (Class)PRPosterHomeScreenCustomizationConfiguration;
  v16 = -[PRPosterHomeScreenCustomizationConfiguration init](&v26, sel_init);
  if (v16)
  {
    v17 = (void *)objc_msgSend(v12, "copy");
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = (PUIDiscreteGradientVariatedCustomStyle *)objc_alloc_init(MEMORY[0x1E0D7FCC8]);
    tintColorStyle = v16->_tintColorStyle;
    v16->_tintColorStyle = v19;

    v21 = objc_msgSend(v13, "copy");
    suggestedTintColor = v16->_suggestedTintColor;
    v16->_suggestedTintColor = (UIColor *)v21;

    v16->_dimmed = a5;
    if (v14)
      v23 = v14;
    else
      v23 = CFSTR("SMALL");
    objc_storeStrong((id *)&v16->_iconUserInterfaceSize, v23);
    if (v15)
      v24 = v15;
    else
      v24 = CFSTR("light");
    objc_storeStrong((id *)&v16->_iconUserInterfaceStyleType, v24);
    v16->_hash = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v16;
}

- (PRPosterHomeScreenCustomizationConfiguration)init
{
  id v3;
  PRPosterHomeScreenCustomizationConfiguration *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D7FCC8]);
  v4 = -[PRPosterHomeScreenCustomizationConfiguration initWithTintColorStyle:suggestedTintColor:isDimmed:iconUserInterfaceSize:iconUserInterfaceStyleType:](self, "initWithTintColorStyle:suggestedTintColor:isDimmed:iconUserInterfaceSize:iconUserInterfaceStyleType:", v3, 0, kPRPosterHomeScreenCustomizationConfigurationDefaultDimmed, CFSTR("SMALL"), CFSTR("light"));

  return v4;
}

- (id)configurationUpdatingIconUserInterfaceSize:(id)a3
{
  __CFString *v4;
  id *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v4 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("LARGE")) & 1) == 0
    && (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("SMALL")) & 1) == 0)
  {

    v4 = CFSTR("SMALL");
  }
  v5 = (id *)-[PRPosterHomeScreenCustomizationConfiguration copy](self, "copy");
  v6 = -[__CFString copy](v4, "copy");
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = CFSTR("SMALL");
  objc_storeStrong(v5 + 3, v8);

  return v5;
}

- (id)configurationUpdatingIconUserInterfaceStyle:(id)a3
{
  __CFString *v4;
  id *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  v4 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("auto")) & 1) == 0
    && (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("dark")) & 1) == 0
    && (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("light")) & 1) == 0
    && (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("accent")) & 1) == 0)
  {

    v4 = CFSTR("light");
  }
  v5 = (id *)-[PRPosterHomeScreenCustomizationConfiguration copy](self, "copy");
  v6 = -[__CFString copy](v4, "copy");
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = CFSTR("light");
  objc_storeStrong(v5 + 4, v8);

  return v5;
}

- (id)configurationUpdatingDimmed:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[PRPosterHomeScreenCustomizationConfiguration copy](self, "copy");
  v4[16] = a3;
  return v4;
}

- (id)configurationUpdatingTintColorStyle:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (_QWORD *)-[PRPosterHomeScreenCustomizationConfiguration copy](self, "copy");
  v6 = (void *)objc_msgSend(v4, "copy");

  if (v6)
    v7 = v6;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0D7FCC8]);
  v8 = (void *)v5[5];
  v5[5] = v7;

  return v5;
}

- (id)configurationUpdatingSuggestedTintColor:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[PRPosterHomeScreenCustomizationConfiguration copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[6];
  v5[6] = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterHomeScreenCustomizationConfiguration *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  PRPosterHomeScreenCustomizationConfiguration *v10;

  v4 = [PRPosterHomeScreenCustomizationConfiguration alloc];
  -[PRPosterHomeScreenCustomizationConfiguration tintColorStyle](self, "tintColorStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterHomeScreenCustomizationConfiguration suggestedTintColor](self, "suggestedTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRPosterHomeScreenCustomizationConfiguration isDimmed](self, "isDimmed");
  -[PRPosterHomeScreenCustomizationConfiguration iconUserInterfaceSize](self, "iconUserInterfaceSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterHomeScreenCustomizationConfiguration iconUserInterfaceStyleType](self, "iconUserInterfaceStyleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PRPosterHomeScreenCustomizationConfiguration initWithTintColorStyle:suggestedTintColor:isDimmed:iconUserInterfaceSize:iconUserInterfaceStyleType:](v4, "initWithTintColorStyle:suggestedTintColor:isDimmed:iconUserInterfaceSize:iconUserInterfaceStyleType:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterHomeScreenCustomizationConfiguration *v4;
  void *v5;
  char isKindOfClass;
  char v7;

  v4 = (PRPosterHomeScreenCustomizationConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0
      && BSEqualBools()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      v7 = BSEqualObjects();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t hash;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  hash = self->_hash;
  if (hash == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "appendObject:", self->_tintColorStyle);
    v6 = (id)objc_msgSend(v4, "appendObject:", self->_suggestedTintColor);
    v7 = (id)objc_msgSend(v4, "appendBool:", self->_dimmed);
    v8 = (id)objc_msgSend(v4, "appendObject:", self->_iconUserInterfaceSize);
    v9 = (id)objc_msgSend(v4, "appendObject:", self->_iconUserInterfaceStyleType);
    hash = objc_msgSend(v4, "hash");
    self->_hash = hash;

  }
  return hash;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRPosterHomeScreenCustomizationConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __59__PRPosterHomeScreenCustomizationConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __59__PRPosterHomeScreenCustomizationConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  PUIDiscreteGradientVariatedCustomStyle *tintColorStyle;
  id v5;

  tintColorStyle = self->_tintColorStyle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tintColorStyle, CFSTR("_tintColorStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedTintColor, CFSTR("_suggestedTintColor"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dimmed, CFSTR("_dimmed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconUserInterfaceSize, CFSTR("_iconUserInterfaceSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconUserInterfaceStyleType, CFSTR("_iconUserInterfaceStyleType"));

}

- (PRPosterHomeScreenCustomizationConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  PRPosterHomeScreenCustomizationConfiguration *v23;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("_tintColorStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0D7FCC8]);
  v9 = v8;

  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("_suggestedTintColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_dimmed"));
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, CFSTR("_iconUserInterfaceSize"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("SMALL");
  if (v14)
    v16 = (__CFString *)v14;
  v17 = v16;

  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("_iconUserInterfaceStyleType"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = CFSTR("light");
  if (v19)
    v21 = (__CFString *)v19;
  v22 = v21;

  v23 = -[PRPosterHomeScreenCustomizationConfiguration initWithTintColorStyle:suggestedTintColor:isDimmed:iconUserInterfaceSize:iconUserInterfaceStyleType:](self, "initWithTintColorStyle:suggestedTintColor:isDimmed:iconUserInterfaceSize:iconUserInterfaceStyleType:", v9, v11, v12, v17, v22);
  return v23;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  PUIDiscreteGradientVariatedCustomStyle *tintColorStyle;
  id v5;

  tintColorStyle = self->_tintColorStyle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tintColorStyle, CFSTR("_tintColorStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedTintColor, CFSTR("_suggestedTintColor"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dimmed, CFSTR("_dimmed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconUserInterfaceSize, CFSTR("_iconUserInterfaceSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconUserInterfaceStyleType, CFSTR("_iconUserInterfaceStyleType"));

}

- (PRPosterHomeScreenCustomizationConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  PRPosterHomeScreenCustomizationConfiguration *v23;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("_tintColorStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0D7FCC8]);
  v9 = v8;

  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("_suggestedTintColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_dimmed"));
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, CFSTR("_iconUserInterfaceSize"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("SMALL");
  if (v14)
    v16 = (__CFString *)v14;
  v17 = v16;

  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("_iconUserInterfaceStyleType"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = CFSTR("light");
  if (v19)
    v21 = (__CFString *)v19;
  v22 = v21;

  v23 = -[PRPosterHomeScreenCustomizationConfiguration initWithTintColorStyle:suggestedTintColor:isDimmed:iconUserInterfaceSize:iconUserInterfaceStyleType:](self, "initWithTintColorStyle:suggestedTintColor:isDimmed:iconUserInterfaceSize:iconUserInterfaceStyleType:", v9, v11, v12, v17, v22);
  return v23;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = (id)objc_msgSend(v9, "appendObject:withName:", self->_tintColorStyle, CFSTR("_tintColorStyle"));
  v5 = (id)objc_msgSend(v9, "appendObject:withName:", self->_suggestedTintColor, CFSTR("_suggestedTintColor"));
  v6 = (id)objc_msgSend(v9, "appendBool:withName:", self->_dimmed, CFSTR("_dimmed"));
  v7 = (id)objc_msgSend(v9, "appendObject:withName:", self->_iconUserInterfaceSize, CFSTR("_iconUserInterfaceSize"));
  v8 = (id)objc_msgSend(v9, "appendObject:withName:", self->_iconUserInterfaceStyleType, CFSTR("_iconUserInterfaceStyleType"));

}

- (NSString)iconUserInterfaceSize
{
  return self->_iconUserInterfaceSize;
}

- (NSString)iconUserInterfaceStyleType
{
  return self->_iconUserInterfaceStyleType;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (PUIDiscreteGradientVariatedCustomStyle)tintColorStyle
{
  return self->_tintColorStyle;
}

- (UIColor)suggestedTintColor
{
  return self->_suggestedTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedTintColor, 0);
  objc_storeStrong((id *)&self->_tintColorStyle, 0);
  objc_storeStrong((id *)&self->_iconUserInterfaceStyleType, 0);
  objc_storeStrong((id *)&self->_iconUserInterfaceSize, 0);
}

@end
