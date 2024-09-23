@implementation SKIOObject

- (SKIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4
{
  SKIOObject *v6;
  SKIOObject *v7;
  SKIOObject *v8;
  objc_super v10;

  if (a3)
  {
    if (a4)
      IOObjectRetain(a3);
    v10.receiver = self;
    v10.super_class = (Class)SKIOObject;
    v6 = -[SKIOObject init](&v10, sel_init);
    v7 = v6;
    if (v6)
      v6->_ioObj = a3;
    else
      IOObjectRelease(a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SKIOObject)initWithIOObject:(unsigned int)a3
{
  return -[SKIOObject initWithIOObject:retain:](self, "initWithIOObject:retain:", *(_QWORD *)&a3, 0);
}

- (SKIOObject)initWithSKIOObject:(id)a3
{
  return -[SKIOObject initWithIOObject:retain:](self, "initWithIOObject:retain:", objc_msgSend(a3, "ioObj"), 1);
}

- (SKIOObject)initWithClassName:(id)a3
{
  id v4;
  mach_port_t v5;
  id v6;
  const __CFDictionary *v7;
  uint64_t MatchingService;
  SKIOObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDD8B18];
  v6 = objc_retainAutorelease(v4);
  v7 = IOServiceMatching((const char *)objc_msgSend(v6, "UTF8String"));
  MatchingService = IOServiceGetMatchingService(v5, v7);
  if ((_DWORD)MatchingService)
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:", MatchingService);
    v9 = self;
  }
  else
  {
    SKGetOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_22FE50000, v10, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (SKIOObject)initWithIteratorNext:(id)a3
{
  return -[SKIOObject initWithIOObject:](self, "initWithIOObject:", objc_msgSend(a3, "copyNextObject"));
}

- (id)newIteratorWithOptions:(unsigned int)a3
{
  int v3;
  int v4;
  NSObject *v5;
  SKIOIterator *v7;
  unsigned int v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v3 = MEMORY[0x2348AECB4](-[SKIOObject ioObj](self, "ioObj"), "IOService", *(_QWORD *)&a3, &v8);
  if (v3)
  {
    v4 = v3;
    SKGetOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v4;
      _os_log_impl(&dword_22FE50000, v5, OS_LOG_TYPE_ERROR, "Failed creating IO iterator, err code %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    v7 = [SKIOIterator alloc];
    return -[SKIOObject initWithIOObject:retain:](v7, "initWithIOObject:retain:", v8, 0);
  }
}

- (NSString)ioClassName
{
  return (NSString *)(id)IOObjectCopyClass(-[SKIOObject ioObj](self, "ioObj"));
}

- (void)dealloc
{
  io_object_t ioObj;
  objc_super v4;

  ioObj = self->_ioObj;
  if (ioObj)
    IOObjectRelease(ioObj);
  v4.receiver = self;
  v4.super_class = (Class)SKIOObject;
  -[SKIOObject dealloc](&v4, sel_dealloc);
}

- (SKIOObject)ioObjectWithClassName:(id)a3 iterateParents:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  SKIOObject *v10;
  SKIOObject *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  if (v4)
    v8 = 3;
  else
    v8 = 1;
  v9 = -[SKIOObject newIteratorWithOptions:](self, "newIteratorWithOptions:", v8);
  if (v9)
  {
    v10 = 0;
    while (1)
    {
      v11 = -[SKIOObject initWithIteratorNext:]([SKIOObject alloc], "initWithIteratorNext:", v9);

      if (!v11)
        break;
      v10 = v11;
      if (IOObjectConformsTo(-[SKIOObject ioObj](v11, "ioObj"), v7))
        goto LABEL_13;
    }
    SKGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_22FE50000, v12, OS_LOG_TYPE_ERROR, "Cannot find %@ entry", (uint8_t *)&v14, 0xCu);
    }

  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  __CFString *v5;
  io_registry_entry_t v6;
  void *CFProperty;
  id v8;

  v5 = (__CFString *)a4;
  v6 = -[SKIOObject ioObj](self, "ioObj");
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v5, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);

  if (CFProperty && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = CFProperty;
  else
    v8 = 0;

  return v8;
}

- (id)copyParentPropertyWithClass:(Class)a3 key:(id)a4
{
  __CFString *v5;
  io_registry_entry_t v6;
  void *v7;
  id v8;

  v5 = (__CFString *)a4;
  v6 = -[SKIOObject ioObj](self, "ioObj");
  v7 = (void *)IORegistryEntrySearchCFProperty(v6, "IOService", v5, (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);

  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (id)copyProperties
{
  io_registry_entry_t v2;
  CFMutableDictionaryRef properties;

  properties = 0;
  v2 = -[SKIOObject ioObj](self, "ioObj");
  IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  return properties;
}

- (id)copyParent
{
  kern_return_t ParentEntry;
  kern_return_t v3;
  NSObject *v4;
  SKIOObject *v6;
  io_registry_entry_t parent;
  uint8_t buf[4];
  kern_return_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(-[SKIOObject ioObj](self, "ioObj"), "IOService", &parent);
  if (ParentEntry)
  {
    v3 = ParentEntry;
    SKGetOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v3;
      _os_log_impl(&dword_22FE50000, v4, OS_LOG_TYPE_ERROR, "Failed to get parent registry entry, err code %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    v6 = [SKIOObject alloc];
    return -[SKIOObject initWithIOObject:](v6, "initWithIOObject:", parent);
  }
}

- (void)waitIOKitQuiet
{
  mach_timespec_t waitTime;

  waitTime = (mach_timespec_t)5;
  IOServiceWaitQuiet(-[SKIOObject ioObj](self, "ioObj"), &waitTime);
}

- (unsigned)ioObj
{
  return self->_ioObj;
}

@end
