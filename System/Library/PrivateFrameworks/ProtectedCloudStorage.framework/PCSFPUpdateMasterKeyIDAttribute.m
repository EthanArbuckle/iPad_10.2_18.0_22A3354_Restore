@implementation PCSFPUpdateMasterKeyIDAttribute

const UInt8 *__PCSFPUpdateMasterKeyIDAttribute_block_invoke(_QWORD *a1, CFDataRef theData)
{
  const UInt8 *result;
  uint64_t v4;
  uint64_t v5;

  result = CFDataGetBytePtr(theData);
  v4 = a1[6];
  v5 = a1[7];
  *(_QWORD *)(v4 + 16 * *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24) + 8) = result;
  *(_QWORD *)(v4 + 16 * (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))++) = v5;
  return result;
}

@end
