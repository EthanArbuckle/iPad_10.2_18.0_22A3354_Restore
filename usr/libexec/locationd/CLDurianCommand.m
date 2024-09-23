@implementation CLDurianCommand

- (CLDurianCommand)init
{
  -[CLDurianCommand doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianCommand)initWithData:(id)a3
{
  CLDurianCommand *result;

  result = (CLDurianCommand *)objc_msgSend(a3, "length");
  if (result)
    return -[CLDurianCommand initWithOpcode:payload:](self, "initWithOpcode:payload:", *(unsigned __int8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "subdataWithRange:", 1, (char *)objc_msgSend(a3, "length") - 1));
  return result;
}

- (CLDurianCommand)initWithOpcode:(unsigned __int16)a3 payload:(id)a4
{
  CLDurianCommand *v6;
  CLDurianCommand *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLDurianCommand;
  v6 = -[CLDurianCommand init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_opcode = a3;
    v6->_payload = (NSData *)a4;
  }
  return v7;
}

+ (id)commandWithOpcode:(unsigned __int16)a3 payload:(id)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithOpcode:payload:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianCommand;
  -[CLDurianCommand dealloc](&v3, "dealloc");
}

- (NSData)bytes
{
  NSData *result;
  id v4;

  result = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &self->_opcode, 1);
  if (self->_payload)
  {
    v4 = -[NSData mutableCopy](result, "mutableCopy");
    objc_msgSend(v4, "appendData:", self->_payload);
    return (NSData *)objc_msgSend(v4, "copy");
  }
  return result;
}

- (unsigned)opcode
{
  return self->_opcode;
}

- (NSData)payload
{
  return self->_payload;
}

+ (id)fetchCurrentKeyIndexCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 174, 0);
}

+ (id)fetchBatteryStatusCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 39, 0);
}

+ (id)fetchUserStatsCommandWithPersistence_v0:(BOOL)a3
{
  _BYTE v4[2];

  v4[0] = 1;
  v4[1] = !a3;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 24, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 2));
}

+ (id)fetchUserStatsCommandWithPersistence_v1:(BOOL)a3
{
  BOOL v4;

  v4 = !a3;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 25, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 1));
}

+ (id)unpairCommand
{
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC4F8);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #multi incoming unpair\"}", (uint8_t *)v5, 0x12u);
  }
  return objc_msgSend(a1, "commandWithOpcode:payload:", 19, 0);
}

+ (id)setUnauthorizedPlaySoundRateLimitCommand:(BOOL)a3
{
  BOOL v4;

  v4 = a3;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 195, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 1));
}

+ (id)setCentralReferenceTimeCommand
{
  double v3;
  char v5;
  unint64_t v6;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v5 = 8;
  v6 = (unint64_t)(v3 * 1000.0);
  return objc_msgSend(a1, "commandWithOpcode:payload:", 197, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v5, 9));
}

+ (id)setWildModeConfigurationCommandWithConfiguration:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 42, a3);
}

+ (id)rollWildKeyCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 43, 0);
}

+ (id)setAbsoluteWildModeConfigurationCommandWithConfiguration:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 45, a3);
}

+ (id)setTagTypeCommandWithType:(unsigned __int8)a3
{
  _BYTE v4[2];

  v4[0] = 1;
  v4[1] = a3;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 38, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 2));
}

+ (id)startSoundSequenceCommandWithSequence:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 40, a3);
}

+ (id)startSoundCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 40, 0);
}

+ (id)stopSoundCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 8, 0);
}

+ (id)startUnauthorizedShortSoundCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 2061, 0);
}

+ (id)startUnauthorizedSoundCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 175, 0);
}

+ (id)stopUnauthorizedSoundCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 220, 0);
}

+ (id)setNearOwnerTimeoutCommandWithTimeout:(unsigned __int16)a3
{
  char v4;
  unsigned __int16 v5;

  v4 = 2;
  v5 = a3;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 15, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 3));
}

+ (id)setKeyRotationTimeoutCommandWithTimeout:(unsigned int)a3
{
  char v4;
  unsigned int v5;

  v4 = 4;
  v5 = a3;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 177, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v4, 5));
}

+ (id)checkCrashesCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 181, 0);
}

+ (id)induceCrashCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 185, 0);
}

+ (id)dumpNordicLogsCommand
{
  __int16 v3;

  v3 = 1;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 180, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2));
}

+ (id)dumpNordicCrashesCommand
{
  __int16 v3;

  v3 = 257;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 180, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2));
}

+ (id)dumpRoseLogsCommand
{
  __int16 v3;

  v3 = 513;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 180, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2));
}

+ (id)dumpRoseCrashesCommand
{
  __int16 v3;

  v3 = 769;
  return objc_msgSend(a1, "commandWithOpcode:payload:", 180, +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v3, 2));
}

+ (id)initRoseNonOwnerCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 2049, a3);
}

+ (id)stopRoseNonOwnerCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 2053, a3);
}

+ (id)setRoseRangingParametersNonOwnerCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 2050, a3);
}

+ (id)prepareToStartRoseRangingNonOwnerCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 2051, 0);
}

+ (id)startRoseRangingNonOwnerCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 2051, a3);
}

+ (id)stopRoseRangingNonOwnerCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 2052, a3);
}

+ (id)initRoseCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 1, a3);
}

+ (id)stopRoseCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 6, a3);
}

+ (id)setRoseRangingParametersCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 21, a3);
}

+ (id)prepareToStartRoseRangingCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 22, 0);
}

+ (id)startRoseRangingCommandWithParameters:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 3, a3);
}

+ (id)stopRoseRangingCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 22, 0);
}

+ (id)setAccelerometerSlopeModeConfigurationCommandWithConfiguration:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 199, a3);
}

+ (id)setAccelerometerOrientationModeConfigurationCommandWithConfiguration:(id)a3
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 200, a3);
}

+ (id)fetchAccelerometerSlopeModeConfigurationCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 201, 0);
}

+ (id)fetchAccelerometerOrientationModeConfigurationCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 202, 0);
}

+ (id)fetchAccelerometerModeCommand
{
  return objc_msgSend(a1, "commandWithOpcode:payload:", 203, 0);
}

@end
