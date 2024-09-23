@implementation UIDevice(TSUAdditions)

+ (uint64_t)platformString
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  size_t size;

  result = platformString_s_platformString;
  if (!platformString_s_platformString)
  {
    objc_sync_enter(obj);
    if (!platformString_s_platformString)
    {
      size = 0;
      sysctlbyname("hw.machine", 0, &size, 0, 0);
      v3 = malloc_type_malloc(size, 0xFAF4E20AuLL);
      sysctlbyname("hw.machine", v3, &size, 0, 0);
      v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v3);
      free(v3);
      __dmb(0xBu);
      platformString_s_platformString = v4;
      if (!v4)
      {
        v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[UIDevice(TSUAdditions) platformString]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/UIDevice_TSUAdditions.m"), 34, CFSTR("Couldn't initialize lazy variable %s"), "s_platformString");
      }
    }
    objc_sync_exit(obj);
    return platformString_s_platformString;
  }
  return result;
}

@end
