@implementation QLPreviewThumbnailGenerator

void __74__QLPreviewThumbnailGenerator_generateWithWillStartBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D82731C0]();
  objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailWithWillStartBlock:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

- (QLPlatformImage)thumbnailImage
{
  void *v2;
  void *v3;

  -[QLPreviewThumbnailGenerator thumbnailImages](self, "thumbnailImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (QLPlatformImage *)v3;
}

- (void)setGenerationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_generationQueue, a3);
}

- (BOOL)resultIsLowQuality
{
  return self->_resultIsLowQuality;
}

- (QLThumbnailItem)item
{
  return (QLThumbnailItem *)objc_getProperty(self, a2, 16, 1);
}

- (QLPreviewThumbnailGenerator)initWithGeneratorRequest:(id)a3 lowQuality:(BOOL)a4 thumbnailItem:(id)a5
{
  id v9;
  id v10;
  QLPreviewThumbnailGenerator *v11;
  QLPreviewThumbnailGenerator *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)QLPreviewThumbnailGenerator;
  v11 = -[QLPreviewThumbnailGenerator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    v12->_wantsLowQuality = a4;
    objc_storeStrong((id *)&v12->_item, a5);
  }

  return v12;
}

- (void)generateWithWillStartBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *generationQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if ((self->_status - 1) >= 2)
  {
    self->_status = 1;
    generationQueue = self->_generationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__QLPreviewThumbnailGenerator_generateWithWillStartBlock_completionBlock___block_invoke;
    block[3] = &unk_1E99D3550;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(generationQueue, block);

  }
}

- (void)_generateThumbnailWithWillStartBlock:(id)a3 completionHandler:(id)a4
{
  QLTGeneratorThumbnailRequest *request;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  request = self->_request;
  v6 = a4;
  -[QLTGeneratorThumbnailRequest request](request, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void (**)(_QWORD, _QWORD))objc_msgSend(v6, "copy");

  if (self->_status == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD3368], 5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v9);

  }
  else
  {
    +[QLThumbnailExtensionMonitor shared](QLThumbnailExtensionMonitor, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailItem contentType](self->_item, "contentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTGeneratorThumbnailRequest request](self->_request, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bestExtensionFor:shouldUseRestrictedExtension:", v11, objc_msgSend(v12, "shouldUseRestrictedExtension"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[QLPreviewThumbnailGenerator _generateThumbnailFromExtensionAndReplyWith:](self, "_generateThumbnailFromExtensionAndReplyWith:", v8);
    }
    else
    {
      -[QLThumbnailItem contentType](self->_item, "contentType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC570]))
      {

      }
      else
      {
        -[QLThumbnailItem contentType](self->_item, "contentType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.localized-pdf-bundle"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "conformsToType:", v16);

        if (!v17)
        {
          v18 = (void *)MEMORY[0x1E0CD32D0];
          v24 = *MEMORY[0x1E0CB2D50];
          v19 = (void *)MEMORY[0x1E0CB3940];
          -[QLThumbnailItem contentType](self->_item, "contentType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("No extension found for %@"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25[0] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithCode:request:additionalUserInfo:", 4, v7, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          self->_status = 2;
          ((void (**)(_QWORD, void *))v8)[2](v8, v23);

          goto LABEL_10;
        }
      }
      -[QLPreviewThumbnailGenerator _createThumbnailForPDF:](self, "_createThumbnailForPDF:", v8);
    }
  }
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionGenerator, 0);
  objc_storeStrong((id *)&self->_extensionBadge, 0);
  objc_storeStrong((id *)&self->_thumbnailImages, 0);
  objc_storeStrong((id *)&self->generatedProperties, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

+ (BOOL)canGenerateThumbnailForContentType:(id)a3 atSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  char v8;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  +[QLThumbnailExtensionMonitor shared](QLThumbnailExtensionMonitor, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canGenerateThumbnailWith:at:", v6, width, height);

  return v8;
}

+ (double)cornerRadiusForSize:(CGSize)a3
{
  double result;

  if (a3.width < a3.height)
    a3.width = a3.height;
  result = a3.width * 6.0 * 0.0078125 + -1.0;
  if (result < 3.0)
    return 3.0;
  return result;
}

+ (id)generateIconDataFromThumbnailData:(id)a3 inputFormat:(id)a4 outputFormat:(id *)a5 outputContentRect:(CGRect *)a6 desiredSize:(CGSize)a7 desiredScale:(double)a8 desiredFlavor:(int)a9 extensionBadge:(id)a10 wantsLowQuality:(BOOL)a11 iconVariant:(int64_t)a12
{
  double height;
  double width;
  id v18;
  CGDataProvider *v19;
  CGImage *v20;
  double v21;
  double v22;
  uint64_t v23;
  CGContext *v24;
  void *v25;
  void *v26;
  void *Data;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  dispatch_data_t subrange;
  const CGPath *v45;
  const CGPath *v46;
  NSObject *v47;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  height = a7.height;
  width = a7.width;
  v18 = a4;
  v19 = CGDataProviderCreateWithCFData((CFDataRef)a3);
  v20 = CGImageCreate(objc_msgSend(v18, "width"), objc_msgSend(v18, "height"), objc_msgSend(v18, "bitsPerComponent"), objc_msgSend(v18, "bitsPerPixel"), objc_msgSend(v18, "bytesPerRow"), (CGColorSpaceRef)objc_msgSend(v18, "colorSpace"), objc_msgSend(v18, "bitmapInfo"), v19, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v19);
  if (!v20)
  {
    _log_2();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[QLPreviewThumbnailGenerator generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);

    goto LABEL_13;
  }
  v21 = (double)(unint64_t)objc_msgSend(v18, "width") / a8;
  v22 = (double)(unint64_t)objc_msgSend(v18, "height") / a8;
  CGColorSpaceIsWideGamutRGB((CGColorSpaceRef)objc_msgSend(v18, "colorSpace"));
  v23 = QLTCreateCGContext();
  if (!v23)
  {
    _log_2();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      +[QLPreviewThumbnailGenerator generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:].cold.2(v36, v37, v38, v39, v40, v41, v42, v43);

    CGImageRelease(v20);
LABEL_13:
    subrange = 0;
    goto LABEL_16;
  }
  v24 = (CGContext *)v23;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32A0]), "initWithBitmapContext:", v23);
  v26 = v25;
  if (a5)
    *a5 = objc_retainAutorelease(v25);
  Data = CGBitmapContextGetData(v24);
  CGContextScaleCTM(v24, a8, a8);
  objc_msgSend(a1, "cornerRadiusForSize:", width, height);
  if (a12 == 2)
  {
    CGContextSetRGBFillColor(v24, 1.0, 1.0, 1.0, 1.0);
    v49.origin.x = 0.0;
    v49.origin.y = 0.0;
    v49.size.width = v21;
    v49.size.height = v22;
    CGContextFillRect(v24, v49);
    v50.origin.x = 0.0;
    v50.origin.y = 0.0;
    v50.size.width = v21;
    v50.size.height = v22;
    CGContextDrawImage(v24, v50, v20);
  }
  else
  {
    v51.origin.x = 0.0;
    v51.origin.y = 0.0;
    v51.size.width = v21;
    v51.size.height = v22;
    CGRectInset(v51, 1.0, 1.0);
    v45 = (const CGPath *)CGPathCreateWithContinuousRoundedRect();
    CGContextAddPath(v24, v45);
    CGContextSaveGState(v24);
    CGContextClip(v24);
    CGPathRelease(v45);
    CGContextSetRGBFillColor(v24, 1.0, 1.0, 1.0, 1.0);
    v52.origin.x = 0.0;
    v52.origin.y = 0.0;
    v52.size.width = v21;
    v52.size.height = v22;
    CGContextFillRect(v24, v52);
    v53.origin.x = 0.0;
    v53.origin.y = 0.0;
    v53.size.width = v21;
    v53.size.height = v22;
    CGContextDrawImage(v24, v53, v20);
    CGContextRestoreGState(v24);
    v54.origin.x = 0.0;
    v54.origin.y = 0.0;
    v54.size.width = v21;
    v54.size.height = v22;
    CGRectInset(v54, 0.5, 0.5);
    v46 = (const CGPath *)CGPathCreateWithContinuousRoundedRect();
    CGContextBeginPath(v24);
    CGContextAddPath(v24, v46);
    CGContextSetRGBStrokeColor(v24, 0.0, 0.0, 0.0, 0.121568627);
    CGContextStrokePath(v24);
    CGPathRelease(v46);
  }
  v47 = dispatch_data_create(Data, 0, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE8]);
  CGContextRelease(v24);
  CGImageRelease(v20);
  subrange = dispatch_data_create_subrange(v47, 0, objc_msgSend(v26, "height") * objc_msgSend(v26, "bytesPerRow"));

LABEL_16:
  return subrange;
}

- (void)generateWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__QLPreviewThumbnailGenerator_generateWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E99D32C8;
  v7 = v4;
  v5 = v4;
  -[QLPreviewThumbnailGenerator generateWithWillStartBlock:completionBlock:](self, "generateWithWillStartBlock:completionBlock:", 0, v6);

}

uint64_t __59__QLPreviewThumbnailGenerator_generateWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__QLPreviewThumbnailGenerator_generateThumbnailWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E99D2C58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[QLPreviewThumbnailGenerator generateWithWillStartBlock:completionBlock:](self, "generateWithWillStartBlock:completionBlock:", 0, v6);

}

void __70__QLPreviewThumbnailGenerator_generateThumbnailWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "thumbnailImages");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v5, v4);

}

- (void)cancel
{
  QLThumbnailExtensionGenerator *extensionGenerator;

  -[QLPreviewThumbnailGenerator setStatus:](self, "setStatus:", 3);
  extensionGenerator = self->_extensionGenerator;
  if (extensionGenerator)
    -[QLThumbnailExtensionGenerator cancel](extensionGenerator, "cancel");
}

- (void)_replyWithImages:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[QLPreviewThumbnailGenerator item](self, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _log_2();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v13)
    {
      v14 = objc_msgSend(v8, "count");
      objc_msgSend(v8, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      v33 = 2112;
      v34 = v11;
      _os_log_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_INFO, "QLPreviewThumbnailGenerator did generate %lu images: %@ for item: %@.", buf, 0x20u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__QLPreviewThumbnailGenerator__replyWithImages_error_completionHandler___block_invoke_11;
    block[3] = &unk_1E99D35A0;
    block[4] = self;
    v25 = v10;
    v22 = v8;
    v23 = v9;
    v24 = v11;
    v16 = v9;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v18 = v22;
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412546;
      v30 = (uint64_t)v11;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_INFO, "QLPreviewThumbnailGenerator did not generate an image for item: %@. Error: %@", buf, 0x16u);
    }

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __72__QLPreviewThumbnailGenerator__replyWithImages_error_completionHandler___block_invoke;
    v26[3] = &unk_1E99D3578;
    v27 = v9;
    v28 = v10;
    v19 = v9;
    v20 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v26);

    v18 = v28;
  }

}

uint64_t __72__QLPreviewThumbnailGenerator__replyWithImages_error_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__QLPreviewThumbnailGenerator__replyWithImages_error_completionHandler___block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 3)
  {
    _log_2();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 56);
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1D54AE000, v2, OS_LOG_TYPE_INFO, "Cancelled during generation for %@", (uint8_t *)&v6, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CD32D0], "errorWithCode:request:additionalUserInfo:", 5, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setThumbnailImages:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", 2);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }
}

- (CGContext)_beginContext
{
  void *v3;
  CGContext *v4;

  -[QLTGeneratorThumbnailRequest request](self->_request, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v4 = -[QLPreviewThumbnailGenerator _beginContextWithSize:](self, "_beginContextWithSize:");

  return v4;
}

- (CGContext)_beginContextWithSize:(CGSize)a3
{
  void *v3;
  CGContext *v4;

  -[QLTGeneratorThumbnailRequest request](self->_request, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v4 = (CGContext *)QLTCreateCGContext();

  return v4;
}

- (CGContext)_beginContextWithSize:(CGSize)a3 scale:(double)a4
{
  return (CGContext *)QLTCreateCGContext();
}

- (void)_createThumbnailForPDF:(id)a3
{
  id v4;
  void *v5;
  QLThumbnailItem **p_item;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  QLPreviewThumbnailGenerator *v26;
  id v27;
  id v28;
  id v29;

  v4 = a3;
  -[QLTGeneratorThumbnailRequest request](self->_request, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_item = &self->_item;
  -[QLThumbnailItem data](self->_item, "data");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = 0;
    v10 = 0;
LABEL_3:
    objc_msgSend(MEMORY[0x1E0C9D8B8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke;
    v24[3] = &unk_1E99D35F0;
    v10 = v10;
    v25 = v10;
    v26 = self;
    v28 = v4;
    v27 = v5;
    objc_msgSend(v11, "newRemotePDFDocumentWithData:completion:", v8, v24);

    v12 = v25;
    goto LABEL_20;
  }
  -[QLThumbnailItem urlWrapper](*p_item, "urlWrapper");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13 = (void *)MEMORY[0x1E0CB34D0];
    -[QLThumbnailItem fileURL](*p_item, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleWithURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[QLThumbnailItem fileURL](*p_item, "fileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v16, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByDeletingPathExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "URLForResource:withExtension:", v19, CFSTR("pdf"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        CFRetain(v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }

    }
    if (objc_msgSend(v17, "startAccessingSecurityScopedResource"))
      v10 = v17;
    else
      v10 = 0;
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v17, 1, &v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;

    if (v8)
      goto LABEL_3;
  }
  else
  {
    v9 = 0;
  }
  _log_2();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[QLPreviewThumbnailGenerator _createThumbnailForPDF:].cold.1((id *)&self->_item, (uint64_t)v9, v22);

  v23 = (void *)objc_opt_new();
  v8 = v23;
  if (v9)
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD3368], 0, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewThumbnailGenerator _replyWithImages:error:completionHandler:](self, "_replyWithImages:error:completionHandler:", 0, v12, v4);
LABEL_20:

}

void __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "size");
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 48), "scale");
    v12 = v11;
    v13 = *(void **)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_18;
    v19[3] = &unk_1E99D35C8;
    v14 = v5;
    v24 = v8;
    v25 = v10;
    v15 = *(_QWORD *)(a1 + 40);
    v20 = v14;
    v21 = v15;
    v26 = v12;
    v23 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v13, "_drawRemotePDFPage:atIndex:completionHandler:", v14, 0, v19);

    v16 = v20;
  }
  else
  {
    _log_2();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_cold_1();

    v18 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD3368], 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_replyWithImages:error:completionHandler:", 0, v16, *(_QWORD *)(a1 + 56));
  }

}

void __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_18(uint64_t a1, CGImage *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  NSObject *v11;
  double v12;
  CGContext *v13;
  CGImage *Image;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0D835D8];
    objc_msgSend(*(id *)(a1 + 48), "scale");
    objc_msgSend(v6, "imageWithCGImage:scale:orientation:", a2, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(a2);
    v8 = *(void **)(a1 + 40);
    v16 = v7;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = &v16;
LABEL_11:
    objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_replyWithImages:error:completionHandler:", v15, 0, *(_QWORD *)(a1 + 56));

    goto LABEL_12;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isUnlocked") & 1) == 0)
  {
    QLAdaptSizeInSize();
    v13 = (CGContext *)objc_msgSend(*(id *)(a1 + 40), "_beginContextWithSize:", v12);
    QLDrawLockIcon();
    Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    if (Image)
    {
      objc_msgSend(MEMORY[0x1E0D835D8], "imageWithCGImage:scale:orientation:", Image, 1, *(double *)(a1 + 80));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(Image);
    }
    else
    {
      v7 = 0;
    }
    v8 = *(void **)(a1 + 40);
    v17[0] = v7;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = (void **)v17;
    goto LABEL_11;
  }
  _log_2();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_18_cold_1();

  objc_msgSend(MEMORY[0x1E0CD32D0], "errorWithCode:request:additionalUserInfo:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_replyWithImages:error:completionHandler:", 0, v7, *(_QWORD *)(a1 + 56));
LABEL_12:

}

- (double)_minimumDimensionForPDFPageRect:(CGRect)a3 requestThumbnailSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;

  height = a4.height;
  width = a4.width;
  QLGetDrawRectFromPageRectWithMinimumDimension();
  if (v8 >= v9)
    v10 = v8;
  else
    v10 = v9;
  if (v8 >= v9)
    v11 = v9;
  else
    v11 = v8;
  if (v10 / v11 < 5.0)
    return 0.0;
  if (width >= height)
    v13 = height;
  else
    v13 = width;
  return ceil(v13 * 0.5 * a5);
}

- (void)_drawRemotePDFPage:(id)a3 atIndex:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  QLTGeneratorThumbnailRequest *request;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  double v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  _QWORD v55[6];
  _QWORD v56[7];

  v56[6] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  request = self->_request;
  v10 = a3;
  -[QLTGeneratorThumbnailRequest request](request, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sync_pageAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "size");
    objc_msgSend(v11, "scale");
    objc_msgSend(v11, "size");
    objc_msgSend(v11, "scale");
    objc_msgSend(v11, "minimumDimension");
    v14 = v13;
    objc_msgSend(v11, "scale");
    v16 = v14 * v15;
    QLGetCGPDFPageProxyRect();
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    if (v16 == 0.0)
    {
      objc_msgSend(v11, "size");
      v26 = v25;
      v28 = v27;
      objc_msgSend(v11, "scale");
      -[QLPreviewThumbnailGenerator _minimumDimensionForPDFPageRect:requestThumbnailSize:scale:](self, "_minimumDimensionForPDFPageRect:requestThumbnailSize:scale:", v18, v20, v22, v24, v26, v28, v29);
      v16 = v30;
    }
    QLGetDrawRectFromPageRectWithMinimumDimension();
    v51 = v31;
    v33 = v32;
    QLGetCGPDFPageProxyRect();
    v35 = v34;
    v37 = v36;
    QLGetDrawRectFromPageRectWithMinimumDimension();
    QLAdaptSizeToRectWithRounding2();
    v38 = MEMORY[0x1E0C9AAB0];
    v39 = *MEMORY[0x1E0C9DA50];
    v55[0] = *MEMORY[0x1E0C9DA58];
    v55[1] = v39;
    v56[0] = MEMORY[0x1E0C9AAB0];
    v56[1] = MEMORY[0x1E0C9AAB0];
    v40 = *MEMORY[0x1E0C9DA48];
    v56[2] = MEMORY[0x1E0C9AAB0];
    v41 = *MEMORY[0x1E0C9DA68];
    v55[2] = v40;
    v55[3] = v41;
    v54[0] = v42;
    *(double *)&v54[1] = v35 + v37 - v43;
    v54[2] = v44;
    *(double *)&v54[3] = v43;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v54, "{CGRect={CGPoint=dd}{CGSize=dd}}", *(_QWORD *)&v16);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *MEMORY[0x1E0C9DA70];
    v56[3] = v45;
    v56[4] = v38;
    v47 = *MEMORY[0x1E0C9DA60];
    v55[4] = v46;
    v55[5] = v47;
    v56[5] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __76__QLPreviewThumbnailGenerator__drawRemotePDFPage_atIndex_completionHandler___block_invoke;
    v52[3] = &unk_1E99D3618;
    v53 = v8;
    objc_msgSend(v12, "drawWithBox:size:colorSpace:options:completion:", 1, 0, v48, v52, v51, v33);

    v49 = v53;
  }
  else
  {
    _log_2();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[QLPreviewThumbnailGenerator _drawRemotePDFPage:atIndex:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD3368], 0, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, double, double))v8 + 2))(v8, 0, v49, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }

}

void __76__QLPreviewThumbnailGenerator__drawRemotePDFPage_atIndex_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  __n128 v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  __n128 v11;
  __n128 v12;
  id v13;

  v5 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  if (a3)
  {
    v9 = objc_msgSend(v5, "createImageWithData:", a3);
    v10 = (double)(unint64_t)objc_msgSend(v13, "width");
    v11.n128_f64[0] = (double)(unint64_t)objc_msgSend(v13, "height");
    v12.n128_f64[0] = v10;
    (*(void (**)(uint64_t, uint64_t, _QWORD, __n128, __n128))(v8 + 16))(v8, v9, 0, v12, v11);
  }
  else
  {
    v6.n128_u64[0] = *MEMORY[0x1E0C9D820];
    v7.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
    (*(void (**)(uint64_t, _QWORD, _QWORD, __n128, __n128))(v8 + 16))(v8, 0, 0, v6, v7);
  }

}

- (void)_generateThumbnailFromExtensionAndReplyWith:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  QLThumbnailExtensionGenerator *v12;
  QLThumbnailExtensionGenerator *extensionGenerator;
  QLThumbnailExtensionGenerator *v14;
  QLTGeneratorThumbnailRequest *request;
  QLThumbnailItem *item;
  _BOOL8 wantsLowQuality;
  id v18;
  _QWORD v19[5];
  id v20;
  os_signpost_id_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[QLTGeneratorThumbnailRequest request](self->_request, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _log_2();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  _log_2();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    objc_msgSend(v5, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D54AE000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "quicklook.thumbnail.extensionGeneration", "fileURL : %@ UUID: %@", buf, 0x16u);

  }
  v12 = (QLThumbnailExtensionGenerator *)objc_opt_new();
  extensionGenerator = self->_extensionGenerator;
  self->_extensionGenerator = v12;

  v14 = self->_extensionGenerator;
  request = self->_request;
  item = self->_item;
  wantsLowQuality = self->_wantsLowQuality;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__QLPreviewThumbnailGenerator__generateThumbnailFromExtensionAndReplyWith___block_invoke;
  v19[3] = &unk_1E99D3640;
  v19[4] = self;
  v20 = v4;
  v21 = v7;
  v18 = v4;
  -[QLThumbnailExtensionGenerator generateThumbnailWithThumbnailRequest:item:flavor:wantsLowQuality:generationData:completionHandler:](v14, "generateThumbnailWithThumbnailRequest:item:flavor:wantsLowQuality:generationData:completionHandler:", request, item, 0, wantsLowQuality, 0, v19);

}

void __75__QLPreviewThumbnailGenerator__generateThumbnailFromExtensionAndReplyWith___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setResultIsLowQuality:", objc_msgSend(v6, "isLowQuality"));
    objc_msgSend(*(id *)(a1 + 32), "setGeneratedProperties:", v6);
    objc_msgSend(*(id *)(a1 + 32), "_replyWithImages:error:completionHandler:", v5, 0, *(_QWORD *)(a1 + 40));
    _log_2();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 48);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D54AE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "quicklook.thumbnail.extensionGeneration", ", v12, 2u);
    }

  }
  else
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD3368], 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_replyWithImages:error:completionHandler:", 0, v11, *(_QWORD *)(a1 + 40));

  }
}

- (OS_dispatch_queue)generationQueue
{
  return self->_generationQueue;
}

- (int)flavor
{
  return self->_flavor;
}

- (void)setFlavor:(int)a3
{
  self->_flavor = a3;
}

- (void)setResultIsLowQuality:(BOOL)a3
{
  self->_resultIsLowQuality = a3;
}

- (BOOL)wantsLowQuality
{
  return self->_wantsLowQuality;
}

- (void)setWantsLowQuality:(BOOL)a3
{
  self->_wantsLowQuality = a3;
}

- (QLThumbnailMetadata)generatedProperties
{
  return (QLThumbnailMetadata *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGeneratedProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (QLTGeneratorThumbnailRequest)request
{
  return (QLTGeneratorThumbnailRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)thumbnailImages
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setThumbnailImages:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)extensionBadge
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExtensionBadge:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (CGRect)contentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_contentRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_contentRect, &v3, 32, 1, 0);
}

- (BOOL)resultHasIconModeApplied
{
  return self->_resultHasIconModeApplied;
}

- (void)setResultHasIconModeApplied:(BOOL)a3
{
  self->_resultHasIconModeApplied = a3;
}

- (unint64_t)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void)setSandboxExtension:(unint64_t)a3
{
  self->_sandboxExtension = a3;
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (QLThumbnailExtensionGenerator)extensionGenerator
{
  return (QLThumbnailExtensionGenerator *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExtensionGenerator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

+ (void)generateIconDataFromThumbnailData:(uint64_t)a3 inputFormat:(uint64_t)a4 outputFormat:(uint64_t)a5 outputContentRect:(uint64_t)a6 desiredSize:(uint64_t)a7 desiredScale:(uint64_t)a8 desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D54AE000, a1, a3, "Could not create image from data passed to generateIconDataFromThumbnailData", a5, a6, a7, a8, 0);
}

+ (void)generateIconDataFromThumbnailData:(uint64_t)a3 inputFormat:(uint64_t)a4 outputFormat:(uint64_t)a5 outputContentRect:(uint64_t)a6 desiredSize:(uint64_t)a7 desiredScale:(uint64_t)a8 desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D54AE000, a1, a3, "Could not create a new context to draw the icon in", a5, a6, a7, a8, 0);
}

- (void)_createThumbnailForPDF:(NSObject *)a3 .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "urlWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1D54AE000, a3, OS_LOG_TYPE_ERROR, "_createThumbnailForPDF failed : cannot load data from %@, error: %@", v6, 0x16u);

}

void __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "_createThumbnailForPDF failed : could not create PDF document proxy, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __54__QLPreviewThumbnailGenerator__createThumbnailForPDF___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "_createThumbnailForPDF failed : could not draw PDF page (error: %@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_drawRemotePDFPage:atIndex:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "_createThumbnailForPDF failed : could not get page at index %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
