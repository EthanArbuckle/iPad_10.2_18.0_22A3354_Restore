@implementation PCSFPMasterKeyIDHintConflict

unint64_t ___PCSFPMasterKeyIDHintConflict_block_invoke(unint64_t result, CFDataRef theData)
{
  unint64_t v3;
  const UInt8 *BytePtr;
  const UInt8 *v5;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v3 = result;
    result = CFDataGetLength(theData);
    if (result >= *(_QWORD *)(v3 + 40))
    {
      BytePtr = CFDataGetBytePtr(theData);
      v5 = CFDataGetBytePtr(*(CFDataRef *)(v3 + 48));
      result = memcmp(BytePtr, v5, *(_QWORD *)(v3 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = (_DWORD)result == 0;
    }
  }
  return result;
}

@end
