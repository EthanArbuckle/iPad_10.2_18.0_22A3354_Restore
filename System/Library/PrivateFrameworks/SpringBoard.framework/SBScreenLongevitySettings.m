@implementation SBScreenLongevitySettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBScreenLongevitySettings;
  -[PTSettings setDefaultValues](&v6, sel_setDefaultValues);
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenLongevityDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  self->_ignoreAutoLockSetToNever = 0;
  self->_overrideEnablement = 0;
  self->_enablement = 0;
  objc_msgSend(v4, "dimInterval");
  self->_dimInterval = v5;
  self->_waitInterval = 60.0;
  self->_minimalFaceDetectionInterval = 4.0;
  self->_undimFaceDetectionInterval = 2.0;
  self->_touchAttentionLostTimeout = 2.0;
  self->_dimmingAnimationLength = 2.0;
  self->_undimmingAnimationLength = 0.5;
  self->_attentionScoreThreshold = 0.0;
  self->_faceDetectionScoreThreshold = 50.0;
  self->_noisyLogging = 0;
  self->_noOpButLogOnEnablementUpdate = 0;

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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v58;
  _QWORD v59[6];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[5];
  _QWORD v64[3];
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v65[0] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Restore"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Ignore Auto Lock Set To Never"), CFSTR("ignoreAutoLockSetToNever"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Override Enablement"), CFSTR("overrideEnablement"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enablement"), CFSTR("enablement"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83070];
  v64[0] = v57;
  v64[1] = v56;
  v64[2] = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Enablement Overrides"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dim Duration"), CFSTR("dimInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 600.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "precision:", 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Wait Duration Before Face Detection Kicks In"), CFSTR("waitInterval"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 600.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Minimal Face Detection Time Interval"), CFSTR("minimalFaceDetectionInterval"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 60.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "precision:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Undim Face Detection Time Interval"), CFSTR("undimFaceDetectionInterval"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.0, 5.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "precision:", 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Touch Attention Lost Timeout"), CFSTR("touchAttentionLostTimeout"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 60.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "precision:", 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  v63[0] = v52;
  v63[1] = v51;
  v63[2] = v50;
  v63[3] = v49;
  v63[4] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sectionWithRows:title:", v19, CFSTR("Timer"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dimming Animation Length"), CFSTR("dimmingAnimationLength"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 60.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "precision:", 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Undimming Animation Length"), CFSTR("undimmingAnimationLength"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 60.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "precision:", 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83070];
  v62[0] = v46;
  v62[1] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:title:", v25, CFSTR("Core Brightness"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Face Detection Score Threshold"), CFSTR("faceDetectionScoreThreshold"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 100.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Attention Score Threshold"), CFSTR("attentionScoreThreshold"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 100.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "precision:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D83070];
  v61[0] = v42;
  v61[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:title:", v31, CFSTR("Face Detection Score"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Noisy Logging"), CFSTR("noisyLogging"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("No Op But Log When Enablement Update"), CFSTR("noOpButLogOnEnablementUpdate"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0D83070];
  v60[0] = v33;
  v60[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v36, CFSTR("Debug"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D83070];
  v59[0] = v54;
  v59[1] = v53;
  v59[2] = v47;
  v59[3] = v44;
  v59[4] = v32;
  v59[5] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "moduleWithTitle:contents:", CFSTR("Screen Longevity"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (BOOL)ignoreAutoLockSetToNever
{
  return self->_ignoreAutoLockSetToNever;
}

- (void)setIgnoreAutoLockSetToNever:(BOOL)a3
{
  self->_ignoreAutoLockSetToNever = a3;
}

- (BOOL)overrideEnablement
{
  return self->_overrideEnablement;
}

- (void)setOverrideEnablement:(BOOL)a3
{
  self->_overrideEnablement = a3;
}

- (BOOL)enablement
{
  return self->_enablement;
}

- (void)setEnablement:(BOOL)a3
{
  self->_enablement = a3;
}

- (double)dimInterval
{
  return self->_dimInterval;
}

- (void)setDimInterval:(double)a3
{
  self->_dimInterval = a3;
}

- (double)waitInterval
{
  return self->_waitInterval;
}

- (void)setWaitInterval:(double)a3
{
  self->_waitInterval = a3;
}

- (double)minimalFaceDetectionInterval
{
  return self->_minimalFaceDetectionInterval;
}

- (void)setMinimalFaceDetectionInterval:(double)a3
{
  self->_minimalFaceDetectionInterval = a3;
}

- (double)undimFaceDetectionInterval
{
  return self->_undimFaceDetectionInterval;
}

- (void)setUndimFaceDetectionInterval:(double)a3
{
  self->_undimFaceDetectionInterval = a3;
}

- (double)touchAttentionLostTimeout
{
  return self->_touchAttentionLostTimeout;
}

- (void)setTouchAttentionLostTimeout:(double)a3
{
  self->_touchAttentionLostTimeout = a3;
}

- (double)dimmingAnimationLength
{
  return self->_dimmingAnimationLength;
}

- (void)setDimmingAnimationLength:(double)a3
{
  self->_dimmingAnimationLength = a3;
}

- (double)undimmingAnimationLength
{
  return self->_undimmingAnimationLength;
}

- (void)setUndimmingAnimationLength:(double)a3
{
  self->_undimmingAnimationLength = a3;
}

- (double)attentionScoreThreshold
{
  return self->_attentionScoreThreshold;
}

- (void)setAttentionScoreThreshold:(double)a3
{
  self->_attentionScoreThreshold = a3;
}

- (double)faceDetectionScoreThreshold
{
  return self->_faceDetectionScoreThreshold;
}

- (void)setFaceDetectionScoreThreshold:(double)a3
{
  self->_faceDetectionScoreThreshold = a3;
}

- (BOOL)noisyLogging
{
  return self->_noisyLogging;
}

- (void)setNoisyLogging:(BOOL)a3
{
  self->_noisyLogging = a3;
}

- (BOOL)noOpButLogOnEnablementUpdate
{
  return self->_noOpButLogOnEnablementUpdate;
}

- (void)setNoOpButLogOnEnablementUpdate:(BOOL)a3
{
  self->_noOpButLogOnEnablementUpdate = a3;
}

@end
