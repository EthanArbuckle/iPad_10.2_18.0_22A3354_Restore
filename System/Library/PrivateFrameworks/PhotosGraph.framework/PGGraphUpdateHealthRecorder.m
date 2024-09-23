@implementation PGGraphUpdateHealthRecorder

- (id)initForChangeConsumer:(BOOL)a3 analytics:(id)a4
{
  id v7;
  PGGraphUpdateHealthRecorder *v8;
  PGGraphUpdateHealthRecorder *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphUpdateHealthRecorder;
  v8 = -[PGGraphUpdateHealthRecorder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_changeConsumer = a3;
    objc_storeStrong((id *)&v8->_analytics, a4);
  }

  return v9;
}

- (void)recordNumberOfDatabaseChangesReceived:(unint64_t)a3 inBackground:(BOOL)a4
{
  uint64_t v4;

  if (self->_changeConsumer)
  {
    v4 = 24;
    if (a4)
      v4 = 32;
    *(Class *)((char *)&self->super.isa + v4) = (Class)(*(char **)((char *)&self->super.isa + v4) + a3);
  }
}

- (void)recordNumberOfDatabaseChangesConvertedToGraphChanges:(unint64_t)a3 inBackground:(BOOL)a4
{
  uint64_t v4;

  if (self->_changeConsumer)
  {
    v4 = 40;
    if (a4)
      v4 = 48;
    *(Class *)((char *)&self->super.isa + v4) = (Class)(*(char **)((char *)&self->super.isa + v4) + a3);
  }
}

- (void)recordNumberOfTimesGraphUpdatePaused:(unint64_t)a3
{
  self->_numberOfTimesGraphUpdatePaused += a3;
}

- (void)recordTransactionSize:(unint64_t)a3
{
  self->_maximumTransactionSize += a3;
}

- (void)recordNumberOfDaysSinceMajorOSUpgrade:(unint64_t)a3
{
  CPAnalytics *analytics;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  analytics = self->_analytics;
  v6 = CFSTR("numberOfDaysSinceMajorOSUpgrade");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalytics sendEvent:withPayload:](analytics, "sendEvent:withPayload:", CFSTR("com.apple.Photos.Intelligence.graphMajorUpdate"), v5);

}

- (void)beginRecording
{
  *(_OWORD *)&self->_numberOfTimesGraphUpdatePaused = 0u;
  *(_OWORD *)&self->_numberOfDatabaseChangesConvertedToGraphChangesInForeground = 0u;
  *(_OWORD *)&self->_numberOfDatabaseChangesReceivedInForeground = 0u;
}

- (void)endRecordingInBackground:(BOOL)a3
{
  unint64_t numberOfDatabaseChangesReceivedInBackground;
  double v5;
  CPAnalytics *analytics;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  CPAnalytics *v13;
  unint64_t numberOfDatabaseChangesReceivedInForeground;
  double v15;
  void *v16;
  CPAnalytics *v17;
  void *v18;
  void **v19;
  const __CFString **v20;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[3];
  const __CFString *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  if (self->_changeConsumer)
  {
    if (a3)
    {
      numberOfDatabaseChangesReceivedInBackground = self->_numberOfDatabaseChangesReceivedInBackground;
      if (numberOfDatabaseChangesReceivedInBackground)
      {
        v5 = (double)self->_numberOfDatabaseChangesConvertedToGraphChangesInBackground
           / (double)numberOfDatabaseChangesReceivedInBackground;
        analytics = self->_analytics;
        v29[0] = CFSTR("numberOfDatabaseChangesReceivedInBackground");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v7;
        v29[1] = CFSTR("changeUsageRatio");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v8;
        v29[2] = CFSTR("numberOfDatabaseChangesConvertedToGraphChangesInBackground");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfDatabaseChangesConvertedToGraphChangesInBackground);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v30[2] = v9;
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v30;
        v12 = v29;
LABEL_8:
        objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPAnalytics sendEvent:withPayload:](analytics, "sendEvent:withPayload:", CFSTR("com.apple.Photos.GraphUpdateHealth"), v16);

        goto LABEL_9;
      }
      v17 = self->_analytics;
      v27 = CFSTR("numberOfDatabaseChangesReceivedInBackground");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v7;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = &v28;
      v20 = &v27;
    }
    else
    {
      numberOfDatabaseChangesReceivedInForeground = self->_numberOfDatabaseChangesReceivedInForeground;
      if (numberOfDatabaseChangesReceivedInForeground)
      {
        v15 = (double)self->_numberOfDatabaseChangesConvertedToGraphChangesInForeground
            / (double)numberOfDatabaseChangesReceivedInForeground;
        analytics = self->_analytics;
        v25[0] = CFSTR("numberOfDatabaseChangesReceivedInForeground");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v7;
        v25[1] = CFSTR("changeUsageRatio");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v8;
        v25[2] = CFSTR("numberOfDatabaseChangesConvertedToGraphChangesInForeground");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfDatabaseChangesConvertedToGraphChangesInForeground);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = v9;
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v26;
        v12 = v25;
        goto LABEL_8;
      }
      v17 = self->_analytics;
      v23 = CFSTR("numberOfDatabaseChangesReceivedInForeground");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v7;
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = &v24;
      v20 = &v23;
    }
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalytics sendEvent:withPayload:](v17, "sendEvent:withPayload:", CFSTR("com.apple.Photos.GraphUpdateHealth"), v8);
    goto LABEL_13;
  }
  v13 = self->_analytics;
  v21[0] = CFSTR("numberOfTimesGraphUpdatePaused");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfTimesGraphUpdatePaused);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("maximumTransactionSize");
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maximumTransactionSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalytics sendEvent:withPayload:](v13, "sendEvent:withPayload:", CFSTR("com.apple.Photos.GraphUpdateHealth"), v9);
LABEL_9:

LABEL_13:
}

- (unint64_t)numberOfDatabaseChangesReceivedInForeground
{
  return self->_numberOfDatabaseChangesReceivedInForeground;
}

- (unint64_t)numberOfDatabaseChangesReceivedInBackground
{
  return self->_numberOfDatabaseChangesReceivedInBackground;
}

- (unint64_t)numberOfDatabaseChangesConvertedToGraphChangesInForeground
{
  return self->_numberOfDatabaseChangesConvertedToGraphChangesInForeground;
}

- (unint64_t)numberOfDatabaseChangesConvertedToGraphChangesInBackground
{
  return self->_numberOfDatabaseChangesConvertedToGraphChangesInBackground;
}

- (unint64_t)numberOfTimesGraphUpdatePaused
{
  return self->_numberOfTimesGraphUpdatePaused;
}

- (unint64_t)maximumTransactionSize
{
  return self->_maximumTransactionSize;
}

- (BOOL)isChangeConsumer
{
  return self->_changeConsumer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
}

@end
