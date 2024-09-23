@implementation RCCompositionFragment

- (RCCompositionFragment)initWithAVOutputURL:(id)a3 contentDuration:(double)a4 timeRangeInContentToUse:(id)a5 timeRangeInComposition:(id)a6
{
  double var1;
  double var0;
  double v8;
  double v9;
  id v14;
  RCCompositionFragment *v15;
  RCCompositionFragment *v16;
  void *v18;
  void *v19;
  objc_super v20;

  var1 = a6.var1;
  var0 = a6.var0;
  v8 = a5.var1;
  v9 = a5.var0;
  v14 = a3;
  if (a4 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCCompositionFragment.m"), 29, CFSTR("invalid contentDuration"));

  }
  if (RCTimeRangeDeltaWithExactPrecision(v9, v8) < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RCCompositionFragment.m"), 30, CFSTR("invalid timeRangeInContentToUse"));

  }
  v20.receiver = self;
  v20.super_class = (Class)RCCompositionFragment;
  v15 = -[RCCompositionFragment init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_AVOutputURL, a3);
    v16->_timeRangeInContentToUse.beginTime = v9;
    v16->_timeRangeInContentToUse.endTime = v8;
    v16->_contentDuration = a4;
    v16->_timeRangeInComposition.beginTime = fmax(var0, 0.0);
    v16->_timeRangeInComposition.endTime = var1;
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)RCCompositionFragment;
  -[RCCompositionFragment description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_AVOutputURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCompositionFragment waveformURL](self, "waveformURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contentDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCompositionFragment timeRangeInContentToUse](self, "timeRangeInContentToUse");
  NSStringFromRCTimeRange(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCompositionFragment timeRangeInComposition](self, "timeRangeInComposition");
  NSStringFromRCTimeRange(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ AVURL = %@ (waveformURL = %@), contentDuration = %@, timeRangeInContentToUse = %@, timeRangeInComposition = %@"), v4, v5, v7, v8, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSURL)waveformURL
{
  return (NSURL *)+[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", self->_AVOutputURL);
}

- (void)deleteFromFilesystem
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  RCCompositionFragment *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  OSLogForCategory(CFSTR("Default"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[RCCompositionFragment deleteFromFilesystem]";
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1BD830000, v3, OS_LOG_TYPE_INFO, "%s -- deleting fragment assets %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", self->_AVOutputURL, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCCompositionFragment waveformURL](self, "waveformURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v6, 0);

}

- (unint64_t)fileSizeOfAssets
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_AVOutputURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    -[NSURL path](self->_AVOutputURL, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributesOfItemAtPath:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeInContentToUse
{
  __n128 v3;
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (RCTimeRangeEqualToTimeRange(self->_timeRangeInContentToUse.beginTime, self->_timeRangeInContentToUse.endTime, -1.79769313e308, 1.79769313e308))
  {
    v3.n128_u64[0] = 0;
    beginTime = RCTimeRangeMake(v3, self->_contentDuration);
  }
  else
  {
    beginTime = self->_timeRangeInContentToUse.beginTime;
    endTime = self->_timeRangeInContentToUse.endTime;
  }
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (RCCompositionFragment)initWithDictionaryPListRepresentation:(id)a3
{
  id v4;
  RCCompositionFragment *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *AVOutputURL;
  uint64_t v10;
  NSURL *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RCCompositionFragment;
  v5 = -[RCCompositionFragment init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKey:", CFSTR("RCAVOutputURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    AVOutputURL = v5->_AVOutputURL;
    v5->_AVOutputURL = (NSURL *)v8;

    -[NSURL rc_URLByFixingUpPersistentMediaRecordingsDirectory](v5->_AVOutputURL, "rc_URLByFixingUpPersistentMediaRecordingsDirectory");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v5->_AVOutputURL;
    v5->_AVOutputURL = (NSURL *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("RCContentDuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_contentDuration = v13;

    objc_msgSend(v4, "objectForKey:", CFSTR("RCTimeRangeInContentToUse.beginTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_timeRangeInContentToUse.beginTime = v15;

    objc_msgSend(v4, "objectForKey:", CFSTR("RCTimeRangeInContentToUse.endTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_timeRangeInContentToUse.endTime = v17;

    objc_msgSend(v4, "objectForKey:", CFSTR("RCTimeRangeInComposition.beginTime"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v5->_timeRangeInComposition.beginTime = v19;

    objc_msgSend(v4, "objectForKey:", CFSTR("RCTimeRangeInComposition.endTime"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v5->_timeRangeInComposition.endTime = v21;

  }
  return v5;
}

- (id)dictionaryPListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL absoluteString](self->_AVOutputURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("RCAVOutputURL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contentDuration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("RCContentDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeRangeInContentToUse.beginTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("RCTimeRangeInContentToUse.beginTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeRangeInContentToUse.endTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("RCTimeRangeInContentToUse.endTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeRangeInComposition.beginTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("RCTimeRangeInComposition.beginTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeRangeInComposition.endTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("RCTimeRangeInComposition.endTime"));

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RCCompositionFragment *v4;
  void *v5;
  double contentDuration;
  double v7;
  double v8;
  RCCompositionFragment *v9;

  v4 = [RCCompositionFragment alloc];
  -[RCCompositionFragment AVOutputURL](self, "AVOutputURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  contentDuration = self->_contentDuration;
  -[RCCompositionFragment timeRangeInComposition](self, "timeRangeInComposition");
  v9 = -[RCCompositionFragment initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:](v4, "initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:", v5, contentDuration, self->_timeRangeInContentToUse.beginTime, self->_timeRangeInContentToUse.endTime, v7, v8);

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  RCMutableCompositionFragment *v4;
  void *v5;
  double contentDuration;
  double v7;
  double v8;
  RCMutableCompositionFragment *v9;

  v4 = [RCMutableCompositionFragment alloc];
  -[RCCompositionFragment AVOutputURL](self, "AVOutputURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  contentDuration = self->_contentDuration;
  -[RCCompositionFragment timeRangeInComposition](self, "timeRangeInComposition");
  v9 = -[RCCompositionFragment initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:](v4, "initWithAVOutputURL:contentDuration:timeRangeInContentToUse:timeRangeInComposition:", v5, contentDuration, self->_timeRangeInContentToUse.beginTime, self->_timeRangeInContentToUse.endTime, v7, v8);

  return v9;
}

- (NSURL)AVOutputURL
{
  return self->_AVOutputURL;
}

- (void)setAVOutputURL:(id)a3
{
  objc_storeStrong((id *)&self->_AVOutputURL, a3);
}

- (double)contentDuration
{
  return self->_contentDuration;
}

- (void)setContentDuration:(double)a3
{
  self->_contentDuration = a3;
}

- (void)setTimeRangeInContentToUse:(id)a3
{
  self->_timeRangeInContentToUse = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeInComposition
{
  double beginTime;
  double endTime;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  beginTime = self->_timeRangeInComposition.beginTime;
  endTime = self->_timeRangeInComposition.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (void)setTimeRangeInComposition:(id)a3
{
  self->_timeRangeInComposition = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AVOutputURL, 0);
}

@end
