@implementation IOKitUtilities

+ (int)uint32ForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(unsigned int *)a5
{
  void *CFProperty;
  uint64_t v7;
  int v8;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, kCFAllocatorDefault, 0);
  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(CFProperty, v7) & 1) != 0)
  {
    v8 = 0;
    *a5 = objc_msgSend(CFProperty, "unsignedLongValue");
  }
  else
  {
    v8 = -536870160;
  }

  return v8;
}

+ (int)uint64ForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(unint64_t *)a5
{
  void *CFProperty;
  int v7;
  uint64_t v8;
  int v9;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, kCFAllocatorDefault, 0);
  if (CFProperty)
    v7 = 0;
  else
    v7 = -536870212;
  v8 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(CFProperty, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = -536870160;
  if (!v9)
    *a5 = (unint64_t)objc_msgSend(CFProperty, "unsignedLongLongValue");

  return v9;
}

+ (int)arrayForRegistryEntry:(unsigned int)a3 andKey:(id)a4 outValue:(id *)a5
{
  void *CFProperty;
  uint64_t v7;
  int v8;

  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, kCFAllocatorDefault, 0);
  v7 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(CFProperty, v7) & 1) != 0)
  {
    v8 = 0;
    *a5 = objc_retainAutorelease(CFProperty);
  }
  else
  {
    v8 = -536870160;
  }

  return v8;
}

+ (int)isRegistryEntry:(unsigned int)a3 descendentOfRegistryEntry:(unsigned int)a4 outValue:(BOOL *)a5
{
  int result;
  io_registry_entry_t v9;
  io_object_t v10;
  io_registry_entry_t parent;

  result = -536870206;
  if (a3 && a4 && a5)
  {
    v9 = a3;
    do
    {
      v10 = v9;
      if (v9 == a4)
        break;
      parent = 0;
      result = IORegistryEntryGetParentEntry(v9, "IOService", &parent);
      if (result)
        return result;
      if (v10 != a3)
        IOObjectRelease(v10);
      v9 = parent;
    }
    while (parent);
    result = 0;
    *a5 = v10 == a4;
  }
  return result;
}

@end
