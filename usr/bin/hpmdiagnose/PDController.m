@implementation PDController

+ (id)knownPDControllers:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  kern_return_t ChildIterator;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  unsigned int v24;
  io_iterator_t iterator;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AppleHPMUserClientManager sharedInstance](AppleHPMUserClientManager, "sharedInstance"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userClientSet"));
    if (v6)
    {
      v7 = v6;
      v20 = v5;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
      {
        v9 = v8;
        ChildIterator = 0;
        v11 = *(_QWORD *)v27;
        v22 = a3;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            iterator = 0;
            if (!ChildIterator)
            {
              ChildIterator = IORegistryEntryGetChildIterator((io_registry_entry_t)objc_msgSend(v13, "service"), "IOService", &iterator);
              if (!ChildIterator)
              {
                v14 = IOIteratorNext(iterator);
                if ((_DWORD)v14)
                {
                  v15 = v14;
                  do
                  {
                    if (IOObjectConformsTo(v15, "AppleHPMDevice"))
                    {
                      v24 = 0;
                      v23 = 0;
                      if (!+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", v15, CFSTR("Address"), &v24)&& !+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", v15, CFSTR("Vendor ID"), (char *)&v23 + 4)&& !+[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", v15, CFSTR("Device ID"), &v23))
                      {
                        if (a3 < 0)
                        {
                          v16 = HIDWORD(v23);
                        }
                        else
                        {
                          HIDWORD(v23) = a3;
                          v16 = a3;
                        }
                        v17 = (void *)objc_claimAutoreleasedReturnValue(+[PDController pdControllerForVID:DID:address:userClient:](PDController, "pdControllerForVID:DID:address:userClient:", v16, v23, v24, v13));
                        if (v17)
                          objc_msgSend(v21, "addObject:", v17);

                        a3 = v22;
                      }
                    }
                    IOObjectRelease(v15);
                    v15 = IOIteratorNext(iterator);
                  }
                  while ((_DWORD)v15);
                }
                if (iterator)
                  IOObjectRelease(iterator);
                ChildIterator = 0;
              }
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v9);
      }

      v5 = v20;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sortedArrayUsingSelector:", "compare:"));

  return v18;
}

+ (id)pdControllerForAddress:(unsigned int)a3 userClient:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v8 = 0;
  v9 = 0;
  v6 = 0;
  if (!objc_msgSend(v5, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", v4, 0, (char *)&v9 + 4, 4, 0, &v8))
  {
    v8 = 0;
    v6 = 0;
    if (!objc_msgSend(v5, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", v4, 1, &v9, 4, 0, &v8))v6 = (void *)objc_claimAutoreleasedReturnValue(+[PDController pdControllerForVID:DID:address:userClient:](PDController, "pdControllerForVID:DID:address:userClient:", HIDWORD(v9), v9, v4, v5));
  }

  return v6;
}

+ (id)pdControllerForVID:(unsigned int)a3 DID:(unsigned int)a4 address:(unsigned int)a5 userClient:(id)a6
{
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  __objc2_class *v11;
  void *v12;

  v6 = a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v9 = a6;
  if ((_DWORD)v8 == 40)
  {
    if ((int)v7 > 389205247)
    {
      if ((_DWORD)v7 == 826622785)
      {
        v11 = PDControllerType2;
        goto LABEL_11;
      }
    }
    else if ((v7 - 33628196) < 4)
    {
      v11 = PDControllerType5;
LABEL_11:
      v10 = objc_claimAutoreleasedReturnValue(-[__objc2_class createWithDeviceAddress:userClient:](v11, "createWithDeviceAddress:userClient:", v6, v9));
      goto LABEL_12;
    }
    v11 = PDControllerType4;
    goto LABEL_11;
  }
  if ((_DWORD)v8 == 2599)
    v10 = objc_claimAutoreleasedReturnValue(+[PDControllerType1 PDControllerType1WithDeviceAddress:userClient:](PDControllerType1, "PDControllerType1WithDeviceAddress:userClient:", v6, v9));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[PDController createWithDeviceAddress:userClient:VID:DID:](PDController, "createWithDeviceAddress:userClient:VID:DID:", v6, v9, v8, v7));
LABEL_12:
  v12 = (void *)v10;

  return v12;
}

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = a3;
  v10 = a4;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithAddress:userClient:VID:DID:", v8, v10, v7, v6);

  return v11;
}

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

- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4;
  id v6;
  PDController *v7;
  PDController *v8;
  void *v9;
  unsigned int v11;
  objc_super v12;

  v4 = a3;
  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDController;
  v7 = -[PDController init](&v12, "init");
  v8 = v7;
  if (v7
    && (-[PDController setAddress:](v7, "setAddress:", v4),
        -[PDController setUserClient:](v8, "setUserClient:", v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](v8, "userClient")),
        v9,
        v9))
  {
    v11 = 0;
    -[PDController registerRead32:atAddress:](v8, "registerRead32:atAddress:", &v11, 1);
    -[PDController setDid:](v8, "setDid:", v11);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (PDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4 VID:(unsigned int)a5 DID:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  PDController *v11;
  PDController *v12;
  void *v13;
  objc_super v15;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDController;
  v11 = -[PDController init](&v15, "init");
  v12 = v11;
  if (!v11
    || (-[PDController setAddress:](v11, "setAddress:", v8),
        -[PDController setVid:](v12, "setVid:", v7),
        -[PDController setDid:](v12, "setDid:", v6),
        -[PDController setUserClient:](v12, "setUserClient:", v10),
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](v12, "userClient")),
        v13,
        !v13))
  {

    v12 = 0;
  }

  return v12;
}

- (BOOL)supportsRemote
{
  return 0;
}

- (int)printInfo
{
  printf("Unknown PD controller at address 0x%02x\n", -[PDController address](self, "address"));
  return 0;
}

- (int)printAll:(id)a3
{
  puts("Controller in input file not recognized");
  return 0;
}

- (int)printAll
{
  printf("Unknown PD controller at address 0x%02x with VID 0x%04x and DID 0x%04x\n", -[PDController address](self, "address"), -[PDController vid](self, "vid"), -[PDController did](self, "did"));
  return 0;
}

- (int)printTriage:(id)a3
{
  printf("Unknown PD controller at address 0x%02x with VID 0x%04x and DID 0x%04x\n", -[PDController address](self, "address", a3), -[PDController vid](self, "vid"), -[PDController did](self, "did"));
  return 0;
}

- (int)printStateHistory
{
  printf("Unknown PD controller at address 0x%02x with VID 0x%04x and DID 0x%04x\n", -[PDController address](self, "address"), -[PDController vid](self, "vid"), -[PDController did](self, "did"));
  return 0;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  int64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  unsigned int v25;
  unsigned int v26;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(PDController);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      v8 = objc_msgSend(v7, "routerID");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userClient"));
      v10 = objc_msgSend(v9, "routerID");

      if (v8 > v10)
      {
LABEL_4:
        v11 = 1;
LABEL_9:

        goto LABEL_10;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      v13 = objc_msgSend(v12, "routerID");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userClient"));
      v15 = objc_msgSend(v14, "routerID");

      if (v13 >= v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
        v18 = objc_msgSend(v17, "routeString");
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userClient"));
        v20 = objc_msgSend(v19, "routeString");

        if (v18 > v20)
          goto LABEL_4;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
        v22 = objc_msgSend(v21, "routeString");
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userClient"));
        v24 = objc_msgSend(v23, "routeString");

        if (v22 >= v24)
        {
          v25 = -[PDController address](self, "address");
          if (v25 <= objc_msgSend(v6, "address"))
          {
            v26 = -[PDController address](self, "address");
            if (v26 >= objc_msgSend(v6, "address"))
              v11 = 0;
            else
              v11 = -1;
            goto LABEL_9;
          }
          goto LABEL_4;
        }
      }
      v11 = -1;
      goto LABEL_9;
    }
    v11 = (int64_t)objc_msgSend(v4, "compare:", self);
  }
  else
  {
    v11 = 1;
  }
LABEL_10:

  return v11;
}

- (int)registerRead8:(char *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5;

  v5 = 0;
  return -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", a3, 1, *(_QWORD *)&a4, &v5);
}

- (int)registerWrite8:(unsigned __int8)a3 atAddress:(unsigned int)a4
{
  unsigned __int8 v5;

  v5 = a3;
  return -[PDController registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", &v5, 1, *(_QWORD *)&a4);
}

- (int)registerRead32:(unsigned int *)a3 atAddress:(unsigned int)a4
{
  uint64_t v5;

  v5 = 0;
  return -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", a3, 4, *(_QWORD *)&a4, &v5);
}

- (int)registerWrite32:(unsigned int)a3 atAddress:(unsigned int)a4
{
  unsigned int v5;

  v5 = a3;
  return -[PDController registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", &v5, 4, *(_QWORD *)&a4);
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v6;

  v6 = 0;
  return -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", a3, a4, *(_QWORD *)&a5, &v6);
}

- (int)registerRead:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  uint64_t v7;
  void *v12;
  int v13;

  v7 = *(_QWORD *)&a5;
  if (-[PDController remote](self, "remote"))
    return -[PDController registerReadRemote:ofLength:atAddress:andOutReadLength:](self, "registerReadRemote:ofLength:atAddress:andOutReadLength:", a3, a4, v7, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  v13 = objc_msgSend(v12, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", -[PDController address](self, "address"), v7, a3, a4, 0, a6);

  return v13;
}

- (int)registerReadRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5 andOutReadLength:(unint64_t *)a6
{
  _BYTE *v11;
  _BYTE *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v19;
  void *v20;
  __int128 v22;

  HIDWORD(v22) = 0;
  LODWORD(v22) = 1396917577;
  v11 = malloc_type_malloc(0x40uLL, 0x1FF77245uLL);
  *(_QWORD *)((char *)&v22 + 4) = ((_DWORD)a4 << 24) | (a5 << 8) | 0x10000;
  if (!v11)
    return -536870211;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient", (_QWORD)v22, *((_QWORD *)&v22 + 1)));
  v14 = objc_msgSend(v13, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDController address](self, "address"), 19, (char *)&v22 + 4, 4, 0);

  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    objc_msgSend(v15, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDController address](self, "address"), 8, &v22, 4, 0);

    v16 = 99;
    do
    {
      usleep(0x64u);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      v14 = objc_msgSend(v17, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", -[PDController address](self, "address"), 8, v12, a4, 0, a6);

    }
    while (*v12 == 73 && v16-- != 0);
    if (!v14)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      v14 = objc_msgSend(v19, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", -[PDController address](self, "address"), 19, v12, a4, 0, 0);

      if (!v14)
      {
        if ((v12[2] & 0x7C) != 0)
        {
          puts("remote read failed");
          -[PDController setRemote:](self, "setRemote:", 0);
          v14 = -536870165;
        }
        else
        {
          *a6 = v12[3] & 0x7F;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
          v14 = objc_msgSend(v20, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", -[PDController address](self, "address"), 9, a3, a4, 0, (char *)&v22 + 8);

        }
      }
    }
  }
  free(v12);
  return v14;
}

- (int)registerWrite:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  uint64_t v5;
  void *v10;
  int v11;

  v5 = *(_QWORD *)&a5;
  if (-[PDController remote](self, "remote"))
    return -[PDController registerWriteRemote:ofLength:atAddress:](self, "registerWriteRemote:ofLength:atAddress:", a3, a4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  v11 = objc_msgSend(v10, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDController address](self, "address"), v5, a3, a4, 0);

  return v11;
}

- (int)registerWriteRemote:(void *)a3 ofLength:(unint64_t)a4 atAddress:(unsigned int)a5
{
  unsigned __int8 v5;
  _BYTE *v9;
  _BYTE *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v19;
  int v20;

  v5 = a5;
  v19 = 1396917577;
  v9 = malloc_type_malloc(0x40uLL, 0xB0A83142uLL);
  v20 = ((_DWORD)a4 << 24) | (v5 << 8);
  if (!v9)
    return -536870211;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
  v12 = objc_msgSend(v11, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDController address](self, "address"), 19, &v20, a4, 0);

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    v12 = objc_msgSend(v13, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDController address](self, "address"), 9, a3, a4, 0);

    if (!v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
      objc_msgSend(v14, "iecsWriteCommandForDevice:withAddress:buffer:length:flags:", -[PDController address](self, "address"), 8, &v19, 4, 0);

      v15 = 99;
      do
      {
        usleep(0x64u);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
        v12 = objc_msgSend(v16, "iecsReadCommandForDevice:withAddress:buffer:length:flags:andOutReadLength:", -[PDController address](self, "address"), 8, v10, a4, 0, 0);

      }
      while (*v10 == 73 && v15-- != 0);
    }
  }
  free(v10);
  return v12;
}

- (int)executeIECSCommand:(unsigned int)a3
{
  uint64_t v3;
  _DWORD *v5;
  int v6;
  int v7;
  unsigned int v8;
  void *v10;
  unsigned int v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = 0;
  v5 = malloc_type_malloc(0x40uLL, 0x1BA249DBuLL);
  if (-[PDController remote](self, "remote"))
  {
    v12 = bswap32(v3);
    v6 = -[PDController registerWriteRemote:ofLength:atAddress:](self, "registerWriteRemote:ofLength:atAddress:", &v12, 4, 8);
    if (!v6)
    {
      v7 = 99;
      do
      {
        usleep(0x64u);
        v8 = -[PDController registerReadRemote:ofLength:atAddress:andOutReadLength:](self, "registerReadRemote:ofLength:atAddress:andOutReadLength:", v5, 4, 8, &v13);
      }
      while (*v5 == v12 && v7-- != 0);
      v6 = v8;
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDController userClient](self, "userClient"));
    v6 = objc_msgSend(v10, "iecsCommand:forDevice:flags:", v3, -[PDController address](self, "address"), 0);

  }
  if (v5)
    free(v5);
  return v6;
}

- (int)executeIECSCommand:(unsigned int)a3 withData:(void *)a4 ofLength:(unint64_t)a5
{
  uint64_t v7;
  int result;
  __int128 v10;

  v7 = *(_QWORD *)&a3;
  if (-[PDController remote](self, "remote", 0, 0, 0, 0, 0, 0, 0, 0))
  {
    -[PDController registerWriteRemote:ofLength:atAddress:](self, "registerWriteRemote:ofLength:atAddress:", &v10, 64, 9);
    result = -[PDController registerWriteRemote:ofLength:atAddress:](self, "registerWriteRemote:ofLength:atAddress:", a4, a5, 9);
    if (result)
      return result;
  }
  else
  {
    -[PDController registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", &v10, 64, 9);
    result = -[PDController registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", a4, a5, 9);
    if (result)
      return result;
  }
  return -[PDController executeIECSCommand:](self, "executeIECSCommand:", v7);
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

- (int)stress:(unsigned int)a3
{
  _OWORD *v5;
  _OWORD *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  unsigned int v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  _OWORD v19[2];

  v5 = malloc_type_malloc(0x40uLL, 0x7DB03540uLL);
  if (v5)
  {
    v6 = v5;
    v7 = -536870211;
    v8 = malloc_type_malloc(0x40uLL, 0xE42C248FuLL);
    v9 = objc_autoreleasePoolPush();
    if (v8)
    {
      if (a3)
      {
        v10 = 0;
        qmemcpy(v19, "/.-,+*)('&%$#\"! ?>=<;:9876543210", sizeof(v19));
        while (1)
        {
          printf("Stress cycle %d\n", v10);
          *v6 = v19[1];
          v6[1] = v19[0];
          v6[2] = xmmword_100013410;
          v6[3] = xmmword_100013420;
          v11 = -[PDController registerWrite:ofLength:atAddress:](self, "registerWrite:ofLength:atAddress:", v6, 64, 9);
          if (v11
            || (v11 = -[PDController registerRead:ofLength:atAddress:](self, "registerRead:ofLength:atAddress:", v8, 64, 9)) != 0)
          {
            v7 = v11;
            goto LABEL_19;
          }
          if (bcmp(v6, v8, 0x40uLL))
            break;
          if (a3 == ++v10)
            goto LABEL_9;
        }
        printf("Mismatch on cycle %d\n", v10);
        puts("Write buffer:");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v6, 64));
        if (objc_msgSend(v12, "count"))
        {
          v13 = 0;
          do
          {
            v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13)));
            puts((const char *)objc_msgSend(v14, "UTF8String"));

            ++v13;
          }
          while ((unint64_t)objc_msgSend(v12, "count") > v13);
        }

        puts("Read buffer:");
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", v8, 64));
        if (objc_msgSend(v15, "count"))
        {
          v16 = 0;
          do
          {
            v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v16)));
            puts((const char *)objc_msgSend(v17, "UTF8String"));

            ++v16;
          }
          while ((unint64_t)objc_msgSend(v15, "count") > v16);
        }

        v7 = -536870198;
      }
      else
      {
LABEL_9:
        v7 = 0;
      }
    }
LABEL_19:
    objc_autoreleasePoolPop(v9);
    free(v6);
    if (v8)
      free(v8);
  }
  else
  {
    v7 = -536870211;
    objc_autoreleasePoolPop(objc_autoreleasePoolPush());
  }
  return v7;
}

- (int)printCommand:(unsigned int)a3
{
  return -[PDController printCommand:withTitle:andFormatter:](self, "printCommand:withTitle:andFormatter:", *(_QWORD *)&a3, &stru_1000186C8, "commandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:");
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = malloc_type_malloc(0x40uLL, 0x3A27C1B9uLL);
  if (!v9)
  {
    v10 = 0;
    v12 = 3758097085;
    v22 = 0;
    goto LABEL_7;
  }
  v10 = malloc_type_malloc(0x40uLL, 0x2F5DE6ACuLL);
  v22 = 0;
  if (!v10)
  {
    v12 = 3758097085;
    goto LABEL_7;
  }
  v11 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v10, 64, 9, &v22);
  if ((_DWORD)v11)
  {
    v12 = v11;
LABEL_7:
    v21 = 0;
LABEL_8:
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Status = 0x%08x"), v12));
    -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v6, v8, v13);
    goto LABEL_9;
  }
  v15 = -[PDController executeIECSCommand:](self, "executeIECSCommand:", v6);
  v21 = 0;
  if ((_DWORD)v15
    || (v15 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v9, 64, 9, &v21), (_DWORD)v15))
  {
    v12 = v15;
    goto LABEL_8;
  }
  v16 = v21;
  if (v21 >= 0x40)
    v16 = 64;
  v21 = v16;
  v17 = off_1000217F8(self, a5, v9, 64, v10, 64);
  v13 = (id)objc_claimAutoreleasedReturnValue(v17);
  v18 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v13, v18) & 1) != 0)
  {
    v13 = v13;
    if (objc_msgSend(v13, "count"))
    {
      if (objc_msgSend(v13, "count"))
      {
        v19 = 0;
        do
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v19));
          if (v19)
            -[PDController printCommandDescription:](self, "printCommandDescription:", v20);
          else
            -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v6, v8, v20);

          ++v19;
        }
        while ((unint64_t)objc_msgSend(v13, "count") > v19);
      }
    }
    else
    {
      -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v6, v8, &stru_1000186C8);
    }

  }
  else
  {
    -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v6, v8, v13);
  }
  LODWORD(v12) = 0;
LABEL_9:

  if (v9)
    free(v9);
  if (v10)
    free(v10);

  return v12;
}

- (void)printCommand:(unsigned int)a3 withTitle:(id)a4 andDescription:(id)a5
{
  printf("'%c%c%c%c'\t%s\n", ((int)a3 >> 24), ((int)(a3 << 8) >> 24), ((__int16)a3 >> 8), (char)a3, (const char *)objc_msgSend(objc_retainAutorelease(a5), "UTF8String"));
}

- (int)printCommand:(unsigned int)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5
{
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSString *v13;
  SEL v14;
  void *v15;
  int v16;

  v7 = *(_QWORD *)&a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController commandMap](self, "commandMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  if (v11)
  {
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("title")));
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("formatter")));
    v14 = NSSelectorFromString(v13);

  }
  else
  {
    v14 = "registerFormatterHexDumpWithBuffer:andLength:";
    v12 = &stru_1000186C8;
  }
  v15 = malloc_type_malloc(a5, 0x6EDCEB3DuLL);
  bzero(v15, a5);
  memcpy(v15, a4, a5);
  v16 = -[PDController printCommand:withTitle:andFormatter:andData:andLength:](self, "printCommand:withTitle:andFormatter:andData:andLength:", v7, v12, v14, v15, a5);
  free(v15);

  return v16;
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7
{
  uint64_t v10;
  id v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  void *v19;

  v10 = *(_QWORD *)&a3;
  v12 = a4;
  if (a7 >= 0x40)
    v13 = 64;
  else
    v13 = a7;
  v14 = off_1000217F8(self, a5, a6, 64, a6, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    v17 = v15;
    if (objc_msgSend(v17, "count"))
    {
      if (objc_msgSend(v17, "count"))
      {
        v18 = 0;
        do
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v18));
          if (v18)
            -[PDController printCommandDescription:](self, "printCommandDescription:", v19);
          else
            -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v10, v12, v19);

          ++v18;
        }
        while ((unint64_t)objc_msgSend(v17, "count") > v18);
      }
    }
    else
    {
      -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v10, v12, &stru_1000186C8);
    }

  }
  else
  {
    -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v10, v12, v15);
  }

  return 0;
}

- (int)printCommand:(unsigned int)a3 withWriteData:(void *)a4 withWriteLength:(unint64_t)a5
{
  return -[PDController printCommand:withTitle:andFormatter:andWriteData:andWriteDataLength:](self, "printCommand:withTitle:andFormatter:andWriteData:andWriteDataLength:", *(_QWORD *)&a3, &stru_1000186C8, "commandFormatterHexDumpWithBuffer:length:inputBuffer:andInputLength:", a4, a5);
}

- (int)printCommand:(unsigned int)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andWriteData:(void *)a6 andWriteDataLength:(unint64_t)a7
{
  __int16 v7;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v20;
  unsigned int v21;

  v7 = a7;
  v21 = a3;
  v11 = a4;
  v12 = malloc_type_malloc(0x40uLL, 0x42A1BD1uLL);
  if (!v12)
  {
    v13 = 3758097085;
    goto LABEL_13;
  }
  WORD1(v20) = 64;
  LOWORD(v20) = v7;
  v13 = -[PDController executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, a6, 0, v12, 0, v20, 10);
  if ((_DWORD)v13)
  {
LABEL_13:
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Status = 0x%08x"), v13));
    goto LABEL_14;
  }
  v14 = off_1000217F8(self, a5, v12, 64, a6, 64);
  v15 = (id)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {
LABEL_14:
    -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v21, v11, v15);
    goto LABEL_15;
  }
  v15 = v15;
  if (objc_msgSend(v15, "count"))
  {
    if (objc_msgSend(v15, "count"))
    {
      v17 = 0;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v17));
        if (v17)
          -[PDController printCommandDescription:](self, "printCommandDescription:", v18);
        else
          -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v21, v11, v18);

        ++v17;
      }
      while ((unint64_t)objc_msgSend(v15, "count") > v17);
    }
  }
  else
  {
    -[PDController printCommand:withTitle:andDescription:](self, "printCommand:withTitle:andDescription:", v21, v11, &stru_1000186C8);
  }

LABEL_15:
  if (v12)
    free(v12);

  return v13;
}

- (void)printCommandDescription:(id)a3
{
  printf("%-27s %s\n", ", (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (int)printRegister:(unsigned __int8)a3 dataBuffer:(void *)a4 andLength:(unint64_t)a5
{
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSString *v13;
  SEL v14;
  void *v15;
  int v16;

  v7 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDController registerMap](self, "registerMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  if (v11)
  {
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("title")));
    v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("formatter")));
    v14 = NSSelectorFromString(v13);

  }
  else
  {
    v14 = "registerFormatterHexDumpWithBuffer:andLength:";
    v12 = &stru_1000186C8;
  }
  v15 = malloc_type_malloc(a5, 0xE63D717DuLL);
  bzero(v15, a5);
  memcpy(v15, a4, a5);
  v16 = -[PDController printRegister:withTitle:andFormatter:andData:andLength:](self, "printRegister:withTitle:andFormatter:andData:andLength:", v7, v12, v14, v15, a5);
  free(v15);

  return v16;
}

- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5 andData:(void *)a6 andLength:(unint64_t)a7
{
  uint64_t v10;
  id v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  void *v19;

  v10 = a3;
  v12 = a4;
  if (a7 >= 0x40)
    v13 = 64;
  else
    v13 = a7;
  v14 = off_1000217F0(self, a5, a6, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    v17 = v15;
    if (objc_msgSend(v17, "count"))
    {
      if (objc_msgSend(v17, "count"))
      {
        v18 = 0;
        do
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v18));
          if (v18)
            -[PDController printRegisterDescription:](self, "printRegisterDescription:", v19);
          else
            -[PDController printRegister:withTitle:andDescription:](self, "printRegister:withTitle:andDescription:", v10, v12, v19);

          ++v18;
        }
        while ((unint64_t)objc_msgSend(v17, "count") > v18);
      }
    }
    else
    {
      -[PDController printRegister:withTitle:andDescription:](self, "printRegister:withTitle:andDescription:", v10, v12, &stru_1000186C8);
    }

  }
  else
  {
    -[PDController printRegister:withTitle:andDescription:](self, "printRegister:withTitle:andDescription:", v10, v12, v15);
  }

  return 0;
}

- (int)printRegister:(unsigned __int8)a3
{
  return -[PDController printRegister:withTitle:andFormatter:](self, "printRegister:withTitle:andFormatter:", a3, &stru_1000186C8, "registerFormatterHexDumpWithBuffer:andLength:");
}

- (int)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andFormatter:(SEL)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v18;

  v6 = a3;
  v8 = a4;
  v9 = malloc_type_malloc(0x40uLL, 0x3F6C0EA9uLL);
  v18 = 0;
  if (!v9)
  {
    v10 = 3758097085;
    goto LABEL_16;
  }
  v10 = -[PDController registerRead:ofLength:atAddress:andOutReadLength:](self, "registerRead:ofLength:atAddress:andOutReadLength:", v9, 64, v6, &v18);
  if ((_DWORD)v10)
  {
LABEL_16:
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Status = 0x%08x\n"), v10));
LABEL_17:
    -[PDController printRegister:withTitle:andDescription:](self, "printRegister:withTitle:andDescription:", v6, v8, v13);
    goto LABEL_18;
  }
  if (v18 >= 0x40)
    v11 = 64;
  else
    v11 = v18;
  v18 = v11;
  v12 = off_1000217F0(self, a5, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
    goto LABEL_17;
  v13 = v13;
  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v13, "count"))
    {
      v15 = 0;
      do
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v15));
        if (v15)
          -[PDController printRegisterDescription:](self, "printRegisterDescription:", v16);
        else
          -[PDController printRegister:withTitle:andDescription:](self, "printRegister:withTitle:andDescription:", v6, v8, v16);

        ++v15;
      }
      while ((unint64_t)objc_msgSend(v13, "count") > v15);
    }
  }
  else
  {
    -[PDController printRegister:withTitle:andDescription:](self, "printRegister:withTitle:andDescription:", v6, v8, &stru_1000186C8);
  }

LABEL_18:
  if (v9)
    free(v9);

  return v10;
}

- (void)printRegister:(unsigned __int8)a3 withTitle:(id)a4 andDescription:(id)a5
{
  printf("0x%02x\t%s\n", a3, (const char *)objc_msgSend(objc_retainAutorelease(a5), "UTF8String"));
}

- (void)printRegisterTitle:(id)a3 andDescription:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = (const char *)objc_msgSend(v5, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  printf("%s\t%s\n", v7, v9);
}

- (void)printRegisterDescription:(id)a3
{
  printf("\t%s\n", (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (void)printRegisterDescription:(id)a3 withIndex:(int)a4
{
  printf("\t%d\t%s\n", a4, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (id)registerFormatterDecimal8WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 1)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), *(unsigned __int8 *)a3);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 1"), a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterDecimal16WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 2)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), *(unsigned __int16 *)a3);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 2"), a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterDecimal32WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 4)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), *(unsigned int *)a3);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterDecimal64WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 8)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), *(_QWORD *)a3);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 8"), a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterHex16WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 2)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%04x"), *(unsigned int *)a3);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 2"), a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterHex32WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 4)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08x"), *(unsigned int *)a3);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatter4CCWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a4 == 4)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c%c%c%c"), *(unsigned __int8 *)a3, *((unsigned __int8 *)a3 + 1), *((unsigned __int8 *)a3 + 2), *((unsigned __int8 *)a3 + 3));
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4, v6, v7, v8);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterUUIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;
  char out[40];

  if (a4 == 16)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)a3, out);
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), out);
  }
  else
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterStringWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  *((char *)a3 + a4 - 1) = 0;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%s\"), a3);
}

- (id)registerFormatterHexDumpWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (!a4)
    goto LABEL_7;
  v7 = 0;
  v8 = 0;
  do
  {
    if (!v8)
    {
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      -[__CFString appendFormat:](v8, "appendFormat:", CFSTR("0x%02llX\t"), a4);
      -[__CFString appendString:](v8, "appendString:", CFSTR("0x"));
    }
    -[__CFString appendFormat:](v8, "appendFormat:", CFSTR("%02X"), *((unsigned __int8 *)a3 + v7++));
  }
  while (a4 != v7);
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v9 = 0;
    v8 = CFSTR("0x00");
  }
  objc_msgSend(v6, "addObject:", v8);

  return v6;
}

- (id)commandFormatterHexDumpWithBuffer:(void *)a3 length:(unint64_t)a4 inputBuffer:(void *)a5 andInputLength:(unint64_t)a6
{
  return -[PDController registerFormatterHexDumpWithBuffer:andLength:](self, "registerFormatterHexDumpWithBuffer:andLength:", a3, 64, a5, a6);
}

- (id)registerFormatterHexDumpNarrowWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (a4)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      if (!v8)
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      objc_msgSend(v8, "appendFormat:", CFSTR("0x%02X "), *((unsigned __int8 *)a3 + v7++));
      if ((v7 & 7) == 0 || v7 >= a4)
      {
        objc_msgSend(v6, "addObject:", v8);

        v8 = 0;
      }
    }
    while (a4 != v7);
  }
  else
  {
    v8 = 0;
  }

  return v6;
}

- (id)registerFormatterDecimal32MillisecondsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 4)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d ms"), *(unsigned int *)a3);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterBCDVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;
  uint64_t v6;
  uint64_t v7;

  if (a4 == 4)
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%X.%X.%X"), *((unsigned __int16 *)a3 + 1), *((unsigned __int8 *)a3 + 1), *(unsigned __int8 *)a3);
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4, v6, v7);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterRxVDMWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  void *v6;
  void *v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v7 = v6;
  if (a4 == 29)
  {
    v9 = *(unsigned __int8 *)a3;
    v8 = (unsigned int *)((char *)a3 + 1);
    v10 = v9 & 7;
    objc_msgSend(v6, "appendFormat:", CFSTR("seq=%d cnt=%d "), (v9 >> 5) & 3, v10);
    if ((_DWORD)v10)
    {
      do
      {
        v11 = *v8++;
        objc_msgSend(v7, "appendFormat:", CFSTR("0x%08X "), v11);
        --v10;
      }
      while (v10);
    }
  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("ERROR: length %lld != 29"), a4);
  }
  return v7;
}

- (id)registerFormatterVIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 4)
  {
    if (*(_DWORD *)a3 == 40)
    {
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08X (TI)"), 40);
    }
    else if (*(_DWORD *)a3 == 2599)
    {
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08X (Apple Inc.)"), 2599);
    }
    else
    {
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08X"), *(unsigned int *)a3);
    }
  }
  else
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)registerFormatterDIDWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  NSString *v4;

  if (a4 == 4)
  {
    if (*(_DWORD *)a3 == 24)
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08X (PDControllerType1[USB-C])"), 24);
    else
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08X"), *(unsigned int *)a3);
  }
  else
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ERROR: length %lld != 4"), a4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)readFullVersion
{
  return &stru_1000186C8;
}

- (unsigned)readUUIDIntoBuffer:(char *)a3 ofLength:(unsigned __int8)a4
{
  return 0;
}

- (BOOL)isSPIMaster
{
  return 1;
}

- (id)getDeviceInfoNameWithConfigOnly:(BOOL)a3
{
  return CFSTR("Unknown");
}

- (int)disc:(unsigned __int8)a3
{
  return -536870201;
}

- (int)forceMode:(unsigned __int8)a3 withDataStatus:(unsigned int)a4 andStatus:(unsigned int)a5
{
  return -536870201;
}

- (int)forceUpdateMode:(unsigned __int8)a3
{
  return -536870201;
}

- (int)executeIECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11
{
  return -536870201;
}

- (int)setupForLivePDLog
{
  return -536870201;
}

- (int)runLivePDLog
{
  return -536870201;
}

- (NSDictionary)registerMap
{
  return self->_registerMap;
}

- (void)setRegisterMap:(id)a3
{
  objc_storeStrong((id *)&self->_registerMap, a3);
}

- (NSDictionary)commandMap
{
  return self->_commandMap;
}

- (void)setCommandMap:(id)a3
{
  objc_storeStrong((id *)&self->_commandMap, a3);
}

- (unsigned)address
{
  return self->_address;
}

- (void)setAddress:(unsigned __int8)a3
{
  self->_address = a3;
}

- (unsigned)vid
{
  return self->_vid;
}

- (void)setVid:(unsigned int)a3
{
  self->_vid = a3;
}

- (unsigned)did
{
  return self->_did;
}

- (void)setDid:(unsigned int)a3
{
  self->_did = a3;
}

- (AppleHPMUserClient)userClient
{
  return self->_userClient;
}

- (void)setUserClient:(id)a3
{
  objc_storeStrong((id *)&self->_userClient, a3);
}

- (BOOL)remote
{
  return self->_remote;
}

- (void)setRemote:(BOOL)a3
{
  self->_remote = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userClient, 0);
  objc_storeStrong((id *)&self->_commandMap, 0);
  objc_storeStrong((id *)&self->_registerMap, 0);
}

@end
