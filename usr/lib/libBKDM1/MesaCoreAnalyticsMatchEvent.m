@implementation MesaCoreAnalyticsMatchEvent

- (MesaCoreAnalyticsMatchEvent)initWithName:(id)a3
{
  MesaCoreAnalyticsMatchEvent *v3;
  MesaCoreAnalyticsMatchEvent *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)MesaCoreAnalyticsMatchEvent;
  v3 = -[MesaCoreAnalyticsEvent initWithName:](&v10, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (int)*MEMORY[0x24BE0CF50];
    objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + v5), "arrayByAddingObjectsFromArray:", &unk_251CB3BE0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(Class *)((char *)&v4->super.super.super.isa + v5);
    *(Class *)((char *)&v4->super.super.super.isa + v5) = (Class)v6;

  }
  else
  {
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "self = [super initWithName:eventName]";
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v19 = 1024;
      v20 = 612;
      _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

- (MesaCoreAnalyticsMatchEvent)init
{
  return -[MesaCoreAnalyticsMatchEvent initWithName:](self, "initWithName:", CFSTR("com.apple.biometrickit.mesa.matchAttempt"));
}

- (MesaCoreAnalyticsMatchEvent)initWithDictionary:(id)a3
{
  return -[BiometricKitCoreAnalyticsEvent initWithName:dictionary:](self, "initWithName:dictionary:", CFSTR("com.apple.biometrickit.mesa.matchAttempt"), a3);
}

- (void)reset
{
  NSNumber *v3;
  NSNumber *overallResult;
  NSNumber *wakeOnMenuPinUsed;
  NSNumber *templateUpdated;
  NSNumber *dirtOnSensor;
  NSNumber *bioLockout;
  NSNumber *requestFingerOff;
  NSNumber *preArmedMatch;
  NSNumber *captureRestartCount;
  NSNumber *capturedImageCount;
  NSNumber *acceptedImageCount;
  NSNumber *rejectedImageCount;
  NSNumber *rejectedImageUnknownCount;
  NSNumber *rejectedImageBadBlocksCount;
  NSNumber *rejectedImageChFPNCount;
  NSNumber *rejectedImageCaFPNCount;
  NSNumber *rejectedImageMovementCount;
  NSNumber *enrolledUsersCount;
  NSNumber *matchIdentityCount;
  NSNumber *failedUnlockAttempts;
  NSNumber *failedMatchAttempts;
  NSNumber *quickTapsCount;
  NSNumber *desenseMitigationPause;
  NSNumber *sensorResetCount;
  NSMutableArray *targetTemplateUUID;
  NSUUID *matchingTemplateUUID;
  NSNumber *tidButtonStateSequence;
  NSNumber *tidButtonStateSequenceBounded;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)MesaCoreAnalyticsMatchEvent;
  -[MesaCoreAnalyticsEvent reset](&v31, sel_reset);
  v3 = (NSNumber *)MEMORY[0x24BDBD1C0];
  -[MesaCoreAnalyticsMatchEvent setEventCanceled:](self, "setEventCanceled:", MEMORY[0x24BDBD1C0]);
  overallResult = self->_overallResult;
  self->_overallResult = v3;

  wakeOnMenuPinUsed = self->_wakeOnMenuPinUsed;
  self->_wakeOnMenuPinUsed = v3;

  templateUpdated = self->_templateUpdated;
  self->_templateUpdated = v3;

  dirtOnSensor = self->_dirtOnSensor;
  self->_dirtOnSensor = v3;

  bioLockout = self->_bioLockout;
  self->_bioLockout = v3;

  requestFingerOff = self->_requestFingerOff;
  self->_requestFingerOff = v3;

  preArmedMatch = self->_preArmedMatch;
  self->_preArmedMatch = v3;

  self->_valid = 1;
  self->_waitingForMatchResult = 0;
  self->_lastAcceptCondFeedback = 0;
  captureRestartCount = self->_captureRestartCount;
  self->_captureRestartCount = (NSNumber *)&unk_251CB3428;

  capturedImageCount = self->_capturedImageCount;
  self->_capturedImageCount = (NSNumber *)&unk_251CB3428;

  acceptedImageCount = self->_acceptedImageCount;
  self->_acceptedImageCount = (NSNumber *)&unk_251CB3428;

  rejectedImageCount = self->_rejectedImageCount;
  self->_rejectedImageCount = (NSNumber *)&unk_251CB3428;

  rejectedImageUnknownCount = self->_rejectedImageUnknownCount;
  self->_rejectedImageUnknownCount = (NSNumber *)&unk_251CB3428;

  rejectedImageBadBlocksCount = self->_rejectedImageBadBlocksCount;
  self->_rejectedImageBadBlocksCount = (NSNumber *)&unk_251CB3428;

  rejectedImageChFPNCount = self->_rejectedImageChFPNCount;
  self->_rejectedImageChFPNCount = (NSNumber *)&unk_251CB3428;

  rejectedImageCaFPNCount = self->_rejectedImageCaFPNCount;
  self->_rejectedImageCaFPNCount = (NSNumber *)&unk_251CB3428;

  rejectedImageMovementCount = self->_rejectedImageMovementCount;
  self->_rejectedImageMovementCount = (NSNumber *)&unk_251CB3428;

  enrolledUsersCount = self->_enrolledUsersCount;
  self->_enrolledUsersCount = (NSNumber *)&unk_251CB3428;

  matchIdentityCount = self->_matchIdentityCount;
  self->_matchIdentityCount = (NSNumber *)&unk_251CB3428;

  failedUnlockAttempts = self->_failedUnlockAttempts;
  self->_failedUnlockAttempts = (NSNumber *)&unk_251CB3428;

  failedMatchAttempts = self->_failedMatchAttempts;
  self->_failedMatchAttempts = (NSNumber *)&unk_251CB3428;

  quickTapsCount = self->_quickTapsCount;
  self->_quickTapsCount = (NSNumber *)&unk_251CB3428;

  desenseMitigationPause = self->_desenseMitigationPause;
  self->_desenseMitigationPause = v3;

  sensorResetCount = self->_sensorResetCount;
  self->_sensorResetCount = (NSNumber *)&unk_251CB3428;

  self->_acceptPrev = 0;
  -[MesaCoreAnalyticsEvent setDeviceGroupType:](self, "setDeviceGroupType:", &unk_251CB3440);
  targetTemplateUUID = self->_targetTemplateUUID;
  self->_targetTemplateUUID = 0;

  matchingTemplateUUID = self->_matchingTemplateUUID;
  self->_matchingTemplateUUID = 0;

  tidButtonStateSequence = self->_tidButtonStateSequence;
  self->_tidButtonStateSequence = (NSNumber *)&unk_251CB3428;

  tidButtonStateSequenceBounded = self->_tidButtonStateSequenceBounded;
  self->_tidButtonStateSequenceBounded = (NSNumber *)&unk_251CB3428;

  self->_buttonStateCount = 0;
}

- (void)setMatchModeWith:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSNumber *matchMode;
  NSNumber *v8;
  NSObject *v9;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDACB70];
  if (__osLog)
    v6 = __osLog;
  else
    v6 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsMatchEvent setMatchMode: %ld\n", (uint8_t *)&v10, 0xCu);
  }
  switch(a3)
  {
    case 0:
    case 2:
      goto LABEL_7;
    case 1:
      matchMode = self->_matchMode;
      v8 = (NSNumber *)&unk_251CB3458;
      break;
    case 3:
      matchMode = self->_matchMode;
      v8 = (NSNumber *)&unk_251CB3470;
      break;
    case 4:
      matchMode = self->_matchMode;
      v8 = (NSNumber *)&unk_251CB3488;
      break;
    case 5:
      matchMode = self->_matchMode;
      v8 = (NSNumber *)&unk_251CB34A0;
      break;
    default:
      if (__osLog)
        v9 = __osLog;
      else
        v9 = v5;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 134217984;
        v11 = a3;
        _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "MesaCoreAnalyticsMatchEvent unknown matchMode: %ld\n", (uint8_t *)&v10, 0xCu);
      }
LABEL_7:
      matchMode = self->_matchMode;
      v8 = (NSNumber *)&unk_251CB3410;
      break;
  }
  self->_matchMode = v8;

}

- (void)setMatchTypeWith:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSNumber *matchType;
  void *v9;
  int v10;
  NSNumber *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = v5;
    v12[0] = 67109120;
    v12[1] = objc_msgSend(v4, "userID");
    _os_log_impl(&dword_24B74E000, v6, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsMatchEvent setMatchType: %u\n", (uint8_t *)v12, 8u);

  }
  objc_msgSend(v4, "selectedIdentitiesBlob");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    matchType = self->_matchType;
    self->_matchType = (NSNumber *)&unk_251CB3470;

    objc_msgSend(v4, "selectedIdentitiesBlob");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsMatchEvent setTargetTemplates:](self, "setTargetTemplates:", v9);
  }
  else
  {
    v10 = objc_msgSend(v4, "userID");
    v9 = self->_matchType;
    if (v10 == -1)
      v11 = (NSNumber *)&unk_251CB3458;
    else
      v11 = (NSNumber *)&unk_251CB3410;
    self->_matchType = v11;
  }

}

- (void)setMatchResult:(id)a3 withDetails:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  int v11;
  NSNumber *v12;
  NSNumber *templateUpdated;
  NSNumber *v14;
  NSNumber *imageAbsoluteTimeId;
  NSNumber *v16;
  NSNumber *tidButtonState;
  NSNumber *v18;
  NSNumber *imageProblemClass;
  NSNumber *v20;
  NSNumber *wakeOnMenuPinUsed;
  NSNumber *v22;
  NSNumber *imagePixelOutlierCount;
  NSNumber *v24;
  NSNumber *imageContrast;
  NSNumber *v26;
  NSNumber *imageBrightness;
  NSNumber *v28;
  NSNumber *imageFeatureStrength;
  float v30;
  NSNumber *v31;
  NSNumber *imageContrastNorm;
  NSNumber *v33;
  NSNumber *imageBrightnessNorm;
  NSNumber *v35;
  NSNumber *imageFeatureStrengthNorm;
  NSNumber *fingerDetectEndTime;
  NSNumber *overallResult;
  NSNumber *matcherResult;
  NSUUID *v40;
  NSUUID *matchingTemplateUUID;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSNumber *bioLockout;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSNumber *dirtOnSensor;
  objc_class *v55;
  NSNumber *v56;
  void *v57;
  char v58;
  int v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (__osLog)
    v8 = __osLog;
  else
    v8 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v59 = 138412546;
    v60 = v6;
    v61 = 2112;
    v62 = v7;
    _os_log_impl(&dword_24B74E000, v8, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsMatchEvent setMatchResult: %@ withDetails: %@\n", (uint8_t *)&v59, 0x16u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchDetailImageMetadata"));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");

  self->_waitingForMatchResult = 0;
  if (v10)
  {
    v11 = *(_DWORD *)(v10 + 90);
    *(_OWORD *)&self->super._lastBioDevice.type = *(_OWORD *)(v10 + 74);
    *(_DWORD *)&self->super._lastBioDevice.uuid[12] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 57));
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    templateUpdated = self->_templateUpdated;
    self->_templateUpdated = v12;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(v10 + 59));
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageAbsoluteTimeId = self->_imageAbsoluteTimeId;
    self->_imageAbsoluteTimeId = v14;

    if (self->super._lastBioDevice.type <= 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 72));
      v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      tidButtonState = self->_tidButtonState;
      self->_tidButtonState = v16;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v10 + 31));
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      imageProblemClass = self->_imageProblemClass;
      self->_imageProblemClass = v18;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v10 + 71));
      v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      wakeOnMenuPinUsed = self->_wakeOnMenuPinUsed;
      self->_wakeOnMenuPinUsed = v20;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v10 + 27));
      v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      imagePixelOutlierCount = self->_imagePixelOutlierCount;
      self->_imagePixelOutlierCount = v22;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)(*(float *)(v10 + 15) * 1000.0));
      v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      imageContrast = self->_imageContrast;
      self->_imageContrast = v24;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)(*(float *)(v10 + 19) * 1000.0));
      v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      imageBrightness = self->_imageBrightness;
      self->_imageBrightness = v26;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)(*(float *)(v10 + 23) * 10000.0));
      v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      imageFeatureStrength = self->_imageFeatureStrength;
      self->_imageFeatureStrength = v28;

      v30 = *(float *)(v10 + 94);
      if (v30 > 0.0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)((float)(*(float *)(v10 + 15) / v30) * 1000.0));
        v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        imageContrastNorm = self->_imageContrastNorm;
        self->_imageContrastNorm = v31;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)((float)(*(float *)(v10 + 19) / *(float *)(v10 + 94)) * 1000.0));
        v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        imageBrightnessNorm = self->_imageBrightnessNorm;
        self->_imageBrightnessNorm = v33;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)((float)(*(float *)(v10 + 23) / *(float *)(v10 + 94)) * 10000.0));
        v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        imageFeatureStrengthNorm = self->_imageFeatureStrengthNorm;
        self->_imageFeatureStrengthNorm = v35;

      }
    }
  }
  if (self->_lastAcceptCondFeedback && !-[NSNumber unsignedIntValue](self->_acceptedImageCount, "unsignedIntValue"))
    -[MesaCoreAnalyticsMatchEvent acceptPreviousImage](self, "acceptPreviousImage");
  if (-[NSNumber BOOLValue](self->_wakeOnMenuPinUsed, "BOOLValue"))
  {
    if (!self->_fingerDetectEndTime)
    {
      -[MesaCoreAnalyticsEvent setFingerDetected:](self, "setFingerDetected:", MEMORY[0x24BDBD1C8]);
      fingerDetectEndTime = self->_fingerDetectEndTime;
      self->_fingerDetectEndTime = (NSNumber *)&unk_251CB3428;

    }
    if (!self->_firstCaptureEndTime)
    {
      self->_firstCaptureEndTime = (NSNumber *)&unk_251CB3428;

    }
  }
  overallResult = self->_overallResult;
  if (v6)
  {
    self->_overallResult = (NSNumber *)MEMORY[0x24BDBD1C8];

    matcherResult = self->_matcherResult;
    self->_matcherResult = (NSNumber *)&unk_251CB3410;

    objc_msgSend(v6, "uuid");
    v40 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    matchingTemplateUUID = self->_matchingTemplateUUID;
    self->_matchingTemplateUUID = v40;

    v42 = (void *)MEMORY[0x24BDD16E0];
    v43 = objc_alloc(MEMORY[0x24BDBCE48]);
    v44 = (void *)objc_msgSend(v43, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(v6, "creationTime");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "components:fromDate:toDate:options:", 16, v45, v46, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v47, "day"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitCoreAnalyticsEvent setTimeSinceLastEnrollment:](self, "setTimeSinceLastEnrollment:", v48);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchDetailResultIgnored"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = objc_msgSend(v49, "BOOLValue");

    if ((_DWORD)v48)
    {
      bioLockout = self->_matcherResult;
      self->_matcherResult = (NSNumber *)&unk_251CB34A0;
LABEL_28:

    }
  }
  else
  {
    self->_overallResult = (NSNumber *)MEMORY[0x24BDBD1C0];

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchDetailNoMatchReason"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "integerValue");

    if (v52 == 2)
    {
      v56 = self->_matcherResult;
      self->_matcherResult = (NSNumber *)&unk_251CB3488;

      v53 = 704;
      dirtOnSensor = self->_dirtOnSensor;
      v55 = (objc_class *)MEMORY[0x24BDBD1C8];
    }
    else
    {
      v53 = 424;
      dirtOnSensor = self->_matcherResult;
      if (v52 == 1)
        v55 = (objc_class *)&unk_251CB3488;
      else
        v55 = (objc_class *)&unk_251CB3458;
    }
    *(Class *)((char *)&self->super.super.super.isa + v53) = v55;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchDetailLockoutState"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "intValue");

    if ((v58 & 0x44) != 0)
    {
      bioLockout = self->_bioLockout;
      self->_bioLockout = (NSNumber *)MEMORY[0x24BDBD1C8];
      goto LABEL_28;
    }
  }

}

- (void)setEventCanceled:(id)a3
{
  objc_super v3;

  if (!self->_waitingForMatchResult)
  {
    v3.receiver = self;
    v3.super_class = (Class)MesaCoreAnalyticsMatchEvent;
    -[BiometricKitCoreAnalyticsEvent setEventCanceled:](&v3, sel_setEventCanceled_, a3);
  }
}

- (void)updateDailyValuesAfterMatch:(id)a3
{
  NSNumber *drxStrengthPctCol2Bin;
  NSNumber *drxStrengthPctCol7Bin;
  NSNumber *maxFingerToProbeAttenuationRaw;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  const __CFString *v14;
  unsigned int v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  const __CFString *v32;
  void *v33;
  int v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  id v39;

  v39 = a3;
  objc_msgSend(v39, "incrementCountField:", CFSTR("totalMatchAttempts"));
  objc_msgSend(v39, "setOperationTime:", self->_overallTime);
  objc_msgSend(v39, "setMatcherTime:", self->_matcherTime);
  objc_msgSend(v39, "setCaptureTime:", self->_captureTime);
  drxStrengthPctCol2Bin = self->_drxStrengthPctCol2Bin;
  if (drxStrengthPctCol2Bin)
    objc_msgSend(v39, "setDrxStrengthPctCol2:rawValue:", drxStrengthPctCol2Bin, self->_drxStrengthPctCol2Raw);
  drxStrengthPctCol7Bin = self->_drxStrengthPctCol7Bin;
  if (drxStrengthPctCol7Bin)
    objc_msgSend(v39, "setDrxStrengthPctCol7:rawValue:", drxStrengthPctCol7Bin, self->_drxStrengthPctCol7Raw);
  if (self->_temperatureBin)
    objc_msgSend(v39, "setTemperatureBin:");
  if (self->_FMRBin)
    objc_msgSend(v39, "setFMRBin:");
  if (self->_BSRBin)
    objc_msgSend(v39, "setBSRBin:");
  if (self->_fitDiffBin)
    objc_msgSend(v39, "setFitDiffBin:");
  if (self->_carrierAttenBin)
    objc_msgSend(v39, "setCarrierAttenBin:");
  if (self->_DRXAmpMinBin)
    objc_msgSend(v39, "setDRXAmpMinBin:");
  if (self->_DRXAmpMaxBin)
    objc_msgSend(v39, "setDRXAmpMaxBin:");
  if (self->_fitResEdge6SigmaBin)
    objc_msgSend(v39, "setFitResEdge6SigmaBin:");
  maxFingerToProbeAttenuationRaw = self->_maxFingerToProbeAttenuationRaw;
  if (maxFingerToProbeAttenuationRaw)
    objc_msgSend(v39, "setMaxFingerToProbeAttenuation:calculateAvg:", maxFingerToProbeAttenuationRaw, 1);
  if (self->_temperatureRaw)
    objc_msgSend(v39, "setTemperatureRaw:");
  if (self->_FMRRaw)
    objc_msgSend(v39, "setFMRRaw:");
  if (self->_BSRRaw)
    objc_msgSend(v39, "setBSRRaw:");
  if (self->_fitDiffRaw)
    objc_msgSend(v39, "setFitDiffRaw:");
  if (self->_carrierAttenRaw)
    objc_msgSend(v39, "setCarrierAttenRaw:");
  if (self->_DRXAmpMinRaw)
    objc_msgSend(v39, "setDRXAmpMinRaw:");
  if (self->_DRXAmpMaxRaw)
    objc_msgSend(v39, "setDRXAmpMaxRaw:");
  if (self->_fitResEdge6SigmaRaw)
    objc_msgSend(v39, "setFitResEdge6SigmaRaw:");
  if (self->_imagePixelOutlierCount)
    objc_msgSend(v39, "setImagePixelOutlierCount:");
  if (self->_numPxOutliersPhase1)
    objc_msgSend(v39, "setNumPxOutliersPhase1:");
  if (self->_numPxOutliersPhase2)
    objc_msgSend(v39, "setNumPxOutliersPhase2:");
  if (self->_artefactScore)
    objc_msgSend(v39, "setArtefactScore:");
  if (self->_artefactStrength)
    objc_msgSend(v39, "setArtefactStrength:");
  if (self->_artefactNonlinearity)
    objc_msgSend(v39, "setArtefactNonlinearity:");
  if (self->_artefactAnchorX)
    objc_msgSend(v39, "setArtefactAnchorX:");
  if (self->_artefactAnchorY)
    objc_msgSend(v39, "setArtefactAnchorY:");
  -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    objc_msgSend(v39, "incrementCountField:", CFSTR("totalMatchAttemptsFingerDetected"));
    if (-[NSNumber unsignedIntegerValue](self->_failedMatchAttempts, "unsignedIntegerValue") >= 2)
    {
      if (-[NSNumber unsignedIntegerValue](self->_failedMatchAttempts, "unsignedIntegerValue") != 2)
        goto LABEL_61;
      v9 = CFSTR("totalMatchOperationsFailedRetry");
    }
    else
    {
      v9 = CFSTR("totalMatchOperationsFingerDetected");
    }
    objc_msgSend(v39, "incrementCountField:", v9);
  }
LABEL_61:
  if (-[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
  {
    objc_msgSend(v39, "incrementCountField:", CFSTR("totalMatchAttemptsSuccessful"));
    objc_msgSend(v39, "setMatcherTimeMatch:", self->_matcherTime);
  }
  else
  {
    objc_msgSend(v39, "incrementCountField:", CFSTR("totalMatchAttemptsFailed"));
    objc_msgSend(v39, "setMatcherTimeNoMatch:", self->_matcherTime);
    -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
      objc_msgSend(v39, "incrementCountField:", CFSTR("totalMatchAttemptsFailedFingerDetected"));
  }
  if (-[NSNumber unsignedIntValue](self->_matchType, "unsignedIntValue") == 2)
  {
    objc_msgSend(v39, "incrementCountField:", CFSTR("subsetMatchAttempts"));
    -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
      objc_msgSend(v39, "incrementCountField:", CFSTR("subsetMatchAttemptsFingerDetected"));
    if (-[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
    {
      if (-[NSNumber unsignedIntValue](self->_matcherResult, "unsignedIntValue") == 4)
        v14 = CFSTR("subsetMatchAttemptsFailedTarget");
      else
        v14 = CFSTR("subsetMatchAttemptsSuccessful");
    }
    else
    {
      objc_msgSend(v39, "incrementCountField:", CFSTR("subsetMatchAttemptsFailed"));
      -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

      if ((v19 & 1) == 0)
        goto LABEL_96;
      v14 = CFSTR("subsetMatchAttemptsFailedFingerDetected");
    }
  }
  else
  {
    v15 = -[NSNumber unsignedIntValue](self->_matchMode, "unsignedIntValue");
    switch(v15)
    {
      case 4u:
        objc_msgSend(v39, "incrementCountField:", CFSTR("preArmMatchAttempts"));
        -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "BOOLValue");

        if (v21)
          objc_msgSend(v39, "incrementCountField:", CFSTR("preArmMatchAttemptsFingerDetected"));
        if (-[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
        {
          v14 = CFSTR("preArmMatchAttemptsSuccessful");
        }
        else
        {
          objc_msgSend(v39, "incrementCountField:", CFSTR("preArmMatchAttemptsFailed"));
          -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "BOOLValue");

          if (!v27)
            goto LABEL_96;
          v14 = CFSTR("preArmMatchAttemptsFailedFingerDetected");
        }
        break;
      case 2u:
        objc_msgSend(v39, "incrementCountField:", CFSTR("localAuthMatchAttempts"));
        -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "BOOLValue");

        if (v23)
          objc_msgSend(v39, "incrementCountField:", CFSTR("localAuthMatchAttemptsFingerDetected"));
        if (-[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
        {
          v14 = CFSTR("localAuthMatchAttemptsSuccessful");
        }
        else
        {
          objc_msgSend(v39, "incrementCountField:", CFSTR("localAuthMatchAttemptsFailed"));
          -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "BOOLValue");

          if ((v29 & 1) == 0)
            goto LABEL_96;
          v14 = CFSTR("localAuthMatchAttemptsFailedFingerDetected");
        }
        break;
      case 1u:
        objc_msgSend(v39, "incrementCountField:", CFSTR("unlockMatchAttempts"));
        -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        if (v17)
          objc_msgSend(v39, "incrementCountField:", CFSTR("unlockMatchAttemptsFingerDetected"));
        if (-[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
        {
          v14 = CFSTR("unlockMatchAttemptsSuccessful");
        }
        else
        {
          objc_msgSend(v39, "incrementCountField:", CFSTR("unlockMatchAttemptsFailed"));
          -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "BOOLValue");

          if ((v25 & 1) == 0)
            goto LABEL_96;
          v14 = CFSTR("unlockMatchAttemptsFailedFingerDetected");
        }
        break;
      default:
        goto LABEL_96;
    }
  }
  objc_msgSend(v39, "incrementCountField:", v14);
LABEL_96:
  if (-[NSNumber unsignedIntValue](self->_artefactDetectionResult, "unsignedIntValue"))
  {
    if (-[NSNumber unsignedIntValue](self->_artefactDetectionResult, "unsignedIntValue") != 1)
      goto LABEL_111;
    objc_msgSend(v39, "incrementCountField:", CFSTR("artefactMatchAttempts"));
    -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "BOOLValue");

    if (v31)
      objc_msgSend(v39, "incrementCountField:", CFSTR("artefactMatchAttemptsFingerDetected"));
    if (-[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
    {
      v32 = CFSTR("artefactMatchAttemptsSuccessful");
    }
    else
    {
      objc_msgSend(v39, "incrementCountField:", CFSTR("artefactMatchAttemptsFailed"));
      -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "BOOLValue");

      if (!v38)
        goto LABEL_111;
      v32 = CFSTR("artefactMatchAttemptsFailedFingerDetected");
    }
  }
  else
  {
    objc_msgSend(v39, "incrementCountField:", CFSTR("nonArtefactMatchAttempts"));
    -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "BOOLValue");

    if (v34)
      objc_msgSend(v39, "incrementCountField:", CFSTR("nonArtefactMatchAttemptsFingerDetected"));
    if (-[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
    {
      v32 = CFSTR("nonArtefactMatchAttemptsSuccessful");
    }
    else
    {
      objc_msgSend(v39, "incrementCountField:", CFSTR("nonArtefactMatchAttemptsFailed"));
      -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "BOOLValue");

      if ((v36 & 1) == 0)
        goto LABEL_111;
      v32 = CFSTR("nonArtefactMatchAttemptsFailedFingerDetected");
    }
  }
  objc_msgSend(v39, "incrementCountField:", v32);
LABEL_111:
  if (-[NSNumber BOOLValue](self->_bioLockout, "BOOLValue"))
    objc_msgSend(v39, "incrementCountField:", CFSTR("bioLockoutCount"));

}

- (BOOL)postEventAndUpdateDailyValues:(id)a3 enrolledIdentities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSNumber *sensorModulationRatio;
  void *v11;
  int v12;
  NSNumber *matcherEndTime;
  NSNumber *v14;
  NSNumber *overallTime;
  NSNumber *v16;
  NSNumber *overallTimeFingerOn;
  void *v18;
  NSNumber *fingerDetectEndTime;
  unint64_t buttonStateCount;
  NSNumber *v21;
  NSNumber *capturedImageCount;
  NSNumber *matcherResult;
  NSNumber *v24;
  NSNumber *v25;
  NSNumber *firstCaptureEndTimeToFirstMatcherEndTime;
  void *v27;
  BOOL v28;
  NSObject *v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_valid || self->_waitingForMatchResult)
    goto LABEL_67;
  -[MesaCoreAnalyticsEvent deviceType](self, "deviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9)
  {
    sensorModulationRatio = self->_sensorModulationRatio;
    self->_sensorModulationRatio = 0;

  }
  -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    if (-[NSNumber unsignedIntegerValue](self->_deviceWakeReason, "unsignedIntegerValue") == 1
      && !self->_fingerDetectEndTime)
    {
      self->_fingerDetectEndTime = (NSNumber *)&unk_251CB3428;

    }
    if (!self->_fingerDetectEndTime)
    {
      if (__osLog)
        v30 = __osLog;
      else
        v30 = MEMORY[0x24BDACB70];
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_67;
      *(_DWORD *)buf = 136316162;
      v33 = "_fingerDetectEndTime";
      v34 = 2048;
      v35 = 0;
      v36 = 2080;
      v37 = "";
      v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v40 = 1024;
      v41 = 1158;
      goto LABEL_66;
    }
    if (!self->super._fingerOn && !self->_matcherResult)
    {
      self->_matcherResult = (NSNumber *)&unk_251CB3470;

      if (!self->_overallTime)
      {
        matcherEndTime = self->_matcherEndTime;
        if (!matcherEndTime)
        {
          matcherEndTime = self->_imageProcessingEndTime;
          if (!matcherEndTime)
          {
            matcherEndTime = self->_firstCaptureEndTime;
            if (!matcherEndTime)
              matcherEndTime = self->_fingerDetectEndTime;
          }
        }
        v14 = matcherEndTime;
        overallTime = self->_overallTime;
        self->_overallTime = v14;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_overallTime, "unsignedIntValue")- -[NSNumber unsignedIntValue](self->_fingerDetectEndTime, "unsignedIntValue"));
        v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        overallTimeFingerOn = self->_overallTimeFingerOn;
        self->_overallTimeFingerOn = v16;

      }
    }
  }
  -[MesaCoreAnalyticsMatchEvent setMatchCountsFromIdentityList:](self, "setMatchCountsFromIdentityList:", v7);
  if (!self->_overallTime)
  {
LABEL_67:
    v28 = 0;
    goto LABEL_34;
  }
  if (-[NSNumber unsignedIntValue](self->_capturedImageCount, "unsignedIntValue"))
  {
    -[MesaCoreAnalyticsEvent fingerDetected](self, "fingerDetected");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "BOOLValue"))
    {
      fingerDetectEndTime = self->_fingerDetectEndTime;

      if (fingerDetectEndTime)
      {
        if (self->_firstCaptureEndTime)
        {
          buttonStateCount = self->_buttonStateCount;
          if (buttonStateCount > -[NSNumber unsignedIntValue](self->_capturedImageCount, "unsignedIntValue"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_buttonStateCount);
            v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            capturedImageCount = self->_capturedImageCount;
            self->_capturedImageCount = v21;

          }
          goto LABEL_25;
        }
        if (__osLog)
          v30 = __osLog;
        else
          v30 = MEMORY[0x24BDACB70];
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          goto LABEL_67;
        *(_DWORD *)buf = 136316162;
        v33 = "_firstCaptureEndTime";
        v34 = 2048;
        v35 = 0;
        v36 = 2080;
        v37 = "";
        v38 = 2080;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
        v40 = 1024;
        v41 = 1192;
LABEL_66:
        _os_log_impl(&dword_24B74E000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        goto LABEL_67;
      }
    }
    else
    {

    }
    if (__osLog)
      v30 = __osLog;
    else
      v30 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136316162;
    v33 = "[[self fingerDetected] BOOLValue] && _fingerDetectEndTime";
    v34 = 2048;
    v35 = 0;
    v36 = 2080;
    v37 = "";
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
    v40 = 1024;
    v41 = 1191;
    goto LABEL_66;
  }
LABEL_25:
  matcherResult = self->_matcherResult;
  if (!matcherResult || -[NSNumber unsignedIntValue](matcherResult, "unsignedIntValue") == 2)
    goto LABEL_31;
  if (!self->_firstCaptureEndTime)
  {
    if (__osLog)
      v30 = __osLog;
    else
      v30 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136316162;
    v33 = "_firstCaptureEndTime";
    v34 = 2048;
    v35 = 0;
    v36 = 2080;
    v37 = "";
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
    v40 = 1024;
    v41 = 1200;
    goto LABEL_66;
  }
  if (!self->_imageProcessingEndTime)
  {
    if (__osLog)
      v30 = __osLog;
    else
      v30 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136316162;
    v33 = "_imageProcessingEndTime";
    v34 = 2048;
    v35 = 0;
    v36 = 2080;
    v37 = "";
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
    v40 = 1024;
    v41 = 1201;
    goto LABEL_66;
  }
  v24 = self->_matcherEndTime;
  if (!v24)
  {
    if (__osLog)
      v30 = __osLog;
    else
      v30 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136316162;
    v33 = "_matcherEndTime";
    v34 = 2048;
    v35 = 0;
    v36 = 2080;
    v37 = "";
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
    v40 = 1024;
    v41 = 1202;
    goto LABEL_66;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](v24, "unsignedIntValue")- -[NSNumber unsignedIntValue](self->_firstCaptureEndTime, "unsignedIntValue"));
  v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  firstCaptureEndTimeToFirstMatcherEndTime = self->_firstCaptureEndTimeToFirstMatcherEndTime;
  self->_firstCaptureEndTimeToFirstMatcherEndTime = v25;

LABEL_31:
  if (self->super._lastBioDevice.type)
  {
    +[MesaCoreAnalyticsHelper mesaCaDeviceTypeFromBioDeviceType:](MesaCoreAnalyticsHelper, "mesaCaDeviceTypeFromBioDeviceType:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setDeviceType:](self, "setDeviceType:", v27);

  }
  -[MesaCoreAnalyticsMatchEvent updateDailyValuesAfterMatch:](self, "updateDailyValuesAfterMatch:", v6);
  v31.receiver = self;
  v31.super_class = (Class)MesaCoreAnalyticsMatchEvent;
  -[MesaCoreAnalyticsEvent postEvent](&v31, sel_postEvent);
  v28 = 1;
LABEL_34:

  return v28;
}

- (void)acceptPreviousImage
{
  NSNumber *v3;
  NSNumber *acceptedImageCount;
  NSNumber *v5;
  NSNumber *rejectedImageCount;
  unsigned __int8 v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;

  self->_acceptPrev = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_acceptedImageCount, "unsignedIntValue") + 1);
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  acceptedImageCount = self->_acceptedImageCount;
  self->_acceptedImageCount = v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_rejectedImageCount, "unsignedIntValue") - 1);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  rejectedImageCount = self->_rejectedImageCount;
  self->_rejectedImageCount = v5;

  v7 = self->_lastAcceptCondFeedback + 56;
  if (v7 <= 5u && ((0x37u >> v7) & 1) != 0)
  {
    v8 = *off_251CA0C28[(char)v7];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "unsignedIntValue") - 1);
    v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v10 = *(Class *)((char *)&self->super.super.super.isa + v8);
    *(Class *)((char *)&self->super.super.super.isa + v8) = v9;

  }
  self->_lastAcceptCondFeedback = 0;
}

- (void)receiveImage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSNumber *v10;
  NSNumber *acceptedImageCount;
  void *v12;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *rejectedImageCount;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  NSNumber *v22;
  NSNumber *tidButtonState;
  NSNumber *v24;
  NSNumber *imageProblemClass;
  NSNumber *v26;
  NSNumber *wakeOnMenuPinUsed;
  NSNumber *v28;
  NSNumber *imagePixelOutlierCount;
  NSNumber *v30;
  NSNumber *imageContrast;
  NSNumber *v32;
  NSNumber *imageBrightness;
  NSNumber *v34;
  NSNumber *imageFeatureStrength;
  NSNumber *v36;
  NSNumber *imageContrastNorm;
  NSNumber *v38;
  NSNumber *imageBrightnessNorm;
  NSNumber *v40;
  NSNumber *imageFeatureStrengthNorm;
  void *v42;
  id v43;
  unsigned __int8 *v44;
  void *v45;
  unint64_t v46;
  double v47;
  NSNumber *v48;
  NSNumber *drxStrengthPctCol2Bin;
  NSNumber *v50;
  NSNumber *drxStrengthPctCol7Bin;
  NSNumber *v52;
  NSNumber *temperatureBin;
  NSNumber *v54;
  NSNumber *FMRBin;
  NSNumber *v56;
  NSNumber *BSRBin;
  NSNumber *v58;
  NSNumber *fitDiffBin;
  NSNumber *v60;
  NSNumber *carrierAttenBin;
  NSNumber *v62;
  NSNumber *DRXAmpMinBin;
  NSNumber *v64;
  NSNumber *DRXAmpMaxBin;
  NSNumber *v66;
  NSNumber *fitResEdge6SigmaBin;
  NSNumber *v68;
  NSNumber *maxFingerToProbeAttenuationBin;
  NSNumber *v70;
  NSNumber *maxFingerToProbeAttenuationRaw;
  double v72;
  NSNumber *v73;
  NSNumber *drxStrengthPctCol2Raw;
  double v75;
  NSNumber *v76;
  NSNumber *drxStrengthPctCol7Raw;
  double v78;
  NSNumber *v79;
  NSNumber *temperatureRaw;
  double v81;
  NSNumber *v82;
  NSNumber *FMRRaw;
  double v84;
  NSNumber *v85;
  NSNumber *BSRRaw;
  double v87;
  NSNumber *v88;
  NSNumber *fitDiffRaw;
  double v90;
  NSNumber *v91;
  NSNumber *carrierAttenRaw;
  double v93;
  NSNumber *v94;
  NSNumber *DRXAmpMinRaw;
  double v96;
  NSNumber *v97;
  NSNumber *DRXAmpMaxRaw;
  double v99;
  NSNumber *v100;
  NSNumber *fitResEdge6SigmaRaw;
  double v102;
  NSNumber *v103;
  NSNumber *artefactScore;
  NSNumber *v105;
  NSNumber *artefactDetectionResult;
  NSNumber *v107;
  NSNumber *numPxOutliersPhase1;
  NSNumber *v109;
  NSNumber *numPxOutliersPhase2;
  NSNumber *v111;
  NSNumber *artefactStrength;
  NSNumber *v113;
  NSNumber *artefactNonlinearity;
  NSNumber *v115;
  NSNumber *artefactAnchorX;
  NSNumber *v117;
  NSNumber *artefactAnchorY;
  NSObject *v119;
  _BYTE v120[22];
  __int16 v121;
  const char *v122;
  __int16 v123;
  const char *v124;
  __int16 v125;
  int v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)__osLog;
  v6 = MEMORY[0x24BDACB70];
  if (!__osLog)
    v5 = (void *)MEMORY[0x24BDACB70];
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v120 = 138412290;
    *(_QWORD *)&v120[4] = v4;
    _os_log_impl(&dword_24B74E000, v7, OS_LOG_TYPE_DEFAULT, "MesaCoreAnalyticsEnrollEvent info: %@\n", v120, 0xCu);
  }

  if (!v4)
  {
    if (__osLog)
      v119 = __osLog;
    else
      v119 = v6;
    if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)v120 = 136316162;
    *(_QWORD *)&v120[4] = "info";
    *(_WORD *)&v120[12] = 2048;
    *(_QWORD *)&v120[14] = 0;
    v121 = 2080;
    v122 = "";
    v123 = 2080;
    v124 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
    v125 = 1024;
    v126 = 1261;
    goto LABEL_55;
  }
  objc_msgSend(v4, "source");
  *(_OWORD *)&self->super._lastBioDevice.type = *(_OWORD *)v120;
  *(_DWORD *)&self->super._lastBioDevice.uuid[12] = *(_DWORD *)&v120[16];
  objc_msgSend(v4, "assessment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  switch(v9)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_acceptedImageCount, "unsignedIntValue") + 1);
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      acceptedImageCount = self->_acceptedImageCount;
      self->_acceptedImageCount = v10;

      self->_waitingForMatchResult = 1;
      break;
    case 2:
      objc_msgSend(v4, "feedback");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_lastAcceptCondFeedback = objc_msgSend(v12, "unsignedIntegerValue");

      self->_waitingForMatchResult = 1;
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_rejectedImageCount, "unsignedIntValue") + 1);
      v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      rejectedImageCount = self->_rejectedImageCount;
      self->_rejectedImageCount = v15;

      -[MesaCoreAnalyticsMatchEvent acceptPreviousImage](self, "acceptPreviousImage");
      break;
    case 4:
LABEL_9:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_rejectedImageCount, "unsignedIntValue") + 1);
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = self->_rejectedImageCount;
      self->_rejectedImageCount = v13;

      break;
    default:
      break;
  }
  objc_msgSend(v4, "feedback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntegerValue");

  if ((unint64_t)(v18 - 200) <= 5 && ((0x37u >> (v18 + 56)) & 1) != 0)
  {
    v19 = *off_251CA0C58[v18 - 200];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v19), "unsignedIntValue") + 1);
    v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v21 = *(Class *)((char *)&self->super.super.super.isa + v19);
    *(Class *)((char *)&self->super.super.super.isa + v19) = v20;

  }
  if (!self->_acceptPrev)
  {
    objc_msgSend(v4, "tidButtonState");
    v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    tidButtonState = self->_tidButtonState;
    self->_tidButtonState = v22;

    objc_msgSend(v4, "imageProblemClass");
    v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageProblemClass = self->_imageProblemClass;
    self->_imageProblemClass = v24;

    objc_msgSend(v4, "wakeOnMenuPinUsed");
    v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    wakeOnMenuPinUsed = self->_wakeOnMenuPinUsed;
    self->_wakeOnMenuPinUsed = v26;

    objc_msgSend(v4, "imagePixelOutlierCount");
    v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imagePixelOutlierCount = self->_imagePixelOutlierCount;
    self->_imagePixelOutlierCount = v28;

    objc_msgSend(v4, "imageContrast");
    v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageContrast = self->_imageContrast;
    self->_imageContrast = v30;

    objc_msgSend(v4, "imageBrightness");
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageBrightness = self->_imageBrightness;
    self->_imageBrightness = v32;

    objc_msgSend(v4, "imageFeatureStrength");
    v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageFeatureStrength = self->_imageFeatureStrength;
    self->_imageFeatureStrength = v34;

    objc_msgSend(v4, "imageContrastNorm");
    v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageContrastNorm = self->_imageContrastNorm;
    self->_imageContrastNorm = v36;

    objc_msgSend(v4, "imageBrightnessNorm");
    v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageBrightnessNorm = self->_imageBrightnessNorm;
    self->_imageBrightnessNorm = v38;

    objc_msgSend(v4, "imageFeatureStrengthNorm");
    v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageFeatureStrengthNorm = self->_imageFeatureStrengthNorm;
    self->_imageFeatureStrengthNorm = v40;

    objc_msgSend(v4, "deblurringInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "deblurringInfo");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = (unsigned __int8 *)objc_msgSend(v43, "bytes");

      objc_msgSend(v4, "deblurringInfo");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");

      if (v46 > 0x62)
      {
        if (*(_DWORD *)(v44 + 55) >= 4u)
        {
          if (*v44 != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v48 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            drxStrengthPctCol2Bin = self->_drxStrengthPctCol2Bin;
            self->_drxStrengthPctCol2Bin = v48;

          }
          if (v44[1] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v50 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            drxStrengthPctCol7Bin = self->_drxStrengthPctCol7Bin;
            self->_drxStrengthPctCol7Bin = v50;

          }
          if (v44[2] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v52 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            temperatureBin = self->_temperatureBin;
            self->_temperatureBin = v52;

          }
          if (v44[3] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v54 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            FMRBin = self->_FMRBin;
            self->_FMRBin = v54;

          }
          if (v44[4] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v56 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            BSRBin = self->_BSRBin;
            self->_BSRBin = v56;

          }
          if (v44[5] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v58 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            fitDiffBin = self->_fitDiffBin;
            self->_fitDiffBin = v58;

          }
          if (v44[6] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v60 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            carrierAttenBin = self->_carrierAttenBin;
            self->_carrierAttenBin = v60;

          }
          if (v44[7] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v62 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            DRXAmpMinBin = self->_DRXAmpMinBin;
            self->_DRXAmpMinBin = v62;

          }
          if (v44[8] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v64 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            DRXAmpMaxBin = self->_DRXAmpMaxBin;
            self->_DRXAmpMaxBin = v64;

          }
          if (v44[9] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v66 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            fitResEdge6SigmaBin = self->_fitResEdge6SigmaBin;
            self->_fitResEdge6SigmaBin = v66;

          }
          if (v44[10] != 255)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:");
            v68 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            maxFingerToProbeAttenuationBin = self->_maxFingerToProbeAttenuationBin;
            self->_maxFingerToProbeAttenuationBin = v68;

          }
          LODWORD(v47) = *(_DWORD *)(v44 + 11);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
          v70 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          maxFingerToProbeAttenuationRaw = self->_maxFingerToProbeAttenuationRaw;
          self->_maxFingerToProbeAttenuationRaw = v70;

          LODWORD(v72) = *(_DWORD *)(v44 + 15);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v72);
          v73 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          drxStrengthPctCol2Raw = self->_drxStrengthPctCol2Raw;
          self->_drxStrengthPctCol2Raw = v73;

          LODWORD(v75) = *(_DWORD *)(v44 + 19);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v75);
          v76 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          drxStrengthPctCol7Raw = self->_drxStrengthPctCol7Raw;
          self->_drxStrengthPctCol7Raw = v76;

          LODWORD(v78) = *(_DWORD *)(v44 + 23);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v78);
          v79 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          temperatureRaw = self->_temperatureRaw;
          self->_temperatureRaw = v79;

          LODWORD(v81) = *(_DWORD *)(v44 + 27);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v81);
          v82 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          FMRRaw = self->_FMRRaw;
          self->_FMRRaw = v82;

          LODWORD(v84) = *(_DWORD *)(v44 + 31);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v84);
          v85 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          BSRRaw = self->_BSRRaw;
          self->_BSRRaw = v85;

          LODWORD(v87) = *(_DWORD *)(v44 + 35);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v87);
          v88 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          fitDiffRaw = self->_fitDiffRaw;
          self->_fitDiffRaw = v88;

          LODWORD(v90) = *(_DWORD *)(v44 + 39);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v90);
          v91 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          carrierAttenRaw = self->_carrierAttenRaw;
          self->_carrierAttenRaw = v91;

          LODWORD(v93) = *(_DWORD *)(v44 + 43);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v93);
          v94 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          DRXAmpMinRaw = self->_DRXAmpMinRaw;
          self->_DRXAmpMinRaw = v94;

          LODWORD(v96) = *(_DWORD *)(v44 + 47);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v96);
          v97 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          DRXAmpMaxRaw = self->_DRXAmpMaxRaw;
          self->_DRXAmpMaxRaw = v97;

          LODWORD(v99) = *(_DWORD *)(v44 + 51);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v99);
          v100 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          fitResEdge6SigmaRaw = self->_fitResEdge6SigmaRaw;
          self->_fitResEdge6SigmaRaw = v100;

          if (*(_DWORD *)(v44 + 55) >= 7u)
          {
            if (*(_DWORD *)(v44 + 71) != -1)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v44 + 67));
              v103 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              artefactScore = self->_artefactScore;
              self->_artefactScore = v103;

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(v44 + 71));
              v105 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              artefactDetectionResult = self->_artefactDetectionResult;
              self->_artefactDetectionResult = v105;

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v44 + 59));
              v107 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              numPxOutliersPhase1 = self->_numPxOutliersPhase1;
              self->_numPxOutliersPhase1 = v107;

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v44 + 63));
              v109 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              numPxOutliersPhase2 = self->_numPxOutliersPhase2;
              self->_numPxOutliersPhase2 = v109;

            }
            LODWORD(v102) = *(_DWORD *)(v44 + 75);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v102);
            v111 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            artefactStrength = self->_artefactStrength;
            self->_artefactStrength = v111;

            if (fabsf(*(float *)(v44 + 87)) != INFINITY)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
              v113 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              artefactNonlinearity = self->_artefactNonlinearity;
              self->_artefactNonlinearity = v113;

            }
            if (fabsf(*(float *)(v44 + 91)) != INFINITY)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
              v115 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              artefactAnchorX = self->_artefactAnchorX;
              self->_artefactAnchorX = v115;

            }
            if (fabsf(*(float *)(v44 + 95)) != INFINITY)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
              v117 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              artefactAnchorY = self->_artefactAnchorY;
              self->_artefactAnchorY = v117;

            }
          }
        }
        goto LABEL_15;
      }
      if (__osLog)
        v119 = __osLog;
      else
        v119 = v6;
      if (!os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_DWORD *)v120 = 136316162;
      *(_QWORD *)&v120[4] = "[info.deblurringInfo length] >= sizeof(*imgDeblurrInfo)";
      *(_WORD *)&v120[12] = 2048;
      *(_QWORD *)&v120[14] = 0;
      v121 = 2080;
      v122 = "";
      v123 = 2080;
      v124 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v125 = 1024;
      v126 = 1337;
LABEL_55:
      _os_log_impl(&dword_24B74E000, v119, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v120, 0x30u);
    }
  }
LABEL_15:

}

- (void)handleStatusMessage:(unsigned int)a3 withData:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_super v18;
  unsigned int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  switch((int)v4)
  {
    case 'H':
      -[MesaCoreAnalyticsEvent deviceType](self, "deviceType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if (!v10)
      {
        v11 = (void *)MEMORY[0x24BDD16E0];
        v12 = 760;
        goto LABEL_12;
      }
      break;
    case 'J':
      v13 = 736;
      goto LABEL_15;
    case 'M':
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = 752;
LABEL_12:
      objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "unsignedIntValue") + 1);
      v14 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v15 = *(Class *)((char *)&self->super.super.super.isa + v12);
      *(Class *)((char *)&self->super.super.super.isa + v12) = v14;

      break;
    case 'P':
      -[MesaCoreAnalyticsMatchEvent setEventCanceled:](self, "setEventCanceled:", MEMORY[0x24BDBD1C8]);
      break;
    case 'Q':
    case 'R':
    case 'S':
      self->_valid = 0;
      break;
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case '_':
    case 'b':
      +[MesaCAImageInfo imageInfoFromImageProcessingResult:](MesaCAImageInfo, "imageInfoFromImageProcessingResult:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "source");
        if (v19 <= 1)
          -[MesaCoreAnalyticsMatchEvent receiveImage:](self, "receiveImage:", v8);
      }
      else
      {
        if (__osLog)
          v17 = __osLog;
        else
          v17 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v21 = "imageInfo";
          v22 = 2048;
          v23 = 0;
          v24 = 2080;
          v25 = "";
          v26 = 2080;
          v27 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
          v28 = 1024;
          v29 = 1482;
          _os_log_impl(&dword_24B74E000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }

      break;
      v13 = 720;
LABEL_15:
      v16 = *(Class *)((char *)&self->super.super.super.isa + v13);
      *(Class *)((char *)&self->super.super.super.isa + v13) = (Class)MEMORY[0x24BDBD1C8];

      break;
    default:
      v18.receiver = self;
      v18.super_class = (Class)MesaCoreAnalyticsMatchEvent;
      -[MesaCoreAnalyticsEvent handleStatusMessage:withData:](&v18, sel_handleStatusMessage_withData_, v4, v6);
      break;
  }

}

- (void)setSensorRecoveryReason:(id)a3
{
  objc_storeStrong((id *)&self->_sensorRecoveryReason, a3);
  if (a3)
    -[BiometricKitCoreAnalyticsEvent incrementCountField:](self, "incrementCountField:", CFSTR("sensorResetCount"));
}

- (void)setCaptureTime:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[MesaCoreAnalyticsEvent deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (!v6)
    objc_storeStrong((id *)&self->_captureTime, a3);

}

- (void)setImageProcessingTime:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[MesaCoreAnalyticsEvent deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (!v6)
    objc_storeStrong((id *)&self->_imageProcessingTime, a3);

}

- (void)setTargetTemplates:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *targetTemplateUUID;
  id v7;
  _DWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _DWORD *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  targetTemplateUUID = self->_targetTemplateUUID;
  self->_targetTemplateUUID = v5;

  if ((unint64_t)objc_msgSend(v4, "length") <= 3)
  {
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136316162;
      v15 = "[selectedIdentitiesBlob length] >= sizeof(*list)";
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v22 = 1024;
      v23 = 1617;
LABEL_17:
      _os_log_impl(&dword_24B74E000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v14, 0x30u);
    }
  }
  else
  {
    v7 = objc_retainAutorelease(v4);
    v8 = (_DWORD *)objc_msgSend(v7, "bytes");
    v9 = 20 * *v8 + 4;
    if (objc_msgSend(v7, "length") >= v9)
    {
      if (*v8)
      {
        v10 = 0;
        v11 = v8 + 2;
        do
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v11);
          -[NSMutableArray addObject:](self->_targetTemplateUUID, "addObject:", v12);

          ++v10;
          v11 += 5;
        }
        while (v10 < *v8);
      }
      goto LABEL_6;
    }
    if (__osLog)
      v13 = __osLog;
    else
      v13 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136316162;
      v15 = "[selectedIdentitiesBlob length] >= listLength";
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v22 = 1024;
      v23 = 1621;
      goto LABEL_17;
    }
  }
LABEL_6:

}

- (void)setMatchCountsFromIdentityList:(id)a3
{
  id v4;
  NSNumber *targetTemplate;
  NSNumber *targetTemplateMatchCount;
  NSNumber *targetTemplateMatchCountContinuous;
  NSNumber *targetTemplateUsage;
  NSNumber *targetTemplateUsageDaily;
  NSNumber *matchingTemplateMatchCount;
  NSNumber *matchingTemplateMatchCountContinuous;
  NSNumber *matchingTemplateUsage;
  NSNumber *matchingTemplateUsageDaily;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *targetTemplateUUID;
  void *v20;
  NSNumber *v21;
  NSNumber *v22;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  NSNumber *v26;
  NSUUID *matchingTemplateUUID;
  void *v28;
  uint64_t v29;
  NSNumber *v30;
  NSNumber *v31;
  NSNumber *v32;
  NSNumber *v33;
  void *v34;
  int v35;
  void *v36;
  unsigned int v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  NSNumber *v44;
  NSNumber *v45;
  void *v46;
  int v47;
  void *v48;
  unsigned int v49;
  void *v50;
  NSNumber *v51;
  NSNumber *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  NSNumber *v56;
  NSNumber *v57;
  uint64_t v58;
  uint64_t v59;
  id obj;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  targetTemplate = self->_targetTemplate;
  self->_targetTemplate = 0;

  targetTemplateMatchCount = self->_targetTemplateMatchCount;
  self->_targetTemplateMatchCount = 0;

  targetTemplateMatchCountContinuous = self->_targetTemplateMatchCountContinuous;
  self->_targetTemplateMatchCountContinuous = 0;

  targetTemplateUsage = self->_targetTemplateUsage;
  self->_targetTemplateUsage = 0;

  targetTemplateUsageDaily = self->_targetTemplateUsageDaily;
  self->_targetTemplateUsageDaily = 0;

  matchingTemplateMatchCount = self->_matchingTemplateMatchCount;
  self->_matchingTemplateMatchCount = 0;

  matchingTemplateMatchCountContinuous = self->_matchingTemplateMatchCountContinuous;
  self->_matchingTemplateMatchCountContinuous = 0;

  matchingTemplateUsage = self->_matchingTemplateUsage;
  self->_matchingTemplateUsage = 0;

  matchingTemplateUsageDaily = self->_matchingTemplateUsageDaily;
  v58 = 1056;
  self->_matchingTemplateUsageDaily = 0;

  v66.receiver = self;
  v66.super_class = (Class)MesaCoreAnalyticsMatchEvent;
  -[MesaCoreAnalyticsEvent setMatchCountsFromIdentityList:](&v66, sel_setMatchCountsFromIdentityList_, v4);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v4;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v14)
  {
    v15 = v14;
    v61 = 0;
    v16 = *(_QWORD *)v63;
    do
    {
      v17 = 0;
      v59 = v15;
      do
      {
        if (*(_QWORD *)v63 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v17);
        targetTemplateUUID = self->_targetTemplateUUID;
        objc_msgSend(v18, "uuid", v58);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(targetTemplateUUID) = -[NSMutableArray containsObject:](targetTemplateUUID, "containsObject:", v20);

        if ((_DWORD)targetTemplateUUID)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_targetTemplate, "unsignedIntValue") | (1 << (v61 + v17)));
          v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v22 = self->_targetTemplate;
          self->_targetTemplate = v21;

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "matchCount"));
          v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v24 = self->_targetTemplateMatchCount;
          self->_targetTemplateMatchCount = v23;

          v15 = v59;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "matchCountContinuous"));
          v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v26 = self->_targetTemplateMatchCountContinuous;
          self->_targetTemplateMatchCountContinuous = v25;

        }
        if (-[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
        {
          matchingTemplateUUID = self->_matchingTemplateUUID;
          objc_msgSend(v18, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[NSUUID compare:](matchingTemplateUUID, "compare:", v28);

          if (!v29)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "matchCount"));
            v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v31 = self->_matchingTemplateMatchCount;
            self->_matchingTemplateMatchCount = v30;

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "matchCountContinuous"));
            v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v33 = self->_matchingTemplateMatchCountContinuous;
            self->_matchingTemplateMatchCountContinuous = v32;

          }
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      v61 += v17;
    }
    while (v15);
  }

  -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "unsignedIntValue");

  if (v35)
  {
    if (-[NSNumber unsignedIntValue](self->_matchingTemplateMatchCount, "unsignedIntValue")
      && -[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
    {
      v36 = (void *)MEMORY[0x24BDD16E0];
      v37 = 100 * -[NSNumber unsignedIntValue](self->_matchingTemplateMatchCount, "unsignedIntValue");
      -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "numberWithUnsignedInt:", v37 / objc_msgSend(v38, "unsignedIntValue"));
      v39 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v40 = *(Class *)((char *)&self->super.super.super.isa + v58);
      *(Class *)((char *)&self->super.super.super.isa + v58) = v39;

    }
    if (-[NSNumber unsignedIntValue](self->_targetTemplateMatchCount, "unsignedIntValue", v58))
    {
      v41 = (void *)MEMORY[0x24BDD16E0];
      v42 = 100 * -[NSNumber unsignedIntValue](self->_targetTemplateMatchCount, "unsignedIntValue");
      -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "numberWithUnsignedInt:", v42 / objc_msgSend(v43, "unsignedIntValue"));
      v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v45 = self->_targetTemplateUsageDaily;
      self->_targetTemplateUsageDaily = v44;

    }
  }
  -[MesaCoreAnalyticsEvent totalTemplateMatchCountContinuous](self, "totalTemplateMatchCountContinuous", v58);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "unsignedIntValue");

  if (v47)
  {
    if (-[NSNumber unsignedIntValue](self->_matchingTemplateMatchCountContinuous, "unsignedIntValue")
      && -[NSNumber BOOLValue](self->_overallResult, "BOOLValue"))
    {
      v48 = (void *)MEMORY[0x24BDD16E0];
      v49 = 100 * -[NSNumber unsignedIntValue](self->_matchingTemplateMatchCountContinuous, "unsignedIntValue");
      -[MesaCoreAnalyticsEvent totalTemplateMatchCountContinuous](self, "totalTemplateMatchCountContinuous");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "numberWithUnsignedInt:", v49 / objc_msgSend(v50, "unsignedIntValue"));
      v51 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v52 = self->_matchingTemplateUsage;
      self->_matchingTemplateUsage = v51;

    }
    if (-[NSNumber unsignedIntValue](self->_targetTemplateMatchCount, "unsignedIntValue"))
    {
      v53 = (void *)MEMORY[0x24BDD16E0];
      v54 = 100 * -[NSNumber unsignedIntValue](self->_targetTemplateMatchCountContinuous, "unsignedIntValue");
      -[MesaCoreAnalyticsEvent totalTemplateMatchCountContinuous](self, "totalTemplateMatchCountContinuous");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "numberWithUnsignedInt:", v54 / objc_msgSend(v55, "unsignedIntValue"));
      v56 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v57 = self->_targetTemplateUsage;
      self->_targetTemplateUsage = v56;

    }
  }

}

- (void)setSensorModulationRatioWith:(float)a3
{
  unint64_t v5;
  NSNumber *v6;
  NSNumber *sensorModulationRatio;
  double v8;
  NSNumber *v9;
  NSNumber *sensorModulationRatioRaw;

  if ((unint64_t)a3 >= 0x3F)
    v5 = 63;
  else
    v5 = (unint64_t)a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sensorModulationRatio = self->_sensorModulationRatio;
  self->_sensorModulationRatio = v6;

  *(float *)&v8 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sensorModulationRatioRaw = self->_sensorModulationRatioRaw;
  self->_sensorModulationRatioRaw = v9;

}

- (void)setTidButtonStateWith:(int64_t)a3
{
  NSNumber *v5;
  NSNumber *tidButtonState;
  NSNumber *v7;
  NSNumber *tidButtonStateSequence;
  NSNumber *v9;
  NSNumber *tidButtonStateSequenceBounded;
  NSObject *v11;
  unint64_t buttonStateCount;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  int v16;
  int64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  NSNumber *v21;
  __int16 v22;
  NSNumber *v23;
  __int16 v24;
  NSNumber *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  ++self->_buttonStateCount;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  tidButtonState = self->_tidButtonState;
  self->_tidButtonState = v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (a3 << (3 * self->_buttonStateCount - 3)) | -[NSNumber unsignedIntValue](self->_tidButtonStateSequence, "unsignedIntValue"));
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  tidButtonStateSequence = self->_tidButtonStateSequence;
  self->_tidButtonStateSequence = v7;

  if (a3 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (1 << (LODWORD(self->_buttonStateCount) - 1)) | -[NSNumber unsignedIntValue](self->_tidButtonStateSequenceBounded, "unsignedIntValue"));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    tidButtonStateSequenceBounded = self->_tidButtonStateSequenceBounded;
    self->_tidButtonStateSequenceBounded = v9;

  }
  if (__osLog)
    v11 = __osLog;
  else
    v11 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    buttonStateCount = self->_buttonStateCount;
    v13 = self->_tidButtonState;
    v14 = self->_tidButtonStateSequence;
    v15 = self->_tidButtonStateSequenceBounded;
    v16 = 134219010;
    v17 = a3;
    v18 = 2048;
    v19 = buttonStateCount;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_24B74E000, v11, OS_LOG_TYPE_DEBUG, "setTidButtonStateWith: return %lld %lld %@ %@ %@\n", (uint8_t *)&v16, 0x34u);
  }
}

- (NSNumber)matcherResult
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setMatcherResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSNumber)matchMode
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setMatchMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSNumber)matchUseCase
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setMatchUseCase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSNumber)matchType
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setMatchType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSNumber)tidButtonState
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setTidButtonState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSNumber)imageProblemClass
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setImageProblemClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSNumber)deviceWakeReason
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setDeviceWakeReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSNumber)sensorModulationRatio
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setSensorModulationRatio:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSNumber)imagePixelOutlierCount
{
  return (NSNumber *)objc_getProperty(self, a2, 488, 1);
}

- (void)setImagePixelOutlierCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (NSNumber)imageContrast
{
  return (NSNumber *)objc_getProperty(self, a2, 496, 1);
}

- (void)setImageContrast:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (NSNumber)imageBrightness
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setImageBrightness:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (NSNumber)imageFeatureStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 512, 1);
}

- (void)setImageFeatureStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (NSNumber)imageContrastNorm
{
  return (NSNumber *)objc_getProperty(self, a2, 520, 1);
}

- (void)setImageContrastNorm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (NSNumber)imageBrightnessNorm
{
  return (NSNumber *)objc_getProperty(self, a2, 528, 1);
}

- (void)setImageBrightnessNorm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (NSNumber)imageFeatureStrengthNorm
{
  return (NSNumber *)objc_getProperty(self, a2, 536, 1);
}

- (void)setImageFeatureStrengthNorm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (NSNumber)sensorRecoveryReason
{
  return self->_sensorRecoveryReason;
}

- (NSNumber)drxStrengthPctCol2Bin
{
  return (NSNumber *)objc_getProperty(self, a2, 552, 1);
}

- (void)setDrxStrengthPctCol2Bin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (NSNumber)drxStrengthPctCol7Bin
{
  return (NSNumber *)objc_getProperty(self, a2, 560, 1);
}

- (void)setDrxStrengthPctCol7Bin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (NSNumber)temperatureBin
{
  return (NSNumber *)objc_getProperty(self, a2, 568, 1);
}

- (void)setTemperatureBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (NSNumber)maxFingerToProbeAttenuationBin
{
  return (NSNumber *)objc_getProperty(self, a2, 576, 1);
}

- (void)setMaxFingerToProbeAttenuationBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (NSNumber)FMRBin
{
  return (NSNumber *)objc_getProperty(self, a2, 584, 1);
}

- (void)setFMRBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (NSNumber)BSRBin
{
  return (NSNumber *)objc_getProperty(self, a2, 592, 1);
}

- (void)setBSRBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (NSNumber)fitDiffBin
{
  return (NSNumber *)objc_getProperty(self, a2, 600, 1);
}

- (void)setFitDiffBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (NSNumber)carrierAttenBin
{
  return (NSNumber *)objc_getProperty(self, a2, 608, 1);
}

- (void)setCarrierAttenBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 608);
}

- (NSNumber)DRXAmpMinBin
{
  return (NSNumber *)objc_getProperty(self, a2, 616, 1);
}

- (void)setDRXAmpMinBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (NSNumber)DRXAmpMaxBin
{
  return (NSNumber *)objc_getProperty(self, a2, 624, 1);
}

- (void)setDRXAmpMaxBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (NSNumber)fitResEdge6SigmaBin
{
  return (NSNumber *)objc_getProperty(self, a2, 632, 1);
}

- (void)setFitResEdge6SigmaBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 632);
}

- (NSNumber)tidButtonStateSequenceBounded
{
  return (NSNumber *)objc_getProperty(self, a2, 640, 1);
}

- (void)setTidButtonStateSequenceBounded:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (NSNumber)artefactDetectionResult
{
  return (NSNumber *)objc_getProperty(self, a2, 648, 1);
}

- (void)setArtefactDetectionResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (NSNumber)artefactScore
{
  return (NSNumber *)objc_getProperty(self, a2, 656, 1);
}

- (void)setArtefactScore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (NSNumber)numPxOutliersPhase1
{
  return (NSNumber *)objc_getProperty(self, a2, 664, 1);
}

- (void)setNumPxOutliersPhase1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (NSNumber)numPxOutliersPhase2
{
  return (NSNumber *)objc_getProperty(self, a2, 672, 1);
}

- (void)setNumPxOutliersPhase2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (NSNumber)overallResult
{
  return (NSNumber *)objc_getProperty(self, a2, 680, 1);
}

- (void)setOverallResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 680);
}

- (NSNumber)wakeOnMenuPinUsed
{
  return (NSNumber *)objc_getProperty(self, a2, 688, 1);
}

- (void)setWakeOnMenuPinUsed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 688);
}

- (NSNumber)templateUpdated
{
  return (NSNumber *)objc_getProperty(self, a2, 696, 1);
}

- (void)setTemplateUpdated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 696);
}

- (NSNumber)dirtOnSensor
{
  return (NSNumber *)objc_getProperty(self, a2, 704, 1);
}

- (void)setDirtOnSensor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (NSNumber)pressureMitigationUsed
{
  return (NSNumber *)objc_getProperty(self, a2, 712, 1);
}

- (void)setPressureMitigationUsed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 712);
}

- (NSNumber)desenseMitigationPause
{
  return (NSNumber *)objc_getProperty(self, a2, 720, 1);
}

- (void)setDesenseMitigationPause:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 720);
}

- (NSNumber)bioLockout
{
  return (NSNumber *)objc_getProperty(self, a2, 728, 1);
}

- (void)setBioLockout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 728);
}

- (NSNumber)requestFingerOff
{
  return (NSNumber *)objc_getProperty(self, a2, 736, 1);
}

- (void)setRequestFingerOff:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (NSNumber)preArmedMatch
{
  return (NSNumber *)objc_getProperty(self, a2, 744, 1);
}

- (void)setPreArmedMatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 744);
}

- (NSNumber)captureRestartCount
{
  return (NSNumber *)objc_getProperty(self, a2, 752, 1);
}

- (void)setCaptureRestartCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (NSNumber)capturedImageCount
{
  return (NSNumber *)objc_getProperty(self, a2, 760, 1);
}

- (void)setCapturedImageCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (NSNumber)acceptedImageCount
{
  return (NSNumber *)objc_getProperty(self, a2, 768, 1);
}

- (void)setAcceptedImageCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (NSNumber)rejectedImageCount
{
  return (NSNumber *)objc_getProperty(self, a2, 776, 1);
}

- (void)setRejectedImageCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 776);
}

- (NSNumber)rejectedImageUnknownCount
{
  return (NSNumber *)objc_getProperty(self, a2, 784, 1);
}

- (void)setRejectedImageUnknownCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (NSNumber)rejectedImageBadBlocksCount
{
  return (NSNumber *)objc_getProperty(self, a2, 792, 1);
}

- (void)setRejectedImageBadBlocksCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (NSNumber)rejectedImageChFPNCount
{
  return (NSNumber *)objc_getProperty(self, a2, 800, 1);
}

- (void)setRejectedImageChFPNCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (NSNumber)rejectedImageCaFPNCount
{
  return (NSNumber *)objc_getProperty(self, a2, 808, 1);
}

- (void)setRejectedImageCaFPNCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (NSNumber)rejectedImageMovementCount
{
  return (NSNumber *)objc_getProperty(self, a2, 816, 1);
}

- (void)setRejectedImageMovementCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (NSNumber)enrolledUsersCount
{
  return (NSNumber *)objc_getProperty(self, a2, 824, 1);
}

- (void)setEnrolledUsersCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (NSNumber)matchIdentityCount
{
  return (NSNumber *)objc_getProperty(self, a2, 832, 1);
}

- (void)setMatchIdentityCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (NSNumber)failedUnlockAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 840, 1);
}

- (void)setFailedUnlockAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 840);
}

- (NSNumber)failedMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 848, 1);
}

- (void)setFailedMatchAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 848);
}

- (NSNumber)quickTapsCount
{
  return (NSNumber *)objc_getProperty(self, a2, 856, 1);
}

- (void)setQuickTapsCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 856);
}

- (NSNumber)sensorResetCount
{
  return (NSNumber *)objc_getProperty(self, a2, 864, 1);
}

- (void)setSensorResetCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 864);
}

- (NSNumber)overallTime
{
  return (NSNumber *)objc_getProperty(self, a2, 872, 1);
}

- (void)setOverallTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 872);
}

- (NSNumber)operationStartTime
{
  return (NSNumber *)objc_getProperty(self, a2, 880, 1);
}

- (void)setOperationStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 880);
}

- (NSNumber)fingerDetectEndTime
{
  return (NSNumber *)objc_getProperty(self, a2, 888, 1);
}

- (void)setFingerDetectEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 888);
}

- (NSNumber)firstCaptureEndTime
{
  return (NSNumber *)objc_getProperty(self, a2, 896, 1);
}

- (void)setFirstCaptureEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 896);
}

- (NSNumber)imageProcessingEndTime
{
  return (NSNumber *)objc_getProperty(self, a2, 904, 1);
}

- (void)setImageProcessingEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 904);
}

- (NSNumber)matcherEndTime
{
  return (NSNumber *)objc_getProperty(self, a2, 912, 1);
}

- (void)setMatcherEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 912);
}

- (NSNumber)captureTime
{
  return self->_captureTime;
}

- (NSNumber)imageProcessingTime
{
  return self->_imageProcessingTime;
}

- (NSNumber)matcherTime
{
  return (NSNumber *)objc_getProperty(self, a2, 936, 1);
}

- (void)setMatcherTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 936);
}

- (NSNumber)timeSinceSleep
{
  return (NSNumber *)objc_getProperty(self, a2, 944, 1);
}

- (void)setTimeSinceSleep:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 944);
}

- (NSNumber)requestFingerOffEndTime
{
  return (NSNumber *)objc_getProperty(self, a2, 952, 1);
}

- (void)setRequestFingerOffEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 952);
}

- (NSNumber)overallTimeFingerOn
{
  return (NSNumber *)objc_getProperty(self, a2, 960, 1);
}

- (void)setOverallTimeFingerOn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 960);
}

- (NSNumber)imageDecryptionTime
{
  return (NSNumber *)objc_getProperty(self, a2, 968, 1);
}

- (void)setImageDecryptionTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (NSNumber)imageTransferTime
{
  return (NSNumber *)objc_getProperty(self, a2, 976, 1);
}

- (void)setImageTransferTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (NSNumber)firstCaptureEndTimeToFirstMatcherEndTime
{
  return (NSNumber *)objc_getProperty(self, a2, 984, 1);
}

- (void)setFirstCaptureEndTimeToFirstMatcherEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (NSNumber)matcherEndTimeWithRetry
{
  return (NSNumber *)objc_getProperty(self, a2, 992, 1);
}

- (void)setMatcherEndTimeWithRetry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (NSNumber)matcherTimeWithRetry
{
  return (NSNumber *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setMatcherTimeWithRetry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (NSNumber)targetTemplate
{
  return (NSNumber *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setTargetTemplate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (NSNumber)targetTemplateMatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTargetTemplateMatchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (NSNumber)targetTemplateUsageDaily
{
  return (NSNumber *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTargetTemplateUsageDaily:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (NSNumber)targetTemplateMatchCountContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setTargetTemplateMatchCountContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSNumber)targetTemplateUsage
{
  return (NSNumber *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setTargetTemplateUsage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (NSNumber)matchingTemplateMatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setMatchingTemplateMatchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSNumber)matchingTemplateUsageDaily
{
  return (NSNumber *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setMatchingTemplateUsageDaily:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (NSNumber)matchingTemplateUsage
{
  return (NSNumber *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setMatchingTemplateUsage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (NSNumber)matchingTemplateMatchCountContinuous
{
  return (NSNumber *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setMatchingTemplateMatchCountContinuous:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (NSNumber)sensorModulationRatioRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setSensorModulationRatioRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (NSNumber)maxFingerToProbeAttenuationRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setMaxFingerToProbeAttenuationRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (NSNumber)drxStrengthPctCol2Raw
{
  return (NSNumber *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setDrxStrengthPctCol2Raw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (NSNumber)drxStrengthPctCol7Raw
{
  return (NSNumber *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setDrxStrengthPctCol7Raw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSNumber)temperatureRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setTemperatureRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (NSNumber)FMRRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setFMRRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (NSNumber)BSRRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setBSRRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (NSNumber)fitDiffRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setFitDiffRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (NSNumber)carrierAttenRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setCarrierAttenRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (NSNumber)DRXAmpMinRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setDRXAmpMinRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (NSNumber)DRXAmpMaxRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setDRXAmpMaxRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (NSNumber)fitResEdge6SigmaRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setFitResEdge6SigmaRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- (NSNumber)artefactStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setArtefactStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (NSNumber)artefactNonlinearity
{
  return (NSNumber *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setArtefactNonlinearity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (NSNumber)artefactAnchorX
{
  return (NSNumber *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setArtefactAnchorX:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (NSNumber)artefactAnchorY
{
  return (NSNumber *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setArtefactAnchorY:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (NSNumber)tidButtonStateSequence
{
  return (NSNumber *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setTidButtonStateSequence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (BiometricMatchOperationMesa)matchOperation
{
  return (BiometricMatchOperationMesa *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setMatchOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (NSNumber)imageAbsoluteTimeId
{
  return (NSNumber *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setImageAbsoluteTimeId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAbsoluteTimeId, 0);
  objc_storeStrong((id *)&self->_matchOperation, 0);
  objc_storeStrong((id *)&self->_tidButtonStateSequence, 0);
  objc_storeStrong((id *)&self->_artefactAnchorY, 0);
  objc_storeStrong((id *)&self->_artefactAnchorX, 0);
  objc_storeStrong((id *)&self->_artefactNonlinearity, 0);
  objc_storeStrong((id *)&self->_artefactStrength, 0);
  objc_storeStrong((id *)&self->_fitResEdge6SigmaRaw, 0);
  objc_storeStrong((id *)&self->_DRXAmpMaxRaw, 0);
  objc_storeStrong((id *)&self->_DRXAmpMinRaw, 0);
  objc_storeStrong((id *)&self->_carrierAttenRaw, 0);
  objc_storeStrong((id *)&self->_fitDiffRaw, 0);
  objc_storeStrong((id *)&self->_BSRRaw, 0);
  objc_storeStrong((id *)&self->_FMRRaw, 0);
  objc_storeStrong((id *)&self->_temperatureRaw, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7Raw, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2Raw, 0);
  objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationRaw, 0);
  objc_storeStrong((id *)&self->_sensorModulationRatioRaw, 0);
  objc_storeStrong((id *)&self->_matchingTemplateMatchCountContinuous, 0);
  objc_storeStrong((id *)&self->_matchingTemplateUsage, 0);
  objc_storeStrong((id *)&self->_matchingTemplateUsageDaily, 0);
  objc_storeStrong((id *)&self->_matchingTemplateMatchCount, 0);
  objc_storeStrong((id *)&self->_targetTemplateUsage, 0);
  objc_storeStrong((id *)&self->_targetTemplateMatchCountContinuous, 0);
  objc_storeStrong((id *)&self->_targetTemplateUsageDaily, 0);
  objc_storeStrong((id *)&self->_targetTemplateMatchCount, 0);
  objc_storeStrong((id *)&self->_targetTemplate, 0);
  objc_storeStrong((id *)&self->_matcherTimeWithRetry, 0);
  objc_storeStrong((id *)&self->_matcherEndTimeWithRetry, 0);
  objc_storeStrong((id *)&self->_firstCaptureEndTimeToFirstMatcherEndTime, 0);
  objc_storeStrong((id *)&self->_imageTransferTime, 0);
  objc_storeStrong((id *)&self->_imageDecryptionTime, 0);
  objc_storeStrong((id *)&self->_overallTimeFingerOn, 0);
  objc_storeStrong((id *)&self->_requestFingerOffEndTime, 0);
  objc_storeStrong((id *)&self->_timeSinceSleep, 0);
  objc_storeStrong((id *)&self->_matcherTime, 0);
  objc_storeStrong((id *)&self->_imageProcessingTime, 0);
  objc_storeStrong((id *)&self->_captureTime, 0);
  objc_storeStrong((id *)&self->_matcherEndTime, 0);
  objc_storeStrong((id *)&self->_imageProcessingEndTime, 0);
  objc_storeStrong((id *)&self->_firstCaptureEndTime, 0);
  objc_storeStrong((id *)&self->_fingerDetectEndTime, 0);
  objc_storeStrong((id *)&self->_operationStartTime, 0);
  objc_storeStrong((id *)&self->_overallTime, 0);
  objc_storeStrong((id *)&self->_sensorResetCount, 0);
  objc_storeStrong((id *)&self->_quickTapsCount, 0);
  objc_storeStrong((id *)&self->_failedMatchAttempts, 0);
  objc_storeStrong((id *)&self->_failedUnlockAttempts, 0);
  objc_storeStrong((id *)&self->_matchIdentityCount, 0);
  objc_storeStrong((id *)&self->_enrolledUsersCount, 0);
  objc_storeStrong((id *)&self->_rejectedImageMovementCount, 0);
  objc_storeStrong((id *)&self->_rejectedImageCaFPNCount, 0);
  objc_storeStrong((id *)&self->_rejectedImageChFPNCount, 0);
  objc_storeStrong((id *)&self->_rejectedImageBadBlocksCount, 0);
  objc_storeStrong((id *)&self->_rejectedImageUnknownCount, 0);
  objc_storeStrong((id *)&self->_rejectedImageCount, 0);
  objc_storeStrong((id *)&self->_acceptedImageCount, 0);
  objc_storeStrong((id *)&self->_capturedImageCount, 0);
  objc_storeStrong((id *)&self->_captureRestartCount, 0);
  objc_storeStrong((id *)&self->_preArmedMatch, 0);
  objc_storeStrong((id *)&self->_requestFingerOff, 0);
  objc_storeStrong((id *)&self->_bioLockout, 0);
  objc_storeStrong((id *)&self->_desenseMitigationPause, 0);
  objc_storeStrong((id *)&self->_pressureMitigationUsed, 0);
  objc_storeStrong((id *)&self->_dirtOnSensor, 0);
  objc_storeStrong((id *)&self->_templateUpdated, 0);
  objc_storeStrong((id *)&self->_wakeOnMenuPinUsed, 0);
  objc_storeStrong((id *)&self->_overallResult, 0);
  objc_storeStrong((id *)&self->_numPxOutliersPhase2, 0);
  objc_storeStrong((id *)&self->_numPxOutliersPhase1, 0);
  objc_storeStrong((id *)&self->_artefactScore, 0);
  objc_storeStrong((id *)&self->_artefactDetectionResult, 0);
  objc_storeStrong((id *)&self->_tidButtonStateSequenceBounded, 0);
  objc_storeStrong((id *)&self->_fitResEdge6SigmaBin, 0);
  objc_storeStrong((id *)&self->_DRXAmpMaxBin, 0);
  objc_storeStrong((id *)&self->_DRXAmpMinBin, 0);
  objc_storeStrong((id *)&self->_carrierAttenBin, 0);
  objc_storeStrong((id *)&self->_fitDiffBin, 0);
  objc_storeStrong((id *)&self->_BSRBin, 0);
  objc_storeStrong((id *)&self->_FMRBin, 0);
  objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationBin, 0);
  objc_storeStrong((id *)&self->_temperatureBin, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7Bin, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2Bin, 0);
  objc_storeStrong((id *)&self->_sensorRecoveryReason, 0);
  objc_storeStrong((id *)&self->_imageFeatureStrengthNorm, 0);
  objc_storeStrong((id *)&self->_imageBrightnessNorm, 0);
  objc_storeStrong((id *)&self->_imageContrastNorm, 0);
  objc_storeStrong((id *)&self->_imageFeatureStrength, 0);
  objc_storeStrong((id *)&self->_imageBrightness, 0);
  objc_storeStrong((id *)&self->_imageContrast, 0);
  objc_storeStrong((id *)&self->_imagePixelOutlierCount, 0);
  objc_storeStrong((id *)&self->_sensorModulationRatio, 0);
  objc_storeStrong((id *)&self->_deviceWakeReason, 0);
  objc_storeStrong((id *)&self->_imageProblemClass, 0);
  objc_storeStrong((id *)&self->_tidButtonState, 0);
  objc_storeStrong((id *)&self->_matchType, 0);
  objc_storeStrong((id *)&self->_matchUseCase, 0);
  objc_storeStrong((id *)&self->_matchMode, 0);
  objc_storeStrong((id *)&self->_matcherResult, 0);
  objc_storeStrong((id *)&self->_matchingTemplateUUID, 0);
  objc_storeStrong((id *)&self->_targetTemplateUUID, 0);
}

@end
