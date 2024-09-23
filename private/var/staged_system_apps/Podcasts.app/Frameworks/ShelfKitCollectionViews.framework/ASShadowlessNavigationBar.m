@implementation ASShadowlessNavigationBar

- (ASShadowlessNavigationBar)init
{
  ASShadowlessNavigationBar *v2;
  ASShadowlessNavigationBar *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASShadowlessNavigationBar;
  v2 = -[ASShadowlessNavigationBar init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASShadowlessNavigationBar standardAppearance](v2, "standardAppearance"));
    objc_msgSend(v4, "setShadowColor:", 0);
    -[ASShadowlessNavigationBar setStandardAppearance:](v3, "setStandardAppearance:", v4);

  }
  return v3;
}

- (void)pushNavigationItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[ASShadowlessNavigationBar _setTitleOpacity:](self, "_setTitleOpacity:", 1.0);
  v7.receiver = self;
  v7.super_class = (Class)ASShadowlessNavigationBar;
  -[ASShadowlessNavigationBar pushNavigationItem:animated:](&v7, "pushNavigationItem:animated:", v6, v4);

}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

@end
