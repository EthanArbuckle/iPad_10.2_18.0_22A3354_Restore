@implementation MesaCoreAnalyticsDailyEvent

- (MesaCoreAnalyticsDailyEvent)initWithName:(id)a3 dictionary:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  MesaCoreAnalyticsDailyEvent *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithDictionary:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)MesaCoreAnalyticsDailyEvent;
  v9 = -[BiometricKitCoreAnalyticsEvent initWithName:dictionary:](&v15, sel_initWithName_dictionary_, v7, v8);

  if (v9)
  {
    v10 = (int)*MEMORY[0x24BE0CF50];
    objc_msgSend(*(id *)((char *)&v9->super.super.super.isa + v10), "arrayByAddingObjectsFromArray:", &unk_251CB3C28);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(Class *)((char *)&v9->super.super.super.isa + v10);
    *(Class *)((char *)&v9->super.super.super.isa + v10) = (Class)v11;

  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "self = [super initWithName:eventName dictionary:mutableDict]";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v24 = 1024;
      v25 = 2072;
      _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }

  return v9;
}

- (MesaCoreAnalyticsDailyEvent)initWithDictionary:(id)a3
{
  return -[MesaCoreAnalyticsDailyEvent initWithName:dictionary:](self, "initWithName:dictionary:", CFSTR("com.apple.biometrickit.mesa.dailyUpdate"), a3);
}

- (id)dictionaryRepresentationArchiving:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[16];

  v3 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsDailyEvent dictionaryRepresentation\n", buf, 2u);
  }
  -[MesaCoreAnalyticsDailyEvent calculateDailyValues](self, "calculateDailyValues");
  v6 = (void *)MEMORY[0x24BDBCED8];
  v10.receiver = self;
  v10.super_class = (Class)MesaCoreAnalyticsDailyEvent;
  -[BiometricKitCoreAnalyticsEvent dictionaryRepresentationArchiving:](&v10, sel_dictionaryRepresentationArchiving_, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)reset
{
  NSNumber *v3;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  NSNumber *bioLockoutCount;
  NSNumber *totalMatchAttempts;
  NSNumber *totalMatchAttemptsSuccessful;
  NSNumber *totalMatchAttemptsFailed;
  NSNumber *totalMatchAttemptsFingerDetected;
  NSNumber *totalMatchAttemptsFailedFingerDetected;
  NSNumber *unlockMatchAttempts;
  NSNumber *unlockMatchAttemptsSuccessful;
  NSNumber *unlockMatchAttemptsFailed;
  NSNumber *unlockMatchAttemptsFingerDetected;
  NSNumber *unlockMatchAttemptsFailedFingerDetected;
  NSNumber *localAuthMatchAttempts;
  NSNumber *localAuthMatchAttemptsSuccessful;
  NSNumber *localAuthMatchAttemptsFailed;
  NSNumber *localAuthMatchAttemptsFingerDetected;
  NSNumber *localAuthMatchAttemptsFailedFingerDetected;
  NSNumber *preArmMatchAttempts;
  NSNumber *preArmMatchAttemptsSuccessful;
  NSNumber *preArmMatchAttemptsFailed;
  NSNumber *preArmMatchAttemptsFingerDetected;
  NSNumber *preArmMatchAttemptsFailedFingerDetected;
  NSNumber *totalMatchOperationsFingerDetected;
  NSNumber *totalMatchOperationsFailedRetry;
  NSNumber *subsetMatchAttempts;
  NSNumber *subsetMatchAttemptsSuccessful;
  NSNumber *subsetMatchAttemptsFailed;
  NSNumber *subsetMatchAttemptsFingerDetected;
  NSNumber *subsetMatchAttemptsFailedFingerDetected;
  NSNumber *subsetMatchAttemptsFailedTarget;
  NSNumber *nonArtefactMatchAttempts;
  NSNumber *nonArtefactMatchAttemptsSuccessful;
  NSNumber *nonArtefactMatchAttemptsFailed;
  NSNumber *nonArtefactMatchAttemptsFingerDetected;
  NSNumber *nonArtefactMatchAttemptsFailedFingerDetected;
  NSNumber *artefactMatchAttempts;
  NSNumber *artefactMatchAttemptsSuccessful;
  NSNumber *artefactMatchAttemptsFailed;
  NSNumber *artefactMatchAttemptsFingerDetected;
  NSNumber *artefactMatchAttemptsFailedFingerDetected;
  NSNumber *lastEnrollmentTouchesCount;
  NSNumber *v47;
  NSNumber *lastEnrollmentDeviceOrientation;
  NSNumber *v49;
  NSNumber *lastEnrollmentScanCount;
  NSNumber *v51;
  NSNumber *lastEnrollmentScanGroupCount;
  objc_super v53;

  v3 = self->_lastEnrollmentTouchesCount;
  v4 = self->_lastEnrollmentDeviceOrientation;
  v5 = self->_lastEnrollmentScanCount;
  v6 = self->_lastEnrollmentScanGroupCount;
  v53.receiver = self;
  v53.super_class = (Class)MesaCoreAnalyticsDailyEvent;
  -[MesaCoreAnalyticsEvent reset](&v53, sel_reset);
  bioLockoutCount = self->_bioLockoutCount;
  self->_bioLockoutCount = (NSNumber *)&unk_251CB3428;

  totalMatchAttempts = self->_totalMatchAttempts;
  self->_totalMatchAttempts = (NSNumber *)&unk_251CB3428;

  totalMatchAttemptsSuccessful = self->_totalMatchAttemptsSuccessful;
  self->_totalMatchAttemptsSuccessful = (NSNumber *)&unk_251CB3428;

  totalMatchAttemptsFailed = self->_totalMatchAttemptsFailed;
  self->_totalMatchAttemptsFailed = (NSNumber *)&unk_251CB3428;

  totalMatchAttemptsFingerDetected = self->_totalMatchAttemptsFingerDetected;
  self->_totalMatchAttemptsFingerDetected = (NSNumber *)&unk_251CB3428;

  totalMatchAttemptsFailedFingerDetected = self->_totalMatchAttemptsFailedFingerDetected;
  self->_totalMatchAttemptsFailedFingerDetected = (NSNumber *)&unk_251CB3428;

  unlockMatchAttempts = self->_unlockMatchAttempts;
  self->_unlockMatchAttempts = (NSNumber *)&unk_251CB3428;

  unlockMatchAttemptsSuccessful = self->_unlockMatchAttemptsSuccessful;
  self->_unlockMatchAttemptsSuccessful = (NSNumber *)&unk_251CB3428;

  unlockMatchAttemptsFailed = self->_unlockMatchAttemptsFailed;
  self->_unlockMatchAttemptsFailed = (NSNumber *)&unk_251CB3428;

  unlockMatchAttemptsFingerDetected = self->_unlockMatchAttemptsFingerDetected;
  self->_unlockMatchAttemptsFingerDetected = (NSNumber *)&unk_251CB3428;

  unlockMatchAttemptsFailedFingerDetected = self->_unlockMatchAttemptsFailedFingerDetected;
  self->_unlockMatchAttemptsFailedFingerDetected = (NSNumber *)&unk_251CB3428;

  localAuthMatchAttempts = self->_localAuthMatchAttempts;
  self->_localAuthMatchAttempts = (NSNumber *)&unk_251CB3428;

  localAuthMatchAttemptsSuccessful = self->_localAuthMatchAttemptsSuccessful;
  self->_localAuthMatchAttemptsSuccessful = (NSNumber *)&unk_251CB3428;

  localAuthMatchAttemptsFailed = self->_localAuthMatchAttemptsFailed;
  self->_localAuthMatchAttemptsFailed = (NSNumber *)&unk_251CB3428;

  localAuthMatchAttemptsFingerDetected = self->_localAuthMatchAttemptsFingerDetected;
  self->_localAuthMatchAttemptsFingerDetected = (NSNumber *)&unk_251CB3428;

  localAuthMatchAttemptsFailedFingerDetected = self->_localAuthMatchAttemptsFailedFingerDetected;
  self->_localAuthMatchAttemptsFailedFingerDetected = (NSNumber *)&unk_251CB3428;

  preArmMatchAttempts = self->_preArmMatchAttempts;
  self->_preArmMatchAttempts = (NSNumber *)&unk_251CB3428;

  preArmMatchAttemptsSuccessful = self->_preArmMatchAttemptsSuccessful;
  self->_preArmMatchAttemptsSuccessful = (NSNumber *)&unk_251CB3428;

  preArmMatchAttemptsFailed = self->_preArmMatchAttemptsFailed;
  self->_preArmMatchAttemptsFailed = (NSNumber *)&unk_251CB3428;

  preArmMatchAttemptsFingerDetected = self->_preArmMatchAttemptsFingerDetected;
  self->_preArmMatchAttemptsFingerDetected = (NSNumber *)&unk_251CB3428;

  preArmMatchAttemptsFailedFingerDetected = self->_preArmMatchAttemptsFailedFingerDetected;
  self->_preArmMatchAttemptsFailedFingerDetected = (NSNumber *)&unk_251CB3428;

  totalMatchOperationsFingerDetected = self->_totalMatchOperationsFingerDetected;
  self->_totalMatchOperationsFingerDetected = (NSNumber *)&unk_251CB3428;

  totalMatchOperationsFailedRetry = self->_totalMatchOperationsFailedRetry;
  self->_totalMatchOperationsFailedRetry = (NSNumber *)&unk_251CB3428;

  subsetMatchAttempts = self->_subsetMatchAttempts;
  self->_subsetMatchAttempts = (NSNumber *)&unk_251CB3428;

  subsetMatchAttemptsSuccessful = self->_subsetMatchAttemptsSuccessful;
  self->_subsetMatchAttemptsSuccessful = (NSNumber *)&unk_251CB3428;

  subsetMatchAttemptsFailed = self->_subsetMatchAttemptsFailed;
  self->_subsetMatchAttemptsFailed = (NSNumber *)&unk_251CB3428;

  subsetMatchAttemptsFingerDetected = self->_subsetMatchAttemptsFingerDetected;
  self->_subsetMatchAttemptsFingerDetected = (NSNumber *)&unk_251CB3428;

  subsetMatchAttemptsFailedFingerDetected = self->_subsetMatchAttemptsFailedFingerDetected;
  self->_subsetMatchAttemptsFailedFingerDetected = (NSNumber *)&unk_251CB3428;

  subsetMatchAttemptsFailedTarget = self->_subsetMatchAttemptsFailedTarget;
  self->_subsetMatchAttemptsFailedTarget = (NSNumber *)&unk_251CB3428;

  nonArtefactMatchAttempts = self->_nonArtefactMatchAttempts;
  self->_nonArtefactMatchAttempts = (NSNumber *)&unk_251CB3428;

  nonArtefactMatchAttemptsSuccessful = self->_nonArtefactMatchAttemptsSuccessful;
  self->_nonArtefactMatchAttemptsSuccessful = (NSNumber *)&unk_251CB3428;

  nonArtefactMatchAttemptsFailed = self->_nonArtefactMatchAttemptsFailed;
  self->_nonArtefactMatchAttemptsFailed = (NSNumber *)&unk_251CB3428;

  nonArtefactMatchAttemptsFingerDetected = self->_nonArtefactMatchAttemptsFingerDetected;
  self->_nonArtefactMatchAttemptsFingerDetected = (NSNumber *)&unk_251CB3428;

  nonArtefactMatchAttemptsFailedFingerDetected = self->_nonArtefactMatchAttemptsFailedFingerDetected;
  self->_nonArtefactMatchAttemptsFailedFingerDetected = (NSNumber *)&unk_251CB3428;

  artefactMatchAttempts = self->_artefactMatchAttempts;
  self->_artefactMatchAttempts = (NSNumber *)&unk_251CB3428;

  artefactMatchAttemptsSuccessful = self->_artefactMatchAttemptsSuccessful;
  self->_artefactMatchAttemptsSuccessful = (NSNumber *)&unk_251CB3428;

  artefactMatchAttemptsFailed = self->_artefactMatchAttemptsFailed;
  self->_artefactMatchAttemptsFailed = (NSNumber *)&unk_251CB3428;

  artefactMatchAttemptsFingerDetected = self->_artefactMatchAttemptsFingerDetected;
  self->_artefactMatchAttemptsFingerDetected = (NSNumber *)&unk_251CB3428;

  artefactMatchAttemptsFailedFingerDetected = self->_artefactMatchAttemptsFailedFingerDetected;
  self->_artefactMatchAttemptsFailedFingerDetected = (NSNumber *)&unk_251CB3428;

  lastEnrollmentTouchesCount = self->_lastEnrollmentTouchesCount;
  self->_lastEnrollmentTouchesCount = v3;
  v47 = v3;

  lastEnrollmentDeviceOrientation = self->_lastEnrollmentDeviceOrientation;
  self->_lastEnrollmentDeviceOrientation = v4;
  v49 = v4;

  lastEnrollmentScanCount = self->_lastEnrollmentScanCount;
  self->_lastEnrollmentScanCount = v5;
  v51 = v5;

  lastEnrollmentScanGroupCount = self->_lastEnrollmentScanGroupCount;
  self->_lastEnrollmentScanGroupCount = v6;

}

- (BOOL)isBadDay
{
  unsigned int v3;

  if (-[NSNumber unsignedIntValue](self->_totalMatchOperationsFingerDetected, "unsignedIntValue") < 0xA)
    return 0;
  v3 = 1000 * -[NSNumber unsignedIntValue](self->_totalMatchOperationsFailedRetry, "unsignedIntValue");
  return v3 / -[NSNumber unsignedIntValue](self->_totalMatchOperationsFingerDetected, "unsignedIntValue") > 0xC8;
}

- (void)setOperationTime:(id)a3
{
  void *v4;
  NSNumber *operationCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *operationTimeSum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    operationCount = self->_operationCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](operationCount, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_operationCount;
    self->_operationCount = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(operationCount) = -[NSNumber unsignedIntValue](self->_operationTimeSum, "unsignedIntValue");
    v10 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v9, "numberWithUnsignedInt:", (v10 + (_DWORD)operationCount));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    operationTimeSum = self->_operationTimeSum;
    self->_operationTimeSum = v11;

  }
}

- (void)setMatcherTime:(id)a3
{
  void *v4;
  NSNumber *matcherTimeCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *matcherTimeSum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    matcherTimeCount = self->_matcherTimeCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](matcherTimeCount, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_matcherTimeCount;
    self->_matcherTimeCount = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(matcherTimeCount) = -[NSNumber unsignedIntValue](self->_matcherTimeSum, "unsignedIntValue");
    v10 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v9, "numberWithUnsignedInt:", (v10 + (_DWORD)matcherTimeCount));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matcherTimeSum = self->_matcherTimeSum;
    self->_matcherTimeSum = v11;

  }
}

- (void)setMatcherTimeMatch:(id)a3
{
  void *v4;
  NSNumber *matcherTimeMatchCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *matcherTimeMatchSum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    matcherTimeMatchCount = self->_matcherTimeMatchCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](matcherTimeMatchCount, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_matcherTimeMatchCount;
    self->_matcherTimeMatchCount = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(matcherTimeMatchCount) = -[NSNumber unsignedIntValue](self->_matcherTimeMatchSum, "unsignedIntValue");
    v10 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v9, "numberWithUnsignedInt:", (v10 + (_DWORD)matcherTimeMatchCount));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matcherTimeMatchSum = self->_matcherTimeMatchSum;
    self->_matcherTimeMatchSum = v11;

  }
}

- (void)setMatcherTimeNoMatch:(id)a3
{
  void *v4;
  NSNumber *matcherTimeNoMatchCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *matcherTimeNoMatchSum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    matcherTimeNoMatchCount = self->_matcherTimeNoMatchCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](matcherTimeNoMatchCount, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_matcherTimeNoMatchCount;
    self->_matcherTimeNoMatchCount = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(matcherTimeNoMatchCount) = -[NSNumber unsignedIntValue](self->_matcherTimeNoMatchSum, "unsignedIntValue");
    v10 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v9, "numberWithUnsignedInt:", (v10 + (_DWORD)matcherTimeNoMatchCount));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matcherTimeNoMatchSum = self->_matcherTimeNoMatchSum;
    self->_matcherTimeNoMatchSum = v11;

  }
}

- (void)setCaptureTime:(id)a3
{
  void *v4;
  NSNumber *captureTimeCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *captureTimeSum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    captureTimeCount = self->_captureTimeCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](captureTimeCount, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_captureTimeCount;
    self->_captureTimeCount = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(captureTimeCount) = -[NSNumber unsignedIntValue](self->_captureTimeSum, "unsignedIntValue");
    v10 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v9, "numberWithUnsignedInt:", (v10 + (_DWORD)captureTimeCount));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    captureTimeSum = self->_captureTimeSum;
    self->_captureTimeSum = v11;

  }
}

- (void)setDrxStrengthPctCol2:(id)a3 rawValue:(id)a4
{
  id v7;
  NSNumber *v8;
  NSNumber *drxStrengthPctCol2BinCount;
  NSNumber *v10;
  NSNumber *drxStrengthPctCol2BinSum;
  NSNumber *v12;
  NSNumber *drxStrengthPctCol2RawCount;
  void *v14;
  float v15;
  float v16;
  float v17;
  double v18;
  NSNumber *v19;
  NSNumber *drxStrengthPctCol2RawSum;
  id v21;

  v21 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_drxStrengthPctCol2Bin, a3);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2Raw, a4);
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_drxStrengthPctCol2BinCount, "unsignedIntValue") + 1);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    drxStrengthPctCol2BinCount = self->_drxStrengthPctCol2BinCount;
    self->_drxStrengthPctCol2BinCount = v8;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v21, "unsignedIntValue")+ -[NSNumber unsignedIntValue](self->_drxStrengthPctCol2BinSum, "unsignedIntValue"));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    drxStrengthPctCol2BinSum = self->_drxStrengthPctCol2BinSum;
    self->_drxStrengthPctCol2BinSum = v10;

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_drxStrengthPctCol2RawCount, "unsignedIntValue") + 1);
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      drxStrengthPctCol2RawCount = self->_drxStrengthPctCol2RawCount;
      self->_drxStrengthPctCol2RawCount = v12;

      v14 = (void *)MEMORY[0x24BDD16E0];
      -[NSNumber floatValue](self->_drxStrengthPctCol2RawSum, "floatValue");
      v16 = v15;
      objc_msgSend(v7, "floatValue");
      *(float *)&v18 = v16 + v17;
      objc_msgSend(v14, "numberWithFloat:", v18);
      v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      drxStrengthPctCol2RawSum = self->_drxStrengthPctCol2RawSum;
      self->_drxStrengthPctCol2RawSum = v19;

    }
  }

}

- (void)setDrxStrengthPctCol7:(id)a3 rawValue:(id)a4
{
  id v7;
  NSNumber *v8;
  NSNumber *drxStrengthPctCol7BinCount;
  NSNumber *v10;
  NSNumber *drxStrengthPctCol7BinSum;
  NSNumber *v12;
  NSNumber *drxStrengthPctCol7RawCount;
  void *v14;
  float v15;
  float v16;
  float v17;
  double v18;
  NSNumber *v19;
  NSNumber *drxStrengthPctCol7RawSum;
  id v21;

  v21 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_drxStrengthPctCol7Bin, a3);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7Raw, a4);
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_drxStrengthPctCol7BinCount, "unsignedIntValue") + 1);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    drxStrengthPctCol7BinCount = self->_drxStrengthPctCol7BinCount;
    self->_drxStrengthPctCol7BinCount = v8;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v21, "unsignedIntValue")+ -[NSNumber unsignedIntValue](self->_drxStrengthPctCol7BinSum, "unsignedIntValue"));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    drxStrengthPctCol7BinSum = self->_drxStrengthPctCol7BinSum;
    self->_drxStrengthPctCol7BinSum = v10;

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_drxStrengthPctCol7RawCount, "unsignedIntValue") + 1);
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      drxStrengthPctCol7RawCount = self->_drxStrengthPctCol7RawCount;
      self->_drxStrengthPctCol7RawCount = v12;

      v14 = (void *)MEMORY[0x24BDD16E0];
      -[NSNumber floatValue](self->_drxStrengthPctCol7RawSum, "floatValue");
      v16 = v15;
      objc_msgSend(v7, "floatValue");
      *(float *)&v18 = v16 + v17;
      objc_msgSend(v14, "numberWithFloat:", v18);
      v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      drxStrengthPctCol7RawSum = self->_drxStrengthPctCol7RawSum;
      self->_drxStrengthPctCol7RawSum = v19;

    }
  }

}

- (void)setMaxFingerToProbeAttenuation:(id)a3 calculateAvg:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  NSNumber *v14;
  NSNumber *maxFingerToProbeAttenuationCount;
  void *v16;
  float v17;
  float v18;
  float v19;
  double v20;
  NSNumber *v21;
  NSNumber *maxFingerToProbeAttenuationSum;
  id v23;

  v4 = a4;
  v7 = a3;
  if (v7)
  {
    v23 = v7;
    objc_msgSend(v7, "floatValue");
    v9 = v8;
    -[NSNumber floatValue](self->_maxFingerToProbeAttenuationMax, "floatValue");
    if (v9 > v10)
      objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationMax, a3);
    if (!self->_maxFingerToProbeAttenuationMin
      || (objc_msgSend(v23, "floatValue"),
          v12 = v11,
          -[NSNumber floatValue](self->_maxFingerToProbeAttenuationMin, "floatValue"),
          v12 < v13))
    {
      objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationMin, a3);
    }
    v7 = v23;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_maxFingerToProbeAttenuationCount, "unsignedIntValue") + 1);
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      maxFingerToProbeAttenuationCount = self->_maxFingerToProbeAttenuationCount;
      self->_maxFingerToProbeAttenuationCount = v14;

      v16 = (void *)MEMORY[0x24BDD16E0];
      -[NSNumber floatValue](self->_maxFingerToProbeAttenuationSum, "floatValue");
      v18 = v17;
      objc_msgSend(v23, "floatValue");
      *(float *)&v20 = v18 + v19;
      objc_msgSend(v16, "numberWithFloat:", v20);
      v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      maxFingerToProbeAttenuationSum = self->_maxFingerToProbeAttenuationSum;
      self->_maxFingerToProbeAttenuationSum = v21;

      v7 = v23;
    }
  }

}

- (void)setImagePixelOutlierCount:(id)a3
{
  void *v4;
  NSNumber *imagePixelOutlierCountCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *imagePixelOutlierCountSum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    imagePixelOutlierCountCount = self->_imagePixelOutlierCountCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](imagePixelOutlierCountCount, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_imagePixelOutlierCountCount;
    self->_imagePixelOutlierCountCount = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(imagePixelOutlierCountCount) = -[NSNumber unsignedIntValue](self->_imagePixelOutlierCountSum, "unsignedIntValue");
    v10 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v9, "numberWithUnsignedInt:", (v10 + (_DWORD)imagePixelOutlierCountCount));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imagePixelOutlierCountSum = self->_imagePixelOutlierCountSum;
    self->_imagePixelOutlierCountSum = v11;

  }
}

- (void)setNumPxOutliersPhase1:(id)a3
{
  void *v4;
  NSNumber *numPxOutliersPhase1Count;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *numPxOutliersPhase1Sum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    numPxOutliersPhase1Count = self->_numPxOutliersPhase1Count;
    v6 = a3;
    objc_msgSend(v4, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](numPxOutliersPhase1Count, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_numPxOutliersPhase1Count;
    self->_numPxOutliersPhase1Count = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(numPxOutliersPhase1Count) = -[NSNumber unsignedIntValue](self->_numPxOutliersPhase1Sum, "unsignedIntValue");
    v10 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v9, "numberWithUnsignedInt:", (v10 + (_DWORD)numPxOutliersPhase1Count));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    numPxOutliersPhase1Sum = self->_numPxOutliersPhase1Sum;
    self->_numPxOutliersPhase1Sum = v11;

  }
}

- (void)setNumPxOutliersPhase2:(id)a3
{
  void *v4;
  NSNumber *numPxOutliersPhase2Count;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *numPxOutliersPhase2Sum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    numPxOutliersPhase2Count = self->_numPxOutliersPhase2Count;
    v6 = a3;
    objc_msgSend(v4, "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](numPxOutliersPhase2Count, "unsignedIntValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_numPxOutliersPhase2Count;
    self->_numPxOutliersPhase2Count = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(numPxOutliersPhase2Count) = -[NSNumber unsignedIntValue](self->_numPxOutliersPhase2Sum, "unsignedIntValue");
    v10 = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v9, "numberWithUnsignedInt:", (v10 + (_DWORD)numPxOutliersPhase2Count));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    numPxOutliersPhase2Sum = self->_numPxOutliersPhase2Sum;
    self->_numPxOutliersPhase2Sum = v11;

  }
}

- (void)setArtefactScore:(id)a3
{
  void *v4;
  NSNumber *artefactScoreCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  int v10;
  NSNumber *v11;
  NSNumber *artefactScoreSum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    artefactScoreCount = self->_artefactScoreCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithInt:", -[NSNumber intValue](artefactScoreCount, "intValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_artefactScoreCount;
    self->_artefactScoreCount = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    LODWORD(artefactScoreCount) = -[NSNumber intValue](self->_artefactScoreSum, "intValue");
    v10 = objc_msgSend(v6, "intValue");

    objc_msgSend(v9, "numberWithInt:", (v10 + (_DWORD)artefactScoreCount));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactScoreSum = self->_artefactScoreSum;
    self->_artefactScoreSum = v11;

  }
}

- (void)setArtefactStrength:(id)a3
{
  void *v4;
  NSNumber *artefactStrengthCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  NSNumber *v15;
  NSNumber *artefactStrengthSum;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    artefactStrengthCount = self->_artefactStrengthCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithInt:", -[NSNumber intValue](artefactStrengthCount, "intValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_artefactStrengthCount;
    self->_artefactStrengthCount = v7;

    v9 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactStrengthSum, "floatValue");
    v11 = v10;
    objc_msgSend(v6, "floatValue");
    v13 = v12;

    *(float *)&v14 = v11 + v13;
    objc_msgSend(v9, "numberWithFloat:", v14);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactStrengthSum = self->_artefactStrengthSum;
    self->_artefactStrengthSum = v15;

  }
}

- (void)setArtefactNonlinearity:(id)a3
{
  void *v4;
  NSNumber *artefactNonlinearityCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  double v15;
  NSNumber *v16;
  NSNumber *artefactNonlinearityAverage;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  double v24;
  NSNumber *v25;
  NSNumber *artefactNonlinearityM2;
  void *v27;
  float v28;
  float v29;
  float v30;
  double v31;
  NSNumber *v32;
  NSNumber *artefactNonlinearitySum;
  void *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  double v41;
  NSNumber *v42;
  NSNumber *artefactNonlinearitySumSq;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    artefactNonlinearityCount = self->_artefactNonlinearityCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithInt:", -[NSNumber intValue](artefactNonlinearityCount, "intValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_artefactNonlinearityCount;
    self->_artefactNonlinearityCount = v7;

    objc_msgSend(v6, "floatValue");
    v10 = v9;
    -[NSNumber floatValue](self->_artefactNonlinearityAverage, "floatValue");
    v12 = v10 - v11;
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactNonlinearityAverage, "floatValue");
    *(float *)&v15 = v14 + (float)(v12 / (float)-[NSNumber intValue](self->_artefactNonlinearityCount, "intValue"));
    objc_msgSend(v13, "numberWithFloat:", v15);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactNonlinearityAverage = self->_artefactNonlinearityAverage;
    self->_artefactNonlinearityAverage = v16;

    objc_msgSend(v6, "floatValue");
    v19 = v18;
    -[NSNumber floatValue](self->_artefactNonlinearityAverage, "floatValue");
    v21 = v19 - v20;
    v22 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactNonlinearityM2, "floatValue");
    *(float *)&v24 = v23 + (float)(v12 * v21);
    objc_msgSend(v22, "numberWithFloat:", v24);
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactNonlinearityM2 = self->_artefactNonlinearityM2;
    self->_artefactNonlinearityM2 = v25;

    v27 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactNonlinearitySum, "floatValue");
    v29 = v28;
    objc_msgSend(v6, "floatValue");
    *(float *)&v31 = v29 + v30;
    objc_msgSend(v27, "numberWithFloat:", v31);
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactNonlinearitySum = self->_artefactNonlinearitySum;
    self->_artefactNonlinearitySum = v32;

    v34 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactNonlinearitySumSq, "floatValue");
    v36 = v35;
    objc_msgSend(v6, "floatValue");
    v38 = v37;
    objc_msgSend(v6, "floatValue");
    v40 = v39;

    *(float *)&v41 = v36 + (float)(v38 * v40);
    objc_msgSend(v34, "numberWithFloat:", v41);
    v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactNonlinearitySumSq = self->_artefactNonlinearitySumSq;
    self->_artefactNonlinearitySumSq = v42;

  }
}

- (void)setArtefactAnchorX:(id)a3
{
  void *v4;
  NSNumber *artefactAnchorXCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  double v15;
  NSNumber *v16;
  NSNumber *artefactAnchorXAverage;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  double v24;
  NSNumber *v25;
  NSNumber *artefactAnchorXM2;
  void *v27;
  float v28;
  float v29;
  float v30;
  double v31;
  NSNumber *v32;
  NSNumber *artefactAnchorXSum;
  void *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  double v41;
  NSNumber *v42;
  NSNumber *artefactAnchorXSumSq;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    artefactAnchorXCount = self->_artefactAnchorXCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithInt:", -[NSNumber intValue](artefactAnchorXCount, "intValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_artefactAnchorXCount;
    self->_artefactAnchorXCount = v7;

    objc_msgSend(v6, "floatValue");
    v10 = v9;
    -[NSNumber floatValue](self->_artefactAnchorXAverage, "floatValue");
    v12 = v10 - v11;
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorXAverage, "floatValue");
    *(float *)&v15 = v14 + (float)(v12 / (float)-[NSNumber intValue](self->_artefactAnchorXCount, "intValue"));
    objc_msgSend(v13, "numberWithFloat:", v15);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorXAverage = self->_artefactAnchorXAverage;
    self->_artefactAnchorXAverage = v16;

    objc_msgSend(v6, "floatValue");
    v19 = v18;
    -[NSNumber floatValue](self->_artefactAnchorXAverage, "floatValue");
    v21 = v19 - v20;
    v22 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorXM2, "floatValue");
    *(float *)&v24 = v23 + (float)(v12 * v21);
    objc_msgSend(v22, "numberWithFloat:", v24);
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorXM2 = self->_artefactAnchorXM2;
    self->_artefactAnchorXM2 = v25;

    v27 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorXSum, "floatValue");
    v29 = v28;
    objc_msgSend(v6, "floatValue");
    *(float *)&v31 = v29 + v30;
    objc_msgSend(v27, "numberWithFloat:", v31);
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorXSum = self->_artefactAnchorXSum;
    self->_artefactAnchorXSum = v32;

    v34 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorXSumSq, "floatValue");
    v36 = v35;
    objc_msgSend(v6, "floatValue");
    v38 = v37;
    objc_msgSend(v6, "floatValue");
    v40 = v39;

    *(float *)&v41 = v36 + (float)(v38 * v40);
    objc_msgSend(v34, "numberWithFloat:", v41);
    v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorXSumSq = self->_artefactAnchorXSumSq;
    self->_artefactAnchorXSumSq = v42;

  }
}

- (void)setArtefactAnchorY:(id)a3
{
  void *v4;
  NSNumber *artefactAnchorYCount;
  id v6;
  NSNumber *v7;
  NSNumber *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  double v15;
  NSNumber *v16;
  NSNumber *artefactAnchorYAverage;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  double v24;
  NSNumber *v25;
  NSNumber *artefactAnchorYM2;
  void *v27;
  float v28;
  float v29;
  float v30;
  double v31;
  NSNumber *v32;
  NSNumber *artefactAnchorYSum;
  void *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  double v41;
  NSNumber *v42;
  NSNumber *artefactAnchorYSumSq;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    artefactAnchorYCount = self->_artefactAnchorYCount;
    v6 = a3;
    objc_msgSend(v4, "numberWithInt:", -[NSNumber intValue](artefactAnchorYCount, "intValue") + 1);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_artefactAnchorYCount;
    self->_artefactAnchorYCount = v7;

    objc_msgSend(v6, "floatValue");
    v10 = v9;
    -[NSNumber floatValue](self->_artefactAnchorYAverage, "floatValue");
    v12 = v10 - v11;
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorYAverage, "floatValue");
    *(float *)&v15 = v14 + (float)(v12 / (float)-[NSNumber intValue](self->_artefactAnchorYCount, "intValue"));
    objc_msgSend(v13, "numberWithFloat:", v15);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorYAverage = self->_artefactAnchorYAverage;
    self->_artefactAnchorYAverage = v16;

    objc_msgSend(v6, "floatValue");
    v19 = v18;
    -[NSNumber floatValue](self->_artefactAnchorYAverage, "floatValue");
    v21 = v19 - v20;
    v22 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorYM2, "floatValue");
    *(float *)&v24 = v23 + (float)(v12 * v21);
    objc_msgSend(v22, "numberWithFloat:", v24);
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorYM2 = self->_artefactAnchorYM2;
    self->_artefactAnchorYM2 = v25;

    v27 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorYSum, "floatValue");
    v29 = v28;
    objc_msgSend(v6, "floatValue");
    *(float *)&v31 = v29 + v30;
    objc_msgSend(v27, "numberWithFloat:", v31);
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorYSum = self->_artefactAnchorYSum;
    self->_artefactAnchorYSum = v32;

    v34 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorYSumSq, "floatValue");
    v36 = v35;
    objc_msgSend(v6, "floatValue");
    v38 = v37;
    objc_msgSend(v6, "floatValue");
    v40 = v39;

    *(float *)&v41 = v36 + (float)(v38 * v40);
    objc_msgSend(v34, "numberWithFloat:", v41);
    v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorYSumSq = self->_artefactAnchorYSumSq;
    self->_artefactAnchorYSumSq = v42;

  }
}

- (void)calculateDailyValues
{
  NSObject *v3;
  NSNumber *v4;
  NSNumber *operationTimeAverage;
  NSNumber *v6;
  NSNumber *matcherTimeAverage;
  NSNumber *v8;
  NSNumber *matcherTimeMatchAverage;
  NSNumber *v10;
  NSNumber *matcherTimeNoMatchAverage;
  NSNumber *v12;
  NSNumber *captureTimeAverage;
  NSNumber *v14;
  NSNumber *totalFRR;
  NSNumber *v16;
  NSNumber *unlockFRR;
  NSNumber *v18;
  NSNumber *prearmFRR;
  NSNumber *v20;
  NSNumber *localAuthFRR;
  NSNumber *v22;
  NSNumber *badDayFRR;
  NSNumber *v24;
  NSNumber *badDay;
  NSNumber *v26;
  NSNumber *subsetFRR;
  NSNumber *v28;
  NSNumber *subsetTargetFRR;
  NSNumber *v30;
  NSNumber *subsetMatchFRR;
  NSNumber *v32;
  NSNumber *nonArtefactFRR;
  NSNumber *v34;
  NSNumber *artefactFRR;
  NSNumber *v36;
  NSNumber *artefactPrevalence;
  NSNumber *v38;
  NSNumber *drxStrengthPctCol2BinAverage;
  NSNumber *v40;
  NSNumber *drxStrengthPctCol7BinAverage;
  void *v42;
  float v43;
  double v44;
  NSNumber *v45;
  NSNumber *drxStrengthPctCol2RawAverage;
  void *v47;
  float v48;
  double v49;
  NSNumber *v50;
  NSNumber *drxStrengthPctCol7RawAverage;
  void *v52;
  float v53;
  double v54;
  NSNumber *v55;
  NSNumber *maxFingerToProbeAttenuationAverage;
  NSNumber *v57;
  NSNumber *imagePixelOutlierCountAverage;
  NSNumber *v59;
  NSNumber *numPxOutliersPhase1Average;
  NSNumber *v61;
  NSNumber *numPxOutliersPhase2Average;
  NSNumber *v63;
  NSNumber *artefactScoreAverage;
  void *v65;
  float v66;
  double v67;
  NSNumber *v68;
  NSNumber *artefactStrengthAverage;
  void *v70;
  float v71;
  double v72;
  NSNumber *v73;
  NSNumber *artefactNonlinearitySTD;
  void *v75;
  float v76;
  double v77;
  NSNumber *v78;
  NSNumber *artefactAnchorXSTD;
  void *v80;
  float v81;
  double v82;
  NSNumber *v83;
  NSNumber *artefactAnchorYSTD;
  NSNumber *v85;
  NSNumber *enrolledIdentityCount;
  uint8_t v87[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v87 = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsDailyEvent calculateDailyValues\n", v87, 2u);
  }
  if (-[NSNumber unsignedIntValue](self->_operationCount, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_operationTimeSum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_operationCount, "unsignedIntValue"));
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    operationTimeAverage = self->_operationTimeAverage;
    self->_operationTimeAverage = v4;

  }
  if (-[NSNumber unsignedIntValue](self->_matcherTimeCount, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_matcherTimeSum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_matcherTimeCount, "unsignedIntValue"));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matcherTimeAverage = self->_matcherTimeAverage;
    self->_matcherTimeAverage = v6;

  }
  if (-[NSNumber unsignedIntValue](self->_matcherTimeMatchCount, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_matcherTimeMatchSum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_matcherTimeMatchCount, "unsignedIntValue"));
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matcherTimeMatchAverage = self->_matcherTimeMatchAverage;
    self->_matcherTimeMatchAverage = v8;

  }
  if (-[NSNumber unsignedIntValue](self->_matcherTimeNoMatchCount, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_matcherTimeNoMatchSum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_matcherTimeNoMatchCount, "unsignedIntValue"));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    matcherTimeNoMatchAverage = self->_matcherTimeNoMatchAverage;
    self->_matcherTimeNoMatchAverage = v10;

  }
  if (-[NSNumber unsignedIntValue](self->_captureTimeCount, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_captureTimeSum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_captureTimeCount, "unsignedIntValue"));
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    captureTimeAverage = self->_captureTimeAverage;
    self->_captureTimeAverage = v12;

  }
  if (-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_totalMatchAttemptsFailedFingerDetected, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_totalMatchAttemptsFingerDetected, "unsignedIntValue"));
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    totalFRR = self->_totalFRR;
    self->_totalFRR = v14;

  }
  if (-[NSNumber unsignedIntValue](self->_unlockMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_unlockMatchAttemptsFailedFingerDetected, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_unlockMatchAttemptsFingerDetected, "unsignedIntValue"));
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    unlockFRR = self->_unlockFRR;
    self->_unlockFRR = v16;

  }
  if (-[NSNumber unsignedIntValue](self->_preArmMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_preArmMatchAttemptsFailedFingerDetected, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_preArmMatchAttemptsFingerDetected, "unsignedIntValue"));
    v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    prearmFRR = self->_prearmFRR;
    self->_prearmFRR = v18;

  }
  if (-[NSNumber unsignedIntValue](self->_localAuthMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_localAuthMatchAttemptsFailedFingerDetected, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_localAuthMatchAttemptsFingerDetected, "unsignedIntValue"));
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    localAuthFRR = self->_localAuthFRR;
    self->_localAuthFRR = v20;

  }
  if (-[NSNumber unsignedIntValue](self->_totalMatchOperationsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_totalMatchOperationsFailedRetry, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_totalMatchOperationsFingerDetected, "unsignedIntValue"));
    v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    badDayFRR = self->_badDayFRR;
    self->_badDayFRR = v22;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MesaCoreAnalyticsDailyEvent isBadDay](self, "isBadDay"));
  v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  badDay = self->_badDay;
  self->_badDay = v24;

  if (-[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* (-[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFailedTarget, "unsignedIntValue")+ -[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFailedFingerDetected, "unsignedIntValue"))/ -[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFingerDetected, "unsignedIntValue"));
    v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    subsetFRR = self->_subsetFRR;
    self->_subsetFRR = v26;

  }
  if (-[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFailedTarget, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFingerDetected, "unsignedIntValue"));
    v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    subsetTargetFRR = self->_subsetTargetFRR;
    self->_subsetTargetFRR = v28;

  }
  if (-[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFailedFingerDetected, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_subsetMatchAttemptsFingerDetected, "unsignedIntValue"));
    v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    subsetMatchFRR = self->_subsetMatchFRR;
    self->_subsetMatchFRR = v30;

  }
  if (-[NSNumber unsignedIntValue](self->_nonArtefactMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_nonArtefactMatchAttemptsFailedFingerDetected, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_nonArtefactMatchAttemptsFingerDetected, "unsignedIntValue"));
    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    nonArtefactFRR = self->_nonArtefactFRR;
    self->_nonArtefactFRR = v32;

  }
  if (-[NSNumber unsignedIntValue](self->_artefactMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_artefactMatchAttemptsFailedFingerDetected, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_artefactMatchAttemptsFingerDetected, "unsignedIntValue"));
    v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactFRR = self->_artefactFRR;
    self->_artefactFRR = v34;

  }
  if (-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFingerDetected, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1000* -[NSNumber unsignedIntValue](self->_artefactMatchAttemptsFingerDetected, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_totalMatchAttemptsFingerDetected, "unsignedIntValue"));
    v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactPrevalence = self->_artefactPrevalence;
    self->_artefactPrevalence = v36;

  }
  if (-[NSNumber unsignedIntValue](self->_drxStrengthPctCol2BinCount, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_drxStrengthPctCol2BinSum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_drxStrengthPctCol2BinCount, "unsignedIntValue"));
    v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    drxStrengthPctCol2BinAverage = self->_drxStrengthPctCol2BinAverage;
    self->_drxStrengthPctCol2BinAverage = v38;

  }
  if (-[NSNumber unsignedIntValue](self->_drxStrengthPctCol7BinCount, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_drxStrengthPctCol7BinSum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_drxStrengthPctCol7BinCount, "unsignedIntValue"));
    v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    drxStrengthPctCol7BinAverage = self->_drxStrengthPctCol7BinAverage;
    self->_drxStrengthPctCol7BinAverage = v40;

  }
  if (-[NSNumber unsignedIntValue](self->_drxStrengthPctCol2RawCount, "unsignedIntValue"))
  {
    v42 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_drxStrengthPctCol2RawSum, "floatValue");
    *(float *)&v44 = v43 / (float)-[NSNumber unsignedIntValue](self->_drxStrengthPctCol2RawCount, "unsignedIntValue");
    objc_msgSend(v42, "numberWithFloat:", v44);
    v45 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    drxStrengthPctCol2RawAverage = self->_drxStrengthPctCol2RawAverage;
    self->_drxStrengthPctCol2RawAverage = v45;

  }
  if (-[NSNumber unsignedIntValue](self->_drxStrengthPctCol7RawCount, "unsignedIntValue"))
  {
    v47 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_drxStrengthPctCol7RawSum, "floatValue");
    *(float *)&v49 = v48 / (float)-[NSNumber unsignedIntValue](self->_drxStrengthPctCol7RawCount, "unsignedIntValue");
    objc_msgSend(v47, "numberWithFloat:", v49);
    v50 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    drxStrengthPctCol7RawAverage = self->_drxStrengthPctCol7RawAverage;
    self->_drxStrengthPctCol7RawAverage = v50;

  }
  if (-[NSNumber unsignedIntValue](self->_maxFingerToProbeAttenuationCount, "unsignedIntValue"))
  {
    v52 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_maxFingerToProbeAttenuationSum, "floatValue");
    *(float *)&v54 = v53
                   / (float)-[NSNumber unsignedIntValue](self->_maxFingerToProbeAttenuationCount, "unsignedIntValue");
    objc_msgSend(v52, "numberWithFloat:", v54);
    v55 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    maxFingerToProbeAttenuationAverage = self->_maxFingerToProbeAttenuationAverage;
    self->_maxFingerToProbeAttenuationAverage = v55;

  }
  if (-[NSNumber unsignedIntValue](self->_imagePixelOutlierCountCount, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_imagePixelOutlierCountSum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_imagePixelOutlierCountCount, "unsignedIntValue"));
    v57 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imagePixelOutlierCountAverage = self->_imagePixelOutlierCountAverage;
    self->_imagePixelOutlierCountAverage = v57;

  }
  if (-[NSNumber unsignedIntValue](self->_numPxOutliersPhase1Count, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_numPxOutliersPhase1Sum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_numPxOutliersPhase1Count, "unsignedIntValue"));
    v59 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    numPxOutliersPhase1Average = self->_numPxOutliersPhase1Average;
    self->_numPxOutliersPhase1Average = v59;

  }
  if (-[NSNumber unsignedIntValue](self->_numPxOutliersPhase2Count, "unsignedIntValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_numPxOutliersPhase2Sum, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_numPxOutliersPhase2Count, "unsignedIntValue"));
    v61 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    numPxOutliersPhase2Average = self->_numPxOutliersPhase2Average;
    self->_numPxOutliersPhase2Average = v61;

  }
  if (-[NSNumber intValue](self->_artefactScoreCount, "intValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (-[NSNumber intValue](self->_artefactScoreSum, "intValue")/ -[NSNumber intValue](self->_artefactScoreCount, "intValue")));
    v63 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactScoreAverage = self->_artefactScoreAverage;
    self->_artefactScoreAverage = v63;

  }
  if (-[NSNumber intValue](self->_artefactStrengthCount, "intValue"))
  {
    v65 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactStrengthSum, "floatValue");
    *(float *)&v67 = v66 / (float)-[NSNumber intValue](self->_artefactStrengthCount, "intValue");
    objc_msgSend(v65, "numberWithFloat:", v67);
    v68 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactStrengthAverage = self->_artefactStrengthAverage;
    self->_artefactStrengthAverage = v68;

  }
  if (-[NSNumber intValue](self->_artefactNonlinearityCount, "intValue") >= 2)
  {
    v70 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactNonlinearityM2, "floatValue");
    *(float *)&v72 = sqrtf(v71 / (float)-[NSNumber intValue](self->_artefactNonlinearityCount, "intValue"));
    objc_msgSend(v70, "numberWithFloat:", v72);
    v73 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactNonlinearitySTD = self->_artefactNonlinearitySTD;
    self->_artefactNonlinearitySTD = v73;

  }
  if (-[NSNumber intValue](self->_artefactAnchorXCount, "intValue") >= 2)
  {
    v75 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorXM2, "floatValue");
    *(float *)&v77 = sqrtf(v76 / (float)-[NSNumber intValue](self->_artefactAnchorXCount, "intValue"));
    objc_msgSend(v75, "numberWithFloat:", v77);
    v78 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorXSTD = self->_artefactAnchorXSTD;
    self->_artefactAnchorXSTD = v78;

  }
  if (-[NSNumber intValue](self->_artefactAnchorYCount, "intValue") >= 2)
  {
    v80 = (void *)MEMORY[0x24BDD16E0];
    -[NSNumber floatValue](self->_artefactAnchorYM2, "floatValue");
    *(float *)&v82 = sqrtf(v81 / (float)-[NSNumber intValue](self->_artefactAnchorYCount, "intValue"));
    objc_msgSend(v80, "numberWithFloat:", v82);
    v83 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    artefactAnchorYSTD = self->_artefactAnchorYSTD;
    self->_artefactAnchorYSTD = v83;

  }
  -[MesaCoreAnalyticsEvent enrolledTemplatesCount](self, "enrolledTemplatesCount");
  v85 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  enrolledIdentityCount = self->_enrolledIdentityCount;
  self->_enrolledIdentityCount = v85;

  -[BiometricKitCoreAnalyticsEvent updateBoundedFieldValue](self, "updateBoundedFieldValue");
}

- (void)setTimeSinceSecondLastEnrollment:(id)a3
{
  void *v5;
  NSUInteger v6;
  uint64_t v7;
  NSNumber *v8;
  NSNumber *timeSinceSecondLastEnrollmentBinned;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_timeSinceSecondLastEnrollment, a3);
  if (-[NSNumber unsignedIntegerValue](self->_timeSinceSecondLastEnrollment, "unsignedIntegerValue") < 0x80)
  {
    v8 = (NSNumber *)v10;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = -[NSNumber unsignedIntegerValue](self->_timeSinceSecondLastEnrollment, "unsignedIntegerValue");
    v7 = ((v6 - 128) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    objc_msgSend(v5, "numberWithUnsignedInteger:", ((v7 + ((v6 - 128 - v7) >> 1)) >> 2) + 128);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  timeSinceSecondLastEnrollmentBinned = self->_timeSinceSecondLastEnrollmentBinned;
  self->_timeSinceSecondLastEnrollmentBinned = v8;

}

- (NSNumber)unlockEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setUnlockEnabled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSNumber)applePayEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setApplePayEnabled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSNumber)badDay
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setBadDay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSNumber)operationTimeAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setOperationTimeAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSNumber)matcherTimeAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setMatcherTimeAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSNumber)matcherTimeMatchAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setMatcherTimeMatchAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSNumber)matcherTimeNoMatchAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setMatcherTimeNoMatchAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSNumber)captureTimeAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCaptureTimeAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSNumber)enrolledIdentityCount
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setEnrolledIdentityCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSNumber)enrolledUserCount
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setEnrolledUserCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSNumber)bioLockoutCount
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setBioLockoutCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSNumber)totalMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setTotalMatchAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSNumber)totalMatchAttemptsSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 488, 1);
}

- (void)setTotalMatchAttemptsSuccessful:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (NSNumber)totalMatchAttemptsFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 496, 1);
}

- (void)setTotalMatchAttemptsFailed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (NSNumber)totalMatchAttemptsFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setTotalMatchAttemptsFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (NSNumber)totalMatchAttemptsFailedFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 512, 1);
}

- (void)setTotalMatchAttemptsFailedFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (NSNumber)unlockMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 520, 1);
}

- (void)setUnlockMatchAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (NSNumber)unlockMatchAttemptsSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 528, 1);
}

- (void)setUnlockMatchAttemptsSuccessful:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (NSNumber)unlockMatchAttemptsFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 536, 1);
}

- (void)setUnlockMatchAttemptsFailed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (NSNumber)unlockMatchAttemptsFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setUnlockMatchAttemptsFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (NSNumber)unlockMatchAttemptsFailedFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 552, 1);
}

- (void)setUnlockMatchAttemptsFailedFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (NSNumber)localAuthMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 560, 1);
}

- (void)setLocalAuthMatchAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (NSNumber)localAuthMatchAttemptsSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 568, 1);
}

- (void)setLocalAuthMatchAttemptsSuccessful:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (NSNumber)localAuthMatchAttemptsFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 576, 1);
}

- (void)setLocalAuthMatchAttemptsFailed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (NSNumber)localAuthMatchAttemptsFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 584, 1);
}

- (void)setLocalAuthMatchAttemptsFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (NSNumber)localAuthMatchAttemptsFailedFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 592, 1);
}

- (void)setLocalAuthMatchAttemptsFailedFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (NSNumber)preArmMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 600, 1);
}

- (void)setPreArmMatchAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (NSNumber)preArmMatchAttemptsSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 608, 1);
}

- (void)setPreArmMatchAttemptsSuccessful:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 608);
}

- (NSNumber)preArmMatchAttemptsFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 616, 1);
}

- (void)setPreArmMatchAttemptsFailed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (NSNumber)preArmMatchAttemptsFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 624, 1);
}

- (void)setPreArmMatchAttemptsFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (NSNumber)preArmMatchAttemptsFailedFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 632, 1);
}

- (void)setPreArmMatchAttemptsFailedFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 632);
}

- (NSNumber)templateEnrollmentsCount
{
  return (NSNumber *)objc_getProperty(self, a2, 640, 1);
}

- (void)setTemplateEnrollmentsCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (NSNumber)totalMatchOperationsFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 648, 1);
}

- (void)setTotalMatchOperationsFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (NSNumber)totalMatchOperationsFailedRetry
{
  return (NSNumber *)objc_getProperty(self, a2, 656, 1);
}

- (void)setTotalMatchOperationsFailedRetry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (NSNumber)subsetMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 664, 1);
}

- (void)setSubsetMatchAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (NSNumber)subsetMatchAttemptsSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 672, 1);
}

- (void)setSubsetMatchAttemptsSuccessful:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (NSNumber)subsetMatchAttemptsFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 680, 1);
}

- (void)setSubsetMatchAttemptsFailed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 680);
}

- (NSNumber)subsetMatchAttemptsFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 688, 1);
}

- (void)setSubsetMatchAttemptsFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 688);
}

- (NSNumber)subsetMatchAttemptsFailedFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 696, 1);
}

- (void)setSubsetMatchAttemptsFailedFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 696);
}

- (NSNumber)subsetMatchAttemptsFailedTarget
{
  return (NSNumber *)objc_getProperty(self, a2, 704, 1);
}

- (void)setSubsetMatchAttemptsFailedTarget:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 704);
}

- (NSNumber)totalScanGroupCount
{
  return (NSNumber *)objc_getProperty(self, a2, 712, 1);
}

- (void)setTotalScanGroupCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 712);
}

- (NSNumber)totalScanCount
{
  return (NSNumber *)objc_getProperty(self, a2, 720, 1);
}

- (void)setTotalScanCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 720);
}

- (NSNumber)nonArtefactMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 728, 1);
}

- (void)setNonArtefactMatchAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 728);
}

- (NSNumber)nonArtefactMatchAttemptsSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 736, 1);
}

- (void)setNonArtefactMatchAttemptsSuccessful:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (NSNumber)nonArtefactMatchAttemptsFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 744, 1);
}

- (void)setNonArtefactMatchAttemptsFailed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 744);
}

- (NSNumber)nonArtefactMatchAttemptsFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 752, 1);
}

- (void)setNonArtefactMatchAttemptsFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (NSNumber)nonArtefactMatchAttemptsFailedFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 760, 1);
}

- (void)setNonArtefactMatchAttemptsFailedFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (NSNumber)artefactMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 768, 1);
}

- (void)setArtefactMatchAttempts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 768);
}

- (NSNumber)artefactMatchAttemptsSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 776, 1);
}

- (void)setArtefactMatchAttemptsSuccessful:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 776);
}

- (NSNumber)artefactMatchAttemptsFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 784, 1);
}

- (void)setArtefactMatchAttemptsFailed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 784);
}

- (NSNumber)artefactMatchAttemptsFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 792, 1);
}

- (void)setArtefactMatchAttemptsFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (NSNumber)artefactMatchAttemptsFailedFingerDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 800, 1);
}

- (void)setArtefactMatchAttemptsFailedFingerDetected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (NSNumber)totalFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 808, 1);
}

- (void)setTotalFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (NSNumber)unlockFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 816, 1);
}

- (void)setUnlockFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (NSNumber)prearmFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 824, 1);
}

- (void)setPrearmFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (NSNumber)localAuthFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 832, 1);
}

- (void)setLocalAuthFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (NSNumber)badDayFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 840, 1);
}

- (void)setBadDayFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 840);
}

- (NSNumber)subsetFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 848, 1);
}

- (void)setSubsetFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 848);
}

- (NSNumber)subsetTargetFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 856, 1);
}

- (void)setSubsetTargetFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 856);
}

- (NSNumber)subsetMatchFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 864, 1);
}

- (void)setSubsetMatchFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 864);
}

- (NSNumber)nonArtefactFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 872, 1);
}

- (void)setNonArtefactFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 872);
}

- (NSNumber)artefactFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 880, 1);
}

- (void)setArtefactFRR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 880);
}

- (NSNumber)drxStrengthPctCol2Bin
{
  return (NSNumber *)objc_getProperty(self, a2, 888, 1);
}

- (void)setDrxStrengthPctCol2Bin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 888);
}

- (NSNumber)drxStrengthPctCol7Bin
{
  return (NSNumber *)objc_getProperty(self, a2, 896, 1);
}

- (void)setDrxStrengthPctCol7Bin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 896);
}

- (NSNumber)drxStrengthPctCol2BinAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 904, 1);
}

- (void)setDrxStrengthPctCol2BinAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 904);
}

- (NSNumber)drxStrengthPctCol7BinAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 912, 1);
}

- (void)setDrxStrengthPctCol7BinAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 912);
}

- (NSNumber)temperatureBin
{
  return (NSNumber *)objc_getProperty(self, a2, 920, 1);
}

- (void)setTemperatureBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 920);
}

- (NSNumber)FMRBin
{
  return (NSNumber *)objc_getProperty(self, a2, 928, 1);
}

- (void)setFMRBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 928);
}

- (NSNumber)BSRBin
{
  return (NSNumber *)objc_getProperty(self, a2, 936, 1);
}

- (void)setBSRBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 936);
}

- (NSNumber)fitDiffBin
{
  return (NSNumber *)objc_getProperty(self, a2, 944, 1);
}

- (void)setFitDiffBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 944);
}

- (NSNumber)carrierAttenBin
{
  return (NSNumber *)objc_getProperty(self, a2, 952, 1);
}

- (void)setCarrierAttenBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 952);
}

- (NSNumber)DRXAmpMinBin
{
  return (NSNumber *)objc_getProperty(self, a2, 960, 1);
}

- (void)setDRXAmpMinBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 960);
}

- (NSNumber)DRXAmpMaxBin
{
  return (NSNumber *)objc_getProperty(self, a2, 968, 1);
}

- (void)setDRXAmpMaxBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (NSNumber)fitResEdge6SigmaBin
{
  return (NSNumber *)objc_getProperty(self, a2, 976, 1);
}

- (void)setFitResEdge6SigmaBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (NSNumber)imagePixelOutlierCountAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 984, 1);
}

- (void)setImagePixelOutlierCountAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (NSNumber)numPxOutliersPhase1Average
{
  return (NSNumber *)objc_getProperty(self, a2, 992, 1);
}

- (void)setNumPxOutliersPhase1Average:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (NSNumber)numPxOutliersPhase2Average
{
  return (NSNumber *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setNumPxOutliersPhase2Average:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (NSNumber)artefactScoreAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setArtefactScoreAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (NSNumber)maxFingerToProbeAttenuationMax
{
  return (NSNumber *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setMaxFingerToProbeAttenuationMax:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (NSNumber)maxFingerToProbeAttenuationMin
{
  return (NSNumber *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setMaxFingerToProbeAttenuationMin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (NSNumber)maxFingerToProbeAttenuationAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setMaxFingerToProbeAttenuationAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSNumber)drxStrengthPctCol2Raw
{
  return (NSNumber *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setDrxStrengthPctCol2Raw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (NSNumber)drxStrengthPctCol7Raw
{
  return (NSNumber *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setDrxStrengthPctCol7Raw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSNumber)drxStrengthPctCol2RawAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setDrxStrengthPctCol2RawAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (NSNumber)drxStrengthPctCol7RawAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setDrxStrengthPctCol7RawAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (NSNumber)temperatureRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setTemperatureRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (NSNumber)FMRRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setFMRRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (NSNumber)BSRRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setBSRRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (NSNumber)fitDiffRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setFitDiffRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (NSNumber)carrierAttenRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setCarrierAttenRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSNumber)DRXAmpMinRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setDRXAmpMinRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (NSNumber)DRXAmpMaxRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setDRXAmpMaxRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1120);
}

- (NSNumber)fitResEdge6SigmaRaw
{
  return (NSNumber *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setFitResEdge6SigmaRaw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (NSNumber)artefactPrevalence
{
  return (NSNumber *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setArtefactPrevalence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (NSNumber)artefactStrengthAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setArtefactStrengthAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (NSNumber)artefactNonlinearityAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setArtefactNonlinearityAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (NSNumber)artefactNonlinearitySTD
{
  return (NSNumber *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setArtefactNonlinearitySTD:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (NSNumber)artefactAnchorXAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setArtefactAnchorXAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- (NSNumber)artefactAnchorXSTD
{
  return (NSNumber *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setArtefactAnchorXSTD:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (NSNumber)artefactAnchorYAverage
{
  return (NSNumber *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setArtefactAnchorYAverage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (NSNumber)artefactAnchorYSTD
{
  return (NSNumber *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setArtefactAnchorYSTD:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (NSNumber)lastEnrollmentTouchesCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setLastEnrollmentTouchesCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (NSNumber)lastEnrollmentScanCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setLastEnrollmentScanCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (NSNumber)lastEnrollmentScanGroupCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setLastEnrollmentScanGroupCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (NSNumber)lastEnrollmentDeviceOrientation
{
  return (NSNumber *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setLastEnrollmentDeviceOrientation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (NSNumber)timeSinceSecondLastEnrollment
{
  return self->_timeSinceSecondLastEnrollment;
}

- (NSNumber)timeSinceSecondLastEnrollmentBinned
{
  return (NSNumber *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setTimeSinceSecondLastEnrollmentBinned:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (NSNumber)operationCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1248, 1);
}

- (NSNumber)operationTimeSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1256, 1);
}

- (NSNumber)matcherTimeCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1264, 1);
}

- (NSNumber)matcherTimeSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1272, 1);
}

- (NSNumber)matcherTimeMatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1280, 1);
}

- (NSNumber)matcherTimeMatchSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1288, 1);
}

- (NSNumber)matcherTimeNoMatchCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1296, 1);
}

- (NSNumber)matcherTimeNoMatchSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1304, 1);
}

- (NSNumber)captureTimeCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1312, 1);
}

- (NSNumber)captureTimeSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1320, 1);
}

- (NSNumber)drxStrengthPctCol2BinCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1328, 1);
}

- (NSNumber)drxStrengthPctCol2BinSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1336, 1);
}

- (NSNumber)drxStrengthPctCol7BinCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1344, 1);
}

- (NSNumber)drxStrengthPctCol7BinSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1352, 1);
}

- (NSNumber)drxStrengthPctCol2RawCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1360, 1);
}

- (NSNumber)drxStrengthPctCol2RawSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1368, 1);
}

- (NSNumber)drxStrengthPctCol7RawCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1376, 1);
}

- (NSNumber)drxStrengthPctCol7RawSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1384, 1);
}

- (NSNumber)maxFingerToProbeAttenuationCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1392, 1);
}

- (NSNumber)maxFingerToProbeAttenuationSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1400, 1);
}

- (NSNumber)imagePixelOutlierCountCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1408, 1);
}

- (NSNumber)imagePixelOutlierCountSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1416, 1);
}

- (NSNumber)numPxOutliersPhase1Count
{
  return (NSNumber *)objc_getProperty(self, a2, 1424, 1);
}

- (NSNumber)numPxOutliersPhase1Sum
{
  return (NSNumber *)objc_getProperty(self, a2, 1432, 1);
}

- (NSNumber)numPxOutliersPhase2Count
{
  return (NSNumber *)objc_getProperty(self, a2, 1440, 1);
}

- (NSNumber)numPxOutliersPhase2Sum
{
  return (NSNumber *)objc_getProperty(self, a2, 1448, 1);
}

- (NSNumber)artefactScoreCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1456, 1);
}

- (NSNumber)artefactScoreSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1464, 1);
}

- (NSNumber)artefactStrengthCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1472, 1);
}

- (NSNumber)artefactStrengthSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1480, 1);
}

- (NSNumber)artefactNonlinearityCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1488, 1);
}

- (NSNumber)artefactNonlinearityM2
{
  return (NSNumber *)objc_getProperty(self, a2, 1496, 1);
}

- (NSNumber)artefactNonlinearitySum
{
  return (NSNumber *)objc_getProperty(self, a2, 1504, 1);
}

- (NSNumber)artefactNonlinearitySumSq
{
  return (NSNumber *)objc_getProperty(self, a2, 1512, 1);
}

- (NSNumber)artefactAnchorXCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1520, 1);
}

- (NSNumber)artefactAnchorXM2
{
  return (NSNumber *)objc_getProperty(self, a2, 1528, 1);
}

- (NSNumber)artefactAnchorXSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1536, 1);
}

- (NSNumber)artefactAnchorXSumSq
{
  return (NSNumber *)objc_getProperty(self, a2, 1544, 1);
}

- (NSNumber)artefactAnchorYCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1552, 1);
}

- (NSNumber)artefactAnchorYM2
{
  return (NSNumber *)objc_getProperty(self, a2, 1560, 1);
}

- (NSNumber)artefactAnchorYSum
{
  return (NSNumber *)objc_getProperty(self, a2, 1568, 1);
}

- (NSNumber)artefactAnchorYSumSq
{
  return (NSNumber *)objc_getProperty(self, a2, 1576, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artefactAnchorYSumSq, 0);
  objc_storeStrong((id *)&self->_artefactAnchorYSum, 0);
  objc_storeStrong((id *)&self->_artefactAnchorYM2, 0);
  objc_storeStrong((id *)&self->_artefactAnchorYCount, 0);
  objc_storeStrong((id *)&self->_artefactAnchorXSumSq, 0);
  objc_storeStrong((id *)&self->_artefactAnchorXSum, 0);
  objc_storeStrong((id *)&self->_artefactAnchorXM2, 0);
  objc_storeStrong((id *)&self->_artefactAnchorXCount, 0);
  objc_storeStrong((id *)&self->_artefactNonlinearitySumSq, 0);
  objc_storeStrong((id *)&self->_artefactNonlinearitySum, 0);
  objc_storeStrong((id *)&self->_artefactNonlinearityM2, 0);
  objc_storeStrong((id *)&self->_artefactNonlinearityCount, 0);
  objc_storeStrong((id *)&self->_artefactStrengthSum, 0);
  objc_storeStrong((id *)&self->_artefactStrengthCount, 0);
  objc_storeStrong((id *)&self->_artefactScoreSum, 0);
  objc_storeStrong((id *)&self->_artefactScoreCount, 0);
  objc_storeStrong((id *)&self->_numPxOutliersPhase2Sum, 0);
  objc_storeStrong((id *)&self->_numPxOutliersPhase2Count, 0);
  objc_storeStrong((id *)&self->_numPxOutliersPhase1Sum, 0);
  objc_storeStrong((id *)&self->_numPxOutliersPhase1Count, 0);
  objc_storeStrong((id *)&self->_imagePixelOutlierCountSum, 0);
  objc_storeStrong((id *)&self->_imagePixelOutlierCountCount, 0);
  objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationSum, 0);
  objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationCount, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7RawSum, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7RawCount, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2RawSum, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2RawCount, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7BinSum, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7BinCount, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2BinSum, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2BinCount, 0);
  objc_storeStrong((id *)&self->_captureTimeSum, 0);
  objc_storeStrong((id *)&self->_captureTimeCount, 0);
  objc_storeStrong((id *)&self->_matcherTimeNoMatchSum, 0);
  objc_storeStrong((id *)&self->_matcherTimeNoMatchCount, 0);
  objc_storeStrong((id *)&self->_matcherTimeMatchSum, 0);
  objc_storeStrong((id *)&self->_matcherTimeMatchCount, 0);
  objc_storeStrong((id *)&self->_matcherTimeSum, 0);
  objc_storeStrong((id *)&self->_matcherTimeCount, 0);
  objc_storeStrong((id *)&self->_operationTimeSum, 0);
  objc_storeStrong((id *)&self->_operationCount, 0);
  objc_storeStrong((id *)&self->_timeSinceSecondLastEnrollmentBinned, 0);
  objc_storeStrong((id *)&self->_timeSinceSecondLastEnrollment, 0);
  objc_storeStrong((id *)&self->_lastEnrollmentDeviceOrientation, 0);
  objc_storeStrong((id *)&self->_lastEnrollmentScanGroupCount, 0);
  objc_storeStrong((id *)&self->_lastEnrollmentScanCount, 0);
  objc_storeStrong((id *)&self->_lastEnrollmentTouchesCount, 0);
  objc_storeStrong((id *)&self->_artefactAnchorYSTD, 0);
  objc_storeStrong((id *)&self->_artefactAnchorYAverage, 0);
  objc_storeStrong((id *)&self->_artefactAnchorXSTD, 0);
  objc_storeStrong((id *)&self->_artefactAnchorXAverage, 0);
  objc_storeStrong((id *)&self->_artefactNonlinearitySTD, 0);
  objc_storeStrong((id *)&self->_artefactNonlinearityAverage, 0);
  objc_storeStrong((id *)&self->_artefactStrengthAverage, 0);
  objc_storeStrong((id *)&self->_artefactPrevalence, 0);
  objc_storeStrong((id *)&self->_fitResEdge6SigmaRaw, 0);
  objc_storeStrong((id *)&self->_DRXAmpMaxRaw, 0);
  objc_storeStrong((id *)&self->_DRXAmpMinRaw, 0);
  objc_storeStrong((id *)&self->_carrierAttenRaw, 0);
  objc_storeStrong((id *)&self->_fitDiffRaw, 0);
  objc_storeStrong((id *)&self->_BSRRaw, 0);
  objc_storeStrong((id *)&self->_FMRRaw, 0);
  objc_storeStrong((id *)&self->_temperatureRaw, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7RawAverage, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2RawAverage, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7Raw, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2Raw, 0);
  objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationAverage, 0);
  objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationMin, 0);
  objc_storeStrong((id *)&self->_maxFingerToProbeAttenuationMax, 0);
  objc_storeStrong((id *)&self->_artefactScoreAverage, 0);
  objc_storeStrong((id *)&self->_numPxOutliersPhase2Average, 0);
  objc_storeStrong((id *)&self->_numPxOutliersPhase1Average, 0);
  objc_storeStrong((id *)&self->_imagePixelOutlierCountAverage, 0);
  objc_storeStrong((id *)&self->_fitResEdge6SigmaBin, 0);
  objc_storeStrong((id *)&self->_DRXAmpMaxBin, 0);
  objc_storeStrong((id *)&self->_DRXAmpMinBin, 0);
  objc_storeStrong((id *)&self->_carrierAttenBin, 0);
  objc_storeStrong((id *)&self->_fitDiffBin, 0);
  objc_storeStrong((id *)&self->_BSRBin, 0);
  objc_storeStrong((id *)&self->_FMRBin, 0);
  objc_storeStrong((id *)&self->_temperatureBin, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7BinAverage, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2BinAverage, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol7Bin, 0);
  objc_storeStrong((id *)&self->_drxStrengthPctCol2Bin, 0);
  objc_storeStrong((id *)&self->_artefactFRR, 0);
  objc_storeStrong((id *)&self->_nonArtefactFRR, 0);
  objc_storeStrong((id *)&self->_subsetMatchFRR, 0);
  objc_storeStrong((id *)&self->_subsetTargetFRR, 0);
  objc_storeStrong((id *)&self->_subsetFRR, 0);
  objc_storeStrong((id *)&self->_badDayFRR, 0);
  objc_storeStrong((id *)&self->_localAuthFRR, 0);
  objc_storeStrong((id *)&self->_prearmFRR, 0);
  objc_storeStrong((id *)&self->_unlockFRR, 0);
  objc_storeStrong((id *)&self->_totalFRR, 0);
  objc_storeStrong((id *)&self->_artefactMatchAttemptsFailedFingerDetected, 0);
  objc_storeStrong((id *)&self->_artefactMatchAttemptsFingerDetected, 0);
  objc_storeStrong((id *)&self->_artefactMatchAttemptsFailed, 0);
  objc_storeStrong((id *)&self->_artefactMatchAttemptsSuccessful, 0);
  objc_storeStrong((id *)&self->_artefactMatchAttempts, 0);
  objc_storeStrong((id *)&self->_nonArtefactMatchAttemptsFailedFingerDetected, 0);
  objc_storeStrong((id *)&self->_nonArtefactMatchAttemptsFingerDetected, 0);
  objc_storeStrong((id *)&self->_nonArtefactMatchAttemptsFailed, 0);
  objc_storeStrong((id *)&self->_nonArtefactMatchAttemptsSuccessful, 0);
  objc_storeStrong((id *)&self->_nonArtefactMatchAttempts, 0);
  objc_storeStrong((id *)&self->_totalScanCount, 0);
  objc_storeStrong((id *)&self->_totalScanGroupCount, 0);
  objc_storeStrong((id *)&self->_subsetMatchAttemptsFailedTarget, 0);
  objc_storeStrong((id *)&self->_subsetMatchAttemptsFailedFingerDetected, 0);
  objc_storeStrong((id *)&self->_subsetMatchAttemptsFingerDetected, 0);
  objc_storeStrong((id *)&self->_subsetMatchAttemptsFailed, 0);
  objc_storeStrong((id *)&self->_subsetMatchAttemptsSuccessful, 0);
  objc_storeStrong((id *)&self->_subsetMatchAttempts, 0);
  objc_storeStrong((id *)&self->_totalMatchOperationsFailedRetry, 0);
  objc_storeStrong((id *)&self->_totalMatchOperationsFingerDetected, 0);
  objc_storeStrong((id *)&self->_templateEnrollmentsCount, 0);
  objc_storeStrong((id *)&self->_preArmMatchAttemptsFailedFingerDetected, 0);
  objc_storeStrong((id *)&self->_preArmMatchAttemptsFingerDetected, 0);
  objc_storeStrong((id *)&self->_preArmMatchAttemptsFailed, 0);
  objc_storeStrong((id *)&self->_preArmMatchAttemptsSuccessful, 0);
  objc_storeStrong((id *)&self->_preArmMatchAttempts, 0);
  objc_storeStrong((id *)&self->_localAuthMatchAttemptsFailedFingerDetected, 0);
  objc_storeStrong((id *)&self->_localAuthMatchAttemptsFingerDetected, 0);
  objc_storeStrong((id *)&self->_localAuthMatchAttemptsFailed, 0);
  objc_storeStrong((id *)&self->_localAuthMatchAttemptsSuccessful, 0);
  objc_storeStrong((id *)&self->_localAuthMatchAttempts, 0);
  objc_storeStrong((id *)&self->_unlockMatchAttemptsFailedFingerDetected, 0);
  objc_storeStrong((id *)&self->_unlockMatchAttemptsFingerDetected, 0);
  objc_storeStrong((id *)&self->_unlockMatchAttemptsFailed, 0);
  objc_storeStrong((id *)&self->_unlockMatchAttemptsSuccessful, 0);
  objc_storeStrong((id *)&self->_unlockMatchAttempts, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFailedFingerDetected, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFingerDetected, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFailed, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsSuccessful, 0);
  objc_storeStrong((id *)&self->_totalMatchAttempts, 0);
  objc_storeStrong((id *)&self->_bioLockoutCount, 0);
  objc_storeStrong((id *)&self->_enrolledUserCount, 0);
  objc_storeStrong((id *)&self->_enrolledIdentityCount, 0);
  objc_storeStrong((id *)&self->_captureTimeAverage, 0);
  objc_storeStrong((id *)&self->_matcherTimeNoMatchAverage, 0);
  objc_storeStrong((id *)&self->_matcherTimeMatchAverage, 0);
  objc_storeStrong((id *)&self->_matcherTimeAverage, 0);
  objc_storeStrong((id *)&self->_operationTimeAverage, 0);
  objc_storeStrong((id *)&self->_badDay, 0);
  objc_storeStrong((id *)&self->_applePayEnabled, 0);
  objc_storeStrong((id *)&self->_unlockEnabled, 0);
}

@end
