@implementation NSData

- (id)asHexString
{
  CFIndex Length;
  __CFString *Mutable;
  const UInt8 *BytePtr;
  CFIndex v6;
  CFIndex v7;
  unsigned int v8;

  Length = CFDataGetLength((CFDataRef)self);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * Length);
  BytePtr = CFDataGetBytePtr((CFDataRef)self);
  v6 = CFDataGetLength((CFDataRef)self);
  if (v6 >= 1)
  {
    v7 = v6;
    do
    {
      v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v8);
      --v7;
    }
    while (v7);
  }
  return Mutable;
}

@end
