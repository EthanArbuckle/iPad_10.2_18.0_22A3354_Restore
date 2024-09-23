@implementation SUIAButtonEmanatingCaptureShockwaveStyle

- (SUIAButtonEmanatingCaptureShockwaveStyle)initWithNormalizedButtonEdgeLocation:(CGRect)a3 shockwaveViewBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SUIAButtonEmanatingCaptureShockwaveStyle *result;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)SUIAButtonEmanatingCaptureShockwaveStyle;
  result = -[SUIAAbstractShockwaveStyle initWithShockwaveViewBounds:](&v9, sel_initWithShockwaveViewBounds_, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result)
  {
    result->_normalizedButtonLocation.origin.x = x;
    result->_normalizedButtonLocation.origin.y = y;
    result->_normalizedButtonLocation.size.width = width;
    result->_normalizedButtonLocation.size.height = height;
  }
  return result;
}

- (id)chromaticAberrationConfigurationForState:(int64_t)a3
{
  void *v5;
  int v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "captureChromaticAberrationEnabled");

  if (v6)
  {
    v7 = +[_SUIAShockwaveChromaticAberrationConfiguration configurationType](_SUIAShockwaveChromaticAberrationConfiguration, "configurationType");
    -[SUIAAbstractShockwaveStyle _configurationForType:state:](self, "_configurationForType:state:", v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIAAbstractShockwaveStyle shockwaveBounds](self, "shockwaveBounds");
      +[_SUIAShockwaveChromaticAberrationConfiguration chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:](_SUIAShockwaveChromaticAberrationConfiguration, "chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:", a3, 0, 1, v9, self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v10, v11, v12, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUIAAbstractShockwaveStyle _setConfiguration:forType:state:](self, "_setConfiguration:forType:state:", v8, v7, a3);
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)meshConfigurationForState:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "captureMeshEnabled"))
  {
    v6 = +[_SUIAShockwaveMeshConfiguration configurationType](_SUIAShockwaveMeshConfiguration, "configurationType");
    -[SUIAAbstractShockwaveStyle _configurationForType:state:](self, "_configurationForType:state:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[SUIAAbstractShockwaveStyle shockwaveBounds](self, "shockwaveBounds");
      +[_SUIAShockwaveMeshConfiguration meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:](_SUIAShockwaveMeshConfiguration, "meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:", a3, 0, v5, self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v8, v9, v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUIAAbstractShockwaveStyle _setConfiguration:forType:state:](self, "_setConfiguration:forType:state:", v7, v6, a3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fillLightConfigurationForState:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[_SUIAShockwaveFillLightConfiguration configurationType](_SUIAShockwaveFillLightConfiguration, "configurationType");
  -[SUIAAbstractShockwaveStyle _configurationForType:state:](self, "_configurationForType:state:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[SUIAAbstractShockwaveStyle shockwaveBounds](self, "shockwaveBounds");
    +[_SUIAShockwaveFillLightConfiguration fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:](_SUIAShockwaveFillLightConfiguration, "fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:", a3, 0, v5, self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v8, v9, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUIAAbstractShockwaveStyle _setConfiguration:forType:state:](self, "_setConfiguration:forType:state:", v7, v6, a3);
  }

  return v7;
}

- (id)edgeLightOverlayConfigurationForState:(int64_t)a3
{
  return 0;
}

@end
