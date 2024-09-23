@implementation SBAmbientLiveActivitiesSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAmbientLiveActivitiesSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_fullScreenDragCornerRadiusDampingRatio = 0.845;
  self->_fullScreenDragCornerRadiusResponse = 0.531;
  self->_fullScreenDragScaleDampingRatio = 0.845;
  self->_fullScreenDragScaleResponse = 0.531;
  self->_fullScreenDragPositionDampingRatio = 0.845;
  self->_fullScreenDragPositionResponse = 0.531;
  self->_fullScreenTransitionToCompactDampingRatio = 0.75;
  self->_fullScreenTransitionToCompactResponse = 0.52;
  self->_fullScreenDismissGestureEnabled = 0;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), CFSTR("fullScreenDragCornerRadiusDampingRatio"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("fullScreenDragCornerRadiusResponse"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), CFSTR("fullScreenDragScaleDampingRatio"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("fullScreenDragScaleResponse"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), CFSTR("fullScreenDragPositionDampingRatio"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("fullScreenDragPositionResponse"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), CFSTR("fullScreenTransitionToCompactDampingRatio"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("fullScreenTransitionToCompactResponse"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Full screen dismiss gesture"), CFSTR("fullScreenDismissGestureEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83070];
  v35[0] = v27;
  v35[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v3, CFSTR("Full screen drag corner radius"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v34[0] = v25;
  v34[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Full screen drag scale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83070];
  v33[0] = v23;
  v33[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v8, CFSTR("Full screen drag position"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83070];
  v32[0] = v28;
  v32[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Transition to compact"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83070];
  v31 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:title:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83070];
  v30[0] = v22;
  v30[1] = v6;
  v30[2] = v9;
  v30[3] = v12;
  v30[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("Domino Settings"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)fullScreenDragCornerRadiusDampingRatio
{
  return self->_fullScreenDragCornerRadiusDampingRatio;
}

- (void)setFullScreenDragCornerRadiusDampingRatio:(double)a3
{
  self->_fullScreenDragCornerRadiusDampingRatio = a3;
}

- (double)fullScreenDragCornerRadiusResponse
{
  return self->_fullScreenDragCornerRadiusResponse;
}

- (void)setFullScreenDragCornerRadiusResponse:(double)a3
{
  self->_fullScreenDragCornerRadiusResponse = a3;
}

- (double)fullScreenDragScaleDampingRatio
{
  return self->_fullScreenDragScaleDampingRatio;
}

- (void)setFullScreenDragScaleDampingRatio:(double)a3
{
  self->_fullScreenDragScaleDampingRatio = a3;
}

- (double)fullScreenDragScaleResponse
{
  return self->_fullScreenDragScaleResponse;
}

- (void)setFullScreenDragScaleResponse:(double)a3
{
  self->_fullScreenDragScaleResponse = a3;
}

- (double)fullScreenDragPositionDampingRatio
{
  return self->_fullScreenDragPositionDampingRatio;
}

- (void)setFullScreenDragPositionDampingRatio:(double)a3
{
  self->_fullScreenDragPositionDampingRatio = a3;
}

- (double)fullScreenDragPositionResponse
{
  return self->_fullScreenDragPositionResponse;
}

- (void)setFullScreenDragPositionResponse:(double)a3
{
  self->_fullScreenDragPositionResponse = a3;
}

- (double)fullScreenTransitionToCompactDampingRatio
{
  return self->_fullScreenTransitionToCompactDampingRatio;
}

- (void)setFullScreenTransitionToCompactDampingRatio:(double)a3
{
  self->_fullScreenTransitionToCompactDampingRatio = a3;
}

- (double)fullScreenTransitionToCompactResponse
{
  return self->_fullScreenTransitionToCompactResponse;
}

- (void)setFullScreenTransitionToCompactResponse:(double)a3
{
  self->_fullScreenTransitionToCompactResponse = a3;
}

- (BOOL)fullScreenDismissGestureEnabled
{
  return self->_fullScreenDismissGestureEnabled;
}

- (void)setFullScreenDismissGestureEnabled:(BOOL)a3
{
  self->_fullScreenDismissGestureEnabled = a3;
}

@end
