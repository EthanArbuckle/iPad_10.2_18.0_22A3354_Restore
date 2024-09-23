@implementation PVMotionEffect

- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  PVMotionEffectTextComponent *textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  textComponent = self->_textComponent;
  v9 = *a3;
  -[PVMotionEffectTextComponent textEditingBoundsAtTime:forcePosterFrame:useParagraphBounds:includeDropShadow:includeMasks:](textComponent, "textEditingBoundsAtTime:forcePosterFrame:useParagraphBounds:includeDropShadow:includeMasks:", &v9, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textEditingBounds:(id *)a3
{
  PVMotionEffectTextComponent *textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  textComponent = self->_textComponent;
  v5 = *a3;
  -[PVMotionEffectTextComponent textEditingBounds:](textComponent, "textEditingBounds:", &v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  PVMotionEffectTextComponent *textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  textComponent = self->_textComponent;
  v8 = *a3;
  -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:viewSize:viewOrigin:](textComponent, "textTransformsAtTime:forcePosterFrame:viewSize:viewOrigin:", &v8, a4, *(_QWORD *)&a6, a5.width, a5.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  PVMotionEffectTextComponent *textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  textComponent = self->_textComponent;
  v9 = *a3;
  -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:](textComponent, "textTransformsAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &v9, a4, a5, *(_QWORD *)&a7, a6.width, a6.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  PVMotionEffectTextComponent *textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  textComponent = self->_textComponent;
  v10 = *a3;
  -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:](textComponent, "textTransformsAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", &v10, a4, a5, a6, *(_QWORD *)&a8, a7.width, a7.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9
{
  PVCGPointQuad *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  result = (PVCGPointQuad *)self->_textComponent;
  v11 = *a4;
  if (result)
    return (PVCGPointQuad *)-[PVCGPointQuad textCornersAtTime:index:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:](result, "textCornersAtTime:index:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v11, a5, a6, a7, *(_QWORD *)&a10, a8.x, a8.y, a9.width, a9.height);
  retstr->c = 0u;
  retstr->d = 0u;
  retstr->a = 0u;
  retstr->b = 0u;
  return result;
}

- (void)beginTextEditing
{
  -[PVMotionEffectTextComponent beginTextEditing](self->_textComponent, "beginTextEditing");
}

- (void)beginEditingTextAtIndex:(unsigned int)a3
{
  -[PVMotionEffectTextComponent beginEditingTextAtIndex:](self->_textComponent, "beginEditingTextAtIndex:", *(_QWORD *)&a3);
}

- (void)endTextEditing
{
  -[PVMotionEffectTextComponent endTextEditing](self->_textComponent, "endTextEditing");
}

- (void)endEditingTextAtIndex:(unsigned int)a3
{
  -[PVMotionEffectTextComponent endEditingTextAtIndex:](self->_textComponent, "endEditingTextAtIndex:", *(_QWORD *)&a3);
}

- (id)attributedStringAtIndex:(unint64_t)a3
{
  return -[PVMotionEffectTextComponent attributedStringAtIndex:](self->_textComponent, "attributedStringAtIndex:", a3);
}

- (id)defaultAttributedString:(unint64_t)a3
{
  return -[PVMotionEffectTextComponent defaultAttributedString:](self->_textComponent, "defaultAttributedString:", a3);
}

- (void)setString:(id)a3 atIndex:(unint64_t)a4
{
  -[PVMotionEffectTextComponent setString:atIndex:](self->_textComponent, "setString:atIndex:", a3, a4);
}

- (void)setAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  -[PVMotionEffectTextComponent setAttributedString:atIndex:](self->_textComponent, "setAttributedString:atIndex:", a3, a4);
}

- (id)mainTitle
{
  return -[PVMotionEffectTextComponent mainTitle](self->_textComponent, "mainTitle");
}

- (void)setMainTitle:(id)a3
{
  -[PVMotionEffectTextComponent setMainTitle:](self->_textComponent, "setMainTitle:", a3);
}

- (id)subtitle
{
  return -[PVMotionEffectTextComponent subtitle](self->_textComponent, "subtitle");
}

- (void)setSubtitle:(id)a3
{
  -[PVMotionEffectTextComponent setSubtitle:](self->_textComponent, "setSubtitle:", a3);
}

- (BOOL)supportsFlippingText
{
  return -[PVMotionEffectTextComponent supportsFlippingText](self->_textComponent, "supportsFlippingText");
}

- (BOOL)supportsOrientation
{
  return -[PVMotionEffectTextComponent supportsOrientation](self->_textComponent, "supportsOrientation");
}

- (BOOL)isTextFlipped
{
  return -[PVMotionEffectTextComponent isTextFlipped](self->_textComponent, "isTextFlipped");
}

- (BOOL)isTitleCard
{
  return -[PVMotionEffectTextComponent isTitleCard](self->_textComponent, "isTitleCard");
}

- (int)orientation
{
  return -[PVMotionEffectTextComponent orientation](self->_textComponent, "orientation");
}

- (BOOL)isTranscription
{
  return -[PVMotionEffectTranscriptionComponent isTranscription](self->_transcriptionComponent, "isTranscription");
}

- (void)clearTranscription
{
  -[PVMotionEffectTranscriptionComponent clearTranscription](self->_transcriptionComponent, "clearTranscription");
}

- (void)resetToDefaultTranscriptionForLocaleID:(id)a3
{
  -[PVMotionEffectTranscriptionComponent resetToDefaultTranscriptionForLocaleID:](self->_transcriptionComponent, "resetToDefaultTranscriptionForLocaleID:", a3);
}

- (void)setTranscriptionText:(id)a3
{
  -[PVMotionEffectTranscriptionComponent setTranscriptionText:](self->_transcriptionComponent, "setTranscriptionText:", a3);
}

- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4
{
  PVMotionEffectTranscriptionComponent *transcriptionComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  transcriptionComponent = self->_transcriptionComponent;
  v6 = *a4;
  return -[PVMotionEffectTranscriptionComponent transcriptionHitTest:time:](transcriptionComponent, "transcriptionHitTest:time:", &v6, a3.x, a3.y);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_transcriptionComponent;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE transcriptionDuration](result, "transcriptionDuration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8
{
  PVCGPointQuad *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  result = (PVCGPointQuad *)self->_transformComponent;
  v10 = *a4;
  if (result)
    return (PVCGPointQuad *)-[PVCGPointQuad cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:](result, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v10, a5, a6, *(_QWORD *)&a9, a7.x, a7.y, a8.width, a8.height);
  retstr->c = 0u;
  retstr->d = 0u;
  retstr->a = 0u;
  retstr->b = 0u;
  return result;
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  PVMotionEffectTransformComponent *transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  transformComponent = self->_transformComponent;
  v8 = *a3;
  -[PVMotionEffectTransformComponent transformAtTime:forcePosterFrame:viewSize:viewOrigin:](transformComponent, "transformAtTime:forcePosterFrame:viewSize:viewOrigin:", &v8, a4, *(_QWORD *)&a6, a5.width, a5.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  PVMotionEffectTransformComponent *transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  transformComponent = self->_transformComponent;
  v9 = *a3;
  -[PVMotionEffectTransformComponent transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:](transformComponent, "transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &v9, a4, a5, *(_QWORD *)&a7, a6.width, a6.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  PVMotionEffectTransformComponent *transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  transformComponent = self->_transformComponent;
  v10 = *a3;
  -[PVMotionEffectTransformComponent transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:](transformComponent, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", &v10, a4, a5, a6, *(_QWORD *)&a8, a7.width, a7.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addToTopLevelTransform:(_OWORD *)a3 atTime:(__int128 *)a4 forcePosterFrame:restrictToBounds:viewSize:viewOrigin:
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v10;
  uint64_t v11;
  _OWORD v12[8];

  v4 = *(void **)(a1 + 280);
  v5 = a3[5];
  v12[4] = a3[4];
  v12[5] = v5;
  v6 = a3[7];
  v12[6] = a3[6];
  v12[7] = v6;
  v7 = a3[1];
  v12[0] = *a3;
  v12[1] = v7;
  v8 = a3[3];
  v12[2] = a3[2];
  v12[3] = v8;
  v11 = *((_QWORD *)a4 + 2);
  v10 = *a4;
  objc_msgSend(v4, "addToTopLevelTransform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:", v12, &v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:
{
  __int128 v8;
  PVMotionEffectTransformComponent *transformComponent;
  __int128 v10;
  double v11;
  double v12;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;
  CGPoint result;

  v8 = *(_OWORD *)&a3->var0;
  transformComponent = self->_transformComponent;
  v10 = *(_OWORD *)a4;
  v13[1] = *(_OWORD *)&a3->var3;
  v14 = v10;
  v15 = *(_QWORD *)(a4 + 16);
  v13[0] = v8;
  -[PVMotionEffectTransformComponent convertPointToView:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:](transformComponent, "convertPointToView:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", v13, &v14, a5, a6, *(_QWORD *)&a8, a7.width, a7.height);
  result.y = v12;
  result.x = v11;
  return result;
}

- (uint64_t)convertPointToView:(__int128 *)a3 withEffectToViewTransform:(_OWORD *)a4 viewSize:
{
  __int128 v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[2];
  _OWORD v13[8];

  v4 = *a3;
  v5 = a3[1];
  v6 = *(void **)(a1 + 280);
  v7 = a4[5];
  v13[4] = a4[4];
  v13[5] = v7;
  v8 = a4[7];
  v13[6] = a4[6];
  v13[7] = v8;
  v9 = a4[1];
  v13[0] = *a4;
  v13[1] = v9;
  v10 = a4[3];
  v13[2] = a4[2];
  v13[3] = v10;
  v12[0] = v4;
  v12[1] = v5;
  return objc_msgSend(v6, "convertPointToView:withEffectToViewTransform:viewSize:", v12, v13);
}

- (int8x16_t)convertPointFromView:(uint64_t)a1@<X0> atTime:(__int128 *)a2@<X2> viewSize:(__n128 *)a3@<X8> viewOrigin:(__n128)a4@<Q2>
{
  void *v5;
  int8x16_t result;
  unint64_t v7;
  int8x16_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 280);
  v10 = *a2;
  v11 = *((_QWORD *)a2 + 2);
  if (v5)
  {
    objc_msgSend(v5, "convertPointFromView:atTime:viewSize:viewOrigin:", &v10);
    result = v8;
    v7 = vextq_s8(result, result, 8uLL).u64[0];
    a4.n128_u64[0] = v9;
  }
  else
  {
    result.i64[0] = 0;
    v7 = 0;
    a4.n128_u64[0] = 0;
  }
  result.i64[1] = v7;
  *a3 = (__n128)result;
  a3[1] = a4;
  return result;
}

- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7
{
  PVMotionEffectTransformComponent *transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  transformComponent = self->_transformComponent;
  v9 = *a4;
  -[PVMotionEffectTransformComponent setPositionInView:atTime:viewSize:viewOrigin:restrictToBounds:](transformComponent, "setPositionInView:atTime:viewSize:viewOrigin:restrictToBounds:", &v9, *(_QWORD *)&a6, a7, a3.x, a3.y, a5.width, a5.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8
{
  PVMotionEffectTransformComponent *transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  transformComponent = self->_transformComponent;
  v10 = *a4;
  -[PVMotionEffectTransformComponent scaleToFit:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:](transformComponent, "scaleToFit:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:", &v10, a5, *(_QWORD *)&a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6.width, a6.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTopLevelGroupTransform:(id)a3
{
  -[PVMotionEffectTransformComponent setTopLevelGroupTransform:](self->_transformComponent, "setTopLevelGroupTransform:", a3);
}

- (id)topLevelGroupTransform
{
  return -[PVMotionEffectTransformComponent topLevelGroupTransform](self->_transformComponent, "topLevelGroupTransform");
}

- (void)setTransform:(id)a3
{
  -[PVMotionEffectTransformComponent setTransform:](self->_transformComponent, "setTransform:", a3);
}

- (void)setScale:(PVMotionEffect *)self
{
  _OWORD *v2;
  __int128 v3;
  PVMotionEffectTransformComponent *transformComponent;
  _OWORD v5[2];

  v3 = v2[1];
  transformComponent = self->_transformComponent;
  v5[0] = *v2;
  v5[1] = v3;
  -[PVMotionEffectTransformComponent setScale:](transformComponent, "setScale:", v5);
}

- (int8x16_t)getScale
{
  void *v4;
  int8x16_t result;
  unint64_t v6;
  int8x16_t v7;
  unint64_t v8;

  v4 = *(void **)(a1 + 280);
  if (v4)
  {
    objc_msgSend(v4, "getScale");
    result = v7;
    v6 = vextq_s8(result, result, 8uLL).u64[0];
    a3.n128_u64[0] = v8;
  }
  else
  {
    result.i64[0] = 0;
    v6 = 0;
    a3.n128_u64[0] = 0;
  }
  result.i64[1] = v6;
  *a2 = (__n128)result;
  a2[1] = a3;
  return result;
}

- (id)cameraTransform
{
  return -[PVMotionEffectTransformComponent cameraTransform](self->_transformComponent, "cameraTransform");
}

- (id)cameraProjection
{
  return -[PVMotionEffectTransformComponent cameraProjection](self->_transformComponent, "cameraProjection");
}

- (void)enableCameraOverride:(id)a3 projection:(id)a4
{
  -[PVMotionEffectTransformComponent enableCameraOverride:projection:](self->_transformComponent, "enableCameraOverride:projection:", a3, a4);
}

- (void)disableCameraOverride
{
  -[PVMotionEffectTransformComponent disableCameraOverride](self->_transformComponent, "disableCameraOverride");
}

- (BOOL)isCameraOverrideEnabled
{
  return -[PVMotionEffectTransformComponent isCameraOverrideEnabled](self->_transformComponent, "isCameraOverrideEnabled");
}

- (BOOL)transformUnitsAreInMeters
{
  return -[PVMotionEffectTransformComponent transformUnitsAreInMeters](self->_transformComponent, "transformUnitsAreInMeters");
}

- (void)setTransformUnitsAreInMeters:(BOOL)a3
{
  -[PVMotionEffectTransformComponent setTransformUnitsAreInMeters:](self->_transformComponent, "setTransformUnitsAreInMeters:", a3);
}

- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  PVMotionEffectTransformComponent *transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  transformComponent = self->_transformComponent;
  v9 = *a4;
  return -[PVMotionEffectTransformComponent bounds:atTime:forcePosterFrame:includeDropShadow:includeMasks:](transformComponent, "bounds:atTime:forcePosterFrame:includeDropShadow:includeMasks:", a3, &v9, a5, a6, a7);
}

- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  PVMotionEffectHitAreaComponent *hitAreaComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  hitAreaComponent = self->_hitAreaComponent;
  v10 = *a3;
  -[PVMotionEffectHitAreaComponent hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:](hitAreaComponent, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v10, a4, a5, *(_QWORD *)&a8, a6.x, a6.y, a7.width, a7.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  PVMotionEffectHitAreaComponent *hitAreaComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  hitAreaComponent = self->_hitAreaComponent;
  v13 = *a4;
  return -[PVMotionEffectHitAreaComponent hitTest:atTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:](hitAreaComponent, "hitTest:atTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:", &v13, a5, a7, *(_QWORD *)&a11, a3.x, a3.y, a6.x, a6.y, a8, a9, a10.width, a10.height);
}

- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11
{
  PVMotionEffectHitAreaComponent *hitAreaComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  hitAreaComponent = self->_hitAreaComponent;
  v13 = *a3;
  return -[PVMotionEffectHitAreaComponent createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:](hitAreaComponent, "createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:", &v13, a4, a6, *(_QWORD *)&a10, a11, a5.x, a5.y, a7, a8, a9.width, a9.height);
}

- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  PVMotionEffectHitAreaComponent *hitAreaComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  hitAreaComponent = self->_hitAreaComponent;
  v13 = *a4;
  -[PVMotionEffectHitAreaComponent objectHitTest:atTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:](hitAreaComponent, "objectHitTest:atTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:", &v13, a5, a7, *(_QWORD *)&a11, a3.x, a3.y, a6.x, a6.y, a8, a9, a10.width, a10.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)add3DObject:(id)a3 handle:(id)a4
{
  -[PVMotionEffectSceneManagerComponent add3DObject:handle:](self->_sceneManagerComponent, "add3DObject:handle:", a3, a4);
}

- (void)deleteObjectsWithHandles:(id)a3
{
  -[PVMotionEffectSceneManagerComponent deleteObjectsWithHandles:](self->_sceneManagerComponent, "deleteObjectsWithHandles:", a3);
}

- (id)handleForOZID:(unsigned int)a3
{
  return -[PVMotionEffectSceneManagerComponent handleForOZID:](self->_sceneManagerComponent, "handleForOZID:", *(_QWORD *)&a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE timelineDuration](result, "timelineDuration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (unsigned)timelineDurationInFrames
{
  return -[PVMotionEffectTimelineComponent timelineDurationInFrames](self->_timelineComponent, "timelineDurationInFrames");
}

- (double)timelineDurationInSeconds
{
  double result;

  -[PVMotionEffectTimelineComponent timelineDurationInSeconds](self->_timelineComponent, "timelineDurationInSeconds");
  return result;
}

- (double)timelineFrameRate
{
  double result;

  -[PVMotionEffectTimelineComponent timelineFrameRate](self->_timelineComponent, "timelineFrameRate");
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE timelineFrameDuration](result, "timelineFrameDuration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE timelineLastFrame](result, "timelineLastFrame");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  v5 = *a4;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE componentTimeFromTimelineTime:](result, "componentTimeFromTimelineTime:", &v5);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  v5 = *a4;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE timelineTimeFromComponentTime:](result, "timelineTimeFromComponentTime:", &v5);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3
{
  $202A6A048D39AE170264FF71A65A9479 *result;
  __int128 v5;
  _OWORD v6[3];

  result = ($202A6A048D39AE170264FF71A65A9479 *)self->_timelineComponent;
  v5 = *(_OWORD *)&a4->var0.var3;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  if (result)
    return ($202A6A048D39AE170264FF71A65A9479 *)-[$202A6A048D39AE170264FF71A65A9479 componentTimeRangeFromTimelineTimeRange:](result, "componentTimeRangeFromTimelineTimeRange:", v6);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3
{
  $202A6A048D39AE170264FF71A65A9479 *result;
  __int128 v5;
  _OWORD v6[3];

  result = ($202A6A048D39AE170264FF71A65A9479 *)self->_timelineComponent;
  v5 = *(_OWORD *)&a4->var0.var3;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  if (result)
    return ($202A6A048D39AE170264FF71A65A9479 *)-[$202A6A048D39AE170264FF71A65A9479 timelineTimeRangeFromComponentTimeRange:](result, "timelineTimeRangeFromComponentTimeRange:", v6);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- (id)timelineMarkers
{
  return -[PVMotionEffectTimelineComponent timelineMarkers](self->_timelineComponent, "timelineMarkers");
}

- (id)timelineMarkersOfType:(int)a3
{
  return -[PVMotionEffectTimelineComponent timelineMarkersOfType:](self->_timelineComponent, "timelineMarkersOfType:", *(_QWORD *)&a3);
}

- (id)posterFrameMarker
{
  return -[PVMotionEffectTimelineComponent posterFrameMarker](self->_timelineComponent, "posterFrameMarker");
}

- (void)setLoopTimeOverrideEnabled:(BOOL)a3
{
  -[PVMotionEffectTimelineComponent setLoopTimeOverrideEnabled:](self->_timelineComponent, "setLoopTimeOverrideEnabled:", a3);
}

- (BOOL)loopTimeOverrideEnabled
{
  return -[PVMotionEffectTimelineComponent loopTimeOverrideEnabled](self->_timelineComponent, "loopTimeOverrideEnabled");
}

- (void)setLoopTimeOverride:(id *)a3
{
  PVMotionEffectTimelineComponent *timelineComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  timelineComponent = self->_timelineComponent;
  v4 = *a3;
  -[PVMotionEffectTimelineComponent setLoopTimeOverride:](timelineComponent, "setLoopTimeOverride:", &v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE loopTimeOverride](result, "loopTimeOverride");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setForceDisableLoop:(BOOL)a3
{
  -[PVMotionEffectTimelineComponent setForceDisableLoop:](self->_timelineComponent, "setForceDisableLoop:", a3);
}

- (BOOL)forceDisableLoop
{
  return -[PVMotionEffectTimelineComponent forceDisableLoop](self->_timelineComponent, "forceDisableLoop");
}

- (void)setForceDisableBuildAnimation:(BOOL)a3
{
  -[PVMotionEffectTimelineComponent setForceDisableBuildAnimation:](self->_timelineComponent, "setForceDisableBuildAnimation:", a3);
}

- (BOOL)forceDisableBuildAnimation
{
  return -[PVMotionEffectTimelineComponent forceDisableBuildAnimation](self->_timelineComponent, "forceDisableBuildAnimation");
}

- (void)setUseLocalLoopTime:(BOOL)a3
{
  -[PVMotionEffectTimelineComponent setUseLocalLoopTime:](self->_timelineComponent, "setUseLocalLoopTime:", a3);
}

- (BOOL)useLocalLoopTime
{
  return -[PVMotionEffectTimelineComponent useLocalLoopTime](self->_timelineComponent, "useLocalLoopTime");
}

+ (id)newEffectWithURL:(id)a3
{
  id v3;
  PVMotionEffect *v4;
  void *v5;
  PVMotionEffect *v6;

  v3 = a3;
  v4 = [PVMotionEffect alloc];
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PVMotionEffect initWithEffectID:](v4, "initWithEffectID:", v5);

  return v6;
}

+ (id)newEffectWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  PVMotionEffect *v8;
  id v10;

  v3 = a3;
  if (v3)
  {
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/EffectWithData.moef"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v3, "writeToURL:options:error:", v6, 1073741825, &v10);
    v7 = v10;
    v8 = -[PVMotionEffect initWithEffectID:]([PVMotionEffect alloc], "initWithEffectID:", v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)handleApplicationWillTerminate
{
  +[PVDocumentCacheManager releaseSharedInstance](PVDocumentCacheManager, "releaseSharedInstance");
}

+ (void)handleApplicationDidReceiveMemoryWarning
{
  OZCacheManager *v2;
  TXFontManager *v3;
  OZFontManagerBase *Instance;
  PGHelium *v5;

  if (s_isMotionInitialized == 1)
  {
    v2 = (OZCacheManager *)OZCacheManager::Instance((OZCacheManager *)a1);
    OZCacheManager::clearTextureCache(v2);
    Instance = (OZFontManagerBase *)TXFontManager::getInstance(v3);
    v5 = (PGHelium *)OZFontManagerBase::purgeCachedFonts(Instance);
    PGHelium::purge(v5);
  }
}

+ (void)handleCleanupEffectsCache
{
  +[PVDocumentCacheManager removeAllEffects](PVDocumentCacheManager, "removeAllEffects");
}

+ (void)extractMetadataFromContentsOfFile:(id)a3 toCacheEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  TBXMLHelper *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int32_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  char v32;
  signed int v33;
  char v34;
  int64_t v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  char v40;
  char v41;
  char v42;
  int32_t v43;
  void *v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TBXMLHelper initWithContentsOfURL:]([TBXMLHelper alloc], "initWithContentsOfURL:", v7);
  if (-[TBXMLHelper parse](v8, "parse"))
  {
    -[TBXMLHelper sceneSettings](v8, "sceneSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("theme"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(CFSTR("Themes"), "stringByAppendingPathComponent:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "effectTemplatesBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", v11, CFSTR("***MISSING STRING***"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("***MISSING STRING***")) & 1) == 0)
      {
        v15 = v14;
        v16 = v10;
        v17 = v9;
        v18 = v6;
        v19 = v15;

        v20 = v19;
        v6 = v18;
        v9 = v17;
        v10 = v20;
      }
      objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("theme"));

    }
    objc_msgSend(v5, "pathExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("motn")))
    {

    }
    else
    {
      objc_msgSend(v5, "pathExtension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("moti"));

      if ((v23 & 1) == 0)
      {
        objc_msgSend(v5, "pathExtension");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("motr"));

        if (!v37)
          goto LABEL_34;
        objc_msgSend(v9, "objectForKey:", CFSTR("shouldOverrideFCDuration"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (!v38)
          goto LABEL_34;
        v40 = objc_msgSend(v38, "BOOLValue");

        if ((v40 & 1) == 0)
          goto LABEL_34;
      }
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("duration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "integerValue");

    objc_msgSend(v9, "objectForKey:", CFSTR("frameRate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25 < 1 || !v26 || (objc_msgSend(v26, "doubleValue"), v28 <= 0.0))
    {
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    objc_msgSend(v27, "doubleValue");
    v30 = v29;
    objc_msgSend(v9, "objectForKey:", CFSTR("NTSC"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    memset(&v47, 0, sizeof(v47));
    v33 = vcvtmd_s64_f64(v30 + 0.5 + 0.0000001);
    if (v33 == 30)
      v34 = v32;
    else
      v34 = 0;
    if ((v34 & 1) != 0)
    {
      v35 = 4004;
    }
    else
    {
      if (v33 == 24)
        v41 = v32;
      else
        v41 = 0;
      if ((v41 & 1) != 0)
      {
        v35 = 5005;
      }
      else
      {
        if (v33 == 60)
          v42 = v32;
        else
          v42 = 0;
        if ((v42 & 1) == 0)
        {
          if (v33)
          {
            if (600 / v33 * v33 == 600)
            {
              v35 = (uint64_t)(600 / v33) << 8;
              v43 = 153600;
              goto LABEL_32;
            }
            v43 = v33 << 8;
          }
          else
          {
            v43 = 7680;
          }
          v35 = 256;
LABEL_32:
          CMTimeMake(&v46, v35, v43);
          operator*(&v46, v25, &v47);
          v45 = v47;
          +[FigTimeObj timeWithTime:](FigTimeObj, "timeWithTime:", &v45);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v44, CFSTR("suggestedDuration"));

          goto LABEL_33;
        }
        v35 = 2002;
      }
    }
    v43 = 120000;
    goto LABEL_32;
  }
LABEL_35:

}

+ (id)effectMap
{
  if (+[PVMotionEffect effectMap]::once != -1)
    dispatch_once(&+[PVMotionEffect effectMap]::once, &__block_literal_global_14);
  return (id)+[PVMotionEffect effectMap]::sEffectMap;
}

void __27__PVMotionEffect_effectMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Cross Dissolve.localized/Cross Dissolve.motr"), CFSTR("1434131D-6C72-4FDB-8365-01B93DD44905"), CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Slide To Left.localized/Slide To Left.motr"), CFSTR("17546984-5563-442C-A5AA-ABC8DD26C3AB"), CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Slide To Right.localized/Slide To Right.motr"), CFSTR("1FF96A46-41CF-4454-9BA6-7887F249BCF2"), CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Slide To Top.localized/Slide To Top.motr"), CFSTR("2039D994-9DAE-40E8-B34F-8F12B78672E7"), CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Slide To Bottom.localized/Slide To Bottom.motr"), CFSTR("2DDB4EC6-E394-470C-B326-7BFA9744BC65"), CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Wipe To Left.localized/Wipe To Left.motr"), CFSTR("35B74472-3827-492A-94F8-3AD495876439"), CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Wipe To Right.localized/Wipe To Right.motr"), CFSTR("3E6CF06F-CED2-41CF-B469-9FFD995C33B0"), CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Wipe To Top.localized/Wipe To Top.motr"), CFSTR("46B43980-CBDF-43C1-BA0C-AC35120C16EA"), CFSTR(".../Transitions.localized/iMovie.localized/Basics.localized/Wipe To Bottom.localized/Wipe To Bottom.motr"),
         CFSTR("47BC340E-1358-4CEE-BCFD-3F9133B3ED8E"),
         CFSTR(".../Transitions.localized/iMovie.localized/Cutaways.localized/Picture In Picture.localized/Picture In Picture.motr"),
         CFSTR("570D6022-EAA4-4075-8AAA-32223C7A8D4E"),
         CFSTR(".../Transitions.localized/iMovie.localized/Cutaways.localized/Split Screen.localized/Split Screen.motr"),
         CFSTR("686E482D-F140-45D0-8136-1B8B4FDAB6D0"),
         CFSTR(".../Transitions.localized/iMovie.localized/Cutaways.localized/Green Screen.localized/Green Screen.motr"),
         CFSTR("C2B90894-CDDC-4FFF-9B2A-CD31CB33B106"),
         CFSTR(".../Effects.localized/iMovie.localized/Ken Burns.localized/Ken Burns.moef"),
         CFSTR("697D2F7A-CA06-48E5-82BF-95FD57AC6D1B"),
         CFSTR(".../Effects.localized/iMovie.localized/B&W.localized/B&W.moef"),
         CFSTR("E50C1035-19C5-4EFF-AAB4-B3008BC14D04"),
         CFSTR(".../Effects.localized/iMovie.localized/Blast.localized/Blast.moef"),
         CFSTR("CAA078D7-0ACA-432E-85B1-FB975BE96A80"),
         CFSTR(".../Effects.localized/iMovie.localized/Blockbuster.localized/Blockbuster.moef"),
         CFSTR("7F57747E-6F2A-4D31-806C-67B4F09A93CA"),
         CFSTR(".../Effects.localized/iMovie.localized/Blue.localized/Blue.moef"),
         CFSTR("8286EAE4-72A9-4739-970D-12A9EC5EE39D"),
         CFSTR(".../Effects.localized/iMovie.localized/Camo.localized/Camo.moef"),
         CFSTR("AE493655-7441-401C-82DA-2B53150ADF04"),
         CFSTR(".../Effects.localized/iMovie.localized/Dreamy.localized/Dreamy.moef"),
         CFSTR("BF65FA4F-DF9E-4BA1-AF3A-EDABE6AAC849"),
         CFSTR(".../Effects.localized/iMovie.localized/Duotone.localized/Duotone.moef"),
         CFSTR("B1AF5729-DBD8-458F-AA8C-14431E269F91"),
         CFSTR(".../Effects.localized/iMovie.localized/Silent Era.localized/Silent Era.moef"),
         CFSTR("F8AE5EB3-7B25-48EA-B553-A3ABC3BF4E22"),
         CFSTR(".../Effects.localized/iMovie.localized/Vintage.localized/Vintage.moef"),
         CFSTR("FDA1996F-CE2F-4D2B-9C02-63C38F6D260E"),
         CFSTR(".../Effects.localized/iMovie.localized/Western.localized/Western.moef"),
         CFSTR("F97E8C77-4E0D-4F19-9A5C-E738CB736808"),
         CFSTR(".../Effects.localized/iMovie.localized/FadeInOut Through Color.localized/FadeInOut Through Color.moef"),
         CFSTR("2DE6E421-5B7A-429F-9FDE-2727F3F893D6"),
         CFSTR(".../Titles.localized/iMovie.localized/Simple.localized/Box.localized/Box.moti"),
         CFSTR("67379F38-96D6-4E67-A5BD-DA0ADDA7BA45"),
         CFSTR(".../Titles.localized/iMovie.localized/Simple.localized/Lower Thirds.localized/Box.localized/Box.moti"),
         CFSTR("AA106B51-6EA0-487B-8090-C64F523302C7"),
         CFSTR(".../Titles.localized/iMovie.localized/Simple.localized/Chromatic.localized/Chromatic.moti"),
         CFSTR("F6F26720-0BEE-4E50-AF8B-F48333631B81"),
         CFSTR(".../Titles.localized/iMovie.localized/Simple.localized/Lower Thirds.localized/Chromatic.localized/Chromatic.moti"),
         CFSTR("B7B8CD36-9550-4E75-BB6D-8B3DE402F502"),
         CFSTR(".../Titles.localized/iMovie.localized/Simple.localized/Expand.localized/Expand.moti"),
         CFSTR("F2EDB25D-FDE3-4402-85FB-B977F3A2121D"),
         CFSTR(".../Titles.localized/iMovie.localized/Simple.localized/Lower Thirds.localized/Expand.localized/Expand.moti"),
         CFSTR("1AA45B2B-274B-4925-A00C-C79F8E74EBAD"),
         CFSTR(".../Titles.localized/iMovie.localized/Simple.localized/Focus.localized/Focus.moti"));
  v1 = (void *)+[PVMotionEffect effectMap]::sEffectMap;
  +[PVMotionEffect effectMap]::sEffectMap = v0;

}

+ (id)_effectPathFromID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "effectMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)registerTemplateInDirectory:(id)a3 relPath:(id)a4 effectID:(id)a5 doingRescan:(BOOL)a6 origCache:(id)a7 newCache:(id)a8
{
  id v10;
  void *v11;
  char v12;
  const __CFString *v13;
  __CFString **v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  id v53;
  id v54;

  v54 = a3;
  v10 = a4;
  v53 = a5;
  objc_msgSend(v10, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("moef"));

  if ((v12 & 1) != 0)
  {
    v13 = CFSTR("Effects.localized");
    v14 = kFFEffectType_VideoFilter;
  }
  else
  {
    objc_msgSend(v10, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("motn"));

    if ((v16 & 1) != 0)
    {
      v13 = CFSTR("Generators.localized");
      v14 = kFFEffectType_VideoGenerator;
    }
    else
    {
      objc_msgSend(v10, "pathExtension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("motr"));

      if ((v18 & 1) != 0)
      {
        v13 = CFSTR("Transitions.localized");
        v14 = kFFEffectType_VideoTransition;
      }
      else
      {
        objc_msgSend(v10, "pathExtension");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("moti"));

        if ((v20 & 1) == 0)
          goto LABEL_28;
        v13 = CFSTR("Titles.localized");
        v14 = kFFEffectType_VideoTitle;
      }
    }
  }
  v52 = *v14;
  if (objc_msgSend(v10, "hasPrefix:", CFSTR("...")))
  {
    objc_msgSend(v10, "substringFromIndex:", 4);
    v21 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v21;
  }
  objc_msgSend(v54, "stringByAppendingPathComponent:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastPathComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByDeletingPathExtension");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v24;
  objc_msgSend(v22, "stringByDeletingLastPathComponent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastPathComponent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByDeletingPathExtension");
  v27 = objc_claimAutoreleasedReturnValue();

  v49 = (void *)v27;
  if (objc_msgSend(v24, "isEqualToString:", v27))
    objc_msgSend(v25, "lastPathComponent");
  else
    objc_msgSend(v10, "lastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByDeletingPathExtension");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pathComponents");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v29, "count") >= 3)
  {
    objc_msgSend(v54, "stringByAppendingPathComponent:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndex:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByAppendingPathComponent:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "lastPathComponent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringByDeletingPathExtension");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = CFSTR("Motion");
  }
  objc_msgSend(v22, "stringByDeletingLastPathComponent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringByAppendingPathComponent:", CFSTR("large.png"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "fileExistsAtPath:", v36);

  if ((v38 & 1) == 0)
  {

    v36 = 0;
  }
  objc_msgSend(v22, "stringByDeletingLastPathComponent");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringByAppendingPathComponent:", CFSTR("small.png"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "fileExistsAtPath:", v40);

  if ((v42 & 1) == 0)
  {

    goto LABEL_23;
  }
  if (!v40)
  {
LABEL_23:
    objc_msgSend(v22, "stringByDeletingPathExtension");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringByAppendingPathExtension:", CFSTR("png"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "fileExistsAtPath:", v40);

    if ((v45 & 1) == 0)
    {

      v40 = 0;
    }
  }
  v46 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "dictionaryWithObjectsAndKeys:", v51, CFSTR("FFEffectProperty_DisplayName"), v30, CFSTR("FFEffectProperty_Category"), v52, CFSTR("FFEffectProperty_EffectType"), v47, CFSTR("FFEffectProperty_AvailableInSimpleMode"), v40, CFSTR("kFFEffectProperty_ThumbnailImagePath"), v36, CFSTR("kFFEffectProperty_PreviewImagePath"), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(0, "length"))
    objc_msgSend(v48, "setObject:forKey:", 0, CFSTR("kFFEffectProperty_Theme"));
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v53, v48);

LABEL_28:
}

+ (void)mapTemplatesInDirectory:(id)a3 doingRescan:(BOOL)a4 origCache:(id)a5 newCache:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "effectMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v19, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        v13 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v15);

        v17 = (void *)MEMORY[0x1B5E29C50]();
        objc_msgSend(a1, "_effectPathFromID:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "registerTemplateInDirectory:relPath:effectID:doingRescan:origCache:newCache:", v9, v18, v13, 0, v10, v11);

        objc_autoreleasePoolPop(v17);
        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);

  }
  if (objc_msgSend(v20, "count"))
  {
    NSLog(CFSTR("WARNING! Some Mapped effects were not found when registering them!"));
    NSLog(CFSTR("%@"), v20);
  }

}

+ (void)scanTemplatesInDirectory:(id)a3 doingRescan:(BOOL)a4 replaceMappedEffectPath:(BOOL)a5 origCache:(id)a6 newCache:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v9 = a5;
  v19 = a3;
  v11 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "enumeratorAtPath:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = (void *)v15)
  {
    objc_msgSend(v13, "nextObject");
    v15 = objc_claimAutoreleasedReturnValue();

    if (!v15)
      break;
    objc_msgSend(v19, "stringByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_msgSend(a1, "replacedMappedEffectWithNewPath:", v16) & 1) == 0)
    {
      objc_msgSend(CFSTR("..."), "stringByAppendingFormat:", CFSTR("/%@"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "registerTemplateInDirectory:relPath:effectID:doingRescan:origCache:newCache:", v19, v15, v17, 0, v11, v12);

    }
  }

}

+ (BOOL)replacedMappedEffectWithNewPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "effectMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v12))
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v10);

          v14 = 1;
          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

+ (void)registerNoneEffectForType:(id)a3 effectID:(id)a4 origCache:(id)a5 newCache:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v12, CFSTR("modDate"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v13, v9);

  objc_msgSend(v11, "setObject:forKey:", v13, v9);
  v14 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", CFSTR("None"), CFSTR("FFEffectProperty_DisplayName"), CFSTR("Motion"), CFSTR("FFEffectProperty_Category"), v17, CFSTR("FFEffectProperty_EffectType"), v15, CFSTR("FFEffectProperty_AvailableInSimpleMode"), 0, CFSTR("kFFEffectProperty_ThumbnailImagePath"), 0, CFSTR("kFFEffectProperty_PreviewImagePath"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v9, v16);
}

+ (id)_bundleLibPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void **v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectTemplatesBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "effectTemplatesDirectoryName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v6 = v4;
    v7 = v6;
    v21 = v6;
    v22[0] = 0;
    if (v6)
    {
      v8 = (void **)v22;
      v9 = v6;
      do
      {
        objc_msgSend(v3, "pathForResource:ofType:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "addObject:", v10);

        v11 = *v8++;
        v9 = v11;
      }
      while (v11);
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerForKey:", CFSTR("PVVideoCompositingContextUserMotionEffectsKey"));

    if (v13)
    {
      NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "stringByAppendingPathComponent:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v17, "fileExistsAtPath:", v16);

      if ((_DWORD)v15)
        objc_msgSend(v5, "addObject:", v16);

    }
    if (objc_msgSend(v5, "count"))
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
    else
      v18 = 0;
    for (i = 1; i != -1; --i)

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_userLibPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "addObject:", v4);
  if (objc_msgSend(v2, "count"))
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v2);
  else
    v5 = 0;

  return v5;
}

+ (void)registerEffects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((+[PVMotionEffect registerEffects]::sRegistered & 1) == 0)
  {
    +[PVMotionEffect registerEffects]::sRegistered = 1;
    objc_msgSend(a1, "_bundleLibPaths");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(0, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v3, "reverseObjectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(a1, "mapTemplatesInDirectory:doingRescan:origCache:newCache:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8++), 0, 0, v4);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerForKey:", CFSTR("PVVideoCompositingContextUserMotionEffectsKey"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerForKey:", CFSTR("PVReplaceShippingEffectsWithDocumentsEffects"));

    if (v10)
    {
      objc_msgSend(a1, "_userLibPaths");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v13, "reverseObjectEnumerator", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v19;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(a1, "scanTemplatesInDirectory:doingRescan:replaceMappedEffectPath:origCache:newCache:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), 0, v12 != 0, 0, v4);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v15);
      }

    }
    objc_msgSend(a1, "registerNoneEffectForType:effectID:origCache:newCache:", CFSTR("effect.video.filter"), CFSTR("737C8717-70E0-4CCE-8F19-17A0532E836F"), 0, v4);
    objc_msgSend(a1, "registerNoneEffectForType:effectID:origCache:newCache:", CFSTR("effect.video.title"), CFSTR("4390FE7A-3408-4EB5-A049-AA394C03A911"), 0, v4);
    objc_msgSend(a1, "registerNoneEffectForType:effectID:origCache:newCache:", CFSTR("effect.video.transition"), CFSTR("67EB7544-E4A1-4508-9733-E201AADFBC15"), 0, v4);
    objc_msgSend(a1, "initializeMotion");

  }
}

+ (void)initializeMotion
{
  HGRenderQueue **v2;

  v2 = (HGRenderQueue **)PVDocumentAccessController::INSTANCE((PVDocumentAccessController *)a1);
  PVDocumentAccessController::InitializeMotion(v2);
}

+ (void)initializeMotionInternal
{
  unsigned __int8 v2;
  void *v3;
  BHBehaviorsBundle *v4;
  PSMain *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TXMain *v12;

  {
    +[PVMotionEffect initializeMotionInternal]::s_initLock = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3740]);
  }
  objc_msgSend((id)+[PVMotionEffect initializeMotionInternal]::s_initLock, "lock");
  if ((s_isMotionInitialized & 1) == 0)
  {
    PCInit();
    +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    OZXWaitForAsyncInitialization();
    OZXSetHostDelegate(v3);
    v12 = objc_alloc_init(TXMain);
    -[TXMain applicationDidFinishLaunching](v12, "applicationDidFinishLaunching");
    v4 = objc_alloc_init(BHBehaviorsBundle);
    -[BHBehaviorsBundle applicationDidFinishLaunching](v4, "applicationDidFinishLaunching");
    v5 = objc_alloc_init(PSMain);
    -[PSMain applicationDidFinishLaunching](v5, "applicationDidFinishLaunching");
    +[PROPlugInManager sharedPlugInManager](PROPlugInManager, "sharedPlugInManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OZFxPlugHostPropertiesAPI sharedHostPropertiesAPI](OZFxPlugHostPropertiesAPI, "sharedHostPropertiesAPI");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerAPIObject:forProtocol:version:", v7, &unk_1EF0A80F0, 1);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scanForPlugInsInBundle:deferralNotification:", v8, &__block_literal_global_1384);
    +[PAEDummyiOS setup](PAEDummyiOS, "setup");
    if (kNoPanZoomEnabled == -1)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      kNoPanZoomEnabled = objc_msgSend(v9, "BOOLForKey:", CFSTR("noPanZoomAnchoring"));

    }
    s_isMotionInitialized = 1;
    v10 = (void *)kPVAlignmentLeft;
    kPVAlignmentLeft = (uint64_t)&unk_1E6649000;

    v11 = (void *)kPVAlignmentRight;
    kPVAlignmentRight = (uint64_t)&unk_1E6649018;

  }
  objc_msgSend((id)+[PVMotionEffect initializeMotionInternal]::s_initLock, "unlock");
}

- (PVMotionEffect)initWithEffectID:(id)a3
{
  id v4;
  PVMotionEffect *v5;
  PVMotionEffect *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVMotionEffect;
  v5 = -[PVEffect initWithEffectID:](&v8, sel_initWithEffectID_, v4);
  v6 = v5;
  if (v5)
    -[PVMotionEffect _commonInitWithProjectPathOverride:](v5, "_commonInitWithProjectPathOverride:", 0);

  return v6;
}

- (PVMotionEffect)initWithContentID:(id)a3 andDictionary:(id)a4
{
  id v6;
  id v7;
  PVMotionEffect *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PVMotionEffect;
  v8 = -[PVEffect initWithContentID:andDictionary:](&v11, sel_initWithContentID_andDictionary_, v6, v7);
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contentPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffect _commonInitWithProjectPathOverride:](v8, "_commonInitWithProjectPathOverride:", v9);

  }
  return v8;
}

- (void)_commonInitWithProjectPathOverride:(id)a3
{
  NSLock *v5;
  NSLock *documentLock;
  NSMutableArray *v7;
  NSMutableArray *motionComponents;
  NSMutableArray *components;
  uint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *cachedPublishedParams;
  NSMutableSet *v13;
  NSMutableSet *parameterKeysThatInvalidateCache;
  NSMutableDictionary *v15;
  NSMutableDictionary *parametersThatInvalidateCache;
  NSMutableArray *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v20 = a3;
  objc_storeStrong((id *)&self->_projectPathOverride, a3);
  atomic_store(0, (unsigned int *)&self->_docLoadStatus);
  v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  documentLock = self->_documentLock;
  self->_documentLock = v5;

  self->_documentInfo = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->super._components, "count"));
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  motionComponents = self->_motionComponents;
  self->_motionComponents = v7;

  components = self->super._components;
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__PVMotionEffect__commonInitWithProjectPathOverride___block_invoke;
  v22[3] = &unk_1E64D6538;
  v22[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](components, "enumerateObjectsUsingBlock:", v22);
  v11 = (NSMutableDictionary *)objc_opt_new();
  cachedPublishedParams = self->_cachedPublishedParams;
  self->_cachedPublishedParams = v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("kPVOutputAspectKey"), CFSTR("kPVPlayableAspectRatioKey"), CFSTR("kPVPlayableAspectRatioPreservationModeKey"), CFSTR("kPVCachedTextureOutputSize"), 0);
  v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  parameterKeysThatInvalidateCache = self->_parameterKeysThatInvalidateCache;
  self->_parameterKeysThatInvalidateCache = v13;

  v15 = (NSMutableDictionary *)objc_opt_new();
  parametersThatInvalidateCache = self->_parametersThatInvalidateCache;
  self->_parametersThatInvalidateCache = v15;

  v17 = self->_motionComponents;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __53__PVMotionEffect__commonInitWithProjectPathOverride___block_invoke_2;
  v21[3] = &unk_1E64D6BA8;
  v21[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](v17, "enumerateObjectsUsingBlock:", v21);
  v18 = -[PVMotionEffect projectURL](self, "projectURL");
  v19 = -[PVMotionEffect projectPath](self, "projectPath");
  -[PVMotionEffect supportsExtendedRangeInputs](self, "supportsExtendedRangeInputs");
  -[NSLock lock](self->_documentLock, "lock");
  -[PVMotionEffect _documentDidUnload_NoLock](self, "_documentDidUnload_NoLock");
  -[NSLock unlock](self->_documentLock, "unlock");

}

void __53__PVMotionEffect__commonInitWithProjectPathOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addObject:", v3);

}

void __53__PVMotionEffect__commonInitWithProjectPathOverride___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "motionEffectPropertyKeysThatInvalidateCachedRender:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
    v6 = v3;
    objc_msgSend(v3, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    v3 = v6;
  }

}

- (void)_documentDidUnload_NoLock
{
  PVMotionDocumentInfo *documentInfo;
  _QWORD *v4;
  _QWORD *v5;
  NSMutableArray *motionComponents;
  _QWORD v7[5];

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsNotStarted](self, "assertDocumentStatusIsNotStarted");
  documentInfo = (PVMotionDocumentInfo *)self->_documentInfo;
  if (documentInfo)
  {
    PVMotionDocumentInfo::~PVMotionDocumentInfo(documentInfo);
    MEMORY[0x1B5E29170]();
    self->_documentInfo = 0;
  }
  v4 = (_QWORD *)operator new();
  *v4 = 0;
  v4[20] = 0x100000000;
  v5 = (_QWORD *)operator new();
  v5[2] = 0;
  v5[1] = 0;
  *v5 = v5 + 1;
  v4[21] = v5;
  *((_OWORD *)v4 + 11) = *MEMORY[0x1E0C9D820];
  self->_documentInfo = v4;
  -[NSMutableDictionary removeAllObjects](self->_cachedPublishedParams, "removeAllObjects");
  self->_effectOutputAspect = 0.0;
  self->_playableAspectRatio = 0.0;
  self->_playableContentMode = 0;
  self->_hasPlayableAspectOverride = 0;
  self->_groupIDToCache = 0;
  self->_previousGroupIDToCache = 0;
  self->_cachedRenderDirty = 1;
  -[NSMutableDictionary removeAllObjects](self->_parametersThatInvalidateCache, "removeAllObjects");
  motionComponents = self->_motionComponents;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PVMotionEffect__documentDidUnload_NoLock__block_invoke;
  v7[3] = &unk_1E64D6BA8;
  v7[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](motionComponents, "enumerateObjectsUsingBlock:", v7);
}

uint64_t __43__PVMotionEffect__documentDidUnload_NoLock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "motionEffectDidUnload:", *(_QWORD *)(a1 + 32));
}

- (void)_configureComponents
{
  PVMotionEffectTimelineComponent *v3;
  PVMotionEffectTimelineComponent *timelineComponent;
  PVMotionEffectTransformComponent *v5;
  PVMotionEffectTransformComponent *transformComponent;
  PVMotionEffectTextComponent *v7;
  PVMotionEffectTextComponent *textComponent;
  PVMotionEffectTranscriptionComponent *v9;
  PVMotionEffectTranscriptionComponent *transcriptionComponent;
  PVMotionEffectHitAreaComponent *v11;
  PVMotionEffectHitAreaComponent *hitAreaComponent;
  PVMotionEffectSceneManagerComponent *v13;
  PVMotionEffectSceneManagerComponent *sceneManagerComponent;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PVMotionEffect;
  -[PVEffect _configureComponents](&v15, sel__configureComponents);
  v3 = -[PVMotionEffectTimelineComponent initWithMotionEffect:]([PVMotionEffectTimelineComponent alloc], "initWithMotionEffect:", self);
  timelineComponent = self->_timelineComponent;
  self->_timelineComponent = v3;

  -[NSMutableArray addObject:](self->super._components, "addObject:", self->_timelineComponent);
  v5 = -[PVMotionEffectTransformComponent initWithMotionEffect:]([PVMotionEffectTransformComponent alloc], "initWithMotionEffect:", self);
  transformComponent = self->_transformComponent;
  self->_transformComponent = v5;

  -[NSMutableArray addObject:](self->super._components, "addObject:", self->_transformComponent);
  v7 = -[PVMotionEffectTextComponent initWithMotionEffect:]([PVMotionEffectTextComponent alloc], "initWithMotionEffect:", self);
  textComponent = self->_textComponent;
  self->_textComponent = v7;

  -[NSMutableArray addObject:](self->super._components, "addObject:", self->_textComponent);
  v9 = -[PVMotionEffectComponent initWithMotionEffect:]([PVMotionEffectTranscriptionComponent alloc], "initWithMotionEffect:", self);
  transcriptionComponent = self->_transcriptionComponent;
  self->_transcriptionComponent = v9;

  -[NSMutableArray addObject:](self->super._components, "addObject:", self->_transcriptionComponent);
  v11 = -[PVMotionEffectComponent initWithMotionEffect:]([PVMotionEffectHitAreaComponent alloc], "initWithMotionEffect:", self);
  hitAreaComponent = self->_hitAreaComponent;
  self->_hitAreaComponent = v11;

  -[NSMutableArray addObject:](self->super._components, "addObject:", self->_hitAreaComponent);
  v13 = -[PVMotionEffectSceneManagerComponent initWithMotionEffect:]([PVMotionEffectSceneManagerComponent alloc], "initWithMotionEffect:", self);
  sceneManagerComponent = self->_sceneManagerComponent;
  self->_sceneManagerComponent = v13;

  -[NSMutableArray addObject:](self->super._components, "addObject:", self->_sceneManagerComponent);
}

- (void)releaseResources
{
  NSLock *documentLock;
  PVDocumentAccessController *v4;
  unsigned int v5;
  HGRenderQueue **v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffect;
  -[PVEffect releaseResources](&v7, sel_releaseResources);
  documentLock = self->_documentLock;
  if (documentLock)
  {
    v4 = (PVDocumentAccessController *)-[NSLock lock](documentLock, "lock");
    v5 = atomic_load((unsigned int *)&self->_docLoadStatus);
    if ((v5 & 0xFFFFFFFE) == 2)
    {
      v6 = (HGRenderQueue **)PVDocumentAccessController::INSTANCE(v4);
      PVDocumentAccessController::ReleaseOZXDocument(v6, *(void **)self->_documentInfo);
      atomic_store(0, (unsigned int *)&self->_docLoadStatus);
      -[PVMotionEffect _documentDidUnload_NoLock](self, "_documentDidUnload_NoLock");
    }
    -[NSLock unlock](self->_documentLock, "unlock");
  }
}

- (void)dealloc
{
  NSLock *documentLock;
  PVMotionDocumentInfo *documentInfo;
  objc_super v5;

  -[PVMotionEffect releaseResources](self, "releaseResources");
  documentLock = self->_documentLock;
  self->_documentLock = 0;

  documentInfo = (PVMotionDocumentInfo *)self->_documentInfo;
  if (documentInfo)
  {
    PVMotionDocumentInfo::~PVMotionDocumentInfo(documentInfo);
    MEMORY[0x1B5E29170]();
    self->_documentInfo = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PVMotionEffect;
  -[PVEffect dealloc](&v5, sel_dealloc);
}

- (id)projectPath
{
  NSString *projectPath;
  void *v4;
  NSString *v5;
  NSString *v6;

  projectPath = self->_projectPath;
  if (!projectPath)
  {
    -[PVMotionEffect projectURL](self, "projectURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_projectPath;
    self->_projectPath = v5;

    projectPath = self->_projectPath;
  }
  return projectPath;
}

- (BOOL)hasAllNecessaryResources
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PVMotionEffect projectURL](self, "projectURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (id)projectURL
{
  NSURL *projectURL;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  void *v17;
  char v18;
  NSURL *v19;
  NSURL *v20;
  NSString *projectPath;
  NSURL *v22;
  id v23;
  id obj;
  id obja;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  projectURL = self->_projectURL;
  if (projectURL)
    return projectURL;
  -[PVEffect effectID](self, "effectID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_projectPathOverride;
  if (v5)
    goto LABEL_29;
  if (objc_msgSend(v26, "hasPrefix:", CFSTR("...")))
  {
    objc_msgSend(v26, "substringFromIndex:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PVMotionEffect _userLibPaths](PVMotionEffect, "_userLibPaths");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v33;
LABEL_7:
      v8 = 0;
      v9 = v5;
      while (1)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v8), "stringByAppendingFormat:", CFSTR("/%@"), v27);
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "fileExistsAtPath:", v5);

        if ((v11 & 1) != 0)
          break;
        ++v8;
        v9 = v5;
        if (v6 == v8)
        {
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v6)
            goto LABEL_7;
          break;
        }
      }
    }

  }
  else
  {
    +[PVMotionEffect _effectPathFromID:](PVMotionEffect, "_effectPathFromID:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasPrefix:", CFSTR("...")))
    {
      v27 = v12;
      objc_msgSend(v12, "substringFromIndex:", 4);
      obja = (id)objc_claimAutoreleasedReturnValue();
      +[PVMotionEffect _bundleLibPaths](PVMotionEffect, "_bundleLibPaths");
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      v13 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v29;
LABEL_17:
        v15 = 0;
        v16 = v5;
        while (1)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15), "stringByAppendingFormat:", CFSTR("/%@"), obja);
          v5 = (NSString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "fileExistsAtPath:", v5);

          if ((v18 & 1) != 0)
            break;
          ++v15;
          v16 = v5;
          if (v13 == v15)
          {
            v13 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v13)
              goto LABEL_17;
            break;
          }
        }
      }

    }
    else
    {
      if (v12)
      {
        v5 = v12;

        goto LABEL_28;
      }
      v27 = 0;
      v5 = v26;
    }
  }

LABEL_28:
  if (!v5)
  {
    v19 = 0;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
  v19 = (NSURL *)objc_claimAutoreleasedReturnValue();
LABEL_30:
  v20 = self->_projectURL;
  self->_projectURL = v19;

  projectPath = self->_projectPath;
  self->_projectPath = 0;

  v22 = self->_projectURL;
  return v22;
}

- (void)loadDocument_NoLock
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *motionComponents;
  void *v9;
  uint64_t v10;
  char *documentInfo;
  uint64_t v12;
  uint64x2_t v13;
  int v14;
  _DWORD *v15;
  uint64_t v16;
  unsigned int v17;
  NSMutableArray *v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  NSMutableArray *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _OWORD v26[4];
  unsigned int v27[4];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  double v31;
  uint64_t v32;
  _QWORD v33[6];

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsNotStarted](self, "assertDocumentStatusIsNotStarted");
  -[PVEffect effectID](self, "effectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  if (!v3)
    goto LABEL_17;
  -[PVMotionEffect projectURL](self, "projectURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVMotionEffect projectPath](self, "projectPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PVEnvironment PV_ENABLE_ENV_LOGS](PVEnvironment, "PV_ENABLE_ENV_LOGS"))
  {
    NSLog(CFSTR("*** PVMotionEffect: LOADING: %@"), v5);
    -[PVEffect descriptionOfInspectableProperties](self, "descriptionOfInspectableProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("*** PVMotionEffect: INSPECTABLE PROPERTIES: %@"), v7);

  }
  atomic_store(1u, (unsigned int *)&self->_docLoadStatus);
  motionComponents = self->_motionComponents;
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __37__PVMotionEffect_loadDocument_NoLock__block_invoke;
  v33[3] = &unk_1E64D6BA8;
  v33[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](motionComponents, "enumerateObjectsUsingBlock:", v33);
  v32 = 0;
  +[PVDocumentCacheManager sharedInstance](PVDocumentCacheManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "newOZXDocumentForKey:", v6);

  if (!v10)
  {
    v31 = 0.0;
    v29 = 0u;
    v30 = 0u;
    *(_OWORD *)v27 = 0u;
    v28 = 0u;
    PVGetMemUsageStats((uint64_t)v27);
    v19 = *(_QWORD *)&v27[2];
    v20 = OZXLoadDocument(v5, &v32, &v31, -1, -1);
    PVGetMemUsageStats((uint64_t)v26);
    *(_OWORD *)v27 = v26[0];
    v28 = v26[1];
    v29 = v26[2];
    v30 = v26[3];
    if (*((_QWORD *)&v26[0] + 1) >= v19)
      v21 = *((_QWORD *)&v26[0] + 1) - v19;
    else
      v21 = 0;
    if (!v20)
    {
      +[PVDocumentCacheManager sharedInstance](PVDocumentCacheManager, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cacheOZXDocument:forKey:timeElapsed:memoryInfo:", v32, v6, v21, v31);

      v10 = v32;
      goto LABEL_6;
    }

    v4 = MEMORY[0x1E0C809B0];
LABEL_17:
    atomic_store(4u, (unsigned int *)&self->_docLoadStatus);
    v22 = self->_motionComponents;
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __37__PVMotionEffect_loadDocument_NoLock__block_invoke_3;
    v24[3] = &unk_1E64D6BA8;
    v24[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](v22, "enumerateObjectsUsingBlock:", v24);
    goto LABEL_18;
  }
  v32 = v10;
LABEL_6:
  *(_QWORD *)self->_documentInfo = v10;
  OZXGetDocInfo(*(_QWORD *)self->_documentInfo, (uint64_t)self->_documentInfo + 8);
  documentInfo = (char *)self->_documentInfo;
  v12 = *(_QWORD *)(documentInfo + 12);
  v13.i64[0] = v12;
  v13.i64[1] = HIDWORD(v12);
  *((float64x2_t *)documentInfo + 11) = vcvtq_f64_u64(v13);
  v27[0] = 0;
  v14 = OZXGetTopLevelGroupID(*(void **)documentInfo, v27);
  v15 = self->_documentInfo;
  v15[41] = v14;
  v16 = MEMORY[0x1E0C809B0];
  if (!v14)
  {
    v17 = v27[0];
    v15[40] = v27[0];
    self->_groupIDToCache = v17;
  }
  atomic_store(2u, (unsigned int *)&self->_docLoadStatus);
  v18 = self->_motionComponents;
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __37__PVMotionEffect_loadDocument_NoLock__block_invoke_2;
  v25[3] = &unk_1E64D6BA8;
  v25[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](v18, "enumerateObjectsUsingBlock:", v25);
  if (-[PVMotionEffect isTimeDurationIndefinite](self, "isTimeDurationIndefinite"))
    OZXSetDuration(*(void **)self->_documentInfo, MEMORY[0x1E0CA2E10]);

LABEL_18:
}

uint64_t __37__PVMotionEffect_loadDocument_NoLock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "motionEffectDidStartLoading:", *(_QWORD *)(a1 + 32));
}

uint64_t __37__PVMotionEffect_loadDocument_NoLock__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "motionEffect:didLoad:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
}

uint64_t __37__PVMotionEffect_loadDocument_NoLock__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "motionEffectDidFailToLoad:", *(_QWORD *)(a1 + 32));
}

- (BOOL)supportsExtendedRangeInputs
{
  NSNumber *supportsExtendedRangeInputs;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;
  void *v8;
  void *v9;
  NSNumber *v10;
  NSNumber *v11;
  _QWORD v13[18];

  v13[17] = *MEMORY[0x1E0C80C00];
  supportsExtendedRangeInputs = self->_supportsExtendedRangeInputs;
  if (!supportsExtendedRangeInputs)
  {
    -[PVEffect contentRegistryPropertyForKey:](self, "contentRegistryPropertyForKey:", CFSTR("doesNotSupportExtendedRangeInputs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "BOOLValue") ^ 1);
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v7 = self->_supportsExtendedRangeInputs;
      self->_supportsExtendedRangeInputs = v6;

    }
    else
    {
      -[PVEffect effectID](self, "effectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = CFSTR("E50C1035-19C5-4EFF-AAB4-B3008BC14D04");
      v13[1] = CFSTR("CAA078D7-0ACA-432E-85B1-FB975BE96A80");
      v13[2] = CFSTR("7F57747E-6F2A-4D31-806C-67B4F09A93CA");
      v13[3] = CFSTR("8286EAE4-72A9-4739-970D-12A9EC5EE39D");
      v13[4] = CFSTR("AE493655-7441-401C-82DA-2B53150ADF04");
      v13[5] = CFSTR("BF65FA4F-DF9E-4BA1-AF3A-EDABE6AAC849");
      v13[6] = CFSTR("B1AF5729-DBD8-458F-AA8C-14431E269F91");
      v13[7] = CFSTR("F8AE5EB3-7B25-48EA-B553-A3ABC3BF4E22");
      v13[8] = CFSTR("FDA1996F-CE2F-4D2B-9C02-63C38F6D260E");
      v13[9] = CFSTR("F97E8C77-4E0D-4F19-9A5C-E738CB736808");
      v13[10] = CFSTR("E0EF8372-285B-48FE-91E8-484AA0C72566");
      v13[11] = CFSTR("73695A75-3662-44D6-B3B9-2D947512610D");
      v13[12] = CFSTR("CC50FB3A-4F1C-4A0E-844F-48B30842586A");
      v13[13] = CFSTR("330561EB-3193-4210-A735-3CAEFAED29D1");
      v13[14] = CFSTR("7195C532-014D-4F44-B0EF-18064B032172");
      v13[15] = CFSTR("20E1551C-1F0E-4C87-9C56-750D6D2FAB5E");
      v13[16] = CFSTR("CED1BDCE-1C6F-4ABF-85EB-E10DD5F04841");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "containsObject:", v8))
      {
        v10 = self->_supportsExtendedRangeInputs;
        self->_supportsExtendedRangeInputs = (NSNumber *)MEMORY[0x1E0C9AAA0];

      }
      v11 = self->_supportsExtendedRangeInputs;
      self->_supportsExtendedRangeInputs = (NSNumber *)MEMORY[0x1E0C9AAB0];

    }
    supportsExtendedRangeInputs = self->_supportsExtendedRangeInputs;
  }
  return -[NSNumber BOOLValue](supportsExtendedRangeInputs, "BOOLValue");
}

- (BOOL)isReady
{
  unsigned int v2;

  v2 = atomic_load((unsigned int *)&self->_docLoadStatus);
  return v2 == 3;
}

- (BOOL)resourcesAreReady
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[PVMotionEffect isReady](self, "isReady"))
    return 1;
  -[PVMotionEffect projectPath](self, "projectPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVDocumentCacheManager sharedInstance](PVDocumentCacheManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getOZXDocumentForKey:", v4);

  v3 = v6 != 0;
  return v3;
}

- (BOOL)loadResources
{
  BOOL v3;

  -[NSLock lock](self->_documentLock, "lock");
  v3 = -[PVMotionEffect loadResources_NoLock](self, "loadResources_NoLock");
  -[NSLock unlock](self->_documentLock, "unlock");
  return v3;
}

- (BOOL)loadResources_NoLock
{
  atomic<PVDocumentLoadStatus> *p_docLoadStatus;
  unsigned int v3;
  HGRenderQueue **v6;
  unsigned int v7;

  p_docLoadStatus = &self->_docLoadStatus;
  v3 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v3 == 3)
    return 1;
  v6 = (HGRenderQueue **)PVDocumentAccessController::INSTANCE((PVDocumentAccessController *)self);
  PVDocumentAccessController::LoadEffectDocument(v6, self);
  v7 = atomic_load((unsigned int *)p_docLoadStatus);
  return v7 == 3;
}

- (void)loadEffectInternal_NoLock
{
  unsigned int v3;
  const char *v4;
  const char *v5;
  const char *v6;
  unsigned int v7;
  const char *v8;
  const char *v9;
  NSMutableArray *motionComponents;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  NSMutableArray *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  v3 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v3 - 3 >= 2)
  {
    -[PVMotionEffect assertDocumentStatusIsNotStarted](self, "assertDocumentStatusIsNotStarted");
    if (!v3)
    {
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v4) >= 1)
        kdebug_trace();
      -[PVMotionEffect loadDocument_NoLock](self, "loadDocument_NoLock");
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v5) >= 1)
        kdebug_trace();
      v7 = atomic_load((unsigned int *)&self->_docLoadStatus);
      if (v7 == 2)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v6) >= 1)
          kdebug_trace();
        -[PVMotionEffect buildDropZoneIdMap_NoLock](self, "buildDropZoneIdMap_NoLock");
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v8) >= 1)
          kdebug_trace();
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v9) >= 1)
          kdebug_trace();
        -[NSLock lock](self->super._inspectablePropertiesLock, "lock");
        motionComponents = self->_motionComponents;
        v11 = MEMORY[0x1E0C809B0];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __43__PVMotionEffect_loadEffectInternal_NoLock__block_invoke;
        v17[3] = &unk_1E64D6BA8;
        v17[4] = self;
        -[NSMutableArray enumerateObjectsUsingBlock:](motionComponents, "enumerateObjectsUsingBlock:", v17);
        -[PVMotionEffect applyInspectableProperties_NoLock](self, "applyInspectableProperties_NoLock");
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v12) >= 1)
          kdebug_trace();
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v13) >= 1)
          kdebug_trace();
        OZXOpenDocumentMedia(*(_QWORD *)self->_documentInfo);
        OZXIsValidImageSequencePath(*(_QWORD *)self->_documentInfo);
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v14) >= 1)
          kdebug_trace();
        atomic_store(3u, (unsigned int *)&self->_docLoadStatus);
        v15 = self->_motionComponents;
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __43__PVMotionEffect_loadEffectInternal_NoLock__block_invoke_2;
        v16[3] = &unk_1E64D6BA8;
        v16[4] = self;
        -[NSMutableArray enumerateObjectsUsingBlock:](v15, "enumerateObjectsUsingBlock:", v16);
        -[NSLock unlock](self->super._inspectablePropertiesLock, "unlock");
      }
    }
  }
}

uint64_t __43__PVMotionEffect_loadEffectInternal_NoLock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "motionEffect:willOpenMedia:properties:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

uint64_t __43__PVMotionEffect_loadEffectInternal_NoLock__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "motionEffect:didBecomeReady:properties:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (BOOL)isSketch
{
  void *v2;
  char v3;

  -[PVEffect effectID](self, "effectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("5FCD0612-3FD5-4079-BC2A-20E987BC5B59")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("494B7BCF-0476-4EF7-ACFC-36480997C2A9"));

  return v3;
}

- (void)runEnsuringDocumentReady_NoLock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsReadyAfterLoad:](self, "assertDocumentStatusIsReadyAfterLoad:", -[PVMotionEffect loadResources_NoLock](self, "loadResources_NoLock"));
  v4[2]();

}

- (void)runEnsuringDocumentReadyAndLockingDocument:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  PVMotionEffect *v10;
  id v11;

  v4 = a3;
  -[NSLock lock](self->_documentLock, "lock");
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __61__PVMotionEffect_runEnsuringDocumentReadyAndLockingDocument___block_invoke;
  v9 = &unk_1E64D6BD0;
  v5 = v4;
  v10 = self;
  v11 = v5;
  -[PVMotionEffect runEnsuringDocumentReady_NoLock:](self, "runEnsuringDocumentReady_NoLock:", &v6);
  -[NSLock unlock](self->_documentLock, "unlock", v6, v7, v8, v9);

}

uint64_t __61__PVMotionEffect_runEnsuringDocumentReadyAndLockingDocument___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
}

- (void)runWithDocument_NoLock:(id)a3
{
  void (**v4)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  v4[2](v4, self->_documentInfo);

}

- (void)deleteTemporalInspectableProperties
{
  void *v3;
  NSMutableDictionary *inspectableProperties;
  id v5;
  _QWORD v6[5];
  id v7;

  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  v3 = (void *)objc_opt_new();
  inspectableProperties = self->super._inspectableProperties;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PVMotionEffect_deleteTemporalInspectableProperties__block_invoke;
  v6[3] = &unk_1E64D6BF8;
  v6[4] = self;
  v5 = v3;
  v7 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](inspectableProperties, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (objc_msgSend(v5, "count"))
    -[NSMutableDictionary removeObjectsForKeys:](self->super._inspectableProperties, "removeObjectsForKeys:", v5);

}

void __53__PVMotionEffect_deleteTemporalInspectableProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isTemporalProperty:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGSolidColor **v6;
  int v9;
  uint64_t v10;
  _DWORD *v11;
  unsigned int v12;
  BOOL v13;
  uint64_t *v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  PVEffectTimedPropertiesComponent *timedPropertiesComponent;
  PVInstructionGraphContext *m_Obj;
  unsigned int v21;
  unsigned int v22;
  NSMutableDictionary **p_inspectableProperties;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  HGSolidColor *v35;
  HGSolidColor *v36;
  double v37;
  double v38;
  float v39;
  float v40;
  void *v41;
  int v42;
  double v43;
  double v44;
  int v45;
  int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  unint64_t v54;
  unint64_t v55;
  double effectOutputAspect;
  double *documentInfo;
  _BOOL8 v58;
  PVMotionEffectTimelineComponent *timelineComponent;
  void *v60;
  BOOL v61;
  void *v62;
  BOOL v63;
  void *v64;
  BOOL v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  BOOL v72;
  id v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  void *v78;
  NSString *v79;
  NSUUID *v80;
  unsigned int groupIDToCache;
  BOOL v82;
  char v83;
  int v84;
  _BOOL4 v85;
  id v86;
  void *v87;
  void *v88;
  int v89;
  PVMotionEffectTimelineComponent *v90;
  void *v91;
  float64x2_t v92;
  PVMotionEffectTimelineComponent *v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  uint64_t v99;
  unsigned int *v100;
  void *v101;
  double v102;
  char *v103;
  double v104;
  HGRenderer *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  unsigned int v109;
  BOOL v110;
  char **v111;
  int var2;
  int var0;
  float v114;
  int v115;
  int var1;
  float v117;
  uint64_t **v118;
  uint64_t *v119;
  uint64_t *v120;
  HGNode **v121;
  float64x2_t v122;
  uint64_t v123;
  HGNode **v124;
  uint64_t k;
  uint64_t **v126;
  int v127;
  char *v128;
  char *v129;
  unsigned int v130;
  BOOL v131;
  char **v132;
  double v133;
  double v134;
  _BOOL4 v135;
  int v136;
  char *v137;
  char *v138;
  unsigned int v139;
  BOOL v140;
  char **v141;
  uint64_t **v142;
  __int128 v143;
  double v144;
  double v145;
  double v146;
  HGNode **v147;
  uint64_t v148;
  HGNode **v149;
  uint64_t m;
  uint64_t **v151;
  uint64_t **v152;
  HGNode **v153;
  uint64_t v154;
  HGNode **v155;
  uint64_t n;
  char *v157;
  char *v158;
  unsigned int v159;
  BOOL v160;
  char **v161;
  uint64_t **v162;
  float64x2_t v163;
  uint64_t **v164;
  uint64_t **v165;
  uint64_t **v166;
  float64x2_t v167;
  uint64_t **v168;
  uint64_t **v169;
  float64x2_t v170;
  int v171;
  float v172;
  void *v173;
  PVColorSpace *v174;
  uint64_t v175;
  int v176;
  float v177;
  float v178;
  float v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  void *v185;
  uint64_t v186;
  _DWORD *v187;
  int v188;
  BOOL v189;
  uint64_t *v190;
  int v191;
  void *v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  void *v196;
  id v197;
  id v198;
  NSMutableArray *motionComponents;
  int v200;
  unsigned __int8 v201;
  double v202;
  PCColorSpaceCache *v203;
  void *v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t *v209;
  uint64_t *v210;
  _QWORD **v211;
  _QWORD *v212;
  __n128 v213;
  unsigned int *v214;
  HGSolidColor *v215;
  unsigned int *v216;
  unsigned int *v217;
  unsigned int *v218;
  HGSolidColor *v219;
  float64x2_t v220;
  HGSolidColor *v221;
  HGSolidColor *v222;
  float64x2_t v223;
  HGSolidColor *v224;
  HGRef<HGNode> v225;
  uint64_t v226;
  int64x2_t v227;
  double v228;
  void *v229;
  int v230;
  void *v231;
  id obj;
  _BOOL4 v233;
  void *v234;
  void *v235;
  double v236;
  void *v237;
  double v238;
  void *v239;
  float v240;
  double v241;
  float64x2_t v242;
  void *v243;
  _BOOL4 v244;
  void *v245;
  int v246;
  void *v247;
  HGSolidColor **v248;
  void *v252;
  id *location;
  HGSolidColor *v255;
  HGSolidColor *v256;
  char v257[8];
  _QWORD *v258;
  char v259[8];
  _QWORD *v260;
  uint64_t v261[3];
  uint64_t v262[3];
  CMTime v263;
  _QWORD v264[5];
  __int128 v265;
  int64_t v266;
  CMTime v267;
  __int128 v268;
  int64_t v269;
  HGRect v270;
  uint64_t v271;
  __int128 v272;
  HGNode *v273[2];
  uint64_t v274;
  uint64_t v275;
  __int128 v276;
  int64x2_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  __int128 v281;
  __int128 v282;
  uint64_t v283;
  __int128 v284;
  unsigned int v285;
  void *__p;
  unsigned int *v287;
  uint64_t *v288;
  _QWORD *v289[2];
  uint64_t *v290;
  _QWORD *v291[2];
  uint64_t *v292;
  _QWORD *v293[2];
  uint64_t *v294;
  _QWORD *v295[2];
  __int128 v296;
  int64_t v297;
  char v298[24];
  float64x2_t v299;
  double v300;
  __int128 v301;
  CMTimeRange v302;
  __int128 v303;
  __int128 v304;
  uint64_t v305;
  __int128 v306;
  __int128 v307;
  uint64_t v308;
  CMTime v309;
  CMTime v310;
  CMTime time2;
  CMTime time1;
  __int128 v313;
  int64_t v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  CMTimeRange v323;
  CMTimeRange v324;
  CMTime duration;
  CMTime start;
  __int128 v327;
  int64_t v328;
  CMTime v329;
  __int128 v330;
  int64_t v331;
  CMTime time;
  CMTimeRange range;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  int64_t var3;
  unsigned int *v340;
  _BYTE v341[128];
  _BYTE v342[128];
  _BYTE v343[128];
  uint64_t v344;
  HGRect v346;

  v344 = *MEMORY[0x1E0C80C00];
  v9 = *((_DWORD *)a4 + 4);
  v248 = v6;
  *v6 = 0;
  if (!-[PVMotionEffect hasBuiltInEnvironment](self, "hasBuiltInEnvironment"))
    goto LABEL_14;
  v10 = *((_QWORD *)a4 + 1);
  if (!v10)
    goto LABEL_14;
  v11 = (char *)a4 + 8;
  do
  {
    v12 = *(_DWORD *)(v10 + 32);
    v13 = v12 >= 2;
    if (v12 >= 2)
      v14 = (uint64_t *)v10;
    else
      v14 = (uint64_t *)(v10 + 8);
    if (v13)
      v11 = (_DWORD *)v10;
    v10 = *v14;
  }
  while (*v14);
  if (v11 != (_DWORD *)((char *)a4 + 8) && v11[8] <= 2u)
    PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 2u, (HGNode **)&v302);
  else
LABEL_14:
    PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, (HGNode **)&v302);
  if (v302.start.value)
    *v248 = (HGSolidColor *)v302.start.value;
  -[PVEffect proxyRenderScale](self, "proxyRenderScale");
  v16 = v15;
  PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = objc_msgSend(v17, "isRec2020LinearColorSpace");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 11);
  v18 = objc_claimAutoreleasedReturnValue();
  timedPropertiesComponent = self->super._timedPropertiesComponent;
  v338 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v247 = (void *)v18;
  v244 = -[PVEffectTimedPropertiesComponent addTimedPropertiesToDict:time:](timedPropertiesComponent, "addTimedPropertiesToDict:time:", v18, &v338);
  m_Obj = a6.m_Obj;
  -[NSLock lock](self->_documentLock, "lock");
  v21 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v21 != 3)
    -[PVMotionEffect assertDocumentStatusIsReadyAfterLoad:](self, "assertDocumentStatusIsReadyAfterLoad:", -[PVMotionEffect loadResources_NoLock](self, "loadResources_NoLock"));
  -[PVMotionEffect assertDocumentStatusIsReady](self, "assertDocumentStatusIsReady");
  v22 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v22 != 3)
  {
    v30 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
    (*(void (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
    v32 = HGRectMake4i(0, 0, (int)v30, (int)v31);
    v34 = v33;
    v35 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(_QWORD *)&v346.var0 = v32;
    *(_QWORD *)&v346.var2 = v34;
    HGSolidColor::HGSolidColor(v35, v346);
    (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v35 + 96))(v35, 0, 0.0, 0.0, 0.0, 1.0);
    v36 = *v248;
    if (*v248 != v35)
    {
      if (v36)
        (*(void (**)(HGSolidColor *))(*(_QWORD *)v36 + 24))(v36);
      *v248 = v35;
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v35 + 16))(v35);
    }
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v35 + 24))(v35);
    goto LABEL_354;
  }
  -[PVMotionEffectTimelineComponent updateSceneDuration_NoLock:](self->_timelineComponent, "updateSceneDuration_NoLock:", self->_documentInfo);
  -[NSLock lock](self->super._inspectablePropertiesLock, "lock");
  p_inspectableProperties = &self->super._inspectableProperties;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("kPVIgnoreEffectRanges"));
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)&self->super._inspectableProperties;
  if (v245 && objc_msgSend(v245, "count"))
  {
    v337 = 0u;
    v336 = 0u;
    v335 = 0u;
    v334 = 0u;
    v24 = v245;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v334, v343, 16);
    if (!v25)
      goto LABEL_32;
    v26 = *(_QWORD *)v335;
LABEL_24:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v335 != v26)
        objc_enumerationMutation(v24);
      v28 = *(void **)(*((_QWORD *)&v334 + 1) + 8 * v27);
      memset(&v302, 0, sizeof(v302));
      if (v28)
        objc_msgSend(v28, "CMTimeRangeValue");
      range = v302;
      time = (CMTime)*a3;
      if (CMTimeRangeContainsTime(&range, &time))
        break;
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v334, v343, 16);
        if (!v25)
        {
LABEL_32:

          m_Obj = a6.m_Obj;
          p_inspectableProperties = &self->super._inspectableProperties;
          goto LABEL_33;
        }
        goto LABEL_24;
      }
    }
    -[NSLock unlock](self->super._inspectablePropertiesLock, "unlock");
    -[NSLock unlock](self->_documentLock, "unlock");

    goto LABEL_43;
  }
LABEL_33:
  v330 = *(_OWORD *)&a3->var0;
  v331 = a3->var3;
  if (-[PVMotionEffect isVisibleAtTime_NoLock:timedProperties:defaultProperties:](self, "isVisibleAtTime_NoLock:timedProperties:defaultProperties:", &v330, v247, *p_inspectableProperties))
  {
    if (v244)
    {
      v29 = -[NSMutableDictionary mutableCopy](*p_inspectableProperties, "mutableCopy");
      -[NSMutableDictionary addEntriesFromDictionary:](*p_inspectableProperties, "addEntriesFromDictionary:", v247);
    }
    else
    {
      v29 = 0;
    }
    obj = (id)v29;
    -[NSMutableDictionary objectForKeyedSubscript:](*p_inspectableProperties, "objectForKeyedSubscript:", CFSTR("kPVTopLevelOpacityKey"));
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    if (v234)
    {
      objc_msgSend(v234, "doubleValue");
      -[PVMotionEffect setTopLevelOpacity:](self, "setTopLevelOpacity:");
    }
    v37 = (*(double (**)(_QWORD))(**(_QWORD **)m_Obj + 40))(*(_QWORD *)m_Obj);
    (*(void (**)(_QWORD))(**(_QWORD **)m_Obj + 40))(*(_QWORD *)m_Obj);
    v238 = v38;
    v39 = (*(float (**)(_QWORD))(**(_QWORD **)m_Obj + 48))(*(_QWORD *)m_Obj);
    v40 = (*(float (**)(_QWORD))(**(_QWORD **)m_Obj + 48))(*(_QWORD *)m_Obj);
    -[NSMutableDictionary objectForKeyedSubscript:](*p_inspectableProperties, "objectForKeyedSubscript:", CFSTR("swapOutputAspect"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "BOOLValue");
    v228 = v37;
    v43 = v37 * v39;
    v44 = v238 * v40;
    if (v44 == 0.0)
      v45 = 0;
    else
      v45 = v42;
    if (v43 == 0.0)
      v46 = 0;
    else
      v46 = v45;

    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("kPVMotionEffectAdditionalTitleScale"));
    v47 = 1.0;
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    if (v235)
    {
      objc_msgSend(v235, "doubleValue");
      v47 = v48;
    }
    if (v46)
      v49 = v44;
    else
      v49 = v43;
    v50 = v49 * v47;
    if (v46)
      v51 = v43;
    else
      v51 = v44;
    v52 = v51 * v47;
    v53 = v51 * v47 / v50;
    if (!v46)
      v53 = 1.0;
    v236 = v53;
    -[PVMotionEffect setEffectOutputAspectWithProperties_NoLock:allProperties:](self, "setEffectOutputAspectWithProperties_NoLock:allProperties:", 0, *location);
    if (v9 >= 1 && v52 != 0.0 && v50 != 0.0)
    {
      effectOutputAspect = self->_effectOutputAspect;
      if (effectOutputAspect <= 0.0)
      {
        documentInfo = (double *)self->_documentInfo;
        LODWORD(v54) = *((_DWORD *)documentInfo + 3);
        LODWORD(v55) = *((_DWORD *)documentInfo + 4);
        if (vabdd_f64(documentInfo[7] * (double)v54 / (double)v55, v50 / v52) >= 0.0000001)
          -[PVMotionEffect setEffectOutputAspect_NoLock:playableAspect:playableContentMode:](self, "setEffectOutputAspect_NoLock:playableAspect:playableContentMode:", self->_playableContentMode, v50 / v52, self->_playableAspectRatio);
      }
      else if (vabdd_f64(effectOutputAspect, v37 / v238) >= 0.0000001)
      {
        NSLog(CFSTR("Unexpected effect aspect %.3f != output aspect %.3f"), *(_QWORD *)&self->_effectOutputAspect, v37 / v238);
      }
    }
    v58 = -[PVMotionEffectTimelineComponent isForceRenderAtPosterFrameEnabled:](self->_timelineComponent, "isForceRenderAtPosterFrameEnabled:", *location);
    memset(&v329, 0, sizeof(v329));
    timelineComponent = self->_timelineComponent;
    v327 = *(_OWORD *)&a3->var0;
    v328 = a3->var3;
    if (timelineComponent)
      -[PVMotionEffectTimelineComponent timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:](timelineComponent, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v327, v58, self->_documentInfo);
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("PVRestartEffectTime"), v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60 == 0;

    if (!v61)
    {
      start = (CMTime)*a3;
      -[PVEffect effectRange](self, "effectRange");
      duration = v302.duration;
      CMTimeRangeMake(&v324, &start, &duration);
      v323 = v324;
      -[PVEffect setEffectRange:](self, "setEffectRange:", &v323);
    }
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("PVResetScene"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v62 == 0;

    if (!v63)
      OZXResetScene(*(void **)self->_documentInfo);
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("PVDisableObjects"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64 == 0;

    if (!v65)
    {
      objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("PVDisableObjects"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v322 = 0u;
      v321 = 0u;
      v320 = 0u;
      v319 = 0u;
      v67 = v66;
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v319, v342, 16);
      if (v68)
      {
        v69 = *(_QWORD *)v320;
        do
        {
          for (i = 0; i != v68; ++i)
          {
            if (*(_QWORD *)v320 != v69)
              objc_enumerationMutation(v67);
            OZXEnableObject(*(void **)self->_documentInfo, objc_msgSend(*(id *)(*((_QWORD *)&v319 + 1) + 8 * i), "unsignedIntValue"), 0);
          }
          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v319, v342, 16);
        }
        while (v68);
      }

      objc_msgSend(*location, "removeObjectForKey:", CFSTR("PVDisableObjects"));
    }
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("PVEnvironmentMap"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71 == 0;

    if (!v72)
    {
      objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("PVEnvironmentMap"));
      v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      OZXSetEnvironmentMap(*(void **)self->_documentInfo, (CGImage *)objc_msgSend(v73, "CGImage"));

    }
    v318 = 0u;
    v317 = 0u;
    v316 = 0u;
    v315 = 0u;
    objc_msgSend(*location, "allKeys");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v315, v341, 16);
    if (v75)
    {
      v76 = *(_QWORD *)v316;
      do
      {
        for (j = 0; j != v75; ++j)
        {
          if (*(_QWORD *)v316 != v76)
            objc_enumerationMutation(v74);
          v78 = *(void **)(*((_QWORD *)&v315 + 1) + 8 * j);
          if (objc_msgSend(v78, "hasPrefix:", CFSTR("PVSetEffectAnchor")))
          {
            objc_msgSend(v78, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PVSetEffectAnchor"), &stru_1E65EDDA0);
            v79 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*location, "objectForKey:", v78);
            v80 = (NSUUID *)objc_claimAutoreleasedReturnValue();
            OZXForceSetPlaneAnchorUUID(*(void **)self->_documentInfo, v79, v80);

          }
        }
        v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v315, v341, 16);
      }
      while (v75);
    }

    groupIDToCache = self->_groupIDToCache;
    v313 = *(_OWORD *)&a3->var0;
    v314 = a3->var3;
    v82 = -[PVMotionEffect isRenderCachingDisabled_NoLock:](self, "isRenderCachingDisabled_NoLock:", &v313);
    if (groupIDToCache)
      v83 = v82;
    else
      v83 = 1;
    if (self->_lastRenderWasHDR != v246)
      self->_cachedRenderDirty = 1;
    if ((v83 & 1) != 0)
    {
      if (!groupIDToCache)
        goto LABEL_116;
      v84 = 0;
    }
    else
    {
      v85 = -[PVMotionEffectTimelineComponent isForceRenderAtPosterFrameEnabled:](self->_timelineComponent, "isForceRenderAtPosterFrameEnabled:", *location);
      v86 = *location;
      if (v85)
      {
        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("kPVEnablePosterFrameCaching"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v87, "BOOLValue");

      }
      else
      {
        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("kPVEnableLoopedRangeRenderCaching"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "BOOLValue");

        memset(&v302, 0, 24);
        v90 = self->_timelineComponent;
        if (v90)
          -[PVMotionEffectTimelineComponent introDuration_NoLock](v90, "introDuration_NoLock");
        time1 = v329;
        time2 = v302.start;
        if (CMTimeCompare(&time1, &time2) >= 0)
          v84 = v89;
        else
          v84 = 0;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v50, v52);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffect didSetCacheInvalidatingParameter_NoLock:forKey:](self, "didSetCacheInvalidatingParameter_NoLock:forKey:", v91, CFSTR("kPVCachedTextureOutputSize"));
    OZXSetUseRenderCache(*(void **)self->_documentInfo, groupIDToCache, v84);
    if (!v84 || self->_cachedRenderDirty)
      OZXClearCachedRender(*(void **)self->_documentInfo, groupIDToCache);
    self->_cachedRenderDirty = 0;

LABEL_116:
    if (!-[PVMotionEffect isTimeDurationIndefinite](self, "isTimeDurationIndefinite"))
    {
      memset(&v302, 0, 24);
      v93 = self->_timelineComponent;
      if (v93)
        -[PVMotionEffectTimelineComponent timelineLastFrame_NoLock](v93, "timelineLastFrame_NoLock");
      v310 = v329;
      v309 = v302.start;
      if (CMTimeCompare(&v310, &v309) >= 1)
        v329 = v302.start;
    }
    v240 = fabsf(v16 + -1.0);
    v94 = 1.0;
    if (v52 > 0.0)
    {
      LODWORD(v94) = *((_DWORD *)self->_documentInfo + 4);
      v94 = v52 / (double)*(unint64_t *)&v94;
    }
    v95 = v16;
    if (v240 < 0.00001)
      v95 = 1.0;
    v96 = v95 * v94;
    v308 = 0x3FF0000000000000;
    v305 = 0x3FF0000000000000;
    v302.duration.epoch = 0x3FF0000000000000;
    v302.start.value = 0x3FF0000000000000;
    memset(&v302.start.timescale, 0, 32);
    v303 = 0u;
    v304 = 0u;
    v306 = 0u;
    v307 = 0u;
    if (v95 * v94 != 1.0)
    {
      *(double *)&v302.start.value = v95 * v94;
      *(double *)&v302.start.timescale = v96 * 0.0;
      *(double *)&v302.start.epoch = v96 * 0.0;
      *(double *)&v302.duration.value = v96 * 0.0;
    }
    v92.f64[0] = v43 * 0.5;
    v242 = v92;
    v241 = v44 * 0.5;
    if (v96 != -1.0)
    {
      *(double *)&v302.duration.timescale = v96 * -0.0;
      *(double *)&v302.duration.epoch = -(v95 * v94);
      *(double *)&v303 = v96 * -0.0;
      *((double *)&v303 + 1) = v96 * -0.0;
    }
    v301 = 0uLL;
    -[PVEffect effectType](self, "effectType", PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)&v302, v92, v44 * 0.5, 0.0).f64[0]);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = objc_msgSend(v97, "isEqualToString:", CFSTR("effect.video.transition"));

    objc_msgSend(*location, "objectForKey:", CFSTR("SelfieEffectUsesCameraFacing"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*location, "objectForKey:", CFSTR("kPVEffectPVARMetadata"));
    v243 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("kPVTransformAnimationKey"));
    v99 = objc_claimAutoreleasedReturnValue();
    v296 = *(_OWORD *)&a3->var0;
    v297 = a3->var3;
    v231 = (void *)v99;
    v233 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v99, &v296, 14, 0, v298, v43, v44);
    v295[1] = 0;
    v295[0] = 0;
    v294 = (uint64_t *)v295;
    v293[1] = 0;
    v293[0] = 0;
    v292 = (uint64_t *)v293;
    v291[1] = 0;
    v291[0] = 0;
    v290 = (uint64_t *)v291;
    v289[1] = 0;
    v289[0] = 0;
    v288 = (uint64_t *)v289;
    PVInputHGNodeMap<unsigned int>::MapKeys(a4, (char **)&__p);
    v100 = (unsigned int *)__p;
    v101 = v98;
    if (__p != v287)
    {
      v102 = v47 * v236;
      v103 = (char *)a4 + 32;
      v104 = -v241;
      v227 = vdupq_n_s64(0x8000000000000000);
      while (1)
      {
        v285 = 0;
        v285 = *v100;
        *(_QWORD *)&v270.var2 = 0;
        *(_QWORD *)&v270.var0 = 0;
        v105 = *(HGRenderer **)a5;
        PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v285, v273);
        *(_QWORD *)&v270.var0 = HGRenderer::GetDOD(v105, v273[0]);
        *(_QWORD *)&v270.var2 = v106;
        if (v273[0])
          (*(void (**)(HGNode *))(*(_QWORD *)v273[0] + 24))(v273[0]);
        v107 = *(char **)v103;
        if (!*(_QWORD *)v103)
          goto LABEL_144;
        v108 = (char *)a4 + 32;
        do
        {
          v109 = *((_DWORD *)v107 + 8);
          v110 = v109 >= v285;
          if (v109 >= v285)
            v111 = (char **)v107;
          else
            v111 = (char **)(v107 + 8);
          if (v110)
            v108 = v107;
          v107 = *v111;
        }
        while (*v111);
        if (v108 != v103 && *((_DWORD *)v108 + 8) <= v285)
          v284 = *(_OWORD *)(v108 + 40);
        else
LABEL_144:
          v284 = 0uLL;
        if (v270.var2 == v270.var0)
          goto LABEL_224;
        if (v270.var3 == v270.var1)
          goto LABEL_224;
        v98 = v101;
        if (HGRect::IsNull(&v270))
          goto LABEL_224;
        v98 = v101;
        if (HGRect::IsZero(&v270))
          goto LABEL_224;
        var2 = v270.var2;
        var0 = v270.var0;
        v114 = (*(float (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
        v115 = v270.var3;
        var1 = v270.var1;
        v117 = (*(float (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
        PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v285, (HGNode **)&v272);
        v273[0] = (HGNode *)&v285;
        v118 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v294, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)v273);
        v119 = v118[5];
        v120 = (uint64_t *)v272;
        if (v119 == (uint64_t *)v272)
        {
          if (v119)
            (*(void (**)(uint64_t *))(*v119 + 24))(v119);
        }
        else
        {
          if (v119)
          {
            (*(void (**)(uint64_t *))(*v119 + 24))(v119);
            v120 = (uint64_t *)v272;
          }
          v118[5] = v120;
        }
        PVInputHGNodeMap<unsigned int>::GetPixelTransform((uint64_t)a4, v285, (uint64_t)v273);
        *(_QWORD *)&v272 = &v285;
        v121 = (HGNode **)(std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)&v272)+ 5);
        if (v273 != v121)
        {
          v123 = 0;
          v124 = v273;
          do
          {
            for (k = 0; k != 4; ++k)
              v121[k] = v124[k];
            ++v123;
            v121 += 4;
            v124 += 4;
          }
          while (v123 != 4);
        }
        v126 = (uint64_t **)*((_QWORD *)self->_documentInfo + 21);
        if (v126)
        {
          v273[0] = (HGNode *)&v285;
          v127 = *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v126, &v285, (uint64_t)&std::piecewise_construct, (unsigned int **)v273)+ 8);
          v273[0] = (HGNode *)&v285;
          *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v288, &v285, (uint64_t)&std::piecewise_construct, (unsigned int **)v273)+ 8) = v127;
        }
        if (v101)
          break;
        v135 = -[PVEffect conformToInputAspect](self, "conformToInputAspect");
        v136 = v230;
        if (v285 <= 1)
          v136 = 0;
        if ((v135 | v136) == 1)
        {
          v137 = *(char **)v103;
          if (!*(_QWORD *)v103)
            goto LABEL_191;
          v138 = (char *)a4 + 32;
          do
          {
            v139 = *((_DWORD *)v137 + 8);
            v140 = v139 >= v285;
            if (v139 >= v285)
              v141 = (char **)v137;
            else
              v141 = (char **)(v137 + 8);
            if (v140)
              v138 = v137;
            v137 = *v141;
          }
          while (*v141);
          if (v138 != v103 && *((_DWORD *)v138 + 8) <= v285)
          {
            *(_OWORD *)v273 = *(_OWORD *)(v138 + 40);
            v134 = *((double *)v138 + 7);
            v133 = *((double *)v138 + 8);
          }
          else
          {
LABEL_191:
            v273[1] = 0;
            v273[0] = 0;
            v133 = -1.0;
            v134 = -1.0;
          }
LABEL_192:
          *(_QWORD *)&v272 = &v285;
          v142 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v292, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)&v272);
          v143 = *(_OWORD *)v273;
          goto LABEL_219;
        }
        v273[0] = (HGNode *)&v285;
        v152 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v292, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)v273);
        *(_OWORD *)(v152 + 5) = v301;
        *((double *)v152 + 7) = v228;
        *((double *)v152 + 8) = v238;
LABEL_220:
        if (v102 != 1.0)
        {
          v273[0] = (HGNode *)&v285;
          v162 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)v273);
          v163.f64[0] = -v242.f64[0];
          PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)(v162 + 5), v163, v104, 0.0);
          v273[0] = (HGNode *)&v285;
          v164 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)v273);
          PCMatrix44Tmpl<double>::leftScale((float64x2_t *)(v164 + 5), v102, v102, 1.0);
          v273[0] = (HGNode *)&v285;
          v165 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)v273);
          PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)(v165 + 5), v242, v241, 0.0);
        }
        v98 = v101;
        if (v233)
        {
          v273[0] = (HGNode *)&v285;
          v166 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)v273);
          v167.f64[0] = -v242.f64[0];
          PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)(v166 + 5), v167, v104, 0.0);
          v273[0] = (HGNode *)&v285;
          v168 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)v273);
          PCMatrix44Tmpl<double>::leftScale((float64x2_t *)(v168 + 5), v300, v300, 1.0);
          v273[0] = (HGNode *)&v285;
          v169 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)v273);
          v170.f64[0] = v242.f64[0] + v299.f64[0];
          PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)(v169 + 5), v170, v241 + v299.f64[1], 0.0);
          v98 = v101;
        }
LABEL_224:
        if (++v100 == v287)
          goto LABEL_229;
      }
      if (v285 <= 1)
      {
        v128 = *(char **)v103;
        if (!*(_QWORD *)v103)
          goto LABEL_176;
        v129 = (char *)a4 + 32;
        do
        {
          v130 = *((_DWORD *)v128 + 8);
          v131 = v130 >= v285;
          if (v130 >= v285)
            v132 = (char **)v128;
          else
            v132 = (char **)(v128 + 8);
          if (v131)
            v129 = v128;
          v128 = *v132;
        }
        while (*v132);
        if (v129 != v103 && *((_DWORD *)v129 + 8) <= v285)
        {
          *(_OWORD *)v273 = *(_OWORD *)(v129 + 40);
          v134 = *((double *)v129 + 7);
          v133 = *((double *)v129 + 8);
        }
        else
        {
LABEL_176:
          v273[1] = 0;
          v273[0] = 0;
          v133 = -1.0;
          v134 = -1.0;
        }
        goto LABEL_192;
      }
      v144 = (float)((float)(var2 - var0) / v114);
      v145 = (float)((float)(v115 - var1) / v117);
      v122.f64[0] = v144 * 0.5;
      v146 = v145 * 0.5;
      if (v285 == 2)
      {
        v283 = 0x3FF0000000000000;
        v280 = 0x3FF0000000000000;
        v273[0] = (HGNode *)0x3FF0000000000000;
        v274 = 0;
        v275 = 0;
        v273[1] = 0;
        v278 = 0;
        v279 = 0;
        v281 = 0u;
        v282 = 0u;
        v276 = xmmword_1B304F610;
        v277 = v227;
        PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)v273, v122, v146, 0.0);
        *(_QWORD *)&v272 = &v285;
        v147 = (HGNode **)(std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)&v272)+ 5);
        if (v273 != v147)
        {
          v148 = 0;
          v149 = v273;
          do
          {
            for (m = 0; m != 4; ++m)
              v147[m] = v149[m];
            ++v148;
            v147 += 4;
            v149 += 4;
          }
          while (v148 != 4);
        }
        *(_QWORD *)&v272 = &v285;
        v151 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v292, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)&v272);
        *(_OWORD *)(v151 + 5) = v284;
        *((double *)v151 + 7) = v144;
        *((double *)v151 + 8) = v145;
        goto LABEL_220;
      }
      v283 = 0x3FF0000000000000;
      v280 = 0x3FF0000000000000;
      v273[0] = (HGNode *)0x3FF0000000000000;
      v274 = 0;
      v275 = 0;
      v273[1] = 0;
      v278 = 0;
      v279 = 0;
      v281 = 0u;
      v282 = 0u;
      v276 = xmmword_1B304F610;
      v277 = v227;
      PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)v273, v122, v146, 0.0);
      *(_QWORD *)&v272 = &v285;
      v153 = (HGNode **)(std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v285, (uint64_t)&std::piecewise_construct, (_DWORD **)&v272)+ 5);
      if (v273 != v153)
      {
        v154 = 0;
        v155 = v273;
        do
        {
          for (n = 0; n != 4; ++n)
            v153[n] = v155[n];
          ++v154;
          v153 += 4;
          v155 += 4;
        }
        while (v154 != 4);
      }
      v157 = *(char **)v103;
      if (!*(_QWORD *)v103)
        goto LABEL_217;
      v158 = (char *)a4 + 32;
      do
      {
        v159 = *((_DWORD *)v157 + 8);
        v160 = v159 >= v285;
        if (v159 >= v285)
          v161 = (char **)v157;
        else
          v161 = (char **)(v157 + 8);
        if (v160)
          v158 = v157;
        v157 = *v161;
      }
      while (*v161);
      if (v158 != v103 && *((_DWORD *)v158 + 8) <= v285)
      {
        v272 = *(_OWORD *)(v158 + 40);
        v134 = *((double *)v158 + 7);
        v133 = *((double *)v158 + 8);
      }
      else
      {
LABEL_217:
        v272 = 0uLL;
        v133 = -1.0;
        v134 = -1.0;
      }
      v340 = &v285;
      v142 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v292, &v285, (uint64_t)&std::piecewise_construct, &v340);
      v143 = v272;
LABEL_219:
      *(_OWORD *)(v142 + 5) = v143;
      *((double *)v142 + 7) = v134;
      *((double *)v142 + 8) = v133;
      goto LABEL_220;
    }
LABEL_229:
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj))
      v171 = 2;
    else
      v171 = 0;
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj))
    {
      +[PVEnvironment PVExportPrefilterValue](PVEnvironment, "PVExportPrefilterValue");
      if (v172 == 0.0)
        v171 = 1;
    }
    if (((*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj) & 1) == 0
      && -[PVMotionEffect isSketch](self, "isSketch"))
    {
      v171 = 1;
    }
    +[PVHostApplicationDelegateHandler sharedInstance](PVHostApplicationDelegateHandler, "sharedInstance");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v270.var2 = 0;
    *(_QWORD *)&v270.var0 = 0;
    v271 = 0;
    PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
    v174 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
    PVImagePropertiesForColorSpace(v174, 0, (uint64_t)&v270);

    v175 = v271;
    v176 = v270.var1;
    (*(void (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
    v178 = 1.0;
    if (v240 >= 0.00001)
      v178 = v16;
    *(float *)v273 = v178 * v177;
    *((float *)v273 + 1) = v178 * v177;
    v179 = v96;
    *(float *)&v273[1] = v179;
    v277.i32[0] = v171;
    *(uint64_t *)((char *)v277.i64 + 4) = v176 == 16;
    v278 = v175;
    v279 = v175;
    LOBYTE(v280) = v246;
    HIDWORD(v280) = -[PVMotionEffect stillImageInverseToneMapOperator:](self, "stillImageInverseToneMapOperator:", *location);
    LOBYTE(v281) = 0;
    -[PVMotionEffect outputROI_NoLock:scale:](self, "outputROI_NoLock:scale:", self->_documentInfo, fabsf(*(float *)&v273[1]));
    v274 = v180;
    v275 = v181;
    *(_QWORD *)&v276 = v182;
    *((_QWORD *)&v276 + 1) = v183;
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("splitACropRect"));
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("splitBCropRect"));
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("pipCropRect"));
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("pipScaleFactor"));
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
    v186 = *((_QWORD *)a4 + 13);
    if (!v186)
      goto LABEL_250;
    v187 = (char *)a4 + 104;
    do
    {
      v188 = *(_DWORD *)(v186 + 28);
      v189 = v188 == 0;
      if (v188)
        v190 = (uint64_t *)v186;
      else
        v190 = (uint64_t *)(v186 + 8);
      if (!v189)
        v187 = (_DWORD *)v186;
      v186 = *v190;
    }
    while (*v190);
    if (v187 != (_DWORD *)((char *)a4 + 104) && v187[7] <= 1u)
      v191 = v187[8];
    else
LABEL_250:
      v191 = 0;
    LOBYTE(v226) = v246;
    -[PVMotionEffect adjustCutawayInputs:splitCropRectA:splitCropRectB:pipRect:pipScaleFactor:renderScale:pipNeedsCrop:isHDRRender:workingColorSpace:](self, "adjustCutawayInputs:splitCropRectA:splitCropRectB:pipRect:pipScaleFactor:renderScale:pipNeedsCrop:isHDRRender:workingColorSpace:", &v294, v184, v185, v237, v239, v191 == 0, v226, v175);
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("inputANeedsBackground"));
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend(v192, "BOOLValue");

    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("inputBNeedsBackground"));
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = objc_msgSend(v194, "BOOLValue");

    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("slideACropRect"));
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*location, "objectForKeyedSubscript:", CFSTR("slideBCropRect"));
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
    -[PVMotionEffect adjustTransitionInputs:renderScale:renderer:inputANeedsBackground:inputBNeedsBackground:slideCropRectA:slideCropRectB:](self, "adjustTransitionInputs:renderScale:renderer:inputANeedsBackground:inputBNeedsBackground:slideCropRectA:slideCropRectB:", &v294, a5, v193, v195, v252, v196);
    -[PVMotionEffect adjustPosition:](self, "adjustPosition:", *location);
    v197 = *location;
    v268 = *(_OWORD *)&a3->var0;
    v269 = a3->var3;
    -[PVMotionEffect updateSketchAnimation:defaultProperties:time:](self, "updateSketchAnimation:defaultProperties:time:", v197, 0, &v268);
    -[PVMotionEffect adjustCamera:](self, "adjustCamera:", *location);
    v198 = *location;
    v267 = v329;
    -[PVMotionEffect applyARData:time:renderParams:](self, "applyARData:time:renderParams:", v198, &v267, v273);
    -[PVMotionEffect deleteTemporalInspectableProperties](self, "deleteTemporalInspectableProperties");
    motionComponents = self->_motionComponents;
    v264[0] = MEMORY[0x1E0C809B0];
    v264[1] = 3221225472;
    v264[2] = __58__PVMotionEffect_hgNodeForTime_inputs_renderer_igContext___block_invoke;
    v264[3] = &unk_1E64D6C20;
    v264[4] = self;
    v265 = *(_OWORD *)&a3->var0;
    v266 = a3->var3;
    -[NSMutableArray enumerateObjectsUsingBlock:](motionComponents, "enumerateObjectsUsingBlock:", v264);
    if (v244)
      objc_storeStrong(location, obj);
    v200 = -[PVMotionEffect getOSFAOption:](self, "getOSFAOption:", *location);
    if ((v201 & 1) == 0
    {
      -[PVMotionEffect hgNodeForTime:inputs:renderer:igContext:]::rigCheckboxName = 0;
      PCString::set((PCString *)&-[PVMotionEffect hgNodeForTime:inputs:renderer:igContext:]::rigCheckboxName, CFSTR("IsHDR"));
      __cxa_atexit((void (*)(void *))PCString::~PCString, &-[PVMotionEffect hgNodeForTime:inputs:renderer:igContext:]::rigCheckboxName, &dword_1B2737000);
      v98 = v101;
    }
    v202 = 0.0;
    if (v246)
      v202 = 1.0;
    OZXSetRigValueWithName(*(void **)self->_documentInfo, (PCString *)&-[PVMotionEffect hgNodeForTime:inputs:renderer:igContext:]::rigCheckboxName, v202);
    v203 = (PCColorSpaceCache *)-[NSLock unlock](self->super._inspectablePropertiesLock, "unlock");
    v204 = v243;
    if (v246)
    {
      v229 = v185;
      v205 = v294;
      if (v294 != (uint64_t *)v295)
      {
        do
        {
          if ((!v98 || *((_DWORD *)v205 + 8) != 1) && (!v204 || (*((_DWORD *)v205 + 8) - 1) >= 2))
          {
            v203 = (PCColorSpaceCache *)v205[5];
            if (v200)
            {
              if (v203)
              {
                *(_QWORD *)&v272 = v205[5];
                (*(void (**)(PCColorSpaceCache *))(*(_QWORD *)v203 + 16))(v203);
                FxApplySimpleToneCurve((uint64_t *)&v272, &v284, 0.7, 12.0);
                v206 = v284;
                if ((_QWORD)v272 == (_QWORD)v284)
                {
                  if ((_QWORD)v272)
                    (*(void (**)(void))(*(_QWORD *)v272 + 24))();
                }
                else
                {
                  if ((_QWORD)v272)
                  {
                    (*(void (**)(void))(*(_QWORD *)v272 + 24))();
                    v206 = v284;
                  }
                  *(_QWORD *)&v272 = v206;
                }
                if (v200 == 2)
                {
                  FxApplyColorConform((uint64_t *)&v272, (uint64_t)&kPCNCLC_Rec2020Linear, 1, (uint64_t)&kPCNCLC_Rec709, (char *)1, (uint64_t *)&v284);
                  v207 = v284;
                  if ((_QWORD)v272 == (_QWORD)v284)
                  {
                    if ((_QWORD)v272)
                      (*(void (**)(void))(*(_QWORD *)v272 + 24))();
                  }
                  else
                  {
                    if ((_QWORD)v272)
                    {
                      (*(void (**)(void))(*(_QWORD *)v272 + 24))();
                      v207 = v284;
                    }
                    *(_QWORD *)&v272 = v207;
                  }
                }
                goto LABEL_279;
              }
            }
            else
            {
              *(_QWORD *)&v272 = v205[5];
              if (v203)
              {
                (*(void (**)(PCColorSpaceCache *))(*(_QWORD *)v203 + 16))(v203);
LABEL_279:
                v203 = (PCColorSpaceCache *)v205[5];
                v208 = v272;
                if (v203 == (PCColorSpaceCache *)v272)
                {
                  v204 = v243;
                  if (v203)
                  {
                    v203 = (PCColorSpaceCache *)(*(uint64_t (**)(PCColorSpaceCache *))(*(_QWORD *)v203 + 24))(v203);
                    v204 = v243;
                  }
                }
                else
                {
                  if (v203)
                  {
                    v203 = (PCColorSpaceCache *)(*(uint64_t (**)(PCColorSpaceCache *))(*(_QWORD *)v203 + 24))(v203);
                    v208 = v272;
                  }
                  v204 = v243;
                  v205[5] = v208;
                }
              }
            }
          }
          v209 = (uint64_t *)v205[1];
          if (v209)
          {
            do
            {
              v210 = v209;
              v209 = (uint64_t *)*v209;
            }
            while (v209);
          }
          else
          {
            do
            {
              v210 = (uint64_t *)v205[2];
              v189 = *v210 == (_QWORD)v205;
              v205 = v210;
            }
            while (!v189);
          }
          v205 = v210;
        }
        while (v210 != (uint64_t *)v295);
      }
      v185 = v229;
      if (v200 == 2)
      {
        v278 = PCColorSpaceCache::cgRec709(v203);
        v279 = v278;
        LOBYTE(v280) = 0;
        HIDWORD(v280) = 0;
      }
    }
    v211 = (_QWORD **)self->_documentInfo;
    *(_QWORD *)&v272 = 0;
    v212 = *v211;
    v263 = v329;
    std::map<unsigned int,HGRef<HGNode>>::map[abi:ne180100](v262, (uint64_t)&v294);
    std::map<unsigned int,unsigned int>::map[abi:ne180100](v261, (uint64_t)&v288);
    std::map<unsigned int,PCRect<double>>::map[abi:ne180100]((uint64_t)v259, (uint64_t)&v292);
    std::map<unsigned int,PCMatrix44Tmpl<double>>::map[abi:ne180100]((uint64_t)v257, (uint64_t)&v290);
    LODWORD(v212) = OZXGetFrameAsRenderGraph(v212, &v263, (uint64_t)v262, (uint64_t)v261, (uint64_t)v259, (uint64_t)v257, (uint64_t)v273, &v302, 0, *(HGRenderer **)a5, (METimeRemap **)&v272);
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)v257, v258);
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)v259, v260);
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)v261, (_QWORD *)v261[1]);
    std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::destroy((uint64_t)v262, (_QWORD *)v262[1]);
    v214 = (unsigned int *)v272;
    if ((_DWORD)v212)
    {
      if (!(_QWORD)v272)
        goto LABEL_351;
    }
    else
    {
      v215 = *v248;
      if (*v248 != (HGSolidColor *)v272)
      {
        if (v215)
        {
          (*(void (**)(HGSolidColor *))(*(_QWORD *)v215 + 24))(v215);
          v214 = (unsigned int *)v272;
        }
        *v248 = (HGSolidColor *)v214;
        if (v214)
          (*(void (**)(unsigned int *))(*(_QWORD *)v214 + 16))(v214);
      }
      if (v246)
      {
        if (v200)
        {
          if (v214)
          {
            v340 = v214;
            (*(void (**)(unsigned int *))(*(_QWORD *)v214 + 16))(v214);
            if (v200 == 2)
            {
              FxApplyColorConform((uint64_t *)&v340, (uint64_t)&kPCNCLC_Rec709, 1, (uint64_t)&kPCNCLC_Rec2020Linear, (char *)1, (uint64_t *)&v284);
              v216 = (unsigned int *)v284;
              if (v340 == (unsigned int *)v284)
              {
                if (v340)
                  (*(void (**)(void))(*(_QWORD *)v340 + 24))();
              }
              else
              {
                if (v340)
                {
                  (*(void (**)(void))(*(_QWORD *)v340 + 24))();
                  v216 = (unsigned int *)v284;
                }
                v340 = v216;
              }
            }
            FxApplyInverseSimpleToneCurve((uint64_t *)&v340, &v284, 0.7, 12.0);
            v217 = (unsigned int *)v284;
            if (v340 == (unsigned int *)v284)
            {
              if (v340)
                (*(void (**)(void))(*(_QWORD *)v340 + 24))();
            }
            else
            {
              if (v340)
              {
                (*(void (**)(void))(*(_QWORD *)v340 + 24))();
                v217 = (unsigned int *)v284;
              }
              v340 = v217;
            }
          }
          else
          {
            v340 = 0;
          }
        }
        else
        {
          v340 = v214;
          if (v214)
            (*(void (**)(unsigned int *))(*(_QWORD *)v214 + 16))(v214);
        }
        v218 = v340;
        if (v214 == v340)
        {
          if (v214)
            (*(void (**)(unsigned int *))(*(_QWORD *)v214 + 24))(v214);
        }
        else
        {
          if (v214)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v214 + 24))(v214);
            v218 = v340;
          }
          *v248 = (HGSolidColor *)v218;
        }
      }
      v213.n128_f32[0] = v240;
      if (v240 >= 0.00001)
      {
        v219 = *v248;
        v256 = v219;
        if (v219)
          (*(void (**)(HGSolidColor *, float))(*(_QWORD *)v219 + 16))(v219, v240);
        v220.f64[0] = v242.f64[0];
        v220.f64[1] = v241;
        HGXFormForScaleAroundPoint(&v256, (HGXForm **)&v284, v220, 1.0 / v16, (float64x2_t)0);
        v221 = (HGSolidColor *)v284;
        if (v219 == (HGSolidColor *)v284)
        {
          if (v219)
            (*(void (**)(HGSolidColor *))(*(_QWORD *)v219 + 24))(v219);
        }
        else
        {
          if (v219)
          {
            (*(void (**)(HGSolidColor *))(*(_QWORD *)v219 + 24))(v219);
            v221 = (HGSolidColor *)v284;
          }
          *v248 = v221;
          *(_QWORD *)&v284 = 0;
        }
        if (v256)
          (*(void (**)(HGSolidColor *))(*(_QWORD *)v256 + 24))(v256);
      }
      if (v233)
      {
        v222 = *v248;
        v255 = v222;
        if (v222)
          (*(void (**)(HGSolidColor *, __n128))(*(_QWORD *)v222 + 16))(v222, v213);
        v223.f64[0] = v242.f64[0];
        v223.f64[1] = v241;
        HGXFormForScaleAroundPoint(&v255, (HGXForm **)&v284, v223, v300, v299);
        v224 = (HGSolidColor *)v284;
        if (v222 == (HGSolidColor *)v284)
        {
          if (v222)
            (*(void (**)(HGSolidColor *))(*(_QWORD *)v222 + 24))(v222);
        }
        else
        {
          if (v222)
          {
            (*(void (**)(HGSolidColor *))(*(_QWORD *)v222 + 24))(v222);
            v224 = (HGSolidColor *)v284;
          }
          *v248 = v224;
          *(_QWORD *)&v284 = 0;
        }
        if (v255)
          (*(void (**)(HGSolidColor *))(*(_QWORD *)v255 + 24))(v255);
      }
      self->_lastRenderWasHDR = v246;
      v214 = (unsigned int *)v272;
      if (!(_QWORD)v272)
        goto LABEL_351;
    }
    (*(void (**)(unsigned int *))(*(_QWORD *)v214 + 24))(v214);
LABEL_351:

    if (__p)
    {
      v287 = (unsigned int *)__p;
      operator delete(__p);
    }
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v288, v289[0]);
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v290, v291[0]);
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v292, v293[0]);
    std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::destroy((uint64_t)&v294, v295[0]);

LABEL_354:
    -[NSLock unlock](self->_documentLock, "unlock");
    goto LABEL_355;
  }
  -[NSLock unlock](self->super._inspectablePropertiesLock, "unlock");
  -[NSLock unlock](self->_documentLock, "unlock");
LABEL_43:

LABEL_355:
  return v225;
}

uint64_t __58__PVMotionEffect_hgNodeForTime_inputs_renderer_igContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 144);
  v4 = *(_QWORD *)(v2 + 80);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(a2, "motionEffect:willRender:properties:time:", v2, v3, v4, &v6);
}

- (void)adjustCutawayBorder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void **documentInfo;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  PCString v21;

  v4 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("splitACropRect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "CGRectValue");
    v8 = v7;
    v10 = v9;
    v21.var0 = 0;
    PCString::set(&v21, CFSTR("Orientation"));
    v11 = 0.0;
    if (v8 > v10)
      v11 = 1.0;
    OZXSetRigValueWithName(*(void **)self->_documentInfo, &v21, v11);
    PCString::~PCString(&v21);
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pipRect"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13)
    {
      objc_msgSend(v13, "CGRectValue");
      documentInfo = (void **)self->_documentInfo;
      LODWORD(v15) = *((_DWORD *)documentInfo + 3);
      LODWORD(v16) = *((_DWORD *)documentInfo + 4);
      OZXSetBorderScaleAndTranslation(*documentInfo, v19, v20, (v18 + v19 * 0.5 + -0.5) * (double)v15, (0.5 - (v17 + v20 * 0.5)) * (double)v16);
    }
  }

}

- (void)adjustCutawayFadeAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  PVMotionEffectTimelineComponent *timelineComponent;
  _OWORD v10[3];
  CMTime v11;
  CMTime v12;
  _OWORD v13[3];
  CMTime v14;
  CMTime v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  _BYTE v19[32];
  CMTime v20;
  CMTime v21;

  v4 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pipFadeIn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pipFadeOut"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      memset(&v21, 0, sizeof(v21));
      objc_msgSend(v5, "floatValue");
      CMTimeMakeWithSeconds(&v21, v7, 30);
      memset(&v20, 0, sizeof(v20));
      objc_msgSend(v6, "floatValue");
      CMTimeMakeWithSeconds(&v20, v8, 30);
      v18 = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)v19 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      -[PVEffect effectRange](self, "effectRange");
      *(_OWORD *)&v19[8] = v16;
      *(_QWORD *)&v19[24] = v17;
      memset(&v15, 0, sizeof(v15));
      timelineComponent = self->_timelineComponent;
      v14 = v21;
      v13[2] = *(_OWORD *)&v19[16];
      v13[0] = v18;
      v13[1] = *(_OWORD *)v19;
      if (timelineComponent)
      {
        -[PVMotionEffectTimelineComponent timelineTimeFromComponentTime_NoLock:editRange:documentInfo:](timelineComponent, "timelineTimeFromComponentTime_NoLock:editRange:documentInfo:", &v14, v13, self->_documentInfo);
        timelineComponent = self->_timelineComponent;
      }
      memset(&v12, 0, sizeof(v12));
      v11 = v20;
      v10[0] = v18;
      v10[1] = *(_OWORD *)v19;
      v10[2] = *(_OWORD *)&v19[16];
      if (timelineComponent)
        -[PVMotionEffectTimelineComponent timelineTimeFromComponentTime_NoLock:editRange:documentInfo:](timelineComponent, "timelineTimeFromComponentTime_NoLock:editRange:documentInfo:", &v11, v10, self->_documentInfo);
      OZXSetCutawayFadeInOut(*(void **)self->_documentInfo, &v15, &v12);

    }
  }

}

- (void)adjustCutawayInputs:(void *)a3 splitCropRectA:(id)a4 splitCropRectB:(id)a5 pipRect:(id)a6 pipScaleFactor:(id)a7 renderScale:(float)a8 pipNeedsCrop:(BOOL)a9 isHDRRender:(BOOL)a10 workingColorSpace:(CGColorSpace *)a11
{
  _BOOL4 v11;
  id v18;
  id v19;
  id v20;
  uint64_t **v21;
  uint64_t *v22;
  uint64_t **v23;
  uint64_t *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  HGCrop *v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t **v48;
  HGCrop *v49;
  id v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  HGCrop *v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t **v70;
  HGCrop *v71;
  double v72;
  float v73;
  double v74;
  float v75;
  double v76;
  float v77;
  double v78;
  float v79;
  float v80;
  float v81;
  uint64_t **v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  HGSolidColor *v88;
  __n128 v93;
  __n128 v94;
  HGHWMultiBlend *v96;
  uint64_t **v97;
  HGHWMultiBlend *v98;
  uint64_t **v99;
  uint64_t **v100;
  uint64_t *v101;
  double v102;
  double v103;
  HGCrop *v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  int v108;
  uint64_t **v109;
  HGCrop *v110;
  uint64_t *v111;
  id v112;
  id v113;
  unsigned int v114;
  unsigned int *v115;
  int v116;
  _DWORD *v117;
  int v118;
  HGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;

  v11 = a9;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v112 = v18;
  v113 = a7;
  LODWORD(v115) = 0;
  v117 = &v115;
  v21 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v115, (uint64_t)&std::piecewise_construct, &v117);
  v22 = v21[5];
  if (v22)
    (*(void (**)(uint64_t *))(*v22 + 16))(v21[5]);
  LODWORD(v115) = 1;
  v117 = &v115;
  v23 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v115, (uint64_t)&std::piecewise_construct, &v117);
  v24 = v23[5];
  if (v24)
    (*(void (**)(uint64_t *))(*v24 + 16))(v23[5]);
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("pipNeedsBackground"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  v27 = v18;
  v28 = v27;
  if (!v27)
  {
    if (!v20 || (v26 & 1) == 0 && (objc_msgSend(v113, "doubleValue"), v102 <= 1.0) && !v11)
    {
LABEL_46:
      v50 = 0;
      goto LABEL_47;
    }
    objc_msgSend(v20, "CGRectValue");
    v73 = v72 * a8;
    v75 = v74 * a8;
    v77 = v76 * v73 / v72;
    v79 = v78 * v75 / v74;
    v80 = v73 + v77;
    v81 = v75 + v79;
    if (!v26)
    {
LABEL_39:
      objc_msgSend(v113, "doubleValue", v111, v112);
      if (v103 > 1.0 || v11)
      {
        v104 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v104);
        v106 = HGRectMake4f(v105, v77, v79, v80, v81);
        (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v104 + 96))(v104, 0, (float)(int)v106, (float)SHIDWORD(v106), (float)v107, (float)v108);
        (*(void (**)(HGCrop *, _QWORD, uint64_t *))(*(_QWORD *)v104 + 120))(v104, 0, v24);
        LODWORD(v115) = 1;
        v117 = &v115;
        v109 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v115, (uint64_t)&std::piecewise_construct, &v117);
        v110 = (HGCrop *)v109[5];
        if (v110 != v104)
        {
          if (v110)
            (*(void (**)(HGCrop *))(*(_QWORD *)v110 + 24))(v110);
          v109[5] = (uint64_t *)v104;
          (*(void (**)(HGCrop *))(*(_QWORD *)v104 + 16))(v104);
        }
        (*(void (**)(HGCrop *))(*(_QWORD *)v104 + 24))(v104);
      }
      goto LABEL_46;
    }
    LODWORD(v115) = 0;
    v117 = &v115;
    v82 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v115, (uint64_t)&std::piecewise_construct, &v117);
    v84 = v82[5];
    if (v84)
      (*(void (**)(uint64_t *))(*v84 + 16))(v82[5]);
    v111 = v84;
    v85 = HGRectMake4f(v83, v77, v79, v80, v81);
    v87 = v86;
    v88 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(_QWORD *)&v119.var0 = v85;
    *(_QWORD *)&v119.var2 = v87;
    HGSolidColor::HGSolidColor(v88, v119);
    __asm { FMOV            V0.2S, #1.0 }
    v117 = (_DWORD *)_Q0.n128_u64[0];
    v118 = 1065353216;
    v93.n128_u32[0] = 1.0;
    v94.n128_u32[0] = 1.0;
    _Q0.n128_u32[0] = 1.0;
    if (a10)
    {
      FxApplyBT2446A((float *)&v117, a11, (float *)&v115);
      v118 = v116;
      v117 = v115;
      v94.n128_u32[0] = HIDWORD(v115);
      _Q0.n128_u32[0] = v115;
      v93.n128_u32[0] = v116;
    }
    (*(void (**)(HGSolidColor *, _QWORD, __n128, __n128, __n128, float))(*(_QWORD *)v88 + 96))(v88, 0, _Q0, v94, v93, 1.0);
    v96 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
    HGHWMultiBlend::HGHWMultiBlend(v96);
    (*(void (**)(HGHWMultiBlend *, _QWORD, HGSolidColor *, uint64_t, float))(*(_QWORD *)v96 + 624))(v96, 0, v88, 9, 1.0);
    (*(void (**)(HGHWMultiBlend *, uint64_t, uint64_t *, uint64_t, float))(*(_QWORD *)v96 + 624))(v96, 1, v24, 9, 1.0);
    v114 = 1;
    v115 = &v114;
    v97 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, &v114, (uint64_t)&std::piecewise_construct, &v115);
    v98 = (HGHWMultiBlend *)v97[5];
    if (v98 != v96)
    {
      if (v98)
        (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v98 + 24))(v98);
      v97[5] = (uint64_t *)v96;
      (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v96 + 16))(v96);
    }
    v114 = 1;
    v115 = &v114;
    v99 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, &v114, (uint64_t)&std::piecewise_construct, &v115);
    v100 = v99;
    v101 = v99[5];
    if (v24 != v101)
    {
      if (v24)
      {
        (*(void (**)(uint64_t *))(*v24 + 24))(v24);
        v24 = v100[5];
        if (!v24)
          goto LABEL_37;
      }
      else
      {
        v24 = v99[5];
        if (!v101)
          goto LABEL_37;
      }
      (*(void (**)(uint64_t *))(*v24 + 16))(v24);
    }
LABEL_37:
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v96 + 24))(v96);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v88 + 24))(v88);
    if (v111)
      (*(void (**)(uint64_t *))(*v111 + 24))(v111);
    goto LABEL_39;
  }
  objc_msgSend(v27, "CGRectValue");
  x = v120.origin.x;
  y = v120.origin.y;
  width = v120.size.width;
  height = v120.size.height;
  MinX = CGRectGetMinX(v120);
  v121.origin.x = x;
  v121.origin.y = y;
  v121.size.width = width;
  v121.size.height = height;
  MaxX = CGRectGetMaxX(v121);
  v122.origin.x = x;
  v122.origin.y = y;
  v122.size.width = width;
  v122.size.height = height;
  MinY = CGRectGetMinY(v122);
  v123.origin.x = x;
  v123.origin.y = y;
  v123.size.width = width;
  v123.size.height = height;
  MaxY = CGRectGetMaxY(v123);
  v37 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v37);
  v38 = MinX;
  v39 = MaxX;
  v40 = MaxY;
  v41 = v40 * a8;
  v42 = v39 * a8;
  v43 = MinY;
  v45 = HGRectMake4f(v44, v38 * a8, v43 * a8, v42, v41);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v37 + 96))(v37, 0, (float)(int)v45, (float)SHIDWORD(v45), (float)v46, (float)v47);
  (*(void (**)(HGCrop *, _QWORD, uint64_t *))(*(_QWORD *)v37 + 120))(v37, 0, v22);
  LODWORD(v115) = 0;
  v117 = &v115;
  v48 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v115, (uint64_t)&std::piecewise_construct, &v117);
  v49 = (HGCrop *)v48[5];
  if (v49 != v37)
  {
    if (v49)
      (*(void (**)(HGCrop *))(*(_QWORD *)v49 + 24))(v49);
    v48[5] = (uint64_t *)v37;
    (*(void (**)(HGCrop *))(*(_QWORD *)v37 + 16))(v37);
  }
  v50 = v19;

  if (v50)
  {
    objc_msgSend(v50, "CGRectValue");
    v51 = v124.origin.x;
    v52 = v124.origin.y;
    v53 = v124.size.width;
    v54 = v124.size.height;
    v55 = CGRectGetMinX(v124);
    v125.origin.x = v51;
    v125.origin.y = v52;
    v125.size.width = v53;
    v125.size.height = v54;
    v56 = CGRectGetMaxX(v125);
    v126.origin.x = v51;
    v126.origin.y = v52;
    v126.size.width = v53;
    v126.size.height = v54;
    v57 = CGRectGetMinY(v126);
    v127.origin.x = v51;
    v127.origin.y = v52;
    v127.size.width = v53;
    v127.size.height = v54;
    v58 = CGRectGetMaxY(v127);
    v59 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v59);
    v60 = v55;
    v61 = v56;
    v62 = v58;
    v63 = v62 * a8;
    v64 = v61 * a8;
    v65 = v57;
    v67 = HGRectMake4f(v66, v60 * a8, v65 * a8, v64, v63);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v59 + 96))(v59, 0, (float)(int)v67, (float)SHIDWORD(v67), (float)v68, (float)v69);
    (*(void (**)(HGCrop *, _QWORD, uint64_t *))(*(_QWORD *)v59 + 120))(v59, 0, v24);
    LODWORD(v115) = 1;
    v117 = &v115;
    v70 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v115, (uint64_t)&std::piecewise_construct, &v117);
    v71 = (HGCrop *)v70[5];
    if (v71 != v59)
    {
      if (v71)
        (*(void (**)(HGCrop *))(*(_QWORD *)v71 + 24))(v71);
      v70[5] = (uint64_t *)v59;
      (*(void (**)(HGCrop *))(*(_QWORD *)v59 + 16))(v59);
    }
    (*(void (**)(HGCrop *))(*(_QWORD *)v59 + 24))(v59);
  }
  (*(void (**)(HGCrop *))(*(_QWORD *)v37 + 24))(v37);
LABEL_47:

  if (v24)
    (*(void (**)(uint64_t *))(*v24 + 24))(v24);
  if (v22)
    (*(void (**)(uint64_t *))(*v22 + 24))(v22);

}

- (HGRect)makeCropRectForDOD:(HGRect)a3 renderRect:(CGRect)a4 renderScale:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int var2;
  int var0;
  int var1;
  int var3;
  uint64_t v14;
  uint64_t v15;
  float MinX;
  float MaxX;
  float MinY;
  uint64_t v19;
  float MaxY;
  float v21;
  float v22;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  HGRect result;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  var2 = a3.var2;
  var0 = a3.var0;
  var1 = a3.var1;
  var3 = a3.var3;
  v14 = 0;
  v15 = 0;
  MinX = CGRectGetMinX(a4);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MaxX = CGRectGetMaxX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MinY = CGRectGetMinY(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MaxY = CGRectGetMaxY(v32);
  v21 = MinY * a5;
  v22 = MaxY * a5;
  if ((float)((float)var0 - (float)(MinX * a5)) > 2.0
    || (float)((float)var2 - (float)(MaxX * a5)) > 2.0
    || (float)((float)var1 - v21) > 2.0
    || (float)((float)var3 - v22) > 2.0)
  {
    v14 = HGRectMake4f(v19, MinX * a5, v21, MaxX * a5, v22);
    v15 = v26;
  }
  v27 = v14;
  v28 = v15;
  result.var2 = v28;
  result.var3 = HIDWORD(v28);
  result.var0 = v27;
  result.var1 = HIDWORD(v27);
  return result;
}

- (void)adjustTransitionInputs:(void *)a3 renderScale:(float)a4 renderer:(const void *)a5 inputANeedsBackground:(BOOL)a6 inputBNeedsBackground:(BOOL)a7 slideCropRectA:(id)a8 slideCropRectB:(id)a9
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v16;
  id v17;
  uint64_t **v18;
  __n128 v19;
  unint64_t v20;
  uint64_t *v21;
  _DWORD *documentInfo;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HGSolidColor *v26;
  HGOverwrite *v27;
  uint64_t **v28;
  HGOverwrite *v29;
  uint64_t **v30;
  __n128 v31;
  unint64_t v32;
  uint64_t *v33;
  _DWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  HGSolidColor *v38;
  HGOverwrite *v39;
  uint64_t **v40;
  HGOverwrite *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t **v52;
  HGNode *v53;
  uint64_t DOD;
  double v55;
  uint64_t v56;
  uint64_t v57;
  HGCrop *v58;
  uint64_t **v59;
  HGCrop *v60;
  id v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t **v70;
  HGNode *v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  HGCrop *v76;
  uint64_t **v77;
  HGCrop *v78;
  unsigned int v79;
  HGRect v80;
  unsigned int *v81;
  HGRect v82;
  HGRect v83;

  v10 = a7;
  v11 = a6;
  v16 = a8;
  v17 = a9;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  if (v11)
  {
    LODWORD(v81) = 0;
    *(_QWORD *)&v80.var0 = &v81;
    v18 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v81, (uint64_t)&std::piecewise_construct, &v80);
    v21 = v18[5];
    if (v21)
      v19 = ((__n128 (*)(uint64_t *))*(_QWORD *)(*v21 + 16))(v18[5]);
    documentInfo = self->_documentInfo;
    v19.n128_u32[0] = documentInfo[3];
    LODWORD(v20) = documentInfo[4];
    v23 = HGRectMake4i(0, 0, (int)(a4 * (double)v19.n128_u64[0]), (int)(a4 * (double)v20));
    v25 = v24;
    v26 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(_QWORD *)&v82.var0 = v23;
    *(_QWORD *)&v82.var2 = v25;
    HGSolidColor::HGSolidColor(v26, v82);
    (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v26 + 96))(v26, 0, 0.0, 0.0, 0.0, 1.0);
    v27 = (HGOverwrite *)HGObject::operator new(0x1A0uLL);
    HGOverwrite::HGOverwrite(v27);
    (*(void (**)(HGOverwrite *, _QWORD, HGSolidColor *))(*(_QWORD *)v27 + 120))(v27, 0, v26);
    (*(void (**)(HGOverwrite *, uint64_t, uint64_t *))(*(_QWORD *)v27 + 120))(v27, 1, v21);
    LODWORD(v81) = 0;
    *(_QWORD *)&v80.var0 = &v81;
    v28 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v81, (uint64_t)&std::piecewise_construct, &v80);
    v29 = (HGOverwrite *)v28[5];
    if (v29 != v27)
    {
      if (v29)
        (*(void (**)(HGOverwrite *))(*(_QWORD *)v29 + 24))(v29);
      v28[5] = (uint64_t *)v27;
      (*(void (**)(HGOverwrite *))(*(_QWORD *)v27 + 16))(v27);
    }
    (*(void (**)(HGOverwrite *))(*(_QWORD *)v27 + 24))(v27);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v26 + 24))(v26);
    if (v21)
      (*(void (**)(uint64_t *))(*v21 + 24))(v21);
  }
  if (v10)
  {
    LODWORD(v81) = 1;
    *(_QWORD *)&v80.var0 = &v81;
    v30 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v81, (uint64_t)&std::piecewise_construct, &v80);
    v33 = v30[5];
    if (v33)
      v31 = ((__n128 (*)(uint64_t *))*(_QWORD *)(*v33 + 16))(v30[5]);
    v34 = self->_documentInfo;
    v31.n128_u32[0] = v34[3];
    LODWORD(v32) = v34[4];
    v35 = HGRectMake4i(0, 0, (int)(a4 * (double)v31.n128_u64[0]), (int)(a4 * (double)v32));
    v37 = v36;
    v38 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(_QWORD *)&v83.var0 = v35;
    *(_QWORD *)&v83.var2 = v37;
    HGSolidColor::HGSolidColor(v38, v83);
    (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 0, 0.0, 0.0, 0.0, 1.0);
    v39 = (HGOverwrite *)HGObject::operator new(0x1A0uLL);
    HGOverwrite::HGOverwrite(v39);
    (*(void (**)(HGOverwrite *, _QWORD, HGSolidColor *))(*(_QWORD *)v39 + 120))(v39, 0, v38);
    (*(void (**)(HGOverwrite *, uint64_t, uint64_t *))(*(_QWORD *)v39 + 120))(v39, 1, v33);
    LODWORD(v81) = 1;
    *(_QWORD *)&v80.var0 = &v81;
    v40 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v81, (uint64_t)&std::piecewise_construct, &v80);
    v41 = (HGOverwrite *)v40[5];
    if (v41 != v39)
    {
      if (v41)
        (*(void (**)(HGOverwrite *))(*(_QWORD *)v41 + 24))(v41);
      v40[5] = (uint64_t *)v39;
      (*(void (**)(HGOverwrite *))(*(_QWORD *)v39 + 16))(v39);
    }
    (*(void (**)(HGOverwrite *))(*(_QWORD *)v39 + 24))(v39);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v38 + 24))(v38);
    if (v33)
      (*(void (**)(uint64_t *))(*v33 + 24))(v33);
  }
  v42 = v16;
  v43 = v42;
  if (v42)
  {
    objc_msgSend(v42, "CGRectValue");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    LODWORD(v81) = 0;
    *(_QWORD *)&v80.var0 = &v81;
    v52 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v81, (uint64_t)&std::piecewise_construct, &v80);
    v53 = (HGNode *)v52[5];
    if (v53)
      (*(void (**)(uint64_t *))(*(_QWORD *)v53 + 16))(v52[5]);
    DOD = HGRenderer::GetDOD(*(HGRenderer **)a5, v53);
    *(_QWORD *)&v80.var0 = 0;
    *(_QWORD *)&v80.var2 = 0;
    *(float *)&v55 = a4;
    *(_QWORD *)&v80.var0 = -[PVMotionEffect makeCropRectForDOD:renderRect:renderScale:](self, "makeCropRectForDOD:renderRect:renderScale:", DOD, v56, v45, v47, v49, v51, v55);
    *(_QWORD *)&v80.var2 = v57;
    if (!HGRect::IsZero(&v80))
    {
      v58 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v58);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v58 + 96))(v58, 0, (float)v80.var0, (float)v80.var1, (float)v80.var2, (float)v80.var3);
      (*(void (**)(HGCrop *, _QWORD, HGNode *))(*(_QWORD *)v58 + 120))(v58, 0, v53);
      v79 = 0;
      v81 = &v79;
      v59 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, &v79, (uint64_t)&std::piecewise_construct, &v81);
      v60 = (HGCrop *)v59[5];
      if (v60 != v58)
      {
        if (v60)
          (*(void (**)(HGCrop *))(*(_QWORD *)v60 + 24))(v60);
        v59[5] = (uint64_t *)v58;
        (*(void (**)(HGCrop *))(*(_QWORD *)v58 + 16))(v58);
      }
      (*(void (**)(HGCrop *))(*(_QWORD *)v58 + 24))(v58);
    }
    if (v53)
      (*(void (**)(HGNode *))(*(_QWORD *)v53 + 24))(v53);
  }
  v61 = v17;

  if (v61)
  {
    objc_msgSend(v61, "CGRectValue");
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    LODWORD(v81) = 1;
    *(_QWORD *)&v80.var0 = &v81;
    v70 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v81, (uint64_t)&std::piecewise_construct, &v80);
    v71 = (HGNode *)v70[5];
    if (v71)
      (*(void (**)(uint64_t *))(*(_QWORD *)v71 + 16))(v70[5]);
    v72 = HGRenderer::GetDOD(*(HGRenderer **)a5, v71);
    *(float *)&v73 = a4;
    *(_QWORD *)&v80.var0 = -[PVMotionEffect makeCropRectForDOD:renderRect:renderScale:](self, "makeCropRectForDOD:renderRect:renderScale:", v72, v74, v63, v65, v67, v69, v73);
    *(_QWORD *)&v80.var2 = v75;
    if (!HGRect::IsZero(&v80))
    {
      v76 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v76);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v76 + 96))(v76, 0, (float)v80.var0, (float)v80.var1, (float)v80.var2, (float)v80.var3);
      (*(void (**)(HGCrop *, _QWORD, HGNode *))(*(_QWORD *)v76 + 120))(v76, 0, v71);
      v79 = 1;
      v81 = &v79;
      v77 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)a3, &v79, (uint64_t)&std::piecewise_construct, &v81);
      v78 = (HGCrop *)v77[5];
      if (v78 != v76)
      {
        if (v78)
          (*(void (**)(HGCrop *))(*(_QWORD *)v78 + 24))(v78);
        v77[5] = (uint64_t *)v76;
        (*(void (**)(HGCrop *))(*(_QWORD *)v76 + 16))(v76);
      }
      (*(void (**)(HGCrop *))(*(_QWORD *)v76 + 24))(v76);
    }
    if (v71)
      (*(void (**)(HGNode *))(*(_QWORD *)v71 + 24))(v71);
  }

}

- (void)adjustKenBurnsAnimation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  float v14;
  float v15;
  float v16;
  float v17;
  _DWORD *documentInfo;
  unint64_t v19;
  unint64_t v20;
  CGAffineTransform v21;
  unsigned int v22;

  v4 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kenBurnsStartXForm"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kenBurnsEndXForm"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6)
  {
    v22 = 0;
    if (!OZXGetDropZone(*(_QWORD *)self->_documentInfo, 0, &v22) && v22 != 0)
    {
      if (v5)
      {
        CGAffineTransformFromString(&v21, (NSString *)v5);
      }
      else
      {
        v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v21.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v21.c = v8;
        *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      v9 = *(_OWORD *)&v21.a;
      v10 = *(_OWORD *)&v21.c;
      v11 = *(_OWORD *)&v21.tx;
      if (v6)
      {
        CGAffineTransformFromString(&v21, (NSString *)v6);
      }
      else
      {
        v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v21.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v21.c = v12;
        *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      }
      v13 = *(_OWORD *)&v21.tx;
      v14 = sqrt(*(double *)&v9 * *(double *)&v9 + *(double *)&v10 * *(double *)&v10);
      v15 = sqrt(*((double *)&v9 + 1) * *((double *)&v9 + 1) + *((double *)&v10 + 1) * *((double *)&v10 + 1));
      v16 = sqrt(v21.a * v21.a + v21.c * v21.c);
      v17 = sqrt(v21.b * v21.b + v21.d * v21.d);
      OZXSetDropZoneScaleAnimation(*(_QWORD *)self->_documentInfo, v22, v14, v15, v16, v17);
      documentInfo = self->_documentInfo;
      LODWORD(v19) = documentInfo[3];
      LODWORD(v20) = documentInfo[4];
      OZXSetDropZoneTranslationAnimation(*(_QWORD *)documentInfo, v22, *(double *)&v11 * (double)v19, *((double *)&v11 + 1) * (double)v20, *(double *)&v13 * (double)v19, *((double *)&v13 + 1) * (double)v20);
    }
  }

}

- (void)setMaskPoints:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _DWORD *documentInfo;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  __int128 *v18;
  __int128 v19;
  id v20;
  uint64_t v21;
  char v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGColorSpace *obj;
  unsigned int v28;
  int v29;
  char v30;
  int v31;
  PCColor v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Mask Data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (unint64_t)objc_msgSend(v4, "count") >= 3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "CGPointValue");
          documentInfo = self->_documentInfo;
          LODWORD(v12) = documentInfo[3];
          LODWORD(v13) = documentInfo[4];
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", (v15 + -0.5) * (double)v12, (0.5 - v14) * (double)v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v8);
    }

    PCColor::PCColor(&v32);
    LOWORD(v28) = 257;
    BYTE2(v28) = 0;
    v29 = 0;
    v17 = *(_QWORD *)self->_documentInfo;
    v26 = v18[2];
    v19 = *v18;
    v25 = v18[1];
    v22 = v30;
    v21 = v28;
    v23 = v31;
    v24 = v19;
    obj = v32.var1._obj;
    if (v32.var1._obj)
      PCCFRefTraits<CGColorSpace *>::retain(v32.var1._obj);
    OZXSetShapePoints(v17, v6, 1, (unsigned __int8 *)&v21);
    PCCFRef<CGColorSpace *>::~PCCFRef(&obj);
    PCCFRef<CGColorSpace *>::~PCCFRef(&v32.var1._obj);

  }
}

- (void)setSketchStrokes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _DWORD *documentInfo;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  PCColor *v19;
  CGColorSpace *DeviceRGB;
  float v21;
  float v22;
  float v23;
  int *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  char v32;
  int v33;
  PCColor v34;
  PCColor v35;
  double v36;
  char v37;
  int v38;
  PCColor v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  double v44;
  double v45;
  double v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("SketchColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v45 = 0.0;
  v46 = 0.0;
  v44 = 0.0;
  if (v4)
    objc_msgSend(v4, "getRed:green:blue:alpha:", &v46, &v45, &v44, 0);
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("SketchData"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 && objc_msgSend(v28, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = v28;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "CGPointValue", v28);
          documentInfo = self->_documentInfo;
          LODWORD(v12) = documentInfo[3];
          LODWORD(v13) = documentInfo[4];
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", (v15 + -0.5) * (double)v12, (0.5 - v14) * (double)v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v8);
    }

    PCColor::PCColor(&v39);
    LOWORD(v36) = 0;
    BYTE2(v36) = 1;
    HIDWORD(v36) = 1;
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Sketch Write On"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
      v37 = 1;
    if (v5)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v21 = v46;
      v22 = v45;
      v23 = v44;
      PCColor::PCColor(&v35, v21, v22, v23, 1.0, DeviceRGB);
      CGColorSpaceRelease(DeviceRGB);
      *(_OWORD *)&v39.var0.var0 = *(_OWORD *)&v35.var0.var0;
      *(_OWORD *)&v39.var0.var1[1] = *(_OWORD *)&v35.var0.var1[1];
      *(_OWORD *)&v39.var0.var1[3] = *(_OWORD *)&v35.var0.var1[3];
      PCCFRef<CGColorSpace *>::operator=(&v39.var1._obj, &v35.var1._obj);
      PCCFRef<CGColorSpace *>::~PCCFRef(&v35.var1._obj);
    }
    else
    {
      v24 = PCColor::BLACK(v19);
      v25 = *(_OWORD *)v24;
      v26 = *((_OWORD *)v24 + 2);
      *(_OWORD *)&v39.var0.var1[1] = *((_OWORD *)v24 + 1);
      *(_OWORD *)&v39.var0.var1[3] = v26;
      *(_OWORD *)&v39.var0.var0 = v25;
      PCCFRef<CGColorSpace *>::operator=(&v39.var1._obj, (CGColorSpace **)v24 + 6);
    }
    v38 = 10;
    v27 = *(_QWORD *)self->_documentInfo;
    v34 = v39;
    v32 = v37;
    v31 = v36;
    v33 = 10;
    if (v39.var1._obj)
      PCCFRefTraits<CGColorSpace *>::retain(v39.var1._obj);
    OZXSetShapePoints(v27, v6, 0, (unsigned __int8 *)&v31);
    PCCFRef<CGColorSpace *>::~PCCFRef(&v34.var1._obj);
    PCCFRef<CGColorSpace *>::~PCCFRef(&v39.var1._obj);

  }
  else if (v5)
  {
    v36 = 0.0;
    *(_QWORD *)&v35.var0.var0 = 0;
    v30 = 0.0;
    objc_msgSend(v5, "getRed:green:blue:alpha:", &v36, &v35, &v30, 0);
    OZXSetShapeRGBColor(*(_QWORD *)self->_documentInfo, v36, *(double *)&v35.var0.var0, v30);
  }

}

- (void)updateSketchAnimation:(id)a3 defaultProperties:(id)a4 time:(id *)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _DWORD *documentInfo;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  __int128 *v26;
  __int128 v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGColorSpaceRef v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  CGColorSpaceRef space;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int64_t v50;
  __int128 v51;
  int64_t var3;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v32 = a4;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("SketchData"), v31, v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("SketchTransformAnimation"), v31, v32);
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("ParentTransformAnimation"), v31, v32);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v30 | v10)
    {
      v28 = (id)v10;
      if (v30)
      {
        v43 = 0;
        v41 = 0u;
        v42 = 0u;
        v40 = 0u;
        v51 = *(_OWORD *)&a5->var0;
        var3 = a5->var3;
        objc_msgSend((id)v30, "transformInfoAtTime:", &v51);
        v11 = 0.0;
        v13 = 0.0;
        v12 = 0.0;
      }
      else
      {
        v12 = 0.0;
        v13 = 1.0;
        v11 = 0.0;
      }
      if (v28 && !kNoPanZoomEnabled)
      {
        v43 = 0;
        v41 = 0u;
        v42 = 0u;
        v40 = 0u;
        v49 = *(_OWORD *)&a5->var0;
        v50 = a5->var3;
        objc_msgSend(v28, "transformInfoAtTime:", &v49);
        v11 = 0.0 + 0.0;
        v12 = 0.0 + 0.0;
        v13 = v13 * 1.0;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v15 = v9;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v46 != v17)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "CGPointValue");
            documentInfo = self->_documentInfo;
            LODWORD(v20) = documentInfo[3];
            LODWORD(v21) = documentInfo[4];
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v13 * ((v11 + v23 + -0.5) * (double)v20), v13 * ((0.5 - (v12 + v22)) * (double)v21));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v24);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v16);
      }

      PCColor::PCColor((PCColor *)((char *)&v41 + 8));
      LOWORD(v40) = 0;
      BYTE2(v40) = 1;
      DWORD1(v40) = 1;
      v25 = *(_QWORD *)self->_documentInfo;
      v38 = v26[2];
      v27 = *v26;
      v37 = v26[1];
      v34 = BYTE8(v40);
      v33 = v40;
      v35 = v41;
      v36 = v27;
      v39 = space;
      if (space)
        PCCFRefTraits<CGColorSpace *>::retain(space);
      OZXSetShapePoints(v25, v14, 0, (unsigned __int8 *)&v33);
      PCCFRef<CGColorSpace *>::~PCCFRef(&v39);
      PCCFRef<CGColorSpace *>::~PCCFRef(&space);

      v10 = (uint64_t)v29;
    }

  }
}

- (void)adjustPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void **documentInfo;
  unint64_t v12;
  unint64_t v13;
  PCString v14;

  v4 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Position"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "CGPointValue");
    v8 = v7;
    v10 = v9;
    PCString::PCString(&v14, "Position");
    documentInfo = (void **)self->_documentInfo;
    LODWORD(v12) = *((_DWORD *)documentInfo + 3);
    LODWORD(v13) = *((_DWORD *)documentInfo + 4);
    OZXSetPublishedPosition(*documentInfo, &v14, v8 * (double)v12, v10 * (double)v13);
    PCString::~PCString(&v14);
  }

}

- (void)adjustCamera:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  int8x16_t v19;
  float64x2_t v20;
  int8x16_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  int8x16_t v27;
  int8x16_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _OWORD v33[2];

  v4 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SelfieEffectUsesCameraFacing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SelfieEffectUsesCameraFacing"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    -[PVMotionEffect setIsFrontFacingCamera:](self, "setIsFrontFacingCamera:", v7);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SelfieRollRadians"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  -[PVMotionEffect setRollRadians:](self, "setRollRadians:");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kPVARSelfieEffectCameraOrientation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v32 = v12;

    objc_msgSend(v10, "objectAtIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v31 = v14;

    objc_msgSend(v10, "objectAtIndex:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v30 = v16;

    objc_msgSend(v10, "objectAtIndex:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v29 = v18;

    *(double *)v19.i64 = v29;
    *(double *)&v19.i64[1] = v32;
    v20.f64[0] = v31;
    v20.f64[1] = v30;
    v21 = (int8x16_t)vnegq_f64(v20);
    v22 = (float64x2_t)vextq_s8(v19, (int8x16_t)vnegq_f64((float64x2_t)v19), 8uLL);
    v23 = (float64x2_t)vdupq_n_s64(0x8000000000000000);
    v24 = (float64x2_t)vdupq_n_s64(0xBFE6A09E667F3BCCLL);
    v25 = vmlaq_f64(vmulq_f64((float64x2_t)v21, v23), v24, (float64x2_t)vextq_s8((int8x16_t)v20, v21, 8uLL));
    v26 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCDuLL);
    v27 = (int8x16_t)vaddq_f64(vmlaq_f64(vmulq_f64(v20, v26), v23, (float64x2_t)vextq_s8(v21, (int8x16_t)v20, 8uLL)), vmlaq_f64(vmulq_f64((float64x2_t)v19, v23), v24, v22));
    v28 = (int8x16_t)vaddq_f64(vmlaq_f64(vmulq_f64((float64x2_t)v19, v26), v23, v22), v25);
    v33[0] = vextq_s8(v28, v27, 8uLL);
    v33[1] = vextq_s8(v27, v28, 8uLL);
    OZXSetCameraQuaternion(*(uint64_t **)self->_documentInfo, MEMORY[0x1E0CA2E68], (double *)v33);
    -[PVMotionEffect setQuaternion::::](self, "setQuaternion::::", v31, v30, v29, v32);
  }

}

- (void)buildDropZoneIdMap_NoLock
{
  uint64_t **v3;
  _QWORD *v4;
  _QWORD *v5[2];

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  v5[0] = 0;
  v5[1] = 0;
  v4 = v5;
  if (!OZXGetDropZoneIDMap(*(_QWORD *)self->_documentInfo, (uint64_t)&v4))
  {
    v3 = (uint64_t **)*((_QWORD *)self->_documentInfo + 21);
    if (v3)
    {
      if (v3 != &v4)
        std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned int,unsigned int>,std::__tree_node<std::__value_type<unsigned int,unsigned int>,void *> *,long>>(v3, v4, v5);
    }
  }
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v4, v5[0]);
}

- (void)setupPublishedParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v11);
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  OZXSetPublishedSettings(*(uint64_t **)self->_documentInfo, v6);
}

- (void)setupTransitionParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  PCString v21;
  _QWORD v22[4];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Direction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Direction"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21.var0 = 0;
    PCString::set(&v21, v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Direction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      OZXSetPublishedPopup(*(void **)self->_documentInfo, &v21, objc_msgSend(v8, "unsignedIntValue"));

    PCString::~PCString(&v21);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v22[0] = CFSTR("Blur");
  v22[1] = CFSTR("Zoom");
  v22[2] = CFSTR("Bar");
  v22[3] = CFSTR("Light");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v14);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v21.var0 = 0;
          PCString::set(&v21, v16);

          OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v21, objc_msgSend(v15, "BOOLValue"));
          PCString::~PCString(&v21);
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

}

- (void)applyInspectableProperties
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PVMotionEffect;
  -[PVEffect applyInspectableProperties](&v3, sel_applyInspectableProperties);
  -[NSLock lock](self->_documentLock, "lock");
  -[NSLock lock](self->super._inspectablePropertiesLock, "lock");
  -[PVMotionEffect applyInspectableProperties_NoLock](self, "applyInspectableProperties_NoLock");
  -[NSLock unlock](self->super._inspectablePropertiesLock, "unlock");
  -[NSLock unlock](self->_documentLock, "unlock");
}

- (void)applyInspectableProperties_NoLock
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *v6;
  CGPoint v7;
  int v8;
  float x;
  float y;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSMutableDictionary *inspectableProperties;
  __int128 v36;
  uint64_t v37;
  PCString v38;

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoaded](self, "assertDocumentStatusIsLoaded");
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVMotionEffect setEffectOutputAspectWithProperties_NoLock:allProperties:](self, "setEffectOutputAspectWithProperties_NoLock:allProperties:", 0, self->super._inspectableProperties);
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("crossDissolveRamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("crossDissolveRamp"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = CGPointFromString(v5);
      LODWORD(v38.var0) = 0;
      v8 = OZXGetDropZone(*(_QWORD *)self->_documentInfo, 0, &v38);
      if (LODWORD(v38.var0))
      {
        if (!v8)
        {
          x = v7.x;
          y = v7.y;
          OZXSetDropZoneOpacityAnimation(*(_QWORD *)self->_documentInfo, v38.var0, x, y);
        }
      }
    }

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("filterSeed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("filterSeed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      OZXSetSeedValue(*(void **)self->_documentInfo, objc_msgSend(v12, "unsignedIntValue"));

  }
  -[PVMotionEffect adjustKenBurnsAnimation:](self, "adjustKenBurnsAnimation:", self->super._inspectableProperties);
  -[PVMotionEffect adjustCutawayBorder:](self, "adjustCutawayBorder:", self->super._inspectableProperties);
  -[PVMotionEffect adjustCutawayFadeAnimation:](self, "adjustCutawayFadeAnimation:", self->super._inspectableProperties);
  -[PVMotionEffect setMaskPoints:](self, "setMaskPoints:", self->super._inspectableProperties);
  -[PVMotionEffect setSketchStrokes:](self, "setSketchStrokes:", self->super._inspectableProperties);
  -[PVMotionEffect adjustPosition:](self, "adjustPosition:", self->super._inspectableProperties);
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("DropShadow"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("DropShadow"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v38.var0 = 0;
    PCString::set(&v38, CFSTR("DropShadow"));
    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v16);
    PCString::~PCString(&v38);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("AllCaps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("AllCaps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    v38.var0 = 0;
    PCString::set(&v38, CFSTR("AllCaps"));
    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v19);
    PCString::~PCString(&v38);
  }
  -[PVMotionEffect setupPublishedParameters:](self, "setupPublishedParameters:", self->super._inspectableProperties);
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("kPVTopLevelOpacityKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("kPVTopLevelOpacityKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    -[PVMotionEffect setTopLevelOpacity:](self, "setTopLevelOpacity:", v23);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("ForceDisableBackgroundShape"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("ForceDisableBackgroundShape"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ForceDisableBackgroundShape"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v38.var0 = 0;
    PCString::set(&v38, v27);

    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v26);
    PCString::~PCString(&v38);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("DisableBackgroundMovieKey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("DisableBackgroundMovieKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    -[PVMotionEffect disableBackgroundMovie:](self, "disableBackgroundMovie:", v30);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("Disable Chroma Key"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v38.var0 = 0;
    PCString::set(&v38, CFSTR("Chroma Key SDR Color"));
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("Disable Chroma Key"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "BOOLValue");

    -[PVMotionEffect disableElementWithPublishedParam:disable:](self, "disableElementWithPublishedParam:disable:", &v38, v33);
    PCString::~PCString(&v38);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("SketchData"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    inspectableProperties = self->super._inspectableProperties;
    v36 = *MEMORY[0x1E0CA2E68];
    v37 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    -[PVMotionEffect updateSketchAnimation:defaultProperties:time:](self, "updateSketchAnimation:defaultProperties:time:", inspectableProperties, 0, &v36);
  }

}

- (void)updateInspectableProperties
{
  unsigned int v3;
  NSMutableDictionary *inspectableProperties;
  __int128 v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffect;
  -[PVEffect updateInspectableProperties](&v7, sel_updateInspectableProperties);
  -[NSLock lock](self->_documentLock, "lock");
  v3 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v3 == 3)
  {
    -[NSLock lock](self->super._inspectablePropertiesLock, "lock");
    inspectableProperties = self->super._inspectableProperties;
    v5 = *MEMORY[0x1E0CA2E18];
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    -[PVMotionEffect updateInspectableProperties_NoLock:componentTime:](self, "updateInspectableProperties_NoLock:componentTime:", inspectableProperties, &v5);
    -[NSLock unlock](self->super._inspectablePropertiesLock, "unlock");
  }
  -[NSLock unlock](self->_documentLock, "unlock");
}

- (void)updateInspectableProperties:(id)a3
{
  id v4;
  unsigned int v5;
  __int128 v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVMotionEffect;
  -[PVEffect updateInspectableProperties:](&v8, sel_updateInspectableProperties_, v4);
  -[NSLock lock](self->_documentLock, "lock");
  v5 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v5 == 3)
  {
    -[NSLock lock](self->super._inspectablePropertiesLock, "lock");
    v6 = *MEMORY[0x1E0CA2E18];
    v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    -[PVMotionEffect updateInspectableProperties_NoLock:componentTime:](self, "updateInspectableProperties_NoLock:componentTime:", v4, &v6);
    -[NSLock unlock](self->super._inspectablePropertiesLock, "unlock");
  }
  -[NSLock unlock](self->_documentLock, "unlock");

}

- (void)updateInspectableProperties_NoLock:(id)a3 componentTime:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v30;
  NSMutableArray *components;
  id v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  __int128 v36;
  int64_t var3;
  PCString v38;

  v6 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsReady](self, "assertDocumentStatusIsReady");
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPVOutputAspectKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPVPlayableAspectRatioKey")),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    -[PVMotionEffect setEffectOutputAspectWithProperties_NoLock:allProperties:](self, "setEffectOutputAspectWithProperties_NoLock:allProperties:", v6, self->super._inspectableProperties);
    goto LABEL_5;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPVPlayableAspectRatioPreservationModeKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    goto LABEL_4;
LABEL_5:
  -[PVMotionEffect adjustKenBurnsAnimation:](self, "adjustKenBurnsAnimation:", v6);
  -[PVMotionEffect adjustCutawayBorder:](self, "adjustCutawayBorder:", v6);
  -[PVMotionEffect adjustCutawayFadeAnimation:](self, "adjustCutawayFadeAnimation:", v6);
  -[PVMotionEffect setMaskPoints:](self, "setMaskPoints:", v6);
  -[PVMotionEffect setSketchStrokes:](self, "setSketchStrokes:", v6);
  -[PVMotionEffect adjustPosition:](self, "adjustPosition:", v6);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DropShadow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DropShadow"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v38.var0 = 0;
    PCString::set(&v38, CFSTR("DropShadow"));
    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v11);
    PCString::~PCString(&v38);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AllCaps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AllCaps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    v38.var0 = 0;
    PCString::set(&v38, CFSTR("AllCaps"));
    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v14);
    PCString::~PCString(&v38);
  }
  -[PVMotionEffect setupPublishedParameters:](self, "setupPublishedParameters:", v6);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPVTopLevelOpacityKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPVTopLevelOpacityKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    -[PVMotionEffect setTopLevelOpacity:](self, "setTopLevelOpacity:", v18);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ForceDisableBackgroundShape"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ForceDisableBackgroundShape"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ForceDisableBackgroundShape"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v38.var0 = 0;
    PCString::set(&v38, v22);

    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v21);
    PCString::~PCString(&v38);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DisableBackgroundMovieKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DisableBackgroundMovieKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    -[PVMotionEffect disableBackgroundMovie:](self, "disableBackgroundMovie:", v25);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Disable Chroma Key"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v38.var0 = 0;
    PCString::set(&v38, CFSTR("Chroma Key SDR Color"));
    -[NSMutableDictionary objectForKeyedSubscript:](self->super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("Disable Chroma Key"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    -[PVMotionEffect disableElementWithPublishedParam:disable:](self, "disableElementWithPublishedParam:disable:", &v38, v28);
    PCString::~PCString(&v38);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SketchData"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    if ((a4->var2 & 1) != 0)
      v30 = a4;
    else
      v30 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E0CA2E68];
    v36 = *(_OWORD *)&v30->var0;
    var3 = v30->var3;
    -[PVMotionEffect updateSketchAnimation:defaultProperties:time:](self, "updateSketchAnimation:defaultProperties:time:", v6, self->super._inspectableProperties, &v36);
  }
  components = self->super._components;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __67__PVMotionEffect_updateInspectableProperties_NoLock_componentTime___block_invoke;
  v34[3] = &unk_1E64D6C48;
  v34[4] = self;
  v32 = v6;
  v35 = v32;
  -[NSMutableArray enumerateObjectsUsingBlock:](components, "enumerateObjectsUsingBlock:", v34);

}

uint64_t __67__PVMotionEffect_updateInspectableProperties_NoLock_componentTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "effect:updateProperties:allProperties:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)setIsFrontFacingCamera:(BOOL)a3
{
  unsigned int v3;
  BOOL v5;
  PCString v6;
  uint64_t v7;

  v3 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  v7 = 0;
  PCString::PCString(&v6, "PAEEquirectProjectFilter::Filter Name");
  if (OZXFindFilter(*(_QWORD *)self->_documentInfo, &v6, &v7))
    v5 = 1;
  else
    v5 = v7 == 0;
  if (!v5)
    OZXEquirectProjectFilterSetFrontFacing(*(void **)self->_documentInfo, (uint64_t)&v7, v3);
  PCString::~PCString(&v6);
}

- (void)setQuaternion:(double)a3 :(double)a4 :(double)a5 :(double)a6
{
  BOOL v11;
  PCString v12;
  uint64_t v13;

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  v13 = 0;
  PCString::PCString(&v12, "PAEEquirectProjectFilter::Filter Name");
  if (OZXFindFilter(*(_QWORD *)self->_documentInfo, &v12, &v13))
    v11 = 1;
  else
    v11 = v13 == 0;
  if (!v11)
    OZXEquirectProjectFilterSetQuaternion(*(void **)self->_documentInfo, a3, a4, a5, a6);
  PCString::~PCString(&v12);
}

- (void)setRollRadians:(double)a3
{
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  OZXSetSelfieRollRadians(*(void **)self->_documentInfo, a3);
}

- (CGSize)documentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  __n128 (*v10)(__n128 *, __n128 *);
  uint64_t (*v11)();
  void *v12;
  CGSize result;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x4012000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = &unk_1B3948866;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__PVMotionEffect_documentSize__block_invoke;
  v6[3] = &unk_1E64D6C70;
  v6[4] = &v7;
  -[PVMotionEffect runEnsuringDocumentReadyAndLockingDocument:](self, "runEnsuringDocumentReadyAndLockingDocument:", v6);
  v2 = v8[6];
  v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

__n128 __30__PVMotionEffect_documentSize__block_invoke(uint64_t a1, __n128 *a2)
{
  __n128 result;

  result = a2[11];
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (CGSize)outputSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  __n128 (*v10)(__n128 *, __n128 *);
  uint64_t (*v11)();
  void *v12;
  CGSize result;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x4012000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = &unk_1B3948866;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__PVMotionEffect_outputSize__block_invoke;
  v6[3] = &unk_1E64D6C70;
  v6[4] = &v7;
  -[PVMotionEffect runEnsuringDocumentReadyAndLockingDocument:](self, "runEnsuringDocumentReadyAndLockingDocument:", v6);
  v2 = v8[6];
  v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

float64x2_t __28__PVMotionEffect_outputSize__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64x2_t v3;
  float64x2_t result;

  v2 = *(_QWORD *)(a2 + 12);
  v3.i64[0] = v2;
  v3.i64[1] = HIDWORD(v2);
  result = vcvtq_f64_u64(v3);
  *(float64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (CGRect)outputROI
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  __n128 (*v14)(uint64_t, uint64_t);
  uint64_t (*v15)();
  void *v16;
  CGRect result;

  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x5012000000;
  v14 = __Block_byref_object_copy__1450;
  v15 = __Block_byref_object_dispose__1451;
  v16 = &unk_1B3948866;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__PVMotionEffect_outputROI__block_invoke;
  v10[3] = &unk_1E64D6360;
  v10[4] = self;
  v10[5] = &v11;
  -[PVMotionEffect runEnsuringDocumentReadyAndLockingDocument:](self, "runEnsuringDocumentReadyAndLockingDocument:", v10);
  v2 = v12[6];
  v3 = v12[7];
  v4 = v12[8];
  v5 = v12[9];
  _Block_object_dispose(&v11, 8);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

uint64_t __27__PVMotionEffect_outputROI__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(*(id *)(a1 + 32), "outputROI_NoLock:scale:", a2, 1.0);
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v4[6] = v5;
  v4[7] = v6;
  v4[8] = v7;
  v4[9] = v8;
  return result;
}

- (CGRect)outputROI_NoLock:(const void *)a3 scale:(double)a4
{
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  LODWORD(v7) = *((_DWORD *)a3 + 3);
  LODWORD(v8) = *((_DWORD *)a3 + 4);
  v9 = (double)v7;
  v10 = (double)v8;
  if (self->_hasPlayableAspectOverride)
  {
    v11 = (v9 - self->_playableAspectRatio * v10) * 0.5 * a4;
    v12 = (v10 - v10) * 0.5 * a4;
    v9 = self->_playableAspectRatio * v10;
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
  }
  v13 = v10 * a4;
  v14 = v9 * a4;
  result.size.height = v13;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setEffectOutputAspectWithProperties_NoLock:(id)a3 allProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVOutputAspectKey"), v13, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVPlayableAspectRatioKey"), v13, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVPlayableAspectRatioPreservationModeKey"), v13, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v11 = v10;
    objc_msgSend(v8, "doubleValue");
    -[PVMotionEffect setEffectOutputAspect_NoLock:playableAspect:playableContentMode:](self, "setEffectOutputAspect_NoLock:playableAspect:playableContentMode:", objc_msgSend(v9, "integerValue"), v11, v12);

  }
}

- (void)setEffectOutputAspect_NoLock:(double)a3 playableAspect:(double)a4 playableContentMode:(int)a5
{
  double *p_effectOutputAspect;
  BOOL v12;
  void *v13;
  double *p_playableAspectRatio;
  double v15;
  double *documentInfo;
  _QWORD *v17;
  _BOOL4 v18;
  double *v19;
  unsigned int v20;
  double v21;
  double *v22;
  unint64_t v23;
  unsigned int v24;
  id v25;
  id v26;
  id v27;

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  p_effectOutputAspect = &self->_effectOutputAspect;
  self->_effectOutputAspect = a3;
  if (a3 <= -0.0000001 || a3 >= 0.0000001)
  {
    self->_playableAspectRatio = a4;
    self->_playableContentMode = a5;
    v12 = (a4 >= 0.0000001 || a4 <= -0.0000001) && a5 != 0 && vabdd_f64(a4, *p_effectOutputAspect) >= 0.0001;
    self->_hasPlayableAspectOverride = v12;
    -[NSMutableDictionary objectForKey:](self->super._inspectableProperties, "objectForKey:", CFSTR("kPVEffectPVARMetadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_hasPlayableAspectOverride)
      p_playableAspectRatio = &self->_playableAspectRatio;
    else
      p_playableAspectRatio = &self->_effectOutputAspect;
    v15 = *p_playableAspectRatio;
    documentInfo = (double *)self->_documentInfo;
    v17 = *(_QWORD **)documentInfo;
    if (v13)
    {
      OZXSetTargetDisplayAspectRatioWithNativeSize(v17, v15, documentInfo[22], documentInfo[23]);
      v18 = -[PVMotionEffect isLandscape:](self, "isLandscape:", self->super._inspectableProperties);
      v19 = (double *)self->_documentInfo;
      if (v18)
      {
        v20 = v19[22];
        v21 = (double)v20 / *p_effectOutputAspect / v19[7] + 0.5 + 0.0000001;
        *((_DWORD *)v19 + 3) = v20;
        *((_DWORD *)v19 + 4) = vcvtmd_s64_f64(v21);
      }
      else
      {
        v24 = v19[23];
        *((_DWORD *)v19 + 3) = vcvtmd_s64_f64(*p_effectOutputAspect * (double)v24 / v19[7] + 0.5 + 0.0000001);
        *((_DWORD *)v19 + 4) = v24;
      }
    }
    else
    {
      OZXSetTargetDisplayAspectRatio(v17, v15);
      v22 = (double *)self->_documentInfo;
      LODWORD(v23) = *((_DWORD *)v22 + 4);
      *((_DWORD *)v22 + 3) = vcvtmd_s64_f64(*p_effectOutputAspect * (double)v23 / v22[7] + 0.5 + 0.0000001);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffect didSetCacheInvalidatingParameter_NoLock:forKey:](self, "didSetCacheInvalidatingParameter_NoLock:forKey:");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_playableAspectRatio);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffect didSetCacheInvalidatingParameter_NoLock:forKey:](self, "didSetCacheInvalidatingParameter_NoLock:forKey:");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_playableContentMode);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffect didSetCacheInvalidatingParameter_NoLock:forKey:](self, "didSetCacheInvalidatingParameter_NoLock:forKey:");

  }
}

- (BOOL)hasPlayableAspectOverride_NoLock
{
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  return self->_hasPlayableAspectOverride;
}

- (double)playableAspectRatio_NoLock
{
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  return self->_playableAspectRatio;
}

- (int)playableContentMode_NoLock
{
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  return self->_playableContentMode;
}

- (void)setNodeIDToCache:(unsigned int)a3
{
  unsigned int groupIDToCache;
  unsigned int previousGroupIDToCache;

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  if (a3)
  {
    groupIDToCache = self->_groupIDToCache;
    if (groupIDToCache != a3)
    {
      self->_previousGroupIDToCache = groupIDToCache;
      self->_groupIDToCache = a3;
      self->_cachedRenderDirty = 1;
      previousGroupIDToCache = self->_previousGroupIDToCache;
      if (previousGroupIDToCache)
      {
        OZXSetUseRenderCache(*(void **)self->_documentInfo, previousGroupIDToCache, 0);
        OZXClearCachedRender(*(void **)self->_documentInfo, self->_previousGroupIDToCache);
      }
    }
  }
}

- (int)stillImageInverseToneMapOperator:(id)a3
{
  id v4;
  NSNumber *stillImageInverseToneMapOperator;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *v10;
  NSNumber *v11;
  int v12;

  v4 = a3;
  stillImageInverseToneMapOperator = self->_stillImageInverseToneMapOperator;
  if (!stillImageInverseToneMapOperator)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    -[PVEffect contentRegistryProperties](self, "contentRegistryProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("stillImageInverseToneMapOperator"), v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v8, "intValue");
      if (v9 < 3)
      {
        v10 = (NSNumber *)qword_1E64D6E08[(int)v9];
LABEL_7:
        v11 = self->_stillImageInverseToneMapOperator;
        self->_stillImageInverseToneMapOperator = v10;

        stillImageInverseToneMapOperator = self->_stillImageInverseToneMapOperator;
        goto LABEL_8;
      }
      NSLog(CFSTR("Unsupported still image tone mapping operator: %d"), v9);
    }
    v10 = (NSNumber *)&unk_1E6649030;
    goto LABEL_7;
  }
LABEL_8:
  v12 = -[NSNumber intValue](stillImageInverseToneMapOperator, "intValue");

  return v12;
}

- (int)getOSFAOption:(id)a3
{
  void *v4;
  NSMutableDictionary *inspectableProperties;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99D80];
  inspectableProperties = self->super._inspectableProperties;
  -[PVEffect contentRegistryProperties](self, "contentRegistryProperties", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("OSFAToneMappingOption"), inspectableProperties, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "intValue");
    v9 = v8;
    if (v8 >= 3)
    {
      NSLog(CFSTR("Unexpected value for '%@' key: %d; defaulting to 1 (PVEffectHDR_OSFA_ToneMapping_Simple)"),
        CFSTR("OSFAToneMappingOption"),
        v8);
      v9 = 1;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = self->super._inspectableProperties;
    -[PVEffect contentRegistryProperties](self, "contentRegistryProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("wantsOSFAToneMapping"), v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v9 = objc_msgSend(v7, "BOOLValue");
    else
      v9 = 0;
  }

  return v9;
}

- (id)debugDisplayName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffect displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffect effectID](self, "effectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVMotionEffect projectPath](self, "projectPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)forceRenderAtPosterFrame
{
  return -[PVEffect BOOLForKey:](self, "BOOLForKey:", CFSTR("RenderAtPosterTime"));
}

- (void)setForceRenderAtPosterFrame:(BOOL)a3
{
  -[PVEffect setBool:forKey:](self, "setBool:forKey:", a3, CFSTR("RenderAtPosterTime"));
}

- (BOOL)isBuildInAnimationEnabled
{
  return -[PVEffect BOOLForKey:](self, "BOOLForKey:", CFSTR("TitleBuildIn"));
}

- (void)setBuildInAnimationEnabled:(BOOL)a3
{
  -[PVEffect setBool:forKey:](self, "setBool:forKey:", a3, CFSTR("TitleBuildIn"));
}

- (BOOL)isBuildOutAnimationEnabled
{
  return -[PVEffect BOOLForKey:](self, "BOOLForKey:", CFSTR("TitleBuildOut"));
}

- (void)setBuildOutAnimationEnabled:(BOOL)a3
{
  -[PVEffect setBool:forKey:](self, "setBool:forKey:", a3, CFSTR("TitleBuildOut"));
}

- (BOOL)isLoopedRangeRenderCacheable
{
  return -[PVEffect BOOLForKey:](self, "BOOLForKey:", CFSTR("kPVEnableLoopedRangeRenderCaching"));
}

- (void)setLoopedRangeRenderIsCacheable:(BOOL)a3
{
  -[PVEffect setBool:forKey:](self, "setBool:forKey:", a3, CFSTR("kPVEnableLoopedRangeRenderCaching"));
}

- (id)ephemeralProperties
{
  if (-[PVMotionEffect ephemeralProperties]::onceToken != -1)
    dispatch_once(&-[PVMotionEffect ephemeralProperties]::onceToken, &__block_literal_global_1464);
  return (id)-[PVMotionEffect ephemeralProperties]::s_ephemeralProperties;
}

void __37__PVMotionEffect_ephemeralProperties__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[18];

  v2[17] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("kPVOutputAspectKey");
  v2[1] = CFSTR("TitleBuildIn");
  v2[2] = CFSTR("ForceDisableLoop");
  v2[3] = CFSTR("RenderAtPosterTime");
  v2[4] = CFSTR("ImageSequencePathKey");
  v2[5] = CFSTR("kPVEnablePosterFrameCaching");
  v2[6] = CFSTR("kPVEnableLoopedRangeRenderCaching");
  v2[7] = CFSTR("kPVTextRenderingDisabled");
  v2[8] = CFSTR("kPVTopLevelAdditionalScaleKey");
  v2[9] = CFSTR("kPVTransformAnimationKey");
  v2[10] = CFSTR("kPVTopLevelOpacityKey");
  v2[11] = CFSTR("DisableAnimatedLayer");
  v2[12] = CFSTR("DisablePosterLayer");
  v2[13] = CFSTR("RenderStartOffset");
  v2[14] = CFSTR("DisableBackgroundMovieKey");
  v2[15] = CFSTR("RenderAtPosterTime");
  v2[16] = CFSTR("kPVEffectPVARMetadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[PVMotionEffect ephemeralProperties]::s_ephemeralProperties;
  -[PVMotionEffect ephemeralProperties]::s_ephemeralProperties = v0;

}

- (BOOL)isEphemeralProperty:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[PVMotionEffect ephemeralProperties](self, "ephemeralProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "containsObject:", v4) & 1) != 0
    || -[PVMotionEffect isTemporalProperty:](self, "isTemporalProperty:", v4);

  return v6;
}

- (id)temporalProperties
{
  if (-[PVMotionEffect temporalProperties]::onceToken != -1)
    dispatch_once(&-[PVMotionEffect temporalProperties]::onceToken, &__block_literal_global_1465);
  return (id)-[PVMotionEffect temporalProperties]::s_temporalProperties;
}

void __36__PVMotionEffect_temporalProperties__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PVARClearARAnchors");
  v2[1] = CFSTR("PVARUpdateARAnchors");
  v2[2] = CFSTR("PVRestartEffectTime");
  v2[3] = CFSTR("PVResetScene");
  v2[4] = CFSTR("PVARBodyGestures");
  v2[5] = CFSTR("PVARFaceGestures");
  v2[6] = CFSTR("PVARObjectToAttachToHipID");
  v2[7] = CFSTR("PVDisableObjects");
  v2[8] = CFSTR("kPVEffectPVARMetadata");
  v2[9] = CFSTR("kPVEffectEnableMeshShader");
  v2[10] = CFSTR("kPVEffectEnableMeshOcclusion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[PVMotionEffect temporalProperties]::s_temporalProperties;
  -[PVMotionEffect temporalProperties]::s_temporalProperties = v0;

}

- (BOOL)isTemporalProperty:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("PVSetEffectAnchor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[PVMotionEffect temporalProperties](self, "temporalProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (int)origin
{
  return 2;
}

- (BOOL)didSetCacheInvalidatingParameter_NoLock:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  if (-[PVMotionEffect parameterInvalidatesCache_NoLock:](self, "parameterInvalidatesCache_NoLock:", v7)
    && !*((_DWORD *)self->_documentInfo + 41)
    && -[PVMotionEffect didCacheInvalidatingParameterChange_NoLock:key:](self, "didCacheInvalidatingParameterChange_NoLock:key:", v6, v7))
  {
    v8 = 1;
    self->_cachedRenderDirty = 1;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parametersThatInvalidateCache, "setObject:forKeyedSubscript:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)didCacheInvalidatingParameterChange_NoLock:(id)a3 key:(id)a4
{
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  BOOL v11;
  NSMutableArray *motionComponents;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = (unint64_t)a3;
  v7 = a4;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_parametersThatInvalidateCache, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 | v8)
  {
    v10 = 1;
    if (v6 && v8)
    {
      if (objc_msgSend(CFSTR("kPVOutputAspectKey"), "isEqualToString:", v7)
        || objc_msgSend(CFSTR("kPVPlayableAspectRatioKey"), "isEqualToString:", v7))
      {
        v11 = PVNumbersAreEqualAsDoubles(v9, (void *)v6);
      }
      else if (objc_msgSend(CFSTR("kPVPlayableAspectRatioPreservationModeKey"), "isEqualToString:", v7))
      {
        v11 = PVNumbersAreEqualAsIntegers(v9, (void *)v6);
      }
      else
      {
        if (!objc_msgSend(CFSTR("kPVCachedTextureOutputSize"), "isEqualToString:", v7))
        {
          v19 = 0;
          v20 = &v19;
          v21 = 0x2020000000;
          motionComponents = self->_motionComponents;
          v22 = 0;
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __65__PVMotionEffect_didCacheInvalidatingParameterChange_NoLock_key___block_invoke;
          v14[3] = &unk_1E64D6CD8;
          v14[4] = self;
          v15 = v7;
          v16 = v9;
          v17 = (id)v6;
          v18 = &v19;
          -[NSMutableArray enumerateObjectsUsingBlock:](motionComponents, "enumerateObjectsUsingBlock:", v14);
          v10 = *((_BYTE *)v20 + 24) != 0;

          _Block_object_dispose(&v19, 8);
          goto LABEL_13;
        }
        v11 = PVValuesAreEqualAsCGSizes(v9, (void *)v6);
      }
      v10 = !v11;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

uint64_t __65__PVMotionEffect_didCacheInvalidatingParameterChange_NoLock_key___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "motionEffect:shouldInvalidateCachedRenderForProperty:oldValue:newValue:", a1[4], a1[5], a1[6], a1[7]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)parameterInvalidatesCache_NoLock:(id)a3
{
  id v4;

  v4 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  LOBYTE(self) = -[NSMutableSet containsObject:](self->_parameterKeysThatInvalidateCache, "containsObject:", v4);

  return (char)self;
}

- (BOOL)isRenderCachingDisabled_NoLock:(id *)a3
{
  void *v5;
  char v6;
  PVMotionEffectTimelineComponent *timelineComponent;
  BOOL v8;
  NSMutableArray *motionComponents;
  BOOL v10;
  _QWORD v12[6];
  __int128 v13;
  int64_t var3;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsReady](self, "assertDocumentStatusIsReady");
  -[PVEffect assertInspectablePropertiesAreLocked](self, "assertInspectablePropertiesAreLocked");
  if (-[PVEffect isInInteractiveMode](self, "isInInteractiveMode"))
    return 1;
  -[PVEffect effectType](self, "effectType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("effect.video.title"));

  if ((v6 & 1) == 0)
    return 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  timelineComponent = self->_timelineComponent;
  v19 = 0;
  v8 = -[PVMotionEffectTimelineComponent isForceRenderAtPosterFrameEnabled:](timelineComponent, "isForceRenderAtPosterFrameEnabled:", self->super._inspectableProperties);
  motionComponents = self->_motionComponents;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__PVMotionEffect_isRenderCachingDisabled_NoLock___block_invoke;
  v12[3] = &unk_1E64D6D00;
  v13 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v15 = v8;
  v12[4] = self;
  v12[5] = &v16;
  -[NSMutableArray enumerateObjectsUsingBlock:](motionComponents, "enumerateObjectsUsingBlock:", v12);
  v10 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __49__PVMotionEffect_isRenderCachingDisabled_NoLock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  __int128 v9;
  uint64_t v10;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 80);
  v9 = *(_OWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  result = objc_msgSend(a2, "motionEffect:propertiesDisableCache:time:forcePosterFrame:", v6, v7, &v9, *(unsigned __int8 *)(a1 + 72));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (double)topLevelOpacity
{
  double v2;
  _QWORD v4[7];
  _QWORD v5[3];
  int v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0x3FF0000000000000;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 11;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__PVMotionEffect_topLevelOpacity__block_invoke;
  v4[3] = &unk_1E64D4B30;
  v4[4] = self;
  v4[5] = v5;
  v4[6] = &v7;
  -[PVMotionEffect runEnsuringDocumentReadyAndLockingDocument:](self, "runEnsuringDocumentReadyAndLockingDocument:", v4);
  v2 = v8[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);
  return v2;
}

uint64_t __33__PVMotionEffect_topLevelOpacity__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  CMTime v3;

  if (!*(_DWORD *)(a2 + 164))
  {
    v2 = result;
    v3 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    result = OZXGetObjectOpacity(**(void ***)(*(_QWORD *)(result + 32) + 144), &v3, *(_DWORD *)(a2 + 160), (double *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setTopLevelOpacity:(double)a3
{
  void *documentInfo;
  CMTime v6;

  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  documentInfo = self->_documentInfo;
  if (!*((_DWORD *)documentInfo + 41))
  {
    v6 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    OZXSetObjectOpacity(*(void **)documentInfo, &v6, *((_DWORD *)documentInfo + 40), a3);
  }
}

- (BOOL)isVisibleAtTime_NoLock:(id *)a3 timedProperties:(id)a4 defaultProperties:(id)a5
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  double v12;

  v6 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVHiddenKey"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "objectForKey:inDictionary:orInDefaultDictionary:", CFSTR("kPVTopLevelOpacityKey"), v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v9 = 1;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      if (v12 > -0.0000001 && v12 < 0.0000001)
        v9 = 0;
    }

  }
  return v9;
}

- (id)publishedParams_NoLock:(const void *)a3
{
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  return OZXGetPublishedSettings(*(_QWORD **)a3);
}

- (id)publishedParam_NoLock:(const void *)a3 forKey:(id)a4 atTime:(id *)a5 includeHidden:(BOOL)a6
{
  id v10;
  void *v11;
  __CFString *v12;
  _QWORD *v13;
  void *v14;
  CMTime v16;
  PCString v17;

  v10 = a4;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17.var0 = 0;
  PCString::set(&v17, v12);

  v13 = *(_QWORD **)a3;
  v16 = *(CMTime *)a5;
  OZXGetPublishedSetting(v13, &v17, &v16, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PCString::~PCString(&v17);

  return v14;
}

- (id)effectParameters
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffect;
  -[PVEffect effectParameters](&v10, sel_effectParameters);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PVMotionEffect_effectParameters__block_invoke;
  v8[3] = &unk_1E64D5D28;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[PVMotionEffect runEnsuringDocumentReadyAndLockingDocument:](self, "runEnsuringDocumentReadyAndLockingDocument:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __34__PVMotionEffect_effectParameters__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "publishedParams_NoLock:", a2);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PVEffectParam_ValueKey"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PVEffectParam_NameKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "publishedParameterNameToMotionEffectPropertyKeyMap");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = v10;

          v8 = v11;
        }
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

- (void)setEffectParameters:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PVMotionEffect;
  -[PVEffect setEffectParameters:](&v5, sel_setEffectParameters_, v4);
  -[PVEffect addEntriesToInspectableProperties:](self, "addEntriesToInspectableProperties:", v4);

}

- (void)disableBackgroundMovie:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;

  v3 = a3;
  -[PVMotionEffect assertDocumentIsLocked](self, "assertDocumentIsLocked");
  -[PVMotionEffect assertDocumentStatusIsLoadedOrReady](self, "assertDocumentStatusIsLoadedOrReady");
  v5 = 0;
  if (!OZXGetDropZone(*(_QWORD *)self->_documentInfo, 0, &v5))
    OZXDisableRenderingObject(*(uint64_t **)self->_documentInfo, v5, v3);
}

- (void)disableElementWithPublishedParam:(PCString *)a3 disable:(BOOL)a4
{
  OZXDisableElementWithPublishedParam(*(void **)self->_documentInfo, a3, a4);
}

- (BOOL)supportsParam:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__PVMotionEffect_supportsParam___block_invoke;
  v7[3] = &unk_1E64D4B08;
  v7[4] = self;
  v8 = v4;
  v9 = &v10;
  v5 = v4;
  -[PVMotionEffect runEnsuringDocumentReadyAndLockingDocument:](self, "runEnsuringDocumentReadyAndLockingDocument:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __32__PVMotionEffect_supportsParam___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "publishedParams_NoLock:", a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __32__PVMotionEffect_supportsParam___block_invoke_2;
    v10[3] = &unk_1E64D6D28;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v11 = v5;
    v12 = v6;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

  }
}

void __32__PVMotionEffect_supportsParam___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PVEffectParam_NameKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)motionComponentClasses
{
  if (+[PVMotionEffect motionComponentClasses]::onceToken != -1)
    dispatch_once(&+[PVMotionEffect motionComponentClasses]::onceToken, &__block_literal_global_1481);
  return (id)+[PVMotionEffect motionComponentClasses]::s_motionComponentClasses;
}

void __40__PVMotionEffect_motionComponentClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)+[PVMotionEffect motionComponentClasses]::s_motionComponentClasses;
  +[PVMotionEffect motionComponentClasses]::s_motionComponentClasses = v6;

}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PVMotionEffect_motionEffectPropertyKeyToPublishedParameterNameMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::onceToken != -1)
    dispatch_once(&+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::onceToken, block);
  return (id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap;
}

void __68__PVMotionEffect_motionEffectPropertyKeyToPublishedParameterNameMap__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 31);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap;
  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap = v2;

  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("Direction"), CFSTR("Direction"));
  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("Blur"), CFSTR("Blur"));
  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("Zoom"), CFSTR("Zoom"));
  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("Bar"), CFSTR("Bar"));
  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("Light"), CFSTR("Light"));
  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("SelfieEffectVisibility"), CFSTR("kPVARSelfieEffectVisibility"));
  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("SelfieBackgroundVisibility"), CFSTR("kPVARSelfieEffectBackgroundVisibility"));
  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("SelfieZoom"), CFSTR("kPVARSelfieEffectZoomLevel"));
  objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "setObject:forKeyedSubscript:", CFSTR("SelfieEffectDistance"), CFSTR("kPVARSelfieEffectDistance"));
  objc_msgSend(*(id *)(a1 + 32), "motionComponentClasses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_1502);

}

void __68__PVMotionEffect_motionEffectPropertyKeyToPublishedParameterNameMap__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "motionEffectPropertyKeyToPublishedParameterNameMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend((id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap, "addEntriesFromDictionary:", v2);

}

+ (id)publishedParameterNameToMotionEffectPropertyKeyMap
{
  if (+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::onceToken != -1)
    dispatch_once(&+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::onceToken, &__block_literal_global_1504);
  return (id)+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::s_publishedParameterNameToMotionEffectPropertyKeyMap;
}

void __68__PVMotionEffect_publishedParameterNameToMotionEffectPropertyKeyMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::s_publishedParameterNameToMotionEffectPropertyKeyMap;
  +[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::s_publishedParameterNameToMotionEffectPropertyKeyMap = v0;

  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1506);
}

uint64_t __68__PVMotionEffect_publishedParameterNameToMotionEffectPropertyKeyMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::s_publishedParameterNameToMotionEffectPropertyKeyMap, "setObject:forKeyedSubscript:", a2, a3);
}

- (BOOL)hasBuiltInEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[PVEffect effectType](self, "effectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVEffect contentProperties](self, "contentProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("FFEffectProperty_Category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("effect.video.filter"))
    && objc_msgSend(v5, "isEqualToString:", CFSTR("Selfie")))
  {
    -[PVEffect effectID](self, "effectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("7FFE36D8-396F-4011-90D9-99B6414D4DB1")) & 1) != 0)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      -[PVEffect effectID](self, "effectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqualToString:", CFSTR("87530270-50A4-4483-82B5-D520897FF2CE")) ^ 1;

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isLandscape:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PVVideoOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PVARApplyVerticalRotation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v4 = &unk_1E6649060;
    if (v5 && !objc_msgSend(v5, "BOOLValue"))
      v4 = &unk_1E6649078;

  }
  v7 = objc_msgSend(v4, "unsignedIntValue") - 3 < 2;

  return v7;
}

- (void)applyARData:(id)a3 time:(id *)a4 renderParams:(_OZXRenderParams *)a5
{
  id v7;
  NSNumber *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  ARFrame *v22;
  void *documentInfo;
  unsigned int v24;
  unsigned int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float32x2_t v30;
  float32_t v31;
  double v32;
  double v33;
  double v34;
  float32x2_t v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  simd_float4 v39;
  uint64_t v40;
  double v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  __float2 v46;
  uint64_t v47;
  float32x2_t v48;
  float32x2_t v49;
  float32x4_t v50;
  float v51;
  float v52;
  float v53;
  float v54;
  __int128 v55;
  __int128 v56;
  float v57;
  __int128 v58;
  void *v59;
  float32x4_t v60;
  float32x4_t v61;
  id v62;
  float32x4_t v63;
  float32x4_t v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSNumber *v72;
  void *v73;
  simd_float4x4 v74;
  simd_float4x4 v75;
  __int128 v76;
  int64_t var3;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  id v85;
  int v86;
  uint64_t v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _OWORD v93[4];
  simd_float4x4 v94;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVMatteInputMode"));
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  OZXSetMatteInputMode(*(void **)self->_documentInfo, v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kPVEffectPVARMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v72 = v8;
    objc_msgSend(v9, "depthData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVVideoOrientation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVARApplyVerticalRotation"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");
      if (v13)
        v15 = v14;
      else
        v15 = 1;
      if (v15)
        v12 = &unk_1E6649060;
      else
        v12 = &unk_1E6649078;

    }
    v16 = objc_msgSend(v12, "unsignedIntValue");
    if ((v16 - 2) >= 3)
      v17 = 0;
    else
      v17 = v16 - 1;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVARFaceGestures"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v12;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVARBodyGestures"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVAR3DSkeleton"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kPVARFrameSetMetadataPlaneAnchorsKey"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVEffectSceneNode"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WorldOrigin"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "SCNMatrix4Value");
    }
    else
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
    }

    v76 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v62 = v11;
    v78 = v62;
    v79 = v89;
    v80 = v90;
    v81 = v91;
    v82 = v92;
    v66 = v71;
    v83 = v66;
    v65 = v70;
    v84 = v65;
    v20 = v68;
    v85 = v20;
    v86 = v17;
    v87 = objc_msgSend(v73, "unsignedLongValue");
    v21 = v67;
    v88 = v21;
    objc_msgSend(v10, "arFrame");
    v22 = (ARFrame *)objc_claimAutoreleasedReturnValue();
    documentInfo = self->_documentInfo;
    if (v22)
    {
      OZXApplyARFrame(*(uint64_t **)documentInfo, v22, 10.0, 45000.0, (const OZARFrameInfo *)&v76);
    }
    else
    {
      v24 = *((_DWORD *)documentInfo + 3);
      v25 = *((_DWORD *)documentInfo + 4);
      objc_msgSend(v10, "cameraImageResolution");
      v27 = v26;
      v29 = v28;
      objc_msgSend(v10, "cameraIntrinsics");
      v30.f32[0] = v27;
      v31 = v29;
      v30.f32[1] = v31;
      *(float *)&v32 = (float)v24;
      *((float *)&v32 + 1) = (float)v25;
      pv_simd_matrix_make_perspective(3, v16, 1, 1, v33, v34, v35, v30, v32);
      v75.columns[0] = v36;
      v75.columns[1] = v37;
      v75.columns[2] = v38;
      v75.columns[3] = v39;
      if (v16 > 4)
        v40 = 0;
      else
        v40 = qword_1B304F6C0[v16];
      v41 = PVCardinalAnglesDouble[v40];
      objc_msgSend(v10, "cameraTransform");
      v63 = v43;
      v64 = v42;
      v60 = v45;
      v61 = v44;
      v42.f32[0] = v41;
      v46 = __sincosf_stret(v42.f32[0]);
      v47 = 0;
      v48 = vrsqrte_f32((float32x2_t)1065353216);
      v49 = vmul_f32(v48, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v48, v48)));
      v50 = vmulq_n_f32((float32x4_t)xmmword_1B304F250, vmul_f32(v49, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v49, v49))).f32[0]);
      v51 = (float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[0], *(float32x2_t *)v50.f32, 1);
      v52 = vmuls_lane_f32(v46.__sinval, v50, 2);
      v53 = (float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[0], v50, 2);
      v54 = vmuls_lane_f32(v46.__sinval, *(float32x2_t *)v50.f32, 1);
      HIDWORD(v55) = 0;
      HIDWORD(v56) = 0;
      *(float *)&v56 = v46.__cosval + (float)((float)(1.0 - v46.__cosval) * vmulq_f32(v50, v50).f32[0]);
      *((float *)&v56 + 1) = v52 + v51;
      *((float *)&v56 + 2) = v53 - v54;
      v57 = (float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[1], v50, 2);
      HIDWORD(v58) = 0;
      *(float *)&v58 = v51 - v52;
      *((float *)&v58 + 1) = v46.__cosval
                           + (float)((float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[1], *(float32x2_t *)v50.f32, 1));
      *((float *)&v58 + 2) = (float)(v46.__sinval * v50.f32[0]) + v57;
      *(float *)&v55 = v54 + v53;
      *((float *)&v55 + 1) = v57 - (float)(v46.__sinval * v50.f32[0]);
      *((float *)&v55 + 2) = v46.__cosval + (float)((float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[2], v50, 2));
      v93[0] = v56;
      v93[1] = v58;
      v93[2] = v55;
      v93[3] = xmmword_1B304EFF0;
      do
      {
        v94.columns[v47] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(v93[v47])), v63, *(float32x2_t *)&v93[v47], 1), v61, (float32x4_t)v93[v47], 2), v60, (float32x4_t)v93[v47], 3);
        ++v47;
      }
      while (v47 != 4);
      v74 = v94;
      OZXApplyARFrameInfo(*(uint64_t **)self->_documentInfo, &v75, &v74, 10.0, 45000.0, (const OZARFrameInfo *)&v76);
    }

    v8 = v72;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVARClearARAnchors"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    OZXClearARAnchors(*(_QWORD *)self->_documentInfo, v59);

}

- (PVMotionEffectTransformComponent)transformComponent
{
  return self->_transformComponent;
}

- (PVMotionEffectTextComponent)textComponent
{
  return self->_textComponent;
}

- (PVMotionEffectTranscriptionComponent)transcriptionComponent
{
  return self->_transcriptionComponent;
}

- (PVMotionEffectHitAreaComponent)hitAreaComponent
{
  return self->_hitAreaComponent;
}

- (PVMotionEffectTimelineComponent)timelineComponent
{
  return self->_timelineComponent;
}

- (PVMotionEffectSceneManagerComponent)sceneManagerComponent
{
  return self->_sceneManagerComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManagerComponent, 0);
  objc_storeStrong((id *)&self->_timelineComponent, 0);
  objc_storeStrong((id *)&self->_hitAreaComponent, 0);
  objc_storeStrong((id *)&self->_transcriptionComponent, 0);
  objc_storeStrong((id *)&self->_textComponent, 0);
  objc_storeStrong((id *)&self->_transformComponent, 0);
  objc_storeStrong((id *)&self->_documentLock, 0);
  objc_storeStrong((id *)&self->_cachedPublishedParams, 0);
  objc_storeStrong((id *)&self->_parametersThatInvalidateCache, 0);
  objc_storeStrong((id *)&self->_parameterKeysThatInvalidateCache, 0);
  objc_storeStrong((id *)&self->_stillImageInverseToneMapOperator, 0);
  objc_storeStrong((id *)&self->_supportsExtendedRangeInputs, 0);
  objc_storeStrong((id *)&self->_projectPathOverride, 0);
  objc_storeStrong((id *)&self->_projectPath, 0);
  objc_storeStrong((id *)&self->_projectURL, 0);
  objc_storeStrong((id *)&self->_motionComponents, 0);
}

@end
