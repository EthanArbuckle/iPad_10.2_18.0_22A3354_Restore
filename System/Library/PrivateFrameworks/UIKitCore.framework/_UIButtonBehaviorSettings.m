@implementation _UIButtonBehaviorSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBehaviorSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIButtonBehaviorSettings setTextButtonOutsetLeading:](self, "setTextButtonOutsetLeading:", 10.0);
  -[_UIButtonBehaviorSettings setTextButtonOutsetTrailing:](self, "setTextButtonOutsetTrailing:", 10.0);
  -[_UIButtonBehaviorSettings setTextButtonOutsetTop:](self, "setTextButtonOutsetTop:", 7.5);
  -[_UIButtonBehaviorSettings setTextButtonOutsetBottom:](self, "setTextButtonOutsetBottom:", 8.5);
  -[_UIButtonBehaviorSettings setTextButtonMinWidth:](self, "setTextButtonMinWidth:", 0.0);
  -[_UIButtonBehaviorSettings setTextButtonMinHeight:](self, "setTextButtonMinHeight:", 0.0);
  -[_UIButtonBehaviorSettings setImageButtonOutsetLeading:](self, "setImageButtonOutsetLeading:", 8.0);
  -[_UIButtonBehaviorSettings setImageButtonOutsetTrailing:](self, "setImageButtonOutsetTrailing:", 8.0);
  -[_UIButtonBehaviorSettings setImageButtonOutsetTop:](self, "setImageButtonOutsetTop:", 8.0);
  -[_UIButtonBehaviorSettings setImageButtonOutsetBottom:](self, "setImageButtonOutsetBottom:", 8.0);
  -[_UIButtonBehaviorSettings setImageButtonMinWidth:](self, "setImageButtonMinWidth:", 0.0);
  -[_UIButtonBehaviorSettings setImageButtonMinHeight:](self, "setImageButtonMinHeight:", 0.0);
  -[_UIButtonBehaviorSettings setMixedButtonOutsetLeading:](self, "setMixedButtonOutsetLeading:", 10.0);
  -[_UIButtonBehaviorSettings setMixedButtonOutsetTrailing:](self, "setMixedButtonOutsetTrailing:", 10.0);
  -[_UIButtonBehaviorSettings setMixedButtonOutsetTop:](self, "setMixedButtonOutsetTop:", 7.5);
  -[_UIButtonBehaviorSettings setMixedButtonOutsetBottom:](self, "setMixedButtonOutsetBottom:", 8.5);
  -[_UIButtonBehaviorSettings setMixedButtonMinWidth:](self, "setMixedButtonMinWidth:", 0.0);
  -[_UIButtonBehaviorSettings setMixedButtonMinHeight:](self, "setMixedButtonMinHeight:", 0.0);
  -[_UIButtonBehaviorSettings setRoundButtonOutset:](self, "setRoundButtonOutset:", 8.0);
  -[_UIButtonBehaviorSettings setRoundButtonMinSize:](self, "setRoundButtonMinSize:", 0.0);
  -[_UIButtonBehaviorSettings setCloseButtonOutset:](self, "setCloseButtonOutset:", 0.0);
  -[_UIButtonBehaviorSettings setCloseButtonMinSize:](self, "setCloseButtonMinSize:", 0.0);
}

- (BOOL)_useTextSettings
{
  -[_UIButtonBehaviorSettings textButtonOutsetLeading](self, "textButtonOutsetLeading");
  -[_UIButtonBehaviorSettings setImageButtonOutsetLeading:](self, "setImageButtonOutsetLeading:");
  -[_UIButtonBehaviorSettings textButtonOutsetTrailing](self, "textButtonOutsetTrailing");
  -[_UIButtonBehaviorSettings setImageButtonOutsetTrailing:](self, "setImageButtonOutsetTrailing:");
  -[_UIButtonBehaviorSettings textButtonOutsetTop](self, "textButtonOutsetTop");
  -[_UIButtonBehaviorSettings setImageButtonOutsetTop:](self, "setImageButtonOutsetTop:");
  -[_UIButtonBehaviorSettings textButtonOutsetBottom](self, "textButtonOutsetBottom");
  -[_UIButtonBehaviorSettings setImageButtonOutsetBottom:](self, "setImageButtonOutsetBottom:");
  -[_UIButtonBehaviorSettings textButtonMinWidth](self, "textButtonMinWidth");
  -[_UIButtonBehaviorSettings setImageButtonMinWidth:](self, "setImageButtonMinWidth:");
  -[_UIButtonBehaviorSettings textButtonMinHeight](self, "textButtonMinHeight");
  -[_UIButtonBehaviorSettings setImageButtonMinHeight:](self, "setImageButtonMinHeight:");
  -[_UIButtonBehaviorSettings textButtonOutsetLeading](self, "textButtonOutsetLeading");
  -[_UIButtonBehaviorSettings setMixedButtonOutsetLeading:](self, "setMixedButtonOutsetLeading:");
  -[_UIButtonBehaviorSettings textButtonOutsetTrailing](self, "textButtonOutsetTrailing");
  -[_UIButtonBehaviorSettings setMixedButtonOutsetTrailing:](self, "setMixedButtonOutsetTrailing:");
  -[_UIButtonBehaviorSettings textButtonOutsetTop](self, "textButtonOutsetTop");
  -[_UIButtonBehaviorSettings setMixedButtonOutsetTop:](self, "setMixedButtonOutsetTop:");
  -[_UIButtonBehaviorSettings textButtonOutsetBottom](self, "textButtonOutsetBottom");
  -[_UIButtonBehaviorSettings setMixedButtonOutsetBottom:](self, "setMixedButtonOutsetBottom:");
  -[_UIButtonBehaviorSettings textButtonMinWidth](self, "textButtonMinWidth");
  -[_UIButtonBehaviorSettings setMixedButtonMinWidth:](self, "setMixedButtonMinWidth:");
  -[_UIButtonBehaviorSettings textButtonMinHeight](self, "textButtonMinHeight");
  -[_UIButtonBehaviorSettings setMixedButtonMinHeight:](self, "setMixedButtonMinHeight:");
  return 1;
}

- (BOOL)_useImageSettings
{
  -[_UIButtonBehaviorSettings imageButtonOutsetLeading](self, "imageButtonOutsetLeading");
  -[_UIButtonBehaviorSettings setTextButtonOutsetLeading:](self, "setTextButtonOutsetLeading:");
  -[_UIButtonBehaviorSettings imageButtonOutsetTrailing](self, "imageButtonOutsetTrailing");
  -[_UIButtonBehaviorSettings setTextButtonOutsetTrailing:](self, "setTextButtonOutsetTrailing:");
  -[_UIButtonBehaviorSettings imageButtonOutsetTop](self, "imageButtonOutsetTop");
  -[_UIButtonBehaviorSettings setTextButtonOutsetTop:](self, "setTextButtonOutsetTop:");
  -[_UIButtonBehaviorSettings imageButtonOutsetBottom](self, "imageButtonOutsetBottom");
  -[_UIButtonBehaviorSettings setTextButtonOutsetBottom:](self, "setTextButtonOutsetBottom:");
  -[_UIButtonBehaviorSettings imageButtonMinWidth](self, "imageButtonMinWidth");
  -[_UIButtonBehaviorSettings setTextButtonMinWidth:](self, "setTextButtonMinWidth:");
  -[_UIButtonBehaviorSettings imageButtonMinHeight](self, "imageButtonMinHeight");
  -[_UIButtonBehaviorSettings setTextButtonMinHeight:](self, "setTextButtonMinHeight:");
  -[_UIButtonBehaviorSettings imageButtonOutsetLeading](self, "imageButtonOutsetLeading");
  -[_UIButtonBehaviorSettings setMixedButtonOutsetLeading:](self, "setMixedButtonOutsetLeading:");
  -[_UIButtonBehaviorSettings imageButtonOutsetTrailing](self, "imageButtonOutsetTrailing");
  -[_UIButtonBehaviorSettings setMixedButtonOutsetTrailing:](self, "setMixedButtonOutsetTrailing:");
  -[_UIButtonBehaviorSettings imageButtonOutsetTop](self, "imageButtonOutsetTop");
  -[_UIButtonBehaviorSettings setMixedButtonOutsetTop:](self, "setMixedButtonOutsetTop:");
  -[_UIButtonBehaviorSettings imageButtonOutsetBottom](self, "imageButtonOutsetBottom");
  -[_UIButtonBehaviorSettings setMixedButtonOutsetBottom:](self, "setMixedButtonOutsetBottom:");
  -[_UIButtonBehaviorSettings imageButtonMinWidth](self, "imageButtonMinWidth");
  -[_UIButtonBehaviorSettings setMixedButtonMinWidth:](self, "setMixedButtonMinWidth:");
  -[_UIButtonBehaviorSettings imageButtonMinHeight](self, "imageButtonMinHeight");
  -[_UIButtonBehaviorSettings setMixedButtonMinHeight:](self, "setMixedButtonMinHeight:");
  return 1;
}

- (BOOL)_useMixedSettings
{
  -[_UIButtonBehaviorSettings mixedButtonOutsetLeading](self, "mixedButtonOutsetLeading");
  -[_UIButtonBehaviorSettings setTextButtonOutsetLeading:](self, "setTextButtonOutsetLeading:");
  -[_UIButtonBehaviorSettings mixedButtonOutsetTrailing](self, "mixedButtonOutsetTrailing");
  -[_UIButtonBehaviorSettings setTextButtonOutsetTrailing:](self, "setTextButtonOutsetTrailing:");
  -[_UIButtonBehaviorSettings mixedButtonOutsetTop](self, "mixedButtonOutsetTop");
  -[_UIButtonBehaviorSettings setTextButtonOutsetTop:](self, "setTextButtonOutsetTop:");
  -[_UIButtonBehaviorSettings mixedButtonOutsetBottom](self, "mixedButtonOutsetBottom");
  -[_UIButtonBehaviorSettings setTextButtonOutsetBottom:](self, "setTextButtonOutsetBottom:");
  -[_UIButtonBehaviorSettings mixedButtonMinWidth](self, "mixedButtonMinWidth");
  -[_UIButtonBehaviorSettings setTextButtonMinWidth:](self, "setTextButtonMinWidth:");
  -[_UIButtonBehaviorSettings mixedButtonMinHeight](self, "mixedButtonMinHeight");
  -[_UIButtonBehaviorSettings setTextButtonMinHeight:](self, "setTextButtonMinHeight:");
  -[_UIButtonBehaviorSettings mixedButtonOutsetLeading](self, "mixedButtonOutsetLeading");
  -[_UIButtonBehaviorSettings setImageButtonOutsetLeading:](self, "setImageButtonOutsetLeading:");
  -[_UIButtonBehaviorSettings mixedButtonOutsetTrailing](self, "mixedButtonOutsetTrailing");
  -[_UIButtonBehaviorSettings setImageButtonOutsetTrailing:](self, "setImageButtonOutsetTrailing:");
  -[_UIButtonBehaviorSettings mixedButtonOutsetTop](self, "mixedButtonOutsetTop");
  -[_UIButtonBehaviorSettings setImageButtonOutsetTop:](self, "setImageButtonOutsetTop:");
  -[_UIButtonBehaviorSettings mixedButtonOutsetBottom](self, "mixedButtonOutsetBottom");
  -[_UIButtonBehaviorSettings setImageButtonOutsetBottom:](self, "setImageButtonOutsetBottom:");
  -[_UIButtonBehaviorSettings mixedButtonMinWidth](self, "mixedButtonMinWidth");
  -[_UIButtonBehaviorSettings setImageButtonMinWidth:](self, "setImageButtonMinWidth:");
  -[_UIButtonBehaviorSettings mixedButtonMinHeight](self, "mixedButtonMinHeight");
  -[_UIButtonBehaviorSettings setImageButtonMinHeight:](self, "setImageButtonMinHeight:");
  return 1;
}

+ (id)settingsControllerModule
{
  uint64_t v2;
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
  uint64_t v13;
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
  uint64_t v24;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[6];
  void *v81;
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[7];
  _QWORD v85[7];
  _QWORD v86[9];

  v86[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_379);
  v2 = objc_claimAutoreleasedReturnValue();
  v77 = (void *)MEMORY[0x1E0D83078];
  v79 = (void *)v2;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Leading"), CFSTR("textButtonOutsetLeading"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "between:and:", 0.0, 20.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v72;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing"), CFSTR("textButtonOutsetTrailing"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "between:and:", 0.0, 20.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v65;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Top"), CFSTR("textButtonOutsetTop"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 20.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bottom"), CFSTR("textButtonOutsetBottom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v6;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Width"), CFSTR("textButtonMinWidth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 0.0, 100.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v86[4] = v8;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Height"), CFSTR("textButtonMinHeight"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 100.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v86[5] = v10;
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", CFSTR("Use for All Text/Image Buttons"), v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v86[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "sectionWithRows:title:", v12, CFSTR("Text Only Buttons"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_434_0);
  v13 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)MEMORY[0x1E0D83078];
  v76 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Leading"), CFSTR("imageButtonOutsetLeading"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "between:and:", 0.0, 20.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v66;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing"), CFSTR("imageButtonOutsetTrailing"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "between:and:", 0.0, 20.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v61;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Top"), CFSTR("imageButtonOutsetTop"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.0, 20.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v15;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bottom"), CFSTR("imageButtonOutsetBottom"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 20.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v17;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Width"), CFSTR("imageButtonMinWidth"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 100.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v19;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Height"), CFSTR("imageButtonMinHeight"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 100.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v21;
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", CFSTR("Use for All Text/Image Buttons"), v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "sectionWithRows:title:", v23, CFSTR("Image Only Buttons"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_449);
  v24 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)MEMORY[0x1E0D83078];
  v71 = (void *)v24;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Leading"), CFSTR("mixedButtonOutsetLeading"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "between:and:", 0.0, 20.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v62;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing"), CFSTR("mixedButtonOutsetTrailing"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "between:and:", 0.0, 20.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v59;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Top"), CFSTR("mixedButtonOutsetTop"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 20.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v26;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bottom"), CFSTR("mixedButtonOutsetBottom"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "between:and:", 0.0, 20.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v28;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Width"), CFSTR("mixedButtonMinWidth"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 100.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v30;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Height"), CFSTR("mixedButtonMinHeight"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "between:and:", 0.0, 100.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v32;
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", CFSTR("Use for All Text/Image Buttons"), v24);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v84[6] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "sectionWithRows:title:", v34, CFSTR("Text & Image Buttons"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Outset"), CFSTR("roundButtonOutset"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 20.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v37;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Size"), CFSTR("roundButtonMinSize"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "between:and:", 0.0, 100.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v40, CFSTR("Round Buttons"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Outset"), CFSTR("closeButtonOutset"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "between:and:", 0.0, 20.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v44;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Size"), CFSTR("closeButtonMinSize"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "between:and:", 0.0, 100.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sectionWithRows:title:", v47, CFSTR("Close Buttons"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:action:", CFSTR("Restore Defaults"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0D83078];
  v81 = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "sectionWithRows:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (void *)MEMORY[0x1E0D83078];
  v80[0] = v78;
  v80[1] = v74;
  v80[2] = v68;
  v80[3] = v41;
  v80[4] = v48;
  v80[5] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 6);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "moduleWithTitle:contents:", 0, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (double)textButtonOutsetLeading
{
  return self->_textButtonOutsetLeading;
}

- (void)setTextButtonOutsetLeading:(double)a3
{
  self->_textButtonOutsetLeading = a3;
}

- (double)textButtonOutsetTrailing
{
  return self->_textButtonOutsetTrailing;
}

- (void)setTextButtonOutsetTrailing:(double)a3
{
  self->_textButtonOutsetTrailing = a3;
}

- (double)textButtonOutsetTop
{
  return self->_textButtonOutsetTop;
}

- (void)setTextButtonOutsetTop:(double)a3
{
  self->_textButtonOutsetTop = a3;
}

- (double)textButtonOutsetBottom
{
  return self->_textButtonOutsetBottom;
}

- (void)setTextButtonOutsetBottom:(double)a3
{
  self->_textButtonOutsetBottom = a3;
}

- (double)textButtonMinWidth
{
  return self->_textButtonMinWidth;
}

- (void)setTextButtonMinWidth:(double)a3
{
  self->_textButtonMinWidth = a3;
}

- (double)textButtonMinHeight
{
  return self->_textButtonMinHeight;
}

- (void)setTextButtonMinHeight:(double)a3
{
  self->_textButtonMinHeight = a3;
}

- (double)imageButtonOutsetLeading
{
  return self->_imageButtonOutsetLeading;
}

- (void)setImageButtonOutsetLeading:(double)a3
{
  self->_imageButtonOutsetLeading = a3;
}

- (double)imageButtonOutsetTrailing
{
  return self->_imageButtonOutsetTrailing;
}

- (void)setImageButtonOutsetTrailing:(double)a3
{
  self->_imageButtonOutsetTrailing = a3;
}

- (double)imageButtonOutsetTop
{
  return self->_imageButtonOutsetTop;
}

- (void)setImageButtonOutsetTop:(double)a3
{
  self->_imageButtonOutsetTop = a3;
}

- (double)imageButtonOutsetBottom
{
  return self->_imageButtonOutsetBottom;
}

- (void)setImageButtonOutsetBottom:(double)a3
{
  self->_imageButtonOutsetBottom = a3;
}

- (double)imageButtonMinWidth
{
  return self->_imageButtonMinWidth;
}

- (void)setImageButtonMinWidth:(double)a3
{
  self->_imageButtonMinWidth = a3;
}

- (double)imageButtonMinHeight
{
  return self->_imageButtonMinHeight;
}

- (void)setImageButtonMinHeight:(double)a3
{
  self->_imageButtonMinHeight = a3;
}

- (double)mixedButtonOutsetLeading
{
  return self->_mixedButtonOutsetLeading;
}

- (void)setMixedButtonOutsetLeading:(double)a3
{
  self->_mixedButtonOutsetLeading = a3;
}

- (double)mixedButtonOutsetTrailing
{
  return self->_mixedButtonOutsetTrailing;
}

- (void)setMixedButtonOutsetTrailing:(double)a3
{
  self->_mixedButtonOutsetTrailing = a3;
}

- (double)mixedButtonOutsetTop
{
  return self->_mixedButtonOutsetTop;
}

- (void)setMixedButtonOutsetTop:(double)a3
{
  self->_mixedButtonOutsetTop = a3;
}

- (double)mixedButtonOutsetBottom
{
  return self->_mixedButtonOutsetBottom;
}

- (void)setMixedButtonOutsetBottom:(double)a3
{
  self->_mixedButtonOutsetBottom = a3;
}

- (double)mixedButtonMinWidth
{
  return self->_mixedButtonMinWidth;
}

- (void)setMixedButtonMinWidth:(double)a3
{
  self->_mixedButtonMinWidth = a3;
}

- (double)mixedButtonMinHeight
{
  return self->_mixedButtonMinHeight;
}

- (void)setMixedButtonMinHeight:(double)a3
{
  self->_mixedButtonMinHeight = a3;
}

- (double)roundButtonOutset
{
  return self->_roundButtonOutset;
}

- (void)setRoundButtonOutset:(double)a3
{
  self->_roundButtonOutset = a3;
}

- (double)roundButtonMinSize
{
  return self->_roundButtonMinSize;
}

- (void)setRoundButtonMinSize:(double)a3
{
  self->_roundButtonMinSize = a3;
}

- (double)closeButtonOutset
{
  return self->_closeButtonOutset;
}

- (void)setCloseButtonOutset:(double)a3
{
  self->_closeButtonOutset = a3;
}

- (double)closeButtonMinSize
{
  return self->_closeButtonMinSize;
}

- (void)setCloseButtonMinSize:(double)a3
{
  self->_closeButtonMinSize = a3;
}

@end
