@implementation PXKitSettings

+ (PXKitSettings)sharedInstance
{
  if (sharedInstance_onceToken_164350 != -1)
    dispatch_once(&sharedInstance_onceToken_164350, &__block_literal_global_164351);
  return (PXKitSettings *)(id)sharedInstance_sharedInstance_164352;
}

- (BOOL)useFancyDarkening
{
  return self->_useFancyDarkening;
}

- (BOOL)allowFontFallback
{
  return self->_allowFontFallback;
}

- (double)simulatedSafeAreaHorizontalInsets
{
  return self->_simulatedSafeAreaHorizontalInsets;
}

- (double)simulatedPeripheryExtraTopInset
{
  return self->_simulatedPeripheryExtraTopInset;
}

- (double)simulatedPeripheryExtraRightInset
{
  return self->_simulatedPeripheryExtraRightInset;
}

- (double)simulatedPeripheryExtraLeftInset
{
  return self->_simulatedPeripheryExtraLeftInset;
}

- (double)simulatedPeripheryExtraBottomInset
{
  return self->_simulatedPeripheryExtraBottomInset;
}

- (BOOL)simulateSlowTextTypesetting
{
  return self->_simulateSlowTextTypesetting;
}

- (BOOL)defaultUseShapeLayerForText
{
  return self->_defaultUseShapeLayerForText;
}

- (BOOL)drawTypographicGuidelines
{
  return self->_drawTypographicGuidelines;
}

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXKitSettings;
  -[PTSettings setDefaultValues](&v7, sel_setDefaultValues);
  -[PXKitSettings setDownGesturesAngularToleranceInDegrees:](self, "setDownGesturesAngularToleranceInDegrees:", 30.0);
  -[PXKitSettings setUpGesturesAngularToleranceInDegrees:](self, "setUpGesturesAngularToleranceInDegrees:", 30.0);
  -[PXKitSettings setHorizontalGesturesAngularToleranceInDegrees:](self, "setHorizontalGesturesAngularToleranceInDegrees:", 30.0);
  -[PXKitSettings setSmallestSignificantScrollVelocity:](self, "setSmallestSignificantScrollVelocity:", 100.0);
  -[PXKitSettings setHonorSilentMode:](self, "setHonorSilentMode:", 0);
  -[PXKitSettings setSimulateSilentMode:](self, "setSimulateSilentMode:", 0);
  -[PXKitSettings setDefaultAsyncTextRenderingEnabled:](self, "setDefaultAsyncTextRenderingEnabled:", 1);
  -[PXKitSettings setDefaultLabelTypesettingMode:](self, "setDefaultLabelTypesettingMode:", 2);
  -[PXKitSettings setDefaultUseShapeLayerForText:](self, "setDefaultUseShapeLayerForText:", 1);
  -[PXKitSettings setDefaultTextAutoscalingEnabled:](self, "setDefaultTextAutoscalingEnabled:", 1);
  -[PXKitSettings setDefaultTextMinimumScaleFactor:](self, "setDefaultTextMinimumScaleFactor:", 0.600000024);
  -[PXKitSettings setDefaultTextTruncationEnabled:](self, "setDefaultTextTruncationEnabled:", 1);
  -[PXKitSettings setDefaultTruncatedTextMinimumScaleFactor:](self, "setDefaultTruncatedTextMinimumScaleFactor:", 0.649999976);
  -[PXKitSettings setTextAutoscalingPrecision:](self, "setTextAutoscalingPrecision:", 5.0);
  -[PXKitSettings setAllowCapitalization:](self, "setAllowCapitalization:", 1);
  -[PXKitSettings setAllowFontFallback:](self, "setAllowFontFallback:", 1);
  -[PXKitSettings setSimulateSlowTextTypesetting:](self, "setSimulateSlowTextTypesetting:", 0);
  -[PXKitSettings setDrawTypographicGuidelines:](self, "setDrawTypographicGuidelines:", 0);
  v3 = (void *)MGCopyAnswer();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("s5l8960x")) & 1) != 0)
  {
    v4 = (void *)MGCopyAnswer();
    v5 = objc_msgSend(v4, "containsString:", CFSTR("iPad"));

    v6 = v5 ^ 1u;
  }
  else
  {

    v6 = 1;
  }
  -[PXKitSettings setDeviceGraphicsQuality:](self, "setDeviceGraphicsQuality:");
  -[PXKitSettings setUseFancyDarkening:](self, "setUseFancyDarkening:", v6);
  -[PXKitSettings setSimulatedSafeAreaHorizontalInsets:](self, "setSimulatedSafeAreaHorizontalInsets:", 0.0);
  -[PXKitSettings setSimulatedPeripheryExtraTopInset:](self, "setSimulatedPeripheryExtraTopInset:", 0.0);
  -[PXKitSettings setSimulatedPeripheryExtraLeftInset:](self, "setSimulatedPeripheryExtraLeftInset:", 0.0);
  -[PXKitSettings setSimulatedPeripheryExtraBottomInset:](self, "setSimulatedPeripheryExtraBottomInset:", 0.0);
  -[PXKitSettings setSimulatedPeripheryExtraRightInset:](self, "setSimulatedPeripheryExtraRightInset:", 0.0);
  -[PXKitSettings setSimulateDroppedFramesDuringPPT:](self, "setSimulateDroppedFramesDuringPPT:", 0);
  -[PXKitSettings setSimulatedDroppedFramesDurationInMilliseconds:](self, "setSimulatedDroppedFramesDurationInMilliseconds:", 20.0);
  -[PXKitSettings setSimulatedDroppedFramesPeriod:](self, "setSimulatedDroppedFramesPeriod:", 10);
  -[PXKitSettings setViewResetTimeoutDuration:](self, "setViewResetTimeoutDuration:", 480.0);
}

- (void)setUseFancyDarkening:(BOOL)a3
{
  self->_useFancyDarkening = a3;
}

- (void)setUpGesturesAngularToleranceInDegrees:(double)a3
{
  self->_upGesturesAngularToleranceInDegrees = a3;
}

- (void)setTextAutoscalingPrecision:(double)a3
{
  self->_textAutoscalingPrecision = a3;
}

- (void)setSmallestSignificantScrollVelocity:(double)a3
{
  self->_smallestSignificantScrollVelocity = a3;
}

- (void)setSimulatedSafeAreaHorizontalInsets:(double)a3
{
  self->_simulatedSafeAreaHorizontalInsets = a3;
}

- (void)setSimulatedPeripheryExtraTopInset:(double)a3
{
  self->_simulatedPeripheryExtraTopInset = a3;
}

- (void)setSimulatedPeripheryExtraRightInset:(double)a3
{
  self->_simulatedPeripheryExtraRightInset = a3;
}

- (void)setSimulatedPeripheryExtraLeftInset:(double)a3
{
  self->_simulatedPeripheryExtraLeftInset = a3;
}

- (void)setSimulatedPeripheryExtraBottomInset:(double)a3
{
  self->_simulatedPeripheryExtraBottomInset = a3;
}

- (void)setSimulatedDroppedFramesPeriod:(int64_t)a3
{
  self->_simulatedDroppedFramesPeriod = a3;
}

- (void)setSimulatedDroppedFramesDurationInMilliseconds:(double)a3
{
  self->_simulatedDroppedFramesDurationInMilliseconds = a3;
}

- (void)setSimulateSlowTextTypesetting:(BOOL)a3
{
  self->_simulateSlowTextTypesetting = a3;
}

- (void)setSimulateSilentMode:(BOOL)a3
{
  self->_simulateSilentMode = a3;
}

- (void)setSimulateDroppedFramesDuringPPT:(BOOL)a3
{
  self->_simulateDroppedFramesDuringPPT = a3;
}

- (void)setHorizontalGesturesAngularToleranceInDegrees:(double)a3
{
  self->_horizontalGesturesAngularToleranceInDegrees = a3;
}

- (void)setHonorSilentMode:(BOOL)a3
{
  self->_honorSilentMode = a3;
}

- (void)setDrawTypographicGuidelines:(BOOL)a3
{
  self->_drawTypographicGuidelines = a3;
}

- (void)setDownGesturesAngularToleranceInDegrees:(double)a3
{
  self->_downGesturesAngularToleranceInDegrees = a3;
}

- (void)setDeviceGraphicsQuality:(int64_t)a3
{
  self->_deviceGraphicsQuality = a3;
}

- (void)setDefaultUseShapeLayerForText:(BOOL)a3
{
  self->_defaultUseShapeLayerForText = a3;
}

- (void)setDefaultTruncatedTextMinimumScaleFactor:(double)a3
{
  self->_defaultTruncatedTextMinimumScaleFactor = a3;
}

- (void)setDefaultTextTruncationEnabled:(BOOL)a3
{
  self->_defaultTextTruncationEnabled = a3;
}

- (void)setDefaultTextMinimumScaleFactor:(double)a3
{
  self->_defaultTextMinimumScaleFactor = a3;
}

- (void)setDefaultTextAutoscalingEnabled:(BOOL)a3
{
  self->_defaultTextAutoscalingEnabled = a3;
}

- (void)setDefaultLabelTypesettingMode:(int64_t)a3
{
  self->_defaultLabelTypesettingMode = a3;
}

- (void)setDefaultAsyncTextRenderingEnabled:(BOOL)a3
{
  self->_defaultAsyncTextRenderingEnabled = a3;
}

- (void)setAllowFontFallback:(BOOL)a3
{
  self->_allowFontFallback = a3;
}

- (void)setAllowCapitalization:(BOOL)a3
{
  self->_allowCapitalization = a3;
}

void __31__PXKitSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "kit");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_164352;
  sharedInstance_sharedInstance_164352 = v0;

}

- (BOOL)simulateDroppedFramesDuringPPT
{
  return self->_simulateDroppedFramesDuringPPT;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (double)downGesturesAngularToleranceInDegrees
{
  return self->_downGesturesAngularToleranceInDegrees;
}

- (double)upGesturesAngularToleranceInDegrees
{
  return self->_upGesturesAngularToleranceInDegrees;
}

- (double)horizontalGesturesAngularToleranceInDegrees
{
  return self->_horizontalGesturesAngularToleranceInDegrees;
}

- (double)smallestSignificantScrollVelocity
{
  return self->_smallestSignificantScrollVelocity;
}

- (BOOL)honorSilentMode
{
  return self->_honorSilentMode;
}

- (BOOL)simulateSilentMode
{
  return self->_simulateSilentMode;
}

- (BOOL)defaultAsyncTextRenderingEnabled
{
  return self->_defaultAsyncTextRenderingEnabled;
}

- (int64_t)defaultLabelTypesettingMode
{
  return self->_defaultLabelTypesettingMode;
}

- (BOOL)defaultTextAutoscalingEnabled
{
  return self->_defaultTextAutoscalingEnabled;
}

- (double)defaultTextMinimumScaleFactor
{
  return self->_defaultTextMinimumScaleFactor;
}

- (BOOL)defaultTextTruncationEnabled
{
  return self->_defaultTextTruncationEnabled;
}

- (double)defaultTruncatedTextMinimumScaleFactor
{
  return self->_defaultTruncatedTextMinimumScaleFactor;
}

- (double)textAutoscalingPrecision
{
  return self->_textAutoscalingPrecision;
}

- (BOOL)allowCapitalization
{
  return self->_allowCapitalization;
}

- (int64_t)deviceGraphicsQuality
{
  return self->_deviceGraphicsQuality;
}

- (double)simulatedDroppedFramesDurationInMilliseconds
{
  return self->_simulatedDroppedFramesDurationInMilliseconds;
}

- (int64_t)simulatedDroppedFramesPeriod
{
  return self->_simulatedDroppedFramesPeriod;
}

- (double)viewResetTimeoutDuration
{
  return self->_viewResetTimeoutDuration;
}

- (void)setViewResetTimeoutDuration:(double)a3
{
  self->_viewResetTimeoutDuration = a3;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  uint64_t v4;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
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
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  _QWORD v146[3];
  _QWORD v147[9];
  _QWORD v148[3];
  _QWORD v149[10];
  void *v150;
  _QWORD v151[3];
  _QWORD v152[9];

  v152[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_simulateDroppedFramesDuringPPT);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K != 0"), v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  v103 = (id)MEMORY[0x1E0D83078];
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_downGesturesAngularToleranceInDegrees);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Down"), v145);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "minValue:maxValue:", 0.0, 90.0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "px_increment:", 5.0);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v142;
  v7 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_upGesturesAngularToleranceInDegrees);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Up"), v141);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "minValue:maxValue:", 0.0, 90.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "px_increment:", 5.0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = v138;
  v8 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_horizontalGesturesAngularToleranceInDegrees);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Horizontal"), v137);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "minValue:maxValue:", 0.0, 90.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "px_increment:", 5.0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v151[2] = v134;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 3);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v133, CFSTR("Gestures Angular Tolerances"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v132;
  v9 = (void *)MEMORY[0x1E0D83078];
  v10 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_smallestSignificantScrollVelocity);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Min Velocity"), v131);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "minValue:maxValue:", 0.0, 1000.0);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "px_increment:", 50.0);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v128;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v127, CFSTR("Scroll Gestures"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v152[1] = v126;
  v11 = (void *)MEMORY[0x1E0D83078];
  v12 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_viewResetTimeoutDuration);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("View Reset Timeout Duration"), v125);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "possibleValues:titles:", &unk_1E53EA008, &unk_1E53EA020);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v123;
  v13 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_honorSilentMode);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Honour Silent Mode"), v122);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v149[1] = v121;
  v14 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateSilentMode);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Silent Mode"), v120);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v149[2] = v119;
  v15 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_defaultAsyncTextRenderingEnabled);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Async Text Rendering"), v118);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v149[3] = v117;
  v16 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_defaultLabelTypesettingMode);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Typesetting Mode"), v116);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "possibleValues:titles:", &unk_1E53EA038, &unk_1E53EA050);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v149[4] = v114;
  v17 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_defaultUseShapeLayerForText);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Shape Layer for Text"), v113);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v149[5] = v112;
  v18 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_defaultTextAutoscalingEnabled);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Text Autoscaling"), v111);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v149[6] = v110;
  v19 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_defaultTextMinimumScaleFactor);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rowWithTitle:valueKeyPath:", CFSTR("Text Minimum Scale Factor"), v109);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "conditionFormat:", CFSTR("defaultTextAutoscalingEnabled != 0"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v149[7] = v107;
  v20 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_defaultTextTruncationEnabled);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Text Truncation"), v106);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v149[8] = v105;
  v21 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_defaultTruncatedTextMinimumScaleFactor);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Truncated Text Minimum Scale Factor"), v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "conditionFormat:", CFSTR("defaultTextTruncationEnabled != 0"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v149[9] = v100;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 10);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v99, CFSTR("Default Values"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v152[2] = v98;
  v22 = (void *)MEMORY[0x1E0D83078];
  v23 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_deviceGraphicsQuality);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:valueKeyPath:", CFSTR("Graphics Quality"), v97);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "possibleValues:titles:", &unk_1E53EA068, &unk_1E53EA080);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v95;
  v24 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useFancyDarkening);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Fancy Darkening (requires app restart)"), v94);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v148[1] = v93;
  v25 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_textAutoscalingPrecision);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Text Autoscaling Precision"), v92);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "minValue:maxValue:", 1.0, 50.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "px_increment:", 1.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v148[2] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 3);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:", v88, CFSTR("Settings"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v152[3] = v87;
  v26 = (void *)MEMORY[0x1E0D83078];
  v27 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowCapitalization);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Allow Capitalization"), v86);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v85;
  v28 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowFontFallback);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Allow Font Fallback"), v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v83;
  v29 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateSlowTextTypesetting);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Slow Text Typesetting"), v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v147[2] = v81;
  v30 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_drawTypographicGuidelines);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Typographic Guidelines"), v80);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v147[3] = v78;
  v31 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedSafeAreaHorizontalInsets);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Safe Area Horizontal Insets"), v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "minValue:maxValue:", 0.0, 250.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "px_increment:", 10.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v147[4] = v74;
  v32 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedPeripheryExtraTopInset);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:valueKeyPath:", CFSTR("Periphery Extra Top Inset"), v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "minValue:maxValue:", 0.0, 150.0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "px_increment:", 1.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v147[5] = v70;
  v33 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedPeripheryExtraLeftInset);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Periphery Extra Left Inset"), v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "minValue:maxValue:", 0.0, 150.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "px_increment:", 1.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v147[6] = v66;
  v34 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedPeripheryExtraBottomInset);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rowWithTitle:valueKeyPath:", CFSTR("Periphery Extra Bottom Inset"), v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "minValue:maxValue:", 0.0, 150.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "px_increment:", 1.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v147[7] = v62;
  v35 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedPeripheryExtraRightInset);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowWithTitle:valueKeyPath:", CFSTR("Periphery Extra Right Inset"), v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 0.0, 150.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "px_increment:", 1.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v147[8] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 9);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:title:", v57, CFSTR("Debug"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v152[4] = v56;
  v50 = (void *)MEMORY[0x1E0D83078];
  v36 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_simulateDroppedFramesDuringPPT);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Dropped Frames"), v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = v54;
  v37 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedDroppedFramesDurationInMilliseconds);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:valueKeyPath:", CFSTR("Dropped Frames Duration"), v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "minValue:maxValue:", 1.0, 100.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)v4;
  objc_msgSend(v51, "condition:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v38;
  v39 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_simulatedDroppedFramesPeriod);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rowWithTitle:valueKeyPath:", CFSTR("Dropped Frames Period"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "minValue:maxValue:", 1.0, 120.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "px_increment:", 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "condition:", v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v146[2] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "sectionWithRows:title:", v45, CFSTR("PPT"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v152[5] = v46;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v152[6] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 7);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "moduleWithTitle:contents:", CFSTR("Kit"), v48);
  v104 = (id)objc_claimAutoreleasedReturnValue();

  return v104;
}

@end
