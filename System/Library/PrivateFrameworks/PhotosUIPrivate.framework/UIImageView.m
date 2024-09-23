@implementation UIImageView

void __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_3(uint64_t a1)
{
  CGFloat width;
  CGFloat height;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CGSize v20;
  CGSize v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isCancelled") & 1) == 0)
  {
    objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayBackgroundMask, "size");
    width = v20.width;
    height = v20.height;
    v4 = *(double *)(a1 + 56) + v20.width * -0.5;
    v5 = *(double *)(a1 + 64) + v20.height * -0.5;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    v6 = *(void **)(a1 + 40);
    v22.origin.x = v4;
    v22.origin.y = v5;
    v22.size.width = width;
    v22.size.height = height;
    v7 = -CGRectGetMinX(v22);
    v23.origin.x = v4;
    v23.origin.y = v5;
    v23.size.width = width;
    v23.size.height = height;
    v8 = -CGRectGetMinY(v23);
    v24 = CGRectOffset(*(CGRect *)(a1 + 72), v7, v8);
    objc_msgSend(v6, "px_drawInRect:withContentMode:", *(_QWORD *)(a1 + 104), v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    UIGraphicsGetImageFromCurrentImageContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if ((objc_msgSend(*(id *)(a1 + 32), "_isCancelled") & 1) == 0)
    {
      objc_msgSend(v9, "_applyBackdropViewSettings:", pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__backgroundBlurSettings);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 32), "_isCancelled") & 1) == 0)
      {
        objc_msgSend(v9, "_applyBackdropViewSettings:", pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "_isCancelled") & 1) == 0)
        {
          objc_msgSend(v10, "size");
          UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
          v12 = *MEMORY[0x1E0C9D538];
          v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          objc_msgSend(v11, "drawAtPoint:", *MEMORY[0x1E0C9D538], v13);
          objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayGlyphMask, "drawAtPoint:blendMode:alpha:", 22, v12, v13, 1.0);
          objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 24, v12, v13, 1.0);
          objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayBackgroundMask, "drawAtPoint:blendMode:alpha:", 23, v12, v13, 1.0);
          UIGraphicsGetImageFromCurrentImageContext();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          UIGraphicsEndImageContext();
          if (*(_BYTE *)(a1 + 112))
          {
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_4;
            v17[3] = &unk_1E58AB968;
            v15 = *(id *)(a1 + 48);
            v18 = v14;
            v19 = v15;
            v16 = v14;
            dispatch_async(MEMORY[0x1E0C80D38], v17);

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

uint64_t __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:graphicsQuality:", 2010, 100);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__backgroundBlurSettings;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__backgroundBlurSettings = v0;

  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:graphicsQuality:", 2010, 100);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings = v2;

  objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings, "setColorTintAlpha:", 0.0);
  objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__glyphBlurSettings, "setGrayscaleTintAlpha:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayBackgroundMask"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayBackgroundMask;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayBackgroundMask = v4;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayGlyphMask"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayGlyphMask;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__overlayGlyphMask = v6;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXPlayVideoOverlayApproximation"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__approximationImage;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__approximationImage = v8;

}

void __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("pu_extractPlayOverlayBackgroundImageFromCenter", v2);
  v1 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___extractionQueue;
  pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___extractionQueue = (uint64_t)v0;

}

@end
