@implementation CarOneHandedZoomConfiguration

- (CarOneHandedZoomConfiguration)initWithGestureRecongizer:(id)a3
{
  id v4;
  CarOneHandedZoomConfiguration *v5;
  CarOneHandedZoomConfiguration *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarOneHandedZoomConfiguration;
  v5 = -[CarOneHandedZoomConfiguration init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_gestureRecognizer, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "_refreshSetting", CFSTR("CarPlayOneHandedZoomingSettingDidChangeNotification"), 0);

    -[CarOneHandedZoomConfiguration _refreshSetting](v6, "_refreshSetting");
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarOneHandedZoomConfiguration;
  -[CarOneHandedZoomConfiguration dealloc](&v4, "dealloc");
}

- (void)_refreshSetting
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double zoomDraggingResistance;
  void *v9;
  id WeakRetained;

  -[CarOneHandedZoomConfiguration valueWithKey:defaultValue:](self, "valueWithKey:defaultValue:", CFSTR("__internal__CarPlayOneHandedZoomInMaximumVelocity"), 10.0);
  self->_maximumZoomInVelocity = v3;
  -[CarOneHandedZoomConfiguration valueWithKey:defaultValue:](self, "valueWithKey:defaultValue:", CFSTR("__internal__CarPlayOneHandedZoomOutMaximumVelocity"), 1.5);
  self->_maximumZoomOutVelocity = -v4;
  -[CarOneHandedZoomConfiguration valueWithKey:defaultValue:](self, "valueWithKey:defaultValue:", CFSTR("__internal__CarPlayOneHandedZoomOutFrictionScale"), 2.5);
  self->_zoomOutFrictionScale = v5;
  -[CarOneHandedZoomConfiguration valueWithKey:defaultValue:](self, "valueWithKey:defaultValue:", CFSTR("__internal__CarPlayOneHandedZoomDraggingResistance"), 1.0);
  self->_zoomDraggingResistance = v6 * 200.0;
  -[CarOneHandedZoomConfiguration valueWithKey:defaultValue:](self, "valueWithKey:defaultValue:", CFSTR("__internal__CarPlayOneHandedZoomMinimumVelocity"), 1.5);
  self->_decelerationThreshold = v7;
  zoomDraggingResistance = self->_zoomDraggingResistance;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizer);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "panGestureRecognizer"));
  objc_msgSend(v9, "setZoomDraggingResistance:", zoomDraggingResistance);

}

- (double)valueWithKey:(id)a3 defaultValue:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v8, "floatForKey:", v5);
    a4 = v9;

  }
  return a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;
  id v6;

  v4 = objc_alloc((Class)objc_opt_class(self));
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizer);
  v6 = objc_msgSend(v4, "initWithGestureRecongizer:", WeakRetained);

  return v6;
}

- (double)decelerationThreshold
{
  return self->_decelerationThreshold;
}

- (double)maximumZoomInVelocity
{
  return self->_maximumZoomInVelocity;
}

- (double)maximumZoomOutVelocity
{
  return self->_maximumZoomOutVelocity;
}

- (double)zoomOutFrictionScale
{
  return self->_zoomOutFrictionScale;
}

- (double)zoomDraggingResistance
{
  return self->_zoomDraggingResistance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gestureRecognizer);
}

@end
