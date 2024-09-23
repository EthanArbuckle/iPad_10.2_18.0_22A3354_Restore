@implementation NVRAMHelper

- (id)readNVRAM:(id)a3
{
  __CFString *v4;
  const __CFData *CFProperty;
  const __CFData *v6;
  CFTypeID v7;
  NSString *v8;

  v4 = (__CFString *)a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR))
      sub_100002448();
    goto LABEL_7;
  }
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(self->optionsRef, v4, kCFAllocatorDefault, 0);
  v6 = CFProperty;
  if (CFProperty)
  {
    v7 = CFGetTypeID(CFProperty);
    if (v7 == CFDataGetTypeID())
    {
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", CFDataGetBytePtr(v6));
      v6 = (const __CFData *)objc_claimAutoreleasedReturnValue(v8);
      goto LABEL_8;
    }
LABEL_7:
    v6 = 0;
  }
LABEL_8:

  return v6;
}

- (BOOL)writeNVRAM:(id)a3 :(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  unsigned int v9;
  OS_os_log *logs;
  _BOOL4 v11;
  kern_return_t v12;
  int v13;
  OS_os_log *v14;
  BOOL v15;
  int v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v6 = (__CFString *)a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NVRAMHelper readNVRAM:](self, "readNVRAM:", v6));
  v9 = objc_msgSend(v8, "isEqualToString:", v7);
  logs = self->logs;
  v11 = os_log_type_enabled((os_log_t)logs, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      v17 = 138412802;
      v18 = v6;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)logs, OS_LOG_TYPE_DEBUG, "Current value of variable %@ is the same (%@) as the value passed in (%@). Skipping write.", (uint8_t *)&v17, 0x20u);
    }
LABEL_10:
    v15 = 1;
    goto LABEL_11;
  }
  if (v11)
  {
    v17 = 138412802;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)logs, OS_LOG_TYPE_DEBUG, "Updating %@ from value %@ to value %@", (uint8_t *)&v17, 0x20u);
  }
  v12 = IORegistryEntrySetCFProperty(self->optionsRef, v6, objc_msgSend(v7, "dataUsingEncoding:", 4));
  if (!v12)
    goto LABEL_10;
  v13 = v12;
  v14 = self->logs;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    sub_100002474((uint64_t)v6, v13, (os_log_t)v14);
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)syncNVRAM
{
  kern_return_t v3;

  v3 = IORegistryEntrySetCFProperty(self->optionsRef, CFSTR("IONVRAM-SYNCNOW-PROPERTY"), CFSTR("IONVRAM-SYNCNOW-PROPERTY"));
  if (v3 && os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR))
    sub_1000024F8();
  return v3 == 0;
}

- (unsigned)createOptionsRef
{
  io_registry_entry_t v3;

  v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v3 && os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR))
    sub_100002524();
  return v3;
}

- (void)releaseOptionsRef:(unsigned int)a3
{
  if (a3)
    IOObjectRelease(a3);
}

- (BOOL)hasALPMClock
{
  io_registry_entry_t v3;
  io_object_t v4;
  const __CFData *CFProperty;
  const __CFData *v6;
  CFTypeID v7;
  const UInt8 *BytePtr;
  unint64_t Length;
  uint64_t v10;
  int v12;

  v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/product");
  if (v3)
  {
    v4 = v3;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, CFSTR("lpm-clock"), 0, 0);
    if (CFProperty)
    {
      v6 = CFProperty;
      v12 = 0;
      v7 = CFGetTypeID(CFProperty);
      if (v7 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr(v6);
        Length = CFDataGetLength(v6);
        if (Length >= 4)
          v10 = 4;
        else
          v10 = Length;
        __memcpy_chk(&v12, BytePtr, v10, 4);
        byte_100008540 = v12 != 0;
      }
      else if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR))
      {
        sub_1000025B4();
      }
      IOObjectRelease(v4);
      CFRelease(v6);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_DEBUG))
        sub_10000257C();
      IOObjectRelease(v4);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_ERROR))
  {
    sub_100002550();
  }
  return byte_100008540;
}

- (NVRAMHelper)init
{
  NVRAMHelper *v2;
  NVRAMHelper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NVRAMHelper;
  v2 = -[NVRAMHelper init](&v5, "init");
  v3 = v2;
  if (v2)
    v2->optionsRef = -[NVRAMHelper createOptionsRef](v2, "createOptionsRef");
  return v3;
}

- (NVRAMHelper)initWithLog:(id)a3
{
  id v4;
  NVRAMHelper *v5;
  NVRAMHelper *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NVRAMHelper;
  v5 = -[NVRAMHelper init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    v5->optionsRef = -[NVRAMHelper createOptionsRef](v5, "createOptionsRef");
    if (v4)
      v7 = v4;
    else
      v7 = &_os_log_default;
    objc_storeStrong((id *)&v6->logs, v7);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NVRAMHelper releaseOptionsRef:](self, "releaseOptionsRef:", self->optionsRef);
  v3.receiver = self;
  v3.super_class = (Class)NVRAMHelper;
  -[NVRAMHelper dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->logs, 0);
}

@end
