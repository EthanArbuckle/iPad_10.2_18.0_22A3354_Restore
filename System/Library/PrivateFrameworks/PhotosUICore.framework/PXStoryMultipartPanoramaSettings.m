@implementation PXStoryMultipartPanoramaSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryMultipartPanoramaSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXStoryMultipartPanoramaSettings setIsFeatureEnabled:](self, "setIsFeatureEnabled:", _os_feature_enabled_impl());
  -[PXStoryMultipartPanoramaSettings setMaximumNumberOfParts:](self, "setMaximumNumberOfParts:", 3);
  -[PXStoryMultipartPanoramaSettings setOverlappingTileCount:](self, "setOverlappingTileCount:", 7);
  -[PXStoryMultipartPanoramaSettings setMaximumTileSide:](self, "setMaximumTileSide:", 300.0);
  -[PXStoryMultipartPanoramaSettings setTileOverlapThreshold:](self, "setTileOverlapThreshold:", 0.6);
  -[PXStoryMultipartPanoramaSettings setProductionSimulatedDelay:](self, "setProductionSimulatedDelay:", 0.0);
  -[PXStoryMultipartPanoramaSettings setProductionReportsTimeInterval:](self, "setProductionReportsTimeInterval:", 1.0);
}

- (void)setTileOverlapThreshold:(double)a3
{
  self->_tileOverlapThreshold = a3;
}

- (void)setProductionSimulatedDelay:(double)a3
{
  self->_productionSimulatedDelay = a3;
}

- (void)setProductionReportsTimeInterval:(double)a3
{
  self->_productionReportsTimeInterval = a3;
}

- (void)setOverlappingTileCount:(int64_t)a3
{
  self->_overlappingTileCount = a3;
}

- (void)setMaximumTileSide:(double)a3
{
  self->_maximumTileSide = a3;
}

- (void)setMaximumNumberOfParts:(int64_t)a3
{
  self->_maximumNumberOfParts = a3;
}

- (void)setIsFeatureEnabled:(BOOL)a3
{
  self->_isFeatureEnabled = a3;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
}

- (BOOL)isFeatureEnabled
{
  return self->_isFeatureEnabled;
}

- (int64_t)maximumNumberOfParts
{
  return self->_maximumNumberOfParts;
}

- (int64_t)overlappingTileCount
{
  return self->_overlappingTileCount;
}

- (double)maximumTileSide
{
  return self->_maximumTileSide;
}

- (double)tileOverlapThreshold
{
  return self->_tileOverlapThreshold;
}

- (double)productionSimulatedDelay
{
  return self->_productionSimulatedDelay;
}

- (double)productionReportsTimeInterval
{
  return self->_productionReportsTimeInterval;
}

+ (PXStoryMultipartPanoramaSettings)sharedInstance
{
  if (sharedInstance_onceToken_171689 != -1)
    dispatch_once(&sharedInstance_onceToken_171689, &__block_literal_global_171690);
  return (PXStoryMultipartPanoramaSettings *)(id)sharedInstance_sharedInstance_171691;
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
  _QWORD v42[7];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_isFeatureEnabled);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Enabled"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v40;
  v4 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maximumNumberOfParts);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Maximum Parts"), v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "minValue:maxValue:", 1.0, 10.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "px_increment:", 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v36;
  v5 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_overlappingTileCount);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Overlapping Tiles"), v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "minValue:maxValue:", 1.0, 10.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "px_increment:", 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v32;
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_maximumTileSide);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Maximum Tile Side"), v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minValue:maxValue:", 10.0, 1000.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "px_increment:", 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v28;
  v7 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_tileOverlapThreshold);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Overlap Threshold"), v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "px_increment:", 0.1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v24;
  v8 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_productionSimulatedDelay);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Simulated Delay"), v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minValue:maxValue:", 0.0, 5.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "px_increment:", 0.1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v9;
  v10 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_productionReportsTimeInterval);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Report Time Interval"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 5.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "px_increment:", 0.1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v15, CFSTR("Settings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v16;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Multipart Panoramas"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __50__PXStoryMultipartPanoramaSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "multipartPanoramaSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_171691;
  sharedInstance_sharedInstance_171691 = v0;

}

@end
