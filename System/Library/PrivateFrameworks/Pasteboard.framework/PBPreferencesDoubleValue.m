@implementation PBPreferencesDoubleValue

uint64_t __PBPreferencesDoubleValue_block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  double v3;

  v2 = result;
  if (a2)
    result = objc_msgSend(a2, "doubleValue");
  else
    v3 = *(double *)(result + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = (uint64_t)v3;
  return result;
}

@end
