@implementation WiFiUsageLQMWindowAnalysisLinkDown

- (WiFiUsageLQMWindowAnalysisLinkDown)initWithRollingWindow:(id)a3 WithIsInvoluntary:(BOOL)a4 AndLinkChangeReason:(int64_t)a5 AndLinkChangeSubreason:(int64_t)a6 AndDuration:(unint64_t)a7 andContext:(context)a8 AndTimestamp:(id)a9 onQueue:(id)a10
{
  _BOOL8 v13;
  WiFiUsageLQMWindowAnalysisLinkDown *v14;
  void *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
  v14 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:](&v17, sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_, a3, CFSTR("LinkDown"), *(_QWORD *)&a8.var0 & 0xFFFFFFLL, a9, a10);
  -[WiFiUsageLQMWindowAnalysisLinkDown setIsInvoluntary:](v14, "setIsInvoluntary:", v13);
  +[WiFiUsageSession disconnectReasonString:](WiFiUsageSession, "disconnectReasonString:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageLQMWindowAnalysisLinkDown setLinkDownReason:](v14, "setLinkDownReason:", v15);

  -[WiFiUsageLQMWindowAnalysisLinkDown setLinkDownSubreason:](v14, "setLinkDownSubreason:", a6);
  -[WiFiUsageLQMWindowAnalysisLinkDown setLinkUpDuration:](v14, "setLinkUpDuration:", a7);
  return v14;
}

- (id)addDimensionsTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t linkUpDuration;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __CFString *v20;
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
  objc_super v37;
  objc_super v38;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
  v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v44, sel_addDimensionsTo_, v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), self->_isInvoluntary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("linkdownIsInVoluntary"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_linkDownReason, CFSTR("linkdownReason"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_linkDownSubreason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("linkdownSubReason"));

  linkUpDuration = self->_linkUpDuration;
  if (linkUpDuration == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("linkupDuration"));
  }
  else
  {
    +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo12h:As:](WiFiUsageLQMTransformations, "getBinTimeIntervalUpTo12h:As:", 1, (double)linkUpDuration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("linkupDuration"));

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v39.receiver = self;
  v39.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
  -[WiFiUsageLQMWindowAnalysis subsequentTriggers](&v39, sel_subsequentTriggers);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v19, "reason");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v20 == CFSTR("Join"))
        {
          v38.receiver = self;
          v38.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
          -[WiFiUsageLQMWindowAnalysis timestamp](&v38, sel_timestamp);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timestamp");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSinceDate:", v22);
          +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo60s:As:](WiFiUsageLQMTransformations, "getBinTimeIntervalUpTo60s:As:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("timeToJoin"));

          goto LABEL_14;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_14:

  v37.receiver = self;
  v37.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkDown;
  -[WiFiUsageLQMWindowAnalysis windowBeforeTrigger](&v37, sel_windowBeforeTrigger);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "samples");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("driverRoamRecommended"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("roamingRecommended"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("driverTDrecommended"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("tdRecommended"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("chanQualScore"), v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("last_chanQualScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("txLatencyScore"), v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("last_txLatencyScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("rxLatencyScore"), v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("last_rxLatencyScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("txLossScore"), v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("last_txLossScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("rxLossScore"), v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("last_rxLossScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("txLatencyP95"), v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageLQMSample binLabelfromFieldName:value:](WiFiUsageLQMUserSample, "binLabelfromFieldName:value:", CFSTR("txLatencyP95"), objc_msgSend(v34, "integerValue"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("last_txLatencyP95_before"));

  return v4;
}

- (BOOL)isInvoluntary
{
  return self->_isInvoluntary;
}

- (void)setIsInvoluntary:(BOOL)a3
{
  self->_isInvoluntary = a3;
}

- (NSString)linkDownReason
{
  return self->_linkDownReason;
}

- (void)setLinkDownReason:(id)a3
{
  objc_storeStrong((id *)&self->_linkDownReason, a3);
}

- (int64_t)linkDownSubreason
{
  return self->_linkDownSubreason;
}

- (void)setLinkDownSubreason:(int64_t)a3
{
  self->_linkDownSubreason = a3;
}

- (unint64_t)linkUpDuration
{
  return self->_linkUpDuration;
}

- (void)setLinkUpDuration:(unint64_t)a3
{
  self->_linkUpDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkDownReason, 0);
}

@end
