@implementation SBSAElementContentTransitionSettings

+ (id)_childSettingsKeyPathsToTitles
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SBSAElementContentTransitionSettings;
  objc_msgSendSuper2(&v5, sel__childSettingsKeyPathsToTitles);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Sensor Shadow Behavior Settings"), CFSTR("sensorObscuringShadowBehaviorSettings"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Subcomponent Behavior Settings"), CFSTR("subcomponentBehaviorSettings"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Custom Content Behavior Settings"), CFSTR("customContentBehaviorSettings"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Snapshot Behavior Settings"), CFSTR("snapshotBehaviorSettings"));
  return v3;
}

- (SBFFluidBehaviorSettings)sensorObscuringShadowBehaviorSettings
{
  return self->_sensorObscuringShadowBehaviorSettings;
}

- (void)setSensorObscuringShadowBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sensorObscuringShadowBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)subcomponentBehaviorSettings
{
  return self->_subcomponentBehaviorSettings;
}

- (void)setSubcomponentBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_subcomponentBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)customContentBehaviorSettings
{
  return self->_customContentBehaviorSettings;
}

- (void)setCustomContentBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_customContentBehaviorSettings, a3);
}

- (SBFFluidBehaviorSettings)snapshotBehaviorSettings
{
  return self->_snapshotBehaviorSettings;
}

- (void)setSnapshotBehaviorSettings:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotBehaviorSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_customContentBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_subcomponentBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_sensorObscuringShadowBehaviorSettings, 0);
}

@end
