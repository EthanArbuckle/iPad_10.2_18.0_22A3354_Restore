@implementation _UIScreenEdgePanRecognizerDwellSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIScreenEdgePanRecognizerDwellSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIScreenEdgePanRecognizerDwellSettings setLongPressPermittedHorizontalMovement:](self, "setLongPressPermittedHorizontalMovement:", 25.0);
  -[_UIScreenEdgePanRecognizerDwellSettings setLongPressPermittedVerticalMovement:](self, "setLongPressPermittedVerticalMovement:", 25.0);
  -[_UIScreenEdgePanRecognizerDwellSettings setLongPressTipPermittedHorizontalMovement:](self, "setLongPressTipPermittedHorizontalMovement:", 25.0);
  -[_UIScreenEdgePanRecognizerDwellSettings setLongPressTipPermittedVerticalMovement:](self, "setLongPressTipPermittedVerticalMovement:", 10.0);
  -[_UIScreenEdgePanRecognizerDwellSettings setLongPressRequiredDuration:](self, "setLongPressRequiredDuration:", 0.266);
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[5];
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Required Press Duration"), CFSTR("longPressRequiredDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 0.0, 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Permitted Horizontal Movement"), CFSTR("longPressTipPermittedHorizontalMovement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v6;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Permitted Vertical Movement"), CFSTR("longPressTipPermittedVerticalMovement"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v9, CFSTR("Tip Touch"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Permitted Horizontal Movement"), CFSTR("longPressFlatPermittedHorizontalMovement"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v11;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Permitted Vertical Movement"), CFSTR("longPressFlatPermittedVerticalMovement"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "precision:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v14, CFSTR("Flat Touch"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Permitted Horizontal Movement"), CFSTR("longPressPermittedHorizontalMovement"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "precision:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Permitted Vertical Movement"), CFSTR("longPressPermittedVerticalMovement"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "precision:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v20, CFSTR("Other Touch"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:action:", CFSTR("Restore Defaults"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0D83078];
  v33[0] = v32;
  v33[1] = v31;
  v33[2] = v15;
  v33[3] = v21;
  v33[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "moduleWithTitle:contents:", CFSTR("Edge Swipe"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (double)longPressTipPermittedHorizontalMovement
{
  return self->_longPressTipPermittedHorizontalMovement;
}

- (void)setLongPressTipPermittedHorizontalMovement:(double)a3
{
  self->_longPressTipPermittedHorizontalMovement = a3;
}

- (double)longPressTipPermittedVerticalMovement
{
  return self->_longPressTipPermittedVerticalMovement;
}

- (void)setLongPressTipPermittedVerticalMovement:(double)a3
{
  self->_longPressTipPermittedVerticalMovement = a3;
}

- (double)longPressPermittedHorizontalMovement
{
  return self->_longPressPermittedHorizontalMovement;
}

- (void)setLongPressPermittedHorizontalMovement:(double)a3
{
  self->_longPressPermittedHorizontalMovement = a3;
}

- (double)longPressPermittedVerticalMovement
{
  return self->_longPressPermittedVerticalMovement;
}

- (void)setLongPressPermittedVerticalMovement:(double)a3
{
  self->_longPressPermittedVerticalMovement = a3;
}

- (double)longPressRequiredDuration
{
  return self->_longPressRequiredDuration;
}

- (void)setLongPressRequiredDuration:(double)a3
{
  self->_longPressRequiredDuration = a3;
}

@end
