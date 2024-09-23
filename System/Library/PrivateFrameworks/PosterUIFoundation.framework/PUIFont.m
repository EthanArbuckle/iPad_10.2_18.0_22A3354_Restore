@implementation PUIFont

- (PUIFont)initWithFontIdentifier:(id)a3
{
  id v4;
  PUIFont *v5;

  v4 = a3;
  -[PUIFont _defaultWeightForFontIdentifier:](self, "_defaultWeightForFontIdentifier:", v4);
  v5 = -[PUIFont initWithFontIdentifier:weight:](self, "initWithFontIdentifier:weight:", v4);

  return v5;
}

- (PUIFont)initWithFontIdentifier:(id)a3 weight:(double)a4
{
  id v6;
  PUIFont *v7;
  uint64_t v8;
  NSString *fontIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIFont;
  v7 = -[PUIFont init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    fontIdentifier = v7->_fontIdentifier;
    v7->_fontIdentifier = (NSString *)v8;

    v7->_weight = a4;
  }

  return v7;
}

- (PUIFont)initWithCustomFont:(id)a3
{
  id v5;
  PUIFont *v6;
  PUIFont *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUIFont;
  v6 = -[PUIFont init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_customFont, a3);

  return v7;
}

- (PUIFont)init
{
  void *v3;
  PUIFont *v4;

  objc_msgSend(MEMORY[0x24BDF6A70], "pui_defaultFontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIFont initWithFontIdentifier:](self, "initWithFontIdentifier:", v3);

  return v4;
}

- (UIFont)effectiveFont
{
  return (UIFont *)-[PUIFont effectiveFontForRole:](self, "effectiveFontForRole:", *MEMORY[0x24BE74D68]);
}

- (id)effectiveFontForRole:(id)a3
{
  return -[PUIFont effectiveFontForRole:ignoringWeight:](self, "effectiveFontForRole:ignoringWeight:", a3, 0);
}

- (id)effectiveFontForRole:(id)a3 ignoringWeight:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;

  v4 = a4;
  v6 = a3;
  -[PUIFont customFont](self, "customFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PUIFont customFont](self, "customFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDF6A70];
    -[PUIFont fontIdentifier](self, "fontIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pui_UIFontWithPUIFontIdentifier:forRole:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v12 = v11;
    }
    else
    {
      -[PUIFont weight](self, "weight");
      objc_msgSend(v11, "pui_UIFontWithVariantWeight:forRole:", (unint64_t)v13, v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v12;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PUIFont *v4;
  PUIFont *v5;
  void *v6;
  char isKindOfClass;
  BOOL v8;

  v4 = (PUIFont *)a3;
  v5 = v4;
  if (self == v4)
    v8 = 1;
  else
    v8 = v4
      && (objc_opt_self(),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0)
      && -[PUIFont isEqualToFont:](self, "isEqualToFont:", v5);

  return v8;
}

- (BOOL)isEqualToFont:(id)a3
{
  PUIFont *v4;
  PUIFont *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (PUIFont *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    -[PUIFont fontIdentifier](self, "fontIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIFont fontIdentifier](v5, "fontIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSEqualObjects();

    if (!v8)
      goto LABEL_6;
    -[PUIFont weight](self, "weight");
    -[PUIFont weight](v5, "weight");
    if (BSFloatEqualToFloat())
    {
      -[PUIFont customFont](self, "customFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIFont customFont](v5, "customFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = BSEqualObjects();

    }
    else
    {
LABEL_6:
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIFont fontIdentifier](self, "fontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[PUIFont weight](self, "weight");
  v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[PUIFont customFont](self, "customFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  v9 = objc_msgSend(v3, "hash");
  return v9;
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
  PUIFont *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE10]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __22__PUIFont_description__block_invoke;
  v10 = &unk_25154BFC0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __22__PUIFont_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[PUIFont fontIdentifier](self, "fontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:skipIfEmpty:", v4, CFSTR("timeFontIdentifier"), 1);

  -[PUIFont weight](self, "weight");
  v5 = (id)objc_msgSend(v8, "appendFloat:withName:", CFSTR("weight"));
  -[PUIFont customFont](self, "customFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v6, CFSTR("customFont"), 1);

}

- (double)_defaultWeightForFontIdentifier:(id)a3
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDF6A70], "pui_UIFontWithPUIFontIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "pui_variantWeight");

  return v4;
}

- (NSString)fontIdentifier
{
  return self->_fontIdentifier;
}

- (double)weight
{
  return self->_weight;
}

- (UIFont)customFont
{
  return self->_customFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFont, 0);
  objc_storeStrong((id *)&self->_fontIdentifier, 0);
}

@end
