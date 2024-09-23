@implementation TSDCGContextGetShadowedLayoutAngle

double __TSDCGContextGetShadowedLayoutAngle_block_invoke(uint64_t a1, void *a2)
{
  float v3;
  double result;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 40)), "objectForKey:", CFSTR("TSDCGContextInfoDictionaryKeyShadowedLayoutAngle")), "floatValue");
  result = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
