@implementation UIImage

uint64_t __43__UIImage_Utilities__ic_decodeInBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
}

void __53__UIImage_Utilities__ic_symbolsNeedingPrivateCatalog__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("quicknote"), CFSTR("calculator"), CFSTR("calculator.fill"), CFSTR("apple.math.notes"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ic_symbolsNeedingPrivateCatalog_symbolsNeedingPrivateCatalog;
  ic_symbolsNeedingPrivateCatalog_symbolsNeedingPrivateCatalog = v0;

}

uint64_t __51__UIImage_Utilities__ic_scaledImageWithSize_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __46__UIImage_Utilities__ic_symbolsNeedingUIAsset__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("thumbnailbar.rectangle"), CFSTR("generative.playground"), CFSTR("math.operators"), CFSTR("surprisebox"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ic_symbolsNeedingUIAsset_symbolsNeedingUIAsset;
  ic_symbolsNeedingUIAsset_symbolsNeedingUIAsset = v0;

}

void __44__UIImage_Utilities__ic_imageWithTint_size___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 56));
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextSetBlendMode(v3, kCGBlendModeNormal);
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  CGContextFillRect(v3, *(CGRect *)(a1 + 64));
  CGContextSetBlendMode(v3, kCGBlendModeDestinationIn);
  CGContextDrawImage(v3, *(CGRect *)(a1 + 64), (CGImageRef)objc_msgSend(*(id *)(a1 + 40), "ic_CGImage"));
}

uint64_t __50__UIImage_Utilities__ic_imageWithBackgroundColor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "set");
  objc_msgSend(*(id *)(a1 + 40), "size");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "size");
  objc_msgSend(v4, "fillRect:", 0.0, 0.0, v6, v7);

  objc_msgSend(*(id *)(a1 + 40), "size");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "size");
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v9, v10, 1.0);
}

uint64_t __76__UIImage_Utilities__ic_imageCenteredWithBackgroundColor_size_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;
  const CGPath *v9;
  CGContext *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = (void *)MEMORY[0x1E0DC3508];
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = a2;
  objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v4, v5, v6);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const CGPath *)objc_msgSend(v8, "CGPath");

  CGContextAddPath((CGContextRef)objc_msgSend(v7, "CGContext"), v9);
  CGContextSetFillColorWithColor((CGContextRef)objc_msgSend(v7, "CGContext"), (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  CGContextClosePath((CGContextRef)objc_msgSend(v7, "CGContext"));
  v10 = (CGContext *)objc_msgSend(v7, "CGContext");

  CGContextFillPath(v10);
  v11 = *(void **)(a1 + 40);
  v12 = *(double *)(a1 + 48) * 0.5;
  objc_msgSend(v11, "size");
  v14 = v12 - v13 * 0.5;
  v15 = *(double *)(a1 + 56) * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "size");
  return objc_msgSend(v11, "drawAtPoint:", v14, v15 - v16 * 0.5);
}

uint64_t __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)ic_decodeWithCompletion__drawingDecodingOperationQueue;
  ic_decodeWithCompletion__drawingDecodingOperationQueue = (uint64_t)v0;

  objc_msgSend((id)ic_decodeWithCompletion__drawingDecodingOperationQueue, "setName:", CFSTR("com.apple.notes.drawing-decoding-queue"));
  return objc_msgSend((id)ic_decodeWithCompletion__drawingDecodingOperationQueue, "setMaxConcurrentOperationCount:", 2);
}

void __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "ic_decodeInBackground");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke_3;
  v5[3] = &unk_1E5C1D6F0;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __46__UIImage_Utilities__ic_decodeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
