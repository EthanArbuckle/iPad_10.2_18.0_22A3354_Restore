@implementation TSDCGContextHasTileOffset

uint64_t __TSDCGContextHasTileOffset_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 40)), "objectForKey:", CFSTR("TSDCGContextInfoDictionaryKeyTileOffset"));
  result = TSUDynamicCast();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end
