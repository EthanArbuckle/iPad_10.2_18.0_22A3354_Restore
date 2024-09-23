@implementation VKCInternalSettings

+ (NSUserDefaults)defaults
{
  if (defaults_onceToken != -1)
    dispatch_once(&defaults_onceToken, &__block_literal_global_40);
  return (NSUserDefaults *)(id)defaults_sDefaults;
}

void __31__VKCInternalSettings_defaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.VisionKit.InternalSettings"));
  v1 = (void *)defaults_sDefaults;
  defaults_sDefaults = v0;

}

+ (id)settingsValueForKey:(id)a3
{
  NSString *v4;
  SEL v5;
  void *v6;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR("SettingsValue"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSSelectorFromString(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "performSelector:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (double)scaleMultiplier
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("scaleMultiplier"), 3.0);
  return result;
}

+ (double)sharpMinOpacity
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("sharpMinOpacity"), 1.0);
  return result;
}

+ (double)sharpMaxThickness
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("sharpMaxThickness"), 1.5);
  return result;
}

+ (double)sharpBlurRadius
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("sharpBlurRadius"), 1.5);
  return result;
}

+ (double)blurMinOpacity
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("blurMinOpacity"), 0.1);
  return result;
}

+ (double)blurMaxThickness
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("blurMaxThickness"), 16.0);
  return result;
}

+ (double)blurBlurRadius
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("blurBlurRadius"), 20.0);
  return result;
}

+ (BOOL)isCGImageForMadEnabled
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("useCGImageForMad"), 1);
}

+ (BOOL)addRandomArtificalAnalysisDelay
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("addRandomArtificalAnalysisDelay"), 0);
}

+ (double)randomDelayStartValue
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("randomDelayStartValue"), 0.0);
  return result;
}

+ (double)randomDelayEndValue
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("randomDelayEndValue"), 3.0);
  return result;
}

+ (double)extraWindowPointTouchOffset
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("extraWindowSpaceTextOffset"), 10.0);
  return result;
}

+ (BOOL)debugMenuEnabled
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("debugMenuEnabled"), 0);
}

+ (double)visibleTextAreaButtonThreshold
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("visibleTextAreaButtonThreshold"), 10.0);
  return result;
}

+ (BOOL)alwaysShowTextSelectionBorders
{
  return 0;
}

+ (BOOL)overrideDeviceAvailability
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("overrideDeviceAvailability"), 0);
}

+ (BOOL)isPerformingAutomatedTest
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("isPerformingAutomatedTest"), 0);
}

+ (double)subjectDragLiftDelay
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("subjectDragLiftDelay"), 0.15);
  return result;
}

+ (double)subjectDragCancellationDelay
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("subjectDragCancellationDelay"), 0.55);
  return result;
}

+ (double)subjectAutomaticAnalysisDelay
{
  double result;

  objc_msgSend(a1, "floatForKey:withDefaultValue:", CFSTR("subjectAutomaticAnalysisDelay"), 1.0);
  return result;
}

+ (BOOL)addSubjectCropRectToPasteboard
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("addSubjectCropRectToPasteboard"), 0);
}

+ (BOOL)isOpticalFlowForTextEnabled
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("isOpticalFlowForTextEnabled"), 1);
}

+ (BOOL)shareHeicsCalloutEnabled
{
  return objc_msgSend(a1, "BOOLForKey:withDefaultValue:", CFSTR("shareHeicsCalloutEnabled"), 1);
}

+ (id)scaleMultiplierSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "scaleMultiplier");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)sharpMinOpacitySettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "sharpMinOpacity");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)sharpMaxThicknessSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "sharpMaxThickness");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)sharpBlurRadiusSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "sharpBlurRadius");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)blurMinOpacitySettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "blurMinOpacity");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)blurMaxThicknessSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "blurMaxThickness");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)blurBlurRadiusSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "blurBlurRadius");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)isCGImageForMadEnabledSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isCGImageForMadEnabled"));
}

+ (id)isOpticalFlowForTextEnabledSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isOpticalFlowForTextEnabled"));
}

+ (id)addRandomArtificalAnalysisDelaySettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "addRandomArtificalAnalysisDelay"));
}

+ (id)randomDelayStartValueSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "randomDelayStartValue");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)randomDelayEndValueSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "randomDelayEndValue");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)extraWindowPointTouchOffsetSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "extraWindowPointTouchOffset");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)debugMenuEnabledSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "debugMenuEnabled"));
}

+ (id)visibleTextAreaButtonThresholdSettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "visibleTextAreaButtonThreshold");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)alwaysShowTextSelectionBordersSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "alwaysShowTextSelectionBorders"));
}

+ (id)overrideDeviceAvailabilitySettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "overrideDeviceAvailability"));
}

+ (id)isPerformingAutomatedTestSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isPerformingAutomatedTest"));
}

+ (id)subjectDragLiftDelaySettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "subjectDragLiftDelay");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)subjectDragCancellationDelaySettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "subjectDragCancellationDelay");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)subjectAutomaticAnalysisDelaySettingsValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "subjectAutomaticAnalysisDelay");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

+ (id)addSubjectCropRectToPasteboardSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "addSubjectCropRectToPasteboard"));
}

+ (id)shareHeicsCalloutEnabledSettingsValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "shareHeicsCalloutEnabled"));
}

+ (id)defaultsKeyForKey:(id)a3
{
  return (id)objc_msgSend(CFSTR("com.apple.VisionKit.InternalSettings"), "stringByAppendingPathExtension:", a3);
}

+ (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "defaultsKeyForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    a4 = objc_msgSend(v8, "BOOLValue");

  return a4;
}

+ (double)floatForKey:(id)a3 withDefaultValue:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  float v9;

  objc_msgSend(a1, "defaultsKeyForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    a4 = v9;
  }

  return a4;
}

@end
