@implementation NSValue(PVTransformAnimation)

+ (uint64_t)valueWithPVTransformAnimationInfo:()PVTransformAnimation
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{PVTransformAnimationInfo={?=qiIq}{CGPoint=dd}dd}");
}

- (uint64_t)PVTransformAnimationInfoValue
{
  uint64_t v4;
  uint64_t v5;

  v4 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)x8_0 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(v4 + 16);
  *(_QWORD *)(x8_0 + 24) = 0;
  *(_QWORD *)(x8_0 + 32) = 0;
  *(_QWORD *)(x8_0 + 16) = v5;
  *(_OWORD *)(x8_0 + 40) = xmmword_1B304EED0;
  return objc_msgSend(a1, "getValue:size:");
}

@end
