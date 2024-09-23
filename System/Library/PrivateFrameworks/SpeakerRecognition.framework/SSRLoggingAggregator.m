@implementation SSRLoggingAggregator

- (SSRLoggingAggregator)initWithEvent:(id)a3 locale:(id)a4 configVersion:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  SSRLoggingAggregator *v11;
  uint64_t v12;
  NSString *eventString;
  const __CFString *v14;
  const __CFString *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *eventContext;
  objc_super v19;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  v19.receiver = self;
  v19.super_class = (Class)SSRLoggingAggregator;
  v11 = -[SSRLoggingAggregator init](&v19, sel_init);
  if (v11)
  {
    objc_msgSend(CFSTR("com.apple.ssr"), "stringByAppendingFormat:", CFSTR(".%@"), v8);
    v12 = objc_claimAutoreleasedReturnValue();
    eventString = v11->_eventString;
    v11->_eventString = (NSString *)v12;

    if (v9)
      v14 = v9;
    else
      v14 = CFSTR("xx_XX");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_eventContext, "setObject:forKeyedSubscript:", v14, CFSTR("locale"));
    if (v10)
      v15 = v10;
    else
      v15 = CFSTR("unknown");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_eventContext, "setObject:forKeyedSubscript:", v15, CFSTR("asset"));
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    eventContext = v11->_eventContext;
    v11->_eventContext = v16;

  }
  return v11;
}

- (void)pushAnalyticsWithLazyBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    AnalyticsSendEventLazy();

  }
}

- (void)setVoiceProfilePruningFailureReasonCode:(unint64_t)a3
{
  id v4;

  self->_voiceProfilePruningFailureReasonCode = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("profileUpdateFailCode"));

}

- (void)setVoiceProfileUpdateScoreMSE:(float)a3
{
  id v4;

  self->_voiceProfileUpdateScoreMSE = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("profileUpdateScoreMSE"));

}

- (void)setVoiceProfileDiscardedUtteranceCount:(unint64_t)a3
{
  id v4;

  self->_voiceProfileDiscardedUtteranceCount = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("profileUpdateNumDiscardedUttsPHS"));

}

- (void)setvoiceProfilePrunedUtteranceCount:(unint64_t)a3
{
  id v4;

  self->_voiceProfilePrunedUtteranceCount = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("profileUpdateNumPrunedUttsPHS"));

}

- (void)setVoiceProfileRetainedUtteranceCount:(unint64_t)a3
{
  id v4;

  self->_voiceProfileRetainedUtteranceCount = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("profileUpdateNumRetainedUttsPHS"));

}

- (void)appendVoiceProfileExplicitUtteranceScoreWith:(float)a3
{
  void *v5;
  unint64_t explicitUtteranceIndex;
  double v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  explicitUtteranceIndex = self->explicitUtteranceIndex;
  self->explicitUtteranceIndex = explicitUtteranceIndex + 1;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%d"), CFSTR("profileUpdateExplicitUttScore"), explicitUtteranceIndex);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v8, v9);

}

- (void)appendVoiceProfileImplicitUtteranceScoreWith:(float)a3
{
  void *v5;
  unint64_t implicitUtteranceIndex;
  double v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  implicitUtteranceIndex = self->implicitUtteranceIndex;
  self->implicitUtteranceIndex = implicitUtteranceIndex + 1;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%d"), CFSTR("profileUpdateImplicitUttScore"), implicitUtteranceIndex);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v8, v9);

}

- (void)appendVoiceProfileDiscardedImplicitUtteranceScoreWith:(float)a3
{
  void *v5;
  unint64_t implicitDiscardedUtteranceIndex;
  double v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  implicitDiscardedUtteranceIndex = self->implicitDiscardedUtteranceIndex;
  self->implicitDiscardedUtteranceIndex = implicitDiscardedUtteranceIndex + 1;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%d"), CFSTR("profileUpdateDiscardImplicitUttScore"), implicitDiscardedUtteranceIndex);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v8, v9);

}

- (void)appendVoiceProfileFailedExplicitUtteranceScoreWith:(float)a3
{
  void *v5;
  unint64_t explicitFailedUtteranceIndex;
  double v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  explicitFailedUtteranceIndex = self->explicitFailedUtteranceIndex;
  self->explicitFailedUtteranceIndex = explicitFailedUtteranceIndex + 1;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%d"), CFSTR("profileUpdateFailedExplicitUttScore"), explicitFailedUtteranceIndex);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v8, v9);

}

- (void)setVoiceProfileRetrainingFailureReasonCode:(unint64_t)a3
{
  id v4;

  self->_voiceProfileRetrainingFailureReasonCode = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("TdPsrSATRetrainingTimedOut"));

}

- (void)setRetrainingWaitTime:(double)a3
{
  id v4;

  self->_retrainingWaitTime = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(a3 * 1000.0));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("retrainingWaitTimeMs"));

}

- (void)setSpeakerRecognitionProcessingStatus:(unint64_t)a3
{
  id v4;

  self->_speakerRecognitionProcessingStatus = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("speakerRecognitionProcessingStatus"));

}

- (void)setSpeakerRecognitionWaitTime:(double)a3
{
  id v4;

  self->_speakerRecognitionWaitTime = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)(a3 * 1000.0));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_eventContext, "setObject:forKeyedSubscript:", v4, CFSTR("speakerRecognitionWaitTimeMs"));

}

- (void)pushAnalytics
{
  NSObject *v3;
  NSString *eventString;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    eventString = self->_eventString;
    v6 = 136315394;
    v7 = "-[SSRLoggingAggregator pushAnalytics]";
    v8 = 2114;
    v9 = eventString;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Sending Analytics Event - %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = (void *)-[NSMutableDictionary copy](self->_eventContext, "copy");
  AnalyticsSendEvent();

}

- (unint64_t)voiceProfilePruningFailureReasonCode
{
  return self->_voiceProfilePruningFailureReasonCode;
}

- (float)voiceProfileUpdateScoreMSE
{
  return self->_voiceProfileUpdateScoreMSE;
}

- (unint64_t)voiceProfileDiscardedUtteranceCount
{
  return self->_voiceProfileDiscardedUtteranceCount;
}

- (unint64_t)voiceProfilePrunedUtteranceCount
{
  return self->_voiceProfilePrunedUtteranceCount;
}

- (void)setVoiceProfilePrunedUtteranceCount:(unint64_t)a3
{
  self->_voiceProfilePrunedUtteranceCount = a3;
}

- (unint64_t)voiceProfileRetainedUtteranceCount
{
  return self->_voiceProfileRetainedUtteranceCount;
}

- (unint64_t)voiceProfileRetrainingFailureReasonCode
{
  return self->_voiceProfileRetrainingFailureReasonCode;
}

- (double)retrainingWaitTime
{
  return self->_retrainingWaitTime;
}

- (unint64_t)speakerRecognitionProcessingStatus
{
  return self->_speakerRecognitionProcessingStatus;
}

- (double)speakerRecognitionWaitTime
{
  return self->_speakerRecognitionWaitTime;
}

- (unint64_t)speakerRecognitionPSRProcessingStatus
{
  return self->_speakerRecognitionPSRProcessingStatus;
}

- (void)setSpeakerRecognitionPSRProcessingStatus:(unint64_t)a3
{
  self->_speakerRecognitionPSRProcessingStatus = a3;
}

- (unint64_t)speakerRecognitionSATProcessingStatus
{
  return self->_speakerRecognitionSATProcessingStatus;
}

- (void)setSpeakerRecognitionSATProcessingStatus:(unint64_t)a3
{
  self->_speakerRecognitionSATProcessingStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventContext, 0);
  objc_storeStrong((id *)&self->_eventString, 0);
}

id __51__SSRLoggingAggregator_pushAnalyticsWithLazyBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

@end
