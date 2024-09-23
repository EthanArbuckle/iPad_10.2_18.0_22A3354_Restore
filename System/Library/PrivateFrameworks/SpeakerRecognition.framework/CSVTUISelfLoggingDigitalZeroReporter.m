@implementation CSVTUISelfLoggingDigitalZeroReporter

- (CSVTUISelfLoggingDigitalZeroReporter)initWithSiriSetupID:(id)a3 PageNumber:(int)a4 withPhId:(id)a5 withLocale:(id)a6 withVTAssetConfigVersion:(id)a7 withSessionStatus:(int)a8
{
  NSUUID *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSUUID *siriSetupID;
  NSUUID *v19;
  NSString *phId;
  NSString *v21;
  float v22;
  float v23;
  NSString *locale;
  NSString *v25;
  NSString *vtAssetConfigVersion;

  v14 = (NSUUID *)a3;
  v15 = (NSString *)a5;
  v16 = (NSString *)a6;
  v17 = (NSString *)a7;
  siriSetupID = self->_siriSetupID;
  self->_siriSetupID = v14;
  v19 = v14;

  self->_pageNumber = a4;
  phId = self->_phId;
  self->_phId = v15;
  v21 = v15;

  self->_maxNumContinuousZeros = 0;
  v22 = (float)(unint64_t)objc_msgSend(MEMORY[0x24BE283F0], "zeroFilterWindowSizeInMsForReport") / 1000.0;
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  self->_maxNumAllowedContinuousZeros = (int)(float)(v22 * v23);
  self->_isMaxNumContinuousZerosOverThreshold = 0;
  locale = self->_locale;
  self->_locale = v16;
  v25 = v16;

  vtAssetConfigVersion = self->_vtAssetConfigVersion;
  self->_vtAssetConfigVersion = v17;

  self->_sessionStatus = a8;
  return self;
}

- (void)reportDigitalZerosWithAudioZeroRun:(float)a3
{
  int maxNumContinuousZeros;

  maxNumContinuousZeros = self->_maxNumContinuousZeros;
  if ((float)maxNumContinuousZeros < a3)
  {
    maxNumContinuousZeros = (int)a3;
    self->_maxNumContinuousZeros = (int)a3;
  }
  if (!self->_isMaxNumContinuousZerosOverThreshold)
    self->_isMaxNumContinuousZerosOverThreshold = maxNumContinuousZeros > self->_maxNumAllowedContinuousZeros;
}

- (BOOL)digitalZeroDetected
{
  return self->_isMaxNumContinuousZerosOverThreshold;
}

- (void)logDigitalZeroDetectionComplete
{
  _BOOL4 isMaxNumContinuousZerosOverThreshold;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;
  NSUUID *siriSetupID;
  uint64_t pageNumber;
  NSString *phId;
  uint64_t maxNumContinuousZeros;
  uint64_t maxNumAllowedContinuousZeros;
  _BOOL8 v13;
  NSString *locale;
  NSString *vtAssetConfigVersion;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  isMaxNumContinuousZerosOverThreshold = self->_isMaxNumContinuousZerosOverThreshold;
  v4 = *MEMORY[0x24BE28368];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT);
  if (isMaxNumContinuousZerosOverThreshold)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSVTUISelfLoggingDigitalZeroReporter logDigitalZeroDetectionComplete]";
      v6 = "%s CSVTUI continuousZeros detected.";
LABEL_6:
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSVTUISelfLoggingDigitalZeroReporter logDigitalZeroDetectionComplete]";
    v6 = "%s CSVTUI continuousZeros not detected.";
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BE28498], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  siriSetupID = self->_siriSetupID;
  pageNumber = self->_pageNumber;
  phId = self->_phId;
  maxNumContinuousZeros = self->_maxNumContinuousZeros;
  maxNumAllowedContinuousZeros = self->_maxNumAllowedContinuousZeros;
  v13 = self->_isMaxNumContinuousZerosOverThreshold;
  locale = self->_locale;
  vtAssetConfigVersion = self->_vtAssetConfigVersion;
  LODWORD(v16) = -[CSVTUISelfLoggingDigitalZeroReporter _getStageStatusFromTrainingManagerSessionStatus:](self, "_getStageStatusFromTrainingManagerSessionStatus:", self->_sessionStatus);
  objc_msgSend(v7, "logSiriSetupPHSEnrollmentDigitalZeroDetectionCompletedWithSiriSetupID:withPageNumber:withPhId:withMaxNumContinuousZeros:withMaxNumAllowedContinuousZeros:withIsMaxNumContinuousZerosOverThreshold:withLocale:withVTAssetConfigVersion:withStageStatus:", siriSetupID, pageNumber, phId, maxNumContinuousZeros, maxNumAllowedContinuousZeros, v13, locale, vtAssetConfigVersion, v16);

}

- (int)_getStageStatusFromTrainingManagerSessionStatus:(int)a3
{
  if (a3 < 8)
    return a3 + 1;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vtAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_phId, 0);
  objc_storeStrong((id *)&self->_siriSetupID, 0);
}

@end
