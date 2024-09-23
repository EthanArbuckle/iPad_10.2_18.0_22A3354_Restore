@implementation SBCameraHardwareButtonSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCameraHardwareButtonSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraHardwareButtonDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "shutterButtonLongPressTimeout");
  -[SBCameraHardwareButtonSettings setShutterButtonLongPressTimeout:](self, "setShutterButtonLongPressTimeout:");
  objc_msgSend(v4, "shutterButtonLongPressCancellationTimeout");
  -[SBCameraHardwareButtonSettings setShutterButtonLongPressCancellationTimeout:](self, "setShutterButtonLongPressCancellationTimeout:");
  -[SBCameraHardwareButtonSettings setShutterButtonShouldUsePocketDetection:](self, "setShutterButtonShouldUsePocketDetection:", objc_msgSend(v4, "shutterButtonShouldUsePocketDetection"));

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
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Long press timeout"), CFSTR("shutterButtonLongPressTimeout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Long press cancellation timeout"), CFSTR("shutterButtonLongPressCancellationTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Use pocket detection"), CFSTR("shutterButtonShouldUsePocketDetection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "between:and:", 0.0, 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83070];
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83070];
  v14 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "moduleWithTitle:contents:", CFSTR("Camera Shutter Button"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)shutterButtonLongPressTimeout
{
  return self->_shutterButtonLongPressTimeout;
}

- (void)setShutterButtonLongPressTimeout:(double)a3
{
  self->_shutterButtonLongPressTimeout = a3;
}

- (double)shutterButtonLongPressCancellationTimeout
{
  return self->_shutterButtonLongPressCancellationTimeout;
}

- (void)setShutterButtonLongPressCancellationTimeout:(double)a3
{
  self->_shutterButtonLongPressCancellationTimeout = a3;
}

- (BOOL)shutterButtonShouldUsePocketDetection
{
  return self->_shutterButtonShouldUsePocketDetection;
}

- (void)setShutterButtonShouldUsePocketDetection:(BOOL)a3
{
  self->_shutterButtonShouldUsePocketDetection = a3;
}

@end
