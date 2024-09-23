@implementation VTUIAnalytics

- (void)logEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[11];
  _QWORD v19[13];

  v19[11] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("AboutViewShown");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics aboutViewShown](self, "aboutViewShown"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("IntroViewShown");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics introViewShown](self, "introViewShown"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("SkippedFromIntroAOP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics skippedFromIntroAOP](self, "skippedFromIntroAOP"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("SkippedFromIntroNonAOP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics skippedFromIntroNonAOP](self, "skippedFromIntroNonAOP"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  v18[4] = CFSTR("TurnOnSiriNonAOP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics turnOnSiriNonAOP](self, "turnOnSiriNonAOP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v3;
  v18[5] = CFSTR("VoiceTrainingCancelled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics voiceTrainingCancelled](self, "voiceTrainingCancelled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v4;
  v18[6] = CFSTR("VoiceTrainingStep");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics voiceTrainingCancelledStep](self, "voiceTrainingCancelledStep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v5;
  v18[7] = CFSTR("VoiceTrainingCompleted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics voiceTrainingCompleted](self, "voiceTrainingCompleted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v6;
  v18[8] = CFSTR("VoiceTrainingStarted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[VTUIAnalytics voiceTrainingStarted](self, "voiceTrainingStarted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v7;
  v18[9] = CFSTR("LanguageCode");
  -[VTUIAnalytics languageCode](self, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[VTUIAnalytics languageCode](self, "languageCode");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24F340078;
  }
  v19[9] = v9;
  v18[10] = CFSTR("SetupMode");
  -[VTUIAnalytics setupMode](self, "setupMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[VTUIAnalytics setupMode](self, "setupMode");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_24F340078;
  }
  v19[10] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  if (v8)
  v13 = v12;
  AnalyticsSendEventLazy();

}

id __25__VTUIAnalytics_logEvent__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int)introViewShown
{
  return self->_introViewShown;
}

- (void)setIntroViewShown:(int)a3
{
  self->_introViewShown = a3;
}

- (int)aboutViewShown
{
  return self->_aboutViewShown;
}

- (void)setAboutViewShown:(int)a3
{
  self->_aboutViewShown = a3;
}

- (int)skippedFromIntroAOP
{
  return self->_skippedFromIntroAOP;
}

- (void)setSkippedFromIntroAOP:(int)a3
{
  self->_skippedFromIntroAOP = a3;
}

- (int)skippedFromIntroNonAOP
{
  return self->_skippedFromIntroNonAOP;
}

- (void)setSkippedFromIntroNonAOP:(int)a3
{
  self->_skippedFromIntroNonAOP = a3;
}

- (int)turnOnSiriNonAOP
{
  return self->_turnOnSiriNonAOP;
}

- (void)setTurnOnSiriNonAOP:(int)a3
{
  self->_turnOnSiriNonAOP = a3;
}

- (int)voiceTrainingCancelled
{
  return self->_voiceTrainingCancelled;
}

- (void)setVoiceTrainingCancelled:(int)a3
{
  self->_voiceTrainingCancelled = a3;
}

- (int)voiceTrainingCancelledStep
{
  return self->_voiceTrainingCancelledStep;
}

- (void)setVoiceTrainingCancelledStep:(int)a3
{
  self->_voiceTrainingCancelledStep = a3;
}

- (int)voiceTrainingCompleted
{
  return self->_voiceTrainingCompleted;
}

- (void)setVoiceTrainingCompleted:(int)a3
{
  self->_voiceTrainingCompleted = a3;
}

- (int)voiceTrainingStarted
{
  return self->_voiceTrainingStarted;
}

- (void)setVoiceTrainingStarted:(int)a3
{
  self->_voiceTrainingStarted = a3;
}

- (int)asrError
{
  return self->_asrError;
}

- (void)setAsrError:(int)a3
{
  self->_asrError = a3;
}

- (int)vtError
{
  return self->_vtError;
}

- (void)setVtError:(int)a3
{
  self->_vtError = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSString)setupMode
{
  return self->_setupMode;
}

- (void)setSetupMode:(id)a3
{
  objc_storeStrong((id *)&self->_setupMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupMode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end
