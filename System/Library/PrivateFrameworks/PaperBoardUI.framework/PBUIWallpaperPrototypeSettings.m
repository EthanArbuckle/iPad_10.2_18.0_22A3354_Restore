@implementation PBUIWallpaperPrototypeSettings

- (id)parallaxSettingsForVariant:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2)
    return 0;
  else
    return *(id *)((char *)&self->super.super.isa + *off_1E6B96D98[a3 + 1]);
}

- (void)setDefaultValues
{
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
  double v25;
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
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)PBUIWallpaperPrototypeSettings;
  -[PTSettings setDefaultValues](&v47, sel_setDefaultValues);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSlideEnabled:", 1);

  -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSlideDirectionX:", -1);

  -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSlideDirectionY:", -1);

  -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4 == 1)
  {
    objc_msgSend(v8, "setSlidePixelsX:", 30.0);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSlidePixelsY:", 40.0);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTiltEnabled:", 1);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTiltDirectionX:", -1);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTiltDirectionY:", -1);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTiltDegreesX:", 3.3);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTiltDegreesY:", 5.7);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDistanceFromScreen:", -100);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIncreaseEnabled:", 1);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSlideIncreaseY:", 50.0);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSlideEnabled:", 1);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSlideDirectionX:", -1);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSlideDirectionY:", -1);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSlidePixelsX:", 60.0);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 80.0;
  }
  else
  {
    objc_msgSend(v8, "setSlidePixelsX:", 10.0);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSlidePixelsY:", 12.0);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTiltEnabled:", 1);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTiltDirectionX:", -1);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTiltDirectionY:", -1);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTiltDegreesX:", 3.3);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTiltDegreesY:", 5.7);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDistanceFromScreen:", -100);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIncreaseEnabled:", 1);

    -[PBUIWallpaperPrototypeSettings homeScreenParallaxSettings](self, "homeScreenParallaxSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setSlideIncreaseY:", 50.0);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSlideEnabled:", 1);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setSlideDirectionX:", -1);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSlideDirectionY:", -1);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSlidePixelsX:", 30.0);

    -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 40.0;
  }
  objc_msgSend(v23, "setSlidePixelsY:", v25);

  -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTiltEnabled:", 1);

  -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTiltDirectionX:", -1);

  -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTiltDirectionY:", -1);

  -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTiltDegreesX:", 3.3);

  -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTiltDegreesY:", 5.7);

  -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setDistanceFromScreen:", -100);

  -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setIncreaseEnabled:", 1);

  -[PBUIWallpaperPrototypeSettings lockScreenParallaxSettings](self, "lockScreenParallaxSettings");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setSlideIncreaseY:", 50.0);

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
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Home Screen Parallax"), CFSTR("homeScreenParallaxSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Lock Screen Parallax"), CFSTR("lockScreenParallaxSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:action:", CFSTR("Restore Defaults"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:outletKeyPath:", CFSTR("Set Default Wallpaper (Kills SpringBoard)"), CFSTR("resetWallpaperOutlet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D83078];
  v16[0] = v5;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moduleWithTitle:contents:", CFSTR("Wallpaper"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (PTOutlet)resetWallpaperOutlet
{
  return self->_resetWallpaperOutlet;
}

- (void)setResetWallpaperOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_resetWallpaperOutlet, a3);
}

- (PBUIWallpaperParallaxSettings)homeScreenParallaxSettings
{
  return self->_homeScreenParallaxSettings;
}

- (void)setHomeScreenParallaxSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenParallaxSettings, a3);
}

- (PBUIWallpaperParallaxSettings)lockScreenParallaxSettings
{
  return self->_lockScreenParallaxSettings;
}

- (void)setLockScreenParallaxSettings:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenParallaxSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenParallaxSettings, 0);
  objc_storeStrong((id *)&self->_homeScreenParallaxSettings, 0);
  objc_storeStrong((id *)&self->_resetWallpaperOutlet, 0);
}

@end
