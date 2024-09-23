@implementation _UINavigationAndToolbarBehaviorSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationAndToolbarBehaviorSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UINavigationAndToolbarBehaviorSettings setEnableLiftOnSelected:](self, "setEnableLiftOnSelected:", 1);
  -[_UINavigationAndToolbarBehaviorSettings setEnableClippingBehavior:](self, "setEnableClippingBehavior:", 0);
  -[_UINavigationAndToolbarBehaviorSettings setButtonMinimumWidth:](self, "setButtonMinimumWidth:", 51.0);
  -[_UINavigationAndToolbarBehaviorSettings setButtonMinimumHeight:](self, "setButtonMinimumHeight:", 37.0);
  -[_UINavigationAndToolbarBehaviorSettings setButtonHorizontalOffset:](self, "setButtonHorizontalOffset:", 0.0);
  -[_UINavigationAndToolbarBehaviorSettings setButtonVerticalOffset:](self, "setButtonVerticalOffset:", 0.0);
  -[_UINavigationAndToolbarBehaviorSettings setButtonMinimumDistanceFromEdge:](self, "setButtonMinimumDistanceFromEdge:", 4.0);
  -[_UINavigationAndToolbarBehaviorSettings setButtonCornerRadius:](self, "setButtonCornerRadius:", 8.0);
  -[_UINavigationAndToolbarBehaviorSettings setButtonPadding:](self, "setButtonPadding:", 12.0);
  -[_UINavigationAndToolbarBehaviorSettings setBackButtonLeadingPadding:](self, "setBackButtonLeadingPadding:", 7.0);
  -[_UINavigationAndToolbarBehaviorSettings setBackButtonTrailingPadding:](self, "setBackButtonTrailingPadding:", 8.0);
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  void *v36;
  _QWORD v37[13];

  v37[11] = *MEMORY[0x1E0C80C00];
  v27 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Lift Effect for Selected Buttons"), CFSTR("enableLiftOnSelected"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v34;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Prevent Highlights from touching edges (this will become automatic)"), CFSTR("enableClippingBehavior"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v33;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Width"), CFSTR("buttonMinimumWidth"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 30.0, 80.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v31;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Height"), CFSTR("buttonMinimumHeight"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 30.0, 50.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v29;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Offset"), CFSTR("buttonHorizontalOffset"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", -5.0, 5.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v25;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Offset"), CFSTR("buttonVerticalOffset"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", -5.0, 5.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v23;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Edge Distance"), CFSTR("buttonMinimumDistanceFromEdge"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 4.0, 20.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v2;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Corner Radius"), CFSTR("buttonCornerRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 4.0, 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Padding"), CFSTR("buttonPadding"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 4.0, 20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v6;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Back Button Leading Padding"), CFSTR("backButtonLeadingPadding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 4.0, 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v8;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Back Button Trailing Padding"), CFSTR("backButtonTrailingPadding"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 4.0, 20.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sectionWithRows:title:", v11, CFSTR("Navigation & Toolbar Button Highlight"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:action:", CFSTR("Restore Defaults"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  v36 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  v35[0] = v28;
  v35[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)enableLiftOnSelected
{
  return self->_enableLiftOnSelected;
}

- (void)setEnableLiftOnSelected:(BOOL)a3
{
  self->_enableLiftOnSelected = a3;
}

- (BOOL)enableClippingBehavior
{
  return self->_enableClippingBehavior;
}

- (void)setEnableClippingBehavior:(BOOL)a3
{
  self->_enableClippingBehavior = a3;
}

- (double)buttonMinimumWidth
{
  return self->_buttonMinimumWidth;
}

- (void)setButtonMinimumWidth:(double)a3
{
  self->_buttonMinimumWidth = a3;
}

- (double)buttonMinimumHeight
{
  return self->_buttonMinimumHeight;
}

- (void)setButtonMinimumHeight:(double)a3
{
  self->_buttonMinimumHeight = a3;
}

- (double)buttonHorizontalOffset
{
  return self->_buttonHorizontalOffset;
}

- (void)setButtonHorizontalOffset:(double)a3
{
  self->_buttonHorizontalOffset = a3;
}

- (double)buttonVerticalOffset
{
  return self->_buttonVerticalOffset;
}

- (void)setButtonVerticalOffset:(double)a3
{
  self->_buttonVerticalOffset = a3;
}

- (double)buttonMinimumDistanceFromEdge
{
  return self->_buttonMinimumDistanceFromEdge;
}

- (void)setButtonMinimumDistanceFromEdge:(double)a3
{
  self->_buttonMinimumDistanceFromEdge = a3;
}

- (double)buttonCornerRadius
{
  return self->_buttonCornerRadius;
}

- (void)setButtonCornerRadius:(double)a3
{
  self->_buttonCornerRadius = a3;
}

- (double)buttonPadding
{
  return self->_buttonPadding;
}

- (void)setButtonPadding:(double)a3
{
  self->_buttonPadding = a3;
}

- (double)backButtonLeadingPadding
{
  return self->_backButtonLeadingPadding;
}

- (void)setBackButtonLeadingPadding:(double)a3
{
  self->_backButtonLeadingPadding = a3;
}

- (double)backButtonTrailingPadding
{
  return self->_backButtonTrailingPadding;
}

- (void)setBackButtonTrailingPadding:(double)a3
{
  self->_backButtonTrailingPadding = a3;
}

@end
