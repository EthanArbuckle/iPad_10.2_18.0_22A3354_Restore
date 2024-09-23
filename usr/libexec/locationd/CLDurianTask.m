@implementation CLDurianTask

- (CLDurianTask)init
{
  -[CLDurianTask doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianTask)initWithCommand:(id)a3 desiredLatency:(int64_t)a4 expectsResponse:(BOOL)a5 completeOnPreemption:(BOOL)a6 requiresMutex:(BOOL)a7
{
  CLDurianTask *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLDurianTask;
  v12 = -[CLDurianTask init](&v14, "init");
  if (v12)
  {
    v12->_uuid = (NSUUID *)objc_alloc_init((Class)NSUUID);
    v12->_command = (CLDurianCommand *)a3;
    v12->_desiredLatency = a4;
    v12->_expectsResponse = a5;
    v12->_completeOnPreemption = a6;
    v12->_requiresMutex = a7;
    v12->_creationTime = mach_continuous_time();
    v12->_completionTime = 0;
    v12->_userTask = 1;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianTask;
  -[CLDurianTask dealloc](&v3, "dealloc");
}

- (int64_t)timeoutSeconds
{
  int v2;

  v2 = -[CLDurianTask translatedOpcode](self, "translatedOpcode");
  if (v2 <= 174)
  {
    if (v2 != 3)
    {
      if (v2 == 15)
        return 20;
      if (v2 == 40)
        return 60;
      return 5;
    }
    return 3600;
  }
  else
  {
    if (v2 <= 526)
    {
      if (v2 != 175)
      {
        if (v2 != 515)
          return 5;
        return 20;
      }
      return 60;
    }
    if (v2 != 527)
    {
      if (v2 == 768)
        return 60;
      return 5;
    }
    return 180;
  }
}

- (double)queueDuration
{
  unint64_t startTime;
  unint64_t creationTime;
  double result;

  creationTime = self->_creationTime;
  startTime = self->_startTime;
  if (startTime < creationTime)
    return -1.0;
  TMConvertTicksToSeconds(startTime - creationTime);
  return result;
}

- (double)executionDuration
{
  unint64_t completionTime;
  unint64_t startTime;
  double result;

  startTime = self->_startTime;
  completionTime = self->_completionTime;
  if (completionTime < startTime)
    return -1.0;
  TMConvertTicksToSeconds(completionTime - startTime);
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DurianTask <%p>, Type:%@, id:%@"), self, sub_1014F7274(-[CLDurianCommand opcode](self->_command, "opcode")), -[CLDurianTask uuid](self, "uuid"));
}

- (id)opcodeDescription
{
  return (id)sub_1014F7274(-[CLDurianCommand opcode](self->_command, "opcode"));
}

- (unsigned)translatedOpcode
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[CLDurianCommand opcode](-[CLDurianTask command](self, "command"), "opcode");
  if (v3 == 208)
  {
    v5 = objc_opt_class(CLHawkeyeTask, v4);
    if ((objc_opt_isKindOfClass(self, v5) & 1) != 0)
      LOWORD(v3) = (unsigned __int16)-[CLDurianTask hawkeyeOpcode](self, "hawkeyeOpcode");
    else
      LOWORD(v3) = 208;
  }
  return v3;
}

- (BOOL)shouldPreemptTask:(id)a3
{
  int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  _BOOL4 v9;
  BOOL v10;
  _BOOL4 v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;

  v5 = -[CLDurianTask translatedOpcode](self, "translatedOpcode");
  v7 = objc_msgSend(a3, "translatedOpcode");
  if (v7 == 208)
  {
    v8 = objc_opt_class(CLHawkeyeTask, v6);
    if ((objc_opt_isKindOfClass(a3, v8) & 1) != 0)
      v7 = -[CLDurianTask hawkeyeOpcode](self, "hawkeyeOpcode");
    else
      v7 = 208;
  }
  if (v5 > 527)
  {
    if (v5 > 2051)
    {
      v11 = ((1 << (v5 - 4)) & 0x203) != 0 && v7 == 2051;
      v9 = (v5 - 2052) <= 9 && v11;
      goto LABEL_36;
    }
    if ((v5 - 1796) >= 2)
    {
      if (v5 == 528)
      {
        v10 = v7 == 527;
      }
      else
      {
        v9 = 0;
        if (v5 != 769)
          goto LABEL_36;
        v10 = v7 == 768;
      }
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  if (v5 <= 31)
  {
    if (v5 != 6)
    {
      if (v5 == 8)
      {
        v10 = v7 == 40;
LABEL_33:
        v9 = v10;
        goto LABEL_36;
      }
      v9 = 0;
      if (v5 != 22)
        goto LABEL_36;
    }
LABEL_19:
    v10 = v7 == 3;
    goto LABEL_33;
  }
  if (v5 > 174)
  {
    if (v5 != 175)
    {
      v9 = 0;
      if (v5 != 220)
        goto LABEL_36;
      v10 = v7 == 175;
      goto LABEL_33;
    }
LABEL_29:
    v10 = v7 == 1795;
    goto LABEL_33;
  }
  if (v5 == 32)
  {
    v9 = 1;
    goto LABEL_36;
  }
  v9 = 0;
  if (v5 == 40)
    goto LABEL_19;
LABEL_36:
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v12 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 68289794;
    v14[1] = 0;
    v15 = 2082;
    v16 = "";
    v17 = 1026;
    v18 = v9;
    v19 = 1026;
    v20 = v5;
    v21 = 1026;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian shouldPreempt\", \"preempt\":%{public}d, \"this\":%{public}d, \"ongoing\":%{public}d}", (uint8_t *)v14, 0x24u);
  }
  return v9;
}

- (BOOL)isMutexProtectedSoundTask
{
  unsigned int v2;

  if (!self->_requiresMutex)
    return 0;
  v2 = -[CLDurianCommand opcode](-[CLDurianTask command](self, "command"), "opcode");
  return v2 == 40 || (v2 & 0xFFFE) == 8;
}

- (BOOL)isMutexProtectedRangingTask
{
  if (self->_requiresMutex)
    return vmaxv_u16((uint16x4_t)vceq_s16(vdup_n_s16(-[CLDurianCommand opcode](-[CLDurianTask command](self, "command"), "opcode")), (int16x4_t)0x3001500010006)) & 1;
  else
    return 0;
}

- (BOOL)shouldCompleteOnPreemptionByTask:(id)a3
{
  return -[CLDurianCommand opcode](-[CLDurianTask command](self, "command"), "opcode") == 3
      && objc_msgSend(objc_msgSend(a3, "command"), "opcode") == 6
      || -[CLDurianCommand opcode](-[CLDurianTask command](self, "command"), "opcode") == 2051
      && objc_msgSend(objc_msgSend(a3, "command"), "opcode") == 2053
      || self->_completeOnPreemption;
}

- (void)cancel
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  __int16 v7;
  unsigned int v8;
  __int16 v9;
  id v10;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289539;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    v7 = 1026;
    v8 = -[CLDurianCommand opcode](-[CLDurianTask command](self, "command"), "opcode");
    v9 = 2113;
    v10 = -[CLDurianTask description](self, "description");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian cancelling task\", \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@}", (uint8_t *)v4, 0x22u);
  }
  self->_cancelled = 1;
}

- (void)willStart
{
  self->_startTime = mach_continuous_time();
}

- (void)complete
{
  self->_completionTime = mach_continuous_time();
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)completionTime
{
  return self->_completionTime;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (CLDurianCommand)command
{
  return (CLDurianCommand *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCommand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (BOOL)requiresMutex
{
  return self->_requiresMutex;
}

- (void)setRequiresMutex:(BOOL)a3
{
  self->_requiresMutex = a3;
}

- (BOOL)completeOnPreemption
{
  return self->_completeOnPreemption;
}

- (BOOL)userTask
{
  return self->_userTask;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (int64_t)desiredLatency
{
  return self->_desiredLatency;
}

+ (id)fetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3
{
  return -[CLDurianFetchFirmwareVersionTask initWithIncludeCrashLogs:]([CLDurianFetchFirmwareVersionTask alloc], "initWithIncludeCrashLogs:", a3);
}

+ (id)fetchCurrentKeyIndexTask
{
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand fetchCurrentKeyIndexCommand](CLDurianCommand, "fetchCurrentKeyIndexCommand"), +[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID"), +[CBUUID _cl_DurianKeyIndexCharacteristicUUID](CBUUID, "_cl_DurianKeyIndexCharacteristicUUID"));
}

+ (id)fetchBatteryStatusTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand fetchBatteryStatusCommand](CLDurianCommand, "fetchBatteryStatusCommand"), -6, 1, 0, 0);
}

+ (id)fetchUserStatsTaskWithPersistence_v0:(BOOL)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand fetchUserStatsCommandWithPersistence_v0:](CLDurianCommand, "fetchUserStatsCommandWithPersistence_v0:", a3), 0, 1, 0, 0);
}

+ (id)fetchUserStatsTaskWithPersistence_v1:(BOOL)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand fetchUserStatsCommandWithPersistence_v1:](CLDurianCommand, "fetchUserStatsCommandWithPersistence_v1:", a3), 0, 1, 0, 0);
}

+ (id)fetchUserStatsTaskWithPersistence_v2:(BOOL)a3
{
  return -[CLDurianGetUserstatsTask initWithPersistence:]([CLDurianGetUserstatsTask alloc], "initWithPersistence:", a3);
}

+ (id)unpairTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand unpairCommand](CLDurianCommand, "unpairCommand"), 0, 0, 0, 0);
}

+ (id)setUnauthorizedPlaySoundRateLimitTask:(BOOL)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand setUnauthorizedPlaySoundRateLimitCommand:](CLDurianCommand, "setUnauthorizedPlaySoundRateLimitCommand:", a3), 0, 0, 0, 0);
}

+ (id)setCentralReferenceTimeTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand setCentralReferenceTimeCommand](CLDurianCommand, "setCentralReferenceTimeCommand"), 0, 0, 0, 0);
}

+ (id)setWildModeConfigurationTaskWithConfiguration:(id)a3
{
  return -[CLDurianSetWildConfigurationTask initWithConfiguration:]([CLDurianSetWildConfigurationTask alloc], "initWithConfiguration:", a3);
}

+ (id)rollWildKeyTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand rollWildKeyCommand](CLDurianCommand, "rollWildKeyCommand"), -6, 1, 0, 0);
}

+ (id)setAbsoluteWildModeConfigurationTaskWithConfiguration:(id)a3
{
  return -[CLDurianSetAbsoluteWildConfigurationTask initWithConfiguration:]([CLDurianSetAbsoluteWildConfigurationTask alloc], "initWithConfiguration:", a3);
}

+ (id)setTagTypeTaskWithType:(unsigned __int8)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand setTagTypeCommandWithType:](CLDurianCommand, "setTagTypeCommandWithType:", a3), 0, 0, 0, 0);
}

+ (id)startSoundSequenceTaskWithEncodedSequence:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand startSoundSequenceCommandWithSequence:](CLDurianCommand, "startSoundSequenceCommandWithSequence:", a3), 0, 1, 0, 1);
}

+ (id)stopSoundTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand stopSoundCommand](CLDurianCommand, "stopSoundCommand"), 0, 0, 0, 0);
}

+ (id)startUnauthorizedShortSoundTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  char v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  NSData *v14;
  __int16 v15;
  unsigned int v16;

  v7 = 3329;
  v8 = 8;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 3);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand startUnauthorizedShortSoundCommand](CLDurianCommand, "startUnauthorizedShortSoundCommand"), +[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID"), +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID"), v2);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2114;
    v14 = v2;
    v15 = 1026;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut startUnauthorizedShortSoundTask\", \"payload\":%{public, location:escape_only}@, \"param\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)startUnauthorizedSoundTask
{
  char v3;

  v3 = 1;
  return -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand startUnauthorizedSoundCommand](CLDurianCommand, "startUnauthorizedSoundCommand"), +[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID"), +[CBUUID _cl_DurianUnauthorizedSoundCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedSoundCharacteristicUUID"), +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 1));
}

+ (id)leashTask
{
  __int16 v3;

  v3 = 257;
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 10, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2)), 0, 0, 0, 0);
}

+ (id)leashDisableTask
{
  __int16 v3;

  v3 = 1;
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 10, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2)), 0, 0, 0, 0);
}

+ (id)setMaxConnectionsTaskWithCount:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  unsigned __int8 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v3 = a3;
  v7 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian setMaxConnectionsTaskWithCount\", \"count\":%{public}d}", buf, 0x18u);
  }
  if (!v3)
    v7 = 1;
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 11, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 1)), 0, 1, 0, 0);
}

+ (id)fetchMultiStatusTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 12, 0), 0, 1, 0, 0);
}

+ (id)fwdlAbortTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 32, 0), 0, 0, 0, 0);
}

+ (id)setObfuscatedIdentifierTaskWithIdentifier:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 13, objc_msgSend(a3, "dataUsingEncoding:", 1)), 0, 0, 0, 0);
}

+ (id)setMutexAction:(unsigned __int8)a3
{
  NSData *v4;
  NSObject *v5;
  unsigned __int8 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  NSData *v15;

  v7 = a3;
  v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v7;
    v14 = 2113;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex task\", \"action\":%{public}d, \"payload\":%{private, location:escape_only}@}", buf, 0x22u);
  }
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 14, v4), 0, 1, 0, 0);
}

+ (id)setMutexAction:(unsigned __int8)a3 withLatency:(int64_t)a4
{
  NSData *v6;
  NSObject *v7;
  unsigned __int8 v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  NSData *v17;

  v9 = a3;
  v6 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v9, 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 1026;
    v15 = v9;
    v16 = 2113;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex task\", \"action\":%{public}d, \"payload\":%{private, location:escape_only}@}", buf, 0x22u);
  }
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 14, v6), a4, 1, 0, 0);
}

+ (id)setNearOwnerTimeoutTaskWithTimeout:(unsigned __int16)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand setNearOwnerTimeoutCommandWithTimeout:](CLDurianCommand, "setNearOwnerTimeoutCommandWithTimeout:", a3), 0, 0, 0, 0);
}

+ (id)checkCrashesTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand checkCrashesCommand](CLDurianCommand, "checkCrashesCommand"), 0, 1, 0, 0);
}

+ (id)induceCrashTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand induceCrashCommand](CLDurianCommand, "induceCrashCommand"), 0, 0, 0, 0);
}

+ (id)setBatteryStatusTaskWithBatteryStatus:(unint64_t)a3
{
  _BYTE v4[2];

  v4[0] = 1;
  v4[1] = a3;
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 187, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 2)), 0, 0, 0, 0);
}

+ (id)setKeyRotationTimeoutTaskWithTimeout:(unsigned int)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand setKeyRotationTimeoutCommandWithTimeout:](CLDurianCommand, "setKeyRotationTimeoutCommandWithTimeout:", *(_QWORD *)&a3), 0, 0, 0, 0);
}

+ (id)dumpNordicLogsTask
{
  return -[CLDurianGATTRepeatedReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTRepeatedReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand dumpNordicLogsCommand](CLDurianCommand, "dumpNordicLogsCommand"), +[CBUUID _cl_DurianDebugServiceUUID](CBUUID, "_cl_DurianDebugServiceUUID"), +[CBUUID _cl_DurianLoggingCharacteristicUUID](CBUUID, "_cl_DurianLoggingCharacteristicUUID"));
}

+ (id)dumpNordicCrashesTask
{
  return -[CLDurianGATTRepeatedReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTRepeatedReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand dumpNordicCrashesCommand](CLDurianCommand, "dumpNordicCrashesCommand"), +[CBUUID _cl_DurianDebugServiceUUID](CBUUID, "_cl_DurianDebugServiceUUID"), +[CBUUID _cl_DurianLoggingCharacteristicUUID](CBUUID, "_cl_DurianLoggingCharacteristicUUID"));
}

+ (id)dumpRoseLogsTask
{
  return -[CLDurianGATTRepeatedReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTRepeatedReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand dumpRoseLogsCommand](CLDurianCommand, "dumpRoseLogsCommand"), +[CBUUID _cl_DurianDebugServiceUUID](CBUUID, "_cl_DurianDebugServiceUUID"), +[CBUUID _cl_DurianLoggingCharacteristicUUID](CBUUID, "_cl_DurianLoggingCharacteristicUUID"));
}

+ (id)dumpRoseCrashesTask
{
  return -[CLDurianGATTRepeatedReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTRepeatedReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand dumpRoseCrashesCommand](CLDurianCommand, "dumpRoseCrashesCommand"), +[CBUUID _cl_DurianDebugServiceUUID](CBUUID, "_cl_DurianDebugServiceUUID"), +[CBUUID _cl_DurianLoggingCharacteristicUUID](CBUUID, "_cl_DurianLoggingCharacteristicUUID"));
}

+ (id)initRoseTaskWithParameters:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand initRoseCommandWithParameters:](CLDurianCommand, "initRoseCommandWithParameters:", a3), 0, 1, 0, 1);
}

+ (id)stopRoseTaskWithParameters:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand stopRoseCommandWithParameters:](CLDurianCommand, "stopRoseCommandWithParameters:", a3), 0, 1, 0, 0);
}

+ (id)setRoseRangingParametersTaskWithParameters:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand setRoseRangingParametersCommandWithParameters:](CLDurianCommand, "setRoseRangingParametersCommandWithParameters:", a3), 0, 1, 0, 0);
}

+ (id)startRoseRangingTaskWithParameters:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand startRoseRangingCommandWithParameters:](CLDurianCommand, "startRoseRangingCommandWithParameters:", a3), 0, 1, 0, 0);
}

+ (id)stopRoseRangingTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand stopRoseRangingCommand](CLDurianCommand, "stopRoseRangingCommand"), 0, 0, 0, 0);
}

+ (id)setAccelerometerSlopeModeConfigurationTaskWithConfiguration:(id)a3
{
  float v5;
  float v6;
  _BYTE v8[4];

  v8[0] = objc_msgSend(a3, "sampleCount");
  objc_msgSend(a3, "threshold");
  v8[1] = sub_1014D8E90(v5);
  objc_msgSend(a3, "threshold");
  v8[2] = sub_1014D9078(v6);
  v8[3] = objc_msgSend(a3, "sampleRate");
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand setAccelerometerSlopeModeConfigurationCommandWithConfiguration:](CLDurianCommand, "setAccelerometerSlopeModeConfigurationCommandWithConfiguration:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v8, 4)), 0, 0, 0, 0);
}

+ (id)setAccelerometerOrientationModeConfigurationTaskWithConfiguration:(id)a3
{
  unsigned int v6;
  unsigned __int16 v7;

  v6 = objc_msgSend(a3, "threshold");
  v7 = (unsigned __int16)objc_msgSend(a3, "sleepDuration_ms");
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand setAccelerometerOrientationModeConfigurationCommandWithConfiguration:](CLDurianCommand, "setAccelerometerOrientationModeConfigurationCommandWithConfiguration:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 6)), 0, 0, 0, 0);
}

+ (id)fetchAccelerometerSlopeModeConfigurationTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand fetchAccelerometerSlopeModeConfigurationCommand](CLDurianCommand, "fetchAccelerometerSlopeModeConfigurationCommand"), 0, 1, 0, 0);
}

+ (id)fetchAccelerometerOrientationModeConfigurationTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand fetchAccelerometerOrientationModeConfigurationCommand](CLDurianCommand, "fetchAccelerometerOrientationModeConfigurationCommand"), 0, 1, 0, 0);
}

+ (id)fetchAccelerometerModeTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand fetchAccelerometerModeCommand](CLDurianCommand, "fetchAccelerometerModeCommand"), 0, 1, 0, 0);
}

+ (id)placeholderHawkeyeTask
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 208, 0), 0, 0, 0, 0);
}

+ (id)startSoundHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;

  v2 = +[CLDurianTask startSoundSequenceTaskWithEncodedSequence:](CLHawkeyeTask, "startSoundSequenceTaskWithEncodedSequence:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", 0, 0));
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 512);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289538;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 1026;
      v16 = 10;
      v17 = 2114;
      v18 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye soundStart\", \"duration\":%{public}d, \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, soundStart\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)startShortSoundHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask startSoundSequenceTaskWithEncodedSequence:](CLHawkeyeTask, "startSoundSequenceTaskWithEncodedSequence:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", 0, 0));
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 531);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye shortSoundStart\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, soundStart\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)stopSoundHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;

  v2 = +[CLDurianTask stopSoundTask](CLHawkeyeTask, "stopSoundTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setHawkeyeOpcode:", 513);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289538;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 1026;
      v16 = 10;
      v17 = 2114;
      v18 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye soundStart\", \"duration\":%{public}d, \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, soundStop\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)enablePersistentConnectionsHawkeyeTask:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  _BYTE v12[4];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  id v20;

  v3 = a3;
  v4 = +[CLDurianTask leashTask](CLHawkeyeTask, "leashTask");
  if (v4)
  {
    objc_msgSend(v4, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v4, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v4, "setHawkeyeOpcode:", 514);
    v12[0] = 1;
    v12[1] = objc_msgSend(v4, "hawkeyeOpcode");
    v12[2] = (unsigned __int16)objc_msgSend(v4, "hawkeyeOpcode") >> 8;
    v12[3] = v3;
    objc_msgSend(v4, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, 4));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v4, "hawkeyePayload");
      *(_DWORD *)buf = 68289538;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 1026;
      v18 = v3;
      v19 = 2114;
      v20 = v6;
      v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye configureLeash\", \"enable\":%{public}d, \"payload\":%{public, locati"
           "on:escape_only}@}";
      v8 = v5;
      v9 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, configureLeash\"}";
      v8 = v10;
      v9 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)setNearbyTimeoutHawkeyeTaskWithTimeout:(unsigned __int16)a3 asHele:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  id v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  _BYTE v17[3];
  __int16 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;

  v4 = a4;
  v5 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 1026;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian setNearbyTimeoutHawkeyeTaskWithTimeout \", \"hele\":%{public}hhd}", buf, 0x18u);
  }
  v7 = +[CLDurianTask setNearOwnerTimeoutTaskWithTimeout:](CLHawkeyeTask, "setNearOwnerTimeoutTaskWithTimeout:", v5);
  if (v7)
  {
    if (v4)
      v8 = v5;
    else
      v8 = 3600;
    if (v5 <= 0xE0F)
      v8 = v5;
    if (v4 && v8 >> 3 > 0x464)
      v9 = 9000;
    else
      v9 = v8;
    objc_msgSend(v7, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v7, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v7, "setHawkeyeOpcode:", 515);
    v17[0] = 1;
    v17[1] = objc_msgSend(v7, "hawkeyeOpcode");
    v17[2] = (unsigned __int16)objc_msgSend(v7, "hawkeyeOpcode") >> 8;
    v18 = v9;
    objc_msgSend(v7, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 5));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v7, "hawkeyePayload");
      *(_DWORD *)buf = 68289538;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 1026;
      v24 = v9;
      v25 = 2114;
      v26 = v11;
      v12 = "{\"msg%{public}.0s\":\"#durian #hawkeye setNearbyTimeout\", \"timeout\":%{public}d, \"payload\":%{public, lo"
            "cation:escape_only}@}";
      v13 = v10;
      v14 = 34;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v15 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v12 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, setNearbyTimeout\"}";
      v13 = v15;
      v14 = 18;
      goto LABEL_22;
    }
  }
  return v7;
}

+ (id)unpairHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask unpairTask](CLHawkeyeTask, "unpairTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setHawkeyeOpcode:", 516);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    objc_msgSend(v2, "setExpectsResponse:", 0);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye unpair\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, unpair\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)initRoseNonOwnerTaskWithParameters:(id)a3
{
  CLDurianGATTWriteTask *v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  unsigned int v13;

  v4 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand initRoseNonOwnerCommandWithParameters:](CLDurianCommand, "initRoseNonOwnerCommandWithParameters:", a3), +[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID"), +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID"), a3);
  -[CLDurianTask setRequiresMutex:](v4, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v4, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289538;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2114;
    v11 = a3;
    v12 = 1026;
    v13 = -[CLDurianTask expectsResponse](v4, "expectsResponse");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut initRanging\", \"payload\":%{public, location:escape_only}@, \"task.expectsResponse\":%{public}hhd}", (uint8_t *)v7, 0x22u);
  }
  return v4;
}

+ (id)configureRangingNonOwnerTaskWithPayload:(char *)a3
{
  NSData *v3;
  CLDurianGATTWriteTask *v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  NSData *v11;
  __int16 v12;
  char v13;
  uint64_t v14;
  int v15;

  v12 = 513;
  v13 = 8;
  v14 = *(_QWORD *)a3;
  v15 = *((_DWORD *)a3 + 2);
  v3 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v12, 15);
  v4 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand setRoseRangingParametersNonOwnerCommandWithParameters:](CLDurianCommand, "setRoseRangingParametersNonOwnerCommandWithParameters:", v3), +[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID"), +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID"), v3);
  -[CLDurianTask setRequiresMutex:](v4, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v4, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2114;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut configureRangingNonOwnerTaskWithPayload\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  return v4;
}

+ (id)startRangingNonOwnerTaskWithTargetEventCounter:(unsigned __int16)a3
{
  NSData *v3;
  CLDurianGATTWriteTask *v4;
  NSObject *v5;
  unsigned int v6;
  __int16 v8;
  char v9;
  unsigned __int16 v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSData *v16;
  __int16 v17;
  unsigned int v18;

  v8 = 769;
  v9 = 8;
  v10 = a3;
  v3 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 5);
  v4 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand startRoseRangingNonOwnerCommandWithParameters:](CLDurianCommand, "startRoseRangingNonOwnerCommandWithParameters:", v3), +[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID"), +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID"), v3);
  -[CLDurianTask setRequiresMutex:](v4, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v4, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CLDurianCommand opcode](-[CLDurianTask command](v4, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2114;
    v16 = v3;
    v17 = 1026;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut startRangingNonOwnerTaskWithTargetEventCounter\", \"payload\":%{public, location:escape_only}@, \"param\":%{public}d}", buf, 0x22u);
  }
  return v4;
}

+ (id)stopRangingNonOwnerTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  __int16 v6;
  char v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;

  v6 = 1025;
  v7 = 8;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand stopRoseRangingNonOwnerCommandWithParameters:](CLDurianCommand, "stopRoseRangingNonOwnerCommandWithParameters:", v2), +[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID"), +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut stopRangingNonOwnerTask\", \"payload\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return v3;
}

+ (id)deinitRangingNonOwnerTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  __int16 v6;
  char v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;

  v6 = 1281;
  v7 = 8;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand stopRoseNonOwnerCommandWithParameters:](CLDurianCommand, "stopRoseNonOwnerCommandWithParameters:", v2), +[CBUUID _cl_DurianUnauthorizedConnectionServiceUUID](CBUUID, "_cl_DurianUnauthorizedConnectionServiceUUID"), +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut deinitRangingNonOwnerTask\", \"payload\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return v3;
}

+ (id)configureSeparatedStateHawkeyeTaskWithConfiguration:(id)a3 currentIndex:(unsigned int)a4
{
  CLHawkeyeConfigureSeparatedStateTask *v5;
  double v6;
  double v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  int v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  _BYTE v24[3];
  unsigned int v25;
  unsigned int v26;

  v5 = -[CLHawkeyeConfigureSeparatedStateTask initWithConfiguration:currentIndex:]([CLHawkeyeConfigureSeparatedStateTask alloc], "initWithConfiguration:currentIndex:", a3, *(_QWORD *)&a4);
  if (v5)
  {
    objc_msgSend(objc_msgSend(a3, "desiredKeyRollDate"), "timeIntervalSinceDate:", +[NSDate date](NSDate, "date"));
    v7 = v6;
    v8 = (v6 * 1000.0);
    v9 = objc_msgSend(a3, "nextWildIndex");
    -[CLHawkeyeTask setServiceUUID:](v5, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    -[CLHawkeyeTask setCharacteristicUUID:](v5, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    -[CLHawkeyeTask setHawkeyeOpcode:](v5, "setHawkeyeOpcode:", 517);
    v24[0] = 1;
    v24[1] = -[CLHawkeyeTask hawkeyeOpcode](v5, "hawkeyeOpcode");
    v24[2] = -[CLHawkeyeTask hawkeyeOpcode](v5, "hawkeyeOpcode") >> 8;
    v25 = v8;
    v26 = v9;
    -[CLHawkeyeTask setHawkeyePayload:](v5, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v24, 11));
    -[CLDurianTask setExpectsResponse:](v5, "setExpectsResponse:", 0);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 68289538;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 1026;
      v21 = (int)v7;
      v22 = 1026;
      v23 = v9;
      v11 = "{\"msg%{public}.0s\":\"#durian #hawkeye configureSeparatedState\", \"sec\":%{public}d, \"nextWild\":%{public}d}";
      v12 = v10;
      v13 = 30;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v14 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v11 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, configureSeparatedState\"}";
      v12 = v14;
      v13 = 18;
      goto LABEL_10;
    }
  }
  return v5;
}

+ (id)latchSeparatedKeyHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask rollWildKeyTask](CLHawkeyeTask, "rollWildKeyTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setHawkeyeOpcode:", 518);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye latchSeperatedKey\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, latchSeperatedKey\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)setMaxConnectionsHawkeyeTaskWithCount:(unsigned __int8)a3
{
  unsigned int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  id v14;

  v3 = a3;
  v4 = +[CLDurianTask setMaxConnectionsTaskWithCount:](CLHawkeyeTask, "setMaxConnectionsTaskWithCount:");
  if (v4)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289538;
      v9 = 2082;
      v10 = "";
      v11 = 1026;
      v12 = v3;
      v13 = 2114;
      v14 = objc_msgSend(v4, "hawkeyePayload");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye setMaxConnections\", \"count\":%{public}d, \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v8, 0x22u);
    }
    if (v3 <= 1)
      LOBYTE(v3) = 1;
    objc_msgSend(v4, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v4, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v4, "setHawkeyeOpcode:", 519);
    LOBYTE(v8) = 1;
    BYTE1(v8) = objc_msgSend(v4, "hawkeyeOpcode", v8);
    BYTE2(v8) = (unsigned __int16)objc_msgSend(v4, "hawkeyeOpcode") >> 8;
    BYTE3(v8) = v3;
    objc_msgSend(v4, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 4));
    objc_msgSend(v4, "setExpectsResponse:", 0);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289026;
      v9 = 2082;
      v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, setMaxConnections\"}", (uint8_t *)&v8, 0x12u);
    }
  }
  return v4;
}

+ (id)setUtcHawkeyeTask
{
  id v2;
  double v3;
  unint64_t v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  _BYTE v17[3];
  unint64_t v18;

  v2 = +[CLDurianTask setCentralReferenceTimeTask](CLHawkeyeTask, "setCentralReferenceTimeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setHawkeyeOpcode:", 520);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v4 = (unint64_t)(v3 * 1000.0);
    v17[0] = 1;
    v17[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v17[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    v18 = v4;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 11));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = objc_msgSend(v2, "hawkeyePayload");
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye setUtc\", \"payload\":%{public, location:escape_only}@}";
      v7 = v5;
      v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, setUtc\"}";
      v7 = v9;
      v8 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)getMultiStatusHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask fetchMultiStatusTask](CLHawkeyeTask, "fetchMultiStatusTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setHawkeyeOpcode:", 521);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye getMulti\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, getMulti\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)initRangingHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask initRoseTaskWithParameters:](CLHawkeyeTask, "initRoseTaskWithParameters:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", 0, 0));
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID"));
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 1793);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye initRanging\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)configureRangingHawkeyeTaskWithPayload:(char *)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  _BYTE v17[3];
  uint64_t v18;
  int v19;

  v4 = +[CLDurianTask setRoseRangingParametersTaskWithParameters:](CLHawkeyeTask, "setRoseRangingParametersTaskWithParameters:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", 0, 0));
  if (v4)
  {
    objc_msgSend(v4, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v4, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID"));
    objc_msgSend(v4, "setRequiresMutex:", 0);
    objc_msgSend(v4, "setHawkeyeOpcode:", 1794);
    v17[0] = 1;
    v17[1] = objc_msgSend(v4, "hawkeyeOpcode");
    v17[2] = (unsigned __int16)objc_msgSend(v4, "hawkeyeOpcode") >> 8;
    v18 = *(_QWORD *)a3;
    v19 = *((_DWORD *)a3 + 2);
    objc_msgSend(v4, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17, 15));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = objc_msgSend(v4, "hawkeyePayload");
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye configureRanging\", \"payload\":%{public, location:escape_only}@}";
      v7 = v5;
      v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      v7 = v9;
      v8 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)startRangingHawkeyeTaskWithTargetEventCounter:(unsigned __int16)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  _BYTE v12[3];
  unsigned __int16 v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  v4 = +[CLDurianTask startRoseRangingTaskWithParameters:](CLHawkeyeTask, "startRoseRangingTaskWithParameters:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", 0, 0));
  if (v4)
  {
    objc_msgSend(v4, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v4, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID"));
    objc_msgSend(v4, "setRequiresMutex:", 0);
    objc_msgSend(v4, "setHawkeyeOpcode:", 1795);
    v12[0] = 1;
    v12[1] = objc_msgSend(v4, "hawkeyeOpcode");
    v12[2] = (unsigned __int16)objc_msgSend(v4, "hawkeyeOpcode") >> 8;
    v13 = a3;
    objc_msgSend(v4, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, 5));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v4, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2114;
      v19 = v6;
      v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye startRanging\", \"payload\":%{public, location:escape_only}@}";
      v8 = v5;
      v9 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      v8 = v10;
      v9 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)stopRangingHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask stopRoseRangingTask](CLHawkeyeTask, "stopRoseRangingTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID"));
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 1796);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye stopRanging\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)deinitRangingHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask stopRoseTaskWithParameters:](CLHawkeyeTask, "stopRoseTaskWithParameters:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", 0, 0));
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID"));
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 1797);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye deinitRanging\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, initRanging\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)testModeTask:(unsigned __int8)a3
{
  int v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  id v12;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  id v22;

  v3 = a3;
  switch(a3)
  {
    case 1u:
      v5 = +[CLDurianTask fetchMultiStatusTask](CLHawkeyeTask, "fetchMultiStatusTask");
      if (!v5)
        goto LABEL_11;
      v6 = v5;
      objc_msgSend(v5, "setHawkeyeOpcode:", 521);
      LOBYTE(v14) = 1;
      BYTE1(v14) = objc_msgSend(v6, "hawkeyeOpcode", v14);
      WORD1(v14) = ((unsigned __int16)objc_msgSend(v6, "hawkeyeOpcode") >> 8);
      v7 = 4;
      goto LABEL_19;
    case 2u:
      v4 = +[CLDurianTask setNearOwnerTimeoutTaskWithTimeout:](CLHawkeyeTask, "setNearOwnerTimeoutTaskWithTimeout:", 3700);
      goto LABEL_6;
    case 3u:
    case 4u:
      v4 = +[CLDurianTask stopSoundHawkeyeTask](CLHawkeyeTask, "stopSoundHawkeyeTask");
LABEL_6:
      v6 = v4;
      if (!v4)
        goto LABEL_11;
      if (v3 == 4)
      {
        v9 = 513;
LABEL_18:
        objc_msgSend(v4, "setHawkeyeOpcode:", v9);
        LOBYTE(v14) = 1;
        BYTE1(v14) = objc_msgSend(v6, "hawkeyeOpcode", v14);
        BYTE2(v14) = (unsigned __int16)objc_msgSend(v6, "hawkeyeOpcode") >> 8;
        v7 = 3;
        goto LABEL_19;
      }
      if (v3 == 3)
      {
        v9 = 767;
        goto LABEL_18;
      }
      if (v3 != 2)
        goto LABEL_20;
      objc_msgSend(v4, "setHawkeyeOpcode:", 515);
      LOBYTE(v14) = 1;
      BYTE1(v14) = objc_msgSend(v6, "hawkeyeOpcode", v14);
      BYTE2(v14) = (unsigned __int16)objc_msgSend(v6, "hawkeyeOpcode") >> 8;
      *(_WORD *)((char *)&v14 + 3) = 116;
      v7 = 5;
LABEL_19:
      objc_msgSend(v6, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v14, v7));
LABEL_20:
      objc_msgSend(v6, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
      objc_msgSend(v6, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
      v10 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(v6, "hawkeyeOpcode");
        v12 = objc_msgSend(v6, "hawkeyePayload");
        v14 = 68289794;
        v15 = 2082;
        v16 = "";
        v17 = 1026;
        v18 = v3;
        v19 = 1026;
        v20 = v11;
        v21 = 2114;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye testModeTask\", \"mode\":%{public}d, \"opcode\":%{public}d, \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v14, 0x28u);
      }
      return v6;
    default:
LABEL_11:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
      v8 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 68289026;
        v15 = 2082;
        v16 = "";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, testModeTask\"}", (uint8_t *)&v14, 0x12u);
      }
      return 0;
  }
}

+ (id)startAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  _BYTE v12[3];
  unsigned int v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  v4 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v4)
  {
    objc_msgSend(v4, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v4, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v4, "setRequiresMutex:", 0);
    objc_msgSend(v4, "setExpectsResponse:", 1);
    objc_msgSend(v4, "setHawkeyeOpcode:", 527);
    v12[0] = 1;
    v12[1] = objc_msgSend(v4, "hawkeyeOpcode");
    v12[2] = (unsigned __int16)objc_msgSend(v4, "hawkeyeOpcode") >> 8;
    v13 = a3;
    objc_msgSend(v4, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, 7));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v4, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2114;
      v19 = v6;
      v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye start agggresive adv\", \"payload\":%{public, location:escape_only}@}";
      v8 = v5;
      v9 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, start agggresive adv\"}";
      v8 = v10;
      v9 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)stopAggressiveAdvertisingTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setHawkeyeOpcode:", 528);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye stop agggresive adv\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, stop agggresive adv\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)fetchTxPowerTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 529);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye tx power\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchHeleAccessoryCapabilitiesTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 537);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye hele capabilities\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchHeleFirmwareVersionTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 538);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye hele fwversion\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchHeleBatteryLevelTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 541);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye hele fwversion\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)getCurrentPrimaryKeyTask
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  _BYTE v11[3];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v3, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v3, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID"));
    objc_msgSend(v3, "setHawkeyeOpcode:", 1024);
    v11[0] = 1;
    v11[1] = objc_msgSend(v3, "hawkeyeOpcode");
    v11[2] = (unsigned __int16)objc_msgSend(v3, "hawkeyeOpcode") >> 8;
    objc_msgSend(v3, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(v3, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = v5;
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye getCurrentPrimaryKey\", \"payload\":%{public, location:escape_only}@}";
      v7 = v4;
      v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, getCurrentPrimaryKey\"}";
      v7 = v9;
      v8 = 18;
      goto LABEL_10;
    }
  }
  return v3;
}

+ (id)getiCloudIdentifierTask
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  _BYTE v11[3];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v3, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v3, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID"));
    objc_msgSend(v3, "setHawkeyeOpcode:", 1025);
    v11[0] = 1;
    v11[1] = objc_msgSend(v3, "hawkeyeOpcode");
    v11[2] = (unsigned __int16)objc_msgSend(v3, "hawkeyeOpcode") >> 8;
    objc_msgSend(v3, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(v3, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = v5;
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye getiCloudIdentifier\", \"payload\":%{public, location:escape_only}@}";
      v7 = v4;
      v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, getiCloudIdentifier\"}";
      v7 = v9;
      v8 = 18;
      goto LABEL_10;
    }
  }
  return v3;
}

+ (id)getSerialNumberTask
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  _BYTE v11[3];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v3, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v3, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID"));
    objc_msgSend(v3, "setHawkeyeOpcode:", 1028);
    v11[0] = 1;
    v11[1] = objc_msgSend(v3, "hawkeyeOpcode");
    v11[2] = (unsigned __int16)objc_msgSend(v3, "hawkeyeOpcode") >> 8;
    objc_msgSend(v3, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v11, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(v3, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2114;
      v17 = v5;
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye getSerialNumber\", \"payload\":%{public, location:escape_only}@}";
      v7 = v4;
      v8 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v6 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, getSerialNumber\"}";
      v7 = v9;
      v8 = 18;
      goto LABEL_10;
    }
  }
  return v3;
}

+ (id)setKeyRotationTimeoutHawkeyeTaskWithTimeout:(unsigned int)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  _BYTE v12[3];
  unsigned int v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  id v21;

  v4 = +[CLDurianTask setKeyRotationTimeoutTaskWithTimeout:](CLHawkeyeTask, "setKeyRotationTimeoutTaskWithTimeout:");
  if (v4)
  {
    objc_msgSend(v4, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v4, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID"));
    objc_msgSend(v4, "setHawkeyeOpcode:", 1280);
    v12[0] = 1;
    v12[1] = objc_msgSend(v4, "hawkeyeOpcode");
    v12[2] = (unsigned __int16)objc_msgSend(v4, "hawkeyeOpcode") >> 8;
    v13 = a3;
    objc_msgSend(v4, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, 7));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v4, "hawkeyePayload");
      *(_DWORD *)buf = 68289538;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 1026;
      v19 = a3;
      v20 = 2114;
      v21 = v6;
      v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye keyRotation\", \"timeout\":%{public}d, \"payload\":%{public, location:escape_only}@}";
      v8 = v5;
      v9 = 34;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v7 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, keyRotation\"}";
      v8 = v10;
      v9 = 18;
      goto LABEL_10;
    }
  }
  return v4;
}

+ (id)retrieveLogsHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID"));
    objc_msgSend(v2, "setHawkeyeOpcode:", 1281);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye retrieveLogs\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, retrieveLogs\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)resetHawkeyeTask
{
  id v2;
  uint64_t v3;
  id v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  _BYTE v10[3];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID"));
    objc_msgSend(v2, "setHawkeyeOpcode:", 1284);
    v10[0] = 1;
    v10[1] = objc_msgSend(v2, "hawkeyeOpcode");
    v10[2] = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v10, 3));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "hawkeyePayload");
      *(_DWORD *)buf = 68289282;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = v4;
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye reset\", \"payload\":%{public, location:escape_only}@}";
      v6 = v3;
      v7 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v5 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, reset\"}";
      v6 = v8;
      v7 = 18;
      goto LABEL_10;
    }
  }
  return v2;
}

+ (id)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  _BYTE v19[3];
  unsigned int v20;
  unsigned int v21;

  v6 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v6)
  {
    objc_msgSend(v6, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v6, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID"));
    objc_msgSend(v6, "setHawkeyeOpcode:", 1285);
    v19[0] = 1;
    v19[1] = objc_msgSend(v6, "hawkeyeOpcode");
    v19[2] = (unsigned __int16)objc_msgSend(v6, "hawkeyeOpcode") >> 8;
    v20 = a3;
    v21 = a4;
    objc_msgSend(v6, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v19, 11));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 68289282;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2114;
      v18 = objc_msgSend(v6, "hawkeyePayload");
      v8 = "{\"msg%{public}.0s\":\"#durian #hawkeye motion config\", \"payload\":%{public, location:escape_only}@}";
      v9 = v7;
      v10 = 28;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v8 = "{\"msg%{public}.0s\":\"#durian #hawkeye nil task, reset\"}";
      v9 = v11;
      v10 = 18;
      goto LABEL_10;
    }
  }
  return v6;
}

+ (id)fetchTxPowerGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchTxPower\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 221, 0), +[CBUUID _cl_BtTxPowerServiceUUID](CBUUID, "_cl_BtTxPowerServiceUUID"), +[CBUUID _cl_BtTxPowerCharacteristicUUID](CBUUID, "_cl_BtTxPowerCharacteristicUUID"));
}

+ (id)fetchProductDataGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchProductData\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 209, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID"));
}

+ (id)fetchManufacturerNameGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchManufacturerName\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 210, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID"));
}

+ (id)fetchModelNameGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchModelName\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 211, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID"));
}

+ (id)fetchModelColorCodeGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchModelColorCode\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 212, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID"));
}

+ (id)fetchAccessoryCategoryGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchAccessoryCategory\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 213, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID"));
}

+ (id)fetchAccessoryCapabilitiesGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchAccessoryCapabilities\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 214, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID"));
}

+ (id)fetchFirmwareVersionGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchFirmwareVersion\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 215, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID"));
}

+ (id)fetchFindMyVersionGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchFindMyVersion\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 216, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID"));
}

+ (id)fetchBatteryTypeGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchBatteryType\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 217, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID"));
}

+ (id)fetchBatteryLevelGATTTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye fetchBatteryLevel\"}", (uint8_t *)v4, 0x12u);
  }
  return -[CLDurianGATTReadTask initWithCommand:serviceUUID:characteristicUUID:]([CLDurianGATTReadTask alloc], "initWithCommand:serviceUUID:characteristicUUID:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 218, 0), +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID"));
}

+ (id)getGroupStatusHawkeyeTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 551);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye get multipart status\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)startNonOwnerSoundHawkeyeTask
{
  CLHawkeyeTask *v2;
  NSObject *v3;
  NSData *v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  NSData *v10;

  v2 = -[CLDurianTask initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:]([CLHawkeyeTask alloc], "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand startUnauthorizedSoundCommand](CLDurianCommand, "startUnauthorizedSoundCommand"), 0, 1, 1, 1);
  if (v2)
  {
    -[CLHawkeyeTask setServiceUUID:](v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    -[CLHawkeyeTask setCharacteristicUUID:](v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    -[CLDurianTask setRequiresMutex:](v2, "setRequiresMutex:", 0);
    -[CLHawkeyeTask setHawkeyeOpcode:](v2, "setHawkeyeOpcode:", 768);
    LOBYTE(v6) = 1;
    BYTE1(v6) = -[CLHawkeyeTask hawkeyeOpcode](v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = -[CLHawkeyeTask hawkeyeOpcode](v2, "hawkeyeOpcode") >> 8;
    -[CLHawkeyeTask setHawkeyePayload:](v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CLHawkeyeTask hawkeyePayload](v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner soundStart\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)stopNonOwnerSoundHawkeyeTask
{
  CLHawkeyeTask *v2;
  NSObject *v3;
  NSData *v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  NSData *v10;

  v2 = -[CLDurianTask initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:]([CLHawkeyeTask alloc], "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand stopUnauthorizedSoundCommand](CLDurianCommand, "stopUnauthorizedSoundCommand"), 0, 1, 0, 0);
  if (v2)
  {
    -[CLHawkeyeTask setServiceUUID:](v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    -[CLHawkeyeTask setCharacteristicUUID:](v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    -[CLDurianTask setExpectsResponse:](v2, "setExpectsResponse:", 1);
    -[CLHawkeyeTask setHawkeyeOpcode:](v2, "setHawkeyeOpcode:", 769);
    LOBYTE(v6) = 1;
    BYTE1(v6) = -[CLHawkeyeTask hawkeyeOpcode](v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = -[CLHawkeyeTask hawkeyeOpcode](v2, "hawkeyeOpcode") >> 8;
    -[CLHawkeyeTask setHawkeyePayload:](v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CLHawkeyeTask hawkeyePayload](v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner soundStop\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)startNonOwnerShortSoundHawkeyeTask
{
  CLHawkeyeTask *v2;
  NSObject *v3;
  NSData *v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  NSData *v10;

  v2 = -[CLDurianTask initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:]([CLHawkeyeTask alloc], "initWithCommand:desiredLatency:expectsResponse:completeOnPreemption:requiresMutex:", +[CLDurianCommand startUnauthorizedSoundCommand](CLDurianCommand, "startUnauthorizedSoundCommand"), 0, 1, 0, 0);
  if (v2)
  {
    -[CLHawkeyeTask setServiceUUID:](v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    -[CLHawkeyeTask setCharacteristicUUID:](v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    -[CLDurianTask setExpectsResponse:](v2, "setExpectsResponse:", 1);
    -[CLHawkeyeTask setHawkeyeOpcode:](v2, "setHawkeyeOpcode:", 794);
    LOBYTE(v6) = 1;
    BYTE1(v6) = -[CLHawkeyeTask hawkeyeOpcode](v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = -[CLHawkeyeTask hawkeyeOpcode](v2, "hawkeyeOpcode") >> 8;
    -[CLHawkeyeTask setHawkeyePayload:](v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CLHawkeyeTask hawkeyePayload](v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner shortSoundStart\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerTxPowerTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 773);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye nonowner tx power\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)startNonOwnerAggressiveAdvertisingTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 772);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner start agggresive adv\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerProductDataTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 774);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner product data\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerManufacturerNameTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 775);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner manufacturer name\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerModelNameTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 776);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner model name\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerAccessoryCategoryTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 777);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner accessory category\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerAccessoryCapabilitiesTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 778);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner accessory capabilities\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerFirmwareVersionTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 779);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner firmware version\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerFindMyVersionTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 780);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner findmy version\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerBatteryTypeTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 781);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner battery type\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)fetchNonOwnerBatteryLevelTask
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  v2 = +[CLDurianTask placeholderHawkeyeTask](CLHawkeyeTask, "placeholderHawkeyeTask");
  if (v2)
  {
    objc_msgSend(v2, "setServiceUUID:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID"));
    objc_msgSend(v2, "setCharacteristicUUID:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID"));
    objc_msgSend(v2, "setExpectsResponse:", 1);
    objc_msgSend(v2, "setRequiresMutex:", 0);
    objc_msgSend(v2, "setHawkeyeOpcode:", 782);
    LOBYTE(v6) = 1;
    BYTE1(v6) = objc_msgSend(v2, "hawkeyeOpcode", v6);
    BYTE2(v6) = (unsigned __int16)objc_msgSend(v2, "hawkeyeOpcode") >> 8;
    objc_msgSend(v2, "setHawkeyePayload:", +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 3));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v2, "hawkeyePayload");
    v6 = 68289282;
    v7 = 2082;
    v8 = "";
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye non-owner battery level\", \"payload\":%{public, location:escape_only}@}", (uint8_t *)&v6, 0x1Cu);
  }
  return v2;
}

+ (id)sendUARPMessageTaskWithPayload:(id)a3
{
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye UARP message task\"}", (uint8_t *)v6, 0x12u);
  }
  return -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 219, 0), +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateServiceUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateServiceUUID"), +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID"), a3);
}

+ (id)startNonOwnerSoundPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 768;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 768, v2), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut playSound task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)stopNonOwnerSoundPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 769;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 769, v2), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut stopSound task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerSerialNumberPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 1028;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 1028, v2), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getSerialNumber task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerProductDataPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 3;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 3, 0), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProductData task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerManufacturerNamePoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 4;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 4, v2), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getManufacturerName task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerModelNamePoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 5;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 5, v2), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getModelName task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerAccessoryCategoryPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 6;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 6, 0), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getAccessoryCategory task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerProtocolImplementationPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  __int16 v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  NSData *v12;
  __int16 v13;
  int v14;

  v6 = 7;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v6, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 7, v2), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2114;
    v12 = v2;
    v13 = 1026;
    v14 = 7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProtocolImplementation task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerAccessoryCapabilitiesPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 8;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 8, v2), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getAccessoryCapabilities task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerNetworkIdPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 9;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 9, 0), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getNetworkId task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerFirmwareVersionPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 10;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 10, 0), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getFirmwareVersion task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerBatteryTypePoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 11;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 11, 0), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getBatteryType task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)fetchNonOwnerBatteryLevelPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 12;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 12, 0), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getBatteryLevel task \", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)startNonOwnerPoshAggressiveAdvertisingTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 772;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 772, 0), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  -[CLDurianTask setRequiresMutex:](v3, "setRequiresMutex:", 0);
  -[CLDurianTask setExpectsResponse:](v3, "setExpectsResponse:", 0);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #start non aggressive advertising task for BT finding\", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

+ (id)startNonOwnerShortSoundPoshTask
{
  NSData *v2;
  CLDurianGATTWriteTask *v3;
  NSObject *v4;
  unsigned int v5;
  __int16 v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  NSData *v13;
  __int16 v14;
  unsigned int v15;

  v7 = 794;
  v2 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 2);
  v3 = -[CLDurianGATTWriteTask initWithCommand:serviceUUID:characteristicUUID:payload:]([CLDurianGATTWriteTask alloc], "initWithCommand:serviceUUID:characteristicUUID:payload:", +[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 794, 0), +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID"), +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID"), v2);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[CLDurianCommand opcode](-[CLDurianTask command](v3, "command"), "opcode");
    *(_DWORD *)buf = 68289538;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = v2;
    v14 = 1026;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #start non owner play short sound\", \"payload\":%{public, location:escape_only}@, \"opcode\":%{public}d}", buf, 0x22u);
  }
  return v3;
}

@end
