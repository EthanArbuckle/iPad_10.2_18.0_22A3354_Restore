@implementation SBNotificationCenterDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "useDuetRecommendations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBNotificationCenterUseDuet"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "batteryWidgetAlwaysAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBBatteryWidgetAlwaysAvailable"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "widgetSnapshottingEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBWidgetSnapshottingEnabled"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "widgetLoggingEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBWidgetLogging"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showWidgetSnapshotDebugLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBWidgetSnapshotDebugLabels"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didPurgeNonCAMLSnapshots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("SBDidPurgeNonCAMLSnapshots"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "didPurgeNonASTCSnapshots");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("SBDidPurgeNonASTCSnapshots"), v6, 1);

}

@end
