@implementation PXImageModulationSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXImageModulationSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXImageModulationSettings setEnabled:](self, "setEnabled:", PXSupportsImageModulation());
  -[PXImageModulationSettings setFilterType:](self, "setFilterType:", 1);
  -[PXImageModulationSettings setHDRConsideration:](self, "setHDRConsideration:", 0);
  -[PXImageModulationSettings setGainMapEnabled:](self, "setGainMapEnabled:", _os_feature_enabled_impl() ^ 1);
  -[PXImageModulationSettings setToneMapEnabled:](self, "setToneMapEnabled:", 1);
  -[PXImageModulationSettings setGainBoostEnabled:](self, "setGainBoostEnabled:", 1);
  -[PXImageModulationSettings setShowGainMapBorder:](self, "setShowGainMapBorder:", 0);
  -[PXImageModulationSettings setAnimateGainMapAppearance:](self, "setAnimateGainMapAppearance:", 1);
  -[PXImageModulationSettings setGainMapAnimationDuration:](self, "setGainMapAnimationDuration:", 0.25);
  -[PXImageModulationSettings setGainMapAnimationTimingFunction:](self, "setGainMapAnimationTimingFunction:", *MEMORY[0x1E0CD3038]);
  -[PXImageModulationSettings setGainMapAnimationActivationThreshold:](self, "setGainMapAnimationActivationThreshold:", 0.0);
  -[PXImageModulationSettings setHDRModulationIntensity:](self, "setHDRModulationIntensity:", 1.0);
  -[PXImageModulationSettings setSDRModulationIntensity:](self, "setSDRModulationIntensity:", 0.0);
  -[PXImageModulationSettings setVideoComplementModulationIntensity:](self, "setVideoComplementModulationIntensity:", 0.5);
  -[PXImageModulationSettings setEDRHeadroomRequestScheme:](self, "setEDRHeadroomRequestScheme:", 1);
  -[PXImageModulationSettings setUseThresholdForVideos:](self, "setUseThresholdForVideos:", 1);
  -[PXImageModulationSettings setEDRHeadroomUsageScheme:](self, "setEDRHeadroomUsageScheme:", 0);
  -[PXImageModulationSettings setManualEDRHeadroomRequestStops:](self, "setManualEDRHeadroomRequestStops:", 3.0);
  -[PXImageModulationSettings setEDRHeadroomRequestHDRThreshold:](self, "setEDRHeadroomRequestHDRThreshold:", 0.1);
  -[PXImageModulationSettings setEDRHeadroomRequestSustainDuration:](self, "setEDRHeadroomRequestSustainDuration:", 15.0);
  -[PXImageModulationSettings setLowEDRRequestedHeadroomStops:](self, "setLowEDRRequestedHeadroomStops:", 0.0);
  -[PXImageModulationSettings setHighEDRRequestedHeadroomStops:](self, "setHighEDRRequestedHeadroomStops:", 4.0);
  -[PXImageModulationSettings setForceCurrentScreenSupportsHDR:](self, "setForceCurrentScreenSupportsHDR:", 0);
  -[PXImageModulationSettings setDeviceMaximumEDRHeadroomStops:](self, "setDeviceMaximumEDRHeadroomStops:", 4.0);
  -[PXImageModulationSettings setEnableHeadroomMonitoring:](self, "setEnableHeadroomMonitoring:", 1);
}

- (void)setVideoComplementModulationIntensity:(double)a3
{
  self->_videoComplementModulationIntensity = a3;
}

- (void)setUseThresholdForVideos:(BOOL)a3
{
  self->_useThresholdForVideos = a3;
}

- (void)setToneMapEnabled:(BOOL)a3
{
  self->_toneMapEnabled = a3;
}

- (void)setShowGainMapBorder:(BOOL)a3
{
  self->_showGainMapBorder = a3;
}

- (void)setSDRModulationIntensity:(double)a3
{
  self->_SDRModulationIntensity = a3;
}

- (void)setManualEDRHeadroomRequestStops:(double)a3
{
  self->_manualEDRHeadroomRequestStops = a3;
}

- (void)setLowEDRRequestedHeadroomStops:(double)a3
{
  self->_lowEDRRequestedHeadroomStops = a3;
}

- (void)setHighEDRRequestedHeadroomStops:(double)a3
{
  self->_highEDRRequestedHeadroomStops = a3;
}

- (void)setHDRModulationIntensity:(double)a3
{
  self->_HDRModulationIntensity = a3;
}

- (void)setHDRConsideration:(int64_t)a3
{
  self->_HDRConsideration = a3;
}

- (void)setGainMapEnabled:(BOOL)a3
{
  self->_gainMapEnabled = a3;
}

- (void)setGainMapAnimationTimingFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setGainMapAnimationDuration:(double)a3
{
  self->_gainMapAnimationDuration = a3;
}

- (void)setGainMapAnimationActivationThreshold:(double)a3
{
  self->_gainMapAnimationActivationThreshold = a3;
}

- (void)setGainBoostEnabled:(BOOL)a3
{
  self->_gainBoostEnabled = a3;
}

- (void)setForceCurrentScreenSupportsHDR:(BOOL)a3
{
  self->_forceCurrentScreenSupportsHDR = a3;
}

- (void)setFilterType:(int64_t)a3
{
  self->_filterType = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setEDRHeadroomUsageScheme:(int64_t)a3
{
  self->_EDRHeadroomUsageScheme = a3;
}

- (void)setEDRHeadroomRequestSustainDuration:(double)a3
{
  self->_EDRHeadroomRequestSustainDuration = a3;
}

- (void)setEDRHeadroomRequestScheme:(int64_t)a3
{
  self->_EDRHeadroomRequestScheme = a3;
}

- (void)setEDRHeadroomRequestHDRThreshold:(double)a3
{
  self->_EDRHeadroomRequestHDRThreshold = a3;
}

- (void)setDeviceMaximumEDRHeadroomStops:(double)a3
{
  self->_deviceMaximumEDRHeadroomStops = a3;
}

- (void)setAnimateGainMapAppearance:(BOOL)a3
{
  self->_animateGainMapAppearance = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (int64_t)HDRConsideration
{
  return self->_HDRConsideration;
}

- (BOOL)gainMapEnabled
{
  return self->_gainMapEnabled;
}

- (BOOL)gainBoostEnabled
{
  return self->_gainBoostEnabled;
}

- (BOOL)toneMapEnabled
{
  return self->_toneMapEnabled;
}

- (BOOL)showGainMapBorder
{
  return self->_showGainMapBorder;
}

- (BOOL)animateGainMapAppearance
{
  return self->_animateGainMapAppearance;
}

- (double)gainMapAnimationDuration
{
  return self->_gainMapAnimationDuration;
}

- (NSString)gainMapAnimationTimingFunction
{
  return self->_gainMapAnimationTimingFunction;
}

- (double)gainMapAnimationActivationThreshold
{
  return self->_gainMapAnimationActivationThreshold;
}

- (double)HDRModulationIntensity
{
  return self->_HDRModulationIntensity;
}

- (double)SDRModulationIntensity
{
  return self->_SDRModulationIntensity;
}

- (double)videoComplementModulationIntensity
{
  return self->_videoComplementModulationIntensity;
}

- (int64_t)EDRHeadroomRequestScheme
{
  return self->_EDRHeadroomRequestScheme;
}

- (BOOL)useThresholdForVideos
{
  return self->_useThresholdForVideos;
}

- (int64_t)EDRHeadroomUsageScheme
{
  return self->_EDRHeadroomUsageScheme;
}

- (double)manualEDRHeadroomRequestStops
{
  return self->_manualEDRHeadroomRequestStops;
}

- (double)EDRHeadroomRequestHDRThreshold
{
  return self->_EDRHeadroomRequestHDRThreshold;
}

- (double)EDRHeadroomRequestSustainDuration
{
  return self->_EDRHeadroomRequestSustainDuration;
}

- (double)lowEDRRequestedHeadroomStops
{
  return self->_lowEDRRequestedHeadroomStops;
}

- (double)highEDRRequestedHeadroomStops
{
  return self->_highEDRRequestedHeadroomStops;
}

- (double)deviceMaximumEDRHeadroomStops
{
  return self->_deviceMaximumEDRHeadroomStops;
}

- (BOOL)forceCurrentScreenSupportsHDR
{
  return self->_forceCurrentScreenSupportsHDR;
}

- (BOOL)enableHeadroomMonitoring
{
  return self->_enableHeadroomMonitoring;
}

- (void)setEnableHeadroomMonitoring:(BOOL)a3
{
  self->_enableHeadroomMonitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMapAnimationTimingFunction, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15665 != -1)
    dispatch_once(&sharedInstance_onceToken_15665, &__block_literal_global_15666);
  return (id)sharedInstance_sharedInstance_15667;
}

void __43__PXImageModulationSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageModulationSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_15667;
  sharedInstance_sharedInstance_15667 = v0;

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
  uint64_t v20;
  uint64_t v21;
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
  _QWORD v92[6];
  void *v93;
  _QWORD v94[8];
  _QWORD v95[4];
  _QWORD v96[8];
  _QWORD v97[5];
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable"), CFSTR("enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v4);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Filter"), CFSTR("filterType"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "possibleValues:titles:", &unk_1E53E9F18, &unk_1E53E9F30);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v83;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("HDR Consideration"), CFSTR("HDRConsideration"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "possibleValues:titles:", &unk_1E53E9F48, &unk_1E53E9F60);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v77;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("HDR Modulation Intensity"), CFSTR("HDRModulationIntensity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_increment:", 0.0500000007);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v7;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("SDR Modulation Intensity"), CFSTR("SDRModulationIntensity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_increment:", 0.0500000007);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v10;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Video Complement Modulation Intensity"), CFSTR("videoComplementModulationIntensity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minValue:maxValue:", 0.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "px_increment:", 0.0500000007);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v97[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "sectionWithRows:title:conditionFormat:", v14, CFSTR("Filtering"), CFSTR("enabled != 0"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = (void *)MEMORY[0x1E0D83078];
  v15 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_gainMapEnabled);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Use Gain Map"), v84);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v81;
  v16 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_gainBoostEnabled);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:valueKeyPath:", CFSTR("Use Gain Boost"), v78);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v75;
  v17 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_toneMapEnabled);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Use HLG/PQ Tone Mapping"), v73);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v96[2] = v71;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Gain Map Border"), CFSTR("showGainMapBorder"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "conditionFormat:", CFSTR("gainMapEnabled != 0"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v96[3] = v67;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Animate Gain Map Appearance"), CFSTR("animateGainMapAppearance"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "conditionFormat:", CFSTR("gainMapEnabled != 0"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v96[4] = v62;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Animation Duration"), CFSTR("gainMapAnimationDuration"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 0.0, 2.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "px_increment:", 0.0500000007);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "conditionFormat:", CFSTR("gainMapEnabled != 0 && animateGainMapAppearance != 0"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v96[5] = v18;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Animation Timing Function"), CFSTR("gainMapAnimationTimingFunction"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CD3040];
  v95[0] = *MEMORY[0x1E0CD3038];
  v95[1] = v20;
  v21 = *MEMORY[0x1E0CD3048];
  v95[2] = *MEMORY[0x1E0CD3050];
  v95[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "possibleValues:titles:", v22, &unk_1E53E9F78);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "conditionFormat:", CFSTR("gainMapEnabled != 0 && animateGainMapAppearance != 0"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v96[6] = v24;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Activation Threshold"), CFSTR("gainMapAnimationActivationThreshold"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "minValue:maxValue:", 0.0, 2.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "px_increment:", 0.0500000007);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "conditionFormat:", CFSTR("gainMapEnabled != 0 && animateGainMapAppearance != 0"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v96[7] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "sectionWithRows:title:", v29, CFSTR("Gain Map Settings"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Headroom Request"), CFSTR("EDRHeadroomRequestScheme"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "possibleValues:titles:", &unk_1E53E9F90, &unk_1E53E9FA8);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v82;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Threshold For Videos"), CFSTR("useThresholdForVideos"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("EDRHeadroomRequestScheme == %@"), &unk_1E53EE4D8);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "condition:", v76);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v74;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Headroom (Stops)"), CFSTR("manualEDRHeadroomRequestStops"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "minValue:maxValue:", 0.0, 3.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("EDRHeadroomRequestScheme == %@"), &unk_1E53EE4C0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "condition:", v68);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v94[2] = v63;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("HDR Threshold"), CFSTR("EDRHeadroomRequestHDRThreshold"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "minValue:maxValue:", -1.0, 1.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "px_increment:", 0.1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("EDRHeadroomRequestScheme == %@"), &unk_1E53EE4D8);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "condition:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v94[3] = v54;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Sustain Duration"), CFSTR("EDRHeadroomRequestSustainDuration"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "minValue:maxValue:", 0.0, 30.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "px_increment:", 0.5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v94[4] = v51;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Low Value (Stops)"), CFSTR("lowEDRRequestedHeadroomStops"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minValue:maxValue:", 0.0, 2.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "px_increment:", 0.1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v94[5] = v32;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("High Value (Stops)"), CFSTR("highEDRRequestedHeadroomStops"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 0.0, 4.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "px_increment:", 0.1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v94[6] = v35;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Device Max (Stops)"), CFSTR("deviceMaximumEDRHeadroomStops"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "minValue:maxValue:", 0.0, 3.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "px_increment:", 0.1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v94[7] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "sectionWithRows:title:conditionFormat:", v39, CFSTR("Headroom Request"), CFSTR("enabled != 0"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x1E0D83078];
  v41 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableHeadroomMonitoring);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:valueKeyPath:", CFSTR("Enable Monitoring"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sectionWithRows:title:", v44, CFSTR("Headroom Monitoring"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0D83078];
  v92[0] = v91;
  v92[1] = v90;
  v92[2] = v88;
  v92[3] = v66;
  v92[4] = v45;
  v92[5] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "moduleWithTitle:contents:", CFSTR("Image Modulation"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

@end
