@implementation BCCacheImageTransformer

- (BCCacheImageTransformer)init
{
  BCCacheImageTransformer *v2;
  uint64_t v3;
  NSMutableArray *renderOperations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCCacheImageTransformer;
  v2 = -[BCCacheImageTransformer init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    renderOperations = v2->_renderOperations;
    v2->_renderOperations = (NSMutableArray *)v3;

    v2->_accessLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)_bookFilter:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (qword_30D6C8 != -1)
  {
    dispatch_once(&qword_30D6C8, &stru_28DE78);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_30D6C0, "objectForKeyedSubscript:", v4));
LABEL_6:

  return v5;
}

- (CGImage)doRestrictedProcessing:(CGImage *)a3
{
  double Width;
  double Height;

  if (!a3)
    return 0;
  Width = (double)CGImageGetWidth(a3);
  Height = (double)CGImageGetHeight(a3);
  return (CGImage *)+[BCUCoverEffects restrictedImageFrom:size:](BCUCoverEffects, "restrictedImageFrom:size:", a3, Width, Height);
}

- (void)transformSource:(id)a3 to:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void (**v20)(void);
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
  unsigned __int16 v33;
  void *v34;
  CGImage *v35;
  void *v36;
  CGImage *v37;
  double Width;
  size_t Height;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v48;
  NSObject *v49;
  void *v50;
  NSString *v51;
  void *v52;
  NSString *v53;
  void *v54;
  NSString *v55;
  void *v56;
  CGColorSpace *DeviceRGB;
  CGContext *v58;
  CGImage *Image;
  void *v60;
  void (**v61)(void);
  void (*v62)(void);
  void *v63;
  void (**v64)(void);
  size_t v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  double v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  CGSize v80;
  CGSize v81;
  CGSize v82;
  CGRect v83;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "quality");
  v12 = BCImageCacheLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v11 == 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B4A00((uint64_t)v8, (uint64_t)v9, v14);
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v73 = v8;
    v74 = 2112;
    v75 = v9;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "BCCacheImageTransformer: \nTransforming:\n %@ \ninto:\n %@", buf, 0x16u);
  }

  v15 = objc_msgSend(v9, "processingOptions");
  v16 = objc_msgSend(v9, "copy");
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    objc_msgSend(v16, "setImage:", v17);

    objc_msgSend(v16, "setQuality:", +[BICDescribedImage transformedQualityFrom:](BICDescribedImage, "transformedQualityFrom:", objc_msgSend(v8, "quality")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));

    if (v18)
    {
      v19 = mainScreenScaleFactor();
      v20 = (void (**)(void))objc_claimAutoreleasedReturnValue(+[BCCoverEffects effectIdentifierWithRTL:style:content:nightMode:](BCCoverEffects, "effectIdentifierWithRTL:style:content:nightMode:", (objc_msgSend(v9, "processingOptions") >> 7) & 1, -[BCCacheImageTransformer coverEffectStyleForImage:](self, "coverEffectStyleForImage:", v9), -[BCCacheImageTransformer coverEffectsContentForImage:](self, "coverEffectsContentForImage:", v9), (objc_msgSend(v9, "processingOptions") >> 6) & 1));
      objc_msgSend(v9, "imageSize");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v8, "imageSize");
      v26 = v25;
      objc_msgSend(v9, "imageSize");
      if (v26 < v27)
      {
        objc_msgSend(v8, "imageSize");
        v29 = v28;
        objc_msgSend(v9, "imageSize");
        if (v29 < v30 && objc_msgSend(v16, "quality") != 2)
          objc_msgSend(v16, "setQuality:", 101);
      }
      v31 = v22 / v19;
      v32 = v24 / v19;
      v33 = (unsigned __int16)objc_msgSend(v9, "processingOptions");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
      v35 = (CGImage *)objc_msgSend(v34, "CGImage");
      if ((v33 & 0x400) != 0)
        v35 = -[BCCacheImageTransformer doRestrictedProcessing:](self, "doRestrictedProcessing:", v35);

      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_620CC;
      v66[3] = &unk_28DEA0;
      v71 = v19;
      v67 = v16;
      v68 = v9;
      v69 = v8;
      v70 = v10;
      -[BCCacheImageTransformer _applyBookFilter:toImage:size:completion:](self, "_applyBookFilter:toImage:size:completion:", v20, v35, v66, v31, v32);

      goto LABEL_29;
    }
    v61 = (void (**)(void))objc_retainBlock(v10);
    v20 = v61;
    if (!v61)
      goto LABEL_29;
    v62 = v61[2];
LABEL_28:
    v62();
    goto LABEL_29;
  }
  objc_msgSend(v16, "setQuality:", +[BICDescribedImage transformedQualityFrom:](BICDescribedImage, "transformedQualityFrom:", objc_msgSend(v8, "quality")));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
  v37 = (CGImage *)objc_msgSend(v36, "CGImage");

  if (v37)
  {
    Width = (double)CGImageGetWidth(v37);
    Height = CGImageGetHeight(v37);
    objc_msgSend(v9, "imageSize");
    v41 = v40;
    objc_msgSend(v9, "imageSize");
    v43 = v42;
    objc_msgSend(v8, "imageSize");
    v45 = v43 * v44;
    objc_msgSend(v8, "imageSize");
    v47 = round(v45 / v46);
    v48 = BCImageCacheLog();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      objc_msgSend(v8, "imageSize");
      v51 = NSStringFromCGSize(v80);
      v65 = Height;
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      objc_msgSend(v9, "imageSize");
      v53 = NSStringFromCGSize(v81);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      v82.width = v41;
      v82.height = v47;
      v55 = NSStringFromCGSize(v82);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      *(_DWORD *)buf = 138413058;
      v73 = v50;
      v74 = 2112;
      v75 = v52;
      v76 = 2112;
      v77 = v54;
      v78 = 2112;
      v79 = v56;
      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "BCCacheImageTransformer: image:%@, src %@, dest %@ -> final %@", buf, 0x2Au);

      Height = v65;
    }

    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v58 = CGBitmapContextCreate(0, (unint64_t)v41, (unint64_t)v47, 8uLL, 0, DeviceRGB, 6u);
    CGContextSetInterpolationQuality(v58, kCGInterpolationHigh);
    v83.origin.x = 0.0;
    v83.origin.y = 0.0;
    v83.size.width = (double)(unint64_t)v41;
    v83.size.height = (double)(unint64_t)v47;
    CGContextDrawImage(v58, v83, v37);
    Image = CGBitmapContextCreateImage(v58);
    CGContextRelease(v58);
    CGColorSpaceRelease(DeviceRGB);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[BICImage imageWithCGImage:](BICImage, "imageWithCGImage:", Image));
    objc_msgSend(v16, "setImage:", v60);

    if (Width < (double)(unint64_t)v41
      && (double)Height < (double)(unint64_t)v47
      && objc_msgSend(v16, "quality", (double)Height) != 2)
    {
      objc_msgSend(v16, "setQuality:", 101);
    }
    CGImageRelease(Image);
  }
  else
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    objc_msgSend(v16, "setImage:", v63);

  }
  objc_msgSend(v16, "setUnknownAspectRatio:", 0);
  +[BICCacheStats logDescribedImage:withComment:](BICCacheStats, "logDescribedImage:withComment:", v16, CFSTR("CacheTransformWithProcessingOptionNone"));
  v64 = (void (**)(void))objc_retainBlock(v10);
  v20 = v64;
  if (v64)
  {
    v62 = v64[2];
    goto LABEL_28;
  }
LABEL_29:

}

- (void)_applyBookFilter:(id)a3 toImage:(CGImage *)a4 size:(CGSize)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  int v15;
  double v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  height = a5.height;
  width = a5.width;
  v11 = a6;
  v12 = objc_claimAutoreleasedReturnValue(-[BCCacheImageTransformer _bookFilter:](self, "_bookFilter:", a3));
  v13 = (void *)v12;
  if (a4 && v12)
  {
    v14 = mainScreenScaleFactor();
    v15 = TUIPriorityDefault;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_623B4;
    v23[3] = &unk_28DEC8;
    v23[4] = self;
    v24 = v11;
    LODWORD(v16) = v15;
    v17 = objc_msgSend(v13, "newOperationWithImage:size:contentsScale:priority:options:waitForCPUSynchronization:logKey:completion:", a4, 0, 1, 0, v23, width, height, v14, v16);
    objc_msgSend(v17, "start");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_62500;
    v21[3] = &unk_28B808;
    v21[4] = self;
    v22 = v17;
    v18 = v17;
    os_unfair_lock_lock(&self->_accessLock);
    sub_62500((uint64_t)v21);
    os_unfair_lock_unlock(&self->_accessLock);

  }
  else
  {
    v19 = objc_retainBlock(v11);
    v20 = v19;
    if (v19)
      (*((void (**)(id, CGImage *, _QWORD, CGFloat, CGFloat, CGFloat, CGFloat))v19 + 2))(v19, a4, 0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  }
}

- (unint64_t)coverEffectStyleForImage:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "processingOptions") & 2) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "processingOptions") & 4) != 0)
  {
    v4 = 3;
  }
  else
  {
    v4 = (objc_msgSend(v3, "processingOptions") >> 2) & 2;
  }

  return v4;
}

- (unint64_t)coverEffectsContentForImage:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "processingOptions") & 0x10) != 0)
    v4 = 2;
  else
    v4 = (objc_msgSend(v3, "processingOptions") & 0x100) == 0;

  return v4;
}

- (NSMutableArray)renderOperations
{
  return self->_renderOperations;
}

- (void)setRenderOperations:(id)a3
{
  objc_storeStrong((id *)&self->_renderOperations, a3);
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderOperations, 0);
}

@end
