@implementation _UIScreenEdgePanRecognizerCornerSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIScreenEdgePanRecognizerCornerSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIScreenEdgePanRecognizerCornerSettings setCornerSize:](self, "setCornerSize:", 50.0);
  -[_UIScreenEdgePanRecognizerCornerSettings setCornerAngleWindow:](self, "setCornerAngleWindow:", 1.30899694);
}

- (double)cornerAngleWindowDegreees
{
  double v2;

  -[_UIScreenEdgePanRecognizerCornerSettings cornerAngleWindow](self, "cornerAngleWindow");
  return v2 * 57.2957795;
}

- (void)setCornerAngleWindowDegreees:(double)a3
{
  -[_UIScreenEdgePanRecognizerCornerSettings setCornerAngleWindow:](self, "setCornerAngleWindow:", a3 * 3.14159265 / 180.0);
}

+ (id)keyPathsForValuesAffectingCornerAngleWindowDegreees
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("cornerAngleWindow"));
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
  _QWORD v17[2];
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Corner Size"), CFSTR("cornerSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precision:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Angle Window"), CFSTR("cornerAngleWindowDegreees"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.0, 90.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83078];
  v17[0] = v7;
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Corner Swipe"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)cornerSize
{
  return self->_cornerSize;
}

- (void)setCornerSize:(double)a3
{
  self->_cornerSize = a3;
}

- (double)cornerAngleWindow
{
  return self->_cornerAngleWindow;
}

- (void)setCornerAngleWindow:(double)a3
{
  self->_cornerAngleWindow = a3;
}

@end
