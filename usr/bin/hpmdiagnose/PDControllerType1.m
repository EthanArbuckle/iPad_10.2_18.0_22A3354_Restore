@implementation PDControllerType1

+ (id)PDControllerType1WithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithAddress:userClient:", v4, v6);

  return v7;
}

- (PDControllerType1)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4;
  id v6;
  PDControllerType1 *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PDControllerType1;
  v7 = -[PDController initWithAddress:userClient:](&v10, "initWithAddress:userClient:", v4, v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PDControllerType3 PDControllerType3MicroWithDeviceAddress:userClient:](PDControllerType3, "PDControllerType3MicroWithDeviceAddress:userClient:", v4, v6));
    -[PDControllerType1 setMicro_user_client:](v7, "setMicro_user_client:", v8);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PDControllerType1;
  -[PDControllerType1 dealloc](&v2, "dealloc");
}

- (BOOL)supportsRemote
{
  return 1;
}

- (int)isPDControllerType1:(BOOL *)a3
{
  int result;
  uint64_t v7;

  *a3 = 0;
  v7 = 0;
  result = -[PDController registerRead32:atAddress:](self, "registerRead32:atAddress:", (char *)&v7 + 4, 0);
  if (!result)
  {
    result = -[PDController registerRead32:atAddress:](self, "registerRead32:atAddress:", &v7, 1);
    if (!result)
    {
      result = 0;
      if (HIDWORD(v7) == 2599 && (_DWORD)v7 == 24)
        *a3 = 1;
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
  result = -[PDController registerRead32:atAddress:](self, "registerRead32:atAddress:", (char *)&v7 + 4, 0);
  if (!result)
  {
    result = -[PDController registerRead32:atAddress:](self, "registerRead32:atAddress:", &v7, 1);
    if (!result)
    {
      result = 0;
      if (HIDWORD(v7) == 2599 && (_DWORD)v7 == 25)
        *a3 = 1;
    }
  }
  return result;
}

- (int)getPinOutRevision:(unsigned int *)a3
{
  int result;
  int v6;
  unsigned int v7;
  char v8;
  char v9;

  *a3 = 3;
  v9 = 0;
  result = -[PDControllerType1 isPDControllerType1:](self, "isPDControllerType1:", &v9);
  if (!result)
  {
    if (v9)
    {
      v8 = 0;
      result = -[PDController registerRead8:atAddress:](self, "registerRead8:atAddress:", &v8, 91);
      if (!result)
      {
        v6 = v8 & 0x3E;
        if ((v6 | 2) == 0xA)
        {
          result = 0;
          if (v6 == 10)
            v7 = 2;
          else
            v7 = 1;
          *a3 = v7;
        }
        else
        {
          return 0;
        }
      }
    }
    else
    {
      printf("WARNING: Unrecognized VID/DID, not valid PDControllerType1!");
      return -536870201;
    }
  }
  return result;
}

- (int)getCCRole:(int *)a3
{
  int result;
  int v6;
  __int16 v7;

  v7 = 0;
  result = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", (char *)&v7 + 1, 53);
  if (!result)
  {
    result = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v7, 54);
    if (!result)
    {
      if (HIBYTE(v7))
        v6 = 1;
      else
        v6 = 2;
      *a3 = v6;
    }
  }
  return result;
}

- (int)isVCONNOn:(BOOL *)a3
{
  int result;
  BOOL v6;
  BOOL v8;
  char v9;
  __int16 v10;

  v10 = 0;
  v9 = 0;
  result = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", (char *)&v10 + 1, 22);
  if (!result)
  {
    result = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v10, 47);
    if (!result)
    {
      result = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v9, 52);
      if (!result)
      {
        if ((_BYTE)v10)
          v6 = HIBYTE(v10) == 0;
        else
          v6 = 0;
        v8 = v6 && v9 == 0;
        *a3 = v8;
      }
    }
  }
  return result;
}

- (int)getPDMode:(int *)a3
{
  int result;
  int v6;
  int v7;
  __int16 v8;

  v8 = 0;
  result = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", (char *)&v8 + 1, 21);
  if (!result)
  {
    result = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v8, 17);
    if (!result)
    {
      if (HIBYTE(v8))
        v6 = 2;
      else
        v6 = 1;
      if ((_BYTE)v8)
        v7 = v6;
      else
        v7 = 0;
      *a3 = v7;
    }
  }
  return result;
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  uint64_t v7;
  void *v11;
  unsigned int v12;
  int v13;

  v7 = *(_QWORD *)&a5;
  if (-[PDController remote](self, "remote"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 micro_user_client](self, "micro_user_client"));
    v12 = objc_msgSend(v11, "readIECSRegister:ofLength:atRegister:andOutReadLength:", a3, a4, v7, a6);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    v12 = objc_msgSend(v11, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", -[PDController address](self, "address"), v7, a3, a4, 0, a6);
  }
  v13 = v12;

  return v13;
}

- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v5;
  void *v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)&a5;
  if (-[PDController remote](self, "remote"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 micro_user_client](self, "micro_user_client"));
    v10 = objc_msgSend(v9, "writeIECSRegister:ofLength:atRegister:", a3, a4, v5);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    v10 = objc_msgSend(v9, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDController address](self, "address"), v5, a3, a4, 0);
  }
  v11 = v10;

  return v11;
}

- (int)sendVDM:(void *)a3 length:(unint64_t)a4 sop:(int)a5
{
  uint64_t v5;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  LODWORD(v5) = objc_msgSend(v9, "sendVDMForDevice:sop:buffer:length:flags:", -[PDController address](self, "address"), v5, a3, a4, 0);

  return v5;
}

- (int)receiveVDM:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  void *v13;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  LODWORD(a7) = objc_msgSend(v13, "receiveVDMForDevice:buffer:length:flags:outSOP:outSequence:outLength:", -[PDController address](self, "address"), a3, a4, 0, a5, a6, a7);

  return (int)a7;
}

- (int)receiveVDMAttention:(void *)a3 length:(unint64_t)a4 outSop:(int *)a5 outSequence:(char *)a6 outLength:(unint64_t *)a7
{
  void *v13;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  LODWORD(a7) = objc_msgSend(v13, "receiveVDMAttentionForDevice:buffer:length:flags:outSOP:outSequence:outLength:", -[PDController address](self, "address"), a3, a4, 0, a5, a6, a7);

  return (int)a7;
}

- (int)executeIECSCommand:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  unsigned int v6;
  int v7;

  v3 = *(_QWORD *)&a3;
  if (-[PDController remote](self, "remote"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 micro_user_client](self, "micro_user_client"));
    v6 = objc_msgSend(v5, "executeIECSCommand:", v3);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    v6 = objc_msgSend(v5, "iecsCommand:forDevice:flags:", v3, -[PDController address](self, "address"), 0);
  }
  v7 = v6;

  return v7;
}

- (int)memRead:(unsigned int *)a3 atAddress:(unsigned int)a4
{
  int result;
  unsigned int v7;

  if ((a4 & 3) != 0)
  {
    printf("Error: Memory address not a multiple of 4");
    return -536870201;
  }
  else
  {
    result = -[PDController registerWrite32:atAddress:](self, "registerWrite32:atAddress:", *(_QWORD *)&a4, 9);
    if (!result)
    {
      result = -[PDControllerType1 executeIECSCommand:](self, "executeIECSCommand:", 1296387442);
      v7 = 0;
      if (!result)
      {
        result = -[PDController registerRead32:atAddress:](self, "registerRead32:atAddress:", &v7, 9);
        if (!result)
          *a3 = v7;
      }
    }
  }
  return result;
}

- (int)memWrite:(unsigned int)a3 atAddress:(unsigned int)a4
{
  int result;
  _DWORD v6[2];

  if ((a4 & 3) != 0)
  {
    printf("Error: Memory address not a multiple of 4");
    return -536870201;
  }
  else
  {
    v6[0] = a4;
    v6[1] = a3;
    result = -[PDControllerType1 registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", v6, 8, 9);
    if (!result)
      return -[PDControllerType1 executeIECSCommand:](self, "executeIECSCommand:", 1296387447);
  }
  return result;
}

- (int)i2cRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  int result;
  int v10;
  int v11;
  unsigned __int8 v12;
  int v13;

  result = -[PDController registerWrite32:atAddress:](self, "registerWrite32:atAddress:", a5 | ((_DWORD)a4 << 16), 18);
  if (!result)
  {
    result = -[PDControllerType1 executeIECSCommand:](self, "executeIECSCommand:", 1296642627);
    v13 = 0;
    if (!result)
    {
      v10 = 1000;
      while (1)
      {
        result = -[PDController registerRead32:atAddress:](self, "registerRead32:atAddress:", &v13, 18);
        v11 = result;
        v12 = BYTE2(v13);
        if (result || v13 < 0)
          break;
        usleep(0x64u);
        if (!--v10)
        {
          v12 = BYTE2(v13);
          if ((v13 & 0x80000000) == 0)
            return -536870186;
          goto LABEL_13;
        }
      }
      if (v13 >= 0)
        result = -536870186;
      if (v13 < 0 && !v11)
      {
LABEL_13:
        if (a6)
          *a6 = v12;
        return -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", a3, v12, 9);
      }
    }
  }
  return result;
}

- (int)i2cRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v6;

  v6 = 0;
  -[PDControllerType1 i2cRead:ofLength:atAddress:andOutReadLength:](self, "i2cRead:ofLength:atAddress:andOutReadLength:", a3, a4, *(_QWORD *)&a5, &v6);
  return 0;
}

- (int)i2cWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  int v6;
  int result;
  int v9;
  int v10;
  int v11;
  int v12;

  v6 = a4;
  result = -[PDControllerType1 registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", a3, a4, 9);
  if (!result)
  {
    result = -[PDController registerWrite32:atAddress:](self, "registerWrite32:atAddress:", a5 | (v6 << 8), 18);
    if (!result)
    {
      result = -[PDControllerType1 executeIECSCommand:](self, "executeIECSCommand:", 1296642627);
      v12 = 0;
      if (!result)
      {
        v9 = 1000;
        while (1)
        {
          v10 = -[PDController registerRead32:atAddress:](self, "registerRead32:atAddress:", &v12, 18);
          v11 = v12;
          if (v10 || v12 < 0)
            break;
          usleep(0x64u);
          if (!--v9)
          {
            v11 = v12;
            break;
          }
        }
        if (v11 < 0)
          return v10;
        else
          return -536870186;
      }
    }
  }
  return result;
}

- (int)i2cWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andRead:(void *)a6 ofLength:(unint64_t)a7 andOutReadLength:(unint64_t *)a8
{
  int v9;
  int v12;
  int result;
  unsigned int v15;
  int v16;
  int v17;
  unsigned __int8 v18;
  int v19;

  v9 = a7;
  v12 = a4;
  result = -[PDControllerType1 registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", a3, a4, 9);
  if (!result)
  {
    v15 = a5 & 0x7F | 0x80;
    if (a5 <= 0xFF)
      v15 = a5;
    result = -[PDController registerWrite32:atAddress:](self, "registerWrite32:atAddress:", v15 | (v12 << 8) | (v9 << 16), 18);
    if (!result)
    {
      result = -[PDControllerType1 executeIECSCommand:](self, "executeIECSCommand:", 1296642627);
      v19 = 0;
      if (!result)
      {
        v16 = 1000;
        while (1)
        {
          result = -[PDController registerRead32:atAddress:](self, "registerRead32:atAddress:", &v19, 18);
          v17 = result;
          v18 = BYTE2(v19);
          if (result || v19 < 0)
            break;
          usleep(0x64u);
          if (!--v16)
          {
            v18 = BYTE2(v19);
            if ((v19 & 0x80000000) == 0)
              return -536870186;
            goto LABEL_16;
          }
        }
        if (v19 >= 0)
          result = -536870186;
        if (v19 < 0 && !v17)
        {
LABEL_16:
          if (a8)
            *a8 = v18;
          return -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", a6, v18, 9);
        }
      }
    }
  }
  return result;
}

- (int)readDirection:(BOOL *)a3 forGPIO:(unsigned int)a4
{
  int result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  result = -[PDControllerType1 registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", &v9, 8, 9);
  if (!result)
  {
    result = -[PDControllerType1 executeIECSCommand:](self, "executeIECSCommand:", 1196443983);
    if (!result)
    {
      result = -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", &v9, 28, 9);
      if (!result)
      {
        v8 = &v10;
        if (a4 >= 0x20)
          v8 = (uint64_t *)((char *)&v10 + 4);
        *a3 = (*(_DWORD *)v8 >> (a4 & 0x1F)) & 1;
      }
    }
  }
  return result;
}

- (int)readLevel:(BOOL *)a3 forGPIO:(unsigned int)a4
{
  int result;
  uint64_t *v8;
  _QWORD v9[2];
  uint64_t v10;

  v9[0] = 0;
  result = -[PDControllerType1 registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", v9, 8, 9);
  if (!result)
  {
    result = -[PDControllerType1 executeIECSCommand:](self, "executeIECSCommand:", 1196443983);
    if (!result)
    {
      result = -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", v9, 28, 9);
      if (!result)
      {
        v8 = &v10;
        if (a4 >= 0x20)
          v8 = (uint64_t *)((char *)&v10 + 4);
        *a3 = (*(_DWORD *)v8 >> (a4 & 0x1F)) & 1;
      }
    }
  }
  return result;
}

- (id)stateStringForGPIOFromFile:(id)a3
{
  id v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  const __CFString *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "characterAtIndex:", 0);
  v5 = objc_msgSend(v3, "characterAtIndex:", 1);

  v6 = v5 != 49;
  v7 = v4 != 49;
  if (v4 == 49 && v5 == 49)
    return CFSTR("Drive High");
  if (v5 == 49)
    v7 = 1;
  if (v4 == 49)
    v6 = 1;
  if (v5 == 49 || v4 == 49)
    v10 = CFSTR("GPIO STATE ERROR");
  else
    v10 = CFSTR("Input Low");
  if (!v6)
    v10 = CFSTR("Input High");
  if (v7)
    return (id)v10;
  else
    return CFSTR("Drive Low");
}

- (id)stateStringForGPIO:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v5;
  __CFString *v7;
  const __CFString *v8;
  __int16 v9;

  v3 = *(_QWORD *)&a3;
  v9 = 0;
  if (-[PDControllerType1 readDirection:forGPIO:](self, "readDirection:forGPIO:", (char *)&v9 + 1, *(_QWORD *)&a3)
    || -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v9, v3))
  {
    v5 = CFSTR("GPIO STATE ERROR");
  }
  else
  {
    if (HIBYTE(v9))
      v7 = CFSTR("1");
    else
      v7 = CFSTR("0");
    if ((_BYTE)v9)
      v8 = CFSTR("1");
    else
      v8 = CFSTR("0");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v8));
  }
  return v5;
}

- (int)expanderRegisterRead16:(unsigned __int16 *)a3 atOffset:(unsigned __int8)a4
{
  int result;
  uint64_t v6;
  unsigned __int8 v7;

  v7 = a4;
  v6 = 0;
  result = -[PDControllerType1 i2cWrite:ofLength:atAddress:andRead:ofLength:andOutReadLength:](self, "i2cWrite:ofLength:atAddress:andRead:ofLength:andOutReadLength:", &v7, 1, 32, a3, 2, &v6);
  if (v6 != 2 && result == 0)
    return -536870169;
  return result;
}

- (int)readDirection:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4
{
  unint64_t v4;
  int result;
  __int16 v7;

  v4 = *(_QWORD *)&a4;
  v7 = 0;
  result = -[PDControllerType1 expanderRegisterRead16:atOffset:](self, "expanderRegisterRead16:atOffset:", &v7, 6);
  if (!result)
    *a3 = ((*(unsigned __int8 *)((unint64_t)&v7 | (v4 >> 4) & 1) >> (v4 & 0xF)) & 1) == 0;
  return result;
}

- (int)readOutputLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4
{
  unint64_t v4;
  int result;
  __int16 v7;

  v4 = *(_QWORD *)&a4;
  v7 = 0;
  result = -[PDControllerType1 expanderRegisterRead16:atOffset:](self, "expanderRegisterRead16:atOffset:", &v7, 2);
  if (!result)
    *a3 = (*(unsigned __int8 *)((unint64_t)&v7 | (v4 >> 4) & 1) >> (v4 & 0xF)) & 1;
  return result;
}

- (int)readInputLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4
{
  unint64_t v4;
  int result;
  __int16 v7;

  v4 = *(_QWORD *)&a4;
  v7 = 0;
  result = -[PDControllerType1 expanderRegisterRead16:atOffset:](self, "expanderRegisterRead16:atOffset:", &v7, 0);
  if (!result)
    *a3 = (*(unsigned __int8 *)((unint64_t)&v7 | (v4 >> 4) & 1) >> (v4 & 0xF)) & 1;
  return result;
}

- (int)readLevel:(BOOL *)a3 forExpanderGPIO:(unsigned int)a4
{
  uint64_t v4;
  int result;
  char v8;

  v4 = *(_QWORD *)&a4;
  v8 = 0;
  result = -[PDControllerType1 readDirection:forExpanderGPIO:](self, "readDirection:forExpanderGPIO:", &v8);
  if (!result)
  {
    if (v8)
      return -[PDControllerType1 readOutputLevel:forExpanderGPIO:](self, "readOutputLevel:forExpanderGPIO:", a3, v4);
    else
      return -[PDControllerType1 readInputLevel:forExpanderGPIO:](self, "readInputLevel:forExpanderGPIO:", a3, v4);
  }
  return result;
}

- (id)stateStringForExpanderGPIO:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v5;
  __CFString *v7;
  const __CFString *v8;
  __int16 v9;

  v3 = *(_QWORD *)&a3;
  v9 = 0;
  if (-[PDControllerType1 readDirection:forExpanderGPIO:](self, "readDirection:forExpanderGPIO:", (char *)&v9 + 1, *(_QWORD *)&a3))
  {
    goto LABEL_4;
  }
  if (HIBYTE(v9))
  {
    if (-[PDControllerType1 readOutputLevel:forExpanderGPIO:](self, "readOutputLevel:forExpanderGPIO:", &v9, v3))
    {
LABEL_4:
      v5 = CFSTR("GPIO STATE ERROR");
      return v5;
    }
  }
  else if (-[PDControllerType1 readInputLevel:forExpanderGPIO:](self, "readInputLevel:forExpanderGPIO:", &v9, v3))
  {
    goto LABEL_4;
  }
  if (HIBYTE(v9))
    v7 = CFSTR("1");
  else
    v7 = CFSTR("0");
  if ((_BYTE)v9)
    v8 = CFSTR("1");
  else
    v8 = CFSTR("0");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v8));
  return v5;
}

- (id)registerFormatterBusPowerWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;
  const __CFString *v5;
  unint64_t v7;

  if (a4 == 1)
  {
    if (*(unsigned __int8 *)a3 - 1 <= 0xFD)
    {
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%02X"), *(unsigned __int8 *)a3);
      return (id)objc_claimAutoreleasedReturnValue(v4);
    }
    goto LABEL_7;
  }
  if (a4 != 2)
  {
    v7 = a4;
    v5 = CFSTR("ERROR: length %lld != 2 or 1");
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)a3 - 1 > 0xFFFD)
  {
LABEL_7:
    v5 = CFSTR("No");
LABEL_9:
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);
    return (id)objc_claimAutoreleasedReturnValue(v4);
  }
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%04X"), *(unsigned __int16 *)a3);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterPDControllerType1StateWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v12;
  char v13;
  _QWORD v14[13];
  _QWORD v15[13];

  v13 = 0;
  -[PDControllerType1 isPDControllerType1:](self, "isPDControllerType1:", &v13);
  if (a4 != 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4));
  v6 = *(unsigned int *)a3;
  v14[0] = &off_10001B048;
  v14[1] = &off_10001B060;
  v15[0] = CFSTR("Disabled");
  v15[1] = CFSTR("Unattached UFP");
  v15[2] = CFSTR("Unattached DFP");
  v14[2] = &off_10001B078;
  v14[3] = &off_10001B090;
  v15[3] = CFSTR("Audio Accessory");
  v15[4] = CFSTR("Debug Accessory");
  v14[4] = &off_10001B0A8;
  v14[5] = &off_10001B0C0;
  v15[5] = CFSTR("Attached UFP");
  v15[6] = CFSTR("Lock UFP");
  v14[6] = &off_10001B0D8;
  v14[7] = &off_10001B0F0;
  v15[7] = CFSTR("Attached DFP / DRP Wait");
  v15[8] = CFSTR("Attached DFP");
  v14[8] = &off_10001B108;
  v14[9] = &off_10001B120;
  v15[9] = CFSTR("Accessory Present");
  v15[10] = CFSTR("Powered Accessory");
  v14[10] = &off_10001B138;
  v14[11] = &off_10001B150;
  v14[12] = &off_10001B168;
  v15[11] = CFSTR("Unsupported Accessory");
  v15[12] = CFSTR("Reorient");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 13));
  if (v13)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

    if (v9)
      v10 = v9;
    else
      v10 = CFSTR("Unknown");

  }
  else
  {
    v10 = CFSTR("Unknown");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%d) %@"), v6, v10));

  return v12;
}

- (id)stringForTitle:(id)a3 valueString:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%-22s %@"), objc_msgSend(v5, "UTF8String"), v6));

  return v7;
}

- (void)printStateWithTitle:(id)a3 andDescription:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
        if (v9)
        {
          -[PDController printRegisterDescription:](self, "printRegisterDescription:", v10);
          printf("%-27s %s\n", ", (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
        }
        else
        {
          printf("%-27s %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
        }

        ++v9;
      }
      while ((unint64_t)objc_msgSend(v8, "count") > v9);
    }

  }
  else
  {
    v11 = objc_retainAutorelease(v16);
    v12 = v6;
    v13 = (const char *)objc_msgSend(v11, "UTF8String");
    v14 = objc_retainAutorelease(v12);
    v15 = (const char *)objc_msgSend(v14, "UTF8String");

    printf("%-27s %s\n", v13, v15);
  }

}

- (int)printCCRole
{
  unsigned int v3;
  int v4;
  __CFString *v5;
  __CFString *v7;
  const __CFString *v8;
  __int16 v9;

  v9 = 0;
  v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", (char *)&v9 + 1, 53);
  if (v3)
  {
    v4 = v3;
LABEL_4:
    v5 = &stru_1000186C8;
    goto LABEL_5;
  }
  v4 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v9, 54);
  if (v4)
    goto LABEL_4;
  if (HIBYTE(v9))
    v7 = CFSTR("1");
  else
    v7 = CFSTR("0");
  if ((_BYTE)v9)
    v8 = CFSTR("1");
  else
    v8 = CFSTR("0");
  v5 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v8)));
  printf("%s\t%s\t%s\n", "0xff01", "0x01", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
LABEL_5:

  return v4;
}

- (int)printCCState
{
  int v3;
  __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  unsigned int v21;
  char v22;
  unsigned int v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;

  v26 = 0;
  v25 = 0;
  v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", (char *)&v26 + 1, 20);
  if (v3
    || (v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v26, 21)) != 0
    || (v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", (char *)&v25 + 1, 22)) != 0)
  {
    v24 = 0;
    v23 = 0;
LABEL_5:
    v22 = 0;
LABEL_6:
    v21 = 0;
    goto LABEL_7;
  }
  v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v25, 23);
  v24 = 0;
  v23 = 0;
  if (v3)
    goto LABEL_5;
  v3 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", (char *)&v24 + 1, 21);
  if (v3)
    goto LABEL_5;
  v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v24, 17);
  if (v3)
    goto LABEL_5;
  v3 = -[PDControllerType1 getPDMode:](self, "getPDMode:", &v23);
  v22 = 0;
  if (v3)
    goto LABEL_6;
  v3 = -[PDControllerType1 isVCONNOn:](self, "isVCONNOn:", &v22);
  v21 = 0;
  if (!v3)
    v3 = -[PDControllerType1 getCCRole:](self, "getCCRole:", &v21);
LABEL_7:
  if (HIBYTE(v26))
    v4 = CFSTR("1");
  else
    v4 = CFSTR("0");
  if ((_BYTE)v26)
    v5 = CFSTR("1");
  else
    v5 = CFSTR("0");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v5));
  v7 = v6;
  if (HIBYTE(v25))
    v8 = CFSTR("1");
  else
    v8 = CFSTR("0");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", v8));

  if ((_BYTE)v25)
    v10 = CFSTR("1");
  else
    v10 = CFSTR("0");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v10));

  if (HIBYTE(v24))
    v12 = CFSTR("1");
  else
    v12 = CFSTR("0");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", v12));

  if ((_BYTE)v24)
    v14 = CFSTR("1");
  else
    v14 = CFSTR("0");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("%i"), v23));
  if (v22)
    v17 = CFSTR("1");
  else
    v17 = CFSTR("0");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("%i"), v21));
  if (!v3)
    printf("%s\t%s\t%s\n", "0xff02", "0x01", (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));

  return v3;
}

- (int)printVBUSState
{
  unsigned int v3;
  int v4;
  __CFString *v5;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  char v13;
  __int16 v14;

  v14 = 0;
  v13 = 0;
  v3 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", (char *)&v14 + 1, 22);
  if (v3
    || (v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v14, 46)) != 0
    || (v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v13, 52)) != 0)
  {
    v4 = v3;
    v5 = &stru_1000186C8;
  }
  else
  {
    if (HIBYTE(v14))
      v7 = CFSTR("1");
    else
      v7 = CFSTR("0");
    if ((_BYTE)v14)
      v8 = CFSTR("1");
    else
      v8 = CFSTR("0");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v8));
    v10 = v9;
    if (v13)
      v11 = CFSTR("1");
    else
      v11 = CFSTR("0");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v11));

    v5 = objc_retainAutorelease(v12);
    printf("%s\t%s\t%s\n", "0xff03", "0x01", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
    v4 = 0;
  }

  return v4;
}

- (int)printVCONNState
{
  unsigned int v3;
  int v4;
  __CFString *v5;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  char v13;
  __int16 v14;

  v14 = 0;
  v13 = 0;
  v3 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", (char *)&v14 + 1, 22);
  if (v3
    || (v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v14, 47)) != 0
    || (v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v13, 52)) != 0)
  {
    v4 = v3;
    v5 = &stru_1000186C8;
  }
  else
  {
    if (HIBYTE(v14))
      v7 = CFSTR("1");
    else
      v7 = CFSTR("0");
    if ((_BYTE)v14)
      v8 = CFSTR("1");
    else
      v8 = CFSTR("0");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v8));
    v10 = v9;
    if (v13)
      v11 = CFSTR("1");
    else
      v11 = CFSTR("0");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v11));

    v5 = objc_retainAutorelease(v12);
    printf("%s\t%s\t%s\n", "0xff04", "0x01", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
    v4 = 0;
  }

  return v4;
}

- (int)printVDETState
{
  int v3;
  const __CFString *v4;
  char v6;

  v6 = 0;
  v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v6, 16);
  if (!v3)
  {
    if (v6)
      v4 = CFSTR("VBUS not present");
    else
      v4 = CFSTR("VBUS present");
    -[PDControllerType1 printStateWithTitle:andDescription:](self, "printStateWithTitle:andDescription:", CFSTR("VDET"), v4);
  }
  return v3;
}

- (int)printSSState
{
  unsigned int v3;
  int v4;
  __CFString *v5;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v18 = 0;
  v3 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v18, 18);
  v17 = 0;
  if (v3)
    goto LABEL_2;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v17, 19);
  v16 = 0;
  if (v4)
    goto LABEL_4;
  v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v16, 58);
  v15 = 0;
  if (v3 || (v3 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v15, 20)) != 0)
  {
LABEL_2:
    v4 = v3;
LABEL_4:
    v5 = &stru_1000186C8;
    goto LABEL_5;
  }
  if (v18)
    v7 = CFSTR("1");
  else
    v7 = CFSTR("0");
  if (v17)
    v8 = CFSTR("1");
  else
    v8 = CFSTR("0");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v8));
  v10 = v9;
  if (v16)
    v11 = CFSTR("1");
  else
    v11 = CFSTR("0");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v11));

  if (v15)
    v13 = CFSTR("1");
  else
    v13 = CFSTR("0");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v13));

  v5 = objc_retainAutorelease(v14);
  printf("%s\t%s\t%s\n", "0xff06", "0x01", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
  v4 = 0;
LABEL_5:

  return v4;
}

- (int)printDXState
{
  unsigned int v3;
  int v4;
  __CFString *v5;
  unsigned int v7;
  char *v8;
  int v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;

  v41 = 0;
  v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v41, 59);
  v40 = 0;
  if (v3)
  {
    v4 = v3;
    v39 = 0;
LABEL_4:
    v38 = 0;
LABEL_5:
    v37 = 0;
LABEL_6:
    v36 = 0;
LABEL_7:
    v35 = 0;
LABEL_8:
    v34 = 0;
LABEL_9:
    v5 = &stru_1000186C8;
    goto LABEL_10;
  }
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v40, 0);
  v39 = 0;
  if (v4)
    goto LABEL_4;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v39, 1);
  v38 = 0;
  if (v4)
    goto LABEL_5;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v38, 16);
  v37 = 0;
  if (v4)
    goto LABEL_6;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v37, 2);
  v36 = 0;
  if (v4)
    goto LABEL_7;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v36, 3);
  v35 = 0;
  if (v4)
    goto LABEL_8;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v35, 4);
  v34 = 0;
  if (v4)
    goto LABEL_9;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v34, 5);
  v33 = 0;
  if (v4)
    goto LABEL_9;
  v7 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v33, 17);
  v32 = 0;
  if (v7 || (v7 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v32, 6)) != 0)
  {
    v4 = v7;
    goto LABEL_9;
  }
  v8 = &v33;
  if (!v36)
    v8 = &v32;
  v9 = *v8;
  if (v41)
    v10 = CFSTR("1");
  else
    v10 = CFSTR("0");
  if (v40)
    v11 = CFSTR("1");
  else
    v11 = CFSTR("0");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v11));
  v13 = v12;
  if (v39)
    v14 = CFSTR("1");
  else
    v14 = CFSTR("0");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v14));

  if (v38)
    v16 = CFSTR("1");
  else
    v16 = CFSTR("0");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", v16));

  if (v37)
    v18 = CFSTR("1");
  else
    v18 = CFSTR("0");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", v18));

  if (v36)
    v20 = CFSTR("1");
  else
    v20 = CFSTR("0");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", v20));

  if (v35)
    v22 = CFSTR("1");
  else
    v22 = CFSTR("0");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", v22));

  if (v34)
    v24 = CFSTR("1");
  else
    v24 = CFSTR("0");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingString:", v24));

  if (v33)
    v26 = CFSTR("1");
  else
    v26 = CFSTR("0");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", v26));

  if (v32)
    v28 = CFSTR("1");
  else
    v28 = CFSTR("0");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", v28));

  if (v9)
    v30 = CFSTR("1");
  else
    v30 = CFSTR("0");
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", v30));

  v5 = objc_retainAutorelease(v31);
  printf("%s\t%s\t%s\n", "0xff07", "0x01", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
  v4 = 0;
LABEL_10:

  return v4;
}

- (int)printRFUState
{
  unsigned int v3;
  int v4;
  __CFString *v5;
  unsigned int v7;
  __CFString *v8;
  char *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;

  v32 = 0;
  v3 = -[PDControllerType1 readLevel:forGPIO:](self, "readLevel:forGPIO:", &v32, 60);
  v31 = 0;
  if (v3)
  {
    v4 = v3;
    v30 = 0;
LABEL_4:
    v29 = 0;
LABEL_5:
    v28 = 0;
LABEL_6:
    v5 = &stru_1000186C8;
    goto LABEL_7;
  }
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v31, 3);
  v30 = 0;
  if (v4)
    goto LABEL_4;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v30, 4);
  v29 = 0;
  if (v4)
    goto LABEL_5;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v29, 5);
  v28 = 0;
  if (v4)
    goto LABEL_6;
  v4 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v28, 17);
  v27 = 0;
  if (v4)
    goto LABEL_6;
  v7 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v27, 6);
  v26 = 0;
  if (v7 || (v7 = -[PDControllerType1 readLevel:forExpanderGPIO:](self, "readLevel:forExpanderGPIO:", &v26, 7)) != 0)
  {
    v4 = v7;
    goto LABEL_6;
  }
  if (v32)
    v8 = CFSTR("1");
  else
    v8 = CFSTR("0");
  v9 = &v27;
  if (!v31)
    v9 = &v28;
  v10 = *v9;
  if (v31)
    v11 = CFSTR("1");
  else
    v11 = CFSTR("0");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v11));
  v13 = v12;
  if (v30)
    v14 = CFSTR("1");
  else
    v14 = CFSTR("0");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v14));

  if (v29)
    v16 = CFSTR("1");
  else
    v16 = CFSTR("0");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", v16));

  if (v28)
    v18 = CFSTR("1");
  else
    v18 = CFSTR("0");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", v18));

  if (v27)
    v20 = CFSTR("1");
  else
    v20 = CFSTR("0");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", v20));

  if (v26)
    v22 = CFSTR("1");
  else
    v22 = CFSTR("0");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", v22));

  if (v10)
    v24 = CFSTR("1");
  else
    v24 = CFSTR("0");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingString:", v24));

  v5 = objc_retainAutorelease(v25);
  printf("%s\t%s\t%s\n", "0xff08", "0x01", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
  v4 = 0;
LABEL_7:

  return v4;
}

- (int)printROMInfo
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  unsigned int v7;
  int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&off_10001CCF8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(&off_10001CCF8);
      v7 = -[PDController printCommand:](self, "printCommand:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "unsignedIntValue"));
    }
    v8 = v7;
    v4 = objc_msgSend(&off_10001CCF8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v8;
}

- (void)printGPIOWithPort:(id)a3 pin:(id)a4 title:(id)a5 andState:(id)a6
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;

  v8 = objc_retainAutorelease(a3);
  v9 = a6;
  v10 = a4;
  v11 = (const char *)objc_msgSend(v8, "UTF8String");
  v12 = objc_retainAutorelease(v10);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  v14 = objc_retainAutorelease(v9);
  v15 = (const char *)objc_msgSend(v14, "UTF8String");

  printf("%s\t%s\t%s\n", v11, v13, v15);
}

- (int)printGPIOState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 gpioMap](self, "gpioMap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

  puts("GPIOs");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(&off_10001CD10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v17 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v17)
          objc_enumerationMutation(&off_10001CD10);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "unsignedCharValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v10 >> 5));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v10 & 0x1F));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 gpioMap](self, "gpioMap"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v9));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 stateStringForGPIO:](self, "stateStringForGPIO:", v10));
        -[PDControllerType1 printGPIOWithPort:pin:title:andState:](self, "printGPIOWithPort:pin:title:andState:", v11, v12, v14, v15);

      }
      v7 = objc_msgSend(&off_10001CD10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  return 0;
}

- (int)printExpanderGPIOState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 expanderGpioMap](self, "expanderGpioMap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

  puts("Expander GPIOs");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(&off_10001CD28, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v17 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v17)
          objc_enumerationMutation(&off_10001CD28);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "unsignedCharValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), (v10 >> 4) & 1));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v10 & 0xF));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 expanderGpioMap](self, "expanderGpioMap"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v9));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType1 stateStringForExpanderGPIO:](self, "stateStringForExpanderGPIO:", v10));
        -[PDControllerType1 printGPIOWithPort:pin:title:andState:](self, "printGPIOWithPort:pin:title:andState:", v11, v12, v14, v15);

      }
      v7 = objc_msgSend(&off_10001CD28, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  return 0;
}

- (int)printIECSStandardInfo
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  puts("Registers");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(&off_10001CD40, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(&off_10001CD40);
      LODWORD(v3) = -[PDController printRegister:](self, "printRegister:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "unsignedCharValue"));
      if ((_DWORD)v3)
        break;
      if (v4 == (id)++v6)
      {
        v3 = objc_msgSend(&off_10001CD40, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v4 = v3;
        if (v3)
          goto LABEL_3;
        return (int)v3;
      }
    }
  }
  return (int)v3;
}

- (int)printIECSPDControllerType1SpecificInfo
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  puts("Device Registers");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(&off_10001CD58, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(&off_10001CD58);
      LODWORD(v3) = -[PDController printRegister:](self, "printRegister:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "unsignedCharValue"));
      if ((_DWORD)v3)
        break;
      if (v4 == (id)++v6)
      {
        v3 = objc_msgSend(&off_10001CD58, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v4 = v3;
        if (v3)
          goto LABEL_3;
        return (int)v3;
      }
    }
  }
  return (int)v3;
}

- (int)printIECSPDControllerType3SpecificInfo
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  puts("Device Registers");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(&off_10001CD70, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(&off_10001CD70);
      LODWORD(v3) = -[PDController printRegister:](self, "printRegister:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "unsignedCharValue"));
      if ((_DWORD)v3)
        break;
      if (v4 == (id)++v6)
      {
        v3 = objc_msgSend(&off_10001CD70, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v4 = v3;
        if (v3)
          goto LABEL_3;
        return (int)v3;
      }
    }
  }
  return (int)v3;
}

- (int)printUSBCInfo
{
  int result;

  puts("USBC Information");
  result = -[PDControllerType1 printCCRole](self, "printCCRole");
  if (!result)
  {
    result = -[PDControllerType1 printCCState](self, "printCCState");
    if (!result)
    {
      result = -[PDControllerType1 printVBUSState](self, "printVBUSState");
      if (!result)
      {
        result = -[PDControllerType1 printVCONNState](self, "printVCONNState");
        if (!result)
        {
          result = -[PDControllerType1 printVDETState](self, "printVDETState");
          if (!result)
          {
            result = -[PDControllerType1 printSSState](self, "printSSState");
            if (!result)
            {
              result = -[PDControllerType1 printDXState](self, "printDXState");
              if (!result)
                return -[PDControllerType1 printRFUState](self, "printRFUState");
            }
          }
        }
      }
    }
  }
  return result;
}

- (int)printInfo
{
  int result;
  BOOL v4;
  unsigned __int8 v5;
  unsigned __int8 v6;

  printf("Apple HPM at 0x%02x :\n\n", -[PDController address](self, "address"));
  result = -[PDControllerType1 printIECSStandardInfo](self, "printIECSStandardInfo");
  v6 = 0;
  if (result)
  {
    v5 = 0;
  }
  else
  {
    result = -[PDControllerType1 isPDControllerType1:](self, "isPDControllerType1:", &v6);
    v5 = 0;
    if (!result)
      result = -[PDControllerType1 isPDControllerType3HPM:](self, "isPDControllerType3HPM:", &v5);
    if (v6)
    {
      if (result)
        goto LABEL_3;
      putchar(10);
      result = -[PDControllerType1 printIECSPDControllerType1SpecificInfo](self, "printIECSPDControllerType1SpecificInfo");
      if (result)
        goto LABEL_3;
      putchar(10);
      result = -[PDControllerType1 printUSBCInfo](self, "printUSBCInfo");
    }
    if (v5 && !result)
    {
      putchar(10);
      result = -[PDControllerType1 printIECSPDControllerType3SpecificInfo](self, "printIECSPDControllerType3SpecificInfo");
    }
  }
LABEL_3:
  if (v6 | v5)
    v4 = result == 0;
  else
    v4 = 0;
  if (v4)
  {
    putchar(10);
    return -[PDControllerType1 printROMInfo](self, "printROMInfo");
  }
  return result;
}

- (int)printAll
{
  int v3;
  BOOL v4;
  char v6;
  char v7;

  v7 = 0;
  v3 = -[PDControllerType1 isPDControllerType1:](self, "isPDControllerType1:", &v7);
  v6 = 0;
  if (!v3)
    v3 = -[PDControllerType1 isPDControllerType3HPM:](self, "isPDControllerType3HPM:", &v6);
  -[PDControllerType1 printInfo](self, "printInfo");
  if (v7)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
  {
    putchar(10);
    v3 = -[PDControllerType1 printGPIOState](self, "printGPIOState");
    if (!v3)
    {
      putchar(10);
      return -[PDControllerType1 printExpanderGPIOState](self, "printExpanderGPIOState");
    }
  }
  return v3;
}

- (PDControllerType3)micro_user_client
{
  return self->_micro_user_client;
}

- (void)setMicro_user_client:(id)a3
{
  objc_storeStrong((id *)&self->_micro_user_client, a3);
}

- (NSDictionary)gpioMap
{
  return self->_gpioMap;
}

- (void)setGpioMap:(id)a3
{
  objc_storeStrong((id *)&self->_gpioMap, a3);
}

- (NSDictionary)expanderGpioMap
{
  return self->_expanderGpioMap;
}

- (void)setExpanderGpioMap:(id)a3
{
  objc_storeStrong((id *)&self->_expanderGpioMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expanderGpioMap, 0);
  objc_storeStrong((id *)&self->_gpioMap, 0);
  objc_storeStrong((id *)&self->_micro_user_client, 0);
}

@end
