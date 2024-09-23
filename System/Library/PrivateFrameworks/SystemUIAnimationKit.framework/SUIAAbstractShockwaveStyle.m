@implementation SUIAAbstractShockwaveStyle

- (SUIAAbstractShockwaveStyle)initWithShockwaveViewBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SUIAAbstractShockwaveStyle *v7;
  SUIAAbstractShockwaveStyle *v8;
  uint64_t v9;
  NSMutableDictionary *configurations;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SUIAAbstractShockwaveStyle;
  v7 = -[SUIAAbstractShockwaveStyle init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_shockwaveBounds.origin.x = x;
    v7->_shockwaveBounds.origin.y = y;
    v7->_shockwaveBounds.size.width = width;
    v7->_shockwaveBounds.size.height = height;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    configurations = v8->_configurations;
    v8->_configurations = (NSMutableDictionary *)v9;

    -[SUIAAbstractShockwaveStyle _shockwaveSettings](v8, "_shockwaveSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addKeyPathObserver:", v8);

  }
  return v8;
}

- (id)_shockwaveSettings
{
  SUIAShockwavePrototypeSettings *prototypeSettings;
  void *v4;
  SUIAShockwavePrototypeSettings *v5;
  SUIAShockwavePrototypeSettings *v6;

  prototypeSettings = self->_prototypeSettings;
  if (!prototypeSettings)
  {
    +[SUIAnimationKitPrototypeSettingsDomain rootSettings](SUIAnimationKitPrototypeSettingsDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shockwaveSettings");
    v5 = (SUIAShockwavePrototypeSettings *)objc_claimAutoreleasedReturnValue();
    v6 = self->_prototypeSettings;
    self->_prototypeSettings = v5;

    prototypeSettings = self->_prototypeSettings;
  }
  return prototypeSettings;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  -[NSMutableDictionary removeAllObjects](self->_configurations, "removeAllObjects", a3, a4);
}

- (void)setShockwaveBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_shockwaveBounds))
  {
    self->_shockwaveBounds.origin.x = x;
    self->_shockwaveBounds.origin.y = y;
    self->_shockwaveBounds.size.width = width;
    self->_shockwaveBounds.size.height = height;
    -[NSMutableDictionary removeAllObjects](self->_configurations, "removeAllObjects");
  }
}

- (double)recommendedPresentationDurationForState:(int64_t)a3
{
  double result;
  void *v4;
  double v5;
  double v6;
  float v7;

  result = 1.79769313e308;
  switch(a3)
  {
    case 1:
    case 4:
      -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings", 1.79769313e308);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "maximumHintDuration");
      goto LABEL_4;
    case 2:
    case 5:
      -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings", 1.79769313e308);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "totalDuration");
LABEL_4:
      v6 = v5;

      goto LABEL_6;
    case 3:
      return result;
    default:
      v6 = 0.0;
LABEL_6:
      UIAnimationDragCoefficient();
      return v6 * v7;
  }
}

- (BOOL)usesChromaticAberation
{
  void *v2;
  BOOL v3;

  -[SUIAAbstractShockwaveStyle chromaticAberrationConfigurationForState:](self, "chromaticAberrationConfigurationForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)usesMeshTransform
{
  void *v2;
  BOOL v3;

  -[SUIAAbstractShockwaveStyle meshConfigurationForState:](self, "meshConfigurationForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)usesFillLight
{
  void *v2;
  BOOL v3;

  -[SUIAAbstractShockwaveStyle fillLightConfigurationForState:](self, "fillLightConfigurationForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)usesEdgeLight
{
  void *v2;
  BOOL v3;

  -[SUIAAbstractShockwaveStyle edgeLightOverlayConfigurationForState:](self, "edgeLightOverlayConfigurationForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)rootViewConfigurationForState:(int64_t)a3
{
  int64_t v5;
  _SUIAShockwaveRootViewConfiguration *v6;

  v5 = +[_SUIAShockwaveRootViewConfiguration configurationType](_SUIAShockwaveRootViewConfiguration, "configurationType");
  -[SUIAAbstractShockwaveStyle _configurationForType:state:](self, "_configurationForType:state:", v5, a3);
  v6 = (_SUIAShockwaveRootViewConfiguration *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(_SUIAShockwaveRootViewConfiguration);
    -[_SUIAShockwaveRootViewConfiguration _setHidden:](v6, "_setHidden:", a3 == 3);
    -[SUIAAbstractShockwaveStyle _setConfiguration:forType:state:](self, "_setConfiguration:forType:state:", v6, v5, a3);
  }
  return v6;
}

- (id)chromaticAberrationConfigurationForState:(int64_t)a3
{
  return 0;
}

- (id)meshConfigurationForState:(int64_t)a3
{
  return 0;
}

- (id)fillLightConfigurationForState:(int64_t)a3
{
  return 0;
}

- (id)edgeLightOverlayConfigurationForState:(int64_t)a3
{
  return 0;
}

- (id)_configurationForType:(int64_t)a3 state:(int64_t)a4
{
  NSMutableDictionary *configurations;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  configurations = self->_configurations;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](configurations, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setConfiguration:(id)a3 forType:(int64_t)a4 state:(int64_t)a5
{
  NSMutableDictionary *configurations;
  void *v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  id v15;

  configurations = self->_configurations;
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = a3;
  objc_msgSend(v9, "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](configurations, "objectForKey:", v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v12 = self->_configurations;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v15, v13);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v10, v14);

}

- (CGRect)shockwaveBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_shockwaveBounds.origin.x;
  y = self->_shockwaveBounds.origin.y;
  width = self->_shockwaveBounds.size.width;
  height = self->_shockwaveBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
}

@end
