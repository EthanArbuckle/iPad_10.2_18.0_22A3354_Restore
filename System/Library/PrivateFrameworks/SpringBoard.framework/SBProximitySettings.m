@implementation SBProximitySettings

- (void)setDefaultValues
{
  void *v2;
  int v4;
  char v5;
  int v6;
  double v7;
  double v8;
  char v9;
  int v10;
  double v11;

  v4 = __sb__runningInSpringBoard();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "userInterfaceIdiom") && SBFEffectiveHomeButtonType() == 2)
    {
      v9 = SBUIIsSystemApertureEnabled();

      if ((v9 & 1) == 0)
        goto LABEL_10;
LABEL_13:
      v7 = 0.5;
      v8 = 0.5;
      goto LABEL_14;
    }
LABEL_12:

    goto LABEL_13;
  }
  v5 = v4;
  if (!SBFEffectiveDeviceClass() || (v6 = SBFEffectiveDeviceClass(), v7 = 0.5, v8 = 0.5, v6 == 1))
  {
    if (SBFEffectiveHomeButtonType() == 2)
    {
      if ((SBUIIsSystemApertureEnabled() & 1) != 0)
        goto LABEL_13;
LABEL_10:
      v8 = 0.375;
      v7 = 0.75;
      goto LABEL_14;
    }
    v7 = 0.5;
    v8 = 0.5;
    if ((v5 & 1) != 0)
      goto LABEL_14;
    goto LABEL_12;
  }
LABEL_14:
  -[SBProximitySettings setInitialBacklightDebounceDuration:](self, "setInitialBacklightDebounceDuration:", v7);
  -[SBProximitySettings setSubsequentBacklightDebounceDuration:](self, "setSubsequentBacklightDebounceDuration:", v8);
  -[SBProximitySettings setColorScreenEdgeWhenObjectInProximity:](self, "setColorScreenEdgeWhenObjectInProximity:", 0);
  -[SBProximitySettings setAllowTouchesInJindoWhenObjectInProximity:](self, "setAllowTouchesInJindoWhenObjectInProximity:", 0);
  v10 = SBUIIsSystemApertureEnabled();
  v11 = 0.0;
  if (v10)
    v11 = 5.0;
  -[SBProximitySettings setNonTelephonyTouchAllowanceGracePeriodDuration:](self, "setNonTelephonyTouchAllowanceGracePeriodDuration:", v11);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Initial Backlight Debounce"), CFSTR("initialBacklightDebounceDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 5.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Subsequent Backlight Debounce"), CFSTR("subsequentBacklightDebounceDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 5.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Color Screen Edge"), CFSTR("colorScreenEdgeWhenObjectInProximity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Allow Touches In Jindo"), CFSTR("allowTouchesInJindoWhenObjectInProximity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Non-Telephony Touch Allowance Grace Period"), CFSTR("nonTelephonyTouchAllowanceGracePeriodDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 10.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v15, CFSTR("Parameters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("Prox"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (double)initialBacklightDebounceDuration
{
  return self->_initialBacklightDebounceDuration;
}

- (void)setInitialBacklightDebounceDuration:(double)a3
{
  self->_initialBacklightDebounceDuration = a3;
}

- (double)subsequentBacklightDebounceDuration
{
  return self->_subsequentBacklightDebounceDuration;
}

- (void)setSubsequentBacklightDebounceDuration:(double)a3
{
  self->_subsequentBacklightDebounceDuration = a3;
}

- (BOOL)colorScreenEdgeWhenObjectInProximity
{
  return self->_colorScreenEdgeWhenObjectInProximity;
}

- (void)setColorScreenEdgeWhenObjectInProximity:(BOOL)a3
{
  self->_colorScreenEdgeWhenObjectInProximity = a3;
}

- (BOOL)allowTouchesInJindoWhenObjectInProximity
{
  return self->_allowTouchesInJindoWhenObjectInProximity;
}

- (void)setAllowTouchesInJindoWhenObjectInProximity:(BOOL)a3
{
  self->_allowTouchesInJindoWhenObjectInProximity = a3;
}

- (double)nonTelephonyTouchAllowanceGracePeriodDuration
{
  return self->_nonTelephonyTouchAllowanceGracePeriodDuration;
}

- (void)setNonTelephonyTouchAllowanceGracePeriodDuration:(double)a3
{
  self->_nonTelephonyTouchAllowanceGracePeriodDuration = a3;
}

@end
