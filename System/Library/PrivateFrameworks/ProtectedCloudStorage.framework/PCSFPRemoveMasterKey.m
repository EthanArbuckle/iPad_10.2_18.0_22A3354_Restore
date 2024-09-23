@implementation PCSFPRemoveMasterKey

void __PCSFPRemoveMasterKey_block_invoke(uint64_t a1, CFDataRef theData)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v6;
  size_t v7;

  Length = CFDataGetLength(theData);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 32));
  v6 = CFDataGetBytePtr(theData);
  if (*(_QWORD *)(a1 + 40) >= Length)
    v7 = Length;
  else
    v7 = *(_QWORD *)(a1 + 40);
  if (!memcmp(BytePtr, v6, v7))
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), theData);
}

@end
