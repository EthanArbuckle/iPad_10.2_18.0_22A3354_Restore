@implementation TSDCGContextHasBackgroundsSuppressed

uint64_t __TSDCGContextHasBackgroundsSuppressed_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 40)), "objectForKey:", CFSTR("TSDCGContextInfoDictionaryKeyHasBackgroundsSuppressed")), "BOOLValue");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
