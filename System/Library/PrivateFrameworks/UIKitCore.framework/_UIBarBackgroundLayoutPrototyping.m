@implementation _UIBarBackgroundLayoutPrototyping

+ (void)registerPrototypingCallback:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *aBlock;

  v3 = a3;
  v4 = helper;
  aBlock = v3;
  if (!helper)
  {
    v5 = objc_opt_new();
    v6 = (void *)helper;
    helper = v5;

    v7 = objc_opt_new();
    v8 = *(void **)(helper + 8);
    *(_QWORD *)(helper + 8) = v7;

    +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addKeyObserver:", helper);

    v3 = aBlock;
    v4 = helper;
  }
  v10 = *(void **)(v4 + 8);
  v11 = _Block_copy(v3);
  objc_msgSend(v10, "addObject:", v11);

}

+ (BOOL)prototypingEnabled
{
  void *v2;
  BOOL v3;

  +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundMode") != 0;

  return v3;
}

+ (id)prototypingLayoutForBarType:(int64_t)a3
{
  _QWORD *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;

  v4 = prototypingLayoutForBarType__layouts[a3];
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = prototypingLayoutForBarType__layouts[a3];
    prototypingLayoutForBarType__layouts[a3] = v5;

    v4 = v5;
    switch(a3)
    {
      case 1:
        v7 = 1.0;
        break;
      case 2:
        v7 = 0.0;
        v8 = 1.0;
        v9 = 1.0;
        goto LABEL_9;
      case 3:
        v7 = 0.0;
        break;
      default:
        +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.25);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
    }
    v8 = 1.0;
    v9 = 0.0;
LABEL_9:
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v7, v8, v9, 0.25);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v11 = (void *)v4[11];
    v4[11] = v10;

  }
  return v4;
}

- (BOOL)shouldUseExplicitGeometry
{
  return 0;
}

- (id)bg1Effects
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "backgroundMode") == 2)
  {
    +[UIBlurEffect _effectWithBlurRadius:scale:](UIBlurEffect, "_effectWithBlurRadius:scale:", 10.0, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)bg1Color
{
  void *v3;
  UIColor *colorWash;
  UIColor *v5;

  +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "colorByBarType"))
    colorWash = self->_colorWash;
  else
    colorWash = 0;
  v5 = colorWash;

  return v5;
}

- (BOOL)bg1HasShadow
{
  void *v2;
  char v3;

  +[_UIBarSettingsDomain rootSettings](_UIBarSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "retainShadow");

  return v3;
}

- (id)bg1ShadowColor
{
  void *v2;
  void *v3;

  +[_UIBarBackgroundAppearanceData standardBackgroundData](_UIBarBackgroundAppearanceData, "standardBackgroundData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)describeInto:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBarBackgroundLayoutPrototyping;
  v4 = a3;
  -[_UIBarBackgroundLayout describeInto:](&v5, sel_describeInto_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR(" colorWash=%@"), self->_colorWash);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorWash, 0);
}

@end
