@implementation SBSystemActionCoachingSettings

- (void)setDefaultValues
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSystemActionCoachingSettings;
  -[PTSettings setDefaultValues](&v11, sel_setDefaultValues);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemActionCoachingSettings setPolicyClassName:](self, "setPolicyClassName:", v4);

  -[SBSystemActionCoachingSettings trackPreviewsPolicySettings](self, "trackPreviewsPolicySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultValues");

  -[SBSystemActionCoachingSettings pressWithinTimeIntervalPolicySettings](self, "pressWithinTimeIntervalPolicySettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");

  -[SBSystemActionCoachingSettings setDimmingAlpha:](self, "setDimmingAlpha:", 0.35);
  -[SBSystemActionCoachingSettings setCoachingButtonShadowOpacity:](self, "setCoachingButtonShadowOpacity:", 0.25);
  -[SBSystemActionCoachingSettings setCoachingButtonShadowRadius:](self, "setCoachingButtonShadowRadius:", 15.0);
  -[SBSystemActionCoachingSettings setCoachingLabelShadowOpacity:](self, "setCoachingLabelShadowOpacity:", 0.25);
  -[SBSystemActionCoachingSettings setCoachingLabelShadowRadius:](self, "setCoachingLabelShadowRadius:", 6.0);
  -[SBSystemActionCoachingSettings presentationSettings](self, "presentationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultValues");
  objc_msgSend(v7, "setDampingRatio:", 1.0);
  objc_msgSend(v7, "setDampingRatioSmoothing:", 0.0);
  objc_msgSend(v7, "setResponse:", 0.5);
  objc_msgSend(v7, "setResponseSmoothing:", 0.0);
  -[SBSystemActionCoachingSettings expansionSettings](self, "expansionSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultValues");
  objc_msgSend(v8, "setDampingRatio:", 1.0);
  objc_msgSend(v8, "setDampingRatioSmoothing:", 0.0);
  objc_msgSend(v8, "setResponse:", 0.8);
  objc_msgSend(v8, "setResponseSmoothing:", 0.0);
  -[SBSystemActionCoachingSettings contractionSettings](self, "contractionSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultValues");
  objc_msgSend(v9, "setDampingRatio:", 1.0);
  objc_msgSend(v9, "setDampingRatioSmoothing:", 0.0);
  objc_msgSend(v9, "setResponse:", 0.5);
  objc_msgSend(v9, "setResponseSmoothing:", 0.0);
  -[SBSystemActionCoachingSettings dismissalSettings](self, "dismissalSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValues");
  objc_msgSend(v10, "setDampingRatio:", 1.0);
  objc_msgSend(v10, "setDampingRatioSmoothing:", 0.0);
  objc_msgSend(v10, "setResponse:", 0.5);
  objc_msgSend(v10, "setResponseSmoothing:", 0.0);

}

+ (id)settingsControllerModule
{
  objc_class *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[6];
  void *v61;
  _QWORD v62[4];
  _QWORD v63[2];
  _QWORD v64[2];
  void *v65;
  _QWORD v66[3];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Presentation Policy"), CFSTR("policyClassName"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "possibleValues:titles:", v56, &unk_1E91CEE18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v6;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Settings"), CFSTR("trackPreviewsPolicySettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("policyClassName == %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "condition:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v12;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Settings"), CFSTR("pressWithinTimeIntervalPolicySettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3880];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateWithFormat:", CFSTR("policyClassName == %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "condition:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sectionWithRows:title:", v19, CFSTR("Policy"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Opacity"), CFSTR("dimmingAlpha"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 1.0, 5.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:title:", v23, CFSTR("Dimming"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Opacity"), CFSTR("coachingButtonShadowOpacity"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v26;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Radius"), CFSTR("coachingButtonShadowRadius"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "between:and:", 0.0, 20.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:title:", v29, CFSTR("Coaching Button"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Opacity"), CFSTR("coachingLabelShadowOpacity"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "between:and:", 0.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v32;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Shadow Radius"), CFSTR("coachingLabelShadowRadius"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "between:and:", 0.0, 20.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:title:", v35, CFSTR("Coaching Label"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Presentation"), CFSTR("presentationSettings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v38;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Expansion"), CFSTR("expansionSettings"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v39;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Contraction"), CFSTR("contractionSettings"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v40;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Dismissal"), CFSTR("dismissalSettings"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sectionWithRows:title:", v42, CFSTR("Animations"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0D83070];
  v45 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:action:", CFSTR("Restore Defaults"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sectionWithRows:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = (void *)MEMORY[0x1E0D83070];
  v60[0] = v59;
  v60[1] = v57;
  v60[2] = v55;
  v60[3] = v36;
  v60[4] = v43;
  v60[5] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "moduleWithTitle:contents:", CFSTR("Coaching"), v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (NSString)policyClassName
{
  return self->_policyClassName;
}

- (void)setPolicyClassName:(id)a3
{
  objc_storeStrong((id *)&self->_policyClassName, a3);
}

- (SBSystemActionTrackPreviewsCoachingPolicySettings)trackPreviewsPolicySettings
{
  return self->_trackPreviewsPolicySettings;
}

- (void)setTrackPreviewsPolicySettings:(id)a3
{
  objc_storeStrong((id *)&self->_trackPreviewsPolicySettings, a3);
}

- (SBSystemActionPressWithinTimeIntervalCoachingPolicySettings)pressWithinTimeIntervalPolicySettings
{
  return self->_pressWithinTimeIntervalPolicySettings;
}

- (void)setPressWithinTimeIntervalPolicySettings:(id)a3
{
  objc_storeStrong((id *)&self->_pressWithinTimeIntervalPolicySettings, a3);
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (void)setDimmingAlpha:(double)a3
{
  self->_dimmingAlpha = a3;
}

- (double)coachingButtonShadowOpacity
{
  return self->_coachingButtonShadowOpacity;
}

- (void)setCoachingButtonShadowOpacity:(double)a3
{
  self->_coachingButtonShadowOpacity = a3;
}

- (double)coachingButtonShadowRadius
{
  return self->_coachingButtonShadowRadius;
}

- (void)setCoachingButtonShadowRadius:(double)a3
{
  self->_coachingButtonShadowRadius = a3;
}

- (double)coachingLabelShadowOpacity
{
  return self->_coachingLabelShadowOpacity;
}

- (void)setCoachingLabelShadowOpacity:(double)a3
{
  self->_coachingLabelShadowOpacity = a3;
}

- (double)coachingLabelShadowRadius
{
  return self->_coachingLabelShadowRadius;
}

- (void)setCoachingLabelShadowRadius:(double)a3
{
  self->_coachingLabelShadowRadius = a3;
}

- (SBFFluidBehaviorSettings)presentationSettings
{
  return self->_presentationSettings;
}

- (void)setPresentationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSettings, a3);
}

- (SBFFluidBehaviorSettings)expansionSettings
{
  return self->_expansionSettings;
}

- (void)setExpansionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_expansionSettings, a3);
}

- (SBFFluidBehaviorSettings)contractionSettings
{
  return self->_contractionSettings;
}

- (void)setContractionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_contractionSettings, a3);
}

- (SBFFluidBehaviorSettings)dismissalSettings
{
  return self->_dismissalSettings;
}

- (void)setDismissalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalSettings, 0);
  objc_storeStrong((id *)&self->_contractionSettings, 0);
  objc_storeStrong((id *)&self->_expansionSettings, 0);
  objc_storeStrong((id *)&self->_presentationSettings, 0);
  objc_storeStrong((id *)&self->_pressWithinTimeIntervalPolicySettings, 0);
  objc_storeStrong((id *)&self->_trackPreviewsPolicySettings, 0);
  objc_storeStrong((id *)&self->_policyClassName, 0);
}

@end
