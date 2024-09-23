@implementation PUAirPlaySettings

- (void)setDefaultValues
{
  -[PUAirPlaySettings setIgnoreScreenRecordingScreens:](self, "setIgnoreScreenRecordingScreens:", MEMORY[0x1AF429AFC](-[PUAirPlaySettings setIgnoreMirroredScreens:](self, "setIgnoreMirroredScreens:", 0)));
  -[PUAirPlaySettings setCompensateForOverscan:](self, "setCompensateForOverscan:", 0);
  -[PUAirPlaySettings setPlaceholderForMirroredScreen:](self, "setPlaceholderForMirroredScreen:", 0);
  -[PUAirPlaySettings setPlaceholderForSecondScreen:](self, "setPlaceholderForSecondScreen:", 2);
  -[PUAirPlaySettings setMinimumZoomForScrollPadding:](self, "setMinimumZoomForScrollPadding:", 1.20000005);
  -[PUAirPlaySettings setMaximumZoomForScrollPadding:](self, "setMaximumZoomForScrollPadding:", 2.0);
  -[PUAirPlaySettings setSimulatedScreenContentWidth:](self, "setSimulatedScreenContentWidth:", 320.0);
  -[PUAirPlaySettings setSimulatedScreenContentHeight:](self, "setSimulatedScreenContentHeight:", 180.0);
  -[PUAirPlaySettings setRouteAvailabilityOverride:](self, "setRouteAvailabilityOverride:", 0);
  -[PUAirPlaySettings setSwitchToMediaPresentationMode:](self, "setSwitchToMediaPresentationMode:", 1);
}

- (void)setSimulatedScreenContentWidth:(double)a3
{
  self->_simulatedScreenContentWidth = a3;
}

- (void)setSimulatedScreenContentHeight:(double)a3
{
  self->_simulatedScreenContentHeight = a3;
}

- (void)setRouteAvailabilityOverride:(int64_t)a3
{
  self->_routeAvailabilityOverride = a3;
}

- (void)setPlaceholderForSecondScreen:(unint64_t)a3
{
  self->_placeholderForSecondScreen = a3;
}

- (void)setPlaceholderForMirroredScreen:(unint64_t)a3
{
  self->_placeholderForMirroredScreen = a3;
}

- (void)setMinimumZoomForScrollPadding:(double)a3
{
  self->_minimumZoomForScrollPadding = a3;
}

- (void)setMaximumZoomForScrollPadding:(double)a3
{
  self->_maximumZoomForScrollPadding = a3;
}

- (void)setIgnoreScreenRecordingScreens:(BOOL)a3
{
  self->_ignoreScreenRecordingScreens = a3;
}

- (void)setIgnoreMirroredScreens:(BOOL)a3
{
  self->_ignoreMirroredScreens = a3;
}

- (void)setCompensateForOverscan:(BOOL)a3
{
  self->_compensateForOverscan = a3;
}

- (void)setSwitchToMediaPresentationMode:(BOOL)a3
{
  self->_switchToMediaPresentationMode = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  unint64_t v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[PUAirPlaySettings description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUAirPlaySettings ignoreMirroredScreens](self, "ignoreMirroredScreens"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tIgnore mirrored screens: %@"), v6);
  if (-[PUAirPlaySettings ignoreScreenRecordingScreens](self, "ignoreScreenRecordingScreens"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tIgnore screen recording screens: %@"), v7);
  if (-[PUAirPlaySettings compensateForOverscan](self, "compensateForOverscan"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tCompensate for overscan: %@"), v8);
  v9 = -[PUAirPlaySettings placeholderForMirroredScreen](self, "placeholderForMirroredScreen");
  if (v9 > 2)
    v10 = 0;
  else
    v10 = off_1E589BD10[v9];
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tMirrored placeholder type: %@"), v10);
  v11 = -[PUAirPlaySettings placeholderForSecondScreen](self, "placeholderForSecondScreen");
  if (v11 > 2)
    v12 = 0;
  else
    v12 = off_1E589BD10[v11];
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tSecond-screen placeholder type: %@"), v12);
  -[PUAirPlaySettings minimumZoomForScrollPadding](self, "minimumZoomForScrollPadding");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tMin zoom for scroll padding: %f"), v13);
  -[PUAirPlaySettings maximumZoomForScrollPadding](self, "maximumZoomForScrollPadding");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tMax zoom for scroll padding: %f"), v14);
  return v5;
}

- (BOOL)ignoreMirroredScreens
{
  return self->_ignoreMirroredScreens;
}

- (BOOL)ignoreScreenRecordingScreens
{
  return self->_ignoreScreenRecordingScreens;
}

- (BOOL)compensateForOverscan
{
  return self->_compensateForOverscan;
}

- (unint64_t)placeholderForSecondScreen
{
  return self->_placeholderForSecondScreen;
}

- (unint64_t)placeholderForMirroredScreen
{
  return self->_placeholderForMirroredScreen;
}

- (double)minimumZoomForScrollPadding
{
  return self->_minimumZoomForScrollPadding;
}

- (double)maximumZoomForScrollPadding
{
  return self->_maximumZoomForScrollPadding;
}

- (BOOL)switchToMediaPresentationMode
{
  return self->_switchToMediaPresentationMode;
}

- (double)simulatedScreenContentWidth
{
  return self->_simulatedScreenContentWidth;
}

- (double)simulatedScreenContentHeight
{
  return self->_simulatedScreenContentHeight;
}

- (int64_t)routeAvailabilityOverride
{
  return self->_routeAvailabilityOverride;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7295 != -1)
    dispatch_once(&sharedInstance_onceToken_7295, &__block_literal_global_7296);
  return (id)sharedInstance_sharedInstance;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  void *v49;
  _QWORD v50[4];
  void *v51;
  _QWORD v52[2];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[8];

  v55[6] = *MEMORY[0x1E0C80C00];
  v46 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Ignore mirrored screens"), CFSTR("ignoreMirroredScreens"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v44;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Ignore screen recording screens"), CFSTR("ignoreScreenRecordingScreens"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v42;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Compensate for overscan"), CFSTR("compensateForOverscan"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v2;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Mirrored-screen placeholder"), CFSTR("placeholderForMirroredScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = CFSTR("None");
  v54[1] = CFSTR("No content");
  v54[2] = CFSTR("Last content");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E59B9CA0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v5;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Second-screen placeholder"), CFSTR("placeholderForSecondScreen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = CFSTR("None");
  v53[1] = CFSTR("No content");
  v53[2] = CFSTR("Last content");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possibleValues:titles:", &unk_1E59B9CB8, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v8;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable HDR (switch to media presentation mode)"), CFSTR("switchToMediaPresentationMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "sectionWithRows:title:", v10, CFSTR("AirPlay Screens"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Min zoom for scroll padding"), CFSTR("minimumZoomForScrollPadding"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 1.10000002, 1.79999995);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v13;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Max zoom for scroll padding"), CFSTR("maximumZoomForScrollPadding"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 1.79999995, 2.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v16, CFSTR("Browsing"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:output:", CFSTR("AirPlay debug info"), &__block_literal_global_75);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionWithRows:title:", v19, CFSTR("Debugging"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Toggle Simulated AirPlay Screen"), &__block_literal_global_82);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v41;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Width"), CFSTR("simulatedScreenContentWidth"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "minValue:maxValue:", 50.0, 500.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pu_increment:", 5.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v23;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Height"), CFSTR("simulatedScreenContentHeight"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "minValue:maxValue:", 50.0, 500.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pu_increment:", 5.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v26;
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Route Availability"), CFSTR("routeAvailabilityOverride"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "possibleValues:titles:", &unk_1E59B9CD0, &unk_1E59B9CE8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:title:", v29, CFSTR("Simulation"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D83078];
  v32 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:action:", CFSTR("Restore Defaults"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sectionWithRows:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0D83078];
  v48[0] = v47;
  v48[1] = v45;
  v48[2] = v43;
  v48[3] = v30;
  v48[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "moduleWithTitle:contents:", CFSTR("AirPlay Settings"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

void __45__PUAirPlaySettings_settingsControllerModule__block_invoke_2()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v0 = (void *)testerAirPlayScreenSimulator;
  if (!testerAirPlayScreenSimulator)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v1 = (void *)getPUTesterAirPlayScreenSimulatorClass_softClass;
    v17 = getPUTesterAirPlayScreenSimulatorClass_softClass;
    if (!getPUTesterAirPlayScreenSimulatorClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getPUTesterAirPlayScreenSimulatorClass_block_invoke;
      v13[3] = &unk_1E58AAEB0;
      v13[4] = &v14;
      __getPUTesterAirPlayScreenSimulatorClass_block_invoke((uint64_t)v13);
      v1 = (void *)v15[3];
    }
    v2 = objc_retainAutorelease(v1);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(v2, "sharedSimulator");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)testerAirPlayScreenSimulator;
    testerAirPlayScreenSimulator = v3;

    v0 = (void *)testerAirPlayScreenSimulator;
  }
  v12 = v0;
  if ((objc_msgSend(v12, "isScreenVisible") & 1) != 0)
  {
    objc_msgSend(v12, "hideScreen");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "pu_firstViewControllerPassingTest:", &__block_literal_global_85);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "simulatedScreenContentWidth");
    v8 = v7;
    +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "simulatedScreenContentHeight");
    v11 = v10;

    objc_msgSend(v12, "showScreenWithContentSize:contentProvider:", v5, v8, v11);
  }

}

uint64_t __45__PUAirPlaySettings_settingsControllerModule__block_invoke_3()
{
  return objc_opt_respondsToSelector() & 1;
}

id __45__PUAirPlaySettings_settingsControllerModule__block_invoke()
{
  void *v0;
  void *v1;

  +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void __35__PUAirPlaySettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "airPlaySettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

@end
