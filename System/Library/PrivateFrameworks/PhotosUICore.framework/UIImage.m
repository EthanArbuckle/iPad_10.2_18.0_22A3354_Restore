@implementation UIImage

void __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  CGSize v23;
  CGSize v24;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "size");
    width = v23.width;
    height = v23.height;
    UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
    PXSizeScale();
    v8 = *(double *)(a1 + 80);
    v9 = *(double *)(a1 + 72) - v6;
    if (*(double *)(a1 + 56) < v9)
      v9 = *(double *)(a1 + 56);
    if (v6 >= v9)
      v9 = v6;
    v10 = v8 - v7;
    if (*(double *)(a1 + 64) < v8 - v7)
      v10 = *(double *)(a1 + 64);
    if (v7 >= v10)
      v10 = v7;
    objc_msgSend(*(id *)(a1 + 40), "px_drawInRect:withContentMode:", *(_QWORD *)(a1 + 88), v6 - v9, v7 - v10);
    UIGraphicsGetImageFromCurrentImageContext();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
    {
      objc_msgSend(v11, "_applyBackdropViewSettings:", px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__backgroundBlurSettings);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
      {
        objc_msgSend(v11, "_applyBackdropViewSettings:", px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
        {
          v24.width = width;
          v24.height = height;
          UIGraphicsBeginImageContextWithOptions(v24, 0, 0.0);
          v14 = *MEMORY[0x1E0C9D538];
          v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          objc_msgSend(v13, "drawAtPoint:", *MEMORY[0x1E0C9D538], v15);
          objc_msgSend(v3, "drawAtPoint:blendMode:alpha:", 22, v14, v15, 1.0);
          objc_msgSend(v12, "drawAtPoint:blendMode:alpha:", 24, v14, v15, 1.0);
          objc_msgSend(v2, "drawAtPoint:blendMode:alpha:", 23, v14, v15, 1.0);
          UIGraphicsGetImageFromCurrentImageContext();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          UIGraphicsEndImageContext();
          if (*(_BYTE *)(a1 + 96))
          {
            objc_msgSend(off_1E50B4758, "sharedScheduler");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_4;
            v19[3] = &unk_1E5145688;
            v22 = *(id *)(a1 + 48);
            v20 = v16;
            v21 = *(id *)(a1 + 32);
            v18 = v16;
            objc_msgSend(v17, "dispatchInMainTransaction:", v19);

          }
          else
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          }

        }
      }

    }
  }
}

uint64_t __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:graphicsQuality:", 2010, 100);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__backgroundBlurSettings;
  px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__backgroundBlurSettings = v0;

  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:graphicsQuality:", 2010, 100);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings;
  px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings = v2;

  objc_msgSend((id)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings, "setColorTintAlpha:", 0.0);
  return objc_msgSend((id)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler__glyphBlurSettings, "setGrayscaleTintAlpha:", 0.0);
}

void __141__UIImage_PhotosUICore__px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("px_extractPlayOverlayBackgroundImageFromLocation", v2);
  v1 = (void *)px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___extractionQueue;
  px_extractPlayOverlayBackgroundImageFromLocation_inViewportWithSize_contentMode_contentsRect_asynchronously_handler___extractionQueue = (uint64_t)v0;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_px_createOverlayImageWithGlyphStyle:backgroundWhite:backgroundAlpha:glyphAlpha:", 0, 0.959999979, 0.959999979, 0.300000012);
  v2 = (void *)px_playOverlayImage__normalButtonImage;
  px_playOverlayImage__normalButtonImage = v1;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_px_createOverlayImageWithGlyphStyle:backgroundWhite:backgroundAlpha:glyphAlpha:", 0, 0.959999979, 0.959999979, 0.5);
  v2 = (void *)px_playOverlayImage__highlightedButtonImage;
  px_playOverlayImage__highlightedButtonImage = v1;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_px_createOverlayImageWithGlyphStyle:backgroundWhite:backgroundAlpha:glyphAlpha:", 5, 0.959999979, 0.959999979, 0.300000012);
  v2 = (void *)px_playOverlayImage__normalButtonImage_43;
  px_playOverlayImage__normalButtonImage_43 = v1;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_px_createOverlayImageWithGlyphStyle:backgroundWhite:backgroundAlpha:glyphAlpha:", 5, 0.959999979, 0.959999979, 0.5);
  v2 = (void *)px_playOverlayImage__highlightedButtonImage_45;
  px_playOverlayImage__highlightedButtonImage_45 = v1;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_7()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPauseVideoOverlayApproximation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_playOverlayImage__approximationImage_38;
  px_playOverlayImage__approximationImage_38 = v0;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_6()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPauseVideoOverlayGlyphMask"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_playOverlayImage__overlayGlyphMask_33;
  px_playOverlayImage__overlayGlyphMask_33 = v0;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayApproximation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_playOverlayImage__approximationImage;
  px_playOverlayImage__approximationImage = v0;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayBackgroundMask"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_playOverlayImage__overlayBackgroundMask;
  px_playOverlayImage__overlayBackgroundMask = v0;

}

void __45__UIImage_PhotosUICore__px_playOverlayImage___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayGlyphMask"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_playOverlayImage__overlayGlyphMask;
  px_playOverlayImage__overlayGlyphMask = v0;

}

@end
