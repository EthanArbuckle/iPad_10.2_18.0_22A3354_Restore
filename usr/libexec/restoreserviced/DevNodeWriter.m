@implementation DevNodeWriter

- (DevNodeWriter)init
{
  return -[DevNodeWriter initWithIOMedia:](self, "initWithIOMedia:", 0);
}

- (DevNodeWriter)initWithIOMedia:(unsigned int)a3
{
  char *v4;
  void *CFProperty;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DevNodeWriter;
  v4 = -[DevNodeWriter init](&v13, "init");
  if (v4)
  {
    if (IOObjectConformsTo(a3, "IOMedia"))
    {
      IOServiceWaitQuiet(a3, 0);
      IOObjectRetain(a3);
      *((_DWORD *)v4 + 2) = a3;
      *(_QWORD *)(v4 + 12) = 0xFFFFFFFFLL;
      if ((objc_msgSend(v4, "isAvailable") & 1) != 0)
      {
        objc_msgSend(v4, "_setupFileDescriptor");
        return (DevNodeWriter *)v4;
      }
      CFProperty = (void *)IORegistryEntryCreateCFProperty(*((_DWORD *)v4 + 2), CFSTR("BSD Name"), kCFAllocatorDefault, 0);
      iBU_LOG_real((uint64_t)CFSTR("File descriptor %@ wasn't available at init time."), "-[DevNodeWriter initWithIOMedia:]", v6, v7, v8, v9, v10, v11, (uint64_t)CFProperty);

    }
    return 0;
  }
  return (DevNodeWriter *)v4;
}

- (DevNodeWriter)initWithService:(unsigned int)a3
{
  CFMutableDictionaryRef v5;
  NSDictionary *v6;
  const __CFDictionary *v7;
  uint64_t MatchingService;
  DevNodeWriter *v9;
  uint64_t entryID;
  uint64_t v12;
  const __CFString *v13;
  NSNumber *v14;
  _QWORD v15[3];
  _QWORD v16[3];
  _OWORD v17[5];

  entryID = 0;
  IORegistryEntryGetRegistryEntryID(a3, &entryID);
  IOServiceWaitQuiet(a3, 0);
  v15[0] = CFSTR("IOParentMatch");
  v5 = IORegistryEntryIDMatching(entryID);
  v16[0] = (id)CFMakeCollectable(v5);
  v16[1] = CFSTR("IOMedia");
  v15[1] = CFSTR("IOProviderClass");
  v15[2] = CFSTR("IOPropertyMatch");
  v13 = CFSTR("Whole");
  v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1);
  v16[2] = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  if (v6)
    v7 = (const __CFDictionary *)CFRetain(v6);
  else
    v7 = 0;
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v7);
  v9 = -[DevNodeWriter initWithIOMedia:](self, "initWithIOMedia:", MatchingService);
  if ((_DWORD)MatchingService && IOObjectRelease(MatchingService))
    sub_1000164A4(&v12, v17);
  return v9;
}

- (DevNodeWriter)initWithServiceNamed:(id)a3 parent:(unsigned int)a4
{
  uint64_t Namespace;
  DevNodeWriter *v6;
  uint64_t v8;
  _OWORD v9[5];

  Namespace = MSUBootFirmwareFindNamespace(a4, (uint64_t)a3);
  v6 = -[DevNodeWriter initWithService:](self, "initWithService:", Namespace);
  if ((_DWORD)Namespace && IOObjectRelease(Namespace))
    sub_1000165C0(&v8, v9);
  return v6;
}

- (BOOL)isAvailable
{
  BOOL v2;
  CFTypeRef CFProperty;

  if (self->_nodeDescriptor != -1)
    return 1;
  CFProperty = IORegistryEntryCreateCFProperty(-[DevNodeWriter service](self, "service"), CFSTR("BSD Name"), kCFAllocatorDefault, 0);
  -[DevNodeWriter _waitForDeviceNode:withTimeout:](self, "_waitForDeviceNode:withTimeout:", CFProperty, 60);
  v2 = self->_nodeDescriptor != -1;
  if (CFProperty)
    CFRelease(CFProperty);
  return v2;
}

- (void)_waitForDeviceNode:(id)a3 withTimeout:(unsigned int)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = -[NSString UTF8String](-[DevNodeWriter devicePath](self, "devicePath", a3), "UTF8String");
  iBU_LOG_real((uint64_t)CFSTR("Attempting to open dev node at path: %s"), "-[DevNodeWriter _waitForDeviceNode:withTimeout:]", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  do
  {
    v13 = open(v6, 16777217);
    if (v13 != -1)
      break;
    v14 = __error();
    if (*v14 != 2)
    {
      strerror(*v14);
      iBU_LOG_real((uint64_t)CFSTR("open(2) on %s failed with error %d: %s. Not trying agin."), "-[DevNodeWriter _waitForDeviceNode:withTimeout:]", v21, v22, v23, v24, v25, v26, (uint64_t)v6);
      break;
    }
    iBU_LOG_real((uint64_t)CFSTR("Dev node %s doesn't yet exist. Waiting to try again..."), "-[DevNodeWriter _waitForDeviceNode:withTimeout:]", v15, v16, v17, v18, v19, v20, (uint64_t)v6);
    sleep(1u);
    --a4;
  }
  while (a4);
  self->_nodeDescriptor = v13;
}

- (NSString)devicePath
{
  CFTypeRef CFProperty;
  CFTypeRef v3;

  CFProperty = IORegistryEntryCreateCFProperty(-[DevNodeWriter service](self, "service"), CFSTR("BSD Name"), kCFAllocatorDefault, 0);
  v3 = (id)CFMakeCollectable(CFProperty);
  return (NSString *)objc_msgSend(CFSTR("/dev/"), "stringByAppendingPathComponent:", v3);
}

- (void)dealloc
{
  io_object_t service;
  int nodeDescriptor;
  objc_super v5;

  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
  nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1)
    close(nodeDescriptor);
  v5.receiver = self;
  v5.super_class = (Class)DevNodeWriter;
  -[DevNodeWriter dealloc](&v5, "dealloc");
}

- (BOOL)finished
{
  io_object_t service;
  int nodeDescriptor;

  fsync(self->_nodeDescriptor);
  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
  nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1)
  {
    close(nodeDescriptor);
    self->_nodeDescriptor = -1;
  }
  return 1;
}

- (void)_setupFileDescriptor
{
  int nodeDescriptor;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  blksize_t st_blksize;
  stat v11;
  blksize_t v12;

  nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1)
  {
    if (fcntl(nodeDescriptor, 48))
      iBU_LOG_real((uint64_t)CFSTR("Failed to set F_NOCACHE on descriptor."), "-[DevNodeWriter _setupFileDescriptor]", v4, v5, v6, v7, v8, v9, 1);
    v12 = 0;
    memset(&v11, 0, sizeof(v11));
    if (ioctl(self->_nodeDescriptor, 0x40046418uLL, &v12))
    {
      if (fstat(self->_nodeDescriptor, &v11))
        st_blksize = 0;
      else
        st_blksize = v11.st_blksize;
    }
    else
    {
      st_blksize = v12;
    }
    self->_preferredBlockSize = st_blksize;
  }
}

- (int)writeBytes:(const void *)a3 ofLength:(unint64_t)a4 withError:(id *)a5
{
  unsigned int v9;
  int v10;
  ssize_t v11;
  int v13;
  NSError *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v9 = -[DevNodeWriter nodeDescriptor](self, "nodeDescriptor");
  if (!a4)
    return 0;
  v10 = v9;
  while (1)
  {
    v11 = write(v10, a3, a4);
    if (v11 == -1)
      break;
    a3 = (char *)a3 + v11;
    a4 -= v11;
    if (!a4)
      return 0;
  }
  v13 = *__error();
  v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v13, 0);
  -[DevNodeWriter devicePath](self, "devicePath");
  iBU_LOG_real((uint64_t)CFSTR("Failed to write %lu bytes to %@"), "-[DevNodeWriter writeBytes:ofLength:withError:]", v15, v16, v17, v18, v19, v20, a4);
  if (a5)
  {
    -[DevNodeWriter devicePath](self, "devicePath");
    *a5 = MSUBootFirmwareError(3, (uint64_t)v14, (uint64_t)CFSTR("Failed to write %lu bytes to %@"), v27, v28, v29, v30, v31, a4);
  }
  iBU_LOG_real((uint64_t)CFSTR("There are %lu bytes left to write."), "-[DevNodeWriter writeBytes:ofLength:withError:]", v21, v22, v23, v24, v25, v26, a4);
  return v13 | 0xC000;
}

- (int)writeData:(id)a3 withError:(id *)a4
{
  return -[DevNodeWriter writeBytes:ofLength:withError:](self, "writeBytes:ofLength:withError:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), a4);
}

- (unint64_t)numberOfBytesRemainingInBlock
{
  int v3;
  unsigned int v4;
  unint64_t v5;
  int v6;

  v3 = -[DevNodeWriter preferredBlockSize](self, "preferredBlockSize");
  if (v3 < 1)
    return 0;
  v4 = v3;
  v5 = lseek(-[DevNodeWriter nodeDescriptor](self, "nodeDescriptor"), 0, 1);
  if ((v5 & 0x8000000000000000) != 0)
    return 0;
  v6 = v5 % v4;
  if (v6)
    return (int)(v4 - v6);
  else
    return 0;
}

- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4
{
  return -536870201;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (int)nodeDescriptor
{
  return self->_nodeDescriptor;
}

- (void)setNodeDescriptor:(int)a3
{
  self->_nodeDescriptor = a3;
}

- (int)preferredBlockSize
{
  return self->_preferredBlockSize;
}

- (void)setPreferredBlockSize:(int)a3
{
  self->_preferredBlockSize = a3;
}

@end
