@implementation SensorExchangeHelper

+ (id)sharedInstance
{
  if (qword_1000A1DB8 != -1)
    dispatch_once(&qword_1000A1DB8, &stru_10007DF28);
  return (id)qword_1000A1DC0;
}

- (void)updateAllSensorExchangeData
{
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int v7;
  float v8;
  float *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  float v13;
  float *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  float v18;
  float *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  float v23;
  float *v24;
  NSObject *v25;
  uint64_t ui32Raw;
  float v27;
  float *v28;
  NSObject *v29;
  uint64_t v30;
  float v31;
  float *v32;
  NSObject *v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  double v37;

  v3 = 0;
  v4 = 232;
  do
  {
    v5 = (char *)self + 4 * v3;
    v6 = *((unsigned int *)v5 + 28);
    if ((v6 & 0x80000000) == 0 && v3 < self->cameraSensors.data.BYTES.p1[0])
    {
      v7 = *((_DWORD *)&qword_1000A29AC + v6);
      v8 = (double)v7 / 100.0;
      v9 = (float *)((char *)self + 4 * v3);
      if (v9[58] != v8)
      {
        if (byte_1000A2480)
        {
          v10 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            v35 = v6;
            v36 = 1024;
            LODWORD(v37) = v7;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Camera sensor update found for sensor# %d with value: %d", buf, 0xEu);
          }
        }
        v9[58] = v8;
        self->cameraSensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    v11 = *((unsigned int *)v5 + 96);
    if ((v11 & 0x80000000) == 0 && v3 < self->aopSensors.data.BYTES.p1[0])
    {
      v12 = *((_DWORD *)&qword_1000A29AC + v11);
      v13 = (double)v12 / 100.0;
      v14 = (float *)((char *)self + 4 * v3);
      if (v14[126] != v13)
      {
        if (byte_1000A2480)
        {
          v15 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            v35 = v11;
            v36 = 1024;
            LODWORD(v37) = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Notice> AOP sensor update found for sensor# %d with value: %d", buf, 0xEu);
          }
        }
        v14[126] = v13;
        self->aopSensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    v16 = self->basebandSensors.sensorIndexLUT[v3];
    if ((v16 & 0x80000000) == 0 && v3 < self->basebandSensors.data.BYTES.p1[0])
    {
      v17 = *((_DWORD *)&qword_1000A29AC + v16);
      v18 = (double)v17 / 100.0;
      v19 = (float *)((char *)self + 4 * v3);
      if (v19[194] != v18)
      {
        if (byte_1000A2480)
        {
          v20 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            v35 = v16;
            v36 = 1024;
            LODWORD(v37) = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> Baseband sensor update found for sensor# %d with value: %d", buf, 0xEu);
          }
        }
        v19[194] = v18;
        self->basebandSensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    v21 = *(unsigned int *)((char *)&self->super.isa + v4 * 4);
    if ((v21 & 0x80000000) == 0 && v3 < self->displaySensors.data.BYTES.p1[0])
    {
      v22 = *((_DWORD *)&qword_1000A29AC + v21);
      v23 = (double)v22 / 100.0;
      v24 = (float *)((char *)self + 4 * v3);
      if (v24[262] != v23)
      {
        if (byte_1000A2480)
        {
          v25 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            v35 = v21;
            v36 = 1024;
            LODWORD(v37) = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "<Notice> Display sensor update found for sensor# %d with value: %d", buf, 0xEu);
          }
        }
        v24[262] = v23;
        self->displaySensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    ui32Raw = self->cameraSensors.data.SENSORS.sensorArray[v4 + 10].UI32.ui32Raw;
    if ((ui32Raw & 0x80000000) == 0 && v3 < self->miscSensors.data.BYTES.p1[0])
    {
      v27 = (_DWORD)v3 == 26 || (_DWORD)v3 == 1
          ? (double)*((int *)&qword_1000A29AC + ui32Raw) / 100.0
          : *(float *)&dword_1000A2AC0[ui32Raw];
      v28 = (float *)((char *)self + 4 * v3);
      if (v27 != v28[330])
      {
        if (byte_1000A2480)
        {
          v29 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            v35 = ui32Raw;
            v36 = 2048;
            v37 = v27;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> Misc sensor update found for sensor# %d with value: %f", buf, 0x12u);
          }
        }
        v28[330] = v27;
        self->miscSensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    v30 = self->aopSensors.data.SENSORS.sensorArray[v4 + 10].UI32.ui32Raw;
    if ((v30 & 0x80000000) == 0 && v3 < self->misc2Sensors.data.BYTES.p1[0])
    {
      v31 = (_DWORD)v3 == 3 || (_DWORD)v3 == 2
          ? (double)*((int *)&qword_1000A29AC + v30) / 100.0
          : *(float *)&dword_1000A2BC0[v30];
      v32 = (float *)((char *)self + 4 * v3);
      if (v31 != v32[398])
      {
        if (byte_1000A2480)
        {
          v33 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            v35 = v30;
            v36 = 2048;
            v37 = v31;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<Notice> Misc2 sensor update found for sensor# %d with value: %f", buf, 0x12u);
          }
        }
        v32[398] = v31;
        self->misc2Sensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    ++v3;
    ++v4;
  }
  while (v3 != 29);
}

- (void)sendSensorExchangeDataToSMC
{
  _opaque_pthread_mutex_t *p_lock;
  NSObject *v4;
  unsigned int *p_smcPort;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t v9;
  mach_port_t smcPort;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  p_lock = &self->lock;
  pthread_mutex_lock(&self->lock);
  if (byte_1000A2480)
  {
    v4 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> In sendSensorExchangeDataToSMC function", buf, 2u);
    }
  }
  if (self->cameraSensors.SensorExchangeUpdateNeeded
    || self->aopSensors.SensorExchangeUpdateNeeded
    || self->basebandSensors.SensorExchangeUpdateNeeded
    || self->displaySensors.SensorExchangeUpdateNeeded
    || self->miscSensors.SensorExchangeUpdateNeeded
    || self->misc2Sensors.SensorExchangeUpdateNeeded
    || self->strapSensors.SensorExchangeUpdateNeeded)
  {
    p_smcPort = &self->smcPort;
    v6 = IOServiceMatching("AppleSMC");
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (MatchingService)
    {
      v8 = MatchingService;
      v9 = IOServiceOpen(MatchingService, mach_task_self_, 0, &self->smcPort);
      IOObjectRelease(v8);
      if (!(_DWORD)v9)
      {
        if (*p_smcPort)
        {
          v9 = IOConnectCallScalarMethod(*p_smcPort, 0, 0, 0, 0, 0);
          if (!(_DWORD)v9)
          {
            if (*p_smcPort)
            {
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:](self, "writeSMCExchangeDataForGroup:withData:", &self->cameraSensors, &self->cameraSensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:](self, "writeSMCExchangeDataForGroup:withData:", &self->aopSensors, &self->aopSensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:](self, "writeSMCExchangeDataForGroup:withData:", &self->basebandSensors, &self->basebandSensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:](self, "writeSMCExchangeDataForGroup:withData:", &self->displaySensors, &self->displaySensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:](self, "writeSMCExchangeDataForGroup:withData:", &self->miscSensors, &self->miscSensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:](self, "writeSMCExchangeDataForGroup:withData:", &self->misc2Sensors, &self->misc2Sensors.data);
              -[SensorExchangeHelper writeSMCExchangeDataForGroup:withData:](self, "writeSMCExchangeDataForGroup:withData:", &self->strapSensors, &self->strapSensors.data);
              smcPort = self->smcPort;
              if (smcPort && !IOConnectCallScalarMethod(smcPort, 1u, 0, 0, 0, 0))
                IOServiceClose(*p_smcPort);
              goto LABEL_23;
            }
            v9 = 0;
            goto LABEL_21;
          }
        }
        else
        {
          v9 = 0;
        }
      }
    }
    else
    {
      v9 = 3758097136;
    }
    *p_smcPort = 0;
LABEL_21:
    v11 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_10005140C(v9, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_23;
  }
  if (byte_1000A2480)
  {
    v18 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<Notice> No sensor groups require updates", v19, 2u);
    }
  }
LABEL_23:
  pthread_mutex_unlock(p_lock);
}

- (void)writeSMCExchangeDataForGroup:(smcExchangeSensorGroupInfo *)a3 withData:(void *)a4
{
  mach_port_t smcPort;
  NSObject *v8;
  __CFString *sensorExchangeKeyStr;
  unsigned int sensorExchangeKeyValue;
  unint64_t sensorExchangeKeySize;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  _BYTE v31[5];
  uint8_t v32[4];
  _BYTE *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  _OWORD outputStruct[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint8_t buf[4];
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  int v52;

  smcPort = self->smcPort;
  if (smcPort)
  {
    if (a3->SensorExchangeUpdateNeeded)
    {
      if (byte_1000A2480)
      {
        v8 = qword_1000A28A0;
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
        {
          sensorExchangeKeyStr = a3->sensorExchangeKeyStr;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&v49 = sensorExchangeKeyStr;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Writing sensor data to SMC key %@", buf, 0xCu);
          smcPort = self->smcPort;
        }
      }
      sensorExchangeKeyValue = a3->sensorExchangeKeyValue;
      sensorExchangeKeySize = a3->sensorExchangeKeySize;
      v30 = 168;
      v49 = 0u;
      v50 = 0u;
      memset(v51, 0, sizeof(v51));
      v52 = 0;
      memset(outputStruct, 0, sizeof(outputStruct));
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0;
      v31[0] = HIBYTE(sensorExchangeKeyValue);
      v31[1] = BYTE2(sensorExchangeKeyValue);
      v31[2] = BYTE1(sensorExchangeKeyValue);
      v31[3] = sensorExchangeKeyValue;
      v31[4] = 0;
      v51[6] = 6;
      *(_DWORD *)buf = sensorExchangeKeyValue;
      DWORD2(v50) = sensorExchangeKeySize;
      if ((_BYTE)sensorExchangeKeySize)
        memcpy(&v51[12], a4, sensorExchangeKeySize);
      v12 = IOConnectCallStructMethod(smcPort, 2u, buf, 0xA8uLL, outputStruct, &v30);
      v13 = BYTE8(v39);
      if (!(_DWORD)v12 && !BYTE8(v39))
        goto LABEL_14;
      v14 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v32 = 136315650;
        v33 = v31;
        v34 = 1024;
        v35 = v12;
        v36 = 1024;
        v37 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<Error> Write failed for key '%s' (0x%X, 0x%X)\n", v32, 0x18u);
        if ((_DWORD)v12)
        {
LABEL_12:
          v15 = qword_1000A28A0;
          if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
            sub_1000513A8(v12, v15, v16, v17, v18, v19, v20, v21);
        }
      }
      else if ((_DWORD)v12)
      {
        goto LABEL_12;
      }
LABEL_14:
      a3->SensorExchangeUpdateNeeded = 0;
      ++a3->data.BYTES.p1[2];
    }
  }
  else
  {
    v22 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051378(v22, v23, v24, v25, v26, v27, v28, v29);
  }
}

- (SensorExchangeHelper)init
{
  SensorExchangeHelper *v2;
  SensorExchangeHelper *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SensorExchangeHelper;
  v2 = -[SensorExchangeHelper init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    if (pthread_mutex_init(&v2->lock, 0))
    {
      v4 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100051348(v4, v5, v6, v7, v8, v9, v10, v11);
      return 0;
    }
    else
    {
      v3->smcPort = 0;
      v3->cameraSensors.sensorExchangeKeyStr = CFSTR("zECm");
      v3->cameraSensors.sensorExchangeKeyValue = 2051359597;
      v3->cameraSensors.sensorExchangeKeySize = 64;
      v3->cameraSensors.numberOfSensors = 15;
      v3->cameraSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->cameraSensors.data.BYTES.p1 = 267;
      v3->aopSensors.sensorExchangeKeyStr = CFSTR("zEAO");
      v3->aopSensors.sensorExchangeKeyValue = 2051359055;
      v3->aopSensors.sensorExchangeKeySize = 32;
      v3->aopSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->aopSensors.data.BYTES.p1 = 261;
      v3->basebandSensors.sensorExchangeKeyStr = CFSTR("zEWi");
      v3->basebandSensors.sensorExchangeKeyValue = 2051364713;
      v3->basebandSensors.sensorExchangeKeySize = 32;
      v3->basebandSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->basebandSensors.data.BYTES.p1 = 259;
      v3->displaySensors.sensorExchangeKeyStr = CFSTR("zETC");
      v3->displaySensors.sensorExchangeKeyValue = 2051363907;
      v3->displaySensors.sensorExchangeKeySize = 32;
      v3->displaySensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->displaySensors.data.BYTES.p1 = 260;
      v3->miscSensors.sensorExchangeKeyStr = CFSTR("zETM");
      v3->miscSensors.sensorExchangeKeyValue = 2051363917;
      v3->miscSensors.sensorExchangeKeySize = 120;
      v3->miscSensors.numberOfSensors = 29;
      v3->miscSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->miscSensors.data.BYTES.p1 = 285;
      v3->misc2Sensors.sensorExchangeKeyStr = CFSTR("zETN");
      v3->misc2Sensors.sensorExchangeKeyValue = 2051363918;
      v3->misc2Sensors.sensorExchangeKeySize = 120;
      v3->misc2Sensors.numberOfSensors = 29;
      v3->misc2Sensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->misc2Sensors.data.BYTES.p1 = 260;
      v3->strapSensors.sensorExchangeKeyStr = CFSTR("zEAR");
      v3->strapSensors.sensorExchangeKeyValue = 2051359058;
      v3->strapSensors.sensorExchangeKeySize = 32;
      v3->strapSensors.numberOfSensors = 7;
      v3->strapSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->strapSensors.data.BYTES.p1 = 258;
      v3->cameraSensors.sensorIndexLUT[28] = -1;
      *(_QWORD *)&v12 = -1;
      *((_QWORD *)&v12 + 1) = -1;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)v3->cameraSensors.sensorIndexLUT = v12;
      *(_OWORD *)v3->aopSensors.sensorIndexLUT = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[24] = v12;
      v3->aopSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)v3->basebandSensors.sensorIndexLUT = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[24] = v12;
      v3->basebandSensors.sensorIndexLUT[28] = -1;
      v3->displaySensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)v3->displaySensors.sensorIndexLUT = v12;
      v3->miscSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)v3->miscSensors.sensorIndexLUT = v12;
      v3->misc2Sensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)v3->misc2Sensors.sensorIndexLUT = v12;
      v3->strapSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[24] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[20] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[16] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[12] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[8] = v12;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[4] = v12;
      *(_OWORD *)v3->strapSensors.sensorIndexLUT = v12;
    }
  }
  return v3;
}

- (smcExchangeSensorGroupInfo)getSensorGroupForSMCKeyString:(__CFString *)a3
{
  smcExchangeSensorGroupInfo *p_cameraSensors;

  p_cameraSensors = &self->cameraSensors;
  if (CFStringCompare(a3, self->cameraSensors.sensorExchangeKeyStr, 0))
  {
    if (CFStringCompare(a3, self->aopSensors.sensorExchangeKeyStr, 0))
    {
      if (CFStringCompare(a3, self->basebandSensors.sensorExchangeKeyStr, 0))
      {
        if (CFStringCompare(a3, self->displaySensors.sensorExchangeKeyStr, 0))
        {
          if (CFStringCompare(a3, self->miscSensors.sensorExchangeKeyStr, 0))
          {
            if (CFStringCompare(a3, self->misc2Sensors.sensorExchangeKeyStr, 0))
            {
              p_cameraSensors = &self->strapSensors;
              if (CFStringCompare(a3, self->strapSensors.sensorExchangeKeyStr, 0))
                return 0;
            }
            else
            {
              return &self->misc2Sensors;
            }
          }
          else
          {
            return &self->miscSensors;
          }
        }
        else
        {
          return &self->displaySensors;
        }
      }
      else
      {
        return &self->basebandSensors;
      }
    }
    else
    {
      return &self->aopSensors;
    }
  }
  return p_cameraSensors;
}

- (void)registerCLTMSensorIndex:(int)a3 forSMCKey:(__CFString *)a4 atSMCIndex:(int)a5
{
  smcExchangeSensorGroupInfo *v8;
  smcExchangeSensorGroupInfo *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  int v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  int v18;

  v8 = -[SensorExchangeHelper getSensorGroupForSMCKeyString:](self, "getSensorGroupForSMCKeyString:", a4);
  if (v8)
  {
    if ((a5 | a3) < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
        sub_100051540();
    }
    else
    {
      v9 = v8;
      if (CFStringCompare(a4, v8->sensorExchangeKeyStr, 0) == kCFCompareEqualTo)
      {
        if (v9->numberOfSensors > a5)
        {
          if (byte_1000A2480)
          {
            v10 = qword_1000A28A0;
            if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
            {
              v13 = 67109376;
              v14 = a3;
              v15 = 1024;
              LODWORD(v16) = a5;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Assigning CLTM sensor index %d to SMC sensor index: %d", (uint8_t *)&v13, 0xEu);
            }
          }
          v9->sensorIndexLUT[a5] = a3;
          return;
        }
        if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
          sub_1000514E0();
      }
      v12 = qword_1000A28A0;
      if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      {
        v13 = 67109634;
        v14 = a3;
        v15 = 2112;
        v16 = a4;
        v17 = 1024;
        v18 = a5;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "<Error> Unable to assign CLTM index:%d to any SMC sensor group for key:%@ and index:%d", (uint8_t *)&v13, 0x18u);
      }
    }
  }
  else
  {
    v11 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_ERROR))
      sub_100051470((uint64_t)a4, v11);
  }
}

@end
