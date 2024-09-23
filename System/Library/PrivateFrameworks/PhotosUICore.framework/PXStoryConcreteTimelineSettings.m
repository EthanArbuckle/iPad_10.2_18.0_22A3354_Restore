@implementation PXStoryConcreteTimelineSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryConcreteTimelineSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXStoryConcreteTimelineSettings setKenBurnsPanSpeed:](self, "setKenBurnsPanSpeed:", 10.0);
  -[PXStoryConcreteTimelineSettings setKenBurnsScaleSpeed:](self, "setKenBurnsScaleSpeed:", 10.0);
  -[PXStoryConcreteTimelineSettings setKenBurnsRotationSpeed:](self, "setKenBurnsRotationSpeed:", 3.0);
  -[PXStoryConcreteTimelineSettings setKenBurnsScaleSpeedDuringRotation:](self, "setKenBurnsScaleSpeedDuringRotation:", 5.0);
  -[PXStoryConcreteTimelineSettings setInitialProductionCountLimit:](self, "setInitialProductionCountLimit:", 1);
  -[PXStoryConcreteTimelineSettings setInitialProductionTimeLimit:](self, "setInitialProductionTimeLimit:", 0.0);
  -[PXStoryConcreteTimelineSettings setRotationInitialProductionCountLimit:](self, "setRotationInitialProductionCountLimit:", 0);
  -[PXStoryConcreteTimelineSettings setRotationInitialProductionTimeLimit:](self, "setRotationInitialProductionTimeLimit:", 0.05);
  -[PXStoryConcreteTimelineSettings setSubsequentProductionTimeLimit:](self, "setSubsequentProductionTimeLimit:", 1.0);
}

- (void)setSubsequentProductionTimeLimit:(double)a3
{
  self->_subsequentProductionTimeLimit = a3;
}

- (void)setRotationInitialProductionTimeLimit:(double)a3
{
  self->_rotationInitialProductionTimeLimit = a3;
}

- (void)setRotationInitialProductionCountLimit:(int64_t)a3
{
  self->_rotationInitialProductionCountLimit = a3;
}

- (void)setKenBurnsScaleSpeedDuringRotation:(double)a3
{
  self->_kenBurnsScaleSpeedDuringRotation = a3;
}

- (void)setKenBurnsScaleSpeed:(double)a3
{
  self->_kenBurnsScaleSpeed = a3;
}

- (void)setKenBurnsRotationSpeed:(double)a3
{
  self->_kenBurnsRotationSpeed = a3;
}

- (void)setKenBurnsPanSpeed:(double)a3
{
  self->_kenBurnsPanSpeed = a3;
}

- (void)setInitialProductionTimeLimit:(double)a3
{
  self->_initialProductionTimeLimit = a3;
}

- (void)setInitialProductionCountLimit:(int64_t)a3
{
  self->_initialProductionCountLimit = a3;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
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
  _QWORD v58[5];
  _QWORD v59[4];
  _QWORD v60[5];

  v60[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v31 = (id)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_kenBurnsPanSpeed);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Pan Speed (pt/s)"), v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "minValue:maxValue:", 0.0, 200.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "px_increment:", 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v54;
  v4 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_kenBurnsScaleSpeed);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Scale Speed (pt/s at furthest edge)"), v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "minValue:maxValue:", 0.0, 200.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "px_increment:", 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v50;
  v5 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_kenBurnsRotationSpeed);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Rotation Speed (°/s)"), v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minValue:maxValue:", 0.0, 30.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "px_increment:", 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v46;
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_kenBurnsScaleSpeedDuringRotation);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Scale Speed during Rotation (pt/s at furthest edge)"), v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "minValue:maxValue:", 0.0, 200.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "px_increment:", 1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v41, CFSTR("Movements"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v40;
  v27 = (void *)MEMORY[0x1E0D83078];
  v7 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_initialProductionCountLimit);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Initial Count"), v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "minValue:maxValue:", 0.0, 50.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "px_increment:", 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v36;
  v8 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_initialProductionTimeLimit);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Initial Time"), v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "minValue:maxValue:", 0.0, 0.1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "px_increment:", 0.005);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v30;
  v9 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_rotationInitialProductionCountLimit);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Rotation Initial Count"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minValue:maxValue:", 0.0, 50.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "px_increment:", 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v25;
  v10 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_rotationInitialProductionTimeLimit);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Rotation Initial Time"), v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minValue:maxValue:", 0.0, 0.1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "px_increment:", 0.005);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v12;
  v13 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_subsequentProductionTimeLimit);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Subsequent Time"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minValue:maxValue:", 0.0, 2.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "px_increment:", 0.1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sectionWithRows:title:", v18, CFSTR("Production Limits"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v19;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "moduleWithTitle:contents:", CFSTR("Concrete Timeline"), v21);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
}

- (double)kenBurnsPanSpeed
{
  return self->_kenBurnsPanSpeed;
}

- (double)kenBurnsScaleSpeed
{
  return self->_kenBurnsScaleSpeed;
}

- (double)kenBurnsRotationSpeed
{
  return self->_kenBurnsRotationSpeed;
}

- (double)kenBurnsScaleSpeedDuringRotation
{
  return self->_kenBurnsScaleSpeedDuringRotation;
}

- (int64_t)initialProductionCountLimit
{
  return self->_initialProductionCountLimit;
}

- (double)initialProductionTimeLimit
{
  return self->_initialProductionTimeLimit;
}

- (int64_t)rotationInitialProductionCountLimit
{
  return self->_rotationInitialProductionCountLimit;
}

- (double)rotationInitialProductionTimeLimit
{
  return self->_rotationInitialProductionTimeLimit;
}

- (double)subsequentProductionTimeLimit
{
  return self->_subsequentProductionTimeLimit;
}

+ (PXStoryConcreteTimelineSettings)sharedInstance
{
  if (sharedInstance_onceToken_222276 != -1)
    dispatch_once(&sharedInstance_onceToken_222276, &__block_literal_global_222277);
  return (PXStoryConcreteTimelineSettings *)(id)sharedInstance_sharedInstance_222278;
}

void __49__PXStoryConcreteTimelineSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "concreteTimelineSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_222278;
  sharedInstance_sharedInstance_222278 = v0;

}

@end
