@implementation TSDCGContextPrefersRasterRendering

uint64_t __TSDCGContextPrefersRasterRendering_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)), "objectForKeyedSubscript:", CFSTR("TSDCGContextInfoDictionaryKeyPrefersRasterRendering")), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
