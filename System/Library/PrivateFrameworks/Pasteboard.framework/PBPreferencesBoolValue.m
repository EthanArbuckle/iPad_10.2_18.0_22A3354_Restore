@implementation PBPreferencesBoolValue

uint64_t __PBPreferencesBoolValue_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    result = objc_msgSend(a2, "BOOLValue");
  else
    result = *(_BYTE *)(a1 + 40) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
