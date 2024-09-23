@implementation SBCaptureApplicationSettings

- (void)setDefaultValues
{
  -[SBCaptureApplicationSettings setLaunchMonitorDurationInSeconds:](self, "setLaunchMonitorDurationInSeconds:", 10.0);
  -[SBCaptureApplicationSettings setLaunchTransitionTimeOutDurationInSeconds:](self, "setLaunchTransitionTimeOutDurationInSeconds:", 1.0);
  -[SBCaptureApplicationSettings setForceWaitForTransition:](self, "setForceWaitForTransition:", 0);
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
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_launchMonitorDurationInSeconds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:valueKeyPath:", CFSTR("Launch Monitor Duration (s)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 1.0, 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Force Wait For Transition Launch"), CFSTR("forceWaitForTransition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_launchTransitionTimeOutDurationInSeconds);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Launch Transition Time Out Duration (s)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83070];
  v21[0] = v6;
  v21[1] = v7;
  v21[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83070];
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("Capture Application Settings"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)launchMonitorDurationInSeconds
{
  return self->_launchMonitorDurationInSeconds;
}

- (void)setLaunchMonitorDurationInSeconds:(double)a3
{
  self->_launchMonitorDurationInSeconds = a3;
}

- (double)launchTransitionTimeOutDurationInSeconds
{
  return self->_launchTransitionTimeOutDurationInSeconds;
}

- (void)setLaunchTransitionTimeOutDurationInSeconds:(double)a3
{
  self->_launchTransitionTimeOutDurationInSeconds = a3;
}

- (BOOL)forceWaitForTransition
{
  return self->_forceWaitForTransition;
}

- (void)setForceWaitForTransition:(BOOL)a3
{
  self->_forceWaitForTransition = a3;
}

@end
