@implementation _VKStickerEffectInternal

- (unint64_t)type
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_type);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)description
{
  void *v2;

  swift_beginAccess();
  v2 = (void *)sub_249D8B8B8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isStroked
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isStroked;
  swift_beginAccess();
  return *v2;
}

- (void)setIsStroked:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isStroked;
  swift_beginAccess();
  *v4 = a3;
}

- (float)strokeRadius
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setStrokeRadius:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (float)strokeBlurRadius
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setStrokeBlurRadius:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (float)smallStrokeRadiusMultiplier
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
  swift_beginAccess();
  return *v2;
}

- (void)setSmallStrokeRadiusMultiplier:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)forceSmallStrokeRadiusMultiplier
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier;
  swift_beginAccess();
  return *v2;
}

- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isPuffy
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isPuffy;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPuffy:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isPuffy;
  swift_beginAccess();
  *v4 = a3;
}

- (float)normalsRadius
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_normalsRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalsRadius:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_normalsRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (int)iridescence
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  return *v2;
}

- (void)setIridescence:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)applyIridescenceBeforeStroke
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke;
  swift_beginAccess();
  return *v2;
}

- (void)setApplyIridescenceBeforeStroke:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isBrushed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isBrushed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsBrushed:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isBrushed;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)applyBrushBeforeStroke
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke;
  swift_beginAccess();
  return *v2;
}

- (void)setApplyBrushBeforeStroke:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke;
  swift_beginAccess();
  *v4 = a3;
}

- (float)shadowRadius
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setShadowRadius:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (float)shadowAlpha
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
  swift_beginAccess();
  return *v2;
}

- (void)setShadowAlpha:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
  swift_beginAccess();
  *v4 = a3;
}

- (double)shadowOffset
{
  uint64_t v1;

  v1 = a1 + OBJC_IVAR____VKStickerEffectInternal_shadowOffset;
  swift_beginAccess();
  return *(double *)v1;
}

- (void)setShadowOffset:(_VKStickerEffectInternal *)self
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = v2;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____VKStickerEffectInternal_shadowOffset);
  swift_beginAccess();
  *v4 = v3;
}

- (double)shadowParallax
{
  uint64_t v1;

  v1 = a1 + OBJC_IVAR____VKStickerEffectInternal_shadowParallax;
  swift_beginAccess();
  return *(double *)v1;
}

- (void)setShadowParallax:(_VKStickerEffectInternal *)self
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = v2;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____VKStickerEffectInternal_shadowParallax);
  swift_beginAccess();
  *v4 = v3;
}

- (float)smallShadowSizeMultiplier
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
  swift_beginAccess();
  return *v2;
}

- (void)setSmallShadowSizeMultiplier:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
  swift_beginAccess();
  *v4 = a3;
}

- (float)smallShadowAlphaMultiplier
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier);
  swift_beginAccess();
  return *v2;
}

- (void)setSmallShadowAlphaMultiplier:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isComicEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isComicEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsComicEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isComicEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)requiresDeviceMotion
{
  return sub_249D74104() & 1;
}

- (BOOL)isCurlEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCurlEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (void)applyComicParameters
{
  uint64_t v2;
  _VKStickerEffectInternal *v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  uint64_t v7;
  _VKStickerEffectInternal *v8;

  v2 = qword_2578D3BC8;
  v3 = self;
  if (v2 != -1)
  {
    v8 = v3;
    swift_once();
    v3 = v8;
  }
  v4 = qword_2578D46A8;
  v5 = (char *)v3 + OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  v6 = unk_2578D468C;
  v7 = unk_2578D469C;
  *v5 = byte_2578D4688;
  *(_OWORD *)(v5 + 4) = v6;
  *(_QWORD *)(v5 + 20) = v7;
  *((_QWORD *)v5 + 4) = v4;

}

- (void)applyComicInkParameters
{
  uint64_t v2;
  _VKStickerEffectInternal *v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  uint64_t v7;
  _VKStickerEffectInternal *v8;

  v2 = qword_2578D3BD0;
  v3 = self;
  if (v2 != -1)
  {
    v8 = v3;
    swift_once();
    v3 = v8;
  }
  v4 = qword_2578D46D0;
  v5 = (char *)v3 + OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  v6 = unk_2578D46B4;
  v7 = unk_2578D46C4;
  *v5 = byte_2578D46B0;
  *(_OWORD *)(v5 + 4) = v6;
  *(_QWORD *)(v5 + 20) = v7;
  *((_QWORD *)v5 + 4) = v4;

}

+ (_VKStickerEffectInternal)noneEffect
{
  return (_VKStickerEffectInternal *)sub_249D74E64((uint64_t)a1, (uint64_t)a2, &qword_2578D3BD8, (id *)&qword_2578D3E40);
}

+ (_VKStickerEffectInternal)strokeEffect
{
  return (_VKStickerEffectInternal *)sub_249D74E64((uint64_t)a1, (uint64_t)a2, &qword_2578D3BE0, (id *)&qword_2578D3E48);
}

+ (_VKStickerEffectInternal)comicEffect
{
  return (_VKStickerEffectInternal *)sub_249D74E64((uint64_t)a1, (uint64_t)a2, &qword_2578D3BE8, (id *)&qword_2578D3E50);
}

+ (_VKStickerEffectInternal)puffyEffect
{
  return (_VKStickerEffectInternal *)sub_249D74E64((uint64_t)a1, (uint64_t)a2, &qword_2578D3BF0, (id *)&qword_2578D3E58);
}

+ (_VKStickerEffectInternal)iridescentEffect
{
  return (_VKStickerEffectInternal *)sub_249D74E64((uint64_t)a1, (uint64_t)a2, &qword_2578D3BF8, (id *)&qword_2578D3E60);
}

- (_VKStickerEffectInternal)init
{
  return (_VKStickerEffectInternal *)StickerEffect.init()();
}

@end
