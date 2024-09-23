@implementation PUFeedSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUFeedSettings;
  -[PTSettings setDefaultValues](&v7, sel_setDefaultValues);
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "masterThumbnailFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "largestUncroppedNonJPEGThumbnailFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");

  -[PUFeedSettings setUseJPEGImageFormats:](self, "setUseJPEGImageFormats:", 1);
  -[PUFeedSettings setSmallTileSizeTolerance:](self, "setSmallTileSizeTolerance:", 0.0);
  -[PUFeedSettings setShouldUseJPEGFastFormatForMediumTiles:](self, "setShouldUseJPEGFastFormatForMediumTiles:", 1);
  -[PUFeedSettings setShouldUseJPEGFastFormatForLargeTiles:](self, "setShouldUseJPEGFastFormatForLargeTiles:", 1);
  -[PUFeedSettings setUseQualityImageFormats:](self, "setUseQualityImageFormats:", 1);
  -[PUFeedSettings setMaximumScrollRegimeForQualityImageFormats:](self, "setMaximumScrollRegimeForQualityImageFormats:", -1);
  -[PUFeedSettings setSpeedometerMediumUpperThreshold:](self, "setSpeedometerMediumUpperThreshold:", 1000.0);
  -[PUFeedSettings setSpeedometerMediumLowerThreshold:](self, "setSpeedometerMediumLowerThreshold:", 200.0);
  -[PUFeedSettings setSpeedometerFastUpperThreshold:](self, "setSpeedometerFastUpperThreshold:", 5000.0);
  -[PUFeedSettings setSpeedometerFastLowerThreshold:](self, "setSpeedometerFastLowerThreshold:", 1000.0);
  -[PUFeedSettings setUseSpeedometerFeedback:](self, "setUseSpeedometerFeedback:", 0);
  -[PUFeedSettings setPreheatingMinimumScrollFactor:](self, "setPreheatingMinimumScrollFactor:", 0.400000006);
  -[PUFeedSettings setSlowScrollPreheatingWindowSize:](self, "setSlowScrollPreheatingWindowSize:", 3.0);
  -[PUFeedSettings setMediumScrollPreheatingWindowSize:](self, "setMediumScrollPreheatingWindowSize:", 2.5);
  -[PUFeedSettings setFastScrollPreheatingWindowSize:](self, "setFastScrollPreheatingWindowSize:", 2.0);
  -[PUFeedSettings setShouldPreheatCoreData:](self, "setShouldPreheatCoreData:", 1);
  -[PUFeedSettings setShouldPreheatAssets:](self, "setShouldPreheatAssets:", 1);
  -[PUFeedSettings setShouldPreheatComments:](self, "setShouldPreheatComments:", 1);
  -[PUFeedSettings setForceDefaultPreheatManager:](self, "setForceDefaultPreheatManager:", 0);
  -[PUFeedSettings setFeedContent:](self, "setFeedContent:", 0);
  -[PUFeedSettings setInitialWindowSize:](self, "setInitialWindowSize:", 50);
  -[PUFeedSettings setTestInitialWindowSize:](self, "setTestInitialWindowSize:", 50);
  -[PUFeedSettings setIgnoresCaptions:](self, "setIgnoresCaptions:", 0);
  -[PUFeedSettings setParallaxModel:](self, "setParallaxModel:", 0);
  -[PUFeedSettings setParallaxEnabled:](self, "setParallaxEnabled:", 0);
  -[PUFeedSettings setVitalityEnabled:](self, "setVitalityEnabled:", 0);
  -[PUFeedSettings setShowGroupIDHeaders:](self, "setShowGroupIDHeaders:", 0);
  -[PUFeedSettings setParallaxFactor:](self, "setParallaxFactor:", 4.0);
  -[PUFeedSettings setAllowsInfiniteScrolling:](self, "setAllowsInfiniteScrolling:", 1);
  -[PUFeedSettings setInfiniteScrollingWindowSizeIncrement:](self, "setInfiniteScrollingWindowSizeIncrement:", 5);
  -[PUFeedSettings setForceLivePhotoBadges:](self, "setForceLivePhotoBadges:", 0);
  -[PUFeedSettings setLoopsEnabled:](self, "setLoopsEnabled:", 1);
}

- (void)setVitalityEnabled:(BOOL)a3
{
  self->_vitalityEnabled = a3;
}

- (void)setUseSpeedometerFeedback:(BOOL)a3
{
  self->_useSpeedometerFeedback = a3;
}

- (void)setUseQualityImageFormats:(BOOL)a3
{
  self->_useQualityImageFormats = a3;
}

- (void)setUseJPEGImageFormats:(BOOL)a3
{
  self->_useJPEGImageFormats = a3;
}

- (void)setTestInitialWindowSize:(int64_t)a3
{
  self->_testInitialWindowSize = a3;
}

- (void)setSpeedometerMediumUpperThreshold:(double)a3
{
  self->_speedometerMediumUpperThreshold = a3;
}

- (void)setSpeedometerMediumLowerThreshold:(double)a3
{
  self->_speedometerMediumLowerThreshold = a3;
}

- (void)setSpeedometerFastUpperThreshold:(double)a3
{
  self->_speedometerFastUpperThreshold = a3;
}

- (void)setSpeedometerFastLowerThreshold:(double)a3
{
  self->_speedometerFastLowerThreshold = a3;
}

- (void)setSmallTileSizeTolerance:(double)a3
{
  self->_smallTileSizeTolerance = a3;
}

- (void)setSlowScrollPreheatingWindowSize:(double)a3
{
  self->_slowScrollPreheatingWindowSize = a3;
}

- (void)setShowGroupIDHeaders:(BOOL)a3
{
  self->_showGroupIDHeaders = a3;
}

- (void)setShouldUseJPEGFastFormatForMediumTiles:(BOOL)a3
{
  self->_shouldUseJPEGFastFormatForMediumTiles = a3;
}

- (void)setShouldUseJPEGFastFormatForLargeTiles:(BOOL)a3
{
  self->_shouldUseJPEGFastFormatForLargeTiles = a3;
}

- (void)setShouldPreheatCoreData:(BOOL)a3
{
  self->_shouldPreheatCoreData = a3;
}

- (void)setShouldPreheatComments:(BOOL)a3
{
  self->_shouldPreheatComments = a3;
}

- (void)setShouldPreheatAssets:(BOOL)a3
{
  self->_shouldPreheatAssets = a3;
}

- (void)setPreheatingMinimumScrollFactor:(double)a3
{
  self->_preheatingMinimumScrollFactor = a3;
}

- (void)setParallaxModel:(int64_t)a3
{
  self->_parallaxModel = a3;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (void)setMediumScrollPreheatingWindowSize:(double)a3
{
  self->_mediumScrollPreheatingWindowSize = a3;
}

- (void)setMaximumScrollRegimeForQualityImageFormats:(int64_t)a3
{
  self->_maximumScrollRegimeForQualityImageFormats = a3;
}

- (void)setLoopsEnabled:(BOOL)a3
{
  self->_loopsEnabled = a3;
}

- (void)setInitialWindowSize:(int64_t)a3
{
  self->_initialWindowSize = a3;
}

- (void)setInfiniteScrollingWindowSizeIncrement:(int64_t)a3
{
  self->_infiniteScrollingWindowSizeIncrement = a3;
}

- (void)setIgnoresCaptions:(BOOL)a3
{
  self->_ignoresCaptions = a3;
}

- (void)setForceLivePhotoBadges:(BOOL)a3
{
  self->_forceLivePhotoBadges = a3;
}

- (void)setForceDefaultPreheatManager:(BOOL)a3
{
  self->_forceDefaultPreheatManager = a3;
}

- (void)setFeedContent:(int64_t)a3
{
  self->_feedContent = a3;
}

- (void)setFastScrollPreheatingWindowSize:(double)a3
{
  self->_fastScrollPreheatingWindowSize = a3;
}

- (void)setAllowsInfiniteScrolling:(BOOL)a3
{
  self->_allowsInfiniteScrolling = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (BOOL)useJPEGImageFormats
{
  return self->_useJPEGImageFormats;
}

- (double)smallTileSizeTolerance
{
  return self->_smallTileSizeTolerance;
}

- (BOOL)shouldUseJPEGFastFormatForMediumTiles
{
  return self->_shouldUseJPEGFastFormatForMediumTiles;
}

- (BOOL)shouldUseJPEGFastFormatForLargeTiles
{
  return self->_shouldUseJPEGFastFormatForLargeTiles;
}

- (BOOL)useQualityImageFormats
{
  return self->_useQualityImageFormats;
}

- (int64_t)maximumScrollRegimeForQualityImageFormats
{
  return self->_maximumScrollRegimeForQualityImageFormats;
}

- (double)speedometerMediumUpperThreshold
{
  return self->_speedometerMediumUpperThreshold;
}

- (double)speedometerMediumLowerThreshold
{
  return self->_speedometerMediumLowerThreshold;
}

- (double)speedometerFastUpperThreshold
{
  return self->_speedometerFastUpperThreshold;
}

- (double)speedometerFastLowerThreshold
{
  return self->_speedometerFastLowerThreshold;
}

- (BOOL)useSpeedometerFeedback
{
  return self->_useSpeedometerFeedback;
}

- (double)preheatingMinimumScrollFactor
{
  return self->_preheatingMinimumScrollFactor;
}

- (double)slowScrollPreheatingWindowSize
{
  return self->_slowScrollPreheatingWindowSize;
}

- (double)mediumScrollPreheatingWindowSize
{
  return self->_mediumScrollPreheatingWindowSize;
}

- (double)fastScrollPreheatingWindowSize
{
  return self->_fastScrollPreheatingWindowSize;
}

- (BOOL)shouldPreheatCoreData
{
  return self->_shouldPreheatCoreData;
}

- (BOOL)shouldPreheatAssets
{
  return self->_shouldPreheatAssets;
}

- (BOOL)shouldPreheatComments
{
  return self->_shouldPreheatComments;
}

- (BOOL)forceDefaultPreheatManager
{
  return self->_forceDefaultPreheatManager;
}

- (int64_t)feedContent
{
  return self->_feedContent;
}

- (int64_t)initialWindowSize
{
  return self->_initialWindowSize;
}

- (int64_t)testInitialWindowSize
{
  return self->_testInitialWindowSize;
}

- (BOOL)ignoresCaptions
{
  return self->_ignoresCaptions;
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (int64_t)parallaxModel
{
  return self->_parallaxModel;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (BOOL)allowsInfiniteScrolling
{
  return self->_allowsInfiniteScrolling;
}

- (int64_t)infiniteScrollingWindowSizeIncrement
{
  return self->_infiniteScrollingWindowSizeIncrement;
}

- (BOOL)forceAllItemsAsVideo
{
  return self->_forceAllItemsAsVideo;
}

- (void)setForceAllItemsAsVideo:(BOOL)a3
{
  self->_forceAllItemsAsVideo = a3;
}

- (BOOL)forceLivePhotoBadges
{
  return self->_forceLivePhotoBadges;
}

- (BOOL)simulateSharedStreamsEnabled
{
  return self->_simulateSharedStreamsEnabled;
}

- (void)setSimulateSharedStreamsEnabled:(BOOL)a3
{
  self->_simulateSharedStreamsEnabled = a3;
}

- (BOOL)vitalityEnabled
{
  return self->_vitalityEnabled;
}

- (BOOL)showGroupIDHeaders
{
  return self->_showGroupIDHeaders;
}

- (BOOL)loopsEnabled
{
  return self->_loopsEnabled;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_27690 != -1)
    dispatch_once(&sharedInstance_onceToken_27690, &__block_literal_global_27691);
  return (id)sharedInstance_sharedInstance_27692;
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
  _QWORD v100[5];
  _QWORD v101[6];
  void *v102;
  void *v103;
  _QWORD v104[15];
  _QWORD v105[8];
  _QWORD v106[5];
  _QWORD v107[8];

  v107[6] = *MEMORY[0x1E0C80C00];
  v97 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use JPEG"), CFSTR("useJPEGImageFormats"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v94;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Small Tile Size Tolerance"), CFSTR("smallTileSizeTolerance"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "minValue:maxValue:", 0.0, 1.0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "pu_increment:", 0.0500000007);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v82;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("JPEG Fast for Medium Tiles"), CFSTR("shouldUseJPEGFastFormatForMediumTiles"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conditionFormat:", CFSTR("useJPEGImageFormats != 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("JPEG Fast for Large Tiles"), CFSTR("shouldUseJPEGFastFormatForLargeTiles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditionFormat:", CFSTR("useJPEGImageFormats != 0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v5;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Quality"), CFSTR("useQualityImageFormats"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conditionFormat:", CFSTR("useJPEGImageFormats != 0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v7;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Max Scroll Speed for Quality"), CFSTR("maximumScrollRegimeForQualityImageFormats"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "possibleValues:titles:", &unk_1E59B9EB0, &unk_1E59B9EC8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conditionFormat:", CFSTR("useJPEGImageFormats != 0"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v107[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "sectionWithRows:title:", v11, CFSTR("Image Formats"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Medium High Threshold"), CFSTR("speedometerMediumUpperThreshold"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "minValue:maxValue:", 0.0, 5000.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "pu_increment:", 100.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v83;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Medium Low Threshold"), CFSTR("speedometerMediumLowerThreshold"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "minValue:maxValue:", 0.0, 5000.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pu_increment:", 100.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v13;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fast High Threshold"), CFSTR("speedometerFastUpperThreshold"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 0.0, 5000.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pu_increment:", 100.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v16;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fast Low Threshold"), CFSTR("speedometerFastLowerThreshold"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minValue:maxValue:", 0.0, 5000.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pu_increment:", 100.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v106[3] = v19;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Feedback"), CFSTR("useSpeedometerFeedback"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v106[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "sectionWithRows:title:", v21, CFSTR("Speedometer"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Scroll Factor"), CFSTR("preheatingMinimumScrollFactor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "minValue:maxValue:", 0.0, 1.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "pu_increment:", 0.100000001);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v80;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Slow Scroll Window Size"), CFSTR("slowScrollPreheatingWindowSize"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "minValue:maxValue:", 0.0, 5.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "pu_increment:", 0.5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v73;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Medium Scroll Window Size"), CFSTR("mediumScrollPreheatingWindowSize"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "minValue:maxValue:", 0.0, 5.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "pu_increment:", 0.5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v105[2] = v67;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Fast Scroll Window Size"), CFSTR("fastScrollPreheatingWindowSize"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minValue:maxValue:", 0.0, 5.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pu_increment:", 0.5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v105[3] = v24;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Preheat CoreData"), CFSTR("shouldPreheatCoreData"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v105[4] = v25;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Preheat Assets"), CFSTR("shouldPreheatAssets"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "conditionFormat:", CFSTR("shouldPreheatCoreData != 0"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v105[5] = v27;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Preheat Comments"), CFSTR("shouldPreheatComments"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "conditionFormat:", CFSTR("shouldPreheatCoreData != 0"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v105[6] = v29;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Default Preheat Manager"), CFSTR("forceDefaultPreheatManager"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v105[7] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "sectionWithRows:title:", v31, CFSTR("Preheating"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Feed Content"), CFSTR("feedContent"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "possibleValues:titles:", &unk_1E59B9EE0, &unk_1E59B9EF8);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "possibleShortTitles:", &unk_1E59B9F10);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v81;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Initial Window Size"), CFSTR("initialWindowSize"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "minValue:maxValue:", 0.0, 50.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "pu_increment:", 1.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v74;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Initial Window Size (PPT)"), CFSTR("testInitialWindowSize"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "minValue:maxValue:", 0.0, 50.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "pu_increment:", 1.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v68;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Ignore Captions"), CFSTR("ignoresCaptions"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v104[3] = v64;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Parallax Enabled"), CFSTR("parallaxEnabled"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v104[4] = v63;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Parallax Model"), CFSTR("parallaxModel"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "possibleValues:titles:", &unk_1E59B9F28, &unk_1E59B9F40);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v104[5] = v61;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Parallax Factor"), CFSTR("parallaxFactor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 0.0, 100.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "pu_increment:", 0.5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v104[6] = v58;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Vitality Enabled"), CFSTR("vitalityEnabled"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v104[7] = v57;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Group Headers"), CFSTR("showGroupIDHeaders"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v104[8] = v56;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Infinite Scrolling"), CFSTR("allowsInfiniteScrolling"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v104[9] = v32;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Window Size Increment"), CFSTR("infiniteScrollingWindowSizeIncrement"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 1.0, 10.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "pu_increment:", 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "conditionFormat:", CFSTR("allowsInfiniteScrolling != 0"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v104[10] = v36;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fake All Videos"), CFSTR("forceAllItemsAsVideo"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v104[11] = v37;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Fake Live Photo Badges"), CFSTR("forceLivePhotoBadges"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v104[12] = v38;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Simulate Shared Streams Enabled"), CFSTR("simulateSharedStreamsEnabled"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v104[13] = v39;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Loops Enabled"), CFSTR("loopsEnabled"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v104[14] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 15);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "sectionWithRows:", v41);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0D83078];
  v43 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:action:", CFSTR("Restore Defaults"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sectionWithRows:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D83078];
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __42__PUFeedSettings_settingsControllerModule__block_invoke;
  v100[3] = &__block_descriptor_40_e5__8__0l;
  v100[4] = a1;
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:output:", CFSTR("Localized Strings"), v100);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sectionWithRows:title:", v50, CFSTR("Debug"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = (void *)MEMORY[0x1E0D83078];
  v101[0] = v98;
  v101[1] = v96;
  v101[2] = v93;
  v101[3] = v66;
  v101[4] = v47;
  v101[5] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 6);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "moduleWithTitle:contents:", CFSTR("Feed"), v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

+ (id)_localizedStrings
{
  void *v2;
  uint64_t v3;
  id v4;
  void (**v5)(void *, const __CFString *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  int v42;
  char v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v63;
  void *v64;
  void (**v65)(void *, const __CFString *);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  unint64_t v72;
  uint64_t v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(uint64_t, uint64_t, uint64_t);
  void *v86;
  __CFString *v87;
  const __CFString *v88;
  id v89;
  id v90;
  id v91;
  char v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(_QWORD *, uint64_t, uint64_t);
  void *v112;
  id v113;
  id v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(_QWORD *, uint64_t, uint64_t);
  void *v119;
  id v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(_QWORD *, uint64_t, uint64_t);
  void *v126;
  id v127;
  id v128;
  id v129;
  _QWORD v130[4];
  id v131;
  _QWORD aBlock[4];
  id v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E58AD278);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PUFeedSettings__localizedStrings__block_invoke;
  aBlock[3] = &unk_1E589ED60;
  v4 = v2;
  v133 = v4;
  v5 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
  v130[0] = v3;
  v130[1] = 3221225472;
  v130[2] = __35__PUFeedSettings__localizedStrings__block_invoke_2;
  v130[3] = &unk_1E589ED88;
  v63 = v4;
  v131 = v63;
  v6 = _Block_copy(v130);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudFeedDefaultTextAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v7;
  objc_msgSend(v7, "cloudFeedEmphasizedTextAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, CFSTR("User Posting Assets"));
  v123 = v3;
  v124 = 3221225472;
  v125 = __35__PUFeedSettings__localizedStrings__block_invoke_3;
  v126 = &unk_1E589EDB0;
  v129 = v6;
  v127 = v8;
  v128 = v9;
  PXDebugEnumerateInterestingPhotosOrVideosCountsToLocalize();
  v5[2](v5, CFSTR("Someone Posting Assets"));
  v116 = v3;
  v117 = 3221225472;
  v118 = __35__PUFeedSettings__localizedStrings__block_invoke_4;
  v119 = &unk_1E589EDB0;
  v122 = v129;
  v120 = v127;
  v121 = v128;
  PXDebugEnumerateInterestingPhotosOrVideosCountsToLocalize();
  v5[2](v5, CFSTR("Alternate Post Attributes"));
  v109 = v3;
  v110 = 3221225472;
  v111 = __35__PUFeedSettings__localizedStrings__block_invoke_5;
  v112 = &unk_1E589EDB0;
  v10 = v122;
  v115 = v10;
  v113 = v120;
  v114 = v121;
  PXDebugEnumerateInterestingPhotosOrVideosCountsToLocalize();
  v5[2](v5, CFSTR("Comments"));
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserCommentWithText:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("Lorem ipsum"), v113, v114);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v11);

  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserCommentWithText:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("Lorem ipsum."), v113, v114);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v12);

  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserCommentWithText:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("Lorem ipsum!"), v113, v114);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v13);

  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForCommentWithCommenterFullName:text:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("John Appleseed"), CFSTR("Lorem ipsum"), v113, v114);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v14);

  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForCommentWithCommenterFullName:text:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("John Appleseed"), CFSTR("Lorem ipsum."), v113, v114);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v15);

  v16 = v113;
  v74 = v114;
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForCommentWithCommenterFullName:text:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("John Appleseed"), CFSTR("Lorem ipsum!"), v113, v114);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v17);

  v65 = v5;
  v5[2](v5, CFSTR("Likes"));
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", &unk_1E59B9F58);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v71 = v18;
  v67 = objc_msgSend(&unk_1E59B9F70, "countByEnumeratingWithState:objects:count:", &v105, v139, 16);
  if (v67)
  {
    v66 = *(_QWORD *)v106;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v106 != v66)
          objc_enumerationMutation(&unk_1E59B9F70);
        v69 = v19;
        v20 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v19);
        objc_msgSend(v18, "count");
        v21 = 0;
        do
        {
          if (v21 || objc_msgSend(v20, "BOOLValue"))
          {
            v22 = (void *)MEMORY[0x1E0C99E40];
            v72 = v21;
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectsAtIndexes:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "orderedSetWithArray:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v26 = objc_msgSend(&unk_1E59B9F88, "countByEnumeratingWithState:objects:count:", &v101, v138, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v102;
              do
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v102 != v28)
                    objc_enumerationMutation(&unk_1E59B9F88);
                  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForLikesFromUser:otherPeopleFullNames:isVideo:defaultTextAttributes:emphasizedTextAttributes:", objc_msgSend(v20, "BOOLValue"), v25, objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "BOOLValue"), v16, v74);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(id, void *))v10 + 2))(v10, v30);

                }
                v27 = objc_msgSend(&unk_1E59B9F88, "countByEnumeratingWithState:objects:count:", &v101, v138, 16);
              }
              while (v27);
            }

            v18 = v71;
            v21 = v72;
          }
        }
        while (v21++ < objc_msgSend(v18, "count"));
        v19 = v69 + 1;
      }
      while (v69 + 1 != v67);
      v67 = objc_msgSend(&unk_1E59B9F70, "countByEnumeratingWithState:objects:count:", &v105, v139, 16);
    }
    while (v67);
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v32 = objc_msgSend(&unk_1E59B9FA0, "countByEnumeratingWithState:objects:count:", &v97, v137, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v98;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v98 != v34)
          objc_enumerationMutation(&unk_1E59B9FA0);
        objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForLikesWithLikerCount:isVideo:defaultTextAttributes:emphasizedTextAttributes:", 5, objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * j), "BOOLValue"), v16, v74);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v10 + 2))(v10, v36);

      }
      v33 = objc_msgSend(&unk_1E59B9FA0, "countByEnumeratingWithState:objects:count:", &v97, v137, 16);
    }
    while (v33);
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v37 = objc_msgSend(&unk_1E59B9FB8, "countByEnumeratingWithState:objects:count:", &v93, v136, 16);
  v38 = MEMORY[0x1E0C809B0];
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v94;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v94 != v40)
          objc_enumerationMutation(&unk_1E59B9FB8);
        v42 = objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * k), "BOOLValue");
        v43 = v42;
        v44 = CFSTR("John Appleseed");
        if (v42)
          v44 = 0;
        v45 = v44;
        v83 = v38;
        v84 = 3221225472;
        v85 = __35__PUFeedSettings__localizedStrings__block_invoke_6;
        v86 = &unk_1E589EDD8;
        v91 = v10;
        v92 = v43;
        v87 = v45;
        v88 = CFSTR("Mary & John's Adventures");
        v89 = v16;
        v90 = v74;
        v46 = v45;
        PXDebugEnumerateInterestingPhotosOrVideosCountsToLocalize();

      }
      v39 = objc_msgSend(&unk_1E59B9FB8, "countByEnumeratingWithState:objects:count:", &v93, v136, 16);
    }
    while (v39);
  }
  v65[2](v65, CFSTR("Post Attributions"));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v70 = objc_msgSend(&unk_1E59B9FD0, "countByEnumeratingWithState:objects:count:", &v79, v135, 16);
  if (v70)
  {
    v68 = *(_QWORD *)v80;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v80 != v68)
          objc_enumerationMutation(&unk_1E59B9FD0);
        v73 = v48;
        v49 = objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v48), "integerValue");
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v50 = objc_msgSend(&unk_1E59B9FE8, "countByEnumeratingWithState:objects:count:", &v75, v134, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v76;
          do
          {
            for (m = 0; m != v51; ++m)
            {
              if (*(_QWORD *)v76 != v52)
                objc_enumerationMutation(&unk_1E59B9FE8);
              v54 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * m);
              v55 = (void *)MEMORY[0x1E0CB3498];
              if (objc_msgSend(v54, "length"))
                v56 = v54;
              else
                v56 = 0;
              objc_msgSend(v55, "px_localizedAttributedStringForPostAttributionOfAssetWithDisplayType:postedByUserOrSubjectWithFullName:atDate:nameAttributes:dateAttributes:", v49, v56, v47, v74, v16);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v10 + 2))(v10, v57);

            }
            v51 = objc_msgSend(&unk_1E59B9FE8, "countByEnumeratingWithState:objects:count:", &v75, v134, 16);
          }
          while (v51);
        }
        v48 = v73 + 1;
      }
      while (v73 + 1 != v70);
      v70 = objc_msgSend(&unk_1E59B9FD0, "countByEnumeratingWithState:objects:count:", &v79, v135, 16);
    }
    while (v70);
  }
  v65[2](v65, CFSTR("Miscellaneous"));
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserJoiningStreamWithName:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("Mary & John's Adventures"), v16, v74);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v58);

  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:streamName:accepted:defaultTextAttributes:emphasizedTextAttributes:streamNameAttributes:", CFSTR("John Appleseed"), CFSTR("My Great Photos"), 1, v16, v74, v16);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v59);

  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserCreatingStreamWithName:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("Mary & John's Adventures"), v16, v74);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v10 + 2))(v10, v60);

  v61 = v63;
  return v61;
}

void __35__PUFeedSettings__localizedStrings__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0DC1138];
  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = a2;
  objc_msgSend(v3, "systemFontOfSize:", 18.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\n%@\n\n"), v4, v12[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v7);
  objc_msgSend(v8, "appendAttributedString:", v11);

}

void __35__PUFeedSettings__localizedStrings__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", a2);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("(null)"));
    objc_msgSend(v3, "appendAttributedString:", v4);

  }
  v5 = *(void **)(a1 + 32);
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  objc_msgSend(v5, "appendAttributedString:", v6);

}

void __35__PUFeedSettings__localizedStrings__block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserPostWithPhotoCount:videoCount:defaultTextAttributes:emphasizedTextAttributes:", a2, a3, a1[4], a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __35__PUFeedSettings__localizedStrings__block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForPostWithSubjectFullName:photoCount:videoCount:defaultTextAttributes:emphasizedTextAttributes:", CFSTR("John Appleseed"), a2, a3, a1[4], a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __35__PUFeedSettings__localizedStrings__block_invoke_5(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", 2);
  v11 = v6;
  if (a2 >= 1)
  {
    do
    {
      objc_msgSend(v6, "addObject:", &unk_1E59BAFE0);
      v6 = v11;
      --a2;
    }
    while (a2);
  }
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(v6, "addObject:", &unk_1E59BAFF8);
      v6 = v11;
      --a3;
    }
    while (a3);
  }
  v7 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserPostWithCountsSet:subjectName:defaultTextAttributes:posterTextAttributes:", v6, 0, a1[4], a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  v9 = a1[6];
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserPostWithCountsSet:subjectName:defaultTextAttributes:posterTextAttributes:", v11, CFSTR("John Appleseed"), a1[4], a1[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

void __35__PUFeedSettings__localizedStrings__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForLikesFromUser:orPersonFullName:photoCount:videoCount:streamName:defaultTextAttributes:emphasizedTextAttributes:italicizedTextAttributes:", *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 32), a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __42__PUFeedSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_localizedStrings");
}

void __32__PUFeedSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_27692;
  sharedInstance_sharedInstance_27692 = v0;

}

@end
