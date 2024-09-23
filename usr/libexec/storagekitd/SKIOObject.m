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
    v6 = -[SKIOObject init](&v10, "init");
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
  const __CFDictionary *v5;
  uint64_t MatchingService;
  SKIOObject *v7;
  id v8;
  NSObject *v9;
  int v11;
  id v12;

  v4 = objc_retainAutorelease(a3);
  v5 = IOServiceMatching((const char *)objc_msgSend(v4, "UTF8String"));
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if ((_DWORD)MatchingService)
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:", MatchingService);
    v7 = self;
  }
  else
  {
    v8 = sub_10000BA9C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (SKIOObject)initWithIteratorNext:(id)a3
{
  return -[SKIOObject initWithIOObject:](self, "initWithIOObject:", objc_msgSend(a3, "copyNextObject"));
}

- (id)newIteratorWithOptions:(unsigned int)a3
{
  kern_return_t v3;
  kern_return_t v4;
  id v5;
  NSObject *v6;
  SKIOIterator *v8;
  io_iterator_t iterator;
  uint8_t buf[4];
  kern_return_t v11;

  iterator = 0;
  v3 = IORegistryEntryCreateIterator(-[SKIOObject ioObj](self, "ioObj"), "IOService", a3, &iterator);
  if (v3)
  {
    v4 = v3;
    v5 = sub_10000BA9C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed creating IO iterator, err code %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    v8 = [SKIOIterator alloc];
    return -[SKIOObject initWithIOObject:retain:](v8, "initWithIOObject:retain:", iterator, 0);
  }
}

- (NSString)ioClassName
{
  return (NSString *)(id)IOObjectCopyClass(-[SKIOObject ioObj](self, "ioObj"));
}

- (id)description
{
  return -[SKIOObject ioClassName](self, "ioClassName");
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
  -[SKIOObject dealloc](&v4, "dealloc");
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
  id v12;
  NSObject *v13;
  int v15;
  id v16;

  v4 = a4;
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
    v12 = sub_10000BA9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Cannot find %@ entry", (uint8_t *)&v15, 0xCu);
    }

  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  __CFString *v6;
  void *CFProperty;
  id v8;

  v6 = (__CFString *)a4;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(-[SKIOObject ioObj](self, "ioObj"), v6, kCFAllocatorDefault, 0);

  if (CFProperty && (objc_opt_isKindOfClass(CFProperty, a3) & 1) != 0)
    v8 = CFProperty;
  else
    v8 = 0;

  return v8;
}

- (id)copyParentPropertyWithClass:(Class)a3 key:(id)a4
{
  __CFString *v6;
  void *v7;
  id v8;

  v6 = (__CFString *)a4;
  v7 = (void *)IORegistryEntrySearchCFProperty(-[SKIOObject ioObj](self, "ioObj"), "IOService", v6, kCFAllocatorDefault, 3u);

  if (v7 && (objc_opt_isKindOfClass(v7, a3) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (id)copyProperties
{
  CFMutableDictionaryRef properties;

  properties = 0;
  IORegistryEntryCreateCFProperties(-[SKIOObject ioObj](self, "ioObj"), &properties, kCFAllocatorDefault, 0);
  return properties;
}

- (id)copyParent
{
  kern_return_t ParentEntry;
  kern_return_t v3;
  id v4;
  NSObject *v5;
  SKIOObject *v7;
  io_registry_entry_t parent;
  uint8_t buf[4];
  kern_return_t v10;

  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(-[SKIOObject ioObj](self, "ioObj"), "IOService", &parent);
  if (ParentEntry)
  {
    v3 = ParentEntry;
    v4 = sub_10000BA9C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to get parent registry entry, err code %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    v7 = [SKIOObject alloc];
    return -[SKIOObject initWithIOObject:](v7, "initWithIOObject:", parent);
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
