@implementation WLKPlaybackSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackRate, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_externalProfileID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_featureElapsedTime, 0);
  objc_storeStrong((id *)&self->_featureDuration, 0);
  objc_storeStrong((id *)&self->_elapsedTime, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_currentPlaybackDate, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (WLKPlaybackSummary)initWithMediaRemoteDictionary:(id)a3 bundleID:(id)a4 accountID:(id)a5 isFromActivePlayerPath:(BOOL)a6
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  float v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  int64_t v30;
  double v31;
  double v32;
  double v33;
  WLKPlaybackSummary *v34;
  WLKPlaybackSummary *v35;
  WLKPlaybackSummary *v36;
  uint64_t v38;
  uint64_t v39;
  int v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v8 = a3;
  v9 = *MEMORY[0x1E0D4CA18];
  v46 = a5;
  v10 = a4;
  objc_msgSend(v8, "valueForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4CA20]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4CB38]);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4CA30]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4CA38]);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4CB00]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4C9F8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4CA58]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4C9C8]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v18;
  v50 = v14;
  v48 = (void *)v15;
  if (objc_msgSend(v18, "BOOLValue"))
  {
    if (objc_msgSend(v16, "length"))
    {
      v19 = 0;
      v41 = 0;
      v42 = 1;
      v20 = 2;
LABEL_6:
      v43 = v20;
      goto LABEL_8;
    }
    if (objc_msgSend(v14, "length"))
    {
      v19 = 0;
      v42 = 0;
      v41 = 1;
      v20 = 1;
      goto LABEL_6;
    }
  }
  v42 = 0;
  v41 = 0;
  v43 = 0;
  v19 = 1;
LABEL_8:
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4CAB0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v49 = (void *)v13;
  v44 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v21;
    objc_msgSend(v21, "floatValue");
    if (v23 == 0.0)
    {
      v24 = 2;
      goto LABEL_13;
    }
  }
  else
  {
    v22 = v21;
  }
  v24 = 1;
LABEL_13:
  v25 = v51;
  if (v19)
  {
    objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D4CAA8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      objc_msgSend(v26, "floatValue");
      v29 = v28;
      if (fabs(v29) < 0.00000011920929)
      {
        v30 = 1;
LABEL_20:
        NSLog(CFSTR("WLKPlaybackSummary - using playProgress: %@"), v27);
LABEL_23:

        v25 = v51;
        goto LABEL_24;
      }
      if (fabs(v29 + -1.0) < 0.00000011920929)
      {
        v30 = 2;
        goto LABEL_20;
      }
      NSLog(CFSTR("WLKPlaybackSummary - invalid playProgress found: %@ Ignoring."), v27);
    }
    NSLog(CFSTR("WLKPlaybackSummary - using completion state heuristic"));
    objc_msgSend(v11, "doubleValue");
    v32 = v31;
    objc_msgSend(v12, "doubleValue");
    v30 = +[WLKPlaybackSummary completionStateForDuration:elapsedTime:](WLKPlaybackSummary, "completionStateForDuration:elapsedTime:", v32, v33);
    goto LABEL_23;
  }
  v30 = 0;
LABEL_24:
  if ((v42 | v41) == 1 && !v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  BYTE1(v39) = a6;
  LOBYTE(v39) = 0;
  LOBYTE(v38) = objc_msgSend(v25, "BOOLValue");
  v34 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:](self, "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v44, v49, v11, v12, 0, 0, v48, v50, v46, v24, v22, v30, v38, v16, v17,
          v43,
          v39,
          v45);

  v35 = v34;
  v36 = 0;
  if (-[WLKPlaybackSummary _isValid](v35, "_isValid"))
    v36 = v35;

  return v36;
}

- (BOOL)_isValid
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  int64_t playbackType;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  BOOL v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  _BOOL4 v24;
  void *v26;
  _BOOL4 v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;

  -[WLKPlaybackSummary bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v3, CFSTR("bundleID"), objc_opt_class());

  if (!v4)
    return 0;
  -[WLKPlaybackSummary accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v5, CFSTR("accountID"), objc_opt_class());

  if (!v6)
    return 0;
  -[WLKPlaybackSummary timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v7, CFSTR("timestamp"), objc_opt_class());

  if (!v8)
    return 0;
  playbackType = self->_playbackType;
  if (playbackType == 2)
  {
    -[WLKPlaybackSummary currentPlaybackDate](self, "currentPlaybackDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v17, CFSTR("currentPlaybackDate"), objc_opt_class());

    if (!v18)
      return 0;
    -[WLKPlaybackSummary serviceID](self, "serviceID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v19, CFSTR("serviceID"), objc_opt_class());

    return v20;
  }
  if (playbackType == 1)
  {
    -[WLKPlaybackSummary currentPlaybackDate](self, "currentPlaybackDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v21, CFSTR("currentPlaybackDate"), objc_opt_class());

    if (!v22)
      return 0;
    -[WLKPlaybackSummary contentID](self, "contentID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v23, CFSTR("contentID"), objc_opt_class());

    return v24;
  }
  if (playbackType)
    return 1;
  -[WLKPlaybackSummary duration](self, "duration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v10, CFSTR("duration"), objc_opt_class());

  if (!v11)
    return 0;
  -[WLKPlaybackSummary elapsedTime](self, "elapsedTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v12, CFSTR("elapsedTime"), objc_opt_class());

  if (!v13)
    return 0;
  -[WLKPlaybackSummary elapsedTime](self, "elapsedTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToNumber:", v15);

  if (!v16)
  {
    -[WLKPlaybackSummary contentID](self, "contentID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[WLKPlaybackSummary _validate:identifier:expectedClass:](self, "_validate:identifier:expectedClass:", v26, CFSTR("contentID"), objc_opt_class());

    if (!v27)
      return 0;
    -[WLKPlaybackSummary duration](self, "duration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedIntegerValue");

    if (v29 <= 0x1D)
    {
      -[WLKPlaybackSummary duration](self, "duration");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("WLKPlaybackSummary - Discarding activity. Does not meet minimum duration: %@"), v30);

      return 0;
    }
    -[WLKPlaybackSummary contentID](self, "contentID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    if (!v32)
    {
      NSLog(CFSTR("WLKPlaybackSummary - Missing external id."));
      return 0;
    }
    return 1;
  }
  NSLog(CFSTR("WLKPlaybackSummary - elapsed time is NaN"));
  return 0;
}

- (BOOL)_validate:(id)a3 identifier:(id)a4 expectedClass:(Class)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    NSLog(CFSTR("WLKPlaybackSummary - Parameter failed validation %@. It is nil"), v8);
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSStringFromClass(a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("WLKPlaybackSummary - Parameter failed validation %@. Expected: %@. Found %@"), v9, v11, v13);

    goto LABEL_6;
  }
  v10 = 1;
LABEL_7:

  return v10;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)accountID
{
  return self->_accountID;
}

+ (int64_t)completionStateForDuration:(double)a3 elapsedTime:(double)a4
{
  double v5;
  int64_t v6;

  objc_msgSend(a1, "playedThresholdTimeForDuration:", a3);
  v6 = 2;
  if (v5 > a4)
    v6 = 1;
  if (v5 == 0.0)
    return 0;
  else
    return v6;
}

+ (double)playedThresholdTimeForDuration:(double)a3
{
  double v3;
  double v4;
  unint64_t v5;

  v3 = 0.0;
  if (a3 > 0.0 && a3 != 3.40282347e38)
  {
    if (a3 < 10.0)
      return a3;
    if (a3 >= 900.0)
    {
      if (a3 >= 1800.0)
      {
        if (a3 >= 3900.0)
        {
          if (a3 >= 6000.0)
          {
            v4 = -660.0;
            return a3 + v4;
          }
          v5 = 0xC07E000000000000;
        }
        else
        {
          v5 = 0xC06E000000000000;
        }
        v4 = *(double *)&v5;
      }
      else
      {
        v4 = -180.0;
      }
    }
    else
    {
      v4 = -10.0;
    }
    return a3 + v4;
  }
  return v3;
}

- (WLKPlaybackSummary)initWithBundleID:(id)a3 timestamp:(id)a4 duration:(id)a5 elapsedTime:(id)a6 featureDuration:(id)a7 featureElapsedTime:(id)a8 externalProfileID:(id)a9 contentID:(id)a10 accountID:(id)a11 playbackState:(int64_t)a12 playbackRate:(id)a13 completionState:(int64_t)a14 isAlwaysLive:(BOOL)a15 serviceID:(id)a16 currentPlaybackDate:(id)a17 playbackType:(int64_t)a18 isTimerDerived:(BOOL)a19 isFromActivePlayerPath:(BOOL)a20 channelID:(id)a21
{
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  WLKPlaybackSummary *v36;
  uint64_t v37;
  NSString *bundleID;
  uint64_t v39;
  NSDate *timestamp;
  uint64_t v41;
  NSNumber *duration;
  uint64_t v43;
  NSNumber *elapsedTime;
  uint64_t v45;
  NSNumber *featureDuration;
  uint64_t v47;
  NSNumber *featureElapsedTime;
  uint64_t v49;
  NSString *externalProfileID;
  uint64_t v51;
  NSString *contentID;
  uint64_t v53;
  NSString *accountID;
  uint64_t v55;
  NSNumber *playbackRate;
  uint64_t v57;
  NSString *serviceID;
  uint64_t v59;
  NSDate *currentPlaybackDate;
  uint64_t v61;
  NSString *channelID;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;

  v26 = a3;
  v27 = a4;
  v28 = a5;
  v69 = a6;
  v68 = a7;
  v67 = a8;
  v29 = v27;
  v66 = a9;
  v65 = a10;
  v30 = a11;
  v31 = v28;
  v32 = a13;
  v33 = a16;
  v34 = a17;
  v35 = a21;
  v70.receiver = self;
  v70.super_class = (Class)WLKPlaybackSummary;
  v36 = -[WLKPlaybackSummary init](&v70, sel_init);
  if (v36)
  {
    v37 = objc_msgSend(v26, "copy");
    bundleID = v36->_bundleID;
    v36->_bundleID = (NSString *)v37;

    v39 = objc_msgSend(v29, "copy");
    timestamp = v36->_timestamp;
    v36->_timestamp = (NSDate *)v39;

    v41 = objc_msgSend(v31, "copy");
    duration = v36->_duration;
    v36->_duration = (NSNumber *)v41;

    v43 = objc_msgSend(v69, "copy");
    elapsedTime = v36->_elapsedTime;
    v36->_elapsedTime = (NSNumber *)v43;

    v45 = objc_msgSend(v68, "copy");
    featureDuration = v36->_featureDuration;
    v36->_featureDuration = (NSNumber *)v45;

    v47 = objc_msgSend(v67, "copy");
    featureElapsedTime = v36->_featureElapsedTime;
    v36->_featureElapsedTime = (NSNumber *)v47;

    v49 = objc_msgSend(v66, "copy");
    externalProfileID = v36->_externalProfileID;
    v36->_externalProfileID = (NSString *)v49;

    v51 = objc_msgSend(v65, "copy");
    contentID = v36->_contentID;
    v36->_contentID = (NSString *)v51;

    v53 = objc_msgSend(v30, "copy");
    accountID = v36->_accountID;
    v36->_accountID = (NSString *)v53;

    v36->_playbackState = a12;
    v55 = objc_msgSend(v32, "copy");
    playbackRate = v36->_playbackRate;
    v36->_playbackRate = (NSNumber *)v55;

    v36->_completionState = a14;
    v36->_isAlwaysLive = a15;
    v57 = objc_msgSend(v33, "copy");
    serviceID = v36->_serviceID;
    v36->_serviceID = (NSString *)v57;

    v59 = objc_msgSend(v34, "copy");
    currentPlaybackDate = v36->_currentPlaybackDate;
    v36->_currentPlaybackDate = (NSDate *)v59;

    v36->_playbackType = a18;
    v36->_isTimerDerived = a19;
    v36->_fromActivePlayerPath = a20;
    v61 = objc_msgSend(v35, "copy");
    channelID = v36->_channelID;
    v36->_channelID = (NSString *)v61;

  }
  return v36;
}

+ (id)VODSummaryWithBundleID:(id)a3 channelID:(id)a4 contentID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 duration:(id)a9 elapsedTime:(id)a10 playbackState:(int64_t)a11 playbackRate:(id)a12 completionState:(int64_t)a13
{
  return (id)objc_msgSend(a1, "VODSummaryWithBundleID:channelID:contentID:accountID:externalProfileID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:playbackState:playbackRate:completionState:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, a11, a12, a13);
}

+ (id)VODSummaryWithBundleID:(id)a3 channelID:(id)a4 contentID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 duration:(id)a9 elapsedTime:(id)a10 featureDuration:(id)a11 featureElapsedTime:(id)a12 playbackState:(int64_t)a13 playbackRate:(id)a14 completionState:(int64_t)a15
{
  int64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v37;
  uint64_t v38;
  id v39;
  WLKPlaybackSummary *v40;
  id v41;
  id v42;

  v20 = a15;
  v41 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a10;
  v28 = a11;
  v42 = a12;
  v29 = a14;
  v30 = v29;
  if (!a15)
  {
    v39 = v29;
    NSLog(CFSTR("WLKPlaybackSummary - using completion state heuristic"));
    if (v28 && v42)
    {
      objc_msgSend(v28, "doubleValue");
      v32 = v31;
      v33 = v42;
    }
    else
    {
      objc_msgSend(v26, "doubleValue");
      v32 = v34;
      v33 = v27;
    }
    objc_msgSend(v33, "doubleValue");
    v20 = +[WLKPlaybackSummary completionStateForDuration:elapsedTime:](WLKPlaybackSummary, "completionStateForDuration:elapsedTime:", v32, v35);
    v30 = v39;
  }
  LOWORD(v38) = 256;
  LOBYTE(v37) = 0;
  v40 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:]([WLKPlaybackSummary alloc], "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v41, v25, v26, v27, v28, v42, v24, v22, v23, a13, v30, v20, v37, 0, 0,
          0,
          v38,
          v21);

  return v40;
}

+ (id)liveSummaryWithBundleID:(id)a3 channelID:(id)a4 serviceID:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 playbackState:(int64_t)a9 playbackRate:(id)a10 currentPlaybackDate:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  WLKPlaybackSummary *v25;
  uint64_t v27;
  uint64_t v28;

  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  LOWORD(v28) = 256;
  LOBYTE(v27) = 1;
  v25 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:]([WLKPlaybackSummary alloc], "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v24, v19, 0, 0, 0, 0, v20, 0, v21, a9, v18, 0, v27, v22, v17,
          2,
          v28,
          v23);

  return v25;
}

+ (id)EBSSummaryWithBundleID:(id)a3 channelID:(id)a4 externalId:(id)a5 accountID:(id)a6 externalProfileID:(id)a7 timestamp:(id)a8 playbackState:(int64_t)a9 playbackRate:(id)a10 currentPlaybackDate:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  WLKPlaybackSummary *v25;
  uint64_t v27;
  uint64_t v28;

  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  LOWORD(v28) = 256;
  LOBYTE(v27) = 1;
  v25 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:]([WLKPlaybackSummary alloc], "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v24, v19, 0, 0, 0, 0, v20, v22, v21, a9, v18, 0, v27, 0, v17,
          1,
          v28,
          v23);

  return v25;
}

- (NSNumber)accountIDAsNumber
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[WLKPlaybackSummary accountID](self, "accountID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (BOOL)isEqual:(id)a3
{
  WLKPlaybackSummary *v4;
  BOOL v5;

  v4 = (WLKPlaybackSummary *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[WLKPlaybackSummary isEqualToSummary:](self, "isEqualToSummary:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSummary:(id)a3
{
  id v4;
  void *v5;
  int64_t playbackType;
  int64_t playbackState;
  int64_t completionState;
  int isAlwaysLive;
  int isTimerDerived;
  NSString *bundleID;
  void *v12;
  NSString *accountID;
  void *v14;
  NSDate *timestamp;
  void *v16;
  NSDate *currentPlaybackDate;
  void *v18;
  NSNumber *duration;
  void *v20;
  NSNumber *elapsedTime;
  void *v22;
  NSNumber *featureDuration;
  void *v24;
  NSNumber *featureElapsedTime;
  uint64_t v26;
  NSNumber *v27;
  void *v28;
  NSString *externalProfileID;
  NSString *contentID;
  NSString *serviceID;
  NSString *channelID;
  void *v33;
  BOOL v34;
  NSNumber *playbackRate;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  v5 = v4;
  if (v4
    && (playbackType = self->_playbackType, playbackType == objc_msgSend(v4, "playbackType"))
    && (playbackState = self->_playbackState, playbackState == objc_msgSend(v5, "playbackState"))
    && (completionState = self->_completionState, completionState == objc_msgSend(v5, "completionState"))
    && (isAlwaysLive = self->_isAlwaysLive, isAlwaysLive == objc_msgSend(v5, "isAlwaysLive"))
    && (isTimerDerived = self->_isTimerDerived, isTimerDerived == objc_msgSend(v5, "isTimerDerived")))
  {
    bundleID = self->_bundleID;
    objc_msgSend(v5, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](bundleID, "isEqualToString:", v12))
    {
      accountID = self->_accountID;
      objc_msgSend(v5, "accountID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](accountID, "isEqualToString:", v14))
      {
        timestamp = self->_timestamp;
        objc_msgSend(v5, "timestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSDate isEqualToDate:](timestamp, "isEqualToDate:", v16))
        {
          currentPlaybackDate = self->_currentPlaybackDate;
          objc_msgSend(v5, "currentPlaybackDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", currentPlaybackDate, v18))
          {
            duration = self->_duration;
            objc_msgSend(v5, "duration");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", duration, v20))
            {
              elapsedTime = self->_elapsedTime;
              objc_msgSend(v5, "elapsedTime");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", elapsedTime, v22))
              {
                featureDuration = self->_featureDuration;
                objc_msgSend(v5, "featureDuration");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", featureDuration, v24))
                {
                  featureElapsedTime = self->_featureElapsedTime;
                  objc_msgSend(v5, "featureElapsedTime");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v27 = featureElapsedTime;
                  v28 = (void *)v26;
                  if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", v27, v26))
                  {
                    v41 = v28;
                    externalProfileID = self->_externalProfileID;
                    objc_msgSend(v5, "externalProfileID");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", externalProfileID))
                    {
                      contentID = self->_contentID;
                      objc_msgSend(v5, "contentID");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", contentID))
                      {
                        serviceID = self->_serviceID;
                        objc_msgSend(v5, "serviceID");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", serviceID))
                        {
                          channelID = self->_channelID;
                          objc_msgSend(v5, "channelID");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", channelID))
                          {
                            playbackRate = self->_playbackRate;
                            objc_msgSend(v5, "playbackRate");
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            v34 = -[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", playbackRate, v33);

                          }
                          else
                          {
                            v34 = 0;
                          }

                        }
                        else
                        {
                          v34 = 0;
                        }

                      }
                      else
                      {
                        v34 = 0;
                      }

                    }
                    else
                    {
                      v34 = 0;
                    }

                    v28 = v41;
                  }
                  else
                  {
                    v34 = 0;
                  }

                }
                else
                {
                  v34 = 0;
                }

              }
              else
              {
                v34 = 0;
              }

            }
            else
            {
              v34 = 0;
            }

          }
          else
          {
            v34 = 0;
          }

        }
        else
        {
          v34 = 0;
        }

      }
      else
      {
        v34 = 0;
      }

    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (BOOL)isEquivalentToSummaryExcludingCursor:(id)a3
{
  id v4;
  void *v5;
  int64_t playbackType;
  int64_t playbackState;
  int64_t completionState;
  int isAlwaysLive;
  NSString *bundleID;
  void *v11;
  NSString *accountID;
  void *v13;
  NSNumber *duration;
  void *v15;
  NSNumber *featureDuration;
  void *v17;
  NSString *externalProfileID;
  void *v19;
  NSString *contentID;
  void *v21;
  NSString *serviceID;
  void *v23;
  NSString *channelID;
  void *v25;
  BOOL v26;
  NSNumber *playbackRate;
  void *v29;

  v4 = a3;
  v5 = v4;
  if (v4
    && (playbackType = self->_playbackType, playbackType == objc_msgSend(v4, "playbackType"))
    && (playbackState = self->_playbackState, playbackState == objc_msgSend(v5, "playbackState"))
    && (completionState = self->_completionState, completionState == objc_msgSend(v5, "completionState"))
    && (isAlwaysLive = self->_isAlwaysLive, isAlwaysLive == objc_msgSend(v5, "isAlwaysLive")))
  {
    bundleID = self->_bundleID;
    objc_msgSend(v5, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](bundleID, "isEqualToString:", v11))
    {
      accountID = self->_accountID;
      objc_msgSend(v5, "accountID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](accountID, "isEqualToString:", v13))
      {
        duration = self->_duration;
        objc_msgSend(v5, "duration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WLKPlaybackSummary _compareOptionalTemporalValue:with:fuzzy:](self, "_compareOptionalTemporalValue:with:fuzzy:", duration, v15, 1))
        {
          featureDuration = self->_featureDuration;
          objc_msgSend(v5, "featureDuration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WLKPlaybackSummary _compareOptionalTemporalValue:with:fuzzy:](self, "_compareOptionalTemporalValue:with:fuzzy:", featureDuration, v17, 1))
          {
            externalProfileID = self->_externalProfileID;
            objc_msgSend(v5, "externalProfileID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", externalProfileID, v19))
            {
              contentID = self->_contentID;
              objc_msgSend(v5, "contentID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", contentID, v21))
              {
                serviceID = self->_serviceID;
                objc_msgSend(v5, "serviceID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", serviceID, v23))
                {
                  channelID = self->_channelID;
                  objc_msgSend(v5, "channelID");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", channelID))
                  {
                    playbackRate = self->_playbackRate;
                    objc_msgSend(v5, "playbackRate");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = -[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", playbackRate, v25);

                  }
                  else
                  {
                    v26 = 0;
                  }

                }
                else
                {
                  v26 = 0;
                }

              }
              else
              {
                v26 = 0;
              }

            }
            else
            {
              v26 = 0;
            }

          }
          else
          {
            v26 = 0;
          }

        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)isEquivalentToSummaryExcludingTimestamp:(id)a3
{
  id v4;
  void *v5;
  int64_t playbackType;
  int64_t playbackState;
  int64_t completionState;
  int isAlwaysLive;
  int isTimerDerived;
  NSString *bundleID;
  void *v12;
  NSString *accountID;
  void *v14;
  NSNumber *duration;
  void *v16;
  NSNumber *elapsedTime;
  void *v18;
  NSNumber *featureDuration;
  void *v20;
  NSNumber *featureElapsedTime;
  void *v22;
  NSString *externalProfileID;
  void *v24;
  NSString *contentID;
  uint64_t v26;
  NSString *v27;
  void *v28;
  NSString *serviceID;
  NSString *channelID;
  void *v31;
  BOOL v32;
  NSNumber *playbackRate;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  v5 = v4;
  if (v4
    && (playbackType = self->_playbackType, playbackType == objc_msgSend(v4, "playbackType"))
    && (playbackState = self->_playbackState, playbackState == objc_msgSend(v5, "playbackState"))
    && (completionState = self->_completionState, completionState == objc_msgSend(v5, "completionState"))
    && (isAlwaysLive = self->_isAlwaysLive, isAlwaysLive == objc_msgSend(v5, "isAlwaysLive"))
    && (isTimerDerived = self->_isTimerDerived, isTimerDerived == objc_msgSend(v5, "isTimerDerived")))
  {
    bundleID = self->_bundleID;
    objc_msgSend(v5, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](bundleID, "isEqualToString:", v12))
    {
      accountID = self->_accountID;
      objc_msgSend(v5, "accountID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](accountID, "isEqualToString:", v14))
      {
        duration = self->_duration;
        objc_msgSend(v5, "duration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WLKPlaybackSummary _compareOptionalTemporalValue:with:fuzzy:](self, "_compareOptionalTemporalValue:with:fuzzy:", duration, v16, 1))
        {
          elapsedTime = self->_elapsedTime;
          objc_msgSend(v5, "elapsedTime");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WLKPlaybackSummary _compareOptionalTemporalValue:with:fuzzy:](self, "_compareOptionalTemporalValue:with:fuzzy:", elapsedTime, v18, 1))
          {
            featureDuration = self->_featureDuration;
            objc_msgSend(v5, "featureDuration");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[WLKPlaybackSummary _compareOptionalTemporalValue:with:fuzzy:](self, "_compareOptionalTemporalValue:with:fuzzy:", featureDuration, v20, 1))
            {
              featureElapsedTime = self->_featureElapsedTime;
              objc_msgSend(v5, "featureElapsedTime");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[WLKPlaybackSummary _compareOptionalTemporalValue:with:fuzzy:](self, "_compareOptionalTemporalValue:with:fuzzy:", featureElapsedTime, v22, 1))
              {
                externalProfileID = self->_externalProfileID;
                objc_msgSend(v5, "externalProfileID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", externalProfileID, v24))
                {
                  contentID = self->_contentID;
                  objc_msgSend(v5, "contentID");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v27 = contentID;
                  v28 = (void *)v26;
                  if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", v27, v26))
                  {
                    v37 = v28;
                    serviceID = self->_serviceID;
                    objc_msgSend(v5, "serviceID");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", serviceID))
                    {
                      channelID = self->_channelID;
                      objc_msgSend(v5, "channelID");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", channelID))
                      {
                        playbackRate = self->_playbackRate;
                        objc_msgSend(v5, "playbackRate");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        v32 = -[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", playbackRate, v31);

                      }
                      else
                      {
                        v32 = 0;
                      }

                    }
                    else
                    {
                      v32 = 0;
                    }

                    v28 = v37;
                  }
                  else
                  {
                    v32 = 0;
                  }

                }
                else
                {
                  v32 = 0;
                }

              }
              else
              {
                v32 = 0;
              }

            }
            else
            {
              v32 = 0;
            }

          }
          else
          {
            v32 = 0;
          }

        }
        else
        {
          v32 = 0;
        }

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)isSameContent:(id)a3
{
  id v4;
  void *v5;
  int64_t playbackType;
  int isAlwaysLive;
  NSString *bundleID;
  void *v9;
  NSString *accountID;
  void *v11;
  NSString *contentID;
  void *v13;
  NSString *serviceID;
  void *v15;
  NSString *channelID;
  void *v17;
  NSString *externalProfileID;
  void *v19;
  BOOL v20;

  v4 = a3;
  v5 = v4;
  if (v4
    && (playbackType = self->_playbackType, playbackType == objc_msgSend(v4, "playbackType"))
    && (isAlwaysLive = self->_isAlwaysLive, isAlwaysLive == objc_msgSend(v5, "isAlwaysLive")))
  {
    bundleID = self->_bundleID;
    objc_msgSend(v5, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](bundleID, "isEqualToString:", v9))
    {
      accountID = self->_accountID;
      objc_msgSend(v5, "accountID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](accountID, "isEqualToString:", v11))
      {
        contentID = self->_contentID;
        objc_msgSend(v5, "contentID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", contentID, v13))
        {
          serviceID = self->_serviceID;
          objc_msgSend(v5, "serviceID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", serviceID, v15))
          {
            channelID = self->_channelID;
            objc_msgSend(v5, "channelID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", channelID, v17))
            {
              externalProfileID = self->_externalProfileID;
              objc_msgSend(v5, "externalProfileID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = -[WLKPlaybackSummary _compareOptional:with:](self, "_compareOptional:with:", externalProfileID, v19);

            }
            else
            {
              v20 = 0;
            }

          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  _BOOL8 isAlwaysLive;
  NSUInteger v9;

  v3 = -[NSString hash](self->_bundleID, "hash");
  v4 = -[NSDate hash](self->_timestamp, "hash") ^ v3;
  v5 = -[NSNumber hash](self->_duration, "hash");
  v6 = v4 ^ v5 ^ -[NSNumber hash](self->_elapsedTime, "hash");
  v7 = v6 ^ -[NSString hash](self->_contentID, "hash") ^ self->_playbackState ^ self->_playbackType;
  isAlwaysLive = self->_isAlwaysLive;
  v9 = isAlwaysLive ^ -[NSString hash](self->_serviceID, "hash");
  return v7 ^ v9 ^ -[NSString hash](self->_channelID, "hash");
}

- (BOOL)isLiveType
{
  return (unint64_t)(self->_playbackType - 1) < 2;
}

- (id)shortDescription
{
  NSString *channelID;
  NSString *contentID;
  int64_t completionState;
  NSString *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  channelID = self->_channelID;
  if (!channelID)
    channelID = self->_bundleID;
  contentID = self->_contentID;
  if (!contentID)
    contentID = self->_serviceID;
  completionState = self->_completionState;
  v6 = contentID;
  v7 = channelID;
  +[WLKPlaybackSummary debugStringForCompletionState:](WLKPlaybackSummary, "debugStringForCompletionState:", completionState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKPlaybackSummary _debugStringForPlaybackType:](WLKPlaybackSummary, "_debugStringForPlaybackType:", self->_playbackType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@:::%@] [%@] [%@]"), v7, v6, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)WLKPlaybackSummary;
  -[WLKPlaybackSummary description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WLKPlaybackSummary;
  -[WLKPlaybackSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t bundleID;
  uint64_t timestamp;
  uint64_t duration;
  uint64_t elapsedTime;
  uint64_t featureDuration;
  uint64_t featureElapsedTime;
  uint64_t contentID;
  NSNumber *playbackRate;
  uint64_t v14;
  NSString *serviceID;
  uint64_t v16;
  NSDate *currentPlaybackDate;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *channelID;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD v45[17];
  _QWORD v46[19];

  v46[17] = *MEMORY[0x1E0C80C00];
  +[WLKPlaybackSummary debugStringForCompletionState:](WLKPlaybackSummary, "debugStringForCompletionState:", self->_completionState);
  v3 = objc_claimAutoreleasedReturnValue();
  +[WLKPlaybackSummary debugStringForPlaybackState:](WLKPlaybackSummary, "debugStringForPlaybackState:", self->_playbackState);
  v4 = objc_claimAutoreleasedReturnValue();
  +[WLKPlaybackSummary _debugStringForPlaybackType:](WLKPlaybackSummary, "_debugStringForPlaybackType:", self->_playbackType);
  v5 = objc_claimAutoreleasedReturnValue();
  v45[0] = CFSTR("bundleID");
  bundleID = (uint64_t)self->_bundleID;
  v42 = bundleID;
  if (!bundleID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    bundleID = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)bundleID;
  v46[0] = bundleID;
  v45[1] = CFSTR("timestamp");
  timestamp = (uint64_t)self->_timestamp;
  v41 = timestamp;
  if (!timestamp)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    timestamp = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)timestamp;
  v46[1] = timestamp;
  v45[2] = CFSTR("duration");
  duration = (uint64_t)self->_duration;
  v40 = duration;
  if (!duration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    duration = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)duration;
  v46[2] = duration;
  v45[3] = CFSTR("elapsedTime");
  elapsedTime = (uint64_t)self->_elapsedTime;
  v39 = elapsedTime;
  if (!elapsedTime)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    elapsedTime = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)elapsedTime;
  v46[3] = elapsedTime;
  v45[4] = CFSTR("featureDuration");
  featureDuration = (uint64_t)self->_featureDuration;
  v38 = featureDuration;
  if (!featureDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    featureDuration = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)featureDuration;
  v46[4] = featureDuration;
  v45[5] = CFSTR("featureElapsedTime");
  featureElapsedTime = (uint64_t)self->_featureElapsedTime;
  v37 = featureElapsedTime;
  if (!featureElapsedTime)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    featureElapsedTime = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)featureElapsedTime;
  v46[5] = featureElapsedTime;
  v45[6] = CFSTR("contentID");
  contentID = (uint64_t)self->_contentID;
  v36 = contentID;
  if (!contentID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    contentID = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)contentID;
  v46[6] = contentID;
  v46[7] = v4;
  v45[7] = CFSTR("playbackState");
  v45[8] = CFSTR("playbackRate");
  playbackRate = self->_playbackRate;
  v14 = (uint64_t)playbackRate;
  if (!playbackRate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v4;
  v44 = (void *)v3;
  v27 = (void *)v14;
  v46[8] = v14;
  v46[9] = v3;
  v45[9] = CFSTR("completionState");
  v45[10] = CFSTR("serviceID");
  serviceID = self->_serviceID;
  v16 = (uint64_t)serviceID;
  if (!serviceID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v16;
  v46[10] = v16;
  v45[11] = CFSTR("currentPlaybackDate");
  currentPlaybackDate = self->_currentPlaybackDate;
  v18 = currentPlaybackDate;
  if (!currentPlaybackDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46[11] = v18;
  v45[12] = CFSTR("isAlwaysLive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAlwaysLive);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[12] = v19;
  v46[13] = v5;
  v20 = (void *)v5;
  v45[13] = CFSTR("playbackType");
  v45[14] = CFSTR("isTimerDerived");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTimerDerived);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46[14] = v21;
  v45[15] = CFSTR("isFromActivePlayerPath");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fromActivePlayerPath);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[15] = v22;
  v45[16] = CFSTR("channelID");
  channelID = self->_channelID;
  v24 = channelID;
  if (!channelID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v46[16] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 17);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (!channelID)

  if (currentPlaybackDate)
  {
    if (serviceID)
      goto LABEL_27;
  }
  else
  {

    if (serviceID)
      goto LABEL_27;
  }

LABEL_27:
  if (!playbackRate)

  if (!v36)
  if (!v37)

  if (!v38)
  if (!v39)

  if (!v40)
  if (!v41)

  if (!v42)
  return v35;
}

+ (id)debugStringForPlaybackState:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Playing");
  if (a3 == 2)
    v3 = CFSTR("Paused");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Stopped");
}

+ (id)_debugStringForPlaybackType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("VOD");
  if (a3 == 1)
    v3 = CFSTR("EBS");
  if (a3 == 2)
    return CFSTR("Live");
  else
    return (id)v3;
}

- (id)JSONRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WLKPlaybackSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_completionState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("completionStateValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_playbackState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("playbackStateValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_playbackType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("playbackTypeValue"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_accountID, CFSTR("accountID"));
  return v4;
}

- (id)sanitizedCopy
{
  void *v3;
  int64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  WLKPlaybackSummary *v23;
  WLKPlaybackSummary *v24;

  v23 = [WLKPlaybackSummary alloc];
  -[WLKPlaybackSummary bundleID](self, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary timestamp](self, "timestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary duration](self, "duration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary elapsedTime](self, "elapsedTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary featureDuration](self, "featureDuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary featureElapsedTime](self, "featureElapsedTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary contentID](self, "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WLKPlaybackSummary playbackState](self, "playbackState");
  -[WLKPlaybackSummary playbackRate](self, "playbackRate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WLKPlaybackSummary completionState](self, "completionState");
  v5 = -[WLKPlaybackSummary isAlwaysLive](self, "isAlwaysLive");
  -[WLKPlaybackSummary serviceID](self, "serviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary currentPlaybackDate](self, "currentPlaybackDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WLKPlaybackSummary playbackType](self, "playbackType");
  v9 = -[WLKPlaybackSummary isTimerDerived](self, "isTimerDerived");
  v10 = -[WLKPlaybackSummary isFromActivePlayerPath](self, "isFromActivePlayerPath");
  -[WLKPlaybackSummary channelID](self, "channelID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v14) = v10;
  LOBYTE(v14) = v9;
  LOBYTE(v13) = v5;
  v24 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:](v23, "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v18, v22, v21, v20, v19, v17, 0, v3, 0, v16, v15, v4, v13, v6, v7,
          v8,
          v14,
          v11);

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKPlaybackSummary)initWithCoder:(id)a3
{
  id v4;
  WLKPlaybackSummary *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSDate *timestamp;
  uint64_t v10;
  NSNumber *duration;
  uint64_t v12;
  NSNumber *elapsedTime;
  uint64_t v14;
  NSNumber *featureDuration;
  uint64_t v16;
  NSNumber *featureElapsedTime;
  uint64_t v18;
  NSString *contentID;
  uint64_t v20;
  NSString *externalProfileID;
  uint64_t v22;
  NSString *accountID;
  uint64_t v24;
  NSNumber *playbackRate;
  uint64_t v26;
  NSString *serviceID;
  uint64_t v28;
  NSDate *currentPlaybackDate;
  uint64_t v30;
  NSString *channelID;
  WLKPlaybackSummary *v32;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_8);
    v5 = -[WLKPlaybackSummary init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.bundleID"));
      v6 = objc_claimAutoreleasedReturnValue();
      bundleID = v5->_bundleID;
      v5->_bundleID = (NSString *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.timestamp"));
      v8 = objc_claimAutoreleasedReturnValue();
      timestamp = v5->_timestamp;
      v5->_timestamp = (NSDate *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.duration"));
      v10 = objc_claimAutoreleasedReturnValue();
      duration = v5->_duration;
      v5->_duration = (NSNumber *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.elapsedTime"));
      v12 = objc_claimAutoreleasedReturnValue();
      elapsedTime = v5->_elapsedTime;
      v5->_elapsedTime = (NSNumber *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.featureDuration"));
      v14 = objc_claimAutoreleasedReturnValue();
      featureDuration = v5->_featureDuration;
      v5->_featureDuration = (NSNumber *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.featureElapsedTime"));
      v16 = objc_claimAutoreleasedReturnValue();
      featureElapsedTime = v5->_featureElapsedTime;
      v5->_featureElapsedTime = (NSNumber *)v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.externalContentID"));
      v18 = objc_claimAutoreleasedReturnValue();
      contentID = v5->_contentID;
      v5->_contentID = (NSString *)v18;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.externalUserProfileID"));
      v20 = objc_claimAutoreleasedReturnValue();
      externalProfileID = v5->_externalProfileID;
      v5->_externalProfileID = (NSString *)v20;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.accountID"));
      v22 = objc_claimAutoreleasedReturnValue();
      accountID = v5->_accountID;
      v5->_accountID = (NSString *)v22;

      v5->_playbackState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WLKPlaybackActivity.playbackState"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.playbackRate"));
      v24 = objc_claimAutoreleasedReturnValue();
      playbackRate = v5->_playbackRate;
      v5->_playbackRate = (NSNumber *)v24;

      v5->_completionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WLKPlaybackActivity.completionState"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.serviceID"));
      v26 = objc_claimAutoreleasedReturnValue();
      serviceID = v5->_serviceID;
      v5->_serviceID = (NSString *)v26;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.currentPlaybackDate"));
      v28 = objc_claimAutoreleasedReturnValue();
      currentPlaybackDate = v5->_currentPlaybackDate;
      v5->_currentPlaybackDate = (NSDate *)v28;

      v5->_isAlwaysLive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKPlaybackActivity.isAlwaysLive"));
      v5->_playbackType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WLKPlaybackActivity.playbackType"));
      v5->_isTimerDerived = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKPlaybackActivity.isTimerDerived"));
      v5->_fromActivePlayerPath = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WLKPlaybackActivity.fromActivePlayerPath"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKPlaybackActivity.channelID"));
      v30 = objc_claimAutoreleasedReturnValue();
      channelID = v5->_channelID;
      v5->_channelID = (NSString *)v30;

    }
    self = v5;
    v32 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
    v32 = 0;
  }

  return v32;
}

void __36__WLKPlaybackSummary_initWithCoder___block_invoke()
{
  void *v0;
  char v1;

  +[WLKProcessInfo currentProcessInfo](WLKProcessInfo, "currentProcessInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "BOOLValueForEntitlement:", CFSTR("com.apple.watchlist.private")) & 1) != 0)
    v1 = 1;
  else
    v1 = WLKIsDaemon();
  initWithCoder__isEntitled = v1;

  if (!initWithCoder__isEntitled)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This process is not properly entitled for WatchListKit"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("WLKPlaybackActivity.bundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestamp, CFSTR("WLKPlaybackActivity.timestamp"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_duration, CFSTR("WLKPlaybackActivity.duration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_elapsedTime, CFSTR("WLKPlaybackActivity.elapsedTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureDuration, CFSTR("WLKPlaybackActivity.featureDuration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureElapsedTime, CFSTR("WLKPlaybackActivity.featureElapsedTime"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, CFSTR("WLKPlaybackActivity.externalContentID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalProfileID, CFSTR("WLKPlaybackActivity.externalUserProfileID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountID, CFSTR("WLKPlaybackActivity.accountID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_playbackState, CFSTR("WLKPlaybackActivity.playbackState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_playbackRate, CFSTR("WLKPlaybackActivity.playbackRate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_completionState, CFSTR("WLKPlaybackActivity.completionState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceID, CFSTR("WLKPlaybackActivity.serviceID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentPlaybackDate, CFSTR("WLKPlaybackActivity.currentPlaybackDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isAlwaysLive, CFSTR("WLKPlaybackActivity.isAlwaysLive"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_playbackType, CFSTR("WLKPlaybackActivity.playbackType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTimerDerived, CFSTR("WLKPlaybackActivity.isTimerDerived"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_fromActivePlayerPath, CFSTR("WLKPlaybackActivity.fromActivePlayerPath"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_channelID, CFSTR("WLKPlaybackActivity.channelID"));

}

- (BOOL)_compareOptional:(id)a3 with:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return ((unint64_t)a3 | (unint64_t)a4) == 0;
}

- (BOOL)_compareOptionalTemporalValue:(id)a3 with:(id)a4 fuzzy:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v7;
  unint64_t v8;
  float v9;
  float v10;
  float v11;
  char v12;

  v5 = a5;
  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend((id)v7, "floatValue");
    v10 = v9;
    objc_msgSend((id)v8, "floatValue");
    v12 = vabds_f32(v10, v11) <= 0.1;
  }
  else if (v7 && v8)
  {
    v12 = objc_msgSend((id)v7, "isEqual:", v8);
  }
  else
  {
    v12 = (v7 | v8) == 0;
  }

  return v12;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSDate)currentPlaybackDate
{
  return self->_currentPlaybackDate;
}

- (NSNumber)elapsedTime
{
  return self->_elapsedTime;
}

- (NSNumber)featureDuration
{
  return self->_featureDuration;
}

- (NSNumber)featureElapsedTime
{
  return self->_featureElapsedTime;
}

- (NSString)externalProfileID
{
  return self->_externalProfileID;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (NSNumber)playbackRate
{
  return self->_playbackRate;
}

- (int64_t)completionState
{
  return self->_completionState;
}

- (int64_t)playbackType
{
  return self->_playbackType;
}

- (BOOL)isAlwaysLive
{
  return self->_isAlwaysLive;
}

- (void)setIsAlwaysLive:(BOOL)a3
{
  self->_isAlwaysLive = a3;
}

- (BOOL)isTimerDerived
{
  return self->_isTimerDerived;
}

- (void)setIsTimerDerived:(BOOL)a3
{
  self->_isTimerDerived = a3;
}

- (BOOL)isFromActivePlayerPath
{
  return self->_fromActivePlayerPath;
}

- (void)setFromActivePlayerPath:(BOOL)a3
{
  self->_fromActivePlayerPath = a3;
}

- (void)resolveChannelID:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  void (**v10)(id, id, _QWORD);

  v4 = (void (**)(id, id, _QWORD))a3;
  -[WLKPlaybackSummary channelID](self, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WLKPlaybackSummary channelID](self, "channelID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);
  }
  else
  {
    +[WLKChannelUtilities sharedInstanceFiltered](WLKChannelUtilities, "sharedInstanceFiltered");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__WLKPlaybackSummary_ChannelID__resolveChannelID___block_invoke;
    v8[3] = &unk_1E68A83C0;
    v8[4] = self;
    v9 = v7;
    v10 = v4;
    v6 = v7;
    objc_msgSend(v6, "loadIfNeededWithCompletion:", v8);

  }
}

void __50__WLKPlaybackSummary_ChannelID__resolveChannelID___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "channelForBundleID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "channelID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);
    }
    else
    {
      WLKError(0, 0, CFSTR("channel not found"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v6);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

+ (id)debugStringForCompletionState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E68A9098[a3];
}

- (id)elapsedTimeSummaryWithPlaybackState:(int64_t)a3 timerDerived:(BOOL)a4
{
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  int64_t v33;
  BOOL v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  WLKPlaybackSummary *v46;
  int64_t v47;
  void *v48;
  BOOL v49;
  WLKPlaybackSummary *v50;

  v7 = 0.0;
  if (-[WLKPlaybackSummary playbackState](self, "playbackState") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKPlaybackSummary timestamp](self, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v7 = v10;

  }
  -[WLKPlaybackSummary elapsedTime](self, "elapsedTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v7 + v12;

  -[WLKPlaybackSummary duration](self, "duration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = fmin(v13, v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary featureElapsedTime](self, "featureElapsedTime");
  v18 = objc_claimAutoreleasedReturnValue();
  v49 = a4;
  v48 = (void *)v17;
  if (v18
    && (v19 = (void *)v18,
        -[WLKPlaybackSummary featureDuration](self, "featureDuration"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
    -[WLKPlaybackSummary featureElapsedTime](self, "featureElapsedTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v7 + v22;

    -[WLKPlaybackSummary featureDuration](self, "featureDuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = fmin(v23, v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  -[WLKPlaybackSummary duration](self, "duration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v47 = +[WLKPlaybackSummary completionStateForDuration:elapsedTime:](WLKPlaybackSummary, "completionStateForDuration:elapsedTime:");

  v46 = [WLKPlaybackSummary alloc];
  -[WLKPlaybackSummary bundleID](self, "bundleID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary duration](self, "duration");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary featureDuration](self, "featureDuration");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary externalProfileID](self, "externalProfileID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary contentID](self, "contentID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary accountID](self, "accountID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
    v30 = &unk_1E68C99E0;
  else
    v30 = &unk_1E68C99F8;
  v31 = -[WLKPlaybackSummary isAlwaysLive](self, "isAlwaysLive");
  -[WLKPlaybackSummary serviceID](self, "serviceID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKPlaybackSummary currentPlaybackDate](self, "currentPlaybackDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[WLKPlaybackSummary playbackType](self, "playbackType");
  v34 = -[WLKPlaybackSummary isFromActivePlayerPath](self, "isFromActivePlayerPath");
  -[WLKPlaybackSummary channelID](self, "channelID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v38) = v34;
  LOBYTE(v38) = v49;
  LOBYTE(v37) = v31;
  v50 = -[WLKPlaybackSummary initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:](v46, "initWithBundleID:timestamp:duration:elapsedTime:featureDuration:featureElapsedTime:externalProfileID:contentID:accountID:playbackState:playbackRate:completionState:isAlwaysLive:serviceID:currentPlaybackDate:playbackType:isTimerDerived:isFromActivePlayerPath:channelID:", v45, v44, v43, v48, v42, v39, v28, v29, v41, a3, v30, v47, v37, v40, v32,
          v33,
          v38,
          v35);

  return v50;
}

@end
