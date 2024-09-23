@implementation SignpostSupportLogMessage

+ (id)serializationTypeNumber
{
  if (serializationTypeNumber_onceToken_359 != -1)
    dispatch_once(&serializationTypeNumber_onceToken_359, &__block_literal_global_361);
  return (id)serializationTypeNumber_serializationTypeNumber_360;
}

void __67__SignpostSupportLogMessage_Serialization__serializationTypeNumber__block_invoke()
{
  void *v0;

  v0 = (void *)serializationTypeNumber_serializationTypeNumber_360;
  serializationTypeNumber_serializationTypeNumber_360 = (uint64_t)&unk_1E462E8D0;

}

- (id)humanReadableType
{
  return CFSTR("LogMessage");
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  objc_super v14;

  v4 = a4;
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SignpostSupportLogMessage;
  -[SignpostSupportObject _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](&v14, sel__dictionaryRepresentationWithIsHumanReadable_shouldRedact_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _addArchiveEventFieldsInDictionaryWithArchiveEvent(v7, self, v5);
  if (v4 && -[SignpostSupportLogMessage hasNonScalarDynamicData](self, "hasNonScalarDynamicData"))
  {
    if (v5)
      v8 = CFSTR("MessageString");
    else
      v8 = CFSTR("Mess");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("<redacted>"), v8);
  }
  else
  {
    -[SignpostSupportLogMessage message](self, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v10 = CFSTR("MessageString");
    else
      v10 = CFSTR("Mess");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v10);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[SignpostSupportLogMessage messageType](self, "messageType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v12 = CFSTR("MessageType");
  else
    v12 = CFSTR("MessType");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

  return v7;
}

- (SignpostSupportLogMessage)initWithDictionary:(id)a3
{
  id v4;
  SignpostSupportLogMessage *v5;
  SignpostSupportLogMessage *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  v10.receiver = self;
  v10.super_class = (Class)SignpostSupportLogMessage;
  v5 = -[SignpostSupportObject initWithDictionary:](&v10, sel_initWithDictionary_, v4);
  self = v5;
  if (!v5)
  {
LABEL_8:
    self = self;
    v6 = self;
    goto LABEL_10;
  }
  if (!_initArchiveEventFieldsWithSerializedObjectDictionary(v5, v4))
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Mess"));
  v6 = (SignpostSupportLogMessage *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SignpostSupportLogMessage setMessage:](self, "setMessage:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MessType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      -[SignpostSupportLogMessage setMessageType:](self, "setMessageType:", objc_msgSend(v7, "unsignedCharValue"));

    goto LABEL_8;
  }
LABEL_10:

  return v6;
}

- (SignpostSupportLogMessage)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5 unixDate:(timeval *)a6 unixTimeZone:(timezone *)a7
{
  SignpostSupportLogMessage *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SignpostSupportLogMessage;
  result = -[SignpostSupportObject initWithSubsystem:category:timebaseRatio:](&v10, sel_initWithSubsystem_category_timebaseRatio_, a3, a4, a5);
  if (result)
  {
    if (a6)
    {
      result->_tv_sec = a6->tv_sec;
      result->_tv_usec = a6->tv_usec;
    }
    if (a7)
    {
      result->_tz_minuteswest = a7->tz_minuteswest;
      result->_tz_dsttime = a7->tz_dsttime;
    }
  }
  return result;
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v12;
  void *v13;
  int v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SignpostSupportLogMessage;
  -[SignpostSupportObject _descriptionStringForColumn:timeFormat:asBegin:](&v15, sel__descriptionStringForColumn_timeFormat_asBegin_, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
LABEL_3:
    v10 = v9;
    goto LABEL_4;
  }
  v10 = 0;
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#llx"), -[SignpostSupportLogMessage threadID](self, "threadID"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 18)
        goto LABEL_4;
      -[SignpostSupportLogMessage message](self, "message");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_3;
  }
  if (a3 == 5)
  {
    v14 = -[SignpostSupportLogMessage messageType](self, "messageType");
    if (v14 <= 1)
    {
      if (!v14)
      {
        v10 = CFSTR("Default");
        goto LABEL_4;
      }
      if (v14 == 1)
      {
        v10 = CFSTR("Info");
        goto LABEL_4;
      }
    }
    else
    {
      switch(v14)
      {
        case 2:
          v10 = CFSTR("Debug");
          goto LABEL_4;
        case 16:
          v10 = CFSTR("Error");
          goto LABEL_4;
        case 17:
          v10 = CFSTR("Fault");
          goto LABEL_4;
      }
    }
    v10 = CFSTR("UNKNOWN");
    goto LABEL_4;
  }
  if (a3 == 9)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostSupportLogMessage processName](self, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@[%d]"), v13, -[SignpostSupportLogMessage processID](self, "processID"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:

  return v10;
}

- (unint64_t)durationMachContinuousTime
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SignpostSupportLogMessage;
  if (-[SignpostSupportObject isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[SignpostSupportLogMessage messageType](self, "messageType");
    if (v6 == objc_msgSend(v5, "messageType")
      && (-[SignpostSupportLogMessage message](self, "message"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "message"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqualToString:", v8),
          v8,
          v7,
          v9))
    {
      v10 = _archiveEventsAreEqual(self, v5);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)debugDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SignpostSupportLogMessage startMachContinuousTime](self, "startMachContinuousTime");
  -[SignpostSupportLogMessage message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Log Message [mct: %llu] %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)tv_sec
{
  return self->_tv_sec;
}

- (void)setTv_sec:(int64_t)a3
{
  self->_tv_sec = a3;
}

- (int)tv_usec
{
  return self->_tv_usec;
}

- (void)setTv_usec:(int)a3
{
  self->_tv_usec = a3;
}

- (int)tz_minuteswest
{
  return self->_tz_minuteswest;
}

- (void)setTz_minuteswest:(int)a3
{
  self->_tz_minuteswest = a3;
}

- (int)tz_dsttime
{
  return self->_tz_dsttime;
}

- (void)setTz_dsttime:(int)a3
{
  self->_tz_dsttime = a3;
}

- (int)processID
{
  return self->_processID;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (unint64_t)processUniqueID
{
  return self->_processUniqueID;
}

- (void)setProcessUniqueID:(unint64_t)a3
{
  self->_processUniqueID = a3;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(unint64_t)a3
{
  self->_threadID = a3;
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unsigned __int8)a3
{
  self->_messageType = a3;
}

- (NSUUID)processImageUUID
{
  return self->_processImageUUID;
}

- (void)setProcessImageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_processImageUUID, a3);
}

- (NSString)processImagePath
{
  return self->_processImagePath;
}

- (void)setProcessImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_processImagePath, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (NSUUID)senderImageUUID
{
  return self->_senderImageUUID;
}

- (void)setSenderImageUUID:(id)a3
{
  objc_storeStrong((id *)&self->_senderImageUUID, a3);
}

- (NSString)senderImagePath
{
  return self->_senderImagePath;
}

- (void)setSenderImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_senderImagePath, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (unint64_t)_machContinuousTimestamp
{
  return self->__machContinuousTimestamp;
}

- (void)set_machContinuousTimestamp:(unint64_t)a3
{
  self->__machContinuousTimestamp = a3;
}

- (BOOL)hasNonScalarDynamicData
{
  return self->_hasNonScalarDynamicData;
}

- (void)setHasNonScalarDynamicData:(BOOL)a3
{
  self->_hasNonScalarDynamicData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_senderImagePath, 0);
  objc_storeStrong((id *)&self->_senderImageUUID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_processImagePath, 0);
  objc_storeStrong((id *)&self->_processImageUUID, 0);
}

@end
