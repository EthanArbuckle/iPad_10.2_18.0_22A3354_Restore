@implementation TSDImageResamplingOperation

- (TSDImageResamplingOperation)initWithImageProvider:(id)a3 desiredSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  uint64_t v9;
  TSDImageResamplingOperation *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  if (!a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageResamplingOperation initWithImageProvider:desiredSize:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageResamplingOperation.m"), 47, CFSTR("Invalid parameter not satisfying: %s"), "imageProvider != nil");
  }
  v12.receiver = self;
  v12.super_class = (Class)TSDImageResamplingOperation;
  v10 = -[TSDImageResamplingOperation init](&v12, sel_init);
  if (v10)
  {
    v10->mImageProvider = (TSDImageProvider *)a3;
    v10->mDesiredSize.width = width;
    v10->mDesiredSize.height = height;
  }
  return v10;
}

- (TSDImageResamplingOperation)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageResamplingOperation init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageResamplingOperation.m"), 58, CFSTR("Do not call method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSDImageResamplingOperation init]"), 0));
}

- (void)dealloc
{
  CGPath *mMaskingPath;
  objc_super v4;

  mMaskingPath = self->mMaskingPath;
  if (mMaskingPath)
    CFRelease(mMaskingPath);
  v4.receiver = self;
  v4.super_class = (Class)TSDImageResamplingOperation;
  -[TSDImageResamplingOperation dealloc](&v4, sel_dealloc);
}

- (void)setMaskingPath:(CGPath *)a3
{
  CGPath *mMaskingPath;

  if (a3)
    CFRetain(a3);
  mMaskingPath = self->mMaskingPath;
  if (mMaskingPath)
    CFRelease(mMaskingPath);
  self->mMaskingPath = a3;
}

- (id)performResampleOperationWithResampleOptions:(unint64_t)a3 bitmapContextOptions:(unint64_t)a4
{
  char v4;
  char v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGImageSource *v30;
  CGImageSource *v31;
  CGImageSourceStatus Status;
  CGPath *v33;
  const __CFDictionary *v34;
  int v35;
  CGPath *v36;
  NSString *v38;
  __CFString *v39;
  __CFString *v40;
  NSString *v41;
  const __CFString *v42;
  const __CFString *PreferredIdentifierForTag;
  const __CFString *v44;
  int v45;
  int v46;
  const __CFString *v47;
  CGImageSource *v48;
  CGPath *v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  BOOL v61;
  float v62;
  void *v63;
  uint64_t v64;
  CGImage *ThumbnailAtIndex;
  char v66;
  char v67;
  char v68;
  CGContext *v69;
  CGContext *v70;
  CGInterpolationQuality v71;
  double v72;
  double v73;
  CGPath *v74;
  CGPath *v75;
  CFStringRef Type;
  double v77;
  int v78;
  BOOL v79;
  __CFData *v80;
  CGImageDestinationRef v81;
  CGImageDestination *v82;
  void *v83;
  uint64_t v84;
  const __CFDictionary *v85;
  const void *v86;
  CGFloat b;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v89;
  const void *Value;
  const void *v91;
  int v92;
  CGFloat v93;
  CFMutableDictionaryRef v94;
  __CFDictionary *v95;
  const void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  const void *v102;
  id v103;
  double v104;
  uint64_t v105;
  CGImage *ImageAtIndex;
  double v107;
  double v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double MinY;
  CGFloat MaxY;
  double v116;
  void *v117;
  double v118;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  char v125;
  const __CFDictionary *cf;
  _BOOL4 v127;
  CGAffineTransform transform;
  CGAffineTransform v129;
  CGAffineTransform v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;

  v4 = a4;
  v5 = a3;
  -[TSDImageProvider naturalSize](-[TSDImageResamplingOperation imageProvider](self, "imageProvider"), "naturalSize");
  v8 = v7;
  v10 = v9;
  if (-[TSDImageResamplingOperation maskingPath](self, "maskingPath"))
  {
    -[TSDBezierPath bounds](+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", -[TSDImageResamplingOperation maskingPath](self, "maskingPath")), "bounds");
    v120 = v12;
    v121 = v11;
    v14 = v13;
    v16 = v15;
    v17 = v15;
    v18 = v13;
  }
  else
  {
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v120 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v121 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v17 = v10;
    v18 = v8;
  }
  v19 = v5 & 1;
  -[TSDImageResamplingOperation desiredSize](self, "desiredSize");
  v22 = v20;
  v23 = v21;
  v123 = v17;
  v124 = v10;
  v122 = v18;
  if ((v5 & 8) == 0)
  {
    v22 = TSDFitOrFillSizeInSize(0, v18, v17, v20, v21);
    v23 = v24;
  }
  v25 = TSDCeilSize(v22);
  v27 = v26;
  if ((v5 & 1) != 0)
    v28 = 0.5;
  else
    v28 = 0.699999988;
  objc_opt_class();
  -[TSDImageResamplingOperation imageProvider](self, "imageProvider");
  v29 = (void *)TSUDynamicCast();
  if (!v29)
  {
    v36 = -[TSDImageResamplingOperation maskingPath](self, "maskingPath");
    if ((v5 & 2) == 0 && !v36)
      return -[TSDImageProvider imageData](-[TSDImageResamplingOperation imageProvider](self, "imageProvider"), "imageData");
  }
  v30 = (CGImageSource *)objc_msgSend(v29, "CGImageSource");
  v31 = v30;
  v125 = v4;
  if (!v30)
  {
    v33 = -[TSDImageResamplingOperation maskingPath](self, "maskingPath");
    v127 = 0;
    goto LABEL_19;
  }
  Status = CGImageSourceGetStatus(v30);
  v127 = Status == kCGImageStatusComplete;
  v33 = -[TSDImageResamplingOperation maskingPath](self, "maskingPath");
  if (v33 || Status)
  {
LABEL_19:
    if (v33)
    {
      cf = 0;
      v35 = 1;
      goto LABEL_23;
    }
LABEL_22:
    cf = 0;
    v35 = objc_msgSend(v29, "isOpaque") ^ 1;
    goto LABEL_23;
  }
  v34 = CGImageSourceCopyPropertiesAtIndex(v31, 0, 0);
  if (!v34)
  {
    v127 = 1;
    goto LABEL_22;
  }
  cf = v34;
  v35 = CFDictionaryGetValue(v34, (const void *)*MEMORY[0x24BDD9630]) == (const void *)*MEMORY[0x24BDBD270];
  v127 = 1;
LABEL_23:
  v38 = -[NSString stringByDeletingPathExtension](-[TSDImageResamplingOperation displayName](self, "displayName"), "stringByDeletingPathExtension");
  if (!v38 || (v39 = (__CFString *)v38, !-[NSString length](v38, "length")))
  {
    v40 = (__CFString *)objc_msgSend((id)objc_msgSend(-[TSDImageProvider imageData](-[TSDImageResamplingOperation imageProvider](self, "imageProvider"), "imageData"), "filename"), "stringByDeletingPathExtension");
    if (!v40 || (v39 = v40, !-[__CFString length](v40, "length")))
      v39 = CFSTR("image");
  }
  v41 = -[NSString pathExtension](-[TSDImageResamplingOperation displayName](self, "displayName"), "pathExtension");
  if (!v41 || (v42 = (const __CFString *)v41, !-[NSString length](v41, "length")))
    v42 = (const __CFString *)objc_msgSend((id)objc_msgSend(-[TSDImageProvider imageData](-[TSDImageResamplingOperation imageProvider](self, "imageProvider"), "imageData"), "filename"), "pathExtension");
  PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], v42, 0);
  v44 = (const __CFString *)*MEMORY[0x24BDC17C0];
  v45 = UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x24BDC17C0]);
  CFRelease(PreferredIdentifierForTag);
  if (v45)
    v46 = v35;
  else
    v46 = 1;
  if (v46)
    v47 = CFSTR("png");
  else
    v47 = CFSTR("jpg");
  v119 = -[__CFString stringByAppendingPathExtension:](v39, "stringByAppendingPathExtension:", v47);
  v48 = v31;
  if (v127)
  {
    v49 = -[TSDImageResamplingOperation maskingPath](self, "maskingPath");
    if ((v5 & 0x18) == 0 && !v49)
    {
      -[TSDImageResamplingOperation desiredSize](self, "desiredSize");
      if (v50 < v8)
      {
        -[TSDImageResamplingOperation desiredSize](self, "desiredSize");
        if (v51 < v124)
        {
          v117 = (void *)MEMORY[0x24BDBCE70];
          v52 = *MEMORY[0x24BDD9778];
          v53 = *MEMORY[0x24BDD9788];
          v54 = (void *)MEMORY[0x24BDD16E0];
          -[TSDImageResamplingOperation desiredSize](self, "desiredSize");
          v116 = v55;
          -[TSDImageResamplingOperation desiredSize](self, "desiredSize");
          v118 = v8;
          v56 = v28;
          v58 = v57;
          -[TSDImageResamplingOperation desiredSize](self, "desiredSize");
          v61 = v116 <= v58;
          v28 = v56;
          v8 = v118;
          if (v61)
            v59 = v60;
          v62 = v59;
          v63 = v54;
          v48 = v31;
          v64 = objc_msgSend(v63, "numberWithUnsignedInteger:", vcvtps_u32_f32(v62));
          ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v31, 0, (CFDictionaryRef)objc_msgSend(v117, "dictionaryWithObjectsAndKeys:", v52, MEMORY[0x24BDBD1C8], v53, v64, *MEMORY[0x24BDD9808], 0));
          if (ThumbnailAtIndex)
            goto LABEL_77;
        }
      }
    }
  }
  v66 = v125 | 2;
  if (!v35)
    v66 = v125;
  v67 = v66 | (4 * v19);
  v68 = -[TSDImageProvider imageGamut](-[TSDImageResamplingOperation imageProvider](self, "imageProvider"), "imageGamut") == 2? v67: v67 | 0x20;
  v69 = TSDBitmapContextCreate(v68, v25);
  if (!v69)
    goto LABEL_89;
  v70 = v69;
  if (v19)
    v71 = kCGInterpolationNone;
  else
    v71 = kCGInterpolationLow;
  CGContextSetInterpolationQuality(v69, v71);
  if (v35)
  {
    v25 = v22;
    v27 = v23;
  }
  if (-[TSDImageResamplingOperation maskingPath](self, "maskingPath"))
  {
    if (v14 <= 0.0)
      v72 = 1.0;
    else
      v72 = v25 / v14;
    memset(&v130.c, 0, 32);
    if (v16 <= 0.0)
      v73 = 1.0;
    else
      v73 = v27 / v16;
    *(_OWORD *)&v130.a = 0uLL;
    CGAffineTransformMakeScale(&v130, v72, v73);
    v74 = -[TSDImageResamplingOperation maskingPath](self, "maskingPath");
    v129 = v130;
    v75 = TSDCreateTransformedPath(v74, &v129);
    CGContextTranslateCTM(v70, -(v121 * v72), -(v120 * v73));
    CGContextAddPath(v70, v75);
    CGContextClip(v70);
    CGPathRelease(v75);
    v25 = v8 * v72;
    v27 = v124 * v73;
  }
  if (v48
    && ((Type = CGImageSourceGetType(v48), v122 / v25 <= v123 / v27) ? (v77 = v123 / v27) : (v77 = v122 / v25),
        objc_msgSend(v29, "isValid")
     && ((v78 = CFEqual(Type, v44), v77 >= 2.0) ? (v79 = v78 == 0) : (v79 = 1), !v79)))
  {
    if (v77 >= 8.0)
    {
      v104 = v28;
      v105 = 8;
    }
    else
    {
      v104 = v28;
      v105 = v77 >= 4.0 ? 4 : 2;
    }
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v48, 0, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v105), CFSTR("kCGImageSourceSubsampleFactor"), 0));
    v107 = TSDRectWithSize();
    v109 = v108;
    v111 = v110;
    v113 = v112;
    CGContextSaveGState(v70);
    v131.origin.x = v107;
    v131.origin.y = v109;
    v131.size.width = v111;
    v131.size.height = v113;
    MinY = CGRectGetMinY(v131);
    v132.origin.x = v107;
    v132.origin.y = v109;
    v132.size.width = v111;
    v132.size.height = v113;
    MaxY = CGRectGetMaxY(v132);
    CGContextTranslateCTM(v70, 0.0, MinY + MaxY);
    CGContextScaleCTM(v70, 1.0, -1.0);
    objc_msgSend(v29, "orientation");
    TSUImageOrientationTransform();
    CGContextConcatCTM(v70, &transform);
    v133.origin.x = v107;
    v133.origin.y = v109;
    v133.size.width = v111;
    v133.size.height = v113;
    CGContextDrawImage(v70, v133, ImageAtIndex);
    CFRelease(ImageAtIndex);
    CGContextRestoreGState(v70);
    v28 = v104;
  }
  else
  {
    -[TSDImageProvider drawImageInContext:rect:](-[TSDImageResamplingOperation imageProvider](self, "imageProvider"), "drawImageInContext:rect:", v70, TSDRectWithSize());
  }
  ThumbnailAtIndex = CGBitmapContextCreateImage(v70);
  CGContextRelease(v70);
  if (ThumbnailAtIndex)
  {
LABEL_77:
    v80 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    if (v46)
      v44 = (const __CFString *)objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
    v81 = CGImageDestinationCreateWithData(v80, v44, 1uLL, 0);
    if (v81)
    {
      v82 = v81;
      v83 = (void *)MEMORY[0x24BDBCE70];
      v84 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
      CGImageDestinationSetProperties(v82, (CFDictionaryRef)objc_msgSend(v83, "dictionaryWithObjectsAndKeys:", v84, *MEMORY[0x24BDD9220], 0));
      v130.a = 0.0;
      *(_QWORD *)&v130.b = &v130;
      *(_QWORD *)&v130.c = 0x2020000000;
      v130.d = 0.0;
      if (v127)
      {
        v85 = CGImageSourceCopyPropertiesAtIndex(v48, 0, 0);
        v86 = (const void *)*MEMORY[0x24BDD93C8];
        if (CFDictionaryContainsKey(v85, (const void *)*MEMORY[0x24BDD93C8]))
        {
          b = v130.b;
          if (!*(_QWORD *)(*(_QWORD *)&v130.b + 24))
          {
            Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            b = v130.b;
            *(_QWORD *)(*(_QWORD *)&v130.b + 24) = Mutable;
          }
          v89 = *(__CFDictionary **)(*(_QWORD *)&b + 24);
          Value = CFDictionaryGetValue(v85, v86);
          CFDictionaryAddValue(v89, v86, Value);
        }
        v91 = (const void *)*MEMORY[0x24BDD93C0];
        v92 = CFDictionaryContainsKey(v85, (const void *)*MEMORY[0x24BDD93C0]);
        v93 = v130.b;
        if (v92)
        {
          if (!*(_QWORD *)(*(_QWORD *)&v130.b + 24))
          {
            v94 = CFDictionaryCreateMutable(0, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v93 = v130.b;
            *(_QWORD *)(*(_QWORD *)&v130.b + 24) = v94;
          }
          v95 = *(__CFDictionary **)(*(_QWORD *)&v93 + 24);
          v96 = CFDictionaryGetValue(v85, v91);
          CFDictionaryAddValue(v95, v91, v96);
          v93 = v130.b;
        }
      }
      else
      {
        v85 = 0;
        v93 = COERCE_DOUBLE(&v130);
      }
      CGImageDestinationAddImage(v82, ThumbnailAtIndex, *(CFDictionaryRef *)(*(_QWORD *)&v93 + 24));
      if (v85)
        CFRelease(v85);
      v102 = *(const void **)(*(_QWORD *)&v130.b + 24);
      if (v102)
        CFRelease(v102);
      CGImageDestinationFinalize(v82);
      CFRelease(v82);
      if (-[TSDImageResamplingOperation objectContext](self, "objectContext"))
        v103 = +[TSPData dataFromNSData:filename:context:](TSPData, "dataFromNSData:filename:context:", v80, v119, -[TSDImageResamplingOperation objectContext](self, "objectContext"));
      else
        v103 = +[TSPData readOnlyDataFromNSData:filename:context:](TSPData, "readOnlyDataFromNSData:filename:context:", v80, v119, 0);
      v99 = v103;
      CFRelease(ThumbnailAtIndex);
      _Block_object_dispose(&v130, 8);
    }
    else
    {
      v100 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v101 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]");
      objc_msgSend(v100, "handleFailureInFunction:file:lineNumber:description:", v101, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageResamplingOperation.m"), 282, CFSTR("invalid nil value for '%s'"), "destination");
      v99 = 0;
    }

  }
  else
  {
LABEL_89:
    v97 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v98 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]");
    objc_msgSend(v97, "handleFailureInFunction:file:lineNumber:description:", v98, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageResamplingOperation.m"), 276, CFSTR("invalid nil value for '%s'"), "resampledImage");
    v99 = 0;
  }
  if (cf)
    CFRelease(cf);
  return v99;
}

- (TSDImageProvider)imageProvider
{
  return self->mImageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGSize)desiredSize
{
  double width;
  double height;
  CGSize result;

  width = self->mDesiredSize.width;
  height = self->mDesiredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDesiredSize:(CGSize)a3
{
  self->mDesiredSize = a3;
}

- (NSString)displayName
{
  return self->mDisplayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TSPObjectContext)objectContext
{
  return self->mObjectContext;
}

- (void)setObjectContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CGPath)maskingPath
{
  return self->mMaskingPath;
}

@end
