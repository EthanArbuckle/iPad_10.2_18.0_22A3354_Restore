@implementation PUISystemFontConfiguration

+ (id)defaultFontIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "pui_defaultFontIdentifier");
}

- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3
{
  return -[PUISystemFontConfiguration initWithFontIdentifier:systemItem:](self, "initWithFontIdentifier:systemItem:", a3, 0);
}

- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3 systemItem:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PUISystemFontConfiguration *v7;

  v4 = a4;
  v6 = a3;
  -[PUISystemFontConfiguration _defaultWeightForFontIdentifier:](self, "_defaultWeightForFontIdentifier:", v6);
  v7 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:](self, "initWithFontIdentifier:weight:systemItem:", v6, v4);

  return v7;
}

- (PUISystemFontConfiguration)initWithFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5
{
  id v8;
  PUISystemFontConfiguration *v9;
  uint64_t v10;
  PUIFont *fontConfiguration;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUISystemFontConfiguration;
  v9 = -[PUIFontConfiguration init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    fontConfiguration = v9->_fontConfiguration;
    v9->_fontConfiguration = (PUIFont *)v10;

    v12 = -[PUISystemFontConfiguration _validWeightRangeForFontIdentifier:](v9, "_validWeightRangeForFontIdentifier:", v8);
    v14 = v13;
    if (BSFloatIsZero())
    {
      -[PUISystemFontConfiguration _defaultWeightForFontIdentifier:](v9, "_defaultWeightForFontIdentifier:", v8);
      a4 = v15;
    }
    v16 = (double)v14;
    if (a4 < (double)v14)
      v16 = a4;
    if (v16 < (double)v12)
      v16 = (double)v12;
    *(double *)&v9->_fontIdentifier = v16;
    *(&v9->super._systemItem + 1) = a5;
  }

  return v9;
}

- (PUISystemFontConfiguration)init
{
  void *v3;
  PUISystemFontConfiguration *v4;

  objc_msgSend((id)objc_opt_class(), "defaultFontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUISystemFontConfiguration initWithFontIdentifier:](self, "initWithFontIdentifier:", v3);

  return v4;
}

- (id)fontWithExtensionBundleURL:(id)a3
{
  void *v4;
  PUIFont *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = *(void **)&self->_systemItem;
  if (!v4)
  {
    v5 = [PUIFont alloc];
    -[PUISystemFontConfiguration fontIdentifier](self, "fontIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUISystemFontConfiguration weight](self, "weight");
    v7 = -[PUIFont initWithFontIdentifier:weight:](v5, "initWithFontIdentifier:weight:", v6);
    v8 = *(void **)&self->_systemItem;
    *(_QWORD *)&self->_systemItem = v7;

    v4 = *(void **)&self->_systemItem;
  }
  return v4;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PUISystemFontConfiguration fontIdentifier](self, "fontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUISystemFontConfiguration weight](self, "weight");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isSystemItem
{
  return *(&self->super._systemItem + 1);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_validWeightRangeForFontIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  objc_msgSend(MEMORY[0x24BDF6A70], "pui_UIFontWithPUIFontIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pui_variantWeightRange");
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
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

- (BOOL)isEqual:(id)a3
{
  PUISystemFontConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PUISystemFontConfiguration *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;

  v4 = (PUISystemFontConfiguration *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PUISystemFontConfiguration fontIdentifier](self, "fontIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUISystemFontConfiguration fontIdentifier](v7, "fontIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10)
      {
        -[PUISystemFontConfiguration weight](self, "weight");
        -[PUISystemFontConfiguration weight](v7, "weight");
        v11 = BSFloatEqualToFloat();
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
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
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUISystemFontConfiguration fontIdentifier](self, "fontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[PUISystemFontConfiguration weight](self, "weight");
  v6 = (id)objc_msgSend(v3, "appendDouble:");
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  -[PUISystemFontConfiguration fontIdentifier](self, "fontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v4, CFSTR("fontIdentifier"));

  -[PUISystemFontConfiguration weight](self, "weight");
  v5 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", CFSTR("weight"), 5);
  v6 = (id)objc_msgSend(v7, "appendBool:withName:", -[PUISystemFontConfiguration isSystemItem](self, "isSystemItem"), CFSTR("isSystemItem"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUISystemFontConfiguration fontIdentifier](self, "fontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("fontIdentifier"));

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[PUISystemFontConfiguration weight](self, "weight");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("weight"));

  objc_msgSend(v7, "encodeBool:forKey:", -[PUISystemFontConfiguration isSystemItem](self, "isSystemItem"), CFSTR("isSystemItem"));
}

- (PUISystemFontConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  PUISystemFontConfiguration *v10;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("fontIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFontIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    -[PUISystemFontConfiguration _defaultWeightForFontIdentifier:](self, "_defaultWeightForFontIdentifier:", v6);
  v10 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:](self, "initWithFontIdentifier:weight:systemItem:", v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSystemItem")), v9);

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUISystemFontConfiguration fontIdentifier](self, "fontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("fontIdentifier"));

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[PUISystemFontConfiguration weight](self, "weight");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("weight"));

  objc_msgSend(v7, "encodeBool:forKey:", -[PUISystemFontConfiguration isSystemItem](self, "isSystemItem"), CFSTR("isSystemItem"));
}

- (PUISystemFontConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  PUISystemFontConfiguration *v10;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("fontIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFontIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    -[PUISystemFontConfiguration _defaultWeightForFontIdentifier:](self, "_defaultWeightForFontIdentifier:", v6);
  v10 = -[PUISystemFontConfiguration initWithFontIdentifier:weight:systemItem:](self, "initWithFontIdentifier:weight:systemItem:", v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSystemItem")), v9);

  return v10;
}

- (NSString)fontIdentifier
{
  return (NSString *)&self->_fontConfiguration->super.isa;
}

- (double)weight
{
  return *(double *)&self->_fontIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontConfiguration, 0);
  objc_storeStrong((id *)&self->_systemItem, 0);
}

@end
