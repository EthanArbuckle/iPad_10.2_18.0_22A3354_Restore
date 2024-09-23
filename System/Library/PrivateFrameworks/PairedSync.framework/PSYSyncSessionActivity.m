@implementation PSYSyncSessionActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)syncSessionActivityByUpdatingProgress:(double)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_sawADropout;
  return (id)objc_msgSend(v5, "initWithActivityInfo:progress:error:state:finishedSending:interruptionCount:startDropoutCount:sawADropout:", self->_activityInfo, self->_error, self->_activityState, self->_finishedSending, self->_interruptionCount, self->_startDropoutCount, a3, v7);
}

- (PSYSyncSessionActivity)initWithActivityInfo:(id)a3 progress:(double)a4 error:(id)a5 state:(unint64_t)a6 finishedSending:(BOOL)a7 interruptionCount:(int64_t)a8 startDropoutCount:(unint64_t)a9 sawADropout:(BOOL)a10
{
  id v17;
  id v18;
  PSYSyncSessionActivity *v19;
  PSYSyncSessionActivity *v20;
  objc_super v22;

  v17 = a3;
  v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PSYSyncSessionActivity;
  v19 = -[PSYSyncSessionActivity init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_activityInfo, a3);
    v20->_activityProgress = a4;
    objc_storeStrong((id *)&v20->_error, a5);
    v20->_activityState = a6;
    v20->_interruptionCount = a8;
    v20->_startDropoutCount = a9;
    v20->_sawADropout = a10;
  }

  return v20;
}

- (PSYSyncSessionActivity)initWithCoder:(id)a3
{
  id v4;
  PSYSyncSessionActivity *v5;
  uint64_t v6;
  PSYActivityInfo *activityInfo;
  double v8;
  uint64_t v9;
  NSError *error;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSYSyncSessionActivity;
  v5 = -[PSYSyncSessionActivity init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    activityInfo = v5->_activityInfo;
    v5->_activityInfo = (PSYActivityInfo *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("activityProgress"));
    v5->_activityProgress = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v9 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v9;

    v5->_activityState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activityState"));
    v5->_finishedSending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("finishedSending"));
    v5->_interruptionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interruptionCount"));
    v5->_startDropoutCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("startDropoutCount"));
    v5->_sawADropout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sawADropout"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PSYActivityInfo *activityInfo;
  id v5;

  activityInfo = self->_activityInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activityInfo, CFSTR("activityInfo"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("activityProgress"), self->_activityProgress);
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_activityState, CFSTR("activityState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_finishedSending, CFSTR("finishedSending"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interruptionCount, CFSTR("interruptionCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_startDropoutCount, CFSTR("startDropoutCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_sawADropout, CFSTR("sawADropout"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PSYActivityInfo label](self->_activityInfo, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PSYSyncSessionActivity *v4;
  PSYSyncSessionActivity *v5;
  BOOL v6;

  v4 = (PSYSyncSessionActivity *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5->_activityInfo == self->_activityInfo
        && v5->_error == self->_error
        && v5->_activityState == self->_activityState
        && v5->_finishedSending == self->_finishedSending
        && vabdd_f64(v5->_activityProgress, self->_activityProgress) < 0.00000011920929
        && v5->_interruptionCount == self->_interruptionCount
        && v5->_startDropoutCount == self->_startDropoutCount
        && v5->_sawADropout == self->_sawADropout;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (PSYActivityInfo)activityInfo
{
  return self->_activityInfo;
}

- (double)activityProgress
{
  return self->_activityProgress;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isFinishedSending
{
  return self->_finishedSending;
}

- (unint64_t)activityState
{
  return self->_activityState;
}

- (int64_t)interruptionCount
{
  return self->_interruptionCount;
}

- (unint64_t)startDropoutCount
{
  return self->_startDropoutCount;
}

- (BOOL)sawADropout
{
  return self->_sawADropout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_activityInfo, 0);
}

@end
