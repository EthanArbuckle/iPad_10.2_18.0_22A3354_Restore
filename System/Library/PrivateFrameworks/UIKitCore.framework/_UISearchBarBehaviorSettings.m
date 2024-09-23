@implementation _UISearchBarBehaviorSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchBarBehaviorSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UISearchBarBehaviorSettings setButtonMinimumHeight:](self, "setButtonMinimumHeight:", 36.0);
  -[_UISearchBarBehaviorSettings setButtonTightPadding:](self, "setButtonTightPadding:", 8.0);
  -[_UISearchBarBehaviorSettings setButtonGenerousPadding:](self, "setButtonGenerousPadding:", 12.0);
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
  _QWORD v24[2];
  void *v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Height"), CFSTR("buttonMinimumHeight"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "between:and:", 30.0, 50.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use generous padding values (this will become automatic)"), CFSTR("useGenerousPadding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Tight Padding"), CFSTR("buttonTightPadding"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 4.0, 20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v6;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Generous Padding"), CFSTR("buttonGenerousPadding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 4.0, 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v8;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Corner Radius"), CFSTR("buttonCornerRadius"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 4.0, 20.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Search Button Highlight"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Restore Defaults"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v25 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83078];
  v24[0] = v12;
  v24[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "moduleWithTitle:contents:", 0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)useGenerousPadding
{
  return self->_useGenerousPadding;
}

- (void)setUseGenerousPadding:(BOOL)a3
{
  self->_useGenerousPadding = a3;
}

- (double)buttonMinimumHeight
{
  return self->_buttonMinimumHeight;
}

- (void)setButtonMinimumHeight:(double)a3
{
  self->_buttonMinimumHeight = a3;
}

- (double)buttonTightPadding
{
  return self->_buttonTightPadding;
}

- (void)setButtonTightPadding:(double)a3
{
  self->_buttonTightPadding = a3;
}

- (double)buttonGenerousPadding
{
  return self->_buttonGenerousPadding;
}

- (void)setButtonGenerousPadding:(double)a3
{
  self->_buttonGenerousPadding = a3;
}

@end
