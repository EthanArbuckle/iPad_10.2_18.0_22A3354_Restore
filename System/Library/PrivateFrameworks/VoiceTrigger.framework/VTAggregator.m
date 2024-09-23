@implementation VTAggregator

- (VTAggregator)init
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_source_t v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VTAggregator;
  v2 = -[VTAggregator init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = CFSTR("xx_XX");

    v5 = (void *)*((_QWORD *)v3 + 10);
    *((_QWORD *)v3 + 10) = CFSTR("unknown");

    AFPreferencesMobileUserSessionLanguage();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLanguageCode:", v6);

    v7 = dispatch_queue_create("com.apple.voicetrigger.aggregator", 0);
    v8 = (void *)*((_QWORD *)v3 + 7);
    *((_QWORD *)v3 + 7) = v7;

    v9 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v3 + 7));
    v10 = (void *)*((_QWORD *)v3 + 8);
    *((_QWORD *)v3 + 8) = v9;

    v11 = *((_QWORD *)v3 + 8);
    v12 = dispatch_time(0, 900000000000);
    dispatch_source_set_timer(v11, v12, 0xD18C2E2800uLL, 0);
    objc_initWeak(&location, v3);
    v13 = *((_QWORD *)v3 + 8);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __20__VTAggregator_init__block_invoke;
    v15[3] = &unk_24C7F49E0;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (VTAggregator *)v3;
}

- (void)cumulativeUptime:(id *)a3 cumulativeDowntime:(id *)a4 reset:(BOOL)a5
{
  NSObject *queue;
  _QWORD v6[7];
  BOOL v7;

  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__VTAggregator_cumulativeUptime_cumulativeDowntime_reset___block_invoke;
  v6[3] = &unk_24C7F47A8;
  v6[4] = self;
  v6[5] = a4;
  v6[6] = a3;
  v7 = a5;
  dispatch_sync(queue, v6);
}

- (void)setLanguageCode:(id)a3
{
  id v5;
  NSString **p_languageCode;
  NSString *languageCode;
  id v8;

  v5 = a3;
  languageCode = self->_languageCode;
  p_languageCode = &self->_languageCode;
  v8 = v5;
  if (!-[NSString isEqualToString:](languageCode, "isEqualToString:"))
    objc_storeStrong((id *)p_languageCode, a3);

}

- (void)setAssetString:(id)a3
{
  id v5;
  NSString **p_assetString;
  NSString *assetString;
  id v8;

  v5 = a3;
  assetString = self->_assetString;
  p_assetString = &self->_assetString;
  v8 = v5;
  if (!-[NSString isEqualToString:](assetString, "isEqualToString:"))
    objc_storeStrong((id *)p_assetString, a3);

}

- (void)logActivation
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "::: logging VT activation in aggd", v5, 2u);
  }
  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("activation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v4, 1);

}

- (void)logSecondPassResult:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = a3;
  v5 = VTLogContextFacilityVoiceTrigger;
  v6 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "::: incrementing 2nd-pass accept in aggd", buf, 2u);
    }
    v7 = CFSTR("secondPassAccepted");
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "::: incrementing 2nd-pass reject in aggd", v9, 2u);
    }
    v7 = CFSTR("secondPassRejected");
  }
  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v8, 1);

}

- (void)logFalseWakeUp:(BOOL)a3
{
  unint64_t v4;
  NSObject *v5;
  double v6;
  double v7;
  double lastAggTimeFalseWakeUp;
  unint64_t numFalseWakeUp;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = self->_numFalseWakeUp + 1;
    self->_numFalseWakeUp = v4;
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v19 = v4;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "::: incrementing false wakeup to %{public}llu", buf, 0xCu);
    }
  }
  +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
  v7 = v6;
  lastAggTimeFalseWakeUp = self->_lastAggTimeFalseWakeUp;
  if (lastAggTimeFalseWakeUp <= 0.0)
  {
    self->_lastAggTimeFalseWakeUp = v7;
  }
  else
  {
    numFalseWakeUp = self->_numFalseWakeUp;
    if (numFalseWakeUp)
    {
      v10 = v7 - lastAggTimeFalseWakeUp;
      v11 = VTLogContextFacilityVoiceTrigger;
      v12 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
      if (v10 <= 0.0)
      {
        if (v12)
        {
          *(_DWORD *)buf = 134349312;
          v19 = numFalseWakeUp;
          v20 = 2050;
          v21 = v10;
          _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "::: accumulated false wakeup count is %{public}llu so far, not reporting yet because it has been only %{public}.2f seconds since last report", buf, 0x16u);
        }
      }
      else
      {
        if (v12)
        {
          *(_DWORD *)buf = 134349312;
          v19 = numFalseWakeUp;
          v20 = 2050;
          v21 = v10;
          _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "::: logging %{public}llu false wakeup during %{public}.2f seconds", buf, 0x16u);
        }
        -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("falseWakeUp"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v13, self->_numFalseWakeUp);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numFalseWakeUp, CFSTR("numFalseWakeUp"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = CFSTR("secondsSinceLastReport");
        v17[0] = v14;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
        PLLogRegisteredEvent();

        self->_lastAggTimeFalseWakeUp = v7;
        self->_numFalseWakeUp = 0;
      }
    }
  }
}

- (void)_logUptime
{
  double v3;
  double v4;
  double lastAggTime;
  double v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  int v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
  v4 = v3;
  lastAggTime = self->_lastAggTime;
  if (lastAggTime > 0.0)
  {
    v6 = v4 - lastAggTime;
    if (self->_currentState == 1)
    {
      self->_cumulativeUptime = v6 + self->_cumulativeUptime;
      -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("uptimeSeconds"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v7, v6);

      v8 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134349056;
        v12 = v6;
        v9 = "::: VoiceTrigger has been ACTIVE for an interval of %{public}5.3f seconds.";
LABEL_7:
        _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      self->_cumulativeDowntime = v6 + self->_cumulativeDowntime;
      -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("downtimeSeconds"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v10, v6);

      v8 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134349056;
        v12 = v6;
        v9 = "::: VoiceTrigger has been INACTIVE for an interval of %{public}5.3f seconds.";
        goto LABEL_7;
      }
    }
  }
  self->_lastAggTime = v4;
}

- (void)logTimeVoiceTriggerTransitionsToState:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__VTAggregator_logTimeVoiceTriggerTransitionsToState___block_invoke;
  v6[3] = &unk_24C7F47D0;
  v7[1] = (id)a3;
  v6[4] = self;
  objc_copyWeak(v7, &location);
  dispatch_async(queue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)logZeroRunAudio:(int)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "::: logging corrupt audio length in aggd", v6, 2u);
  }
  -[VTAggregator _makeKeyWithLanguageCode:](self, "_makeKeyWithLanguageCode:", CFSTR("zeroRunAudio"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v5, 1);

}

- (void)logRecognizerTimedOut
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "::: logging recognizer timeout in aggd", v5, 2u);
  }
  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("recognizerTimeOut"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v4, 1);

}

- (void)logProfileUpdateUtt:(id)a3 withScore:(double)a4
{
  id v6;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v6, a4);

}

- (void)logProfileUpdateNumDeletedUttsStrategy:(int)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("profileUpdateNumDeletedUttsStrategy"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v5, (double)a3);

}

- (void)logProfileUpdateNumPrunedUttsPHS:(int)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("profileUpdateNumPrunedUttsPHS"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v5, (double)a3);

}

- (void)logProfileUpdateNumDiscardedUttsPHS:(int)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("profileUpdateNumDiscardedUttsPHS"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v5, (double)a3);

}

- (void)logProfileUpdateNumRetainedUttsPHS:(int)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("profileUpdateNumRetainedUttsPHS"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v5, (double)a3);

}

- (void)logProfileUpdateScoreMSE:(double)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("profileUpdateScoreMSE"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v5, a3);

}

- (void)logTdPsrSATDetectionWaitTimeMs:(double)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("TdPsrSATDetectionTimeMs"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v5, a3);

}

- (void)logTdPsrFailedDuringSATDetection
{
  id v3;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("TdPsrFailedDuringSATDetection"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v3, 1);

}

- (void)logTdPsrSATDetectionTimedOut
{
  id v3;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("TdPsrSATDetectionTimedOut"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v3, 1);

}

- (void)logTdPsrSATRetrainingWaitTimeMs:(double)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("TdPsrSATRetrainingWaitTimeMs"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v5, a3);

}

- (void)logTdPsrFailedDuringSATRetraining
{
  id v3;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("TdPsrFailedDuringSATRetraining"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v3, 1);

}

- (void)logTdPsrSATRetrainingTimedOut
{
  id v3;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("TdPsrSATRetrainingTimedOut"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v3, 1);

}

- (void)logTdPsrExtraAudioSamplesProcessed:(unint64_t)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("TdPsrExtraAudioSamplesProcessed"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _pushValueForDistributionKey:withValue:](self, "_pushValueForDistributionKey:withValue:", v5, (double)a3);

}

- (void)logVoiceProfilePruningFailureWithReasonCode:(unint64_t)a3
{
  id v5;

  -[VTAggregator _makeKeyWithLanguageAndAssetString:](self, "_makeKeyWithLanguageAndAssetString:", CFSTR("profileUpdateFailCode"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VTAggregator _addValueForScalarKey:withValue:](self, "_addValueForScalarKey:withValue:", v5, a3);

}

- (id)_makeKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.voicetrigger"), a3);
}

- (id)_makeKeyWithLanguageCode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[VTAggregator _makeKey:](self, "_makeKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v5, self->_languageCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_makeKeyWithLanguageAndAssetString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[VTAggregator _makeKey:](self, "_makeKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@.%@"), v5, self->_languageCode, self->_assetString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_addValueForScalarKey:(id)a3 withValue:(int64_t)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2050;
    v14 = a4;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Adding value for scalar key %{public}@ : %{public}lld", buf, 0x16u);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__VTAggregator__addValueForScalarKey_withValue___block_invoke;
  v8[3] = &unk_24C7F47F8;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  softLink_AnalyticsSendEventLazy(v8);

}

- (void)_pushValueForDistributionKey:(id)a3 withValue:(double)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  double v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2050;
    v14 = a4;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Pushing value for distribution key %{public}@ : %{public}lf", buf, 0x16u);
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__VTAggregator__pushValueForDistributionKey_withValue___block_invoke;
  v8[3] = &unk_24C7F47F8;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  softLink_AnalyticsSendEventLazy(v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetString, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

id __55__VTAggregator__pushValueForDistributionKey_withValue___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __48__VTAggregator__addValueForScalarKey_withValue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__VTAggregator_logTimeVoiceTriggerTransitionsToState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id WeakRetained;
  id v5;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(_QWORD *)(v2 + 8))
  {
    if (v1)
    {
      if (v1 == 1)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(WeakRetained, "_logUptime");

        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64));
      }
    }
    else
    {
      dispatch_suspend(*(dispatch_object_t *)(v2 + 64));
      v5 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v5, "_logUptime");

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 48);
  }
}

id __58__VTAggregator_cumulativeUptime_cumulativeDowntime_reset___block_invoke(uint64_t a1)
{
  id result;

  objc_msgSend(*(id *)(a1 + 32), "_logUptime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 32));
  **(_QWORD **)(a1 + 40) = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 24));
  result = (id)objc_claimAutoreleasedReturnValue();
  **(_QWORD **)(a1 + 48) = result;
  if (*(_BYTE *)(a1 + 56))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
  return result;
}

void __20__VTAggregator_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_logUptime");

}

+ (id)sharedAggregator
{
  if (sharedAggregator_onceToken != -1)
    dispatch_once(&sharedAggregator_onceToken, &__block_literal_global_5420);
  return (id)sharedAggregator_sSharedAggregator;
}

void __32__VTAggregator_sharedAggregator__block_invoke()
{
  VTAggregator *v0;
  void *v1;

  v0 = objc_alloc_init(VTAggregator);
  v1 = (void *)sharedAggregator_sSharedAggregator;
  sharedAggregator_sSharedAggregator = (uint64_t)v0;

}

@end
