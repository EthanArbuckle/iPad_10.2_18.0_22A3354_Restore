@implementation CLHRRecoverySessionData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHRRecoverySessionData;
  -[CLHRRecoverySessionData dealloc](&v3, "dealloc");
}

- (CLHRRecoverySessionData)initWithCoder:(id)a3
{
  CLHRRecoverySessionData *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLHRRecoverySessionData;
  v4 = -[CLHRRecoverySessionData init](&v18, "init");
  if (v4)
  {
    v4->_recordId = (unint64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("recordId"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
    v4->_startTime = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("activityEndTime"));
    v4->_activityEndTime = v6;
    v4->_workoutSessionId = (NSUUID *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v7), CFSTR("kCLHRRecoverySessionCodingKeyWorkoutSessionId"));
    v4->_workoutType = objc_msgSend(a3, "decodeIntForKey:", CFSTR("workoutType"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("hrRecovery"));
    v4->_hrRecovery = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("lambda"));
    v4->_lambda = v9;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("hrMax"));
    v4->_hrMax = v10;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("hrMinAdjusted"));
    v4->_hrMinAdjusted = v11;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("recoveryOnsetTime"));
    v4->_recoveryOnsetTime = v12;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("steadyStateHR"));
    v4->_steadyStateHR = v13;
    v4->_status = objc_msgSend(a3, "decodeIntForKey:", CFSTR("status"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("sessionHrRecovery"));
    v4->_sessionHrRecovery = v14;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("peakHR"));
    v4->_peakHR = v15;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("hrRecoveryReference"));
    v4->_hrRecoveryReference = v16;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_recordId, CFSTR("recordId"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("activityEndTime"), self->_activityEndTime);
  objc_msgSend(a3, "encodeObject:forKey:", self->_workoutSessionId, CFSTR("kCLHRRecoverySessionCodingKeyWorkoutSessionId"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_workoutType, CFSTR("workoutType"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("hrRecovery"), self->_hrRecovery);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("lambda"), self->_lambda);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("hrMax"), self->_hrMax);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("hrMinAdjusted"), self->_hrMinAdjusted);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("recoveryOnsetTime"), self->_recoveryOnsetTime);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("steadyStateHR"), self->_steadyStateHR);
  objc_msgSend(a3, "encodeInt:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("sessionHrRecovery"), self->_sessionHrRecovery);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("peakHR"), self->_peakHR);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("hrRecoveryReference"), self->_hrRecoveryReference);
}

- (CLHRRecoverySessionData)initWithRecordId:(unint64_t)a3 startTime:(double)a4 activityEndTime:(double)a5 workoutSessionId:(id)a6 workoutType:(int)a7 hrRecovery:(double)a8 lambda:(double)a9 hrMax:(double)a10 hrMinAdjusted:(double)a11 recoveryOnsetTime:(double)a12 steadyStateHR:(double)a13 status:(int)a14 sessionHrRecovery:(double)a15 peakHR:(double)a16 hrRecoveryReference:(double)a17
{
  CLHRRecoverySessionData *v29;
  CLHRRecoverySessionData *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)CLHRRecoverySessionData;
  v29 = -[CLHRRecoverySessionData init](&v32, "init");
  v30 = v29;
  if (v29)
  {
    v29->_recordId = a3;
    v29->_startTime = a4;
    v29->_activityEndTime = a5;
    v29->_workoutSessionId = (NSUUID *)a6;
    v30->_hrRecovery = a8;
    v30->_lambda = a9;
    v30->_hrMax = a10;
    v30->_hrMinAdjusted = a11;
    v30->_recoveryOnsetTime = a12;
    v30->_steadyStateHR = a13;
    v30->_workoutType = a7;
    v30->_status = a14;
    v30->_sessionHrRecovery = a15;
    v30->_peakHR = a16;
    v30->_hrRecoveryReference = a17;
  }
  return v30;
}

- (CLHRRecoverySessionData)initWithHRRecoverySession:(const HRRecoverySession *)a3
{
  CLHRRecoverySessionData *v4;
  NSUUID *v5;
  int64_t var5;
  int var12;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLHRRecoverySessionData;
  v4 = -[CLHRRecoverySessionData init](&v9, "init");
  if (v4)
  {
    v5 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", a3->var4);
    v4->_recordId = a3->var0;
    v4->_startTime = a3->var1;
    v4->_activityEndTime = a3->var2;
    v4->_workoutSessionId = v5;
    var5 = a3->var5;
    v4->_hrRecovery = a3->var6;
    v4->_lambda = a3->var7;
    v4->_hrMax = a3->var8;
    v4->_hrMinAdjusted = a3->var9;
    v4->_recoveryOnsetTime = a3->var10;
    v4->_steadyStateHR = a3->var11;
    var12 = a3->var12;
    v4->_workoutType = var5;
    v4->_status = var12;
    v4->_sessionHrRecovery = a3->var13;
    v4->_peakHR = a3->var14;
    v4->_hrRecoveryReference = a3->var15;
  }
  return v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUUID *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[CLHRRecoverySessionData recordId](self, "recordId");
  -[CLHRRecoverySessionData startTime](self, "startTime");
  v30 = v6;
  -[CLHRRecoverySessionData activityEndTime](self, "activityEndTime");
  v29 = v7;
  v8 = -[CLHRRecoverySessionData workoutSessionId](self, "workoutSessionId");
  v9 = -[CLHRRecoverySessionData workoutType](self, "workoutType");
  -[CLHRRecoverySessionData hrRecovery](self, "hrRecovery");
  v11 = v10;
  -[CLHRRecoverySessionData lambda](self, "lambda");
  v13 = v12;
  -[CLHRRecoverySessionData hrMax](self, "hrMax");
  v15 = v14;
  -[CLHRRecoverySessionData hrMinAdjusted](self, "hrMinAdjusted");
  v17 = v16;
  -[CLHRRecoverySessionData recoveryOnsetTime](self, "recoveryOnsetTime");
  v19 = v18;
  -[CLHRRecoverySessionData steadyStateHR](self, "steadyStateHR");
  v21 = v20;
  v22 = -[CLHRRecoverySessionData status](self, "status");
  -[CLHRRecoverySessionData sessionHrRecovery](self, "sessionHrRecovery");
  v24 = v23;
  -[CLHRRecoverySessionData peakHR](self, "peakHR");
  v26 = v25;
  -[CLHRRecoverySessionData hrRecoveryReference](self, "hrRecoveryReference");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,<recordId %llu, startTime %f, activityEndTime %f, workoutSessionId %@, workoutType %d, hrRecovery %f, lambda %f, hrMax %f, hrMinAdjusted, %f, recoveryOnsetTime, %f, steadyStateHR, %f, status, %d, sessionHrRecovery, %f, peakHR, %f, hrRecoveryReference, %f>"), v4, v5, v30, v29, v8, v9, v11, v13, v15, v17, v19, v21, v22, v24, v26, v27);
}

- (HRRecoverySession)recoverySession
{
  HRRecoverySession *result;
  int status;
  __int128 v7;
  __int128 v8;

  retstr->var3 = 0.0;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)((char *)&retstr->var10 + 4) = 0u;
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var15 = 0u;
  *(_OWORD *)((char *)&retstr->var16 + 2) = 0u;
  retstr->var0 = self->_recordId;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self->_startTime;
  result = (HRRecoverySession *)-[NSUUID getUUIDBytes:](self->_workoutSessionId, "getUUIDBytes:", retstr->var4);
  status = self->_status;
  retstr->var5 = self->_workoutType;
  v7 = *(_OWORD *)&self->_hrMax;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->_hrRecovery;
  *(_OWORD *)&retstr->var8 = v7;
  v8 = *(_OWORD *)&self->_sessionHrRecovery;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self->_recoveryOnsetTime;
  retstr->var12 = status;
  *(_OWORD *)&retstr->var13 = v8;
  retstr->var15 = self->_hrRecoveryReference;
  return result;
}

- (unint64_t)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)activityEndTime
{
  return self->_activityEndTime;
}

- (NSUUID)workoutSessionId
{
  return self->_workoutSessionId;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (double)hrRecovery
{
  return self->_hrRecovery;
}

- (double)lambda
{
  return self->_lambda;
}

- (double)hrMax
{
  return self->_hrMax;
}

- (double)hrMinAdjusted
{
  return self->_hrMinAdjusted;
}

- (double)recoveryOnsetTime
{
  return self->_recoveryOnsetTime;
}

- (double)steadyStateHR
{
  return self->_steadyStateHR;
}

- (int)status
{
  return self->_status;
}

- (double)sessionHrRecovery
{
  return self->_sessionHrRecovery;
}

- (double)peakHR
{
  return self->_peakHR;
}

- (double)hrRecoveryReference
{
  return self->_hrRecoveryReference;
}

@end
