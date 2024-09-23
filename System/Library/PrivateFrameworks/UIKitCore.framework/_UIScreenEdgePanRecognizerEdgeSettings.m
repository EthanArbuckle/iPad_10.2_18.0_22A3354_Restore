@implementation _UIScreenEdgePanRecognizerEdgeSettings

- (void)setDefaultValues
{
  double v3;
  void *v4;
  double v5;
  double v6;
  int v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIScreenEdgePanRecognizerEdgeSettings;
  -[PTSettings setDefaultValues](&v9, sel_setDefaultValues);
  -[_UIScreenEdgePanRecognizerEdgeSettings setHysteresis:](self, "setHysteresis:", 15.0);
  v3 = 13.0;
  if (!_UIDeviceNativeUserInterfaceIdiom() && MGGetBoolAnswer())
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_referenceBounds");
    v6 = v5;

    v7 = MGGetBoolAnswer();
    v8 = 0.09;
    if (v7)
      v8 = 0.1;
    v3 = v6 * v8;
  }
  -[_UIScreenEdgePanRecognizerEdgeSettings setEdgeRegionSize:](self, "setEdgeRegionSize:", v3);
  -[_UIScreenEdgePanRecognizerEdgeSettings setBottomEdgeRegionSize:](self, "setBottomEdgeRegionSize:", 11.0);
  -[_UIScreenEdgePanRecognizerEdgeSettings setEdgeAngleWindow:](self, "setEdgeAngleWindow:", 2.70526034);
  -[_UIScreenEdgePanRecognizerEdgeSettings setEdgeAngleWindowDecayTime:](self, "setEdgeAngleWindowDecayTime:", 0.5);
  -[_UIScreenEdgePanRecognizerEdgeSettings setMaximumSwipeDuration:](self, "setMaximumSwipeDuration:", 0.25);
}

- (double)edgeAngleWindowDegreees
{
  double v2;

  -[_UIScreenEdgePanRecognizerEdgeSettings edgeAngleWindow](self, "edgeAngleWindow");
  return v2 * 57.2957795;
}

- (void)setEdgeAngleWindowDegreees:(double)a3
{
  -[_UIScreenEdgePanRecognizerEdgeSettings setEdgeAngleWindow:](self, "setEdgeAngleWindow:", a3 * 3.14159265 / 180.0);
}

+ (id)keyPathsForValuesAffectingEdgeAngleWindowDegreees
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("edgeAngleWindow"));
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
  void *v22;
  _QWORD v23[2];
  void *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Hysteresis"), CFSTR("hysteresis"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "precision:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Edge Window Size"), CFSTR("edgeRegionSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "precision:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bottom Edge Window Size"), CFSTR("bottomEdgeRegionSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v6;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Angle Window"), CFSTR("edgeAngleWindowDegreees"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 180.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v8;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Angle Decay Time"), CFSTR("edgeAngleWindowDecayTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Restore Defaults"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D83078];
  v23[0] = v12;
  v23[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", CFSTR("Edge Swipe"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (double)edgeRegionSize
{
  return self->_edgeRegionSize;
}

- (void)setEdgeRegionSize:(double)a3
{
  self->_edgeRegionSize = a3;
}

- (double)bottomEdgeRegionSize
{
  return self->_bottomEdgeRegionSize;
}

- (void)setBottomEdgeRegionSize:(double)a3
{
  self->_bottomEdgeRegionSize = a3;
}

- (double)edgeAngleWindow
{
  return self->_edgeAngleWindow;
}

- (void)setEdgeAngleWindow:(double)a3
{
  self->_edgeAngleWindow = a3;
}

- (double)edgeAngleWindowDecayTime
{
  return self->_edgeAngleWindowDecayTime;
}

- (void)setEdgeAngleWindowDecayTime:(double)a3
{
  self->_edgeAngleWindowDecayTime = a3;
}

- (double)maximumSwipeDuration
{
  return self->_maximumSwipeDuration;
}

- (void)setMaximumSwipeDuration:(double)a3
{
  self->_maximumSwipeDuration = a3;
}

@end
