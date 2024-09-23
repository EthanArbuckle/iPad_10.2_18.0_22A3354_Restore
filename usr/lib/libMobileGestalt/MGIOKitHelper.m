@implementation MGIOKitHelper

- (MGIOKitHelper)init
{
  MGIOKitHelper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MGIOKitHelper;
  result = -[MGIOKitHelper init](&v3, sel_init);
  if (result)
    result->devIterator = 0;
  return result;
}

- (BOOL)createTreeIterator:(const char *)a3
{
  -[MGIOKitHelper deleteIterator](self, "deleteIterator");
  return IORegistryCreateIterator(*MEMORY[0x1E0CBBAA8], a3, 1u, &self->devIterator) == 0;
}

- (void)dealloc
{
  objc_super v3;

  -[MGIOKitHelper deleteIterator](self, "deleteIterator");
  v3.receiver = self;
  v3.super_class = (Class)MGIOKitHelper;
  -[MGIOKitHelper dealloc](&v3, sel_dealloc);
}

- (void)deleteIterator
{
  io_object_t devIterator;

  devIterator = self->devIterator;
  if (devIterator)
  {
    IOObjectRelease(devIterator);
    self->devIterator = 0;
  }
}

- (unsigned)copyDeviceTreeStructureNext:(id)a3 withFirstChar:(char)a4
{
  int v4;
  id v6;
  uint64_t i;
  __CFString *v8;
  __CFString *v9;
  _OWORD v11[8];
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  for (i = IOIteratorNext(self->devIterator); (_DWORD)i; i = IOIteratorNext(self->devIterator))
  {
    memset(v11, 0, sizeof(v11));
    if (!MEMORY[0x1A1AC47F4](i, v11))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v4)
      {
        if (sub_19B6B7E54(v8, v6, v4))
          goto LABEL_10;
      }
      else if (!-[__CFString compare:options:](v8, "compare:options:", v6, 1))
      {
LABEL_10:

        break;
      }
      IOObjectRelease(i);

    }
  }

  return i;
}

- (__CFDictionary)deviceTreeNodeIsPresent:(__CFString *)a3 withExactName:(BOOL)a4 withNodeClass:(__CFString *)a5
{
  _BOOL4 v6;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  __CFDictionary *Copy;
  kern_return_t CFProperties;
  mach_error_t v21;
  char *v22;
  const char *v23;
  __CFString *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  __CFString *v33;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  char *v38;
  io_name_t className;
  uint64_t v40;

  v6 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v33 = a3;
  v8 = a5;
  v9 = IOIteratorNext(self->devIterator);
  if (!(_DWORD)v9)
  {
    v12 = 0;
    v11 = 0;
    goto LABEL_14;
  }
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = 0uLL;
  while (1)
  {
    v14 = v12;
    if (v8)
    {
      *(_OWORD *)&className[96] = v13;
      *(_OWORD *)&className[112] = v13;
      *(_OWORD *)&className[64] = v13;
      *(_OWORD *)&className[80] = v13;
      *(_OWORD *)&className[32] = v13;
      *(_OWORD *)&className[48] = v13;
      *(_OWORD *)className = v13;
      *(_OWORD *)&className[16] = v13;
      IOObjectGetClass(v10, className);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", className);
      v15 = objc_claimAutoreleasedReturnValue();

      v16 = -[__CFString isEqualToString:](v8, "isEqualToString:", v15);
      v13 = 0uLL;
      v17 = v16;
      v11 = (void *)v15;
    }
    else
    {
      v17 = 1;
    }
    *(_OWORD *)&className[96] = v13;
    *(_OWORD *)&className[112] = v13;
    *(_OWORD *)&className[64] = v13;
    *(_OWORD *)&className[80] = v13;
    *(_OWORD *)&className[32] = v13;
    *(_OWORD *)&className[48] = v13;
    *(_OWORD *)className = v13;
    *(_OWORD *)&className[16] = v13;
    MEMORY[0x1A1AC47F4](v10, className);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", className);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_11;
    if (!v6)
      break;
    if ((objc_msgSend(v12, "isEqualToString:", v33) & 1) != 0)
      goto LABEL_18;
LABEL_11:
    IOObjectRelease(v10);
    v10 = IOIteratorNext(self->devIterator);
    v13 = 0uLL;
    if (!(_DWORD)v10)
      goto LABEL_14;
  }
  if (!objc_msgSend(v12, "hasPrefix:", v33))
    goto LABEL_11;
LABEL_18:
  CFProperties = IORegistryEntryCreateCFProperties(v10, (CFMutableDictionaryRef *)&cf, 0, 0);
  if (CFProperties)
  {
    v21 = CFProperties;
    v22 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v22)
      v23 = v22 + 1;
    else
      v23 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    v24 = objc_retainAutorelease(v33);
    v25 = -[__CFString UTF8String](v24, "UTF8String");
    mach_error_string(v21);
    _MGLog((uint64_t)v23, 215, (uint64_t)CFSTR("IORegistryEntryCreateCFProperties failed for '%s': %s"), v26, v27, v28, v29, v30, v25);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v31 = -[__CFString UTF8String](objc_retainAutorelease(v24), "UTF8String");
      v32 = mach_error_string(v21);
      *(_DWORD *)buf = 136315394;
      v36 = v31;
      v37 = 2080;
      v38 = v32;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed for '%s': %s", buf, 0x16u);
    }
LABEL_14:
    Copy = 0;
  }
  else
  {
    Copy = CFDictionaryCreateCopy(0, (CFDictionaryRef)cf);
    IOObjectRelease(v10);
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }

  return Copy;
}

- (BOOL)createServicesIteratorByNameMatch:(const char *)a3
{
  const __CFDictionary *v5;
  BOOL result;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _BOOL4 v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MGIOKitHelper deleteIterator](self, "deleteIterator");
  v5 = IOServiceNameMatching(a3);
  if (v5)
    return IOServiceGetMatchingServices(*MEMORY[0x1E0CBBAA8], v5, &self->devIterator) == 0;
  v7 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
  if (v7)
    v13 = v7 + 1;
  else
    v13 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
  _MGLog((uint64_t)v13, 69, (uint64_t)CFSTR("Failed to create iterator: %s "), v8, v9, v10, v11, v12, (char)a3);
  v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    v16 = a3;
    _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to create iterator: %s ", buf, 0xCu);
    return 0;
  }
  return result;
}

- (void)copyServiceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  int v6;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  io_object_t v13;
  io_registry_entry_t v14;
  CFStringRef v15;
  CFStringRef v16;
  CFTypeRef v17;
  const void *v18;
  CFTypeRef CFProperty;

  v6 = a6;
  v9 = a3;
  v10 = (__CFString *)a5;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    while (1)
    {
      v13 = IOIteratorNext(self->devIterator);
      if (!v13)
        break;
      v14 = v13;
      v15 = IOObjectCopyClass(v13);
      if (v15)
      {
        v16 = v15;
        if (CFEqual(v15, v9)
          && (v17 = IORegistryEntryCreateCFProperty(v14, CFSTR("IORegistryEntryPropertyKeys"), 0, 0)) != 0)
        {
          v18 = v17;
          if (v6)
            CFProperty = sub_19B6B7D88(v14, v17, v11, v6);
          else
            CFProperty = IORegistryEntryCreateCFProperty(v14, v11, 0, 0);
          v12 = (void *)CFProperty;
          CFRelease(v18);
        }
        else
        {
          v12 = 0;
        }
        CFRelease(v16);
      }
      else
      {
        v12 = 0;
      }
      IOObjectRelease(v14);
      if (v12)
        goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_17:

  return v12;
}

- (void)copyDeviceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  int v6;
  uint64_t v7;
  __CFString *v10;
  io_registry_entry_t v11;
  io_registry_entry_t v12;
  CFTypeRef CFProperty;
  const void *v14;
  CFTypeRef v15;
  void *v16;

  v6 = a6;
  v7 = a4;
  v10 = (__CFString *)a5;
  while (1)
  {
    v11 = -[MGIOKitHelper copyDeviceTreeStructureNext:withFirstChar:](self, "copyDeviceTreeStructureNext:withFirstChar:", a3, v7);
    if (!v11)
      break;
    v12 = v11;
    CFProperty = IORegistryEntryCreateCFProperty(v11, CFSTR("IORegistryEntryPropertyKeys"), 0, 0);
    if (CFProperty)
    {
      v14 = CFProperty;
      if (v6)
        v15 = sub_19B6B7D88(v12, CFProperty, v10, v6);
      else
        v15 = IORegistryEntryCreateCFProperty(v12, v10, 0, 0);
      v16 = (void *)v15;
      CFRelease(v14);
    }
    else
    {
      v16 = 0;
    }
    IOObjectRelease(v12);
    if (v16)
      goto LABEL_12;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (__CFNumber)copyNumberFromData:(__CFData *)a3
{
  CFTypeID v4;
  CFIndex Length;
  const UInt8 *BytePtr;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  const UInt8 *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  __int16 v26;
  uint8_t buf[2];

  if (!a3)
    return 0;
  v4 = CFGetTypeID(a3);
  if (v4 != CFDataGetTypeID())
  {
    v8 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v8)
      v14 = v8 + 1;
    else
      v14 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v14, 279, (uint64_t)CFSTR("can't create number"), v9, v10, v11, v12, v13, v26);
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return 0;
    v26 = 0;
    v15 = MEMORY[0x1E0C81028];
    v16 = "can't create number";
    v17 = (uint8_t *)&v26;
LABEL_18:
    _os_log_impl(&dword_19B6B1000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
    return 0;
  }
  Length = CFDataGetLength(a3);
  if (Length >= 8)
  {
    BytePtr = CFDataGetBytePtr(a3);
    return CFNumberCreate(0, kCFNumberSInt64Type, BytePtr);
  }
  if (Length != 4)
  {
    v19 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v19)
      v25 = v19 + 1;
    else
      v25 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v25, 276, (uint64_t)CFSTR("can't create number from data"), v20, v21, v22, v23, v24, v26);
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x1E0C81028];
    v16 = "can't create number from data";
    v17 = buf;
    goto LABEL_18;
  }
  v18 = CFDataGetBytePtr(a3);
  return CFNumberCreate(0, kCFNumberSInt32Type, v18);
}

- (__CFNumber)copyNumberFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  const void *v13;
  __CFNumber *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v6 = a6;
  v8 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[MGIOKitHelper copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:](self, "copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:", v10, v8, v11, v6);
  if (v12)
  {
    v13 = v12;
    v14 = -[MGIOKitHelper copyNumberFromData:](self, "copyNumberFromData:", v12);
    CFRelease(v13);
  }
  else
  {
    v15 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v15)
      v21 = v15 + 1;
    else
      v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v21, 301, (uint64_t)CFSTR("Failed to retrieve data %@:%@"), v16, v17, v18, v19, v20, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

- (__CFString)copyStringFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  const __CFData *v12;
  const __CFData *v13;
  CFTypeID TypeID;
  __CFString *Mutable;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  CFTypeID v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  char v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v6 = a6;
  v8 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[MGIOKitHelper copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:](self, "copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:", v10, v8, v11, v6);
  if (v12)
  {
    v13 = v12;
    TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v13))
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      BytePtr = CFDataGetBytePtr(v13);
      Length = CFDataGetLength(v13);
      if (Length >= 1)
      {
        v18 = Length;
        do
        {
          v19 = *BytePtr++;
          CFStringAppendFormat(Mutable, 0, CFSTR("%X"), v19);
          --v18;
        }
        while (v18);
      }
LABEL_20:
      CFRelease(v13);
      v13 = (const __CFData *)Mutable;
      goto LABEL_21;
    }
    v27 = CFStringGetTypeID();
    if (v27 != CFGetTypeID(v13))
    {
      v28 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
      if (v28)
        v34 = v28 + 1;
      else
        v34 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
      _MGLog((uint64_t)v34, 337, (uint64_t)CFSTR("Unsupported type."), v29, v30, v31, v32, v33, v36);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported type.", buf, 2u);
      }
      Mutable = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v20 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v20)
      v26 = v20 + 1;
    else
      v26 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v26, 321, (uint64_t)CFSTR("Failed to retrieve data %@:%@"), v21, v22, v23, v24, v25, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v10;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    v13 = 0;
  }
LABEL_21:

  return (__CFString *)v13;
}

- (__CFString)copyStringFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  const __CFData *v12;
  const __CFData *v13;
  CFTypeID TypeID;
  __CFString *Mutable;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  CFTypeID v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  char v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v6 = a6;
  v8 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[MGIOKitHelper copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:](self, "copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:", v10, v8, v11, v6);
  if (v12)
  {
    v13 = v12;
    TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v13))
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      BytePtr = CFDataGetBytePtr(v13);
      Length = CFDataGetLength(v13);
      if (Length >= 1)
      {
        v18 = Length;
        do
        {
          v19 = *BytePtr++;
          CFStringAppendFormat(Mutable, 0, CFSTR("%X"), v19);
          --v18;
        }
        while (v18);
      }
LABEL_20:
      CFRelease(v13);
      v13 = (const __CFData *)Mutable;
      goto LABEL_21;
    }
    v27 = CFStringGetTypeID();
    if (v27 != CFGetTypeID(v13))
    {
      v28 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
      if (v28)
        v34 = v28 + 1;
      else
        v34 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
      _MGLog((uint64_t)v34, 374, (uint64_t)CFSTR("Unsupported type."), v29, v30, v31, v32, v33, v36);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported type.", buf, 2u);
      }
      Mutable = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v20 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v20)
      v26 = v20 + 1;
    else
      v26 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v26, 358, (uint64_t)CFSTR("Failed to retrieve data %@:%@"), v21, v22, v23, v24, v25, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v10;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    v13 = 0;
  }
LABEL_21:

  return (__CFString *)v13;
}

- (void)copyPropertyFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a6;
  v8 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[MGIOKitHelper copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:](self, "copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:", v10, v8, v11, v6);
  if (!v12)
  {
    v13 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v13)
      v19 = v13 + 1;
    else
      v19 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v19, 394, (uint64_t)CFSTR("Failed to retrieve data %@:%@"), v14, v15, v16, v17, v18, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
  }

  return v12;
}

- (__CFData)copyDataFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CFTypeID TypeID;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v6 = a6;
  v8 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[MGIOKitHelper copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:](self, "copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:", v10, v8, v11, v6);
  if (!v12)
  {
    v22 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v22)
      v28 = v22 + 1;
    else
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v28, 415, (uint64_t)CFSTR("Failed to retrieve data %@:%@"), v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v13 = v12;
  TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    v15 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v15)
      v21 = v15 + 1;
    else
      v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v21, 421, (uint64_t)CFSTR("Unsupported type: %@"), v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v13;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }
    CFRelease(v13);
LABEL_14:
    v13 = 0;
  }

  return (__CFData *)v13;
}

- (__CFData)copyDataFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CFTypeID TypeID;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v6 = a6;
  v8 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[MGIOKitHelper copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:](self, "copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:", v10, v8, v11, v6);
  if (!v12)
  {
    v22 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v22)
      v28 = v22 + 1;
    else
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v28, 440, (uint64_t)CFSTR("Failed to retrieve data %@:%@"), v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v13 = v12;
  TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    v15 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v15)
      v21 = v15 + 1;
    else
      v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v21, 446, (uint64_t)CFSTR("Unsupported type: %@"), v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v13;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }
    CFRelease(v13);
LABEL_14:
    v13 = 0;
  }

  return (__CFData *)v13;
}

- (__CFBoolean)copyBooleanFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CFTypeID TypeID;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v6 = a6;
  v8 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[MGIOKitHelper copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:](self, "copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:", v10, v8, v11, v6);
  if (!v12)
  {
    v22 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v22)
      v28 = v22 + 1;
    else
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v28, 467, (uint64_t)CFSTR("Failed to retrieve data %@:%@"), v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to retrieve data %@:%@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  v13 = v12;
  TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    v15 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
    if (v15)
      v21 = v15 + 1;
    else
      v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    _MGLog((uint64_t)v21, 473, (uint64_t)CFSTR("Unsupported type: %@"), v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v13;
      _os_log_impl(&dword_19B6B1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }
    CFRelease(v13);
LABEL_14:
    v13 = 0;
  }

  return (__CFBoolean *)v13;
}

- (__CFArray)iteratorCopyBusyServiceNames
{
  __CFArray *Mutable;
  io_object_t v4;
  io_object_t v5;
  NSObject *v6;
  CFStringRef v7;
  CFStringRef v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  __CFArray *Copy;
  uint32_t busyState;
  uint8_t buf[4];
  CFStringRef v27;
  __int16 v28;
  uint32_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v4 = IOIteratorNext(self->devIterator);
  if (v4)
  {
    v5 = v4;
    v6 = MEMORY[0x1E0C81028];
    do
    {
      v7 = IOObjectCopyClass(v5);
      if (v7)
      {
        v8 = v7;
        busyState = -1;
        if (IOServiceGetBusyState(v5, &busyState))
        {
          v9 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
          if (v9)
            v15 = v9 + 1;
          else
            v15 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
          _MGLog((uint64_t)v15, 499, (uint64_t)CFSTR("Failed to get busy state for service: %@"), v10, v11, v12, v13, v14, (char)v8);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v8;
            _os_log_impl(&dword_19B6B1000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get busy state for service: %@", buf, 0xCu);
          }
        }
        else if (busyState)
        {
          v16 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m", 47);
          if (v16)
            v22 = v16 + 1;
          else
            v22 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
          _MGLog((uint64_t)v22, 495, (uint64_t)CFSTR("Found busy service: %@: busyState: %d"), v17, v18, v19, v20, v21, (char)v8);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v8;
            v28 = 1024;
            v29 = busyState;
            _os_log_impl(&dword_19B6B1000, v6, OS_LOG_TYPE_DEFAULT, "Found busy service: %@: busyState: %d", buf, 0x12u);
          }
          CFArrayAppendValue(Mutable, v8);
        }
        CFRelease(v8);
      }
      IOObjectRelease(v5);
      v5 = IOIteratorNext(self->devIterator);
    }
    while (v5);
  }
  Copy = CFArrayCreateCopy(0, Mutable);
  CFRelease(Mutable);
  return Copy;
}

@end
