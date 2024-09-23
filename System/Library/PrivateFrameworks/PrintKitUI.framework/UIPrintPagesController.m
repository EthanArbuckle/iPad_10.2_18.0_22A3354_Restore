@implementation UIPrintPagesController

- (UIPrintPagesController)initWithPrintInfo:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  UIPrintPagesController *v8;
  UIPrintPagesController *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UIPrintPagesController;
  v8 = -[UIPrintPagesController init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIPrintPagesController setPrintInfo:](v8, "setPrintInfo:", v6);
    -[UIPrintPagesController setDelegate:](v9, "setDelegate:", v7);
    v10 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[UIPrintPagesController setCachedPageSizes:](v9, "setCachedPageSizes:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[UIPrintPagesController setCachedBasePageImages:](v9, "setCachedBasePageImages:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[UIPrintPagesController setWebKitPrintingOperationsQueue:](v9, "setWebKitPrintingOperationsQueue:", v12);

    -[UIPrintPagesController webKitPrintingOperationsQueue](v9, "webKitPrintingOperationsQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaxConcurrentOperationCount:", 1);

    -[UIPrintPagesController webKitPrintingOperationsQueue](v9, "webKitPrintingOperationsQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setName:", CFSTR("com.apple.UIKit.UIPrintPreviewViewController.webKitThumbnailGenerationQueue"));

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintPagesController webKitPrintingOperationsQueue](self, "webKitPrintingOperationsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  -[UIPrintPagesController webKitThumbnailGenerationThread](self, "webKitThumbnailGenerationThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[UIPrintPagesController removeWebKitThumbnailPDF](self, "removeWebKitThumbnailPDF");
  v5.receiver = self;
  v5.super_class = (Class)UIPrintPagesController;
  -[UIPrintPagesController dealloc](&v5, sel_dealloc);
}

- (CGSize)sizeForPageNum:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPagesController cachedPageSizes](self, "cachedPageSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "CGSizeValue");
    v9 = v8;
    v11 = v10;
  }
  else
  {
    -[UIPrintPagesController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paperSizeForPageNum:", a3);
    v14 = v13;
    v16 = v15;

    if (v16 <= 0.0 || v14 <= 0.0)
    {
      v9 = *MEMORY[0x1E0C9D820];
      v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      -[UIPrintPagesController cachedPageSizes](self, "cachedPageSizes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v5);
    }
    else
    {
      v17 = v14 / v16;
      if (v14 / v16 <= 1.0)
      {
        v11 = 500.0;
        v9 = v17 * 500.0;
      }
      else
      {
        v9 = 500.0;
        v11 = 500.0 / v17;
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v9, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPagesController cachedPageSizes](self, "cachedPageSizes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v7, v5);

    }
  }

  v19 = v9;
  v20 = v11;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)baseImageForPageNum:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  CGColorSpace *DeviceRGB;
  CGContext *v20;
  void *v21;
  CGPDFPage *Page;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  CGImage *Image;
  void *v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPagesController cachedBasePageImages](self, "cachedBasePageImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[UIPrintPagesController sizeForPageNum:](self, "sizeForPageNum:", a3);
    if (v9 > 0.0)
    {
      v11 = v10;
      if (v10 > 0.0)
      {
        v12 = v9;
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "scale");
        v15 = v12 * v14;
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scale");
        v18 = v11 * v17;

        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v20 = CGBitmapContextCreate(0, vcvtpd_u64_f64(v15), vcvtpd_u64_f64(v18), 8uLL, vcvtd_n_u64_f64(ceil(v15), 2uLL), DeviceRGB, 1u);
        CGColorSpaceRelease(DeviceRGB);
        eraseCGBitmapContext(v20);
        if (-[UIPrintPagesController usingWebKitFormatter](self, "usingWebKitFormatter"))
        {
          -[UIPrintPagesController webKitThumbnailPDFURL](self, "webKitThumbnailPDFURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_enter(v21);
          if (-[UIPrintPagesController webKitThumbnailPDFDocumentRef](self, "webKitThumbnailPDFDocumentRef"))
          {
            Page = CGPDFDocumentGetPage(-[UIPrintPagesController webKitThumbnailPDFDocumentRef](self, "webKitThumbnailPDFDocumentRef"), a3);
            if (Page)
            {
              -[UIPrintPagesController delegate](self, "delegate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "paperSizeForPageNum:", a3);
              v25 = v24;
              v26 = ceil(v18);

              memset(&v31, 0, sizeof(v31));
              CGAffineTransformMakeScale(&v31, v26 / v25, v26 / v25);
              v30 = v31;
              CGContextConcatCTM(v20, &v30);
              -[UIPrintPagesController printInfo](self, "printInfo");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v23) = objc_msgSend(v27, "imagePDFAnnotations");

              if ((_DWORD)v23)
                CGContextDrawPDFPageWithAnnotations();
              else
                CGContextDrawPDFPage(v20, Page);
            }
          }
          objc_sync_exit(v21);
        }
        else
        {
          -[UIPrintPagesController delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "drawImageForPageNum:toContext:sheetSize:", a3, v20, v15, v18);
        }

        Image = CGBitmapContextCreateImage(v20);
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        CGImageRelease(Image);
        CGContextRelease(v20);
        if (v7)
        {
          -[UIPrintPagesController cachedBasePageImages](self, "cachedBasePageImages");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v7, v5);

        }
      }
    }
  }

  return v7;
}

- (id)imageForPageNum:(int64_t)a3 showingPageView:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  CGImage *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v18;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  uint32_t BitmapInfo;
  CGContext *v22;
  void *v23;
  void *v24;
  int v25;
  CGImage *Image;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  CGRect v34;

  v4 = a4;
  -[UIPrintPagesController baseImageForPageNum:](self, "baseImageForPageNum:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v13 = 0;
    goto LABEL_16;
  }
  v8 = objc_retainAutorelease(v6);
  v9 = (CGImage *)objc_msgSend(v8, "CGImage");
  objc_msgSend(v8, "size");
  v11 = v10;
  objc_msgSend(v8, "size");
  v13 = 0;
  if (v11 > 0.0)
  {
    v14 = v12;
    if (v12 > 0.0)
    {
      -[UIPrintPagesController printInfo](self, "printInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "outputType") != 2)
      {
        -[UIPrintPagesController printInfo](self, "printInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "outputType") != 3)
        {
          -[UIPrintPagesController printInfo](self, "printInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "currentPrinter");
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            -[UIPrintPagesController printInfo](self, "printInfo");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "currentPrinter");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "supportsColor");

            if ((v33 & 1) == 0)
              goto LABEL_8;
          }
          else
          {

          }
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          goto LABEL_9;
        }

      }
LABEL_8:
      DeviceRGB = CGColorSpaceCreateDeviceGray();
LABEL_9:
      v18 = DeviceRGB;
      BitsPerComponent = CGImageGetBitsPerComponent(v9);
      BytesPerRow = CGImageGetBytesPerRow(v9);
      BitmapInfo = CGImageGetBitmapInfo(v9);
      v22 = CGBitmapContextCreate(0, (unint64_t)v11, (unint64_t)v14, BitsPerComponent, BytesPerRow, v18, BitmapInfo);
      CGColorSpaceRelease(v18);
      eraseCGBitmapContext(v22);
      CGContextSaveGState(v22);
      -[UIPrintPagesController printInfo](self, "printInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "flipHorizontal") & 1) != 0)
      {
        -[UIPrintPagesController printInfo](self, "printInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "nUpActive");

        if (!v25 || v4)
        {
          CGContextTranslateCTM(v22, v11, 0.0);
          CGContextScaleCTM(v22, -1.0, 1.0);
        }
      }
      else
      {

      }
      v34.origin.x = 0.0;
      v34.origin.y = 0.0;
      v34.size.width = v11;
      v34.size.height = v14;
      CGContextDrawImage(v22, v34, v9);
      CGContextRestoreGState(v22);
      -[UIPrintPagesController drawBorderAtRect:context:](self, "drawBorderAtRect:context:", v22, 0.0, 0.0, v11, v14);
      Image = CGBitmapContextCreateImage(v22);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(Image);
      CGContextRelease(v22);
    }
  }
LABEL_16:

  return v13;
}

- (void)drawBorderAtRect:(CGRect)a3 context:(CGContext *)a4
{
  double height;
  double width;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
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
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  -[UIPrintPagesController printInfo](self, "printInfo", a3.origin.x, a3.origin.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "borderType");

  if (v9)
  {
    -[UIPrintPagesController printInfo](self, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "printPaper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paperSize");
    v13 = v12;
    v15 = v14;

    -[UIPrintPagesController printInfo](self, "printInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "printPaper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "printableRect");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v26 = v15 - (v21 + v25);
    if ((v13 <= v15 || width >= height) && (v13 >= v15 || width <= height))
    {
      v27 = v21;
      v28 = v15 - (v21 + v25);
      v26 = v13 - (v19 + v23);
      v21 = v19;
      v29 = v15;
      v15 = v13;
    }
    else
    {
      v27 = v19;
      v28 = v13 - (v19 + v23);
      v29 = v13;
    }
    v30 = height / v29;
    if (width / v15 < v30)
      v30 = width / v15;
    v31 = v21 * v30;
    v32 = v27 * v30;
    v33 = width - v26 * v30 - v21 * v30;
    v34 = height - v27 * v30 - v28 * v30;
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v35 = 0.24;
    else
      v35 = 0.5;
    CGContextSaveGState(a4);
    CGContextSetLineWidth(a4, v35);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(a4, (CGColorRef)objc_msgSend(v36, "CGColor"));

    v37.origin.x = v31;
    v37.origin.y = v32;
    v37.size.width = v33;
    v37.size.height = v34;
    v38 = CGRectInset(v37, 2.0, 2.0);
    CGContextStrokeRect(a4, v38);
    if ((unint64_t)(v9 - 3) <= 1)
    {
      v39.origin.x = v31;
      v39.origin.y = v32;
      v39.size.width = v33;
      v39.size.height = v34;
      v40 = CGRectInset(v39, 6.0, 6.0);
      CGContextStrokeRect(a4, v40);
    }
    CGContextRestoreGState(a4);
  }
}

- (void)clearPagesCache
{
  void *v3;
  id v4;

  -[UIPrintPagesController cachedPageSizes](self, "cachedPageSizes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[UIPrintPagesController cachedBasePageImages](self, "cachedBasePageImages");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)removeWebKitThumbnailPDF
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  id v11;
  id v12;

  -[UIPrintPagesController webKitThumbnailPDFURL](self, "webKitThumbnailPDFURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (-[UIPrintPagesController webKitThumbnailPDFDocumentRef](self, "webKitThumbnailPDFDocumentRef"))
  {
    CGPDFDocumentRelease(-[UIPrintPagesController webKitThumbnailPDFDocumentRef](self, "webKitThumbnailPDFDocumentRef"));
    -[UIPrintPagesController setWebKitThumbnailPDFDocumentRef:](self, "setWebKitThumbnailPDFDocumentRef:", 0);
  }
  -[UIPrintPagesController webKitThumbnailPDFURL](self, "webKitThumbnailPDFURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[UIPrintPagesController webKitThumbnailPDFURL](self, "webKitThumbnailPDFURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

    if (v8)
    {
      -[UIPrintPagesController webKitThumbnailPDFURL](self, "webKitThumbnailPDFURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v10 = objc_msgSend(v5, "removeItemAtURL:error:", v9, &v12);
      v11 = v12;

      if ((v10 & 1) == 0)
        NSLog(CFSTR("UIPrintPagesController: Removing temporary webKit thumbNail file failed:%@"), v11);

    }
    -[UIPrintPagesController setWebKitThumbnailPDFURL:](self, "setWebKitThumbnailPDFURL:", 0);

  }
  objc_sync_exit(v3);

}

- (void)createPDFForAllPages
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  const __CFURL *url;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCancelled");

  if ((v4 & 1) == 0)
  {
    -[UIPrintPagesController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createWebKitPDFForAllPages");
    url = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    if (url)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isCancelled");

      if ((v7 & 1) == 0)
      {
        -[UIPrintPagesController webKitThumbnailPDFURL](self, "webKitThumbnailPDFURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v8);
        -[UIPrintPagesController setWebKitThumbnailPDFURL:](self, "setWebKitThumbnailPDFURL:", url);
        -[UIPrintPagesController setWebKitThumbnailPDFDocumentRef:](self, "setWebKitThumbnailPDFDocumentRef:", CGPDFDocumentCreateWithURL(url));
        objc_sync_exit(v8);

        -[UIPrintPagesController clearPagesCache](self, "clearPagesCache");
      }
    }

  }
}

- (void)generateWebKitThumbnailsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  UIPrintWebKitThumbnailGenerationOperation *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  -[UIPrintPagesController setUsingWebKitFormatter:](self, "setUsingWebKitFormatter:", 1);
  -[UIPrintPagesController webKitPrintingOperationsQueue](self, "webKitPrintingOperationsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllOperations");

  -[UIPrintPagesController webKitThumbnailGenerationThread](self, "webKitThumbnailGenerationThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[UIPrintPagesController removeWebKitThumbnailPDF](self, "removeWebKitThumbnailPDF");
  -[UIPrintPagesController clearPagesCache](self, "clearPagesCache");
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__UIPrintPagesController_generateWebKitThumbnailsWithCompletionBlock___block_invoke;
  v17[3] = &unk_1E9D973A8;
  objc_copyWeak(&v19, &location);
  v8 = v4;
  v18 = v8;
  v9 = (void *)MEMORY[0x1D82A9A48](v17);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __70__UIPrintPagesController_generateWebKitThumbnailsWithCompletionBlock___block_invoke_2;
  v14[3] = &unk_1E9D973A8;
  objc_copyWeak(&v16, &location);
  v10 = v9;
  v15 = v10;
  v11 = (void *)MEMORY[0x1D82A9A48](v14);
  v12 = -[UIPrintWebKitThumbnailGenerationOperation initWithPagesController:]([UIPrintWebKitThumbnailGenerationOperation alloc], "initWithPagesController:", self);
  -[NSBlockOperation addExecutionBlock:](v12, "addExecutionBlock:", v11);
  -[UIPrintPagesController webKitPrintingOperationsQueue](self, "webKitPrintingOperationsQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __70__UIPrintPagesController_generateWebKitThumbnailsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "createPDFForAllPages");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__UIPrintPagesController_generateWebKitThumbnailsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithBlock:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setWebKitThumbnailGenerationThread:", v2);

  objc_msgSend(WeakRetained, "webKitThumbnailGenerationThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", CFSTR("com.apple.UIKit.UIPrintPreviewViewController.webKitThumbnailGenerationThread"));

  objc_msgSend(WeakRetained, "webKitThumbnailGenerationThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");

}

- (void)recalculateWebKitPageCount
{
  void *v3;
  UIPrintWebKitThumbnailGenerationOperation *v4;
  UIPrintWebKitThumbnailGenerationOperation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __52__UIPrintPagesController_recalculateWebKitPageCount__block_invoke;
  v10 = &unk_1E9D97150;
  objc_copyWeak(&v11, &location);
  v3 = (void *)MEMORY[0x1D82A9A48](&v7);
  v4 = [UIPrintWebKitThumbnailGenerationOperation alloc];
  v5 = -[UIPrintWebKitThumbnailGenerationOperation initWithPagesController:](v4, "initWithPagesController:", self, v7, v8, v9, v10);
  -[NSBlockOperation addExecutionBlock:](v5, "addExecutionBlock:", v3);
  -[UIPrintPagesController webKitPrintingOperationsQueue](self, "webKitPrintingOperationsQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__UIPrintPagesController_recalculateWebKitPageCount__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "recalculateWebKitPageCount");

}

- (UIPrintPagesControllerDelegate)delegate
{
  return (UIPrintPagesControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIPrintInfo)printInfo
{
  return (UIPrintInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrintInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSCache)cachedPageSizes
{
  return (NSCache *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedPageSizes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSCache)cachedBasePageImages
{
  return (NSCache *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedBasePageImages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)usingWebKitFormatter
{
  return self->_usingWebKitFormatter;
}

- (void)setUsingWebKitFormatter:(BOOL)a3
{
  self->_usingWebKitFormatter = a3;
}

- (NSOperationQueue)webKitPrintingOperationsQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWebKitPrintingOperationsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSThread)webKitThumbnailGenerationThread
{
  return (NSThread *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWebKitThumbnailGenerationThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSURL)webKitThumbnailPDFURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWebKitThumbnailPDFURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CGPDFDocument)webKitThumbnailPDFDocumentRef
{
  return self->_webKitThumbnailPDFDocumentRef;
}

- (void)setWebKitThumbnailPDFDocumentRef:(CGPDFDocument *)a3
{
  self->_webKitThumbnailPDFDocumentRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webKitThumbnailPDFURL, 0);
  objc_storeStrong((id *)&self->_webKitThumbnailGenerationThread, 0);
  objc_storeStrong((id *)&self->_webKitPrintingOperationsQueue, 0);
  objc_storeStrong((id *)&self->_cachedBasePageImages, 0);
  objc_storeStrong((id *)&self->_cachedPageSizes, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
