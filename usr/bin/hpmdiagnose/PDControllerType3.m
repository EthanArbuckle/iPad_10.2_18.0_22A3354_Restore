@implementation PDControllerType3

+ (id)PDControllerType3MicroWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithAddress:userClient:", v4, v6);

  return v7;
}

- (PDControllerType3)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  id v5;
  PDControllerType3 *v6;
  PDControllerType3 *v7;
  void *v8;
  objc_super v10;

  v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PDControllerType3;
  v6 = -[PDControllerType3 init](&v10, "init");
  v7 = v6;
  if (!v6
    || (-[PDControllerType3 setUserClient:](v6, "setUserClient:", v5),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType3 userClient](v7, "userClient")),
        v8,
        !v8))
  {

    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PDControllerType3;
  -[PDControllerType3 dealloc](&v2, "dealloc");
}

- (int)sendVDM:(unsigned int *)a3 ofLength:(unint64_t)a4
{
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  char v10;
  _QWORD v11[3];
  int v12;

  memset(v11, 0, sizeof(v11));
  v12 = 0;
  if (a4 >= 7)
    v5 = 7;
  else
    v5 = a4;
  v10 = v5;
  __memcpy_chk(v11, a3, 4 * v5, 28);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType3 userClient](self, "userClient"));
  v7 = objc_msgSend(v6, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDControllerType3 address](self, "address"), 9, &v10, (4 * v5) | 1, 0);

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType3 userClient](self, "userClient"));
    v7 = objc_msgSend(v8, "iecsCommand:forDevice:flags:", 1447316851, -[PDControllerType3 address](self, "address"), 0);

  }
  return v7;
}

- (int)getVDM:(unsigned int *)a3 ofLength:(unint64_t *)a4
{
  void *v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;

  v12 = 65;
  if (*a4 >= 8)
    *a4 = 7;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType3 userClient](self, "userClient"));
  v8 = objc_msgSend(v7, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", -[PDControllerType3 address](self, "address"), 79, &v13, 4 * *a4, 0, &v12);

  if (!v8)
  {
    v9 = v13 >> 5;
    if ((_DWORD)v9 == -[PDControllerType3 cached_sequence_num](self, "cached_sequence_num"))
    {
      bzero(a3, 4 * *a4);
      *a4 = 0;
    }
    else
    {
      -[PDControllerType3 setCached_sequence_num:](self, "setCached_sequence_num:", v9);
      v10 = v13 & 7;
      *a4 = v10;
      memcpy(a3, &v14, 4 * v10);
    }
  }
  return v8;
}

- (int)readIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  BOOL v15;
  unint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  size_t v20;
  int v21;
  int v22;
  int result;
  int v24;
  char *v25;
  uint64_t v26;
  unsigned int v27;
  _DWORD v28[6];

  v26 = 0;
  if (a4 >= 0x40)
    v10 = 64;
  else
    v10 = a4;
LABEL_4:
  v27 = 95158787;
  v28[0] = v10 | ((-[PDControllerType3 burstLimit](self, "burstLimit") & 0xF) << 16) | 0x1000000;
  v28[1] = a5;
  v11 = -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v27, 3);
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    while (1)
    {
      do
      {
        v26 = 7;
        v12 = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v27, &v26);
        v13 = v12;
      }
      while (!v12 && !v26);
      if (v12)
        break;
      if (v27 >> 15 == 2904)
      {
        v14 = (v27 >> 4) & 3;
        if (v14 == 2)
        {
          v13 = -536870212;
        }
        else
        {
          if (v14 != 1)
            goto LABEL_4;
          v13 = 0;
        }
        break;
      }
    }
  }
  v15 = v10 != 0;
  if (!v13 && v10)
  {
    v25 = (char *)a3;
    v16 = 0;
    do
    {
      if ((v10 - v16) <= 0x18uLL)
        v17 = ((((_DWORD)v10 - (_DWORD)v16) & 0x1F) << 6) | 0x5AC0001;
      else
        v17 = 95159809;
      while (1)
      {
        v27 = v17;
        -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v27, 1, v25);
        do
        {
          v26 = 7;
          v18 = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v27, &v26);
          v13 = v18;
        }
        while (!v18 && !v26);
        if (v18 || v27 >> 15 != 2904)
          break;
        v19 = (v27 >> 4) & 3;
        if (v19 == 2)
        {
          v13 = 0;
          goto LABEL_34;
        }
        if (v19 == 1)
        {
          v20 = ((unint64_t)v27 >> 6) & 0x1F;
          memcpy(&v25[v16], v28, v20);
          v16 += v20;
          *a6 = v16;
          break;
        }
        v15 = v10 > v16;
        if (v10 <= v16)
        {
          v13 = 0;
          v15 = v10 > v16;
          goto LABEL_34;
        }
      }
      v15 = v16 < v10;
    }
    while (!v13 && v16 < v10);
  }
LABEL_34:
  v21 = v13;
LABEL_35:
  if (!v15)
    return v13;
  if (v21)
    return v21;
  v27 = 95158276;
  v22 = -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v27, 1);
  if (v22)
    return v22;
  while (1)
  {
    do
    {
      v26 = 7;
      result = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v27, &v26);
    }
    while (!result && !v26);
    if (result)
      return result;
    if (v27 >> 15 == 2904)
    {
      v24 = (v27 >> 4) & 3;
      result = 0;
      if (v24 == 1)
        return result;
      v21 = 0;
      if (v24 == 2)
        return -536870212;
      goto LABEL_35;
    }
  }
}

- (int)writeIECSRegister:(void *)a3 ofLength:(unint64_t)a4 atRegister:(unsigned int)a5
{
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  BOOL v13;
  unint64_t v14;
  unsigned __int8 v15;
  unint64_t v16;
  BOOL v17;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int result;
  int v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  _DWORD v32[6];

  if (a4 >= 0x40)
    v8 = 64;
  else
    v8 = a4;
  v30 = 0;
LABEL_5:
  v31 = 95158787;
  v32[0] = v8 | ((-[PDControllerType3 burstLimit](self, "burstLimit") & 0xF) << 16) | 0x1800000;
  v32[1] = a5;
  v9 = -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v31, 3);
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    while (1)
    {
      do
      {
        v30 = 7;
        v10 = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v31, &v30);
        v11 = v10;
      }
      while (!v10 && !v30);
      if (v10)
        break;
      if (v31 >> 15 == 2904)
      {
        v12 = (v31 >> 4) & 3;
        if (v12 == 2)
          return -536870212;
        if (v12 != 1)
          goto LABEL_5;
        v11 = 0;
        break;
      }
    }
  }
  v13 = v8 != 0;
  if (!v11 && v8)
  {
    v14 = 0;
    v28 = a3;
    v29 = v8;
    do
    {
      v15 = v8 - v14;
      v16 = (v8 - v14);
      v17 = v8 > v14;
      if (v16 > 0x18)
        v15 = 24;
      v18 = (char *)a3 + v14;
      v19 = v15;
      v20 = ((v15 & 0x1F) << 6) | 0x5AC0002;
      v21 = ((v15 + 3) >> 2) + 1;
      while (1)
      {
        __memcpy_chk(v32, v18, v19, 24);
        v31 = v20;
        -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v31, v21);
        do
        {
          v30 = 7;
          v22 = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v31, &v30);
          v11 = v22;
        }
        while (!v22 && !v30);
        if (v22 || v31 >> 15 != 2904)
          break;
        v23 = (v31 >> 4) & 3;
        if (v23 == 2)
        {
          v11 = 0;
          goto LABEL_34;
        }
        if (v23 == 1)
        {
          v14 += v19;
          break;
        }
        v13 = v17;
        if (v29 <= v14)
        {
          v11 = 0;
          v13 = v17;
          goto LABEL_34;
        }
      }
      a3 = v28;
      v8 = v29;
      v13 = v14 < v29;
    }
    while (!v22 && v14 < v29);
  }
LABEL_34:
  v24 = v11;
LABEL_35:
  if (!v13)
    return v11;
  if (v24)
    return v24;
  v31 = 95158276;
  v25 = -[PDControllerType3 sendVDM:ofLength:](self, "sendVDM:ofLength:", &v31, 1);
  if (v25)
    return v25;
  while (1)
  {
    do
    {
      v30 = 7;
      result = -[PDControllerType3 getVDM:ofLength:](self, "getVDM:ofLength:", &v31, &v30);
    }
    while (!result && !v30);
    if (result)
      return result;
    if (v31 >> 15 == 2904)
    {
      v27 = (v31 >> 4) & 3;
      result = 0;
      if (v27 == 1)
        return result;
      v24 = 0;
      if (v27 == 2)
        return -536870212;
      goto LABEL_35;
    }
  }
}

- (int)executeIECSCommand:(unsigned int)a3
{
  int result;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v10 = 0;
  v9 = 4;
  result = -[PDControllerType3 readIECSRegister:ofLength:atRegister:andOutReadLength:](self, "readIECSRegister:ofLength:atRegister:andOutReadLength:", &v10, 4, 8, &v9);
  if (!result && v10)
  {
    v10 = 0;
    result = -[PDControllerType3 writeIECSRegister:ofLength:atRegister:](self, "writeIECSRegister:ofLength:atRegister:", &v10, 4, 8);
  }
  if (!result)
  {
    LODWORD(v9) = bswap32(a3);
    result = -[PDControllerType3 writeIECSRegister:ofLength:atRegister:](self, "writeIECSRegister:ofLength:atRegister:", &v9, 4, 8);
    if (!result)
    {
      v6 = 100000;
      while (1)
      {
        v9 = 4;
        v7 = -[PDControllerType3 readIECSRegister:ofLength:atRegister:andOutReadLength:](self, "readIECSRegister:ofLength:atRegister:andOutReadLength:", &v10, 4, 8, &v9);
        v8 = v10;
        if (v7 || !v10)
          break;
        +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 0.0000999999975);
        if (!--v6)
        {
          v8 = v10;
          break;
        }
      }
      if (v8)
        return -536870186;
      else
        return v7;
    }
  }
  return result;
}

- (int)isPDControllerType3HPM:(BOOL *)a3
{
  int result;
  uint64_t v7;

  *a3 = 0;
  v7 = 0;
  result = -[PDControllerType3 registerRead32:atAddress:](self, "registerRead32:atAddress:", (char *)&v7 + 4, 0);
  if (!result)
  {
    result = -[PDControllerType3 registerRead32:atAddress:](self, "registerRead32:atAddress:", &v7, 1);
    if (!result)
    {
      result = 0;
      if (HIDWORD(v7) == 2599 && (_DWORD)v7 == 25)
        *a3 = 1;
    }
  }
  return result;
}

- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5;

  v5 = 0;
  return -[PDControllerType3 readIECSRegister:ofLength:atRegister:andOutReadLength:](self, "readIECSRegister:ofLength:atRegister:andOutReadLength:", a3, 4, *(_QWORD *)&a4, &v5);
}

- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4
{
  unsigned int v5;

  v5 = a3;
  return -[PDControllerType3 writeIECSRegister:ofLength:atRegister:](self, "writeIECSRegister:ofLength:atRegister:", &v5, 4, *(_QWORD *)&a4);
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v6;

  v6 = 0;
  return -[PDControllerType3 readIECSRegister:ofLength:atRegister:andOutReadLength:](self, "readIECSRegister:ofLength:atRegister:andOutReadLength:", a3, a4, *(_QWORD *)&a5, &v6);
}

- (BOOL)remote
{
  return self->_remote;
}

- (void)setRemote:(BOOL)a3
{
  self->_remote = a3;
}

- (AppleHPMUserClient)userClient
{
  return self->_userClient;
}

- (void)setUserClient:(id)a3
{
  objc_storeStrong((id *)&self->_userClient, a3);
}

- (NSDictionary)registerMap
{
  return self->_registerMap;
}

- (void)setRegisterMap:(id)a3
{
  objc_storeStrong((id *)&self->_registerMap, a3);
}

- (unsigned)address
{
  return self->_address;
}

- (void)setAddress:(unsigned __int8)a3
{
  self->_address = a3;
}

- (unsigned)cached_sequence_num
{
  return self->_cached_sequence_num;
}

- (void)setCached_sequence_num:(unsigned __int8)a3
{
  self->_cached_sequence_num = a3;
}

- (unsigned)streamSequenceNumber
{
  return self->_streamSequenceNumber;
}

- (void)setStreamSequenceNumber:(unsigned __int8)a3
{
  self->_streamSequenceNumber = a3;
}

- (unsigned)burstLimit
{
  return self->_burstLimit;
}

- (void)setBurstLimit:(unsigned __int8)a3
{
  self->_burstLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerMap, 0);
  objc_storeStrong((id *)&self->_userClient, 0);
}

@end
