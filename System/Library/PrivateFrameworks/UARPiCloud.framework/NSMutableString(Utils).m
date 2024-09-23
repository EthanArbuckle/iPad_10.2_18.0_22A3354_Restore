@implementation NSMutableString(Utils)

- (void)appendWithTabDepth:()Utils format:
{
  CFStringRef i;
  va_list va;

  va_start(va, format);
  for (i = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, format, va); a3; --a3)
    objc_msgSend(a1, "appendString:", CFSTR("\t"));
  objc_msgSend(a1, "appendString:", i);
  CFRelease(i);
}

@end
