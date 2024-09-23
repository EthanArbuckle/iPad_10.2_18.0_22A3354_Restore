@implementation SCDAAdvertisementContextRecord

- (SCDAAdvertisementContextRecord)initWithAdvertisementRecordType:(int64_t)a3 voiceTriggerEndTime:(double)a4 advertisementPayload:(id)a5 deviceID:(id)a6 electionParticipantId:(id)a7
{
  id v12;
  id v13;
  id v14;
  SCDAAdvertisementContextRecord *v15;
  SCDAAdvertisementContextRecord *v16;
  uint64_t v17;
  NSData *advertisementPayload;
  uint64_t v19;
  NSUUID *deviceID;
  uint64_t v21;
  NSUUID *electionParticipantId;
  objc_super v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SCDAAdvertisementContextRecord;
  v15 = -[SCDAAdvertisementContextRecord init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_advertisementContextVersion = kSCDAAdvertisementContextRecordVersion;
    v15->_advertisementRecordType = a3;
    v15->_voiceTriggerEndTime = a4;
    v17 = objc_msgSend(v12, "copy");
    advertisementPayload = v16->_advertisementPayload;
    v16->_advertisementPayload = (NSData *)v17;

    v19 = objc_msgSend(v13, "copy");
    deviceID = v16->_deviceID;
    v16->_deviceID = (NSUUID *)v19;

    v21 = objc_msgSend(v14, "copy");
    electionParticipantId = v16->_electionParticipantId;
    v16->_electionParticipantId = (NSUUID *)v21;

  }
  return v16;
}

- (SCDAAdvertisementContextRecord)initWithMyriadAdvertisementContextRecordData:(id)a3
{
  id v4;
  SCDAAdvertisementContextRecord *v5;
  SCDAAdvertisementContextRecord *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCDAAdvertisementContextRecord;
  v5 = -[SCDAAdvertisementContextRecord init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SCDAAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:](v5, "_initializeMyriadAdvertisementContextRecordFromData:", v4);

  return v6;
}

- (id)description
{
  id v3;
  unsigned __int8 *v4;
  unint64_t v5;
  void *v6;
  uint64_t advertisementContextVersion;
  double voiceTriggerEndTime;
  int64_t advertisementRecordType;
  NSUUID *deviceID;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (-[NSData length](self->_advertisementPayload, "length"))
  {
    v4 = -[NSData bytes](self->_advertisementPayload, "bytes");
    if (-[NSData length](self->_advertisementPayload, "length"))
    {
      v5 = 0;
      do
        objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), v4[v5++]);
      while (v5 < -[NSData length](self->_advertisementPayload, "length"));
    }
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  advertisementContextVersion = self->_advertisementContextVersion;
  voiceTriggerEndTime = self->_voiceTriggerEndTime;
  advertisementRecordType = self->_advertisementRecordType;
  deviceID = self->_deviceID;
  -[NSUUID UUIDString](self->_electionParticipantId, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("SCDAAdvertisementContextRecord: contextVersion=%ld vtEndTime=%f advRecordType=%ld advPayload=0x%@ deviceID=%@ electionParticipantId=%@"), advertisementContextVersion, *(_QWORD *)&voiceTriggerEndTime, advertisementRecordType, v3, deviceID, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)myriadAdvertisementContextAsData
{
  void *v3;
  size_t v4;
  uint8_t *v5;
  NSData *advertisementPayload;
  NSUUID *deviceID;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SCDAAdvertisementContextRecord _advertismentPayloadSizeForVersion:](self, "_advertismentPayloadSizeForVersion:", self->_advertisementContextVersion);
  v5 = &buf[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  bzero(v5, v4);
  advertisementPayload = self->_advertisementPayload;
  if (advertisementPayload && -[NSData length](advertisementPayload, "length") == v4)
    -[NSData getBytes:length:](self->_advertisementPayload, "getBytes:length:", v5, v4);
  v17[0] = 0;
  v17[1] = 0;
  deviceID = self->_deviceID;
  if (deviceID)
    -[NSUUID getUUIDBytes:](deviceID, "getUUIDBytes:", v17);
  v16[0] = 0;
  v16[1] = 0;
  -[NSUUID getUUIDBytes:](self->_electionParticipantId, "getUUIDBytes:", v16);
  objc_msgSend(v3, "appendBytes:length:", &self->_advertisementContextVersion, 1);
  objc_msgSend(v3, "appendBytes:length:", &self->_advertisementRecordType, 1);
  objc_msgSend(v3, "appendBytes:length:", &self->_voiceTriggerEndTime, 8);
  objc_msgSend(v3, "appendBytes:length:", v5, v4);
  objc_msgSend(v3, "appendBytes:length:", v17, 16);
  objc_msgSend(v3, "appendBytes:length:", v16, 16);
  v8 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = objc_msgSend(v3, "length");
    *(_DWORD *)buf = 136315394;
    v13 = "-[SCDAAdvertisementContextRecord myriadAdvertisementContextAsData]";
    v14 = 2048;
    v15 = v10;
    _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, "%s Generated Myriad advertisement context data: %lu bytes", buf, 0x16u);

  }
  return v3;
}

- (BOOL)isSaneForVoiceTriggerEndTime:(double)a3 endtimeDistanceThreshold:(double)a4
{
  double v6;
  double voiceTriggerEndTime;
  double v8;
  BOOL v9;
  NSObject *v10;
  NSData *advertisementPayload;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  NSData *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0.0)
  {
    v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[SCDAAdvertisementContextRecord isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:]";
      v16 = 2048;
      *(double *)v17 = a3;
      _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s Invalid Voicetrigger endtime: %f", (uint8_t *)&v14, 0x16u);
    }
    return 0;
  }
  else
  {
    v6 = fmin(a4, 0.5);
    voiceTriggerEndTime = self->_voiceTriggerEndTime;
    if (voiceTriggerEndTime - a3 >= 0.0)
      v8 = voiceTriggerEndTime - a3;
    else
      v8 = -(voiceTriggerEndTime - a3);
    v9 = v8 <= v6;
    v10 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      advertisementPayload = self->_advertisementPayload;
      v14 = 136316674;
      v15 = "-[SCDAAdvertisementContextRecord isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:]";
      v16 = 1024;
      *(_DWORD *)v17 = v8 <= v6;
      *(_WORD *)&v17[4] = 2048;
      *(double *)&v17[6] = v6;
      v18 = 2048;
      v19 = a3;
      v20 = 2048;
      v21 = voiceTriggerEndTime;
      v22 = 2048;
      v23 = v8;
      v24 = 2112;
      v25 = advertisementPayload;
      _os_log_impl(&dword_246211000, v10, OS_LOG_TYPE_INFO, "%s VoicetriggerEndtime isSane: %d (threshold: %f, me: %f, other: %f, abs-diff: %f adv: %@)", (uint8_t *)&v14, 0x44u);
    }
  }
  return v9;
}

- (unint64_t)_advertismentPayloadSizeForVersion:(unsigned __int8)a3
{
  if ((a3 - 1) < 2)
    return 7;
  else
    return 8;
}

- (char)_getAdvertismentRecordTypeForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v4;
  char v5;
  uint64_t v7;

  v4 = a4;
  v5 = 7;
  v7 = 7;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    objc_msgSend(v4, "getBytes:range:", &v7, 1, 1);
    v5 = v7;
  }

  return v5;
}

- (double)_getVoiceTriggerEndTimeForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v4;
  double v5;
  double v7;

  v4 = a4;
  v7 = 0.0;
  v5 = 0.0;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0xA)
  {
    objc_msgSend(v4, "getBytes:range:", &v7, 2, 8);
    v5 = v7;
  }

  return v5;
}

- (id)_getMyriadAdvertisementDataForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v5;
  size_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = -[SCDAAdvertisementContextRecord _advertismentPayloadSizeForVersion:](self, "_advertismentPayloadSizeForVersion:", self->_advertisementContextVersion);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v11 - v7;
  bzero((char *)v11 - v7, v6);
  if (objc_msgSend(v5, "length") >= v6 + 10)
    objc_msgSend(v5, "getBytes:range:", v8, 10, v6);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_getDeviceIdForVersion:(unsigned __int8)a3 data:(id)a4
{
  int v4;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v4 = a3;
  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v12[0] = 0;
  v12[1] = 0;
  v7 = objc_msgSend(v6, "length");
  if ((v4 - 1) > 1)
  {
    if (v7 >= 0x22)
    {
      v8 = 18;
      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (v7 <= 0x20)
    goto LABEL_7;
  v8 = 17;
LABEL_6:
  objc_msgSend(v6, "getBytes:range:", v12, v8, 16);
  -[SCDAAdvertisementContextRecord _UUIDFromBytes:](self, "_UUIDFromBytes:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (id)_getElectionParticipantIdForVersion:(unsigned __int8)a3 data:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v4 = a3;
  v11[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  v8 = 0;
  v11[0] = 0;
  v11[1] = 0;
  if ((v4 - 1) >= 3)
  {
    if ((unint64_t)objc_msgSend(v6, "length") < 0x32)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v7, "getBytes:range:", v11, 34, 16);
      -[SCDAAdvertisementContextRecord _UUIDFromBytes:](self, "_UUIDFromBytes:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (void)_initializeMyriadAdvertisementContextRecordFromData:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int advertisementContextVersion;
  double v8;
  NSData *v9;
  NSData *advertisementPayload;
  NSUUID *v11;
  NSUUID *deviceID;
  NSUUID *v13;
  NSUUID *electionParticipantId;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v4 && v5)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_advertisementContextVersion, 0, 1);
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      advertisementContextVersion = self->_advertisementContextVersion;
      v16 = 136315394;
      v17 = "-[SCDAAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:]";
      v18 = 1024;
      LODWORD(v19) = advertisementContextVersion;
      _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s Initializing Myriad advertisement context (version: %d)", (uint8_t *)&v16, 0x12u);
    }
    self->_advertisementRecordType = -[SCDAAdvertisementContextRecord _getAdvertismentRecordTypeForVersion:data:](self, "_getAdvertismentRecordTypeForVersion:data:", self->_advertisementContextVersion, v4);
    -[SCDAAdvertisementContextRecord _getVoiceTriggerEndTimeForVersion:data:](self, "_getVoiceTriggerEndTimeForVersion:data:", self->_advertisementContextVersion, v4);
    self->_voiceTriggerEndTime = v8;
    -[SCDAAdvertisementContextRecord _getMyriadAdvertisementDataForVersion:data:](self, "_getMyriadAdvertisementDataForVersion:data:", self->_advertisementContextVersion, v4);
    v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    advertisementPayload = self->_advertisementPayload;
    self->_advertisementPayload = v9;

    -[SCDAAdvertisementContextRecord _getDeviceIdForVersion:data:](self, "_getDeviceIdForVersion:data:", self->_advertisementContextVersion, v4);
    v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    deviceID = self->_deviceID;
    self->_deviceID = v11;

    -[SCDAAdvertisementContextRecord _getElectionParticipantIdForVersion:data:](self, "_getElectionParticipantIdForVersion:data:", self->_advertisementContextVersion, v4);
    v13 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    electionParticipantId = self->_electionParticipantId;
    self->_electionParticipantId = v13;

  }
  else
  {
    v15 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[SCDAAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:]";
      v18 = 2112;
      v19 = v4;
      _os_log_error_impl(&dword_246211000, v15, OS_LOG_TYPE_ERROR, "%s #scda-advertisementcontext: Received wedged Myriad advertisement context record %@", (uint8_t *)&v16, 0x16u);
    }
  }

}

- (id)recordForDeviceId:(id)a3
{
  id v4;
  SCDARecord *v5;

  v4 = a3;
  if (v4 && self->_advertisementPayload)
  {
    v5 = -[SCDARecord initWithDeviceID:data:electionParticipantId:]([SCDARecord alloc], "initWithDeviceID:data:electionParticipantId:", v4, self->_advertisementPayload, self->_electionParticipantId);
    -[SCDARecord setIsCollectedFromContextCollector:](v5, "setIsCollectedFromContextCollector:", 1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)compareAdvertisementPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  v5 = v4;
  if (v4
    && self->_advertisementPayload
    && (v6 = objc_msgSend(v4, "length"), v6 == -[NSData length](self->_advertisementPayload, "length")))
  {
    v7 = objc_msgSend(v5, "isEqual:", self->_advertisementPayload);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_UUIDFromBytes:(const unsigned __int8 *)(a3
{
  void *v5;
  void *v6;
  char out[40];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (uuid_is_null((const unsigned __int8 *)a3))
    return 0;
  memset(out, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)a3, out);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), out);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {

    return 0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);

  return v6;
}

- (unsigned)advertisementContextVersion
{
  return self->_advertisementContextVersion;
}

- (int64_t)advertisementRecordType
{
  return self->_advertisementRecordType;
}

- (double)voiceTriggerEndTime
{
  return self->_voiceTriggerEndTime;
}

- (NSData)advertisementPayload
{
  return self->_advertisementPayload;
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (NSUUID)electionParticipantId
{
  return self->_electionParticipantId;
}

- (double)advertisementDispatchTime
{
  return self->_advertisementDispatchTime;
}

- (void)setAdvertisementDispatchTime:(double)a3
{
  self->_advertisementDispatchTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electionParticipantId, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

@end
