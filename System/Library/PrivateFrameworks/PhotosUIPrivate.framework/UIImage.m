@implementation UIImage

void __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke_2(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 40), "size");
    width = v20.width;
    height = v20.height;
    v4 = *(double *)(a1 + 72) + v20.width * -0.5;
    v5 = *(double *)(a1 + 80) + v20.height * -0.5;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    v6 = *(void **)(a1 + 48);
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
    v24 = CGRectOffset(*(CGRect *)(a1 + 88), v7, v8);
    objc_msgSend(v6, "px_drawInRect:withContentMode:", *(_QWORD *)(a1 + 120), v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    UIGraphicsGetImageFromCurrentImageContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if ((objc_msgSend(*(id *)(a1 + 32), "_isCancelled") & 1) == 0)
    {
      objc_msgSend(v9, "_applyBackdropViewSettings:", pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__backgroundBlurSettings);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 32), "_isCancelled") & 1) == 0)
      {
        objc_msgSend(v9, "_applyBackdropViewSettings:", pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "_isCancelled") & 1) == 0)
        {
          objc_msgSend(v10, "size");
          UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
          v12 = *MEMORY[0x1E0C9D538];
          v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          objc_msgSend(v11, "drawAtPoint:", *MEMORY[0x1E0C9D538], v13);
          objc_msgSend(*(id *)(a1 + 56), "drawAtPoint:blendMode:alpha:", 22, v12, v13, 1.0);
          objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 24, v12, v13, 1.0);
          objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:blendMode:alpha:", 23, v12, v13, 1.0);
          UIGraphicsGetImageFromCurrentImageContext();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          UIGraphicsEndImageContext();
          if (*(_BYTE *)(a1 + 128))
          {
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke_3;
            v17[3] = &unk_1E58AB968;
            v15 = *(id *)(a1 + 64);
            v18 = v14;
            v19 = v15;
            v16 = v14;
            dispatch_async(MEMORY[0x1E0C80D38], v17);

          }
          else
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          }

        }
      }

    }
  }
}

uint64_t __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __110__UIImage_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:graphicsQuality:", 2010, 100);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__backgroundBlurSettings;
  pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__backgroundBlurSettings = v0;

  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:graphicsQuality:", 2010, 100);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings;
  pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings = v2;

  objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings, "setColorTintAlpha:", 0.0);
  return objc_msgSend((id)pu_extractPlayOverlayBackgroundImageFromCenter_inRect_contentMode_asynchronously_handler__glyphBlurSettings, "setGrayscaleTintAlpha:", 0.0);
}

uint64_t __63__UIImage_PhotosUI__pu_centeredImage_withBackgroundColor_size___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "set");
  objc_msgSend(v8, "fillRect:", v3, v4, v5, v6);

  objc_msgSend(*(id *)(a1 + 40), "size");
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:");
}

void __119__UIImage_PhotosUI__pu_imageWithIconImage_iconImageColor_text_font_textColor_fillColor_strokeColor_cornerRadius_inset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  CGRect v13;

  v12 = a2;
  objc_msgSend(v12, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  if (v4 <= 1.0)
    v5 = 1.0;
  else
    v5 = 1.0 / v4;
  v6 = (void *)MEMORY[0x1E0DC3508];
  v13 = CGRectInset(*(CGRect *)(a1 + 80), v5 * 0.5, v5 * 0.5);
  objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height, *(double *)(a1 + 112));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineWidth:", v5);
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "setFill");
    objc_msgSend(v7, "fill");
  }
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v9, "setStroke");
    objc_msgSend(v7, "stroke");
  }
  if (*(_QWORD *)(a1 + 48))
    CGContextSetFillColorWithColor((CGContextRef)objc_msgSend(v12, "CGContext"), (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "CGColor"));
  v10 = *(double *)(a1 + 120);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 56), "drawAtPoint:", v10, CGRectGetMidY(*(CGRect *)(a1 + 80)) - *(double *)(a1 + 144) * 0.5);
    v10 = v10 + *(double *)(a1 + 152) + *(double *)(a1 + 136);
    v11 = *(double *)(a1 + 104) * 0.5 - *(double *)(a1 + 168) * 0.5;
  }
  else
  {
    v11 = *(double *)(a1 + 128);
  }
  objc_msgSend(*(id *)(a1 + 64), "drawAtPoint:withAttributes:", *(_QWORD *)(a1 + 72), v10, v11);

}

@end
