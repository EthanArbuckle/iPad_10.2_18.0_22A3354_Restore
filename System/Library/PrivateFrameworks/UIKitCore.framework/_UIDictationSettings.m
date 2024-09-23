@implementation _UIDictationSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDictationSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[_UIDictationSettings setMinimumRadius:](self, "setMinimumRadius:", 0.5);
  -[_UIDictationSettings setTrailingGlowBlurRadius:](self, "setTrailingGlowBlurRadius:", 10.0);
  -[_UIDictationSettings setLightModeCompositingFiler:](self, "setLightModeCompositingFiler:", *MEMORY[0x1E0CD2E98]);
  -[_UIDictationSettings setDarkModeCompositingFiler:](self, "setDarkModeCompositingFiler:", *MEMORY[0x1E0CD2EA0]);
  -[_UIDictationSettings setTrailingGlowDuration:](self, "setTrailingGlowDuration:", 1.4);
  -[_UIDictationSettings setTailHeight:](self, "setTailHeight:", 0.0);
  -[_UIDictationSettings setHeadHeight:](self, "setHeadHeight:", 1.0);
  -[_UIDictationSettings setTrailingGlowAlpha:](self, "setTrailingGlowAlpha:", 0.32);
  -[_UIDictationSettings setRevealFadeTime:](self, "setRevealFadeTime:", 0.14);
  -[_UIDictationSettings setTypewriterEffectFramesPerSecond:](self, "setTypewriterEffectFramesPerSecond:", 24.0);
  -[_UIDictationSettings setTypewriterEffectStreamingCharacterInsertionRate:](self, "setTypewriterEffectStreamingCharacterInsertionRate:", 70.0);
  -[_UIDictationSettings setTypewriterEffectMinDurationBetweenHypotheses:](self, "setTypewriterEffectMinDurationBetweenHypotheses:", 0.3);
  -[_UIDictationSettings setGlowEffectEnabled:](self, "setGlowEffectEnabled:", 1);
  -[_UIDictationSettings setPulseAnimationEnabled:](self, "setPulseAnimationEnabled:", 1);
  -[_UIDictationSettings setTrailAnimationEnabled:](self, "setTrailAnimationEnabled:", 1);
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDictationSettings setPulseFrameRate:](self, "setPulseFrameRate:", (double)objc_msgSend(v3, "maximumFramesPerSecond"));

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDictationSettings setTrailFrameRate:](self, "setTrailFrameRate:", (double)objc_msgSend(v4, "maximumFramesPerSecond"));

  -[_UIDictationSettings setSoundReactiveCursorEnabled:](self, "setSoundReactiveCursorEnabled:", 1);
  -[_UIDictationSettings setAudioPollingRate:](self, "setAudioPollingRate:", 60.0);
  -[_UIDictationSettings setAudioWidthMaxBump:](self, "setAudioWidthMaxBump:", 2.0);
  -[_UIDictationSettings setAudioScaleAnimationDampingRatio:](self, "setAudioScaleAnimationDampingRatio:", 1.0);
  -[_UIDictationSettings setAudioScaleAnimationResponse:](self, "setAudioScaleAnimationResponse:", 0.2);
  -[_UIDictationSettings setCommandHapticFeedbackEnabled:](self, "setCommandHapticFeedbackEnabled:", 1);
  -[_UIDictationSettings setImpactStyle:](self, "setImpactStyle:", 3);
  -[_UIDictationSettings setImpactIntensity:](self, "setImpactIntensity:", 0.8);
  -[_UIDictationSettings setPulseDuration:](self, "setPulseDuration:", 0.9);
  -[_UIDictationSettings setCursorGlowBorderPadding:](self, "setCursorGlowBorderPadding:", 0.0);
  -[_UIDictationSettings setPulseHeightMaxBump:](self, "setPulseHeightMaxBump:", 2.0);
  -[_UIDictationSettings setAudioHeightMaxBump:](self, "setAudioHeightMaxBump:", 7.0);
  -[_UIDictationSettings setPulseWidthMaxBump:](self, "setPulseWidthMaxBump:", 1.5);
  -[_UIDictationSettings setCursorGlowAlphaMax:](self, "setCursorGlowAlphaMax:", 0.6);
  -[_UIDictationSettings setCursorGlowAlphaMin:](self, "setCursorGlowAlphaMin:", 0.24);
  -[_UIDictationSettings setCursorGlowBlurRadius:](self, "setCursorGlowBlurRadius:", 6.0);
  -[_UIDictationSettings setVoiceCommandsInIWorkEnabled:](self, "setVoiceCommandsInIWorkEnabled:", 0);
}

- (void)setTypewriterEffectStreamingCharacterInsertionRate:(double)a3
{
  self->_typewriterEffectStreamingCharacterInsertionRate = a3;
}

- (void)setTypewriterEffectMinDurationBetweenHypotheses:(double)a3
{
  self->_typewriterEffectMinDurationBetweenHypotheses = a3;
}

- (void)setTypewriterEffectFramesPerSecond:(double)a3
{
  self->_typewriterEffectFramesPerSecond = a3;
}

- (void)setTrailingGlowDuration:(double)a3
{
  self->_trailingGlowDuration = a3;
}

- (void)setTrailingGlowBlurRadius:(double)a3
{
  self->_trailingGlowBlurRadius = a3;
}

- (void)setTrailingGlowAlpha:(double)a3
{
  self->_trailingGlowAlpha = a3;
}

- (void)setTrailFrameRate:(double)a3
{
  self->_trailFrameRate = a3;
}

- (void)setTrailAnimationEnabled:(BOOL)a3
{
  self->_trailAnimationEnabled = a3;
}

- (void)setTailHeight:(double)a3
{
  self->_tailHeight = a3;
}

- (void)setRevealFadeTime:(double)a3
{
  self->_revealFadeTime = a3;
}

- (void)setPulseFrameRate:(double)a3
{
  self->_pulseFrameRate = a3;
}

- (void)setPulseAnimationEnabled:(BOOL)a3
{
  self->_pulseAnimationEnabled = a3;
}

- (void)setMinimumRadius:(double)a3
{
  self->_minimumRadius = a3;
}

- (void)setLightModeCompositingFiler:(id)a3
{
  objc_storeStrong((id *)&self->_lightModeCompositingFiler, a3);
}

- (void)setHeadHeight:(double)a3
{
  self->_headHeight = a3;
}

- (void)setGlowEffectEnabled:(BOOL)a3
{
  self->_glowEffectEnabled = a3;
}

- (void)setDarkModeCompositingFiler:(id)a3
{
  objc_storeStrong((id *)&self->_darkModeCompositingFiler, a3);
}

- (void)setCursorGlowBlurRadius:(double)a3
{
  self->_cursorGlowBlurRadius = a3;
}

- (void)setCursorGlowAlphaMin:(double)a3
{
  self->_cursorGlowAlphaMin = a3;
}

- (void)setCursorGlowAlphaMax:(double)a3
{
  self->_cursorGlowAlphaMax = a3;
}

- (NSString)darkModeCompositingFiler
{
  return self->_darkModeCompositingFiler;
}

- (double)trailingGlowBlurRadius
{
  return self->_trailingGlowBlurRadius;
}

- (double)trailingGlowAlpha
{
  return self->_trailingGlowAlpha;
}

- (double)minimumRadius
{
  return self->_minimumRadius;
}

- (NSString)lightModeCompositingFiler
{
  return self->_lightModeCompositingFiler;
}

- (BOOL)glowEffectEnabled
{
  return self->_glowEffectEnabled;
}

+ (id)settingsControllerModule
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
  id v51;
  id v52;
  void *v53;
  void *v54;
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
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  _QWORD v113[5];
  _QWORD v114[3];
  _QWORD v115[12];
  _QWORD v116[14];
  _QWORD v117[7];

  v117[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83078];
  v51 = (id)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Sound Reactive Cursor"), CFSTR("soundReactiveCursorEnabled"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v111;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Audio Polling Rate"), CFSTR("audioPollingRate"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frameRates");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frameRatesTitles");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "possibleValues:titles:", v109, v108);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v107;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Audio Width Bump"), CFSTR("audioWidthMaxBump"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "between:and:", 0.0, 10.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "precision:", 3);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v104;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Audio Height Bump"), CFSTR("audioHeightMaxBump"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "between:and:", 0.0, 10.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "precision:", 3);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v116[3] = v101;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Width Bump"), CFSTR("pulseWidthMaxBump"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "between:and:", 0.0, 10.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "precision:", 3);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v116[4] = v98;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Height Bump"), CFSTR("pulseHeightMaxBump"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "between:and:", 0.0, 10.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "precision:", 3);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v116[5] = v95;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Duration"), CFSTR("pulseDuration"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "between:and:", 0.0, 10.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "precision:", 3);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v116[6] = v92;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), CFSTR("audioScaleAnimationDampingRatio"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "between:and:", 0.0, 1.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "precision:", 3);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v116[7] = v89;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("audioScaleAnimationResponse"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "between:and:", 0.0, 10.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "precision:", 3);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v116[8] = v86;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Command Haptic Fedeback"), CFSTR("commandHapticFeedbackEnabled"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v116[9] = v85;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Impact Style"), CFSTR("impactStyle"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "impactStyles");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "impactStylesTitles");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "possibleValues:titles:", v83, v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v116[10] = v81;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Impact Intensity"), CFSTR("impactIntensity"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "between:and:", 0.0, 1.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "precision:", 3);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v116[11] = v78;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("iWork Command UI"), CFSTR("voiceCommandsInIWorkEnabled"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v116[12] = v77;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("cursorGlowBorderPadding"), CFSTR("cursorGlowBorderPadding"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "between:and:", 0.0, 20.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "precision:", 3);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v116[13] = v74;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 14);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v73, CFSTR("Crystal Dictation UI"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v72;
  v4 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Glow Radius"), CFSTR("minimumRadius"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "between:and:", 0.0, 30.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "precision:", 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v69;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Cursor Glow Blur Radius"), CFSTR("cursorGlowBlurRadius"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "between:and:", 0.0, 30.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "precision:", 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v66;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing Glow Blur Radius"), CFSTR("trailingGlowBlurRadius"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "between:and:", 0.0, 30.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "precision:", 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v63;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("lightMode compositingFiler"), CFSTR("lightModeCompositingFiler"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "compositingFilters");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "compositingFilters");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "possibleValues:titles:", v61, v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v59;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("darkMode compositingFiler"), CFSTR("darkModeCompositingFiler"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "compositingFilters");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "compositingFilters");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "possibleValues:titles:", v57, v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v115[4] = v55;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Trailing Glow Duration"), CFSTR("trailingGlowDuration"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "minValue:maxValue:", 0.01, 2.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v115[5] = v53;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Tail Height"), CFSTR("tailHeight"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "minValue:maxValue:", 0.0, 1.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v115[6] = v49;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Head Height"), CFSTR("headHeight"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minValue:maxValue:", 0.0, 1.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v115[7] = v47;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("cursorGAlphaMin"), CFSTR("cursorGlowAlphaMin"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "minValue:maxValue:", 0.0, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v115[8] = v45;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("cursorGAlphaMax"), CFSTR("cursorGlowAlphaMax"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "minValue:maxValue:", 0.0, 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v115[9] = v43;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("trailingGAlpha"), CFSTR("trailingGlowAlpha"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "minValue:maxValue:", 0.0, 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v115[10] = v41;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("revealFadeTime"), CFSTR("revealFadeTime"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "minValue:maxValue:", 0.0, 2.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v115[11] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 12);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v38, CFSTR("Dawn Dictation UI"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v37;
  v5 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("framesPerSecond"), CFSTR("typewriterEffectFramesPerSecond"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "minValue:maxValue:", 0.0, (double)objc_msgSend(v36, "maximumFramesPerSecond"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v34;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("charInsertionRate"), CFSTR("typewriterEffectStreamingCharacterInsertionRate"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 0.0, 100.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v32;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("minDuration"), CFSTR("typewriterEffectMinDurationBetweenHypotheses"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "minValue:maxValue:", 0.0, 0.4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v114[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v29, CFSTR("Typewriter animation"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v28;
  v6 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Glow Effect"), CFSTR("glowEffectEnabled"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v27;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Animation"), CFSTR("pulseAnimationEnabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v26;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Trail Animation"), CFSTR("trailAnimationEnabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v25;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("PulseFrameRate"), CFSTR("pulseFrameRate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frameRates");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frameRatesTitles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "possibleValues:titles:", v23, v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v21;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("TrailFrameRate"), CFSTR("trailFrameRate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frameRates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frameRatesTitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "possibleValues:titles:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v10, CFSTR("Power Evaluation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v117[3] = v11;
  v12 = (void *)MEMORY[0x1E0D83078];
  v13 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Restore Defaults"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v117[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "moduleWithTitle:contents:", 0, v18);
  v52 = (id)objc_claimAutoreleasedReturnValue();

  return v52;
}

+ (id)frameRates
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumFramesPerSecond");

  if (v3 < 61)
    return &unk_1E1A94070;
  v9[0] = &unk_1E1A98A78;
  v9[1] = &unk_1E1A98A90;
  v9[2] = &unk_1E1A98AA8;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "maximumFramesPerSecond"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)frameRatesTitles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "frameRates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "stringValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)impactStyles
{
  return &unk_1E1A94088;
}

+ (id)impactStylesTitles
{
  return &unk_1E1A940A0;
}

+ (id)compositingFilters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[45];

  v25[44] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD2BA0];
  v25[0] = *MEMORY[0x1E0CD2ED8];
  v25[1] = v2;
  v3 = *MEMORY[0x1E0CD2EC8];
  v25[2] = *MEMORY[0x1E0CD2C18];
  v25[3] = v3;
  v4 = *MEMORY[0x1E0CD2EC0];
  v25[4] = *MEMORY[0x1E0CD2ED0];
  v25[5] = v4;
  v5 = *MEMORY[0x1E0CD2C58];
  v25[6] = *MEMORY[0x1E0CD2C38];
  v25[7] = v5;
  v6 = *MEMORY[0x1E0CD2C50];
  v25[8] = *MEMORY[0x1E0CD2C48];
  v25[9] = v6;
  v7 = *MEMORY[0x1E0CD2F28];
  v25[10] = *MEMORY[0x1E0CD2C40];
  v25[11] = v7;
  v8 = *MEMORY[0x1E0CD2E98];
  v25[12] = *MEMORY[0x1E0CD2EA0];
  v25[13] = v8;
  v9 = *MEMORY[0x1E0CD2EE8];
  v25[14] = *MEMORY[0x1E0CD2EF0];
  v25[15] = v9;
  v10 = *MEMORY[0x1E0CD2E48];
  v25[16] = *MEMORY[0x1E0CD2E50];
  v25[17] = v10;
  v11 = *MEMORY[0x1E0CD2E70];
  v25[18] = *MEMORY[0x1E0CD2E38];
  v25[19] = v11;
  v12 = *MEMORY[0x1E0CD2EB0];
  v25[20] = *MEMORY[0x1E0CD2E58];
  v25[21] = v12;
  v13 = *MEMORY[0x1E0CD2C28];
  v25[22] = *MEMORY[0x1E0CD2E80];
  v25[23] = v13;
  v14 = *MEMORY[0x1E0CD2BD0];
  v25[24] = *MEMORY[0x1E0CD2DD8];
  v25[25] = v14;
  v15 = *MEMORY[0x1E0CD2EB8];
  v25[26] = *MEMORY[0x1E0CD2BC0];
  v25[27] = v15;
  v16 = *MEMORY[0x1E0CD2C60];
  v25[28] = *MEMORY[0x1E0CD2C90];
  v25[29] = v16;
  v17 = *MEMORY[0x1E0CD2EE0];
  v25[30] = *MEMORY[0x1E0CD2C80];
  v25[31] = v17;
  v18 = *MEMORY[0x1E0CD2DF8];
  v25[32] = *MEMORY[0x1E0CD2C68];
  v25[33] = v18;
  v19 = *MEMORY[0x1E0CD2E08];
  v25[34] = *MEMORY[0x1E0CD2E00];
  v25[35] = v19;
  v20 = *MEMORY[0x1E0CD2C30];
  v25[36] = *MEMORY[0x1E0CD2E90];
  v25[37] = v20;
  v21 = *MEMORY[0x1E0CD2C98];
  v25[38] = *MEMORY[0x1E0CD2DE0];
  v25[39] = v21;
  v22 = *MEMORY[0x1E0CD2BB0];
  v25[40] = *MEMORY[0x1E0CD2EA8];
  v25[41] = v22;
  v23 = *MEMORY[0x1E0CD2F10];
  v25[42] = *MEMORY[0x1E0CD2E28];
  v25[43] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 44);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)cursorGlowBlurRadius
{
  return self->_cursorGlowBlurRadius;
}

- (double)trailingGlowDuration
{
  return self->_trailingGlowDuration;
}

- (double)tailHeight
{
  return self->_tailHeight;
}

- (double)headHeight
{
  return self->_headHeight;
}

- (double)cursorGlowAlphaMin
{
  return self->_cursorGlowAlphaMin;
}

- (double)cursorGlowAlphaMax
{
  return self->_cursorGlowAlphaMax;
}

- (double)revealFadeTime
{
  return self->_revealFadeTime;
}

- (double)typewriterEffectFramesPerSecond
{
  return self->_typewriterEffectFramesPerSecond;
}

- (double)typewriterEffectStreamingCharacterInsertionRate
{
  return self->_typewriterEffectStreamingCharacterInsertionRate;
}

- (double)typewriterEffectMinDurationBetweenHypotheses
{
  return self->_typewriterEffectMinDurationBetweenHypotheses;
}

- (BOOL)pulseAnimationEnabled
{
  return self->_pulseAnimationEnabled;
}

- (BOOL)trailAnimationEnabled
{
  return self->_trailAnimationEnabled;
}

- (double)pulseFrameRate
{
  return self->_pulseFrameRate;
}

- (double)trailFrameRate
{
  return self->_trailFrameRate;
}

- (BOOL)soundReactiveCursorEnabled
{
  return self->_soundReactiveCursorEnabled;
}

- (void)setSoundReactiveCursorEnabled:(BOOL)a3
{
  self->_soundReactiveCursorEnabled = a3;
}

- (double)audioPollingRate
{
  return self->_audioPollingRate;
}

- (void)setAudioPollingRate:(double)a3
{
  self->_audioPollingRate = a3;
}

- (double)audioWidthMaxBump
{
  return self->_audioWidthMaxBump;
}

- (void)setAudioWidthMaxBump:(double)a3
{
  self->_audioWidthMaxBump = a3;
}

- (double)audioHeightMaxBump
{
  return self->_audioHeightMaxBump;
}

- (void)setAudioHeightMaxBump:(double)a3
{
  self->_audioHeightMaxBump = a3;
}

- (double)audioScaleAnimationDampingRatio
{
  return self->_audioScaleAnimationDampingRatio;
}

- (void)setAudioScaleAnimationDampingRatio:(double)a3
{
  self->_audioScaleAnimationDampingRatio = a3;
}

- (double)audioScaleAnimationResponse
{
  return self->_audioScaleAnimationResponse;
}

- (void)setAudioScaleAnimationResponse:(double)a3
{
  self->_audioScaleAnimationResponse = a3;
}

- (BOOL)commandHapticFeedbackEnabled
{
  return self->_commandHapticFeedbackEnabled;
}

- (void)setCommandHapticFeedbackEnabled:(BOOL)a3
{
  self->_commandHapticFeedbackEnabled = a3;
}

- (int64_t)impactStyle
{
  return self->_impactStyle;
}

- (void)setImpactStyle:(int64_t)a3
{
  self->_impactStyle = a3;
}

- (double)impactIntensity
{
  return self->_impactIntensity;
}

- (void)setImpactIntensity:(double)a3
{
  self->_impactIntensity = a3;
}

- (double)pulseWidthMaxBump
{
  return self->_pulseWidthMaxBump;
}

- (void)setPulseWidthMaxBump:(double)a3
{
  self->_pulseWidthMaxBump = a3;
}

- (double)pulseHeightMaxBump
{
  return self->_pulseHeightMaxBump;
}

- (void)setPulseHeightMaxBump:(double)a3
{
  self->_pulseHeightMaxBump = a3;
}

- (double)pulseDuration
{
  return self->_pulseDuration;
}

- (void)setPulseDuration:(double)a3
{
  self->_pulseDuration = a3;
}

- (BOOL)voiceCommandsInIWorkEnabled
{
  return self->_voiceCommandsInIWorkEnabled;
}

- (void)setVoiceCommandsInIWorkEnabled:(BOOL)a3
{
  self->_voiceCommandsInIWorkEnabled = a3;
}

- (double)cursorGlowBorderPadding
{
  return self->_cursorGlowBorderPadding;
}

- (void)setCursorGlowBorderPadding:(double)a3
{
  self->_cursorGlowBorderPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeCompositingFiler, 0);
  objc_storeStrong((id *)&self->_lightModeCompositingFiler, 0);
}

@end
