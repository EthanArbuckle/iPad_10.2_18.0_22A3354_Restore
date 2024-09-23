@implementation SUIAEdgeEmanatingSiriShockwaveStyle

- (SUIAEdgeEmanatingSiriShockwaveStyle)initWithEdge:(unint64_t)a3 shockwaveViewBounds:(CGRect)a4
{
  SUIAEdgeEmanatingSiriShockwaveStyle *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUIAEdgeEmanatingSiriShockwaveStyle;
  result = -[SUIAAbstractShockwaveStyle initWithShockwaveViewBounds:](&v6, sel_initWithShockwaveViewBounds_, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result)
    result->_edge = a3;
  return result;
}

- (id)chromaticAberrationConfigurationForState:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "siriEdgeChromaticAberrationEnabled"))
  {
    v6 = +[_SUIAShockwaveChromaticAberrationConfiguration configurationType](_SUIAShockwaveChromaticAberrationConfiguration, "configurationType");
    -[SUIAAbstractShockwaveStyle _configurationForType:state:](self, "_configurationForType:state:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = SUIANormalizedRectSpanningRectEdge(self->_edge);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[SUIAAbstractShockwaveStyle shockwaveBounds](self, "shockwaveBounds");
      +[_SUIAShockwaveChromaticAberrationConfiguration chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:](_SUIAShockwaveChromaticAberrationConfiguration, "chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:", a3, 2, 0, v5, v8, v10, v12, v14, v15, v16, v17, v18);
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

- (id)meshConfigurationForState:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUIAAbstractShockwaveStyle shockwaveBounds](self, "shockwaveBounds");
  if (objc_msgSend(v5, "shouldBehaveLikeLargeScreen:", v6, v7))
  {
    if ((objc_msgSend(v5, "siriEdgeMeshEnabledLargeScreen") & 1) == 0)
    {
LABEL_3:
      v8 = 0;
      goto LABEL_7;
    }
  }
  else if (!objc_msgSend(v5, "siriEdgeMeshEnabled"))
  {
    goto LABEL_3;
  }
  v9 = +[_SUIAShockwaveMeshConfiguration configurationType](_SUIAShockwaveMeshConfiguration, "configurationType");
  -[SUIAAbstractShockwaveStyle _configurationForType:state:](self, "_configurationForType:state:", v9, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = SUIANormalizedRectSpanningRectEdge(self->_edge);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[SUIAAbstractShockwaveStyle shockwaveBounds](self, "shockwaveBounds");
    +[_SUIAShockwaveMeshConfiguration meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:](_SUIAShockwaveMeshConfiguration, "meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:", a3, 2, v5, v10, v12, v14, v16, v17, v18, v19, v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUIAAbstractShockwaveStyle _setConfiguration:forType:state:](self, "_setConfiguration:forType:state:", v8, v9, a3);
  }
LABEL_7:

  return v8;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "siriEdgeFillLightEnabled"))
  {
    v6 = +[_SUIAShockwaveFillLightConfiguration configurationType](_SUIAShockwaveFillLightConfiguration, "configurationType");
    -[SUIAAbstractShockwaveStyle _configurationForType:state:](self, "_configurationForType:state:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = SUIANormalizedRectSpanningRectEdge(self->_edge);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[SUIAAbstractShockwaveStyle shockwaveBounds](self, "shockwaveBounds");
      +[_SUIAShockwaveFillLightConfiguration fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:](_SUIAShockwaveFillLightConfiguration, "fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:", a3, 2, v5, v8, v10, v12, v14, v15, v16, v17, v18);
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

- (id)edgeLightOverlayConfigurationForState:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  -[SUIAAbstractShockwaveStyle _shockwaveSettings](self, "_shockwaveSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "siriEdgeEdgeLightEnabled"))
  {
    v6 = +[_SUIAShockwaveEdgeLightOverlayConfiguration configurationType](_SUIAShockwaveEdgeLightOverlayConfiguration, "configurationType");
    -[SUIAAbstractShockwaveStyle _configurationForType:state:](self, "_configurationForType:state:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = SUIANormalizedRectSpanningRectEdge(self->_edge);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[SUIAAbstractShockwaveStyle shockwaveBounds](self, "shockwaveBounds");
      +[_SUIAShockwaveEdgeLightOverlayConfiguration edgeLightOverlayConfigurationForState:variant:normalizedStartLocation:settings:bounds:](_SUIAShockwaveEdgeLightOverlayConfiguration, "edgeLightOverlayConfigurationForState:variant:normalizedStartLocation:settings:bounds:", a3, 2, v5, v8, v10, v12, v14, v15, v16, v17, v18);
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

@end
