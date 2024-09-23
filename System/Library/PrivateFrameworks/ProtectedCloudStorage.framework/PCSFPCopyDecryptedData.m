@implementation PCSFPCopyDecryptedData

uint64_t __PCSFPCopyDecryptedData_block_invoke(uint64_t result, CFDataRef theData, const __CFData *a3)
{
  uint64_t v5;
  const UInt8 *BytePtr;
  const UInt8 *v7;
  const void **v8;
  const void *v9;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v5 = result;
    result = CFDataGetLength(theData);
    if (result > *(_QWORD *)(v5 + 40))
    {
      BytePtr = CFDataGetBytePtr(theData);
      v7 = CFDataGetBytePtr(*(CFDataRef *)(v5 + 48));
      result = memcmp(BytePtr, v7, *(_QWORD *)(v5 + 40));
      if (!(_DWORD)result)
      {
        v8 = *(const void ***)(v5 + 56);
        if (v8)
        {
          v9 = *v8;
          if (*v8)
          {
            *v8 = 0;
            CFRelease(v9);
            v8 = *(const void ***)(v5 + 56);
          }
        }
        result = (uint64_t)PCSFPCopyDecryptedDataWithKey(a3, *(const __CFData **)(v5 + 64), *(const __CFData **)(v5 + 72), v8);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = result;
      }
    }
  }
  return result;
}

@end
