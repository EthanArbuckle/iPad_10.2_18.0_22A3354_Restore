@implementation PXSwipeDownSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSwipeDownSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXSwipeDownSettings setHorizontalMotionType:](self, "setHorizontalMotionType:", 1);
  -[PXSwipeDownSettings setHorizontalResistanceDistance:](self, "setHorizontalResistanceDistance:", 100.0);
  -[PXSwipeDownSettings setDownMotionType:](self, "setDownMotionType:", 0);
  -[PXSwipeDownSettings setDownResistanceDistance:](self, "setDownResistanceDistance:", 200.0);
  -[PXSwipeDownSettings setUpMotionType:](self, "setUpMotionType:", 1);
  -[PXSwipeDownSettings setUpResistanceDistance:](self, "setUpResistanceDistance:", 100.0);
  -[PXSwipeDownSettings setScaleDownFactor:](self, "setScaleDownFactor:", 0.5);
  -[PXSwipeDownSettings setScaleDownDistance:](self, "setScaleDownDistance:", 200.0);
  -[PXSwipeDownSettings setRotationOnHorizontalMotion:](self, "setRotationOnHorizontalMotion:", 0);
  -[PXSwipeDownSettings setRotationHorizontalMotionFactor:](self, "setRotationHorizontalMotionFactor:", 50.0);
  -[PXSwipeDownSettings setRotationHorizontalMotionHysteresisDistance:](self, "setRotationHorizontalMotionHysteresisDistance:", 20.0);
  -[PXSwipeDownSettings setRotationOnVerticalMotion:](self, "setRotationOnVerticalMotion:", 0);
  -[PXSwipeDownSettings setRotationVerticalMotionAngle:](self, "setRotationVerticalMotionAngle:", 7.0);
  -[PXSwipeDownSettings setRotationVerticalMotionResistanceDistance:](self, "setRotationVerticalMotionResistanceDistance:", 400.0);
  -[PXSwipeDownSettings setRotationMaximumAngle:](self, "setRotationMaximumAngle:", 12.0);
  -[PXSwipeDownSettings setTransitionDistance:](self, "setTransitionDistance:", 400.0);
}

- (void)setUpResistanceDistance:(double)a3
{
  self->_upResistanceDistance = a3;
}

- (void)setUpMotionType:(int64_t)a3
{
  self->_upMotionType = a3;
}

- (void)setTransitionDistance:(double)a3
{
  self->_transitionDistance = a3;
}

- (void)setScaleDownFactor:(double)a3
{
  self->_scaleDownFactor = a3;
}

- (void)setScaleDownDistance:(double)a3
{
  self->_scaleDownDistance = a3;
}

- (void)setRotationVerticalMotionResistanceDistance:(double)a3
{
  self->_rotationVerticalMotionResistanceDistance = a3;
}

- (void)setRotationVerticalMotionAngle:(double)a3
{
  self->_rotationVerticalMotionAngle = a3;
}

- (void)setRotationOnVerticalMotion:(BOOL)a3
{
  self->_rotationOnVerticalMotion = a3;
}

- (void)setRotationOnHorizontalMotion:(BOOL)a3
{
  self->_rotationOnHorizontalMotion = a3;
}

- (void)setRotationMaximumAngle:(double)a3
{
  self->_rotationMaximumAngle = a3;
}

- (void)setRotationHorizontalMotionHysteresisDistance:(double)a3
{
  self->_rotationHorizontalMotionHysteresisDistance = a3;
}

- (void)setRotationHorizontalMotionFactor:(double)a3
{
  self->_rotationHorizontalMotionFactor = a3;
}

- (void)setHorizontalResistanceDistance:(double)a3
{
  self->_horizontalResistanceDistance = a3;
}

- (void)setHorizontalMotionType:(int64_t)a3
{
  self->_horizontalMotionType = a3;
}

- (void)setDownResistanceDistance:(double)a3
{
  self->_downResistanceDistance = a3;
}

- (void)setDownMotionType:(int64_t)a3
{
  self->_downMotionType = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)horizontalMotionType
{
  return self->_horizontalMotionType;
}

- (double)horizontalResistanceDistance
{
  return self->_horizontalResistanceDistance;
}

- (int64_t)downMotionType
{
  return self->_downMotionType;
}

- (double)downResistanceDistance
{
  return self->_downResistanceDistance;
}

- (int64_t)upMotionType
{
  return self->_upMotionType;
}

- (double)upResistanceDistance
{
  return self->_upResistanceDistance;
}

- (double)scaleDownFactor
{
  return self->_scaleDownFactor;
}

- (double)scaleDownDistance
{
  return self->_scaleDownDistance;
}

- (BOOL)rotationOnHorizontalMotion
{
  return self->_rotationOnHorizontalMotion;
}

- (double)rotationHorizontalMotionFactor
{
  return self->_rotationHorizontalMotionFactor;
}

- (double)rotationHorizontalMotionHysteresisDistance
{
  return self->_rotationHorizontalMotionHysteresisDistance;
}

- (BOOL)rotationOnVerticalMotion
{
  return self->_rotationOnVerticalMotion;
}

- (double)rotationVerticalMotionAngle
{
  return self->_rotationVerticalMotionAngle;
}

- (double)rotationVerticalMotionResistanceDistance
{
  return self->_rotationVerticalMotionResistanceDistance;
}

- (double)rotationMaximumAngle
{
  return self->_rotationMaximumAngle;
}

- (double)transitionDistance
{
  return self->_transitionDistance;
}

+ (PXSwipeDownSettings)sharedInstance
{
  if (sharedInstance_onceToken_99061 != -1)
    dispatch_once(&sharedInstance_onceToken_99061, &__block_literal_global_99062);
  return (PXSwipeDownSettings *)(id)sharedInstance_sharedInstance_99063;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[18];

  v62[16] = *MEMORY[0x1E0C80C00];
  v43 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Motion"), CFSTR("horizontalMotionType"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "possibleValues:titles:", &unk_1E53E94F8, &unk_1E53E9510);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v59;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Resistance Distance"), CFSTR("horizontalResistanceDistance"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "minValue:maxValue:", 10.0, 500.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "px_increment:", 10.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("horizontalMotionType == %@"), &unk_1E53ED020);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "condition:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v54;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Down Motion"), CFSTR("downMotionType"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "possibleValues:titles:", &unk_1E53E94F8, &unk_1E53E9510);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v52;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Down Resistance Distance"), CFSTR("downResistanceDistance"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "minValue:maxValue:", 10.0, 500.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "px_increment:", 10.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("downMotionType == %@"), &unk_1E53ED020);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "condition:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v47;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Up Motion"), CFSTR("upMotionType"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "possibleValues:titles:", &unk_1E53E94F8, &unk_1E53E9510);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v45;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Up Resistance Distance"), CFSTR("upResistanceDistance"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "minValue:maxValue:", 10.0, 500.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "px_increment:", 10.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("upMotionType == %@"), &unk_1E53ED020);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "condition:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v38;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Scale Down Factor"), CFSTR("scaleDownFactor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "px_increment:", 0.100000001);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v35;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Scale Down Distance"), CFSTR("scaleDownDistance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "minValue:maxValue:", 10.0, 500.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "px_increment:", 10.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v32;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Rotation on Horizontal Motion"), CFSTR("rotationOnHorizontalMotion"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v31;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Factor"), CFSTR("rotationHorizontalMotionFactor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minValue:maxValue:", 0.0, 300.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "px_increment:", 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "conditionFormat:", CFSTR("rotationOnHorizontalMotion != 0"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v27;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Hysteresis Distance"), CFSTR("rotationHorizontalMotionHysteresisDistance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 0.0, 100.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "px_increment:", 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "conditionFormat:", CFSTR("rotationOnHorizontalMotion != 0"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v23;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Rotation on Vertical Motion"), CFSTR("rotationOnVerticalMotion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v62[11] = v22;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Angle"), CFSTR("rotationVerticalMotionAngle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "minValue:maxValue:", 0.0, 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "px_increment:", 0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "conditionFormat:", CFSTR("rotationOnVerticalMotion != 0"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[12] = v18;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Distance"), CFSTR("rotationVerticalMotionResistanceDistance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minValue:maxValue:", 0.0, 500.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_increment:", 10.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conditionFormat:", CFSTR("rotationOnVerticalMotion != 0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62[13] = v4;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Angle"), CFSTR("rotationMaximumAngle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 45.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_increment:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62[14] = v7;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Transition Distance"), CFSTR("transitionDistance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 10.0, 500.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_increment:", 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62[15] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sectionWithRows:", v11);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83078];
  v61[0] = v44;
  v61[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Swipe Down"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __37__PXSwipeDownSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "swipeDownSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_99063;
  sharedInstance_sharedInstance_99063 = v0;

}

@end
