@implementation SBBestAppSuggestion

- (NSUUID)uniqueIdentifier
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (NSString)activityType
{
  return 0;
}

- (NSDate)lastUpdateTime
{
  return 0;
}

- (NSString)originatingDeviceIdentifier
{
  return 0;
}

- (NSString)originatingDeviceName
{
  return 0;
}

- (NSString)originatingDeviceType
{
  return 0;
}

- (NSString)originatingBundleIdentifier
{
  return 0;
}

- (NSURL)launchURL
{
  return 0;
}

- (NSString)suggestedLocationName
{
  return 0;
}

- (BOOL)isNotificationSuggestion
{
  return 0;
}

- (BOOL)isOpenURLSuggestion
{
  return 0;
}

- (BOOL)isCallContinuitySuggestion
{
  return 0;
}

- (BOOL)isLocallyGeneratedSuggestion
{
  return 0;
}

- (BOOL)launchURLRequiresInboxCopy
{
  return 0;
}

- (id)makeInboxCopyOfLaunchURLToInboxURL:(id)a3
{
  return 0;
}

- (BOOL)isSiriSuggestion
{
  void *v2;
  char v3;

  -[SBBestAppSuggestion bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Siri"));

  return v3;
}

- (BOOL)isLocationBasedSuggestion
{
  return 0;
}

- (BOOL)isEligibleForLockScreen
{
  return 1;
}

- (BOOL)isPrediction
{
  return 0;
}

- (BOOL)isHeadphonesPrediction
{
  return 0;
}

- (BOOL)isBluetoothPrediction
{
  return 0;
}

- (BOOL)isBluetoothAudioPrediction
{
  return 0;
}

- (BOOL)isCarPlayPrediction
{
  return 0;
}

- (BOOL)isFirstWakePrediction
{
  return 0;
}

- (BOOL)isArrivedAtWorkPrediction
{
  return 0;
}

- (BOOL)isArrivedAtHomePrediction
{
  return 0;
}

- (BOOL)isLocationPredictionOfType:(unint64_t)a3
{
  return 0;
}

- (BOOL)isLocationPredictionFromSource:(unint64_t)a3
{
  return 0;
}

- (BOOL)isHandoff
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[16];
  _QWORD v44[18];

  v44[16] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBestAppSuggestion uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("uniqueIdentifier"));

  -[SBBestAppSuggestion bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("bundleIdentifier"));

  -[SBBestAppSuggestion activityType](self, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("activityType"));

  -[SBBestAppSuggestion lastUpdateTime](self, "lastUpdateTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("lastUpdateTime"));

  -[SBBestAppSuggestion originatingDeviceIdentifier](self, "originatingDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("originatingDeviceIdentifier"));

  -[SBBestAppSuggestion originatingDeviceName](self, "originatingDeviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("originatingDeviceName"));

  -[SBBestAppSuggestion originatingDeviceType](self, "originatingDeviceType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("originatingDeviceType"));

  -[SBBestAppSuggestion originatingBundleIdentifier](self, "originatingBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("originatingBundleIdentifier"));

  -[SBBestAppSuggestion suggestedLocationName](self, "suggestedLocationName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v3, "appendObject:withName:", v20, CFSTR("suggestedLocationName"));

  -[SBBestAppSuggestion launchURL](self, "launchURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v3, "appendObject:withName:", v22, CFSTR("launchURL"));

  v43[0] = CFSTR("isNotificationSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isNotificationSuggestion](self, "isNotificationSuggestion"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v42;
  v43[1] = CFSTR("isOpenURLSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isOpenURLSuggestion](self, "isOpenURLSuggestion"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v41;
  v43[2] = CFSTR("isCallContinuitySuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isCallContinuitySuggestion](self, "isCallContinuitySuggestion"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v40;
  v43[3] = CFSTR("isLocallyGeneratedSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isLocallyGeneratedSuggestion](self, "isLocallyGeneratedSuggestion"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v39;
  v43[4] = CFSTR("isEligibleForLockScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isEligibleForLockScreen](self, "isEligibleForLockScreen"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v38;
  v43[5] = CFSTR("isSiriSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isSiriSuggestion](self, "isSiriSuggestion"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v37;
  v43[6] = CFSTR("isLocationBasedSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isLocationBasedSuggestion](self, "isLocationBasedSuggestion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v36;
  v43[7] = CFSTR("isPrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isPrediction](self, "isPrediction"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v35;
  v43[8] = CFSTR("isHeadphonesPrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isHeadphonesPrediction](self, "isHeadphonesPrediction"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v24;
  v43[9] = CFSTR("isBluetoothPrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isBluetoothPrediction](self, "isBluetoothPrediction"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[9] = v25;
  v43[10] = CFSTR("isBluetoothAudioPrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isBluetoothAudioPrediction](self, "isBluetoothAudioPrediction"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[10] = v26;
  v43[11] = CFSTR("isCarPlayPrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isCarPlayPrediction](self, "isCarPlayPrediction"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[11] = v27;
  v43[12] = CFSTR("isFirstWakePrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isFirstWakePrediction](self, "isFirstWakePrediction"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[12] = v28;
  v43[13] = CFSTR("isArrivedAtWorkPrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isArrivedAtWorkPrediction](self, "isArrivedAtWorkPrediction"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44[13] = v29;
  v43[14] = CFSTR("isArrivedAtHomePrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isArrivedAtHomePrediction](self, "isArrivedAtHomePrediction"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[14] = v30;
  v43[15] = CFSTR("isHandoff");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBBestAppSuggestion isHandoff](self, "isHandoff"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44[15] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", v32, CFSTR("wat"), 0);

  objc_msgSend(v3, "build");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v33;
}

@end
