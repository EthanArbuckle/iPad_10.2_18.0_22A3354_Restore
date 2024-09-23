@implementation SBIdleTimerSettings

- (BOOL)disableIdleTimer
{
  return self->_disableIdleTimer;
}

- (void)setDefaultValues
{
  -[SBIdleTimerSettings setDisableIdleTimer:](self, "setDisableIdleTimer:", 0);
  -[SBIdleTimerSettings setUnlockedIdleTimerCap:](self, "setUnlockedIdleTimerCap:", 300.0);
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
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Disable Idle Timer"), CFSTR("disableIdleTimer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Unlocked Max Idle Timer"), CFSTR("unlockedIdleTimerCap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v4, CFSTR("Features"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83070];
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moduleWithTitle:contents:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setDisableIdleTimer:(BOOL)a3
{
  self->_disableIdleTimer = a3;
}

- (double)unlockedIdleTimerCap
{
  return self->_unlockedIdleTimerCap;
}

- (void)setUnlockedIdleTimerCap:(double)a3
{
  self->_unlockedIdleTimerCap = a3;
}

@end
