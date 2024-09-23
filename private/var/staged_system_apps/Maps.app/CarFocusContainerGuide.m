@implementation CarFocusContainerGuide

- (CarFocusContainerGuide)init
{
  CarFocusContainerGuide *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  CarFocusGuideDebugView *v6;
  UIView *debugView;
  double v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *activationConstraints;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarFocusContainerGuide;
  v2 = -[CarFocusContainerGuide init](&v14, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("__internal_CarVisualizeFocusGuidesDebug"));

    if (v5)
    {
      v6 = -[CarFocusGuideDebugView initWithDirection:]([CarFocusGuideDebugView alloc], "initWithDirection:", 0);
      debugView = v2->_debugView;
      v2->_debugView = (UIView *)v6;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_debugView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v8) = 1148846080;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v2->_debugView, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v2, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allConstraints"));
      objc_msgSend(v3, "addObjectsFromArray:", v10);

    }
    v11 = (NSArray *)objc_msgSend(v3, "copy");
    activationConstraints = v2->_activationConstraints;
    v2->_activationConstraints = v11;

  }
  return v2;
}

+ (id)focusContainerGuideInstalledInView:(id)a3
{
  id v3;
  CarFocusContainerGuide *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(CarFocusContainerGuide);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  LODWORD(v6) = 1148846080;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide _maps_constraintsEqualToEdgesOfView:priority:](v4, "_maps_constraintsEqualToEdgesOfView:priority:", v3, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allConstraints"));
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide activationConstraints](v4, "activationConstraints"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v5));
  -[CarFocusContainerGuide setActivationConstraints:](v4, "setActivationConstraints:", v10);

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarFocusContainerGuide;
  -[CarFocusContainerGuide setEnabled:](&v6, "setEnabled:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusContainerGuide debugView](self, "debugView"));
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

}

- (UIView)debugView
{
  return self->_debugView;
}

- (NSArray)activationConstraints
{
  return self->_activationConstraints;
}

- (void)setActivationConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activationConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationConstraints, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
}

@end
