@implementation PRPosterSystemTimeFontConfiguration

+ (id)defaultTimeFontIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "pr_defaultTimeFontIdentifier");
}

- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3
{
  return -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:systemItem:](self, "initWithTimeFontIdentifier:systemItem:", a3, 0);
}

- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 systemItem:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PRPosterSystemTimeFontConfiguration *v7;

  v4 = a4;
  v6 = a3;
  -[PRPosterSystemTimeFontConfiguration _defaultWeightForTimeFontIdentifier:](self, "_defaultWeightForTimeFontIdentifier:", v6);
  v7 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:](self, "initWithTimeFontIdentifier:weight:systemItem:", v6, v4);

  return v7;
}

- (PRPosterSystemTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5
{
  id v8;
  PRPosterSystemTimeFontConfiguration *v9;
  uint64_t v10;
  PRTimeFontConfiguration *timeFontConfiguration;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PRPosterSystemTimeFontConfiguration;
  v9 = -[PRPosterTimeFontConfiguration init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    timeFontConfiguration = v9->_timeFontConfiguration;
    v9->_timeFontConfiguration = (PRTimeFontConfiguration *)v10;

    v12 = -[PRPosterSystemTimeFontConfiguration _validWeightRangeForTimeFontIdentifier:](v9, "_validWeightRangeForTimeFontIdentifier:", v8);
    v14 = v13;
    if (BSFloatIsZero())
    {
      -[PRPosterSystemTimeFontConfiguration _defaultWeightForTimeFontIdentifier:](v9, "_defaultWeightForTimeFontIdentifier:", v8);
      a4 = v15;
    }
    v16 = (double)v14;
    if (a4 < (double)v14)
      v16 = a4;
    if (v16 < (double)v12)
      v16 = (double)v12;
    *(double *)&v9->_timeFontIdentifier = v16;
    *(&v9->super._systemItem + 1) = a5;
  }

  return v9;
}

- (PRPosterSystemTimeFontConfiguration)init
{
  void *v3;
  PRPosterSystemTimeFontConfiguration *v4;

  objc_msgSend((id)objc_opt_class(), "defaultTimeFontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:](self, "initWithTimeFontIdentifier:", v3);

  return v4;
}

- (PRPosterSystemTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3
{
  id v5;
  void *v6;
  PRTimeFontConfiguration *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PRPosterSystemTimeFontConfiguration *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleURL != nil"));

  }
  v6 = *(void **)&self->_systemItem;
  if (!v6)
  {
    v7 = [PRTimeFontConfiguration alloc];
    -[PRPosterSystemTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterSystemTimeFontConfiguration weight](self, "weight");
    v9 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:weight:](v7, "initWithTimeFontIdentifier:weight:", v8);
    v10 = *(void **)&self->_systemItem;
    *(_QWORD *)&self->_systemItem = v9;

    v6 = *(void **)&self->_systemItem;
  }
  v11 = v6;

  return v11;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PRPosterSystemTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSystemTimeFontConfiguration weight](self, "weight");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isSystemItem
{
  return *(&self->super._systemItem + 1);
}

- (PRVariantWeightRange)_validWeightRangeForTimeFontIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  PRVariantWeightRange result;

  objc_msgSend(MEMORY[0x1E0DC1350], "pr_fontWithTimeFontIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pr_variantWeightRange");
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (double)_defaultWeightForTimeFontIdentifier:(id)a3
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "pr_fontWithTimeFontIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "pr_variantWeight");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterSystemTimeFontConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PRPosterSystemTimeFontConfiguration *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;

  v4 = (PRPosterSystemTimeFontConfiguration *)a3;
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
      -[PRPosterSystemTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterSystemTimeFontConfiguration timeFontIdentifier](v7, "timeFontIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10)
      {
        -[PRPosterSystemTimeFontConfiguration weight](self, "weight");
        -[PRPosterSystemTimeFontConfiguration weight](v7, "weight");
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

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSystemTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[PRPosterSystemTimeFontConfiguration weight](self, "weight");
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
  -[PRPosterSystemTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v4, CFSTR("timeFontIdentifier"));

  -[PRPosterSystemTimeFontConfiguration weight](self, "weight");
  v5 = (id)objc_msgSend(v7, "appendDouble:withName:decimalPrecision:", CFSTR("weight"), 5);
  v6 = (id)objc_msgSend(v7, "appendBool:withName:", -[PRPosterSystemTimeFontConfiguration isSystemItem](self, "isSystemItem"), CFSTR("isSystemItem"));

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
  -[PRPosterSystemTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("timeFontIdentifier"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PRPosterSystemTimeFontConfiguration weight](self, "weight");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("weight"));

  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterSystemTimeFontConfiguration isSystemItem](self, "isSystemItem"), CFSTR("isSystemItem"));
}

- (PRPosterSystemTimeFontConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  PRPosterSystemTimeFontConfiguration *v10;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("timeFontIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTimeFontIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    -[PRPosterSystemTimeFontConfiguration _defaultWeightForTimeFontIdentifier:](self, "_defaultWeightForTimeFontIdentifier:", v6);
  v10 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:](self, "initWithTimeFontIdentifier:weight:systemItem:", v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSystemItem")), v9);

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
  -[PRPosterSystemTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("timeFontIdentifier"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PRPosterSystemTimeFontConfiguration weight](self, "weight");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("weight"));

  objc_msgSend(v7, "encodeBool:forKey:", -[PRPosterSystemTimeFontConfiguration isSystemItem](self, "isSystemItem"), CFSTR("isSystemItem"));
}

- (PRPosterSystemTimeFontConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  PRPosterSystemTimeFontConfiguration *v10;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("timeFontIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTimeFontIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    -[PRPosterSystemTimeFontConfiguration _defaultWeightForTimeFontIdentifier:](self, "_defaultWeightForTimeFontIdentifier:", v6);
  v10 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:](self, "initWithTimeFontIdentifier:weight:systemItem:", v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSystemItem")), v9);

  return v10;
}

- (NSString)timeFontIdentifier
{
  return (NSString *)&self->_timeFontConfiguration->super.isa;
}

- (double)weight
{
  return *(double *)&self->_timeFontIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFontConfiguration, 0);
  objc_storeStrong((id *)&self->_systemItem, 0);
}

@end
