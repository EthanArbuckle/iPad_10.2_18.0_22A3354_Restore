@implementation PUIPosterLegibilitySettings

+ (id)legibilitySettingsWithUILegibilitySettings:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  PUIPosterLegibilitySettings *v6;
  void *v7;
  void *v8;
  void *v9;
  PUIPosterLegibilitySettings *v10;
  uint64_t v11;
  _UILegibilitySettings *specifiedLegibilitySettings;
  void *v14;

  v3 = a3;
  NSClassFromString(CFSTR("_UILegibilitySettings"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PUIPosterLegibilitySettings legibilitySettingsWithUILegibilitySettings:].cold.1();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244663B44);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:_UILegibilitySettingsClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PUIPosterLegibilitySettings legibilitySettingsWithUILegibilitySettings:].cold.1();
    goto LABEL_12;
  }

  v4 = objc_msgSend(v3, "style");
  if (v4 == 2)
    v5 = 2;
  else
    v5 = v4 == 1;
  v6 = [PUIPosterLegibilitySettings alloc];
  objc_msgSend(v3, "primaryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shadowColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:](v6, "initWithStyle:primaryColor:secondaryColor:shadowColor:", v5, v7, v8, v9);

  v10->_source = 2;
  v11 = objc_msgSend(v3, "copy");
  specifiedLegibilitySettings = v10->_specifiedLegibilitySettings;
  v10->_specifiedLegibilitySettings = (_UILegibilitySettings *)v11;

  return v10;
}

+ (id)legibilitySettingsForContentColor:(id)a3 contrast:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v15;

  v6 = a3;
  NSClassFromString(CFSTR("UIColor"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PUIPosterLegibilitySettings legibilitySettingsForContentColor:contrast:].cold.1();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244663D40);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:UIColorClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PUIPosterLegibilitySettings legibilitySettingsForContentColor:contrast:].cold.1();
    goto LABEL_12;
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF70F0]), "initWithContentColor:contrast:", v6, a4);
  v8 = objc_msgSend(v7, "style");
  if (v8 == 2)
    v9 = 2;
  else
    v9 = v8 == 1;
  objc_msgSend(v7, "primaryColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secondaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shadowColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "legibilitySettingsForStyle:primaryColor:secondaryColor:shadowColor:", v9, v10, v11, v12);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setContentColor:", v6);
  objc_msgSend(v13, "setContrast:", a4);
  v13[6] = 1;

  return v13;
}

+ (id)legibilitySettingsForStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:primaryColor:secondaryColor:shadowColor:", a3, v12, v11, v10);

  return v13;
}

- (PUIPosterLegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("style == PUIPosterLegibilityStyleNone || style == PUIPosterLegibilityStyleLightContentWithDarkShadow || style == PUIPosterLegibilityStyleDarkContentWithLightShadow"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.1();
LABEL_33:
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244664000);
  }
  v13 = v10;
  NSClassFromString(CFSTR("UIColor"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.2();
    goto LABEL_33;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:UIColorClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244664064);
  }

  v14 = v11;
  NSClassFromString(CFSTR("UIColor"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.3();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446640C8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:UIColorClass]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.3();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24466412CLL);
  }

  v15 = v12;
  NSClassFromString(CFSTR("UIColor"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.4();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244664190);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:UIColorClass]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:].cold.4();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446641F4);
  }

LABEL_10:
  v35.receiver = self;
  v35.super_class = (Class)PUIPosterLegibilitySettings;
  v16 = -[PUIPosterLegibilitySettings init](&v35, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v10, "copy");
    v18 = (void *)*((_QWORD *)v16 + 7);
    *((_QWORD *)v16 + 7) = v17;

    v19 = objc_msgSend(v11, "copy");
    v20 = (void *)*((_QWORD *)v16 + 8);
    *((_QWORD *)v16 + 8) = v19;

    v21 = objc_msgSend(v12, "copy");
    v22 = (void *)*((_QWORD *)v16 + 9);
    *((_QWORD *)v16 + 9) = v21;

    *((_QWORD *)v16 + 5) = a3;
    *((_QWORD *)v16 + 6) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v16 + 24) = _Q0;
  }

  return (PUIPosterLegibilitySettings *)v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PUIPosterLegibilitySettings *v4;
  uint64_t v5;
  UIColor *contentColor;
  uint64_t v7;
  _UILegibilitySettings *specifiedLegibilitySettings;

  v4 = -[PUIPosterLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:](+[PUIPosterLegibilitySettings allocWithZone:](PUIPosterLegibilitySettings, "allocWithZone:", a3), "initWithStyle:primaryColor:secondaryColor:shadowColor:", self->_style, self->_primaryColor, self->_secondaryColor, self->_shadowColor);
  v4->_contrast = self->_contrast;
  v4->_shadowRadiusMultiplier = self->_shadowRadiusMultiplier;
  v4->_shadowAlphaOverride = self->_shadowAlphaOverride;
  v5 = -[UIColor copy](self->_contentColor, "copy");
  contentColor = v4->_contentColor;
  v4->_contentColor = (UIColor *)v5;

  v7 = -[_UILegibilitySettings copy](self->_specifiedLegibilitySettings, "copy");
  specifiedLegibilitySettings = v4->_specifiedLegibilitySettings;
  v4->_specifiedLegibilitySettings = (_UILegibilitySettings *)v7;

  return v4;
}

- (id)convertToUILegibility
{
  _UILegibilitySettings *specifiedLegibilitySettings;
  id v4;
  int64_t style;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _UILegibilitySettings *v10;
  _UILegibilitySettings *cachedLegibilitySettings;
  _UILegibilitySettings *v12;
  double v13;
  _UILegibilitySettings *v14;
  double v15;

  specifiedLegibilitySettings = self->_specifiedLegibilitySettings;
  if (!specifiedLegibilitySettings)
  {
    specifiedLegibilitySettings = self->_cachedLegibilitySettings;
    if (!specifiedLegibilitySettings)
    {
      v4 = objc_alloc(MEMORY[0x24BDF70F0]);
      style = self->_style;
      if (style == 2)
        v6 = 2;
      else
        v6 = style == 1;
      -[PUIPosterLegibilitySettings primaryColor](self, "primaryColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterLegibilitySettings secondaryColor](self, "secondaryColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterLegibilitySettings shadowColor](self, "shadowColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (_UILegibilitySettings *)objc_msgSend(v4, "initWithStyle:primaryColor:secondaryColor:shadowColor:", v6, v7, v8, v9);
      cachedLegibilitySettings = self->_cachedLegibilitySettings;
      self->_cachedLegibilitySettings = v10;

      if (self->_shadowRadiusMultiplier != 1.0)
      {
        v12 = self->_cachedLegibilitySettings;
        -[_UILegibilitySettings shadowRadius](v12, "shadowRadius");
        -[_UILegibilitySettings setShadowRadius:](v12, "setShadowRadius:", v13 * self->_shadowRadiusMultiplier);
        v14 = self->_cachedLegibilitySettings;
        -[_UILegibilitySettings imageOutset](v14, "imageOutset");
        -[_UILegibilitySettings setImageOutset:](v14, "setImageOutset:", v15 * self->_shadowRadiusMultiplier);
      }
      if (self->_shadowAlphaOverride != 1.0)
        -[_UILegibilitySettings setShadowAlpha:](self->_cachedLegibilitySettings, "setShadowAlpha:");
      specifiedLegibilitySettings = self->_cachedLegibilitySettings;
    }
  }
  return specifiedLegibilitySettings;
}

- (id)legibilitySettingsByApplyingShadowRadiusMultiplier:(double)a3
{
  double *v4;

  v4 = -[PUIPosterLegibilitySettings copyWithZone:](self, "copyWithZone:", 0);
  v4[4] = a3;
  return v4;
}

- (id)legibilitySettingsByOverridingShadowAlpha:(double)a3
{
  double *v4;

  v4 = -[PUIPosterLegibilitySettings copyWithZone:](self, "copyWithZone:", 0);
  v4[3] = a3;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PUIPosterLegibilitySettings *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (PUIPosterLegibilitySettings *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0
      && -[PUIPosterLegibilitySettings isEqualToLegibilitySettings:](self, "isEqualToLegibilitySettings:", v4);
  }

  return v7;
}

- (BOOL)isEqualToLegibilitySettings:(id)a3
{
  PUIPosterLegibilitySettings *v4;
  PUIPosterLegibilitySettings *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  char v18;

  v4 = (PUIPosterLegibilitySettings *)a3;
  v5 = v4;
  if (self == v4)
  {
    v18 = 1;
  }
  else if (v4
         && (v6 = -[PUIPosterLegibilitySettings style](v4, "style"),
             v6 == -[PUIPosterLegibilitySettings style](self, "style")))
  {
    -[PUIPosterLegibilitySettings convertToUILegibility](self, "convertToUILegibility");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIPosterLegibilitySettings convertToUILegibility](v5, "convertToUILegibility");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primaryColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualObjects();

    if (!v11)
      goto LABEL_13;
    objc_msgSend(v8, "secondaryColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secondaryColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSEqualObjects();

    if (!v14)
      goto LABEL_13;
    objc_msgSend(v8, "shadowColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shadowColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = BSEqualObjects();

    if (!v17)
      goto LABEL_13;
    objc_msgSend(v7, "shadowRadius");
    objc_msgSend(v8, "shadowRadius");
    if (BSFloatEqualToFloat()
      && (objc_msgSend(v7, "shadowAlpha"), objc_msgSend(v8, "shadowAlpha"), BSFloatEqualToFloat())
      && (objc_msgSend(v7, "imageOutset"), objc_msgSend(v8, "imageOutset"), BSFloatEqualToFloat()))
    {
      objc_msgSend(v7, "minFillHeight");
      objc_msgSend(v8, "minFillHeight");
      v18 = BSFloatEqualToFloat();
    }
    else
    {
LABEL_13:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;

  -[PUIPosterLegibilitySettings convertToUILegibility](self, "convertToUILegibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", objc_msgSend(v2, "style"));
  objc_msgSend(v2, "primaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:", v5);

  objc_msgSend(v2, "secondaryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  objc_msgSend(v2, "shadowColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:", v9);

  objc_msgSend(v2, "shadowRadius");
  v11 = (id)objc_msgSend(v3, "appendCGFloat:");
  objc_msgSend(v2, "shadowAlpha");
  v12 = (id)objc_msgSend(v3, "appendCGFloat:");
  objc_msgSend(v2, "imageOutset");
  v13 = (id)objc_msgSend(v3, "appendCGFloat:");
  objc_msgSend(v2, "minFillHeight");
  v14 = (id)objc_msgSend(v3, "appendCGFloat:");
  v15 = objc_msgSend(v3, "hash");

  return v15;
}

- (NSString)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  int64_t style;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUIPosterLegibilitySettings source](self, "source");
  switch(v4)
  {
    case 2:
      v14 = (id)objc_msgSend(v3, "appendObject:withName:", self->_specifiedLegibilitySettings, CFSTR("specifiedLegibilitySettings"));
      break;
    case 1:
      style = self->_style;
      v16 = CFSTR("None");
      if (style == 1)
        v16 = CFSTR("LightContentWithDarkShadow");
      if (style == 2)
        v17 = CFSTR("DarkContentWithLightShadow");
      else
        v17 = v16;
      objc_msgSend(v3, "appendString:withName:", v17, CFSTR("style"));
      -[PUIPosterLegibilitySettings contentColor](self, "contentColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v18, CFSTR("contentColor"), 1);

      -[PUIPosterLegibilitySettings contrast](self, "contrast");
      v20 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("contrast"), 5);
      break;
    case 0:
      v5 = self->_style;
      v6 = CFSTR("None");
      if (v5 == 1)
        v6 = CFSTR("LightContentWithDarkShadow");
      if (v5 == 2)
        v7 = CFSTR("DarkContentWithLightShadow");
      else
        v7 = v6;
      objc_msgSend(v3, "appendString:withName:", v7, CFSTR("style"));
      -[PUIPosterLegibilitySettings primaryColor](self, "primaryColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("primaryColor"), 1);

      -[PUIPosterLegibilitySettings secondaryColor](self, "secondaryColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("secondaryColor"), 1);

      -[PUIPosterLegibilitySettings shadowColor](self, "shadowColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v12, CFSTR("shadowColor"), 1);

      break;
  }
  if (self->_shadowAlphaOverride != 1.0)
    v21 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("shadowAlphaOverride"), 2);
  if (self->_shadowRadiusMultiplier != 1.0)
    v22 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("shadowRadiusMultiplier"), 2);
  objc_msgSend(v3, "build");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v23;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PUIPosterLegibilitySettings source](self, "source"))
  {
    if (-[PUIPosterLegibilitySettings source](self, "source") == 1)
    {
      -[PUIPosterLegibilitySettings contentColor](self, "contentColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("contentColor"));

      -[PUIPosterLegibilitySettings contrast](self, "contrast");
      objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("contrast"));
    }
    else if (-[PUIPosterLegibilitySettings source](self, "source") == 2)
    {
      objc_msgSend(v8, "encodeObject:forKey:", self->_specifiedLegibilitySettings, CFSTR("specifiedLegibilitySettings"));
    }
  }
  else
  {
    -[PUIPosterLegibilitySettings primaryColor](self, "primaryColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("primaryColor"));

    -[PUIPosterLegibilitySettings shadowColor](self, "shadowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("shadowColor"));

    -[PUIPosterLegibilitySettings secondaryColor](self, "secondaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("secondaryColor"));

  }
  objc_msgSend(v8, "encodeInt64:forKey:", -[PUIPosterLegibilitySettings style](self, "style"), CFSTR("legibilityStyle"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[PUIPosterLegibilitySettings source](self, "source"), CFSTR("source"));
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("shadowAlphaOverride"), self->_shadowAlphaOverride);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("shadowRadiusMultiplier"), self->_shadowRadiusMultiplier);

}

- (PUIPosterLegibilitySettings)initWithBSXPCCoder:(id)a3
{
  id v4;
  PUIPosterLegibilitySettings *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *secondaryColor;
  void *v11;
  uint64_t v12;
  UIColor *primaryColor;
  void *v14;
  uint64_t v15;
  UIColor *shadowColor;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  UIColor *contentColor;
  double v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PUIPosterLegibilitySettings;
  v5 = -[PUIPosterLegibilitySettings init](&v23, sel_init);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("legibilityStyle"));
    v5->_source = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shadowAlphaOverride"));
    v5->_shadowAlphaOverride = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shadowRadiusMultiplier"));
    v5->_shadowRadiusMultiplier = v7;
    if (!-[PUIPosterLegibilitySettings source](v5, "source"))
    {
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("primaryColor"));
      v12 = objc_claimAutoreleasedReturnValue();
      primaryColor = v5->_primaryColor;
      v5->_primaryColor = (UIColor *)v12;

      objc_opt_self();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("shadowColor"));
      v15 = objc_claimAutoreleasedReturnValue();
      shadowColor = v5->_shadowColor;
      v5->_shadowColor = (UIColor *)v15;

      objc_opt_self();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("secondaryColor"));
      v17 = objc_claimAutoreleasedReturnValue();
      secondaryColor = v5->_secondaryColor;
      v5->_secondaryColor = (UIColor *)v17;
      goto LABEL_6;
    }
    if (-[PUIPosterLegibilitySettings source](v5, "source") == 2)
    {
      objc_opt_self();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("specifiedLegibilitySettings"));
      v9 = objc_claimAutoreleasedReturnValue();
      secondaryColor = v5->_specifiedLegibilitySettings;
      v5->_specifiedLegibilitySettings = (_UILegibilitySettings *)v9;
LABEL_6:

      goto LABEL_7;
    }
    if (-[PUIPosterLegibilitySettings source](v5, "source") == 1)
    {
      objc_opt_self();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, CFSTR("contentColor"));
      v20 = objc_claimAutoreleasedReturnValue();
      contentColor = v5->_contentColor;
      v5->_contentColor = (UIColor *)v20;

      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("contrast"));
      v5->_contrast = v22;
    }
  }
LABEL_7:

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PUIPosterLegibilitySettings)initWithCoder:(id)a3
{
  id v4;
  PUIPosterLegibilitySettings *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *secondaryColor;
  void *v11;
  uint64_t v12;
  UIColor *primaryColor;
  void *v14;
  uint64_t v15;
  UIColor *shadowColor;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  UIColor *contentColor;
  double v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PUIPosterLegibilitySettings;
  v5 = -[PUIPosterLegibilitySettings init](&v23, sel_init);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("legibilityStyle"));
    v5->_source = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shadowAlphaOverride"));
    v5->_shadowAlphaOverride = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shadowRadiusMultiplier"));
    v5->_shadowRadiusMultiplier = v7;
    if (!-[PUIPosterLegibilitySettings source](v5, "source"))
    {
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("primaryColor"));
      v12 = objc_claimAutoreleasedReturnValue();
      primaryColor = v5->_primaryColor;
      v5->_primaryColor = (UIColor *)v12;

      objc_opt_self();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("shadowColor"));
      v15 = objc_claimAutoreleasedReturnValue();
      shadowColor = v5->_shadowColor;
      v5->_shadowColor = (UIColor *)v15;

      objc_opt_self();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("secondaryColor"));
      v17 = objc_claimAutoreleasedReturnValue();
      secondaryColor = v5->_secondaryColor;
      v5->_secondaryColor = (UIColor *)v17;
      goto LABEL_6;
    }
    if (-[PUIPosterLegibilitySettings source](v5, "source") == 2)
    {
      objc_opt_self();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("specifiedLegibilitySettings"));
      v9 = objc_claimAutoreleasedReturnValue();
      secondaryColor = v5->_specifiedLegibilitySettings;
      v5->_specifiedLegibilitySettings = (_UILegibilitySettings *)v9;
LABEL_6:

      goto LABEL_7;
    }
    if (-[PUIPosterLegibilitySettings source](v5, "source") == 1)
    {
      objc_opt_self();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, CFSTR("contentColor"));
      v20 = objc_claimAutoreleasedReturnValue();
      contentColor = v5->_contentColor;
      v5->_contentColor = (UIColor *)v20;

      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("contrast"));
      v5->_contrast = v22;
    }
  }
LABEL_7:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PUIPosterLegibilitySettings source](self, "source"))
  {
    if (-[PUIPosterLegibilitySettings source](self, "source") == 1)
    {
      -[PUIPosterLegibilitySettings contentColor](self, "contentColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("contentColor"));

      -[PUIPosterLegibilitySettings contrast](self, "contrast");
      objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("contrast"));
    }
    else if (-[PUIPosterLegibilitySettings source](self, "source") == 2)
    {
      objc_msgSend(v8, "encodeObject:forKey:", self->_specifiedLegibilitySettings, CFSTR("specifiedLegibilitySettings"));
    }
  }
  else
  {
    -[PUIPosterLegibilitySettings primaryColor](self, "primaryColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("primaryColor"));

    -[PUIPosterLegibilitySettings shadowColor](self, "shadowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("shadowColor"));

    -[PUIPosterLegibilitySettings secondaryColor](self, "secondaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("secondaryColor"));

  }
  objc_msgSend(v8, "encodeInt64:forKey:", -[PUIPosterLegibilitySettings style](self, "style"), CFSTR("legibilityStyle"));
  objc_msgSend(v8, "encodeInt64:forKey:", -[PUIPosterLegibilitySettings source](self, "source"), CFSTR("source"));
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("shadowAlphaOverride"), self->_shadowAlphaOverride);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("shadowRadiusMultiplier"), self->_shadowRadiusMultiplier);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)source
{
  return self->_source;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColor, a3);
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryColor, a3);
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void)setContentColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)contrast
{
  return self->_contrast;
}

- (void)setContrast:(double)a3
{
  self->_contrast = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_specifiedLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_cachedLegibilitySettings, 0);
}

+ (void)legibilitySettingsWithUILegibilitySettings:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)legibilitySettingsForContentColor:contrast:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithStyle:primaryColor:secondaryColor:shadowColor:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithStyle:primaryColor:secondaryColor:shadowColor:.cold.2()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithStyle:primaryColor:secondaryColor:shadowColor:.cold.3()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithStyle:primaryColor:secondaryColor:shadowColor:.cold.4()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
