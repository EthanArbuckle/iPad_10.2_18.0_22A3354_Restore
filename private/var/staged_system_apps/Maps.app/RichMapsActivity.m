@implementation RichMapsActivity

- (RichMapsActivity)initWithMapsActivity:(id)a3 mapsAction:(id)a4
{
  id v7;
  id v8;
  RichMapsActivity *v9;
  RichMapsActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RichMapsActivity;
  v9 = -[RichMapsActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapsActivity, a3);
    objc_storeStrong((id *)&v10->_action, a4);
  }

  return v10;
}

- (RichMapsActivity)initWithMapsActivity:(id)a3
{
  return -[RichMapsActivity initWithMapsActivity:mapsAction:](self, "initWithMapsActivity:mapsAction:", a3, 0);
}

- (RichMapsActivity)initWithMapsAction:(id)a3
{
  return -[RichMapsActivity initWithMapsActivity:mapsAction:](self, "initWithMapsActivity:mapsAction:", 0, a3);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p action:%@ activity:%@"), v5, self, self->_action, self->_mapsActivity));

  return v6;
}

- (id)shortDescription
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p action:%@"), v5, self, self->_action));

  return v6;
}

- (BOOL)didLaunchWithExplicitIntent
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_opt_class(self->_action, a2);
  return v2 != objc_opt_class(RestorationAction, v3);
}

- (BOOL)isCompatibleWithNavigation
{
  return -[MapsAction isCompatibleWithNavigation](self->_action, "isCompatibleWithNavigation");
}

- (BOOL)isTestingAction
{
  return -[MapsAction isTestingAction](self->_action, "isTestingAction");
}

- (BOOL)shouldResetUI
{
  return -[MapsAction shouldResetUI](self->_action, "shouldResetUI");
}

- (BOOL)needsUIReset
{
  _BOOL4 v2;

  if (self->_coldLaunch)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v2 = -[RichMapsActivity shouldResetUI](self, "shouldResetUI");
    if (v2)
      LOBYTE(v2) = !-[RichMapsActivity isCompatibleWithNavigation](self, "isCompatibleWithNavigation");
  }
  return v2;
}

- (MapsActivity)mapsActivity
{
  return self->_mapsActivity;
}

- (void)setMapsActivity:(id)a3
{
  objc_storeStrong((id *)&self->_mapsActivity, a3);
}

- (MapsAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (BOOL)coldLaunch
{
  return self->_coldLaunch;
}

- (void)setColdLaunch:(BOOL)a3
{
  self->_coldLaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_mapsActivity, 0);
}

@end
