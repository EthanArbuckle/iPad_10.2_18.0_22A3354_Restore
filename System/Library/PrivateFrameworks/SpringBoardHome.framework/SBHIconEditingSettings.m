@implementation SBHIconEditingSettings

- (int64_t)overrideAnimationType
{
  return self->_overrideAnimationType;
}

- (BOOL)showIndexLabels
{
  return self->_showIndexLabels;
}

- (void)setDefaultValues
{
  -[SBHIconEditingSettings setShowIndexLabels:](self, "setShowIndexLabels:", 0);
  -[SBHIconEditingSettings setShowDragPlatterIconBorder:](self, "setShowDragPlatterIconBorder:", 0);
  -[SBHIconEditingSettings setEditingLiftDelay:](self, "setEditingLiftDelay:", 0.1);
  -[SBHIconEditingSettings setLongPressToEditDuration:](self, "setLongPressToEditDuration:", 0.5);
  -[SBHIconEditingSettings setDefaultSpringDampingRatio:](self, "setDefaultSpringDampingRatio:", 0.85);
  -[SBHIconEditingSettings setDefaultSpringDuration:](self, "setDefaultSpringDuration:", 0.67);
  -[SBHIconEditingSettings setClusterFastestDuration:](self, "setClusterFastestDuration:", 0.67);
  -[SBHIconEditingSettings setClusterSlowestDuration:](self, "setClusterSlowestDuration:", 0.85);
  -[SBHIconEditingSettings setClusterMiddleFastDuration:](self, "setClusterMiddleFastDuration:", 0.77);
  -[SBHIconEditingSettings setClusterMiddleSlowDuration:](self, "setClusterMiddleSlowDuration:", 0.82);
  -[SBHIconEditingSettings setOverrideAnimationType:](self, "setOverrideAnimationType:", -1);
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
  void *v30;
  void *v31;
  void *v32;
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
  _QWORD v50[5];
  _QWORD v51[2];
  _QWORD v52[7];
  _QWORD v53[2];
  void *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83078];
  v55[0] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:outletKeyPath:", CFSTR("Reset Home Screen Layout"), CFSTR("resetHomeScreenLayoutOutlet"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83078];
  v54 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:", v7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Editing Lift Delay"), CFSTR("editingLiftDelay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "precision:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v10;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Long Press To Edit Duration"), CFSTR("longPressToEditDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 2.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "precision:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Override Animation Type"), CFSTR("overrideAnimationType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "possibleValues:titles:", &unk_1E8E17588, &unk_1E8E175A0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Default Spring Duration"), CFSTR("defaultSpringDuration"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "between:and:", 0.0, 2.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "precision:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v41;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Default Spring Damping Ratio"), CFSTR("defaultSpringDampingRatio"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0, 2.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "precision:", 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v37;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Cluster Fastest Duration"), CFSTR("clusterFastestDuration"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 2.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "precision:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v34;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Cluster Slowest Duration"), CFSTR("clusterSlowestDuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.0, 2.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "precision:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v17;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Cluster Middle Fast Duration"), CFSTR("clusterMiddleFastDuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 2.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v20;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Cluster Middle Slow Duration"), CFSTR("clusterMiddleSlowDuration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 2.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "precision:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v23;
  v52[6] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Index Labels"), CFSTR("showIndexLabels"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v26;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Drag Platter Icon Border"), CFSTR("showDragPlatterIconBorder"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0D83078];
  v50[0] = v46;
  v50[1] = v45;
  v50[2] = v44;
  v50[3] = v25;
  v50[4] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "moduleWithTitle:contents:", CFSTR("Icon Editing"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (PTOutlet)resetHomeScreenLayoutOutlet
{
  return self->_resetHomeScreenLayoutOutlet;
}

- (void)setResetHomeScreenLayoutOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_resetHomeScreenLayoutOutlet, a3);
}

- (void)setShowIndexLabels:(BOOL)a3
{
  self->_showIndexLabels = a3;
}

- (BOOL)showDragPlatterIconBorder
{
  return self->_showDragPlatterIconBorder;
}

- (void)setShowDragPlatterIconBorder:(BOOL)a3
{
  self->_showDragPlatterIconBorder = a3;
}

- (double)editingLiftDelay
{
  return self->_editingLiftDelay;
}

- (void)setEditingLiftDelay:(double)a3
{
  self->_editingLiftDelay = a3;
}

- (double)longPressToEditDuration
{
  return self->_longPressToEditDuration;
}

- (void)setLongPressToEditDuration:(double)a3
{
  self->_longPressToEditDuration = a3;
}

- (BOOL)waitForPause
{
  return self->_waitForPause;
}

- (void)setWaitForPause:(BOOL)a3
{
  self->_waitForPause = a3;
}

- (double)defaultPauseDuration
{
  return self->_defaultPauseDuration;
}

- (void)setDefaultPauseDuration:(double)a3
{
  self->_defaultPauseDuration = a3;
}

- (double)fastEditingPauseDuration
{
  return self->_fastEditingPauseDuration;
}

- (void)setFastEditingPauseDuration:(double)a3
{
  self->_fastEditingPauseDuration = a3;
}

- (double)defaultSpringDampingRatio
{
  return self->_defaultSpringDampingRatio;
}

- (void)setDefaultSpringDampingRatio:(double)a3
{
  self->_defaultSpringDampingRatio = a3;
}

- (double)defaultSpringDuration
{
  return self->_defaultSpringDuration;
}

- (void)setDefaultSpringDuration:(double)a3
{
  self->_defaultSpringDuration = a3;
}

- (double)clusterFastestDuration
{
  return self->_clusterFastestDuration;
}

- (void)setClusterFastestDuration:(double)a3
{
  self->_clusterFastestDuration = a3;
}

- (double)clusterSlowestDuration
{
  return self->_clusterSlowestDuration;
}

- (void)setClusterSlowestDuration:(double)a3
{
  self->_clusterSlowestDuration = a3;
}

- (double)clusterMiddleFastDuration
{
  return self->_clusterMiddleFastDuration;
}

- (void)setClusterMiddleFastDuration:(double)a3
{
  self->_clusterMiddleFastDuration = a3;
}

- (double)clusterMiddleSlowDuration
{
  return self->_clusterMiddleSlowDuration;
}

- (void)setClusterMiddleSlowDuration:(double)a3
{
  self->_clusterMiddleSlowDuration = a3;
}

- (void)setOverrideAnimationType:(int64_t)a3
{
  self->_overrideAnimationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetHomeScreenLayoutOutlet, 0);
}

@end
