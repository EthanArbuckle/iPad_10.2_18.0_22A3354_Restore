@implementation SBCenterWindowSizingSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCenterWindowSizingSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBCenterWindowSizingSettings setUseCustomSizingForNewWindows:](self, "setUseCustomSizingForNewWindows:", 1);
  -[SBCenterWindowSizingSettings setFullWidthScaleFactor:](self, "setFullWidthScaleFactor:", 1.0);
  -[SBCenterWindowSizingSettings setFullHeightScaleFactor:](self, "setFullHeightScaleFactor:", 1.0);
  -[SBCenterWindowSizingSettings setTopInset:](self, "setTopInset:", 0.0);
  -[SBCenterWindowSizingSettings setBottomInset:](self, "setBottomInset:", 0.0);
  -[SBCenterWindowSizingSettings setLeftInset:](self, "setLeftInset:", 0.0);
  -[SBCenterWindowSizingSettings setRightInset:](self, "setRightInset:", 0.0);
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  void *v52;
  _QWORD v53[4];
  _QWORD v54[2];
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Custom Window Sizing Override"), CFSTR("useCustomSizingForNewWindows"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v50, CFSTR("Open Window Sizing Settings [* scaleFactor - inset]"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_fullWidthScaleFactor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Full Screen Width Scale Factor"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "precision:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v7;
  v8 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_fullHeightScaleFactor);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Full Screen Height Scale Factor"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v48, CFSTR("Scale Factor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_topInset);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Top Inset"), v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "between:and:", -5000.0, 5000.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "precision:", 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v43;
  v14 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_bottomInset);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Bottom Inset"), v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "between:and:", -5000.0, 5000.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "precision:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v15;
  v16 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_leftInset);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Left Inset"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", -5000.0, 5000.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v20;
  v21 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_rightInset);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Right Inset"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "between:and:", -5000.0, 5000.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "precision:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
  v26 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v26;
  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v26, CFSTR("Inset"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:action:", CFSTR("Restore Defaults"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0D83070];
  v52 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sectionWithRows:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0C99DE8];
  v51[0] = v49;
  v51[1] = v47;
  v51[2] = v28;
  v51[3] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "arrayWithArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "moduleWithTitle:contents:", CFSTR("Open New Window Sizing Override"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (BOOL)useCustomSizingForNewWindows
{
  return self->_useCustomSizingForNewWindows;
}

- (void)setUseCustomSizingForNewWindows:(BOOL)a3
{
  self->_useCustomSizingForNewWindows = a3;
}

- (double)fullWidthScaleFactor
{
  return self->_fullWidthScaleFactor;
}

- (void)setFullWidthScaleFactor:(double)a3
{
  self->_fullWidthScaleFactor = a3;
}

- (double)fullHeightScaleFactor
{
  return self->_fullHeightScaleFactor;
}

- (void)setFullHeightScaleFactor:(double)a3
{
  self->_fullHeightScaleFactor = a3;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (void)setLeftInset:(double)a3
{
  self->_leftInset = a3;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (void)setRightInset:(double)a3
{
  self->_rightInset = a3;
}

@end
