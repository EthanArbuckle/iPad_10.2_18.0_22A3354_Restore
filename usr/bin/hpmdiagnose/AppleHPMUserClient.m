@implementation AppleHPMUserClient

- (AppleHPMUserClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AppleHPMUserClient;
  return -[AppleHPMUserClient init](&v3, "init");
}

- (void)dealloc
{
  objc_super v3;

  -[AppleHPMUserClient destroyUserClient](self, "destroyUserClient");
  v3.receiver = self;
  v3.super_class = (Class)AppleHPMUserClient;
  -[AppleHPMUserClient dealloc](&v3, "dealloc");
}

- (int)createUserClientForService:(unsigned int)a3
{
  int result;
  io_service_t v5;
  const __CFUUID *v6;
  const __CFUUID *v7;
  IOCFPlugInInterfaceStruct **cfPlugInInterface;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v10;
  CFUUIDBytes v11;
  int v12;
  SInt32 theScore[3];
  int v14;

  -[AppleHPMUserClient setService:](self, "setService:", *(_QWORD *)&a3);
  v14 = 0;
  if (!-[AppleHPMUserClient service](self, "service"))
    return -536870160;
  result = +[IOKitUtilities uint32ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint32ForRegistryEntry:andKey:outValue:", -[AppleHPMUserClient service](self, "service"), CFSTR("RID"), &v14);
  if (!result)
  {
    *(_QWORD *)theScore = 0;
    if (!+[IOKitUtilities uint64ForRegistryEntry:andKey:outValue:](IOKitUtilities, "uint64ForRegistryEntry:andKey:outValue:", -[AppleHPMUserClient service](self, "service"), CFSTR("Route String"), theScore))-[AppleHPMUserClient setRouteString:](self, "setRouteString:", *(_QWORD *)theScore);
    -[AppleHPMUserClient setRouterID:](self, "setRouterID:", v14);
    theScore[0] = 0;
    v5 = -[AppleHPMUserClient service](self, "service");
    v6 = CFUUIDGetConstantUUIDWithBytes(0, 0x12u, 0xA1u, 0xDCu, 0xCFu, 0xCFu, 0x7Au, 0x47u, 0x75u, 0xBEu, 0xE5u, 0x9Cu, 0x43u, 0x19u, 0xF4u, 0xCDu, 0x2Bu);
    v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    result = IOCreatePlugInInterfaceForService(v5, v6, v7, &self->_cfPlugInInterface, theScore);
    if (!result)
    {
      cfPlugInInterface = self->_cfPlugInInterface;
      QueryInterface = (*cfPlugInInterface)->QueryInterface;
      v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC1u, 0x3Au, 0xCDu, 0xD9u, 0x20u, 0x9Eu, 0x4Bu, 1u, 0xB7u, 0xBEu, 0xE0u, 0x5Cu, 0xD8u, 0x83u, 0xC7u, 0xB1u);
      v11 = CFUUIDGetUUIDBytes(v10);
      v12 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, _QWORD, _QWORD, AppleHPMLibInterfaceStructV3 ***))QueryInterface)(cfPlugInInterface, *(_QWORD *)&v11.byte0, *(_QWORD *)&v11.byte8, &self->_deviceInterface);
      result = -536870212;
      if (!v12)
      {
        result = 0;
        self->_userClientActive = 1;
      }
    }
  }
  return result;
}

- (void)destroyUserClient
{
  AppleHPMLibInterfaceStructV3 **deviceInterface;
  IOCFPlugInInterface **cfPlugInInterface;

  self->_userClientActive = 0;
  deviceInterface = self->_deviceInterface;
  if (deviceInterface)
  {
    (*((void (**)(AppleHPMLibInterfaceStructV3 **, SEL))*deviceInterface + 3))(deviceInterface, a2);
    self->_deviceInterface = 0;
  }
  cfPlugInInterface = self->_cfPlugInInterface;
  if (cfPlugInInterface)
  {
    IODestroyPlugInInterface(cfPlugInInterface);
    self->_cfPlugInInterface = 0;
  }
}

- (BOOL)isUserClientActive
{
  return self->_userClientActive;
}

- (int)iecsReadCommandForDevice:(unint64_t)a3 withAddress:(unsigned __int8)a4 buffer:(void *)a5 length:(unint64_t)a6 flags:(unsigned int)a7 andOutReadLength:(unint64_t *)a8
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, unint64_t, _QWORD, void *, unint64_t, _QWORD, unint64_t *))*self->_deviceInterface
            + 5))(self->_deviceInterface, a3, a4, a5, a6, *(_QWORD *)&a7, a8);
  else
    return -536870184;
}

- (int)iecsWriteCommandForDevice:(unint64_t)a3 withAddress:(unsigned __int8)a4 buffer:(void *)a5 length:(unint64_t)a6 flags:(unsigned int)a7
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, unint64_t, _QWORD, void *, unint64_t, _QWORD))*self->_deviceInterface
            + 6))(self->_deviceInterface, a3, a4, a5, a6, *(_QWORD *)&a7);
  else
    return -536870184;
}

- (int)iecsCommand:(unsigned int)a3 forDevice:(unint64_t)a4 flags:(unsigned int)a5
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, unint64_t, _QWORD, _QWORD))*self->_deviceInterface
            + 7))(self->_deviceInterface, a4, *(_QWORD *)&a3, *(_QWORD *)&a5);
  else
    return -536870184;
}

- (int)sendVDMForDevice:(unint64_t)a3 sop:(int)a4 buffer:(void *)a5 length:(unint64_t)a6 flags:(unsigned int)a7
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, unint64_t, _QWORD, void *, unint64_t, _QWORD))*self->_deviceInterface
            + 8))(self->_deviceInterface, a3, *(_QWORD *)&a4, a5, a6, *(_QWORD *)&a7);
  else
    return -536870184;
}

- (int)receiveVDMForDevice:(unint64_t)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 outSOP:(int *)a7 outSequence:(char *)a8 outLength:(unint64_t *)a9
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, unint64_t, void *, unint64_t, _QWORD, int *, char *, unint64_t *))*self->_deviceInterface
            + 9))(self->_deviceInterface, a3, a4, a5, *(_QWORD *)&a6, a7, a8, a9);
  else
    return -536870184;
}

- (int)receiveVDMAttentionForDevice:(unint64_t)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 outSOP:(int *)a7 outSequence:(char *)a8 outLength:(unint64_t *)a9
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, unint64_t, void *, unint64_t, _QWORD, int *, char *, unint64_t *))*self->_deviceInterface
            + 10))(self->_deviceInterface, a3, a4, a5, *(_QWORD *)&a6, a7, a8, a9);
  else
    return -536870184;
}

- (int)forceModeForDevice:(unint64_t)a3 enable:(unsigned __int8)a4 withDataStatus:(unsigned int)a5 andStatus:(unsigned int)a6
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, unint64_t, _QWORD, _QWORD, _QWORD))*self->_deviceInterface
            + 11))(self->_deviceInterface, a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  else
    return -536870184;
}

- (int)forceUpdateModeForDevice:(unint64_t)a3 enable:(unsigned __int8)a4
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, unint64_t, _QWORD))*self->_deviceInterface
            + 12))(self->_deviceInterface, a3, a4);
  else
    return -536870184;
}

- (int)IECSAtomicCommand:(unsigned __int8)a3 cmdBuffer:(void *)a4 dataBuffer:(void *)a5 extDataBuffer:(void *)a6 returnDataBuffer:(void *)a7 returnExtDataBuffer:(void *)a8 inputDataLength:(unsigned __int16)a9 returnDataBufferLength:(unsigned __int16)a10 timeoutInSeconds:(unint64_t)a11 forDevice:(unint64_t)a12 flags:(unsigned int)a13
{
  if (self->_userClientActive)
    return (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, _QWORD, void *, void *, void *, void *, void *, _QWORD))*self->_deviceInterface
            + 13))(self->_deviceInterface, a3, a4, a5, a6, a7, a8, a9);
  else
    return -536870184;
}

- (unsigned)routerID
{
  return self->_routerID;
}

- (void)setRouterID:(unsigned __int8)a3
{
  self->_routerID = a3;
}

- (unint64_t)routeString
{
  return self->_routeString;
}

- (void)setRouteString:(unint64_t)a3
{
  self->_routeString = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

@end
