@implementation UIDevice

void __40__UIDevice_TSUAdditions__platformString__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  size_t size;

  size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v0 = malloc_type_malloc(size, 0xAA6AC045uLL);
  sysctlbyname("hw.machine", v0, &size, 0, 0);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v0);
  free(v0);
  platformString_s_platformString = v1;
  if (!v1)
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[UIDevice(TSUAdditions) platformString]_block_invoke");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/UIDevice_TSUAdditions.m"), 36, 0, "invalid nil value for '%{public}s'", "s_platformString");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
}

@end
