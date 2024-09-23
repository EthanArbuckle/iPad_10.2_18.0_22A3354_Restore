@implementation PDControllerType4

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithAddress:userClient:", v4, v6);

  return v7;
}

- (BOOL)supportsRemote
{
  return 1;
}

+ (id)createForDecode
{
  return 0;
}

- (PDControllerType4)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  PDControllerType4 *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDControllerType4;
  v4 = -[PDControllerType2 initWithAddress:userClient:](&v6, "initWithAddress:userClient:", a3, a4);
  -[PDControllerType4 setDPMrConfigs](v4, "setDPMrConfigs");
  return v4;
}

- (int)printIECSStandardInfo
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

  puts("Reg Name                   Value");
  puts("--------------------------------------");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&off_10001CD88, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(&off_10001CD88);
      v7 = -[PDController printRegister:](self, "printRegister:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "unsignedCharValue"));
    }
    v8 = v7;
    v4 = objc_msgSend(&off_10001CD88, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v8;
}

- (int)printIECSAceSpecificInfo
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

  puts("Device Specific Registers");
  puts("-------------------------");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&off_10001CDA0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(&off_10001CDA0);
      v7 = -[PDController printRegister:](self, "printRegister:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "unsignedCharValue"));
    }
    v8 = v7;
    v4 = objc_msgSend(&off_10001CDA0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v8;
}

- (int)printTitle
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  v4 = objc_msgSend(v3, "routerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  printf("HPM at RID 0x%x Route 0x%llx Address 0x%02x :\n", v4, objc_msgSend(v5, "routeString"), -[PDController address](self, "address"));

  return 0;
}

- (int)printInfo
{
  int result;
  id v4;

  result = -[PDControllerType4 printTitle](self, "printTitle");
  if (!result)
  {
    putchar(10);
    result = -[PDControllerType4 printIECSStandardInfo](self, "printIECSStandardInfo");
    if (!result)
    {
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PDControllerType2 readFullVersionWithConfig](self, "readFullVersionWithConfig")));
      printf("0x0f %-22s %s\n", "FW Versions", (const char *)objc_msgSend(v4, "UTF8String"));

      putchar(10);
      return -[PDControllerType4 printIECSAceSpecificInfo](self, "printIECSAceSpecificInfo");
    }
  }
  return result;
}

- (int)printAll
{
  int result;
  unsigned __int8 v4;
  __int128 v5;
  _OWORD v6[4];

  result = -[PDControllerType4 printTitle](self, "printTitle");
  if (!result)
  {
    putchar(10);
    v4 = 0;
    while (1)
    {
      result = -[PDController printRegister:](self, "printRegister:", v4);
      if (result)
        break;
      if ((++v4 & 0x80) != 0)
      {
        *(_QWORD *)&v5 = 0xFEFEFEFEFEFEFEFELL;
        *((_QWORD *)&v5 + 1) = 0xFEFEFEFEFEFEFEFELL;
        v6[2] = v5;
        v6[3] = v5;
        v6[0] = v5;
        v6[1] = v5;
        -[PDController printCommand:withWriteData:withWriteLength:](self, "printCommand:withWriteData:withWriteLength:", 1212377195, v6, 64);
        LODWORD(v6[0]) = 0;
        -[PDController printCommand:withWriteData:withWriteLength:](self, "printCommand:withWriteData:withWriteLength:", 1094992754, v6, 4);
        -[PDControllerType4 printAllDPMrSubcommands](self, "printAllDPMrSubcommands");
        -[PDControllerType4 printTBRrIfIntelRetimerPresent](self, "printTBRrIfIntelRetimerPresent");
        return 0;
      }
    }
  }
  return result;
}

- (int)printTBRrIfIntelRetimerPresent
{
  int result;
  __int16 v5;
  char v6;
  unint64_t v7;
  _BYTE v8[62];
  char v9;

  v7 = 0;
  result = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v8, 64, 41, &v7);
  if (!result)
  {
    result = -536870160;
    if (v7 >= 0x3F)
    {
      if ((v9 & 0xF) != 0 && (v9 & 0xF) != 14)
      {
        v6 = 4;
        v5 = 48;
        return -[PDController printCommand:withWriteData:withWriteLength:](self, "printCommand:withWriteData:withWriteLength:", 1413632626, &v5, 3);
      }
    }
    else
    {
      return -536870212;
    }
  }
  return result;
}

- (int)printAllDPMrSubcommands
{
  char *v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int16 v17;
  void *v18;
  void *v19;
  id obj;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];

  v27 = 0;
  v3 = (char *)malloc_type_malloc(0x40uLL, 0x8C4AEE29uLL);
  if (v3)
  {
    v4 = v3;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 41, &v27);
    v22 = *(unsigned __int16 *)(v4 + 61);
    free(v4);
  }
  else
  {
    v22 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mask")));
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v9));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("match")));
        v17 = (unsigned __int16)objc_msgSend(v16, "unsignedIntegerValue");

        if ((v22 & v13) == v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrConfigs](self, "dpmrConfigs"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v9));
          -[PDControllerType4 printDPMrSubCommand:withDeviceConfig:](self, "printDPMrSubCommand:withDeviceConfig:", v9, v19);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  return 0;
}

- (unsigned)majorVersionNumber
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int16 v5;

  v3 = (unsigned __int8 *)malloc_type_malloc(4uLL, 0x20855C37uLL);
  if (!v3)
    return 0;
  v4 = v3;
  -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", v3, 4, 15);
  v5 = v4[2];
  free(v4);
  return v5;
}

- (int)dataBuffer:(char *)a3 fromHexString:(id)a4 ofLengthString:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v16;
  unsigned int v17;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", a5));
  v17 = 0;
  objc_msgSend(v8, "scanHexInt:", &v17);
  if (v7)
  {
    v9 = (unint64_t)objc_msgSend(v7, "length");
    if (v17 == v9 >> 1 && v17 != 0)
    {
      v11 = 0;
      v12 = 0;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v11, 2));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v13));
        v16 = 0;
        objc_msgSend(v14, "scanHexInt:", &v16);
        a3[v12] = v16;

        ++v12;
        v11 += 2;
      }
      while (v12 < v17);
    }
  }

  return 0;
}

- (int)printPDStateHistory
{
  void *v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v22;
  void *v23;
  int v24;
  unsigned __int16 v25;
  int v26;
  int v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = malloc_type_malloc(0x40uLL, 0x6652A7D5uLL);
  -[PDControllerType4 majorVersionNumber](self, "majorVersionNumber");
  v5 = 0;
  v24 = 0;
  v27 = 1346655092;
  LOBYTE(v6) = 1;
  v26 = 1;
  if (v4)
    v7 = 0;
  else
    v7 = -536870211;
  while (2)
  {
    if (!v7)
    {
      v8 = -[PDController registerWrite32:atAddress:](self, "registerWrite32:atAddress:", 1, 9);
      if (v8
        || (v8 = -[PDController executeIECSCommand:](self, "executeIECSCommand:", 1346655092)) != 0
        || (v8 = -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", v4, 64, 9)) != 0)
      {
        v7 = v8;
      }
      else
      {
        LODWORD(v22) = 4194368;
        v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v26, 0, v4, 0, v22, 10);
        if (!v7)
        {
          v5 = *(unsigned __int16 *)v4;
          LOBYTE(v6) = v4[2];
        }
      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", CFSTR("PDSt(0)"), v10);

    if (v6 <= 4u)
      v6 = 4;
    else
      v6 = v6;
    v11 = v6 + 2;
    v25 = 2;
    do
    {
      while (1)
      {
        if (!v7)
        {
          LODWORD(v22) = 4194368;
          v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v25, 0, v4, 0, v22, 10);
          if (!v7)
            break;
        }
        if (v11 <= ++v25)
          goto LABEL_25;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 64));
      objc_msgSend(v3, "addObjectsFromArray:", v12);

      v7 = 0;
      ++v25;
    }
    while (v11 > v25);
    LODWORD(v22) = 4194368;
    v13 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v26, 0, v4, 0, v22, 10);
    if (v13)
    {
      v7 = v13;
LABEL_25:
      if (v4)
        free(v4);
      goto LABEL_36;
    }
    if (*(unsigned __int16 *)v4 == (_DWORD)v5)
    {
      v14 = v3;
    }
    else
    {
      objc_msgSend(v23, "addObjectsFromArray:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

      ++v24;
      v15 = *(unsigned __int16 *)v4;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PDSt mismatch %d"), v24));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start ptr = 0x%04x | End ptr = 0x%04x"), v5, v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v16, v17));
      objc_msgSend(v23, "addObject:", v18);

      if (v24 < 5u)
      {

        v7 = 0;
        v3 = v14;
        continue;
      }
      objc_msgSend(v14, "addObjectsFromArray:", v23);

    }
    break;
  }
  free(v4);
  if (objc_msgSend(v14, "count"))
  {
    v19 = 0;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v19));
      if (v19)
        -[PDController printRegisterDescription:](self, "printRegisterDescription:", v20);
      else
        -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", CFSTR("'PDSt'"), v20);

      ++v19;
    }
    while ((unint64_t)objc_msgSend(v14, "count") > v19);
  }
  v7 = 0;
  v3 = v14;
LABEL_36:

  return v7;
}

- (int)printDBStateHistory
{
  void *v3;
  unsigned __int8 *v4;
  unsigned int v5;
  int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unsigned __int16 i;
  int v18;
  int v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0;
  v19 = 1145197428;
  v4 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0x25D3EF17uLL);
  -[PDControllerType4 majorVersionNumber](self, "majorVersionNumber");
  if (v4)
  {
    LODWORD(v16) = 4194368;
    v5 = 1;
    v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v19, &v18, 0, v4, 0, v16, 10);
    if (!v6)
      v5 = v4[2];
  }
  else
  {
    v6 = -536870211;
    v5 = 1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 8));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
  -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", CFSTR("DBSt(0)"), v8);

  if (v5 <= 4)
    v9 = 4;
  else
    v9 = v5;
  for (i = 1; i <= v9; ++i)
  {
    while (1)
    {
      if (!v6)
      {
        LODWORD(v16) = 4194368;
        v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v19, &i, 0, v4, 0, v16, 10);
        if (!v6)
          break;
      }
      if (v9 < ++i)
        goto LABEL_15;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 64));
    objc_msgSend(v3, "addObjectsFromArray:", v10);

    v6 = 0;
  }
  LODWORD(v16) = 4194368;
  v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v19, &v18, 0, v4, 0, v16, 10);
  if (v6)
  {
LABEL_15:
    if (!v4)
      goto LABEL_17;
    goto LABEL_16;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
  -[PDController printRegisterDescription:](self, "printRegisterDescription:", v13);

  if (objc_msgSend(v3, "count"))
  {
    v14 = 0;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v14));
      if (v14)
        -[PDController printRegisterDescription:](self, "printRegisterDescription:", v15);
      else
        -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", CFSTR("'DBSt'"), v15);

      ++v14;
    }
    while ((unint64_t)objc_msgSend(v3, "count") > v14);
  }
  v6 = 0;
  if (v4)
LABEL_16:
    free(v4);
LABEL_17:

  return v6;
}

- (int)printStateHistory
{
  return -[PDControllerType4 printDBStateHistory](self, "printDBStateHistory");
}

- (id)stringForValue:(unsigned int)a3 table:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (!v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (0x%x)"), v4));
  return v7;
}

- (id)stringForValue:(unsigned int)a3 table:(id)a4 prefixString:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v7, v10));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (0x%x)"), v6));
  }

  return v11;
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

- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForValue:table:](self, "stringForValue:table:", v6, a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v8, v9));

  return v10;
}

- (id)stringForTitle:(id)a3 value:(unsigned int)a4 table:(id)a5 prefixString:(id)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForValue:table:prefixString:](self, "stringForValue:table:prefixString:", v8, a5, a6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 stringForTitle:valueString:](self, "stringForTitle:valueString:", v10, v11));

  return v12;
}

- (unsigned)chrisTracy:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v3 = a3;
  if (v3)
  {
    v13[0] = &off_10001B618;
    v13[1] = &off_10001B720;
    v14[0] = &off_10001B618;
    v14[1] = &off_10001B618;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    v12 = 0;
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "cStringUsingEncoding:", 1);
    if ((unint64_t)objc_msgSend(v5, "length") <= 8)
      v7 = (uint64_t)objc_msgSend(v5, "length");
    else
      v7 = 8;
    __memcpy_chk(&v12, v6, v7, 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v9));

    if (v10)
      v8 = objc_msgSend(v10, "unsignedLongValue");
    else
      v8 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(v5), "cStringUsingEncoding:", 1);

  }
  else
  {
    v8 = 0;
  }

  return bswap32(v8);
}

- (id)readFullVersion
{
  unsigned __int8 *v3;
  unsigned int v4;
  BOOL v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v13;

  v13 = 0;
  v3 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0x59C8B673uLL);
  if (v3)
  {
    v4 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 15, &v13);
    v5 = v13 > 4;
  }
  else
  {
    v5 = 0;
    v4 = -536870210;
  }
  if (v4 == 0 && v5)
    v6 = -536870169;
  else
    v6 = v4;
  if (v6)
  {
    v7 = 0;
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v7 = *(_DWORD *)v3;
  v8 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 44, &v13);
  if (v8)
  {
    v6 = v8;
    goto LABEL_11;
  }
  if (v13 <= 2)
  {
    v6 = 0;
    v9 = v3[1];
  }
  else
  {
    v9 = 0;
    v6 = -536870169;
  }
LABEL_12:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v11 = v10;
  if (!v6)
    objc_msgSend(v10, "appendFormat:", CFSTR("%X.%X.%X.%d"), v7 >> 20, (v7 >> 8) & 0xFFF, v7, v9);
  return v11;
}

- (BOOL)isSPIMaster
{
  char *v3;
  char *v4;
  uint64_t v6;

  v6 = 0;
  v3 = (char *)malloc_type_malloc(0x40uLL, 0x9656DA58uLL);
  if (!v3)
    return 1;
  v4 = v3;
  -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 45, &v6);
  return *v4 < 0;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  id v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  unint64_t v21;

  v3 = a3;
  v21 = 0;
  v5 = malloc_type_malloc(0x40uLL, 0xEB284134uLL);
  if (v5)
  {
    v6 = v5;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v5, 64, 47, &v21);
    if (v21)
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        if (v6[v7] == 32)
        {
          v10 = v8;
          v11 = ((uint64_t)v8 << 32) - 0x100000000;
          v12 = ((uint64_t)v8 << 32) + 0x500000000;
          v8 -= 2;
          do
          {
            v13 = v6[v10] == 32 && v21 > v10;
            ++v10;
            v11 += (uint64_t)&_mh_execute_header;
            v12 += (uint64_t)&_mh_execute_header;
            ++v8;
          }
          while (v13);
          if (++v9 == 3)
            break;
        }
        v7 = ++v8;
        if (v21 <= v8)
          return 0;
      }
      if (v3)
        v16 = &v6[v12 >> 32];
      else
        v16 = &v6[v11 >> 32];
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18));

      return v19;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PDControllerType4;
    v15 = -[PDControllerType2 getDeviceInfoNameWithConfigOnly:](&v20, "getDeviceInfoNameWithConfigOnly:", v3);
    return (id)objc_claimAutoreleasedReturnValue(v15);
  }
}

- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4 writeBuffer:(void *)a5 writeLength:(unint64_t)a6 readBuffer:(void *)a7 readLength:(unint64_t)a8
{
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;

  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType4 dpmrSubCommandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:](self, "dpmrSubCommandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:", a7, a8, a5, a6));
  v15 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    v16 = v14;
    if (objc_msgSend(v16, "count"))
    {
      if (objc_msgSend(v16, "count"))
      {
        v17 = 0;
        do
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v17));
          v19 = v18;
          if (v17)
            printf("\t%s\n", (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
          else
            -[PDControllerType4 printDPMrSubCommand:withTitle:andDescription:](self, "printDPMrSubCommand:withTitle:andDescription:", v13, v13, v18);

          ++v17;
        }
        while ((unint64_t)objc_msgSend(v16, "count") > v17);
      }
    }
    else
    {
      -[PDControllerType4 printDPMrSubCommand:withTitle:andDescription:](self, "printDPMrSubCommand:withTitle:andDescription:", v13, v13, &stru_1000186C8);
    }

  }
  else
  {
    -[PDControllerType4 printDPMrSubCommand:withTitle:andDescription:](self, "printDPMrSubCommand:withTitle:andDescription:", v13, v13, v14);
  }

  return 0;
}

- (int)printDPMrSubCommand:(id)a3 withDeviceConfig:(id)a4
{
  id v5;
  _OWORD *v6;
  _OWORD *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  int v34;
  uint64_t v35;
  void *v36;
  int v37;
  char *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  int v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];

  v45 = a3;
  v5 = a4;
  v6 = malloc_type_malloc(0x40uLL, 0xF245F5E5uLL);
  *v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  v46 = v6;
  v60 = 1146113394;
  v7 = malloc_type_malloc(0x40uLL, 0x510693A0uLL);
  *v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iecs_style")));
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("i2c_addr")));
  *(_BYTE *)v7 = objc_msgSend(v10, "unsignedCharValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("registers")));
  v12 = objc_msgSend(v11, "count");

  *((_BYTE *)v7 + 1) = v12 - 1;
  if (v9)
  {
    v58 = 0uLL;
    v59 = 0uLL;
    v56 = 0uLL;
    v57 = 0uLL;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("registers")));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (!v14)
      goto LABEL_23;
    v15 = v14;
    v44 = v5;
    v16 = *(_QWORD *)v57;
    LODWORD(v17) = 2;
LABEL_4:
    v18 = 0;
    v17 = (int)v17;
    while (1)
    {
      if (*(_QWORD *)v57 != v16)
        objc_enumerationMutation(v13);
      v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("address")));
      *((_BYTE *)v7 + v17) = objc_msgSend(v20, "unsignedCharValue");

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("length")));
      *((_BYTE *)v7 + v17 + 1) = objc_msgSend(v21, "unsignedCharValue") | 0x80;

      if (v17 > 61)
        break;
      v17 += 2;
      if (v15 == (id)++v18)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v15)
          goto LABEL_4;
        break;
      }
    }
  }
  else
  {
    v54 = 0uLL;
    v55 = 0uLL;
    v52 = 0uLL;
    v53 = 0uLL;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("registers")));
    v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (!v22)
      goto LABEL_23;
    v23 = v22;
    v44 = v5;
    v24 = *(_QWORD *)v53;
    v25 = 2;
LABEL_13:
    v26 = 0;
    if (v25 <= 63)
      v27 = 63;
    else
      v27 = v25;
    v28 = (v27 - v25);
    while (1)
    {
      if (*(_QWORD *)v53 != v24)
        objc_enumerationMutation(v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v26), "objectForKeyedSubscript:", CFSTR("address")));
      *((_BYTE *)v7 + v25 + v26) = objc_msgSend(v29, "unsignedCharValue");

      if (v28 == v26)
        break;
      if (v23 == (id)++v26)
      {
        v25 += v26;
        v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v23)
          goto LABEL_13;
        break;
      }
    }
  }
  v5 = v44;
LABEL_23:

  LODWORD(v43) = 4194368;
  -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v60, v7, 0, v46, 0, v43, 10);
  *v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v30 = v5;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("registers")));
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = *(_QWORD *)v49;
    do
    {
      v36 = 0;
      v37 = v34;
      v38 = (char *)v7 + v34;
      do
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(v31);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v36), "objectForKeyedSubscript:", CFSTR("address")));
        *((_BYTE *)v36 + (_QWORD)v38) = objc_msgSend(v39, "unsignedCharValue");

        v36 = (char *)v36 + 1;
      }
      while (v33 != v36);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      v34 = v37 + (_DWORD)v36;
    }
    while (v33);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("registers")));
  v41 = -[PDControllerType4 printDPMrSubCommand:withDeviceConfig:writeBuffer:writeLength:readBuffer:readLength:](self, "printDPMrSubCommand:withDeviceConfig:writeBuffer:writeLength:readBuffer:readLength:", v45, v30, v7, objc_msgSend(v40, "count"), v46, 64);

  free(v46);
  free(v7);

  return v41;
}

- (int)printDPMrSubCommand:(id)a3 withTitle:(id)a4 andDescription:(id)a5
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;

  v6 = objc_retainAutorelease(a3);
  v7 = a5;
  v8 = (const char *)objc_msgSend(v6, "UTF8String");
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  printf("'%s'\t%s\n", v8, v10);
  return 0;
}

- (id)dpmrSubCommandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6
{
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v11, "appendFormat:", CFSTR("0x%02llX\t0x"), a6);
  for (; a6; --a6)
  {
    v12 = *(unsigned __int8 *)a5;
    a5 = (char *)a5 + 1;
    objc_msgSend(v11, "appendFormat:", CFSTR("%02X"), v12);
  }
  objc_msgSend(v10, "addObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));

  objc_msgSend(v13, "appendFormat:", CFSTR("0x%02llX\t0x"), a4);
  for (; a4; --a4)
  {
    v14 = *(unsigned __int8 *)a3;
    a3 = (char *)a3 + 1;
    objc_msgSend(v13, "appendFormat:", CFSTR("%02x"), v14);
  }
  objc_msgSend(v10, "addObject:", v13);

  return v10;
}

- (void)setDPMrConfigs
{
  -[PDControllerType4 setDpmrConfigs:](self, "setDpmrConfigs:", &off_10001DCE0);
}

- (NSDictionary)dpmrConfigs
{
  return *(NSDictionary **)&self->PDOSourceType[9];
}

- (void)setDpmrConfigs:(id)a3
{
  objc_storeStrong((id *)&self->PDOSourceType[9], a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->PDOSourceType[9], 0);
}

@end
