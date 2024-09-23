@implementation TSDCGContextIsShadowContext

uint64_t __TSDCGContextIsShadowContext_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 40)), "objectForKey:", CFSTR("TSDCGContextInfoDictionaryKeyShadowedLayoutAngle"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

@end
