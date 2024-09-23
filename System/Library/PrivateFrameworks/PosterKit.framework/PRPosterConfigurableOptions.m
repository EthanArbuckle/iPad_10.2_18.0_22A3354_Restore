@implementation PRPosterConfigurableOptions

- (PRPosterConfigurableOptions)initWithDisplayNameLocalizationKey:(id)a3 role:(id)a4 ambientSupportedDataLayout:(int64_t)a5 preferredTimeFontConfigurations:(id)a6 preferredTitleColors:(id)a7 preferredHomeScreenConfiguration:(id)a8
{
  return (PRPosterConfigurableOptions *)-[PRPosterConfigurableOptions _initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:](self, "_initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", a3, a4, a5, a6, a7, a8, 0.5);
}

- (id)_initWithDisplayNameLocalizationKey:(id)a3 role:(id)a4 ambientSupportedDataLayout:(int64_t)a5 preferredTimeFontConfigurations:(id)a6 preferredTitleColors:(id)a7 luminance:(double)a8 preferredHomeScreenConfiguration:(id)a9
{
  __CFString *v16;
  PRPosterConfigurableOptions *v17;
  PRPosterConfigurableOptions *v18;
  __CFString *v19;

  v16 = (__CFString *)a4;
  v17 = -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:](self, "initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", a3, a5, a6, a7, a9, a8);
  v18 = v17;
  if (v17)
  {
    if (v16)
      v19 = v16;
    else
      v19 = CFSTR("PRPosterRoleLockScreen");
    objc_storeStrong((id *)&v17->_role, v19);
  }

  return v18;
}

- (PRPosterConfigurableOptions)initWithDisplayNameLocalizationKey:(id)a3 ambientSupportedDataLayout:(int64_t)a4 preferredTimeFontConfigurations:(id)a5 preferredTitleColors:(id)a6 luminance:(double)a7 preferredHomeScreenConfiguration:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PRPosterConfigurableOptions *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PRPosterConfigurableOptions;
  v18 = -[PRPosterConfigurableOptions init](&v27, sel_init);
  if (v18)
  {
    v19 = v14;
    if (v19 && (NSClassFromString(CFSTR("NSString")), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:].cold.4();
    }
    else
    {

      v20 = v15;
      if (v20)
      {
        NSClassFromString(CFSTR("NSArray"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:].cold.3();
          objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18B653D80);
        }
      }

      v21 = v16;
      if (v21)
      {
        NSClassFromString(CFSTR("NSArray"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:].cold.2();
          objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18B653DE4);
        }
      }

      v22 = v17;
      if (!v22
        || (NSClassFromString(CFSTR("PRPosterDescriptorHomeScreenConfiguration")),
            (objc_opt_isKindOfClass() & 1) != 0))
      {

        -[PRPosterConfigurableOptions setDisplayNameLocalizationKey:](v18, "setDisplayNameLocalizationKey:", v19);
        -[PRPosterConfigurableOptions setAmbientSupportedDataLayout:](v18, "setAmbientSupportedDataLayout:", a4);
        -[PRPosterConfigurableOptions setPreferredTimeFontConfigurations:](v18, "setPreferredTimeFontConfigurations:", v20);
        -[PRPosterConfigurableOptions setPreferredTitleColors:](v18, "setPreferredTitleColors:", v21);
        -[PRPosterConfigurableOptions setLuminance:](v18, "setLuminance:", a7);
        -[PRPosterConfigurableOptions setPreferredHomeScreenConfiguration:](v18, "setPreferredHomeScreenConfiguration:", v22);
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterDescriptorHomeScreenConfigurationClass]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B653D1CLL);
  }
LABEL_11:

  return v18;
}

- (PRPosterConfigurableOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  PRPosterConfigurableOptions *v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameLocalizationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ambientSupportedDataLayout"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v8, CFSTR("preferredTitleColors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClasses:forKey:", v13, CFSTR("preferredTimeFontConfigurations"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("luminance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    v18 = v17;
  }
  else
  {
    v18 = 0.5;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredHomeScreenConfiguration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PRPosterConfigurableOptions _initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:](self, "_initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", v5, v6, v7, v14, v9, v19, v18);

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PRPosterConfigurableOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("displayNameLocalizationKey"));

  -[PRPosterConfigurableOptions role](self, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PRPosterConfigurableOptions role](self, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("role"));

  }
  objc_msgSend(v12, "encodeInt64:forKey:", -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"), CFSTR("ambientSupportedDataLayout"));
  -[PRPosterConfigurableOptions preferredTimeFontConfigurations](self, "preferredTimeFontConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("preferredTimeFontConfigurations"));

  -[PRPosterConfigurableOptions preferredTitleColors](self, "preferredTitleColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("preferredTitleColors"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PRPosterConfigurableOptions luminance](self, "luminance");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("luminance"));

  -[PRPosterConfigurableOptions preferredHomeScreenConfiguration](self, "preferredHomeScreenConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("preferredHomeScreenConfiguration"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterConfigurableOptions *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v4 = [PRPosterConfigurableOptions alloc];
  -[PRPosterConfigurableOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfigurableOptions role](self, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout");
  -[PRPosterConfigurableOptions preferredTimeFontConfigurations](self, "preferredTimeFontConfigurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfigurableOptions preferredTitleColors](self, "preferredTitleColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfigurableOptions luminance](self, "luminance");
  v11 = v10;
  -[PRPosterConfigurableOptions preferredHomeScreenConfiguration](self, "preferredHomeScreenConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PRPosterConfigurableOptions _initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:](v4, "_initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", v5, v6, v7, v8, v9, v12, v11);

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRPosterMutableConfigurableOptions *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v4 = [PRPosterMutableConfigurableOptions alloc];
  -[PRPosterConfigurableOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfigurableOptions role](self, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout");
  -[PRPosterConfigurableOptions preferredTimeFontConfigurations](self, "preferredTimeFontConfigurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfigurableOptions preferredTitleColors](self, "preferredTitleColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfigurableOptions luminance](self, "luminance");
  v11 = v10;
  -[PRPosterConfigurableOptions preferredHomeScreenConfiguration](self, "preferredHomeScreenConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PRPosterConfigurableOptions _initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:](v4, "_initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", v5, v6, v7, v8, v9, v12, v11);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterConfigurableOptions *v4;
  BOOL v5;

  v4 = (PRPosterConfigurableOptions *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PRPosterConfigurableOptions isEqualToConfigurableOptions:](self, "isEqualToConfigurableOptions:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConfigurableOptions:(id)a3
{
  PRPosterConfigurableOptions *v4;
  PRPosterConfigurableOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;

  v4 = (PRPosterConfigurableOptions *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4)
  {
    -[PRPosterConfigurableOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterConfigurableOptions displayNameLocalizationKey](v5, "displayNameLocalizationKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualObjects())
    {
      -[PRPosterConfigurableOptions role](self, "role");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfigurableOptions role](v5, "role");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects()
        && (-[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"),
            -[PRPosterConfigurableOptions ambientSupportedDataLayout](v5, "ambientSupportedDataLayout"),
            BSEqualDoubles()))
      {
        -[PRPosterConfigurableOptions preferredTimeFontConfigurations](self, "preferredTimeFontConfigurations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterConfigurableOptions preferredTimeFontConfigurations](v5, "preferredTimeFontConfigurations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[PRPosterConfigurableOptions preferredTitleColors](self, "preferredTitleColors");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRPosterConfigurableOptions preferredTitleColors](v5, "preferredTitleColors");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects()
            && (-[PRPosterConfigurableOptions luminance](self, "luminance"),
                -[PRPosterConfigurableOptions luminance](v5, "luminance"),
                BSFloatEqualToFloat()))
          {
            -[PRPosterConfigurableOptions preferredHomeScreenConfiguration](self, "preferredHomeScreenConfiguration");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRPosterConfigurableOptions preferredHomeScreenConfiguration](v5, "preferredHomeScreenConfiguration");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = BSEqualObjects();

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  -[PRPosterConfigurableOptions preferredTimeFontConfigurations](self, "preferredTimeFontConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfigurableOptions preferredTitleColors](self, "preferredTitleColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfigurableOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendString:", v6);

  -[PRPosterConfigurableOptions role](self, "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PRPosterConfigurableOptions role](self, "role");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v5, "appendString:", v9);

  }
  v11 = (id)objc_msgSend(v5, "appendInt64:", -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"));
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __35__PRPosterConfigurableOptions_hash__block_invoke;
  v25[3] = &unk_1E2183FC0;
  v13 = v5;
  v26 = v13;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v25);
  v20 = v12;
  v21 = 3221225472;
  v22 = __35__PRPosterConfigurableOptions_hash__block_invoke_2;
  v23 = &unk_1E2183FE8;
  v24 = v13;
  v14 = v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v20);
  -[PRPosterConfigurableOptions luminance](self, "luminance", v20, v21, v22, v23);
  v15 = (id)objc_msgSend(v14, "appendCGFloat:");
  -[PRPosterConfigurableOptions preferredHomeScreenConfiguration](self, "preferredHomeScreenConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v14, "appendObject:", v16);

  v18 = objc_msgSend(v14, "hash");
  return v18;
}

id __35__PRPosterConfigurableOptions_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
}

id __35__PRPosterConfigurableOptions_hash__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
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
  PRPosterConfigurableOptions *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __42__PRPosterConfigurableOptions_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __42__PRPosterConfigurableOptions_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterConfigurableOptions)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  PRPosterConfigurableOptions *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("displayNameLocalizationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, v7, CFSTR("preferredTimeFontConfigurations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeStringForKey:", CFSTR("role"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ambientSupportedDataLayout"));
  v11 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v11, objc_opt_class(), CFSTR("preferredTitleColors"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("luminance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "doubleValue");
    v16 = v15;
  }
  else
  {
    v16 = 0.5;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredHomeScreenConfiguration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PRPosterConfigurableOptions _initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:](self, "_initWithDisplayNameLocalizationKey:role:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", v5, v9, v10, v8, v12, v17, v16);

  return v18;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PRPosterConfigurableOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("displayNameLocalizationKey"));

  -[PRPosterConfigurableOptions role](self, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PRPosterConfigurableOptions role](self, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("role"));

  }
  objc_msgSend(v12, "encodeInt64:forKey:", -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"), CFSTR("ambientSupportedDataLayout"));
  -[PRPosterConfigurableOptions preferredTimeFontConfigurations](self, "preferredTimeFontConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("preferredTimeFontConfigurations"));

  -[PRPosterConfigurableOptions preferredTitleColors](self, "preferredTitleColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("preferredTitleColors"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PRPosterConfigurableOptions luminance](self, "luminance");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("luminance"));

  -[PRPosterConfigurableOptions preferredHomeScreenConfiguration](self, "preferredHomeScreenConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("preferredHomeScreenConfiguration"));

}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  -[PRPosterConfigurableOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:withName:skipIfEmpty:", v4, CFSTR("displayNameLocalizationKey"), 1);

  -[PRPosterConfigurableOptions role](self, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:withName:skipIfEmpty:", v5, CFSTR("role"), 1);

  v6 = (id)objc_msgSend(v14, "appendInt64:withName:", -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"), CFSTR("ambientSupportedDataLayout"));
  -[PRPosterConfigurableOptions preferredTitleColors](self, "preferredTitleColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v14, "appendObject:withName:", v7, CFSTR("preferredTitleColors"));

  -[PRPosterConfigurableOptions preferredTimeFontConfigurations](self, "preferredTimeFontConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v14, "appendObject:withName:", v9, CFSTR("preferredTimeFontConfigurations"));

  -[PRPosterConfigurableOptions luminance](self, "luminance");
  v11 = (id)objc_msgSend(v14, "appendDouble:withName:decimalPrecision:", CFSTR("luminance"), 4);
  -[PRPosterConfigurableOptions preferredHomeScreenConfiguration](self, "preferredHomeScreenConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v14, "appendObject:withName:", v12, CFSTR("preferredHomeScreenConfiguration"));

}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)ambientSupportedDataLayout
{
  return self->_ambientSupportedDataLayout;
}

- (void)setAmbientSupportedDataLayout:(int64_t)a3
{
  self->_ambientSupportedDataLayout = a3;
}

- (NSArray)preferredTimeFontConfigurations
{
  return self->_preferredTimeFontConfigurations;
}

- (void)setPreferredTimeFontConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)preferredTitleColors
{
  return self->_preferredTitleColors;
}

- (void)setPreferredTitleColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)luminance
{
  return self->_luminance;
}

- (void)setLuminance:(double)a3
{
  self->_luminance = a3;
}

- (PRPosterDescriptorHomeScreenConfiguration)preferredHomeScreenConfiguration
{
  return self->_preferredHomeScreenConfiguration;
}

- (void)setPreferredHomeScreenConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredHomeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_preferredTitleColors, 0);
  objc_storeStrong((id *)&self->_preferredTimeFontConfigurations, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
}

- (void)initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
