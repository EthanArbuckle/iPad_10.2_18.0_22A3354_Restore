@implementation SXDarkModeConfiguration

- (SXDarkModeConfiguration)initWithAutoDarkModeEnabled:(BOOL)a3 inversionBehavior:(unint64_t)a4 saturationThreshold:(double)a5 colors:(id)a6
{
  id v10;
  SXDarkModeConfiguration *v11;
  SXDarkModeConfiguration *v12;
  uint64_t v13;
  NSDictionary *colors;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SXDarkModeConfiguration;
  v11 = -[SXDarkModeConfiguration init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_autoDarkModeEnabled = a3;
    v11->_inversionBehavior = a4;
    v11->_saturationThreshold = a5;
    v13 = objc_msgSend(v10, "copy");
    colors = v12->_colors;
    v12->_colors = (NSDictionary *)v13;

  }
  return v12;
}

- (BOOL)isAutoDarkModeEnabled
{
  return self->_autoDarkModeEnabled;
}

- (unint64_t)inversionBehavior
{
  return self->_inversionBehavior;
}

- (double)saturationThreshold
{
  return self->_saturationThreshold;
}

- (NSDictionary)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
