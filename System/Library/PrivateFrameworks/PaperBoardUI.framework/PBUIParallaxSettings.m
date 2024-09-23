@implementation PBUIParallaxSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIParallaxSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PBUIParallaxSettings setSlideEnabled:](self, "setSlideEnabled:", 1);
  -[PBUIParallaxSettings setSlideDirectionX:](self, "setSlideDirectionX:", 1);
  -[PBUIParallaxSettings setSlideDirectionY:](self, "setSlideDirectionY:", 1);
  -[PBUIParallaxSettings setSlidePixelsX:](self, "setSlidePixelsX:", 10.0);
  -[PBUIParallaxSettings setSlidePixelsY:](self, "setSlidePixelsY:", 10.0);
  -[PBUIParallaxSettings setTiltEnabled:](self, "setTiltEnabled:", 0);
  -[PBUIParallaxSettings setTiltDirectionX:](self, "setTiltDirectionX:", 1);
  -[PBUIParallaxSettings setTiltDirectionY:](self, "setTiltDirectionY:", 1);
  -[PBUIParallaxSettings setTiltDegreesX:](self, "setTiltDegreesX:", 0.0);
  -[PBUIParallaxSettings setTiltDegreesY:](self, "setTiltDegreesY:", 0.0);
  -[PBUIParallaxSettings setDistanceFromScreen:](self, "setDistanceFromScreen:", 0);
  -[PBUIParallaxSettings setIncreaseEnabled:](self, "setIncreaseEnabled:", 0);
  -[PBUIParallaxSettings setSlideIncreaseX:](self, "setSlideIncreaseX:", 0.0);
  -[PBUIParallaxSettings setSlideIncreaseY:](self, "setSlideIncreaseY:", 0.0);
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
  _QWORD v55[4];
  _QWORD v56[3];
  void *v57;
  _QWORD v58[5];
  _QWORD v59[7];

  v59[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Slide enabled"), CFSTR("slideEnabled"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v53;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal direction"), CFSTR("slideDirectionX"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "possibleValues:titles:", &unk_1E6BC33B8, &unk_1E6BC33D0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "conditionFormat:", CFSTR("slideEnabled != 0"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v44;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal offset (pixels)"), CFSTR("slidePixelsX"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "between:and:", 0.0, 200.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "precision:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conditionFormat:", CFSTR("slideEnabled != 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v3;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Vertical direction"), CFSTR("slideDirectionY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "possibleValues:titles:", &unk_1E6BC33B8, &unk_1E6BC33D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conditionFormat:", CFSTR("slideEnabled != 0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v6;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical offset (pixels)"), CFSTR("slidePixelsY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 0.0, 200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "precision:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conditionFormat:", CFSTR("slideEnabled != 0"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v41, CFSTR("Slide"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Tilt enabled"), CFSTR("tiltEnabled"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v51;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal direction"), CFSTR("tiltDirectionX"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "possibleValues:titles:", &unk_1E6BC33B8, &unk_1E6BC33D0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "conditionFormat:", CFSTR("tiltEnabled != 0"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v43;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal rotation (degrees)"), CFSTR("tiltDegreesX"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "between:and:", 0.0, 90.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "precision:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "conditionFormat:", CFSTR("tiltEnabled != 0"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v12;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Vertical direction"), CFSTR("tiltDirectionY"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "possibleValues:titles:", &unk_1E6BC33B8, &unk_1E6BC33D0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conditionFormat:", CFSTR("tiltEnabled != 0"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v15;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical rotation (degrees)"), CFSTR("tiltDegreesY"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 90.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "precision:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "conditionFormat:", CFSTR("tiltEnabled != 0"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v20, CFSTR("Tilt"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Distance from screen"), CFSTR("distanceFromScreen"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "precision:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:conditionFormat:", v23, CFSTR("Perspective"), CFSTR("tiltEnabled != 0"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Lock effects enabled"), CFSTR("increaseEnabled"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v46;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal slide increase (px)"), CFSTR("slideIncreaseX"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 200.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "conditionFormat:", CFSTR("increaseEnabled != 0 && slideEnabled != 0"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v27;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical slide increase (px)"), CFSTR("slideIncreaseY"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 200.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "precision:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "conditionFormat:", CFSTR("increaseEnabled != 0 && slideEnabled != 0"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v32, CFSTR("Directional Lock Effects"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0D83078];
  v55[0] = v54;
  v55[1] = v52;
  v55[2] = v49;
  v55[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "moduleWithTitle:contents:", 0, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (BOOL)slideEnabled
{
  return self->_slideEnabled;
}

- (void)setSlideEnabled:(BOOL)a3
{
  self->_slideEnabled = a3;
}

- (int64_t)slideDirectionX
{
  return self->_slideDirectionX;
}

- (void)setSlideDirectionX:(int64_t)a3
{
  self->_slideDirectionX = a3;
}

- (int64_t)slideDirectionY
{
  return self->_slideDirectionY;
}

- (void)setSlideDirectionY:(int64_t)a3
{
  self->_slideDirectionY = a3;
}

- (double)slidePixelsX
{
  return self->_slidePixelsX;
}

- (void)setSlidePixelsX:(double)a3
{
  self->_slidePixelsX = a3;
}

- (double)slidePixelsY
{
  return self->_slidePixelsY;
}

- (void)setSlidePixelsY:(double)a3
{
  self->_slidePixelsY = a3;
}

- (BOOL)tiltEnabled
{
  return self->_tiltEnabled;
}

- (void)setTiltEnabled:(BOOL)a3
{
  self->_tiltEnabled = a3;
}

- (int64_t)tiltDirectionX
{
  return self->_tiltDirectionX;
}

- (void)setTiltDirectionX:(int64_t)a3
{
  self->_tiltDirectionX = a3;
}

- (int64_t)tiltDirectionY
{
  return self->_tiltDirectionY;
}

- (void)setTiltDirectionY:(int64_t)a3
{
  self->_tiltDirectionY = a3;
}

- (double)tiltDegreesX
{
  return self->_tiltDegreesX;
}

- (void)setTiltDegreesX:(double)a3
{
  self->_tiltDegreesX = a3;
}

- (double)tiltDegreesY
{
  return self->_tiltDegreesY;
}

- (void)setTiltDegreesY:(double)a3
{
  self->_tiltDegreesY = a3;
}

- (int64_t)distanceFromScreen
{
  return self->_distanceFromScreen;
}

- (void)setDistanceFromScreen:(int64_t)a3
{
  self->_distanceFromScreen = a3;
}

- (BOOL)increaseEnabled
{
  return self->_increaseEnabled;
}

- (void)setIncreaseEnabled:(BOOL)a3
{
  self->_increaseEnabled = a3;
}

- (double)slideIncreaseX
{
  return self->_slideIncreaseX;
}

- (void)setSlideIncreaseX:(double)a3
{
  self->_slideIncreaseX = a3;
}

- (double)slideIncreaseY
{
  return self->_slideIncreaseY;
}

- (void)setSlideIncreaseY:(double)a3
{
  self->_slideIncreaseY = a3;
}

@end
