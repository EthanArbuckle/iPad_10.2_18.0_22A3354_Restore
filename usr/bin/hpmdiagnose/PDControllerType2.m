@implementation PDControllerType2

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

- (PDControllerType2)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDControllerType2;
  return -[PDController initWithAddress:userClient:](&v5, "initWithAddress:userClient:", a3, a4);
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
  v3 = objc_msgSend(&off_10001CCC8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(&off_10001CCC8);
      v7 = -[PDController printRegister:](self, "printRegister:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "unsignedCharValue"));
    }
    v8 = v7;
    v4 = objc_msgSend(&off_10001CCC8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
  v3 = objc_msgSend(&off_10001CCE0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(&off_10001CCE0);
      v7 = -[PDController printRegister:](self, "printRegister:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "unsignedCharValue"));
    }
    v8 = v7;
    v4 = objc_msgSend(&off_10001CCE0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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

  result = -[PDControllerType2 printTitle](self, "printTitle");
  if (!result)
  {
    putchar(10);
    result = -[PDControllerType2 printIECSStandardInfo](self, "printIECSStandardInfo");
    if (!result)
    {
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PDControllerType2 readFullVersionWithConfig](self, "readFullVersionWithConfig")));
      printf("0x0f %-22s %s\n", "FW Versions", (const char *)objc_msgSend(v4, "UTF8String"));

      putchar(10);
      return -[PDControllerType2 printIECSAceSpecificInfo](self, "printIECSAceSpecificInfo");
    }
  }
  return result;
}

- (int)printAll
{
  int v3;
  void *v4;
  unsigned __int8 *v5;
  int v6;
  void *v7;
  unsigned int v8;
  int v10;
  __int128 v11;
  _BYTE v12[21];

  if (!-[PDControllerType2 printTitle](self, "printTitle"))
  {
    putchar(10);
    LOBYTE(v3) = 0;
    do
    {
      if (-[PDController printRegister:](self, "printRegister:", v3))
        break;
      v3 = (char)(v3 + 1);
    }
    while ((v3 & 0x80000000) == 0);
  }
  -[PDController printCommand:withWriteData:withWriteLength:](self, "printCommand:withWriteData:withWriteLength:", 1212377195, 0, 0);
  v10 = 0;
  -[PDController printCommand:withWriteData:withWriteLength:](self, "printCommand:withWriteData:withWriteLength:", 1094992754, &v10, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  *(_QWORD *)&v11 = 0;
  v5 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0x6C35967CuLL);
  v6 = 0;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Malloc failed for rdo object pull")));
    objc_msgSend(v4, "addObject:", v7);

    v6 = -536870211;
  }
  -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v5, 64, 41, &v11);
  v8 = v5[55];
  self->mux_type = v8 & 7;
  self->debug_mux = (v8 >> 4) & 3;

  if (self->mux_type == 2)
  {
    v11 = xmmword_100013430;
    *(_OWORD *)v12 = unk_100013440;
    *(_QWORD *)&v12[13] = 0xF3F2F1F04D4A4948;
    -[PDController printCommand:withWriteData:withWriteLength:](self, "printCommand:withWriteData:withWriteLength:", 1146113394, &v11, 37);
  }
  return v6;
}

- (unsigned)majorVersionNumber
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int16 v5;

  v3 = (unsigned __int8 *)malloc_type_malloc(4uLL, 0x90DC54E7uLL);
  if (!v3)
    return 0;
  v4 = v3;
  -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", v3, 4, 15);
  v5 = v4[2];
  free(v4);
  return v5;
}

- (int)printPDStateHistory
{
  void *v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned __int16 v11;
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
  __int16 v25;
  int v26;
  int v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = malloc_type_malloc(0x40uLL, 0xB85BCF6CuLL);
  -[PDControllerType2 majorVersionNumber](self, "majorVersionNumber");
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
      LODWORD(v22) = 4194368;
      v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v26, 0, v4, 0, v22, 10);
      if (!v7)
      {
        v5 = *(unsigned __int16 *)v4;
        LOBYTE(v6) = v4[2];
      }
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", CFSTR("PDSt(0)"), v9);

    if (v6 <= 4u)
      v6 = 4;
    else
      v6 = v6;
    v10 = v6 + 2;
    LOBYTE(v11) = 2;
    v25 = 2;
    do
    {
      while (1)
      {
        if (!v7)
        {
          v7 = -[PDController registerWrite8:atAddress:](self, "registerWrite8:atAddress:", v11, 9);
          if (!v7)
          {
            v7 = -[PDController executeIECSCommand:](self, "executeIECSCommand:", 1346655092);
            if (!v7)
            {
              v7 = -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", v4, 64, 9);
              if (!v7)
              {
                LODWORD(v22) = 4194306;
                v7 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v25, 0, v4, 0, v22, 10);
                if (!v7)
                  break;
              }
            }
          }
        }
        v11 = v25 + 1;
        v25 = v11;
        if (v10 <= v11)
          goto LABEL_24;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 64));
      objc_msgSend(v3, "addObjectsFromArray:", v12);

      v7 = 0;
      v11 = v25 + 1;
      v25 = v11;
    }
    while (v10 > v11);
    LODWORD(v22) = 4194368;
    v13 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v27, &v26, 0, v4, 0, v22, 10);
    if (v13)
    {
      v7 = v13;
LABEL_24:
      if (v4)
        free(v4);
      goto LABEL_35;
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
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForTitle:valueString:](self, "stringForTitle:valueString:", v16, v17));
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
LABEL_35:

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
  unint64_t v11;
  void *v12;
  uint64_t v14;
  unsigned __int16 i;
  int v16;
  int v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0;
  v17 = 1145197428;
  v4 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0xFC6B2E66uLL);
  -[PDControllerType2 majorVersionNumber](self, "majorVersionNumber");
  if (v4)
  {
    LODWORD(v14) = 4194368;
    v5 = 1;
    v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v17, &v16, 0, v4, 0, v14, 10);
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
    if (!v6)
    {
      LODWORD(v14) = 4194306;
      v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v17, &i, 0, v4, 0, v14, 10);
      if (!v6)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v4, 64));
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        v6 = 0;
      }
    }
  }
  if (v4)
    free(v4);
  if (!v6 && objc_msgSend(v3, "count"))
  {
    v11 = 0;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v11));
      if (v11)
        -[PDController printRegisterDescription:](self, "printRegisterDescription:", v12);
      else
        -[PDController printRegisterTitle:andDescription:](self, "printRegisterTitle:andDescription:", CFSTR("'DBSt'"), v12);

      ++v11;
    }
    while ((unint64_t)objc_msgSend(v3, "count") > v11);
  }

  return v6;
}

- (int)printStateHistory
{
  if (-[PDControllerType2 majorVersionNumber](self, "majorVersionNumber") == 6)
    return -[PDControllerType2 printDBStateHistory](self, "printDBStateHistory");
  else
    return -[PDControllerType2 printPDStateHistory](self, "printPDStateHistory");
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
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForValue:table:](self, "stringForValue:table:", v6, a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForTitle:valueString:](self, "stringForTitle:valueString:", v8, v9));

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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForValue:table:prefixString:](self, "stringForValue:table:prefixString:", v8, a5, a6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 stringForTitle:valueString:](self, "stringForTitle:valueString:", v10, v11));

  return v12;
}

- (int)disc:(unsigned __int8)a3
{
  void *v4;
  unsigned int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned __int8 v14;

  v14 = a3;
  if (-[PDController remote](self, "remote") && !-[PDControllerType2 supportsRemote](self, "supportsRemote"))
  {
    printf("pd controller at 0x%02x does not support remote access\n", -[PDController address](self, "address"));
    return -536870170;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 getDeviceInfoNameWithConfigOnly:](self, "getDeviceInfoNameWithConfigOnly:", 1));
  v5 = -[PDControllerType2 chrisTracy:](self, "chrisTracy:", v4);

  v12 = 1280262987;
  v13 = v5;
  if (v5)
  {
    LODWORD(v10) = 4;
    v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v12, &v13, 0, 0, 0, v10, 10);
    v11 = 1145656131;
    if (v6)
      return v6;
  }
  else
  {
    v11 = 1145656131;
  }
  v7 = malloc_type_malloc(0x40uLL, 0x834941B8uLL);
  if (!v7)
    return -536870211;
  v8 = v7;
  LODWORD(v10) = 4194305;
  v6 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v11, &v14, 0, v7, 0, v10, 10);
  free(v8);
  return v6;
}

- (id)readFullVersion
{
  unsigned int *v3;
  unsigned int v4;
  int v5;
  _BOOL4 v6;
  unsigned int v7;
  unsigned int v8;
  __CFString *v9;
  uint64_t v11;
  unsigned __int8 v12;
  unint64_t v13;

  v13 = 0;
  v3 = (unsigned int *)malloc_type_malloc(0x40uLL, 0x4CFCA601uLL);
  if (v3)
  {
    v4 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 15, &v13);
    v5 = v13 > 4;
    v6 = v4 == 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  if ((v6 & ~v5) == 0)
  {
LABEL_8:
    v9 = &stru_1000186C8;
    return v9;
  }
  v7 = *v3;
  v8 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 44, &v13);
  v9 = &stru_1000186C8;
  if (!v8 && v13 <= 2)
  {
    v12 = 0;
    v11 = 0;
    if (!-[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", &v12, 1, 44, &v11))
    {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%X.%X.%X.%d"), HIWORD(v7), BYTE1(v7), v7, v12));
      return v9;
    }
    goto LABEL_8;
  }
  return v9;
}

- (id)readFullVersionWithConfig
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDControllerType2 readFullVersion](self, "readFullVersion"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PDControllerType2 getDeviceInfoNameWithConfigOnly:](self, "getDeviceInfoNameWithConfigOnly:", 1)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%s)"), v3, objc_msgSend(v4, "UTF8String")));

  return v5;
}

- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v6;

  v6 = 0;
  if (a4 >= 0x40u)
    *(_QWORD *)&a4 = 64;
  else
    v4 = a4;
  -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", a3, a4, 5, &v6);
  return v6;
}

- (BOOL)isSPIMaster
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  _BOOL4 v5;
  uint64_t v7;

  v7 = 0;
  v3 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0x977BF70EuLL);
  if (v3)
  {
    v4 = v3;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v3, 64, 45, &v7);
    return (*v4 >> 3) & 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  int v8;
  id v10;
  void *v11;
  uint64_t v12;
  objc_super v13;
  uint64_t v14;

  v3 = a3;
  v14 = 0;
  v5 = malloc_type_malloc(0x40uLL, 0xB478897DuLL);
  if (v5)
  {
    v6 = v5;
    -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v5, 64, 47, &v14);
    if (!v14)
      return 0;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      if (v6[v7] == 32)
        ++v8;
      if (v8 == 3)
        break;
      if (v14 == ++v7)
        return 0;
    }
    if (v3)
      v12 = (v7 + 2);
    else
      v12 = (v7 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v6[v12]));
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PDControllerType2;
    v10 = -[PDController getDeviceInfoNameWithConfigOnly:](&v13, "getDeviceInfoNameWithConfigOnly:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }
  return v11;
}

- (unsigned)chrisTracy:(id)a3
{
  return 827609923;
}

- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11
{
  uint64_t v16;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v16 = a3;
  if (-[PDController remote](self, "remote"))
    return -536870201;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  LODWORD(v22) = 0;
  LODWORD(v21) = __PAIR32__(a10, a9);
  v20 = objc_msgSend(v19, "IECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:forDevice:flags:", v16, a4, a5, a6, a7, a8, v21, a11, -[PDController address](self, "address"), v22);

  return v20;
}

@end
