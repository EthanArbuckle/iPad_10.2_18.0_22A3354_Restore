@implementation VKStickerEffectInternal

+ (VKStickerEffectInternal)makeNewEffect
{
  return (VKStickerEffectInternal *)objc_alloc_init(_VKStickerEffectInternal);
}

+ (VKStickerEffectInternal)noneEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal noneEffect](_VKStickerEffectInternal, "noneEffect");
}

+ (VKStickerEffectInternal)comicEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal comicEffect](_VKStickerEffectInternal, "comicEffect");
}

+ (VKStickerEffectInternal)strokeEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal strokeEffect](_VKStickerEffectInternal, "strokeEffect");
}

+ (VKStickerEffectInternal)puffyEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal puffyEffect](_VKStickerEffectInternal, "puffyEffect");
}

+ (VKStickerEffectInternal)iridescentEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal iridescentEffect](_VKStickerEffectInternal, "iridescentEffect");
}

@end
