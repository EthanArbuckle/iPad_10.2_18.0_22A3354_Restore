@implementation TUIEmojiUpscaler

- (TUIEmojiUpscaler)init
{
  TUIEmojiUpscaler *v2;
  uint64_t v3;
  MADService *madService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIEmojiUpscaler;
  v2 = -[TUIEmojiUpscaler init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47780], "service");
    v3 = objc_claimAutoreleasedReturnValue();
    madService = v2->_madService;
    v2->_madService = (MADService *)v3;

  }
  return v2;
}

- (id)imageFromEmoji:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGColorSpace *v11;
  CGContext *v12;
  CGImage *Image;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = *MEMORY[0x1E0DC32A0];
  v3 = (void *)MEMORY[0x1E0DC37E8];
  v4 = a3;
  objc_msgSend(v3, "systemFontOfSize:", 160.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sizeWithAttributes:", v6);
  v8 = v7;
  v10 = v9;
  v11 = (CGColorSpace *)objc_msgSend((id)objc_opt_class(), "sRGB");
  v12 = CGBitmapContextCreate(0, 0xA0uLL, 0xA0uLL, 8uLL, 0, v11, 1u);
  UIGraphicsPushContext(v12);
  CGContextScaleCTM(v12, 1.0, -1.0);
  CGContextTranslateCTM(v12, 0.0, -160.0);
  objc_msgSend(v4, "drawAtPoint:withAttributes:", v6, (160.0 - v8) * 0.5, (160.0 - v10) * 0.5);

  UIGraphicsPopContext();
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  if (Image)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(Image);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)generateEmoji:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  TUIEmojiUpscalerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18C785000, v8, OS_LOG_TYPE_DEFAULT, "Generating emoji", v10, 2u);
  }

  -[TUIEmojiUpscaler imageFromEmoji:](self, "imageFromEmoji:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[TUIEmojiUpscaler generateEmoji:forImage:completion:](self, "generateEmoji:forImage:completion:", v6, v9, v7);

}

- (void)generateEmoji:(id)a3 forImage:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGImage *v19;
  uint64_t v20;
  CGColorSpace *DeviceRGB;
  uint64_t v22;
  const __CFDictionary *v23;
  CGColorSpace *v24;
  unint64_t Width;
  unint64_t Height;
  __CVBuffer *v27;
  objc_class *v28;
  void *v29;
  MADService *madService;
  void *v31;
  void *v32;
  id v33;
  MADService *v34;
  void *v35;
  NSObject *v36;
  void *BaseAddress;
  size_t BytesPerRow;
  CGContext *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  CVPixelBufferRef pixelBufferOut;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  uint8_t buf[8];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CGRect v56;

  v55 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v8 = a4;
  v41 = a5;
  v9 = (void *)MEMORY[0x1E0C9DDC8];
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "imageWithCGImage:", objc_msgSend(v10, "CGImage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extent");
  v12 = (void *)MEMORY[0x1E0C9DD90];
  v49 = *MEMORY[0x1E0C9DF98];
  v50 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contextWithOptions:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "extent");
  v40 = v14;
  v19 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:format:colorSpace:", v11, *MEMORY[0x1E0C9E070], objc_msgSend((id)objc_opt_class(), "sRGB"), v15, v16, v17, v18);

  v20 = objc_msgSend((id)objc_opt_class(), "sRGB");
  DeviceRGB = (CGColorSpace *)v20;
  if (!v20)
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v22 = *MEMORY[0x1E0CA8F78];
  v51[0] = *MEMORY[0x1E0CA8FF0];
  v51[1] = v22;
  *(_QWORD *)buf = MEMORY[0x1E0C9AA70];
  v53 = MEMORY[0x1E0C9AAB0];
  v51[2] = *MEMORY[0x1E0CA8F70];
  v54 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v51, 3);
  v23 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  v24 = DeviceRGB;
  if (!DeviceRGB)
    v24 = CGColorSpaceCreateDeviceRGB();
  pixelBufferOut = 0;
  if (!v19
    || (Width = CGImageGetWidth(v19),
        Height = CGImageGetHeight(v19),
        CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Width, Height, 0x42475241u, v23, &pixelBufferOut)))
  {
    if (DeviceRGB)
      goto LABEL_9;
    goto LABEL_8;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  v39 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, v24, 0x2002u);
  v56.size.width = (double)Width;
  v56.size.height = (double)Height;
  v56.origin.x = 0.0;
  v56.origin.y = 0.0;
  CGContextDrawImage(v39, v56, v19);
  CGContextRelease(v39);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  if (!DeviceRGB)
LABEL_8:
    CGColorSpaceRelease(v24);
LABEL_9:
  v27 = pixelBufferOut;

  if (!v20)
    CGColorSpaceRelease(DeviceRGB);

  CGImageRelease(v19);
  v28 = NSClassFromString(CFSTR("MADMLScalingRequest"));
  if (v28)
  {
    v29 = (void *)objc_msgSend([v28 alloc], "initWithScaledImageWidth:scaledImageHeight:", 320, 320);
    madService = self->_madService;
    v48 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __54__TUIEmojiUpscaler_generateEmoji_forImage_completion___block_invoke;
    v43[3] = &unk_1E24FBAB0;
    v44 = v29;
    v32 = v41;
    v46 = v41;
    v45 = v10;
    v33 = v29;
    v34 = madService;
    v35 = v42;
    -[MADService performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:](v34, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v31, v27, 1, v42, v43);

    CVPixelBufferRelease(v27);
  }
  else
  {
    TUIEmojiUpscalerLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C785000, v36, OS_LOG_TYPE_DEFAULT, "Failed to load MADMLScalingRequest class", buf, 2u);
    }

    v32 = v41;
    (*((void (**)(id, id, id, _QWORD))v41 + 2))(v41, v10, v10, 0);
    v35 = v42;
    if (v27)
      CVPixelBufferRelease(v27);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madService, 0);
}

void __54__TUIEmojiUpscaler_generateEmoji_forImage_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__TUIEmojiUpscaler_generateEmoji_forImage_completion___block_invoke_2;
  v6[3] = &unk_1E24FBA88;
  v7 = v4;
  v8 = a1[4];
  v10 = a1[6];
  v9 = a1[5];
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __54__TUIEmojiUpscaler_generateEmoji_forImage_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIImage *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v4;
  }
  if (v2)
  {
    TUIEmojiUpscalerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v2;
      _os_log_impl(&dword_18C785000, v5, OS_LOG_TYPE_DEFAULT, "Failed to upscale emoji, %@", (uint8_t *)&v12, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "image");
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v8);
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

+ (CGColorSpace)sRGB
{
  if (sRGB_onceToken != -1)
    dispatch_once(&sRGB_onceToken, &__block_literal_global_5734);
  return (CGColorSpace *)sRGB_sRGB;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5732 != -1)
    dispatch_once(&sharedInstance_onceToken_5732, &__block_literal_global_18);
  return (id)sharedInstance__sharedInstance;
}

void __34__TUIEmojiUpscaler_sharedInstance__block_invoke()
{
  TUIEmojiUpscaler *v0;
  void *v1;

  v0 = objc_alloc_init(TUIEmojiUpscaler);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

CGColorSpaceRef __24__TUIEmojiUpscaler_sRGB__block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  sRGB_sRGB = (uint64_t)result;
  return result;
}

@end
