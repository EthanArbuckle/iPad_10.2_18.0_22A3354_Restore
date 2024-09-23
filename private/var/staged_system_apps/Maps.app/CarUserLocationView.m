@implementation CarUserLocationView

+ (double)baseDiameter
{
  return 24.0;
}

+ (double)innerDiameter
{
  return 16.0;
}

- (CarUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  CarUserLocationView *v4;
  CarUserLocationView *v5;
  void *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarUserLocationView;
  v4 = -[UserLocationView initWithAnnotation:reuseIdentifier:](&v9, "initWithAnnotation:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CarUserLocationView setCanShowCallout:](v4, "setCanShowCallout:", 0);
    -[CarUserLocationView setCanShowHeadingIndicator:](v5, "setCanShowHeadingIndicator:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
    -[CarUserLocationView setTintColor:](v5, "setTintColor:", v6);

    LODWORD(v7) = 1.0;
    -[CarUserLocationView setZPriority:](v5, "setZPriority:", v7);
    -[CarUserLocationView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("CarUserLocationView"));
  }
  return v5;
}

- (BOOL)_isLocationStale:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarUserLocationView;
  v5 = -[CarUserLocationView _isLocationStale:](&v9, "_isLocationStale:", v4);
  if (!v5 && !-[CarUserLocationView overrideIsStale](self, "overrideIsStale"))
  {
    objc_msgSend(v4, "course");
    if (v6 != -1.0 && self->super._mode == 1)
      -[CarUserLocationView setOverrideIsStale:](self, "setOverrideIsStale:", 1);
  }
  if (self->super._mode == 1)
  {
    objc_msgSend(v4, "course");
    if (v7 != -1.0 && -[CarUserLocationView overrideIsStale](self, "overrideIsStale"))
      v5 = 0;
  }

  return v5;
}

- (BOOL)_isSelectable
{
  return 0;
}

- (BOOL)overrideIsStale
{
  return self->_overrideIsStale;
}

- (void)setOverrideIsStale:(BOOL)a3
{
  self->_overrideIsStale = a3;
}

@end
