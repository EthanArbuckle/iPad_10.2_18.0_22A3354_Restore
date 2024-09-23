@implementation QPDataDetectorsEnumerateDatesInString

void __QPDataDetectorsEnumerateDatesInString_block_invoke()
{
  QPDataDetectorsParser *v0;
  void *v1;

  v0 = objc_alloc_init(QPDataDetectorsParser);
  v1 = (void *)QPDataDetectorsEnumerateDatesInString::ddParser;
  QPDataDetectorsEnumerateDatesInString::ddParser = (uint64_t)v0;

}

uint64_t __QPDataDetectorsEnumerateDatesInString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
    *a5 = 1;
  return result;
}

@end
