@implementation SBFCARendererImpl

+ (id)renderTreatedWallpaperImage:(CGImage *)a3 needsLuminanceTreatment:(BOOL)a4 needsDimmingTreatment:(BOOL)a5 downsampleFactor:(double)a6 averageColor:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;
  BOOL v21;

  v12 = a7;
  if (*MEMORY[0x1E0CEB258] && objc_msgSend((id)*MEMORY[0x1E0CEB258], "isFrontBoard"))
    +[SBFCARendererImpl renderTreatedWallpaperImage:needsLuminanceTreatment:needsDimmingTreatment:downsampleFactor:averageColor:].cold.1();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __125__SBFCARendererImpl_renderTreatedWallpaperImage_needsLuminanceTreatment_needsDimmingTreatment_downsampleFactor_averageColor___block_invoke;
  v17[3] = &unk_1E200EFD0;
  v20 = a4;
  v21 = a5;
  v18 = v12;
  v19 = a1;
  v13 = v12;
  v14 = (void *)MEMORY[0x18D774178](v17);
  objc_msgSend(a1, "_actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:", a3, 0, v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __125__SBFCARendererImpl_renderTreatedWallpaperImage_needsLuminanceTreatment_needsDimmingTreatment_downsampleFactor_averageColor___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  _QWORD *v13;
  id v14;
  CGColor *SRGB;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  CFIndex v22;
  __CFArray *Mutable;
  CGColorSpace *v24;
  CGFloat *v25;
  CGColorRef v26;
  CGColorRef v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = v11;
  if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49))
  {
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);
    v13 = (_QWORD *)MEMORY[0x1E0CD2C30];
    if (*(_BYTE *)(a1 + 49))
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
      SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, 0.1);
      objc_msgSend(v14, "setBackgroundColor:", SRGB);
      CGColorRelease(SRGB);
      objc_msgSend(v14, "setCompositingFilter:", *v13);
      objc_msgSend(v12, "addSublayer:", v14);

    }
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CD2708], "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrame:", a3, a4, a5, a6);
      objc_msgSend(*(id *)(a1 + 40), "luminanceTreatmentFilters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFilters:", v17);

      objc_msgSend(v12, "addSublayer:", v16);
    }
    if (*(_BYTE *)(a1 + 49))
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0.0;
      components[0] = 0.0;
      v29 = 0.0;
      v30 = 0.0;
      objc_msgSend(*(id *)(a1 + 32), "getRed:green:blue:alpha:", components, &v31, &v30, &v29);
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v31 * -0.589999974 + components[0] * -0.300000012 + v30 * -0.109999999 + v29 * 0.0 + 1.0, v31 * -0.589999974 + components[0] * -0.300000012 + v30 * -0.109999999 + v29 * 0.0 + 1.0, v31 * -0.589999974 + components[0] * -0.300000012 + v30 * -0.109999999 + v29 * 0.0 + 1.0, v31 * 0.0 + components[0] * 0.0 + v30 * 0.0 + v29 * 0.5 + 0.0);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = objc_msgSend(v19, "CGColor");

      objc_msgSend(v18, "setBackgroundColor:", v20);
      objc_msgSend(v18, "setFrame:", a3, a4, a5, a6);
      objc_msgSend(v18, "setCompositingFilter:", *MEMORY[0x1E0CD2E58]);
      objc_msgSend(v12, "addSublayer:", v18);

    }
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CD2790], "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(&unk_1E203B3A8, "count");
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v22, MEMORY[0x1E0C9B378]);
      v24 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
      if (v22)
      {
        v25 = (CGFloat *)&qword_18AC15C10;
        do
        {
          components[0] = 0.0;
          components[1] = *v25;
          v26 = CGColorCreate(v24, components);
          if (v26)
          {
            v27 = v26;
            CFArrayAppendValue(Mutable, v26);
            CFRelease(v27);
          }
          ++v25;
          --v22;
        }
        while (v22);
      }
      objc_msgSend(v21, "setColors:", Mutable);
      CFRelease(Mutable);
      CGColorSpaceRelease(v24);
      objc_msgSend(v21, "setLocations:", &unk_1E203B3A8);
      objc_msgSend(v21, "setStartPoint:", 0.5, 0.0);
      objc_msgSend(v21, "setEndPoint:", 0.5, 1.0);
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCompositingFilter:", v28);
      objc_msgSend(v21, "setFrame:", a3, a4, a5, a6);
      objc_msgSend(v12, "addSublayer:", v21);

    }
    objc_msgSend(v12, "setShouldRasterize:", *(unsigned __int8 *)(a1 + 49));
  }

}

+ (id)renderMaterialImage:(CGImage *)a3 recipeName:(id)a4 containingBundle:(id)a5 weighting:(double)a6 downsampleFactor:(double)a7 scaleAdjustment:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v13 = a4;
  v14 = a5;
  v15 = a8;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __112__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor_scaleAdjustment___block_invoke;
  v22[3] = &unk_1E200EFF8;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = (void *)MEMORY[0x18D774178](v22);
  objc_msgSend(a1, "_actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:", a3, 0, v19, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __112__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor_scaleAdjustment___block_invoke(_QWORD *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  objc_class *v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v11 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v12 = (void *)getMTMaterialLayerClass_softClass;
  v19 = getMTMaterialLayerClass_softClass;
  if (!getMTMaterialLayerClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getMTMaterialLayerClass_block_invoke;
    v15[3] = &unk_1E200E038;
    v15[4] = &v16;
    __getMTMaterialLayerClass_block_invoke((uint64_t)v15);
    v12 = (void *)v17[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v16, 8);
  v14 = objc_alloc_init(v13);
  objc_msgSend(v14, "setRecipeName:fromBundle:", a1[4], a1[5]);
  objc_msgSend(v14, "setWeighting:", 1.0);
  objc_msgSend(v14, "setBackdropScaleAdjustment:", a1[6]);
  objc_msgSend(v14, "setFrame:", a3, a4, a5, a6);
  objc_msgSend(v11, "addSublayer:", v14);
  if (!v14)
    __112__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor_scaleAdjustment___block_invoke_cold_1();

}

+ (id)renderMaterialImage:(CGImage *)a3 recipeName:(id)a4 containingBundle:(id)a5 weighting:(double)a6 downsampleFactor:(double)a7
{
  return (id)objc_msgSend(a1, "renderMaterialImage:recipeName:containingBundle:weighting:downsampleFactor:scaleAdjustment:", a3, a4, a5, &__block_literal_global_18, a6, a7);
}

double __96__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor___block_invoke()
{
  return 0.7;
}

+ (id)_actuallyRenderImage:(CGImage *)a3 requiresBGRA:(BOOL)a4 downsampleFactor:(double)a5 layerCustomizer:(id)a6
{
  void (**v8)(id, NSObject *, double, double, double, double);
  double Width;
  double Height;
  double v11;
  BOOL v12;
  __IOSurface *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  CFStringRef *v19;
  CGColorSpace *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  CFPropertyListRef v32;
  const void *v33;
  void *v35;
  void *v36;
  void *v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, NSObject *, double, double, double, double))a6;
  if (*MEMORY[0x1E0CEB258] && objc_msgSend((id)*MEMORY[0x1E0CEB258], "isFrontBoard"))
    +[SBFCARendererImpl _actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:].cold.3();
  if (!a3)
    +[SBFCARendererImpl _actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:].cold.1();
  Width = (double)CGImageGetWidth(a3);
  Height = (double)CGImageGetHeight(a3);
  v11 = Height / a5;
  if ((unint64_t)(Width / a5))
    v12 = (unint64_t)(Height / a5) == 0;
  else
    v12 = 1;
  if (v12)
  {
    SBLogWallpaper();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SBFCARendererImpl _actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:].cold.2(v14, Width / a5, v11);
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setContents:](v14, "setContents:", a3);
    objc_msgSend(v15, "addSublayer:", v14);
    v37 = v15;
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, Width / a5, v11);
    -[NSObject setFrame:](v14, "setFrame:", 0.0, 0.0, Width, Height);
    memset(&v39, 0, sizeof(v39));
    CGAffineTransformMakeScale(&v39, 1.0 / a5, -1.0 / a5);
    v38 = v39;
    -[NSObject setAffineTransform:](v14, "setAffineTransform:", &v38);
    -[NSObject setPosition:](v14, "setPosition:", Width / a5 * 0.5, v11 * 0.5);
    if (v8)
      v8[2](v8, v14, 0.0, 0.0, Width, Height);
    v16 = MTLCreateSystemDefaultDevice();
    *(_QWORD *)&v38.a = 1;
    v13 = (__IOSurface *)objc_msgSend(MEMORY[0x1E0CBBEA0], "bs_IOSurfaceWithWidth:height:options:", (unint64_t)(Width / a5), (unint64_t)v11, &v38);
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, (unint64_t)(Width / a5), (unint64_t)v11, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUsage:", 4);
    v36 = (void *)objc_msgSend(v16, "newTextureWithDescriptor:iosurface:plane:", v17, v13, 0);
    v18 = MGGetBoolAnswer();
    v19 = (CFStringRef *)MEMORY[0x1E0C9D960];
    if (!v18)
      v19 = (CFStringRef *)MEMORY[0x1E0C9DA10];
    v20 = CGColorSpaceCreateWithName(*v19);
    v35 = v16;
    v21 = (void *)objc_msgSend(v16, "newCommandQueue");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D01760], "serial");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "serviceClass:", 33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)BSDispatchQueueCreate();

      objc_msgSend(v21, "setSubmissionQueue:", v24);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D01760], "serial");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "serviceClass:", 33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)BSDispatchQueueCreate();

      objc_msgSend(v21, "setCompletionQueue:", v27);
    }
    v28 = *MEMORY[0x1E0CD3090];
    v40[0] = *MEMORY[0x1E0CD3088];
    v40[1] = v28;
    v41[0] = v20;
    v41[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2820], "rendererWithMTLTexture:options:", v36, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLayer:", v37);
    objc_msgSend(v30, "setBounds:", 0.0, 0.0, Width / a5, v11);
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    objc_msgSend(v30, "beginFrameAtTime:timeStamp:", 0, 0.0);
    objc_msgSend(v30, "render");
    objc_msgSend(v30, "endFrame");
    objc_msgSend(v21, "commandBuffer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "enqueue");
    objc_msgSend(v31, "commit");
    objc_msgSend(v31, "waitUntilCompleted");
    v32 = CGColorSpaceCopyPropertyList(v20);
    if (v32)
    {
      v33 = v32;
      IOSurfaceSetValue(v13, (CFStringRef)*MEMORY[0x1E0CBBF90], v32);
      CFRelease(v33);
    }
    CGColorSpaceRelease(v20);

  }
  return v13;
}

+ (id)luminanceTreatmentFilters
{
  void *v2;
  void *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  CGImageSource *v6;
  CGImageSource *v7;
  CGImageRef ImageAtIndex;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  SBFBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    +[SBFCARendererImpl luminanceTreatmentFilters].cold.1();
  v3 = v2;
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("WallpaperLuminanceMap"), CFSTR("png"));
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    +[SBFCARendererImpl luminanceTreatmentFilters].cold.2();
  v5 = v4;
  v6 = CGImageSourceCreateWithURL(v4, 0);
  if (!v6)
LABEL_10:
    +[SBFCARendererImpl luminanceTreatmentFilters].cold.3();
  v7 = v6;
  if (!CGImageSourceGetCount(v6))
  {
    CFRelease(v7);
    goto LABEL_10;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
  CFRelease(v7);
  if (!ImageAtIndex)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", ImageAtIndex, CFSTR("inputColorMap"));

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", &unk_1E203B9B8, CFSTR("inputAmount"));
  v13[0] = v10;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)renderTreatedWallpaperImage:needsLuminanceTreatment:needsDimmingTreatment:downsampleFactor:averageColor:.cold.1()
{
  __assert_rtn("+[SBFCARendererImpl renderTreatedWallpaperImage:needsLuminanceTreatment:needsDimmingTreatment:downsampleFactor:averageColor:]", "SBFCARendererImpl.m", 48, "![UIApp isFrontBoard]");
}

void __112__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor_scaleAdjustment___block_invoke_cold_1()
{
  __assert_rtn("+[SBFCARendererImpl renderMaterialImage:recipeName:containingBundle:weighting:downsampleFactor:scaleAdjustment:]_block_invoke", "SBFCARendererImpl.m", 169, "materialLayer");
}

+ (void)_actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:.cold.1()
{
  __assert_rtn("+[SBFCARendererImpl _actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:]", "SBFCARendererImpl.m", 195, "imageRef");
}

+ (void)_actuallyRenderImage:(double)a3 requiresBGRA:downsampleFactor:layerCustomizer:.cold.2(NSObject *a1, double a2, double a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_18AB69000, a1, OS_LOG_TYPE_ERROR, "Image output size (%@) is invalid. Not rendering image", (uint8_t *)&v5, 0xCu);

}

+ (void)_actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:.cold.3()
{
  __assert_rtn("+[SBFCARendererImpl _actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:]", "SBFCARendererImpl.m", 192, "![UIApp isFrontBoard]");
}

+ (void)luminanceTreatmentFilters
{
  __assert_rtn("+[SBFCARendererImpl luminanceTreatmentFilters]", "SBFCARendererImpl.m", 322, "imageRef");
}

@end
