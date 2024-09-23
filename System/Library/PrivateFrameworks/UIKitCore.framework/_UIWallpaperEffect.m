@implementation _UIWallpaperEffect

+ (id)wallpaperEffectWithStyle:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithStyle:", a3);
}

- (id)_initWithStyle:(int64_t)a3
{
  _UIWallpaperEffect *v4;
  _UIWallpaperEffect *v5;
  UIColor *color;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIWallpaperEffect;
  v4 = -[_UIWallpaperEffect init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 0:
        +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
        v4 = (_UIWallpaperEffect *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
        v4 = (_UIWallpaperEffect *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
        v4 = (_UIWallpaperEffect *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
        v4 = (_UIWallpaperEffect *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        +[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor");
        v4 = (_UIWallpaperEffect *)objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        +[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor");
        v4 = (_UIWallpaperEffect *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        break;
    }
    color = v5->_color;
    v5->_color = (UIColor *)v4;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _UIWallpaperEffect *v4;
  _UIWallpaperEffect *v5;
  UIColor *color;
  char v7;

  v4 = (_UIWallpaperEffect *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_8;
  }
  color = self->_color;
  if (color == v5->_color)
    goto LABEL_7;
  v7 = -[UIColor isEqual:](color, "isEqual:");
LABEL_8:

  return v7;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return 0;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6;
  _UIWallpaperEffectEntry *v7;

  if (self->_color)
  {
    v6 = a3;
    v7 = objc_alloc_init(_UIWallpaperEffectEntry);
    -[_UIWallpaperEffectEntry setBackgroundColor:](v7, "setBackgroundColor:", self->_color);
    objc_msgSend(v6, "addUnderlay:", v7);

  }
}

- (int64_t)_expectedUsage
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIWallpaperEffect;
  -[_UIWallpaperEffect description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" color=%@"), self->_color);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
