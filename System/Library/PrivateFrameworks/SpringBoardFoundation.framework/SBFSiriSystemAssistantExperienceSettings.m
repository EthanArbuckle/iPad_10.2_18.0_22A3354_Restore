@implementation SBFSiriSystemAssistantExperienceSettings

- (void)setDefaultValues
{
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBFSiriSystemAssistantExperienceSettings;
  -[PTSettings setDefaultValues](&v16, sel_setDefaultValues);
  -[SBFSiriSystemAssistantExperienceSettings setTypeToSiriDimmingAlpha:](self, "setTypeToSiriDimmingAlpha:", 0.5);
  -[SBFSiriSystemAssistantExperienceSettings typeToSiriDimmingAnimationSettings](self, "typeToSiriDimmingAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBFSiriSystemAssistantExperienceSettings setTypeToSiriPushInScale:](self, "setTypeToSiriPushInScale:", 0.86);
  -[SBFSiriSystemAssistantExperienceSettings typeToSiriPushInAnimationSettings](self, "typeToSiriPushInAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValues");

  -[SBFSiriSystemAssistantExperienceSettings typeToSiriPushInAnimationSettings](self, "typeToSiriPushInAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDampingRatio:", 0.76);

  -[SBFSiriSystemAssistantExperienceSettings typeToSiriPushInAnimationSettings](self, "typeToSiriPushInAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", 0.55);

  -[SBFSiriSystemAssistantExperienceSettings setHomeAffordanceGlowInnerLightRadius:](self, "setHomeAffordanceGlowInnerLightRadius:", 3.0);
  -[SBFSiriSystemAssistantExperienceSettings setHomeAffordanceGlowOuterLightRadius:](self, "setHomeAffordanceGlowOuterLightRadius:", 8.0);
  -[SBFSiriSystemAssistantExperienceSettings setHomeAffordanceGlowHighlightThickness:](self, "setHomeAffordanceGlowHighlightThickness:", 1.0);
  -[SBFSiriSystemAssistantExperienceSettings setHomeAffordanceGlowHighlightRadius:](self, "setHomeAffordanceGlowHighlightRadius:", 2.0);
  -[SBFSiriSystemAssistantExperienceSettings setHomeAffordanceGlowReverseAnimationDelay:](self, "setHomeAffordanceGlowReverseAnimationDelay:", 0.5625);
  -[SBFSiriSystemAssistantExperienceSettings homeAffordanceGlowAnimationSettings](self, "homeAffordanceGlowAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultValues");

  -[SBFSiriSystemAssistantExperienceSettings homeAffordanceGlowAnimationSettings](self, "homeAffordanceGlowAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDampingRatio:", 1.0);

  -[SBFSiriSystemAssistantExperienceSettings homeAffordanceGlowAnimationSettings](self, "homeAffordanceGlowAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResponse:", 3.0);

  -[SBFSiriSystemAssistantExperienceSettings setHomeAffordancePulseXScale:](self, "setHomeAffordancePulseXScale:", 0.943);
  -[SBFSiriSystemAssistantExperienceSettings setHomeAffordancePulseYScale:](self, "setHomeAffordancePulseYScale:", 1.0);
  -[SBFSiriSystemAssistantExperienceSettings setHomeAffordancePulseReverseAnimationDelay:](self, "setHomeAffordancePulseReverseAnimationDelay:", 0.125);
  -[SBFSiriSystemAssistantExperienceSettings homeAffordancePulseAnimationSettings](self, "homeAffordancePulseAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValues");

  -[SBFSiriSystemAssistantExperienceSettings homeAffordancePulseAnimationSettings](self, "homeAffordancePulseAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDampingRatio:", 0.3);

  -[SBFSiriSystemAssistantExperienceSettings homeAffordancePulseAnimationSettings](self, "homeAffordancePulseAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setResponse:", 0.4);

  -[SBFSiriSystemAssistantExperienceSettings homeAffordanceHintCancellationAnimationSettings](self, "homeAffordanceHintCancellationAnimationSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDefaultValues");

  -[SBFSiriSystemAssistantExperienceSettings homeAffordanceHintCancellationAnimationSettings](self, "homeAffordanceHintCancellationAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDampingRatio:", 1.0);

  -[SBFSiriSystemAssistantExperienceSettings homeAffordanceHintCancellationAnimationSettings](self, "homeAffordanceHintCancellationAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setResponse:", 0.5);

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
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
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
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[7];
  _QWORD v85[11];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[8];

  v88[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  v53 = (id)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Dimming Alpha"), CFSTR("typeToSiriDimmingAlpha"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "between:and:", 0.0, 1.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "precision:", 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v79;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("typeToSiriDimmingAlpha"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "minValue:maxValue:", 0.0, 1.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v77;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Animation Settings"), CFSTR("typeToSiriDimmingAnimationSettings"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v75, CFSTR("Type to Siri Dimming"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v74;
  v3 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Scale (iPhone)"), CFSTR("typeToSiriPushInScale"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "between:and:", 0.0, 1.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "precision:", 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v71;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("typeToSiriPushInScale"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "minValue:maxValue:", 0.0, 1.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v69;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Animation Settings"), CFSTR("typeToSiriPushInAnimationSettings"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v67, CFSTR("Type-to-Siri Push-In"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v66;
  v4 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Inner Light Radius"), CFSTR("homeAffordanceGlowInnerLightRadius"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "between:and:", 0.0, 10.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "precision:", 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v63;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("homeAffordanceGlowInnerLightRadius"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "minValue:maxValue:", 0.0, 1.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v61;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Outer Light Radius"), CFSTR("homeAffordanceGlowOuterLightRadius"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "between:and:", 0.0, 10.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "precision:", 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v58;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("homeAffordanceGlowOuterLightRadius"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "minValue:maxValue:", 0.0, 10.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v56;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Highlight Thickness"), CFSTR("homeAffordanceGlowHighlightThickness"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "between:and:", 0.0, 10.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "precision:", 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v51;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("homeAffordanceGlowHighlightThickness"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "minValue:maxValue:", 0.0, 10.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v49;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Highlight Thickness"), CFSTR("homeAffordanceGlowHighlightRadius"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "between:and:", 0.0, 10.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "precision:", 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v46;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("homeAffordanceGlowHighlightRadius"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "minValue:maxValue:", 0.0, 10.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v85[7] = v44;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Reverse Animation Delay"), CFSTR("homeAffordanceGlowReverseAnimationDelay"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "between:and:", 0.0, 1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "precision:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v85[8] = v41;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("homeAffordanceGlowReverseAnimationDelay"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "minValue:maxValue:", 0.0, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v85[9] = v39;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Animation Settings"), CFSTR("homeAffordanceGlowAnimationSettings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v85[10] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v37, CFSTR("Home Affordance Hint Glow"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v36;
  v5 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("X Scale"), CFSTR("homeAffordancePulseXScale"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "between:and:", 0.0, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "precision:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v33;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("homeAffordancePulseXScale"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "minValue:maxValue:", 0.0, 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v31;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Y Scale"), CFSTR("homeAffordancePulseYScale"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 0.0, 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "precision:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v28;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("homeAffordancePulseYScale"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minValue:maxValue:", 0.0, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v26;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Reverse Animation Delay"), CFSTR("homeAffordancePulseReverseAnimationDelay"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "precision:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v23;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", &stru_1E2010FC0, CFSTR("homeAffordancePulseReverseAnimationDelay"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minValue:maxValue:", 0.0, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v21;
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Animation Settings"), CFSTR("homeAffordancePulseAnimationSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v84[6] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v6, CFSTR("Home Affordance Hint Pulse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v7;
  v8 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Animation Settings"), CFSTR("homeAffordanceHintCancellationAnimationSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v10, CFSTR("Home Affordance Hint Cancellation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v11;
  v12 = (void *)MEMORY[0x1E0D83070];
  v13 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Restore Defaults"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v88[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "moduleWithTitle:contents:", 0, v18);
  v54 = (id)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (double)typeToSiriDimmingAlpha
{
  return self->_typeToSiriDimmingAlpha;
}

- (void)setTypeToSiriDimmingAlpha:(double)a3
{
  self->_typeToSiriDimmingAlpha = a3;
}

- (SBFFluidBehaviorSettings)typeToSiriDimmingAnimationSettings
{
  return self->_typeToSiriDimmingAnimationSettings;
}

- (void)setTypeToSiriDimmingAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_typeToSiriDimmingAnimationSettings, a3);
}

- (double)typeToSiriPushInScale
{
  return self->_typeToSiriPushInScale;
}

- (void)setTypeToSiriPushInScale:(double)a3
{
  self->_typeToSiriPushInScale = a3;
}

- (SBFFluidBehaviorSettings)typeToSiriPushInAnimationSettings
{
  return self->_typeToSiriPushInAnimationSettings;
}

- (void)setTypeToSiriPushInAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_typeToSiriPushInAnimationSettings, a3);
}

- (double)homeAffordanceGlowInnerLightRadius
{
  return self->_homeAffordanceGlowInnerLightRadius;
}

- (void)setHomeAffordanceGlowInnerLightRadius:(double)a3
{
  self->_homeAffordanceGlowInnerLightRadius = a3;
}

- (double)homeAffordanceGlowOuterLightRadius
{
  return self->_homeAffordanceGlowOuterLightRadius;
}

- (void)setHomeAffordanceGlowOuterLightRadius:(double)a3
{
  self->_homeAffordanceGlowOuterLightRadius = a3;
}

- (double)homeAffordanceGlowHighlightThickness
{
  return self->_homeAffordanceGlowHighlightThickness;
}

- (void)setHomeAffordanceGlowHighlightThickness:(double)a3
{
  self->_homeAffordanceGlowHighlightThickness = a3;
}

- (double)homeAffordanceGlowHighlightRadius
{
  return self->_homeAffordanceGlowHighlightRadius;
}

- (void)setHomeAffordanceGlowHighlightRadius:(double)a3
{
  self->_homeAffordanceGlowHighlightRadius = a3;
}

- (double)homeAffordanceGlowReverseAnimationDelay
{
  return self->_homeAffordanceGlowReverseAnimationDelay;
}

- (void)setHomeAffordanceGlowReverseAnimationDelay:(double)a3
{
  self->_homeAffordanceGlowReverseAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)homeAffordanceGlowAnimationSettings
{
  return self->_homeAffordanceGlowAnimationSettings;
}

- (void)setHomeAffordanceGlowAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceGlowAnimationSettings, a3);
}

- (double)homeAffordancePulseXScale
{
  return self->_homeAffordancePulseXScale;
}

- (void)setHomeAffordancePulseXScale:(double)a3
{
  self->_homeAffordancePulseXScale = a3;
}

- (double)homeAffordancePulseYScale
{
  return self->_homeAffordancePulseYScale;
}

- (void)setHomeAffordancePulseYScale:(double)a3
{
  self->_homeAffordancePulseYScale = a3;
}

- (double)homeAffordancePulseReverseAnimationDelay
{
  return self->_homeAffordancePulseReverseAnimationDelay;
}

- (void)setHomeAffordancePulseReverseAnimationDelay:(double)a3
{
  self->_homeAffordancePulseReverseAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)homeAffordancePulseAnimationSettings
{
  return self->_homeAffordancePulseAnimationSettings;
}

- (void)setHomeAffordancePulseAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordancePulseAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)homeAffordanceHintCancellationAnimationSettings
{
  return self->_homeAffordanceHintCancellationAnimationSettings;
}

- (void)setHomeAffordanceHintCancellationAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceHintCancellationAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceHintCancellationAnimationSettings, 0);
  objc_storeStrong((id *)&self->_homeAffordancePulseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_homeAffordanceGlowAnimationSettings, 0);
  objc_storeStrong((id *)&self->_typeToSiriPushInAnimationSettings, 0);
  objc_storeStrong((id *)&self->_typeToSiriDimmingAnimationSettings, 0);
}

@end
