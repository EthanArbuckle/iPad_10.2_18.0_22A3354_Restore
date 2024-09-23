@implementation PXSyntheticUIMediaProvider

- (PXSyntheticUIMediaProvider)init
{
  PXSyntheticUIMediaProvider *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSCache *v10;
  NSCache *imageCache;
  NSCache *v12;
  NSCache *urlCache;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXSyntheticUIMediaProvider;
  v2 = -[PXSyntheticUIMediaProvider init](&v15, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v5, v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v10;

    -[NSCache setCountLimit:](v2->_imageCache, "setCountLimit:", 100);
    v12 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    urlCache = v2->_urlCache;
    v2->_urlCache = v12;

    -[NSCache setCountLimit:](v2->_urlCache, "setCountLimit:", 100);
  }
  return v2;
}

- (id)_imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 outInfo:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  UIImage *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGImage *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  id v38;
  void *v39;
  id *v40;
  id v41;
  _QWORD v42[4];
  id v43;

  v10 = a3;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSyntheticUIMediaProvider imageCache](self, "imageCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v10, "size");
    v17 = v16;
    v19 = v18;
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __84__PXSyntheticUIMediaProvider__imageForAsset_targetSize_contentMode_options_outInfo___block_invoke;
    v42[3] = &unk_2514D08E0;
    v43 = v10;
    v20 = PXCreateCGImageWithDrawBlock(0, 0, v42, v17, v19);
    v15 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCGImage:", v20);
    CGImageRelease(v20);
    -[PXSyntheticUIMediaProvider imageCache](self, "imageCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v15, v13);

  }
  v22 = objc_msgSend(v11, "loadingMode");
  if (a7 && v22 == 0x10000)
  {
    -[PXSyntheticUIMediaProvider urlCache](self, "urlCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 && (objc_msgSend(v24, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    {
      v25 = v24;
LABEL_14:
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("PHImageFileURLKey"));

      goto LABEL_15;
    }
    v38 = v11;
    v40 = a7;
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@.jpg"), v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)v28;
    objc_msgSend(v30, "stringByAppendingPathComponent:", v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fileURLWithPath:", v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    UIImageJPEGRepresentation(v15, 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v41 = 0;
      v34 = objc_msgSend(v32, "writeToURL:options:error:", v25, 0, &v41);
      v35 = v41;
      v11 = v38;
      if (v34)
      {
        -[PXSyntheticUIMediaProvider urlCache](self, "urlCache");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKey:", v25, v13);
LABEL_13:
        a7 = v40;

        goto LABEL_14;
      }
    }
    else
    {
      v35 = 0;
      v11 = v38;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXErrorDomain"), -1, v35, CFSTR("Failed to get a URL for a synthetic image"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v36, CFSTR("PHImageErrorKey"));
    goto LABEL_13;
  }
LABEL_15:
  if (v15)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("PHImageResultIsDegradedKey"));
  if (a7)
    *a7 = objc_retainAutorelease(v12);

  return v15;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BDBCE50];
  v7 = a5;
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, const __CFString *, _QWORD, _QWORD))a5 + 2))(v7, v8, CFSTR("dummy"), 0, 0);

  return 0;
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  return 0;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void (**v15)(id, id, _QWORD);
  id v16;
  int64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  void (**v28)(id, id, _QWORD);
  double v29;
  double v30;
  int64_t v31;
  uint64_t v32;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(id, id, _QWORD))a7;
  if (objc_msgSend(v14, "isSynchronous"))
  {
    v32 = 0;
    -[PXSyntheticUIMediaProvider _imageForAsset:targetSize:contentMode:options:outInfo:](self, "_imageForAsset:targetSize:contentMode:options:outInfo:", v13, a5, v14, &v32, width, height);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v16, v32);
    v17 = 0;
  }
  else
  {
    objc_msgSend(v14, "resultHandlerQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      v20 = (id)MEMORY[0x24BDAC9B8];
      v21 = MEMORY[0x24BDAC9B8];
    }

    -[PXSyntheticUIMediaProvider queue](self, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__PXSyntheticUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
    block[3] = &unk_2514D0948;
    block[4] = self;
    v25 = v13;
    v29 = width;
    v30 = height;
    v31 = a5;
    v26 = v14;
    v27 = v20;
    v28 = v15;
    v16 = v20;
    dispatch_async(v22, block);

    v17 = 1;
  }

  return v17;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (NSCache)urlCache
{
  return self->_urlCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __96__PXSyntheticUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 88);
  v16 = 0;
  objc_msgSend(v2, "_imageForAsset:targetSize:contentMode:options:outInfo:", v3, v5, v4, &v16, *(double *)(a1 + 72), *(double *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__PXSyntheticUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
  v12[3] = &unk_2514D0920;
  v8 = *(NSObject **)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v14 = v7;
  v15 = v9;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_async(v8, v12);

}

uint64_t __96__PXSyntheticUIMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __84__PXSyntheticUIMediaProvider__imageForAsset_targetSize_contentMode_options_outInfo___block_invoke(uint64_t a1, CGContextRef context, CGFloat a3, CGFloat a4, double a5, double a6)
{
  double v12;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsEmpty;
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
  id v29;
  void *v30;
  CGColorSpace *DeviceRGB;
  id v32;
  CGGradient *v33;
  CGFloat v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  CGPoint v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v55[2] = *MEMORY[0x24BDAC8D0];
  UIGraphicsPushContext(context);
  CGContextTranslateCTM(context, 0.0, a6);
  CGContextScaleCTM(context, 1.0, -1.0);
  if (a5 >= a6)
    v12 = a6;
  else
    v12 = a5;
  v52 = v12;
  objc_msgSend(*(id *)(a1 + 32), "preferredCropRect");
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;
  IsEmpty = CGRectIsEmpty(v57);
  v18 = 1.0;
  if (IsEmpty)
    v19 = 1.0;
  else
    v19 = height;
  if (!IsEmpty)
    v18 = width;
  v20 = 0.0;
  if (IsEmpty)
    v21 = 0.0;
  else
    v21 = y;
  if (!IsEmpty)
    v20 = x;
  v51 = a3 + v20 * a5;
  v22 = a4 + v21 * a6;
  v23 = v18 * a5;
  v24 = v19 * a6;
  objc_msgSend(*(id *)(a1 + 32), "acceptableCropRect");
  v49 = v26;
  v50 = v25;
  v47 = v28;
  v48 = v27;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(context, (CGColorRef)objc_msgSend(v29, "CGColor"));
  v58.origin.x = a3;
  v58.origin.y = a4;
  v58.size.width = a5;
  v58.size.height = a6;
  CGContextFillRect(context, v58);
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v55[0] = objc_msgSend(objc_retainAutorelease(v29), "CGColor");
    objc_msgSend(v30, "colorWithAlphaComponent:", 0.75);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v55[1] = objc_msgSend(v32, "CGColor");
    v33 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2), 0);

    CGColorSpaceRelease(DeviceRGB);
    v46 = v22;
    v34 = hypot(a5, a6) * 0.5;
    v56.x = a3 + a5 * 0.5;
    v56.y = a4 + a6 * 0.5;
    CGContextDrawRadialGradient(context, v33, v56, 0.0, v56, v34, 3u);
    CGGradientRelease(v33);
    CGContextSetStrokeColorWithColor(context, (CGColorRef)objc_msgSend(objc_retainAutorelease(v30), "CGColor"));
    v59.origin.x = v51;
    v59.origin.y = v22;
    v59.size.width = v23;
    v59.size.height = v24;
    CGContextStrokeRectWithWidth(context, v59, v52 * 0.01);
    v60.origin.y = v49;
    v60.origin.x = v50;
    v60.size.height = v47;
    v60.size.width = v48;
    if (!CGRectIsNull(v60))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "orangeColor");
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(context, (CGColorRef)objc_msgSend(v35, "CGColor"));

      v61.origin.x = a3 + v50 * a5;
      v61.origin.y = a4 + v49 * a6;
      v61.size.width = v48 * a5;
      v61.size.height = v47 * a6;
      CGContextStrokeRectWithWidth(context, v61, v52 * 0.01);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "label", *(_QWORD *)&v46);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "length"))
  {
    v37 = objc_alloc_init(MEMORY[0x24BEBB490]);
    objc_msgSend(v37, "setLineBreakMode:", 4);
    objc_msgSend(v37, "setAlignment:", 1);
    v53[0] = *MEMORY[0x24BEBB360];
    objc_msgSend(MEMORY[0x24BEBB520], "monospacedSystemFontOfSize:weight:", v52 * 0.2, *MEMORY[0x24BEBB610]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v38;
    v53[1] = *MEMORY[0x24BEBB368];
    v39 = v30;
    if (!v30)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v53[2] = *MEMORY[0x24BEBB3A8];
    v54[1] = v39;
    v54[2] = v37;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)

    v41 = v22 + v24 * 0.5;
    objc_msgSend(v36, "sizeWithAttributes:", v40);
    if (v42 >= v23)
      v44 = v23;
    else
      v44 = v42;
    if (v43 >= v24)
      v45 = v24;
    else
      v45 = v43;
    objc_msgSend(v36, "drawInRect:withAttributes:", v40, v51 + v23 * 0.5 + v44 * -0.5, v41 + v45 * -0.5);

  }
  UIGraphicsPopContext();

}

@end
