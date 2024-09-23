@implementation SBSAInterfaceElementTransitionSettings

- (SBFFluidBehaviorSettings)centerBehaviorSettings
{
  return self->_centerBehaviorSettings;
}

- (SBFFluidBehaviorSettings)alphaBehaviorSettings
{
  return self->_alphaBehaviorSettings;
}

- (SBFFluidBehaviorSettings)boundsBehaviorSettings
{
  return self->_boundsBehaviorSettings;
}

+ (id)_childSettingsKeyPathsToTitles
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SBSAInterfaceElementTransitionSettings;
  objc_msgSendSuper2(&v5, sel__childSettingsKeyPathsToTitles);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Center Behavior Settings"), CFSTR("centerBehaviorSettings"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Bounds Behavior Settings"), CFSTR("boundsBehaviorSettings"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Corner Radius Behavior Settings"), CFSTR("cornerRadiusBehaviorSettings"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Alpha Behavior Settings"), CFSTR("alphaBehaviorSettings"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Background Color Behavior Settings"), CFSTR("backgroundColorBehaviorSettings"));
  return v3;
}

- (void)setCenterBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centerBehaviorSettings, a3);
}

- (void)setBoundsBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_boundsBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)cornerRadiusBehaviorSettings
{
  return self->_cornerRadiusBehaviorSettings;
}

- (void)setCornerRadiusBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cornerRadiusBehaviorSettings, a3);
}

- (void)setAlphaBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_alphaBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)backgroundColorBehaviorSettings
{
  return self->_backgroundColorBehaviorSettings;
}

- (void)setBackgroundColorBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorBehaviorSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_alphaBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_cornerRadiusBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_boundsBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_centerBehaviorSettings, 0);
}

@end
