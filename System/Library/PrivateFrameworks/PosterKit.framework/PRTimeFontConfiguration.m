@implementation PRTimeFontConfiguration

- (PRTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3
{
  id v4;
  PRTimeFontConfiguration *v5;

  v4 = a3;
  -[PRTimeFontConfiguration _defaultWeightForTimeFontIdentifier:](self, "_defaultWeightForTimeFontIdentifier:", v4);
  v5 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:weight:](self, "initWithTimeFontIdentifier:weight:", v4);

  return v5;
}

- (PRTimeFontConfiguration)initWithTimeFontIdentifier:(id)a3 weight:(double)a4
{
  id v6;
  PRTimeFontConfiguration *v7;
  uint64_t v8;
  NSString *timeFontIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRTimeFontConfiguration;
  v7 = -[PRTimeFontConfiguration init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    timeFontIdentifier = v7->_timeFontIdentifier;
    v7->_timeFontIdentifier = (NSString *)v8;

    v7->_weight = a4;
  }

  return v7;
}

- (PRTimeFontConfiguration)initWithCustomFont:(id)a3
{
  id v5;
  PRTimeFontConfiguration *v6;
  PRTimeFontConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRTimeFontConfiguration;
  v6 = -[PRTimeFontConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_customFont, a3);

  return v7;
}

- (PRTimeFontConfiguration)init
{
  void *v3;
  PRTimeFontConfiguration *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "pr_defaultTimeFontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:](self, "initWithTimeFontIdentifier:", v3);

  return v4;
}

- (UIFont)effectiveFont
{
  return (UIFont *)-[PRTimeFontConfiguration effectiveFontForRole:](self, "effectiveFontForRole:", CFSTR("PRPosterRoleLockScreen"));
}

- (id)effectiveFontForRole:(id)a3
{
  return -[PRTimeFontConfiguration effectiveFontForRole:ignoringWeight:](self, "effectiveFontForRole:ignoringWeight:", a3, 0);
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
  -[PRTimeFontConfiguration customFont](self, "customFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PRTimeFontConfiguration customFont](self, "customFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0DC1350];
    -[PRTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pr_fontWithTimeFontIdentifier:forRole:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v12 = v11;
    }
    else
    {
      -[PRTimeFontConfiguration weight](self, "weight");
      objc_msgSend(v11, "pr_fontWithVariantWeight:forRole:", (unint64_t)v13, v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v12;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PRTimeFontConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PRTimeFontConfiguration *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (PRTimeFontConfiguration *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PRTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRTimeFontConfiguration timeFontIdentifier](v7, "timeFontIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10
        && (-[PRTimeFontConfiguration weight](self, "weight"),
            -[PRTimeFontConfiguration weight](v7, "weight"),
            BSFloatEqualToFloat()))
      {
        -[PRTimeFontConfiguration customFont](self, "customFont");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRTimeFontConfiguration customFont](v7, "customFont");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = BSEqualObjects();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
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

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[PRTimeFontConfiguration weight](self, "weight");
  v6 = (id)objc_msgSend(v3, "appendCGFloat:");
  -[PRTimeFontConfiguration customFont](self, "customFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  v9 = objc_msgSend(v3, "hash");
  return v9;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRTimeFontConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __38__PRTimeFontConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __38__PRTimeFontConfiguration_description__block_invoke(uint64_t a1)
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
  -[PRTimeFontConfiguration timeFontIdentifier](self, "timeFontIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:skipIfEmpty:", v4, CFSTR("timeFontIdentifier"), 1);

  -[PRTimeFontConfiguration weight](self, "weight");
  v5 = (id)objc_msgSend(v8, "appendFloat:withName:", CFSTR("weight"));
  -[PRTimeFontConfiguration customFont](self, "customFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v6, CFSTR("customFont"), 1);

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

- (NSString)timeFontIdentifier
{
  return self->_timeFontIdentifier;
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
  objc_storeStrong((id *)&self->_timeFontIdentifier, 0);
}

@end
