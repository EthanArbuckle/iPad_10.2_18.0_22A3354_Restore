@implementation UVPrototypeSettings

- (void)setDefaultValues
{
  -[UVPrototypeSettings setShowDebugUI:](self, "setShowDebugUI:", 0);
  -[UVPrototypeSettings setForceMetricsView:](self, "setForceMetricsView:", 0);
  -[UVPrototypeSettings setCrashAnimationDuration:](self, "setCrashAnimationDuration:", 0.3);
  -[UVPrototypeSettings setCrashFadeOutOpacity:](self, "setCrashFadeOutOpacity:", 0.5);
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
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE7B338];
  objc_msgSend(MEMORY[0x24BE7B388], "rowWithTitle:valueKeyPath:", CFSTR("Show Debug UI"), CFSTR("showDebugUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  objc_msgSend(MEMORY[0x24BE7B388], "rowWithTitle:valueKeyPath:", CFSTR("Force Metrics View"), CFSTR("forceMetricsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v5, CFSTR("General"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE7B338];
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Animation duration"), CFSTR("crashAnimationDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "precision:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Fade out opacity"), CFSTR("crashFadeOutOpacity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "precision:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v14, CFSTR("Crash UI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BE7B338];
  objc_msgSend(MEMORY[0x24BE7B300], "restoreDefaultSettingsButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  v24[1] = v6;
  v24[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("Settings"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)showDebugUI
{
  return self->_showDebugUI;
}

- (void)setShowDebugUI:(BOOL)a3
{
  self->_showDebugUI = a3;
}

- (BOOL)forceMetricsView
{
  return self->_forceMetricsView;
}

- (void)setForceMetricsView:(BOOL)a3
{
  self->_forceMetricsView = a3;
}

- (double)crashFadeOutOpacity
{
  return self->_crashFadeOutOpacity;
}

- (void)setCrashFadeOutOpacity:(double)a3
{
  self->_crashFadeOutOpacity = a3;
}

- (double)crashAnimationDuration
{
  return self->_crashAnimationDuration;
}

- (void)setCrashAnimationDuration:(double)a3
{
  self->_crashAnimationDuration = a3;
}

@end
