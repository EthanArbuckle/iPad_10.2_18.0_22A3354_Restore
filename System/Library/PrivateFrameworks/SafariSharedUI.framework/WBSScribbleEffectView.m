@implementation WBSScribbleEffectView

+ (void)discardPrewarmedContent
{
  NSObject *v2;

  prewarmingQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_62);

}

void __48__WBSScribbleEffectView_discardPrewarmedContent__block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)prewarmedEffect;
  prewarmedEffect = 0;

  v1 = (void *)prewarmedScene;
  prewarmedScene = 0;

}

+ (CGImage)imageForScribbleEffectWithElementSnapshot:(CGImage *)a3 elementFrame:(CGRect)a4 webViewSize:(CGSize)a5 webViewScale:(double)a6
{
  double height;
  double width;
  CGFloat v9;
  CGFloat v10;
  CGFloat y;
  CGFloat x;
  void *v14;
  int v15;
  double v16;
  CGColorSpace *DeviceRGB;
  CGContext *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGImage *Image;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a5.height;
  width = a5.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("ScribbleReduceSnapshotScale"));

  if (v15)
    v16 = 1.0;
  else
    v16 = a6;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18 = CGBitmapContextCreate(0, (unint64_t)(width * v16), (unint64_t)(height * v16), 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = v10;
  v24.size.height = v9;
  v19 = v16 * CGRectGetMinX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = v10;
  v25.size.height = v9;
  v20 = v16 * (height - CGRectGetMaxY(v25));
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = v10;
  v26.size.height = v9;
  v21 = v16 * CGRectGetWidth(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = v10;
  v27.size.height = v9;
  v28.size.height = v16 * CGRectGetHeight(v27);
  v28.origin.x = v19;
  v28.origin.y = v20;
  v28.size.width = v21;
  CGContextDrawImage(v18, v28, a3);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  return Image;
}

+ (void)prewarm
{
  NSObject *v3;
  _QWORD block[5];

  prewarmingQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__WBSScribbleEffectView_prewarm__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

uint64_t __32__WBSScribbleEffectView_prewarm__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prewarmSceneAndEffect");
}

- (WBSScribbleEffectView)initWithImage:(CGImage *)a3 frame:(CGRect)a4
{
  WBSScribbleEffectView *v5;
  MTLDevice *v6;
  MTLDevice *device;
  uint64_t v8;
  CALayer *imageLayer;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGImage *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)WBSScribbleEffectView;
  v5 = -[WBSScribbleEffectView initWithFrame:](&v38, sel_initWithFrame_, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (v5)
  {
    v6 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v5->_device;
    v5->_device = v6;

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v8 = objc_claimAutoreleasedReturnValue();
    imageLayer = v5->_imageLayer;
    v5->_imageLayer = (CALayer *)v8;

    -[CALayer setContentsGravity:](v5->_imageLayer, "setContentsGravity:", *MEMORY[0x1E0CD2F90]);
    -[WBSScribbleEffectView layer](v5, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", v5->_imageLayer);

    -[WBSScribbleEffectView bounds](v5, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)MEMORY[0x1E0CD28B0];
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __45__WBSScribbleEffectView_initWithImage_frame___block_invoke;
    v31 = &unk_1E5447E08;
    v20 = v5;
    v32 = v20;
    v33 = v12;
    v34 = v14;
    v35 = v16;
    v36 = v18;
    v37 = a3;
    objc_msgSend(v19, "safari_performWithActionsDisabled:", &v28);
    if (objc_opt_class())
    {
      v21 = objc_alloc(MEMORY[0x1E0DC63C0]);
      v22 = objc_msgSend(v21, "initWithFrame:", v12, v14, v16, v18, v28, v29, v30, v31);
      v23 = v20[57];
      v20[57] = (id)v22;

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20[57], "setBackgroundColor:", v24);

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20[57], "setPreferredFramesPerSecond:", objc_msgSend(v25, "integerForKey:", CFSTR("ScribbleOverrideFPS")));

      objc_msgSend(v20, "addSubview:", v20[57]);
    }
    objc_msgSend(v20, "_setUpSceneWithImage:", a3, v28, v29, v30, v31);
    v26 = v20;

  }
  return v5;
}

uint64_t __45__WBSScribbleEffectView_initWithImage_frame___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setContents:", *(_QWORD *)(a1 + 72));
}

- (void)_setUpSceneWithImage:(CGImage *)a3
{
  if (objc_opt_class() && -[WBSScribbleEffectView _loadSceneAndEffect](self, "_loadSceneAndEffect"))
  {
    if (-[WBSScribbleEffectView _loadTextureWithImage:](self, "_loadTextureWithImage:", a3))
    {
      -[WBSScribbleEffectView _bindAspectRatio](self, "_bindAspectRatio");
      self->_sceneIsSetUp = 1;
    }
  }
}

- (BOOL)_loadSceneAndEffect
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  prewarmingQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke;
  block[3] = &unk_1E5447E30;
  block[6] = v4;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

void __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  if (prewarmedScene)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v2 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke_cold_2(v2, a1);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "_prewarmSceneAndEffect");
    v3 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke_cold_1(a1 + 40, v3, a1);
  }
  if (prewarmedScene)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 448), (id)prewarmedScene);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 440), (id)prewarmedEffect);
    v4 = (void *)prewarmedScene;
    prewarmedScene = 0;

    v5 = (void *)prewarmedEffect;
    prewarmedEffect = 0;

  }
}

+ (BOOL)_prewarmSceneAndEffect
{
  NSObject *v2;
  BOOL v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v22;

  prewarmingQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (prewarmedScene)
    return 1;
  v4 = WBS_LOG_CHANNEL_PREFIXScribble();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[WBSScribbleEffectView _prewarmSceneAndEffect].cold.2(v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_alloc_init(MEMORY[0x1E0D8A1C8]);
  objc_msgSend(v12, "setHandler:", &__block_literal_global_15_0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForResource:withExtension:", CFSTR("SelectedMaskEraseEffect"), CFSTR("vfx"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0DC63B0]);
  v16 = MTLCreateSystemDefaultDevice();
  objc_msgSend(v15, "setDevice:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC63D0]), "initWithOptions:", v15);
  v22 = 0;
  objc_msgSend(v17, "addEffectFrom:error:", v14, &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v22;
  v3 = v19 == 0;
  if (v19)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[WBSScribbleEffectView _prewarmSceneAndEffect].cold.1(v20, v19);
  }
  else
  {
    objc_storeStrong((id *)&prewarmedScene, v17);
    objc_storeStrong((id *)&prewarmedEffect, v18);
  }

  return v3;
}

void __47__WBSScribbleEffectView__prewarmSceneAndEffect__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = WBS_LOG_CHANNEL_PREFIXScribble();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __47__WBSScribbleEffectView__prewarmSceneAndEffect__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (BOOL)_loadTextureWithImage:(CGImage *)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C48]), "initWithDevice:", self->_device);
  v10 = 0;
  v6 = (void *)objc_msgSend(v5, "newTextureWithCGImage:options:error:", a3, 0, &v10);
  v7 = v10;
  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSScribbleEffectView _loadTextureWithImage:].cold.1(v8, v7);
  }
  else
  {
    -[_TtC3VFX9VFXEffect setClientTextureWithId:texture:](self->_vfxEffect, "setClientTextureWithId:texture:", -[_TtC3VFX9VFXEffect fetchClientTextureIDWithNamed:](self->_vfxEffect, "fetchClientTextureIDWithNamed:", CFSTR("erasedImage")), v6);
  }

  return v7 == 0;
}

- (void)_bindAspectRatio
{
  double v3;
  double v4;
  float v5;
  _TtC3VFX9VFXEffect *vfxEffect;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  float v11;

  -[_TtC3VFX9VFXEffect firstBindingWithName:](self->_vfxEffect, "firstBindingWithName:", CFSTR("viewRatioX"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSScribbleEffectView bounds](self, "bounds");
  v5 = v3 / v4;
  vfxEffect = self->_vfxEffect;
  v7 = objc_msgSend(v9, "objectID");
  v8 = objc_msgSend(v9, "type");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__WBSScribbleEffectView__bindAspectRatio__block_invoke;
  v10[3] = &__block_descriptor_44_e12_v24__0_v8Q16l;
  v10[4] = 4;
  v11 = v5;
  -[_TtC3VFX9VFXEffect setParameterOf:named:type:size:with:](vfxEffect, "setParameterOf:named:type:size:with:", v7, CFSTR("viewRatioX"), v8, 4, v10);

}

_QWORD *__41__WBSScribbleEffectView__bindAspectRatio__block_invoke(_QWORD *result, void *__dst, size_t a3)
{
  if (result[4] == a3)
    return memcpy(__dst, result + 5, a3);
  return result;
}

- (void)startEffectWithCompletion:(id)a3
{
  id v4;
  double v5;
  CALayer *imageLayer;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (self->_sceneIsSetUp)
  {
    -[_TtC3VFX8VFXScene setIsPlaying:](self->_vfxScene, "setIsPlaying:", 1);
    LODWORD(v5) = 1067869798;
    -[_TtC3VFX8VFXScene setTimeScale:](self->_vfxScene, "setTimeScale:", v5);
    -[VFXView setScene:](self->_vfxView, "setScene:", self->_vfxScene);
  }
  imageLayer = self->_imageLayer;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDuration:", 0.5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v8);

  objc_msgSend(v7, "setFromValue:", &unk_1E547A1A0);
  objc_msgSend(v7, "setToValue:", &unk_1E547A1B8);
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  -[CALayer addAnimation:forKey:](imageLayer, "addAnimation:forKey:", v7, 0);

  v9 = dispatch_time(0, 1200000000);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__WBSScribbleEffectView_startEffectWithCompletion___block_invoke;
  v11[3] = &unk_1E5443108;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_after(v9, MEMORY[0x1E0C80D38], v11);

}

uint64_t __51__WBSScribbleEffectView_startEffectWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vfxView, 0);
  objc_storeStrong((id *)&self->_vfxScene, 0);
  objc_storeStrong((id *)&self->_vfxEffect, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v3;
  const __CFString *v5;
  id v6;
  double v7;
  double v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24))
    v5 = CFSTR("succeeded");
  else
    v5 = CFSTR("failed");
  v6 = a2;
  OUTLINED_FUNCTION_3_6();
  v8 = (v7 - *(double *)(a3 + 48)) * 1000.0;
  v9 = 138412546;
  v10 = v5;
  v11 = 2048;
  v12 = v8;
  _os_log_debug_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEBUG, "Synchronously loaded hiding effect (%@) (%.0f ms)", (uint8_t *)&v9, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

void __44__WBSScribbleEffectView__loadSceneAndEffect__block_invoke_cold_2(void *a1, uint64_t a2)
{
  NSObject *v2;
  id v4;
  double v5;
  double v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  OUTLINED_FUNCTION_3_6();
  v6 = (v5 - *(double *)(a2 + 48)) * 1000.0;
  v7 = 134217984;
  v8 = v6;
  _os_log_debug_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEBUG, "Used a prewarmed hiding effect (%.0f ms)", (uint8_t *)&v7, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_prewarmSceneAndEffect
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "Prewarming hiding effect…", a5, a6, a7, a8, 0);
}

void __47__WBSScribbleEffectView__prewarmSceneAndEffect__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "Done prewarming.", a5, a6, a7, a8, 0);
}

- (void)_loadTextureWithImage:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Failed to load texture for snapshot: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
