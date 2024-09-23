@implementation PRPosterHomeScreenConfiguration

+ (id)defaultHomeScreenConfigurationForProvider:(id)a3 role:(id)a4
{
  id v5;
  uint64_t v6;
  PRPosterLockPosterHomeScreenAppearance *v7;
  id v8;
  PRPosterSolidColorHomeScreenAppearance *v9;
  PRPosterGradientHomeScreenAppearance *v10;
  PRPosterHomePosterHomeScreenAppearance *v11;
  PRPosterHomeScreenCustomizationConfiguration *v12;
  void *v13;

  v5 = a3;
  if (PFCurrentDeviceClass() == 1)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.EmojiPoster.EmojiPosterExtension")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));
  }
  v7 = -[PRPosterLockPosterHomeScreenAppearance initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:]([PRPosterLockPosterHomeScreenAppearance alloc], "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", v6, objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.GradientPoster.GradientPosterExtension")) ^ 1);
  v8 = objc_alloc((Class)a1);
  v9 = objc_alloc_init(PRPosterSolidColorHomeScreenAppearance);
  v10 = objc_alloc_init(PRPosterGradientHomeScreenAppearance);
  v11 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
  v12 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
  v13 = (void *)objc_msgSend(v8, "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", 0, v7, v9, v10, v11, v12);

  return v13;
}

+ (PRPosterHomeScreenConfiguration)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (PRPosterHomeScreenConfiguration *)+[PRPosterHomeScreenConfiguration allocWithZone:](PRImmutableHomeScreenConfiguration, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PRPosterHomeScreenConfiguration;
  return (PRPosterHomeScreenConfiguration *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (PRPosterHomeScreenConfiguration)init
{
  PRPosterLockPosterHomeScreenAppearance *v3;
  PRPosterSolidColorHomeScreenAppearance *v4;
  PRPosterGradientHomeScreenAppearance *v5;
  PRPosterHomePosterHomeScreenAppearance *v6;
  PRPosterHomeScreenCustomizationConfiguration *v7;
  PRPosterHomeScreenConfiguration *v8;

  v3 = objc_alloc_init(PRPosterLockPosterHomeScreenAppearance);
  v4 = objc_alloc_init(PRPosterSolidColorHomeScreenAppearance);
  v5 = objc_alloc_init(PRPosterGradientHomeScreenAppearance);
  v6 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
  v7 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
  v8 = -[PRPosterHomeScreenConfiguration initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:](self, "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", 0, v3, v4, v5, v6, v7);

  return v8;
}

- (PRPosterHomeScreenConfiguration)initWithSelectedAppearanceType:(unint64_t)a3 lockPosterAppearance:(id)a4 solidColorAppearance:(id)a5 gradientAppearance:(id)a6 homePosterAppearance:(id)a7 customizationConfiguration:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  PRImmutableHomeScreenConfiguration *v22;
  PRPosterHomeScreenConfiguration *p_super;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterHomeScreenConfiguration.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lockPosterAppearance != nil"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterHomeScreenConfiguration.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solidColorAppearance != nil"));

  if (v17)
  {
LABEL_4:
    if (v18)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterHomeScreenConfiguration.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gradientAppearance != nil"));

  if (v18)
  {
LABEL_5:
    if (v19)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterHomeScreenConfiguration.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homePosterAppearance != nil"));

  if (!v19)
LABEL_6:
    v19 = (id)objc_opt_new();
LABEL_7:
  objc_opt_self();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PRPosterHomeScreenConfiguration isMemberOfClass:](self, "isMemberOfClass:", v20);

  if (v21)
  {
    v22 = -[PRImmutableHomeScreenConfiguration initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:]([PRImmutableHomeScreenConfiguration alloc], "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", a3, v15, v16, v17, v18, v19);
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)PRPosterHomeScreenConfiguration;
    v22 = -[PRPosterHomeScreenConfiguration init](&v29, sel_init);
    self = &v22->super;
  }
  p_super = &v22->super;

  return p_super;
}

- (PRPosterHomeScreenConfiguration)initWithHomeScreenConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PRPosterHomeScreenConfiguration *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "selectedAppearanceType");
  objc_msgSend(v4, "lockPosterAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "solidColorAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradientAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homePosterAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customizationConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PRPosterHomeScreenConfiguration initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:](self, "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (PRPosterHomeScreenAppearance)selectedAppearance
{
  void *v3;

  switch(-[PRPosterHomeScreenConfiguration selectedAppearanceType](self, "selectedAppearanceType"))
  {
    case 0:
      -[PRPosterHomeScreenConfiguration lockPosterAppearance](self, "lockPosterAppearance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[PRPosterHomeScreenConfiguration solidColorAppearance](self, "solidColorAppearance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[PRPosterHomeScreenConfiguration gradientAppearance](self, "gradientAppearance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[PRPosterHomeScreenConfiguration homePosterAppearance](self, "homePosterAppearance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return (PRPosterHomeScreenAppearance *)v3;
}

- (id)configurationApplyingColorPickerConfigurationsFromConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PRPosterSolidColorHomeScreenAppearance *v8;
  void *v9;
  void *v10;
  PRPosterSolidColorHomeScreenAppearance *v11;
  void *v12;
  void *v13;
  PRPosterGradientHomeScreenAppearance *v14;
  void *v15;
  void *v16;
  PRPosterGradientHomeScreenAppearance *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)-[PRPosterHomeScreenConfiguration mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "solidColorAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterHomeScreenConfiguration solidColorAppearance](self, "solidColorAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [PRPosterSolidColorHomeScreenAppearance alloc];
  objc_msgSend(v7, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorPickerConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PRPosterSolidColorHomeScreenAppearance initWithColor:colorPickerConfiguration:](v8, "initWithColor:colorPickerConfiguration:", v9, v10);

  objc_msgSend(v5, "setSolidColorAppearance:", v11);
  objc_msgSend(v4, "gradientAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterHomeScreenConfiguration gradientAppearance](self, "gradientAppearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PRPosterGradientHomeScreenAppearance alloc];
  objc_msgSend(v13, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorPickerConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PRPosterGradientHomeScreenAppearance initWithColor:colorPickerConfiguration:](v14, "initWithColor:colorPickerConfiguration:", v15, v16);

  objc_msgSend(v5, "setGradientAppearance:", v17);
  objc_msgSend(v4, "customizationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v5, "setCustomizationConfiguration:", v18);
  }
  else
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v5, "setCustomizationConfiguration:", v19);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterHomeScreenConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PRPosterHomeScreenConfiguration *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;

  v4 = (PRPosterHomeScreenConfiguration *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = -[PRPosterHomeScreenConfiguration selectedAppearanceType](self, "selectedAppearanceType");
      if (v8 != -[PRPosterHomeScreenConfiguration selectedAppearanceType](v7, "selectedAppearanceType"))
        goto LABEL_11;
      -[PRPosterHomeScreenConfiguration lockPosterAppearance](self, "lockPosterAppearance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterHomeScreenConfiguration lockPosterAppearance](v7, "lockPosterAppearance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = BSEqualObjects();

      if (!v11)
        goto LABEL_11;
      -[PRPosterHomeScreenConfiguration solidColorAppearance](self, "solidColorAppearance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterHomeScreenConfiguration solidColorAppearance](v7, "solidColorAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = BSEqualObjects();

      if (!v14)
        goto LABEL_11;
      -[PRPosterHomeScreenConfiguration gradientAppearance](self, "gradientAppearance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterHomeScreenConfiguration gradientAppearance](v7, "gradientAppearance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = BSEqualObjects();

      if (!v17)
        goto LABEL_11;
      -[PRPosterHomeScreenConfiguration homePosterAppearance](self, "homePosterAppearance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterHomeScreenConfiguration homePosterAppearance](v7, "homePosterAppearance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = BSEqualObjects();

      if (v20)
      {
        -[PRPosterHomeScreenConfiguration customizationConfiguration](self, "customizationConfiguration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterHomeScreenConfiguration customizationConfiguration](v7, "customizationConfiguration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = BSEqualObjects();

      }
      else
      {
LABEL_11:
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  v3 = -[PRPosterHomeScreenConfiguration selectedAppearanceType](self, "selectedAppearanceType");
  -[PRPosterHomeScreenConfiguration lockPosterAppearance](self, "lockPosterAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[PRPosterHomeScreenConfiguration solidColorAppearance](self, "solidColorAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[PRPosterHomeScreenConfiguration gradientAppearance](self, "gradientAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[PRPosterHomeScreenConfiguration homePosterAppearance](self, "homePosterAppearance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[PRPosterHomeScreenConfiguration customizationConfiguration](self, "customizationConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
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
  PRPosterHomeScreenConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __46__PRPosterHomeScreenConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __46__PRPosterHomeScreenConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PRPosterHomeScreenConfiguration initWithHomeScreenConfiguration:](+[PRPosterHomeScreenConfiguration allocWithZone:](PRMutablePosterHomeScreenConfiguration, "allocWithZone:", a3), "initWithHomeScreenConfiguration:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PRPosterHomeScreenConfiguration selectedAppearanceType](self, "selectedAppearanceType"), CFSTR("selectedAppearanceType"));
  -[PRPosterHomeScreenConfiguration lockPosterAppearance](self, "lockPosterAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("lockPosterAppearance"));

  -[PRPosterHomeScreenConfiguration solidColorAppearance](self, "solidColorAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("solidColorAppearance"));

  -[PRPosterHomeScreenConfiguration gradientAppearance](self, "gradientAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("gradientAppearance"));

  -[PRPosterHomeScreenConfiguration homePosterAppearance](self, "homePosterAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("homePosterAppearance"));

  -[PRPosterHomeScreenConfiguration customizationConfiguration](self, "customizationConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("customizationConfiguration"));

}

- (PRPosterHomeScreenConfiguration)initWithCoder:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  PRPosterLockPosterHomeScreenAppearance *v6;
  void *v7;
  PRPosterSolidColorHomeScreenAppearance *v8;
  void *v9;
  PRPosterGradientHomeScreenAppearance *v10;
  void *v11;
  PRPosterHomePosterHomeScreenAppearance *v12;
  void *v13;
  PRPosterHomeScreenCustomizationConfiguration *v14;
  unint64_t v15;
  PRPosterHomeScreenConfiguration *v16;

  v3 = a3;
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("selectedAppearanceType"));
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("lockPosterAppearance"));
  v6 = (PRPosterLockPosterHomeScreenAppearance *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, CFSTR("solidColorAppearance"));
  v8 = (PRPosterSolidColorHomeScreenAppearance *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v9, CFSTR("gradientAppearance"));
  v10 = (PRPosterGradientHomeScreenAppearance *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v11, CFSTR("homePosterAppearance"));
  v12 = (PRPosterHomePosterHomeScreenAppearance *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v13, CFSTR("customizationConfiguration"));
  v14 = (PRPosterHomeScreenCustomizationConfiguration *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v6 = objc_alloc_init(PRPosterLockPosterHomeScreenAppearance);
    if (v8)
    {
LABEL_3:
      if (v10)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  v8 = objc_alloc_init(PRPosterSolidColorHomeScreenAppearance);
  if (v10)
  {
LABEL_4:
    if (v12)
      goto LABEL_5;
LABEL_13:
    v12 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
    if (v14)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_12:
  v10 = objc_alloc_init(PRPosterGradientHomeScreenAppearance);
  if (!v12)
    goto LABEL_13;
LABEL_5:
  if (v14)
    goto LABEL_6;
LABEL_14:
  v14 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
LABEL_6:
  if (v4 >= 4)
    v15 = 0;
  else
    v15 = v4;
  v16 = -[PRPosterHomeScreenConfiguration initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:](self, "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", v15, v6, v8, v10, v12, v14);

  return v16;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeUInt64:forKey:", -[PRPosterHomeScreenConfiguration selectedAppearanceType](self, "selectedAppearanceType"), CFSTR("selectedAppearanceType"));
  -[PRPosterHomeScreenConfiguration lockPosterAppearance](self, "lockPosterAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("lockPosterAppearance"));

  -[PRPosterHomeScreenConfiguration solidColorAppearance](self, "solidColorAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("solidColorAppearance"));

  -[PRPosterHomeScreenConfiguration gradientAppearance](self, "gradientAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("gradientAppearance"));

  -[PRPosterHomeScreenConfiguration homePosterAppearance](self, "homePosterAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("homePosterAppearance"));

  -[PRPosterHomeScreenConfiguration customizationConfiguration](self, "customizationConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("customizationConfiguration"));

}

- (PRPosterHomeScreenConfiguration)initWithBSXPCCoder:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  PRPosterLockPosterHomeScreenAppearance *v6;
  void *v7;
  PRPosterSolidColorHomeScreenAppearance *v8;
  void *v9;
  PRPosterGradientHomeScreenAppearance *v10;
  void *v11;
  PRPosterHomePosterHomeScreenAppearance *v12;
  void *v13;
  PRPosterHomeScreenCustomizationConfiguration *v14;
  unint64_t v15;
  PRPosterHomeScreenConfiguration *v16;

  v3 = a3;
  v4 = objc_msgSend(v3, "decodeUInt64ForKey:", CFSTR("selectedAppearanceType"));
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("lockPosterAppearance"));
  v6 = (PRPosterLockPosterHomeScreenAppearance *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, CFSTR("solidColorAppearance"));
  v8 = (PRPosterSolidColorHomeScreenAppearance *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v9, CFSTR("gradientAppearance"));
  v10 = (PRPosterGradientHomeScreenAppearance *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v11, CFSTR("homePosterAppearance"));
  v12 = (PRPosterHomePosterHomeScreenAppearance *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v13, CFSTR("customizationConfiguration"));
  v14 = (PRPosterHomeScreenCustomizationConfiguration *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v6 = objc_alloc_init(PRPosterLockPosterHomeScreenAppearance);
    if (v8)
    {
LABEL_3:
      if (v10)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  v8 = objc_alloc_init(PRPosterSolidColorHomeScreenAppearance);
  if (v10)
  {
LABEL_4:
    if (v12)
      goto LABEL_5;
LABEL_13:
    v12 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
    if (v14)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_12:
  v10 = objc_alloc_init(PRPosterGradientHomeScreenAppearance);
  if (!v12)
    goto LABEL_13;
LABEL_5:
  if (v14)
    goto LABEL_6;
LABEL_14:
  v14 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
LABEL_6:
  if (v4 >= 4)
    v15 = 0;
  else
    v15 = v4;
  v16 = -[PRPosterHomeScreenConfiguration initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:](self, "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", v15, v6, v8, v10, v12, v14);

  return v16;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  unint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v4 = -[PRPosterHomeScreenConfiguration selectedAppearanceType](self, "selectedAppearanceType");
  if (v4 > 3)
    v5 = 0;
  else
    v5 = off_1E2186438[v4];
  objc_msgSend(v16, "appendString:withName:", v5, CFSTR("selectedAppearanceType"));
  -[PRPosterHomeScreenConfiguration lockPosterAppearance](self, "lockPosterAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v16, "appendObject:withName:", v6, CFSTR("lockPosterAppearance"));

  -[PRPosterHomeScreenConfiguration solidColorAppearance](self, "solidColorAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v16, "appendObject:withName:", v8, CFSTR("solidColorAppearance"));

  -[PRPosterHomeScreenConfiguration gradientAppearance](self, "gradientAppearance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v16, "appendObject:withName:", v10, CFSTR("gradientAppearance"));

  -[PRPosterHomeScreenConfiguration homePosterAppearance](self, "homePosterAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v16, "appendObject:withName:", v12, CFSTR("homePosterAppearance"));

  -[PRPosterHomeScreenConfiguration customizationConfiguration](self, "customizationConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v16, "appendObject:withName:skipIfNil:", v14, CFSTR("customizationConfiguration"), 1);

}

- (NSString)attributeType
{
  return (NSString *)CFSTR("PRPosterRoleAttributeTypeHomeScreenConfiguration");
}

- (id)encodeJSON
{
  return sub_18B70D344(self, (uint64_t)a2, PRPosterHomeScreenConfiguration.encodeJSON());
}

+ (id)decodeObjectWithJSON:(id)a3
{
  return sub_18B70E07C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(uint64_t, unint64_t))static PRPosterHomeScreenConfiguration.decodeObject(withJSON:));
}

@end
