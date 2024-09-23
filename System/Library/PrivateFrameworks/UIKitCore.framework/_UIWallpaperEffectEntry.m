@implementation _UIWallpaperEffectEntry

- (void)addEffectToView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIWallpaperEffectEntry backgroundColor](self, "backgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)applyRequestedEffectToView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIWallpaperEffectEntry backgroundColor](self, "backgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)applyIdentityEffectToView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  return 1;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
