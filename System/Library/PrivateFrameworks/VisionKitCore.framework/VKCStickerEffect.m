@implementation VKCStickerEffect

+ (id)effectWithType:(unint64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 1uLL:
      objc_msgSend(a1, "strokeEffect");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(a1, "comicEffect");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(a1, "puffyEffect");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      objc_msgSend(a1, "iridescentEffect");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(a1, "noneEffect");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCStickerEffect internalEffect](self, "internalEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VKProtocolCast((uint64_t)&unk_1EFD02C10, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_VKStickerEffectInternal)internalEffect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float64x2_t v8;
  float64_t v9;
  double v10;
  float64x2_t v11;
  float64_t v12;
  _BOOL8 v13;
  float64_t v15;
  float64_t v16;

  objc_msgSend(MEMORY[0x1E0DC6E40], "makeNewEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsStroked:", -[VKCStickerEffect isStroked](self, "isStroked"));
  -[VKCStickerEffect strokeRadius](self, "strokeRadius");
  *(float *)&v4 = v4;
  objc_msgSend(v3, "setStrokeRadius:", v4);
  -[VKCStickerEffect strokeBlurRadius](self, "strokeBlurRadius");
  objc_msgSend(v3, "setStrokeBlurRadius:");
  -[VKCStickerEffect smallStrokeRadiusMultiplier](self, "smallStrokeRadiusMultiplier");
  objc_msgSend(v3, "setSmallStrokeRadiusMultiplier:");
  -[VKCStickerEffect smallShadowSizeMultiplier](self, "smallShadowSizeMultiplier");
  objc_msgSend(v3, "setSmallShadowSizeMultiplier:");
  -[VKCStickerEffect smallShadowAlphaMultiplier](self, "smallShadowAlphaMultiplier");
  objc_msgSend(v3, "setSmallShadowAlphaMultiplier:");
  objc_msgSend(v3, "setForceSmallStrokeRadiusMultiplier:", -[VKCStickerEffect forceSmallStrokeRadiusMultiplier](self, "forceSmallStrokeRadiusMultiplier"));
  objc_msgSend(v3, "setType:", -[VKCStickerEffect type](self, "type"));
  objc_msgSend(v3, "setIsPuffy:", -[VKCStickerEffect isPuffy](self, "isPuffy"));
  -[VKCStickerEffect normalsRadius](self, "normalsRadius");
  *(float *)&v5 = v5;
  objc_msgSend(v3, "setNormalsRadius:", v5);
  objc_msgSend(v3, "setIsBrushed:", -[VKCStickerEffect isBrushed](self, "isBrushed"));
  objc_msgSend(v3, "setApplyBrushBeforeStroke:", -[VKCStickerEffect applyBrushBeforeStroke](self, "applyBrushBeforeStroke"));
  objc_msgSend(v3, "setApplyIridescenceBeforeStroke:", -[VKCStickerEffect applyIridescenceBeforeStroke](self, "applyIridescenceBeforeStroke"));
  -[VKCStickerEffect shadowRadius](self, "shadowRadius");
  *(float *)&v6 = v6;
  objc_msgSend(v3, "setShadowRadius:", v6);
  -[VKCStickerEffect shadowOffset](self, "shadowOffset");
  v15 = v7;
  -[VKCStickerEffect shadowOffset](self, "shadowOffset");
  v8.f64[0] = v15;
  v8.f64[1] = v9;
  objc_msgSend(v3, "setShadowOffset:", COERCE_DOUBLE(vcvt_f32_f64(v8)));
  -[VKCStickerEffect shadowParallax](self, "shadowParallax");
  v16 = v10;
  -[VKCStickerEffect shadowParallax](self, "shadowParallax");
  v11.f64[0] = v16;
  v11.f64[1] = v12;
  objc_msgSend(v3, "setShadowParallax:", COERCE_DOUBLE(vcvt_f32_f64(v11)));
  v13 = -[VKCStickerEffect isComicEnabled](self, "isComicEnabled")
     || -[VKCStickerEffect isInkEnabled](self, "isInkEnabled");
  objc_msgSend(v3, "setIsComicEnabled:", v13);
  if (objc_msgSend(v3, "isComicEnabled"))
  {
    if (-[VKCStickerEffect isComicEnabled](self, "isComicEnabled"))
      objc_msgSend(v3, "applyComicParameters");
    else
      objc_msgSend(v3, "applyComicInkParameters");
  }
  objc_msgSend(v3, "setIsCurlEnabled:", -[VKCStickerEffect isCurlEnabled](self, "isCurlEnabled"));
  objc_msgSend(v3, "setIridescence:", objc_msgSend((id)objc_opt_class(), "internalIridescenceFromVKC:", -[VKCStickerEffect iridescence](self, "iridescence")));
  return (_VKStickerEffectInternal *)v3;
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCStickerEffect;
  return -[VKCStickerEffect init](&v3, sel_init);
}

+ (id)noneEffect
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC6E40], "noneEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "effectFromInternalEffect:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)strokeEffect
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC6E40], "strokeEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "effectFromInternalEffect:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)comicEffect
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC6E40], "comicEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "effectFromInternalEffect:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)puffyEffect
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC6E40], "puffyEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "effectFromInternalEffect:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)iridescentEffect
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC6E40], "iridescentEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "effectFromInternalEffect:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unint64_t)vkcIridescenceFromInternal:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 1);
  if (v3 < 4)
    return v3 + 1;
  else
    return 0;
}

+ (int)internalIridescenceFromVKC:(unint64_t)a3
{
  if (a3 - 1 < 4)
    return a3;
  else
    return 0;
}

+ (id)effectFromInternalEffect:(id)a3
{
  id v3;
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  double v12;
  float v13;
  uint64_t v14;

  v3 = a3;
  v4 = -[VKCStickerEffect initInternal]([VKCStickerEffect alloc], "initInternal");
  objc_msgSend(v4, "setType:", objc_msgSend(v3, "type"));
  objc_msgSend(v4, "setIsStroked:", objc_msgSend(v3, "isStroked"));
  objc_msgSend(v3, "strokeRadius");
  objc_msgSend(v4, "setStrokeRadius:", v5);
  objc_msgSend(v3, "strokeBlurRadius");
  objc_msgSend(v4, "setStrokeBlurRadius:");
  objc_msgSend(v3, "smallStrokeRadiusMultiplier");
  objc_msgSend(v4, "setSmallStrokeRadiusMultiplier:");
  objc_msgSend(v3, "smallShadowSizeMultiplier");
  objc_msgSend(v4, "setSmallShadowSizeMultiplier:");
  objc_msgSend(v3, "smallShadowAlphaMultiplier");
  objc_msgSend(v4, "setSmallShadowAlphaMultiplier:");
  objc_msgSend(v4, "setForceSmallStrokeRadiusMultiplier:", objc_msgSend(v3, "forceSmallStrokeRadiusMultiplier"));
  objc_msgSend(v4, "setIsPuffy:", objc_msgSend(v3, "isPuffy"));
  objc_msgSend(v3, "normalsRadius");
  objc_msgSend(v4, "setNormalsRadius:", v6);
  objc_msgSend(v4, "setIsBrushed:", objc_msgSend(v3, "isBrushed"));
  objc_msgSend(v4, "setApplyBrushBeforeStroke:", objc_msgSend(v3, "applyBrushBeforeStroke"));
  objc_msgSend(v4, "setApplyIridescenceBeforeStroke:", objc_msgSend(v3, "applyIridescenceBeforeStroke"));
  objc_msgSend(v3, "shadowRadius");
  objc_msgSend(v4, "setShadowRadius:", v7);
  objc_msgSend(v3, "shadowOffset");
  v9 = v8;
  objc_msgSend(v3, "shadowOffset");
  objc_msgSend(v4, "setShadowOffset:", v9, v10);
  objc_msgSend(v3, "shadowParallax");
  v12 = v11;
  objc_msgSend(v3, "shadowParallax");
  objc_msgSend(v4, "setShadowParallax:", v12, v13);
  objc_msgSend(v4, "setIsComicEnabled:", objc_msgSend(v3, "isComicEnabled"));
  objc_msgSend(v4, "setIsCurlEnabled:", objc_msgSend(v3, "isCurlEnabled"));
  v14 = objc_msgSend(v3, "iridescence");

  objc_msgSend(v4, "setIridescence:", +[VKCStickerEffect vkcIridescenceFromInternal:](VKCStickerEffect, "vkcIridescenceFromInternal:", v14));
  return v4;
}

- (BOOL)requiresDeviceMotion
{
  void *v2;
  void *v3;

  -[VKCStickerEffect internalEffect](self, "internalEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VKProtocolCast((uint64_t)&unk_1EFD02C10, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "requiresDeviceMotion");
  return (char)v2;
}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__VKCStickerEffect_applyToImage_completion___block_invoke;
  v10[3] = &unk_1E94626F8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  vk_performBlockOnMainThread(v10);

}

void __44__VKCStickerEffect_applyToImage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  VKCStickerEffectView *v3;
  id v4;
  VKCStickerEffectView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "viewForRendering");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = [VKCStickerEffectView alloc];
    v4 = MTLCreateSystemDefaultDevice();
    v5 = -[VKCStickerEffectView initWithDevice:](v3, "initWithDevice:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setViewForRendering:", v5);

  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "viewForRendering");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "viewForRendering");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEffect:", v8);

  objc_msgSend(*(id *)(a1 + 32), "viewForRendering");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "snapshotWithCompletionHandler:", *(_QWORD *)(a1 + 48));

}

- (void)applyToImageSequence:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E9462770;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke_2;
  v4[3] = &unk_1E9462748;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  +[VKCStickerEffectVideoProcessor applyEffect:toImageSequence:progressHandler:completionHandler:](VKCStickerEffectVideoProcessor, "applyEffect:toImageSequence:progressHandler:completionHandler:", v1, v2, v3, v4);

}

void __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke_3;
  v10[3] = &unk_1E9462720;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  vk_dispatchMainAfterDelay(v10, 0.0);

}

uint64_t __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)forceSmallStrokeRadiusMultiplier
{
  return self->_forceSmallStrokeRadiusMultiplier;
}

- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3
{
  self->_forceSmallStrokeRadiusMultiplier = a3;
}

- (VKCStickerEffectView)viewForRendering
{
  return self->_viewForRendering;
}

- (void)setViewForRendering:(id)a3
{
  objc_storeStrong((id *)&self->_viewForRendering, a3);
}

- (unint64_t)iridescence
{
  return self->_iridescence;
}

- (void)setIridescence:(unint64_t)a3
{
  self->_iridescence = a3;
}

- (BOOL)isStroked
{
  return self->_isStroked;
}

- (void)setIsStroked:(BOOL)a3
{
  self->_isStroked = a3;
}

- (double)strokeRadius
{
  return self->_strokeRadius;
}

- (void)setStrokeRadius:(double)a3
{
  self->_strokeRadius = a3;
}

- (float)strokeBlurRadius
{
  return self->_strokeBlurRadius;
}

- (void)setStrokeBlurRadius:(float)a3
{
  self->_strokeBlurRadius = a3;
}

- (float)smallStrokeRadiusMultiplier
{
  return self->_smallStrokeRadiusMultiplier;
}

- (void)setSmallStrokeRadiusMultiplier:(float)a3
{
  self->_smallStrokeRadiusMultiplier = a3;
}

- (float)smallShadowSizeMultiplier
{
  return self->_smallShadowSizeMultiplier;
}

- (void)setSmallShadowSizeMultiplier:(float)a3
{
  self->_smallShadowSizeMultiplier = a3;
}

- (float)smallShadowAlphaMultiplier
{
  return self->_smallShadowAlphaMultiplier;
}

- (void)setSmallShadowAlphaMultiplier:(float)a3
{
  self->_smallShadowAlphaMultiplier = a3;
}

- (BOOL)isPuffy
{
  return self->_isPuffy;
}

- (void)setIsPuffy:(BOOL)a3
{
  self->_isPuffy = a3;
}

- (double)normalsRadius
{
  return self->_normalsRadius;
}

- (void)setNormalsRadius:(double)a3
{
  self->_normalsRadius = a3;
}

- (BOOL)isBrushed
{
  return self->_isBrushed;
}

- (void)setIsBrushed:(BOOL)a3
{
  self->_isBrushed = a3;
}

- (BOOL)applyBrushBeforeStroke
{
  return self->_applyBrushBeforeStroke;
}

- (void)setApplyBrushBeforeStroke:(BOOL)a3
{
  self->_applyBrushBeforeStroke = a3;
}

- (BOOL)applyIridescenceBeforeStroke
{
  return self->_applyIridescenceBeforeStroke;
}

- (void)setApplyIridescenceBeforeStroke:(BOOL)a3
{
  self->_applyIridescenceBeforeStroke = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (CGPoint)shadowOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_shadowOffset.x;
  y = self->_shadowOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setShadowOffset:(CGPoint)a3
{
  self->_shadowOffset = a3;
}

- (CGPoint)shadowParallax
{
  double x;
  double y;
  CGPoint result;

  x = self->_shadowParallax.x;
  y = self->_shadowParallax.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setShadowParallax:(CGPoint)a3
{
  self->_shadowParallax = a3;
}

- (BOOL)isComicEnabled
{
  return self->_isComicEnabled;
}

- (void)setIsComicEnabled:(BOOL)a3
{
  self->_isComicEnabled = a3;
}

- (BOOL)isInkEnabled
{
  return self->_isInkEnabled;
}

- (void)setIsInkEnabled:(BOOL)a3
{
  self->_isInkEnabled = a3;
}

- (BOOL)isCurlEnabled
{
  return self->_isCurlEnabled;
}

- (void)setIsCurlEnabled:(BOOL)a3
{
  self->_isCurlEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewForRendering, 0);
}

@end
