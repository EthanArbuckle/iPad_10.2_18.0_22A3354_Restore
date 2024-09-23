@implementation SBElasticBrightnessViewController

- (SBElasticBrightnessViewController)initWithDataSource:(id)a3
{
  SBElasticBrightnessViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBElasticBrightnessViewController;
  result = -[SBElasticValueViewController initWithDataSource:](&v4, sel_initWithDataSource_, a3);
  if (result)
  {
    result->_activeBrightnessRoute = 0;
    result->_debugOverrideBrightnessRoute = 0;
  }
  return result;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBElasticBrightnessViewController;
  -[SBElasticValueViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)dataSource
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBElasticBrightnessViewController;
  -[SBElasticValueViewController dataSource](&v3, sel_dataSource);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)updateActiveRouteDisplay:(id *)a3
{
  void *v5;
  uint64_t v6;
  int64_t debugOverrideBrightnessRoute;
  int64_t activeBrightnessRoute;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SBElasticBrightnessViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "elasticBrightnessViewControllerBrightnessRouteType:", self);

  if (SBBrightnessRouteTypeIsValid(v6))
    debugOverrideBrightnessRoute = v6;
  else
    debugOverrideBrightnessRoute = 1;
  if (SBBrightnessRouteTypeIsValid(self->_debugOverrideBrightnessRoute))
    debugOverrideBrightnessRoute = self->_debugOverrideBrightnessRoute;
  activeBrightnessRoute = self->_activeBrightnessRoute;
  self->_activeBrightnessRoute = debugOverrideBrightnessRoute;
  NSLocalizedStringFromSBBrightnessRouteType(debugOverrideBrightnessRoute);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CCUICAPackageDescriptionForSBBrightnessRouteType(debugOverrideBrightnessRoute);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    SBGlyphStateValueTransformerForBrightnessRouteType();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBElasticRouteDisplayContext routeContextWithName:valueTransformer:glyphPackage:](SBElasticRouteDisplayContext, "routeContextWithName:valueTransformer:glyphPackage:", v9, v11, v10);
  }
  else
  {
    UIImageSymbolForSBBrightnessRouteType();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBElasticRouteDisplayContext routeContextWithName:glyphImage:](SBElasticRouteDisplayContext, "routeContextWithName:glyphImage:", v9, v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  *a3 = v13;
  -[SBElasticBrightnessViewController log](self, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    NSStringFromSBBrightnessRouteType(debugOverrideBrightnessRoute);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v15;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Updated route display info for brightness route (%@): '%@'", (uint8_t *)&v17, 0x16u);

  }
  return activeBrightnessRoute != debugOverrideBrightnessRoute;
}

- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)noteContinuousValueInteractionWillBegin
{
  id v3;

  -[SBElasticBrightnessViewController dataSource](self, "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elasticBrightnessViewControllerValueUpdatesWillBegin:", self);

}

- (void)noteContinuousValueInteractionDidEnd
{
  id v3;

  -[SBElasticBrightnessViewController dataSource](self, "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elasticBrightnessViewControllerValueUpdatesDidEnd:", self);

}

- (id)sliderAccessibilityIdentifier
{
  return CFSTR("sb-brightness-hud");
}

- (void)_debugHandleNextRoute
{
  int64_t debugOverrideBrightnessRoute;
  int64_t v4;

  debugOverrideBrightnessRoute = self->_debugOverrideBrightnessRoute;
  if (!SBBrightnessRouteTypeIsValid(debugOverrideBrightnessRoute))
    debugOverrideBrightnessRoute = self->_activeBrightnessRoute;
  v4 = 1;
  if (debugOverrideBrightnessRoute <= 1)
    v4 = debugOverrideBrightnessRoute + 1;
  self->_debugOverrideBrightnessRoute = v4;
}

- (void)_debugHandleResetRoute
{
  self->_debugOverrideBrightnessRoute = 0;
}

@end
