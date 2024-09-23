@implementation TSDFrameRep

- (TSDFrameRep)initWithTSDFrame:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDFrameRep *v7;
  TSDFrame *v8;
  TSDFrameSpec *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  TSDBitmapImageProvider *v20;
  objc_super v22;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep initWithTSDFrame:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 70, CFSTR("invalid nil value for '%s'"), "frame");
  }
  v22.receiver = self;
  v22.super_class = (Class)TSDFrameRep;
  v7 = -[TSDFrameRep init](&v22, sel_init);
  if (v7)
  {
    v8 = (TSDFrame *)a3;
    v7->mFrame = v8;
    v9 = -[TSDFrame frameSpec](v8, "frameSpec");
    if (!v9)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep initWithTSDFrame:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 76, CFSTR("invalid nil value for '%s'"), "frameSpec");
    }
    -[TSDFrameSpec i_addInterestInProviders](v9, "i_addInterestInProviders");
    if (-[TSDFrameSpec i_hasImages](v9, "i_hasImages"))
    {
      v12 = 0;
      v7->mImages = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      do
      {
        v13 = -[TSDFrameSpec i_providerForIndex:mask:](v9, "i_providerForIndex:mask:", v12, 0);
        if (!v13)
        {
          v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep initWithTSDFrame:]");
          objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 83, CFSTR("invalid nil value for '%s'"), "provider");
        }
        -[NSArray addObject:](v7->mImages, "addObject:", v13);
        objc_msgSend(v13, "addInterest");
        v12 = (v12 + 1);
      }
      while ((_DWORD)v12 != 8);
    }
    if (-[TSDFrameSpec i_hasMask](v9, "i_hasMask"))
    {
      v16 = 0;
      v7->mMasks = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      do
      {
        v17 = -[TSDFrameSpec i_providerForIndex:mask:](v9, "i_providerForIndex:mask:", v16, 1);
        if (!v17)
        {
          v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep initWithTSDFrame:]");
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 93, CFSTR("invalid nil value for '%s'"), "provider");
        }
        -[NSArray addObject:](v7->mMasks, "addObject:", v17);
        objc_msgSend(v17, "addInterest");
        v16 = (v16 + 1);
      }
      while ((_DWORD)v16 != 8);
    }
    if (-[TSDFrameSpec i_hasAdornment](v9, "i_hasAdornment"))
    {
      v20 = (TSDBitmapImageProvider *)-[TSDFrameSpec i_providerForIndex:mask:](v9, "i_providerForIndex:mask:", 8, 0);
      v7->mAdornment = v20;
      -[TSDImageProvider addInterest](v20, "addInterest");
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSArray makeObjectsPerformSelector:](self->mImages, "makeObjectsPerformSelector:", sel_removeInterest);
  -[NSArray makeObjectsPerformSelector:](self->mMasks, "makeObjectsPerformSelector:", sel_removeInterest);
  -[TSDImageProvider removeInterest](self->mAdornment, "removeInterest");

  -[TSDFrameSpec i_removeInterestInProviders](-[TSDFrame frameSpec](self->mFrame, "frameSpec"), "i_removeInterestInProviders");
  v3.receiver = self;
  v3.super_class = (Class)TSDFrameRep;
  -[TSDFrameRep dealloc](&v3, sel_dealloc);
}

- (id)frame
{
  return self->mFrame;
}

- (void)frameRect:(CGRect)a3 inContext:(CGContext *)a4 withTotalScale:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGImage *v20;
  CGImage *v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat MaxY;
  CGFloat MinY;
  CGImage *v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[TSDFrame i_willRenderForRect:](self->mFrame, "i_willRenderForRect:"))
  {
    -[TSDFrame coverageRectWithoutAdornment:](self->mFrame, "coverageRectWithoutAdornment:", x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    CGContextSaveGState(a4);
    if (self->mImages)
    {
      v20 = -[TSDFrameRep p_newFrameForMask:size:forCALayer:viewScale:](self, "p_newFrameForMask:size:forCALayer:viewScale:", 0, 0, v17, v19, fmax(a5, 1.0));
      if (v20)
      {
        v21 = v20;
        v29.origin.x = v13;
        v29.origin.y = v15;
        v29.size.width = v17;
        v29.size.height = v19;
        CGContextDrawImage(a4, v29, v20);
        CGImageRelease(v21);
      }
      else
      {
        -[TSDFrameRep p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:](self, "p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:", a4, self->mImages, 0, v13, v15, v17, v19, 1.0);
      }
    }
    if (self->mAdornment)
    {
      -[TSDFrame i_adornmentRectForRect:](self->mFrame, "i_adornmentRectForRect:", v13, v15, v17, v19);
      v22 = v30.origin.x;
      v23 = v30.origin.y;
      v24 = v30.size.width;
      v25 = v30.size.height;
      MaxY = CGRectGetMaxY(v30);
      CGContextTranslateCTM(a4, 0.0, MaxY);
      CGContextScaleCTM(a4, 1.0, -1.0);
      v31.origin.x = v22;
      v31.origin.y = v23;
      v31.size.width = v24;
      v31.size.height = v25;
      MinY = CGRectGetMinY(v31);
      CGContextTranslateCTM(a4, 0.0, -MinY);
      v28 = -[TSDBitmapImageProvider CGImageForSize:inContext:orLayer:](self->mAdornment, "CGImageForSize:inContext:orLayer:", a4, 0, v24, v25);
      v32.origin.x = v22;
      v32.origin.y = v23;
      v32.size.width = v24;
      v32.size.height = v25;
      CGContextDrawImage(a4, v32, v28);
    }
    CGContextRestoreGState(a4);
  }
}

- (void)applyMaskForRectWithCoverage:(CGRect)a3 toContext:(CGContext *)a4
{
  double height;
  double width;
  double y;
  double x;
  CGImage *v10;
  CGImage *v11;
  CGRect v12;

  if (self->mMasks)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    if (-[TSDFrame shouldRenderForSizeIncludingCoverage:](self->mFrame, "shouldRenderForSizeIncludingCoverage:", a3.size.width, a3.size.height))
    {
      v10 = -[TSDFrameRep p_newFrameForMask:size:forCALayer:viewScale:](self, "p_newFrameForMask:size:forCALayer:viewScale:", 1, 0, width, height, TSDCGContextAssociatedScreenScale((uint64_t)a4));
      if (v10)
      {
        v11 = v10;
        v12.origin.x = x;
        v12.origin.y = y;
        v12.size.width = width;
        v12.size.height = height;
        CGContextClipToMask(a4, v12, v10);
        CGImageRelease(v11);
      }
      else
      {
        -[TSDFrameRep p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:](self, "p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:", a4, self->mMasks, 1, x, y, width, height, 1.0);
        self->mShouldEnableBlendMode = 1;
      }
    }
  }
}

- (void)blendMaskBeforeRenderingImageInContext:(CGContext *)a3
{
  if (self->mShouldEnableBlendMode)
  {
    self->mShouldEnableBlendMode = 0;
    CGContextSetBlendMode(a3, kCGBlendModeSourceIn);
  }
}

- (id)applyToCALayer:(id)a3 withRepLayer:(id)a4 maskLayer:(id)a5 viewScale:(double)a6
{
  double v9;
  double v10;
  NSArray *mMasks;
  void *v12;
  uint64_t v13;
  int v14;
  CALayer *mMaskLayer;
  CALayer *v17;
  CALayer *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  CGColor *DeviceRGB;
  void *v23;

  if (!-[TSDFrame shouldRender](self->mFrame, "shouldRender", a3, a4, a6))
    return 0;
  objc_msgSend(a3, "contentsScale");
  v10 = v9;
  objc_msgSend(a3, "setSublayers:", 0);
  if (self->mImages)
  {
    mMasks = self->mMasks;
    if (mMasks)
    {
      if (!a5)
      {
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep applyToCALayer:withRepLayer:maskLayer:viewScale:]");
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 223, CFSTR("invalid nil value for '%s'"), "repMaskLayer");
      }
      if (self->mMaskLayer)
      {
        v14 = objc_msgSend((id)objc_msgSend(a5, "sublayers"), "containsObject:", self->mMaskLayer);
        mMaskLayer = self->mMaskLayer;
        if (v14)
        {
          -[CALayer removeFromSuperlayer](mMaskLayer, "removeFromSuperlayer");
          mMaskLayer = self->mMaskLayer;
        }
      }
      else
      {
        mMaskLayer = 0;
      }

      self->mMaskLayer = 0;
      v18 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      self->mMaskLayer = v18;
      -[CALayer setContentsScale:](v18, "setContentsScale:", v10);
      objc_msgSend(a5, "addSublayer:", self->mMaskLayer);
    }
    else
    {
      v17 = self->mMaskLayer;
      if (v17)
      {
        -[CALayer removeFromSuperlayer](v17, "removeFromSuperlayer");

        self->mMaskLayer = 0;
      }
    }
    v19 = 0;
    do
    {
      -[TSDFrameRep p_addUnreplicatedLayerForIndex:toLayer:maskLayer:](self, "p_addUnreplicatedLayerForIndex:toLayer:maskLayer:", v19, a3, self->mMaskLayer);
      -[TSDFrameRep p_addEdgeLayerForIndex:toLayer:maskLayer:](self, "p_addEdgeLayerForIndex:toLayer:maskLayer:", (v19 + 1), a3, self->mMaskLayer);
      v20 = v19 >= 5;
      v19 = (v19 + 2);
    }
    while (!v20);
    if (mMasks)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
      objc_msgSend(v21, "setBackgroundColor:", DeviceRGB);
      CGColorRelease(DeviceRGB);
      objc_msgSend(v21, "setEdgeAntialiasingMask:", 0);
      -[CALayer addSublayer:](self->mMaskLayer, "addSublayer:", v21);
    }
  }
  if (self->mAdornment)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    objc_msgSend(v23, "setContentsScale:", v10);
    objc_msgSend(v23, "setContents:", -[TSDBitmapImageProvider CGImageForNaturalSize](self->mAdornment, "CGImageForNaturalSize"));
    objc_msgSend(a3, "addSublayer:", v23);
  }
  return self->mMaskLayer;
}

- (void)updateCALayer:(id)a3 toRect:(CGRect)a4 withRepLayer:(id)a5 maskLayer:(id)a6 viewScale:(double)a7 maskLayerTransform:(CGAffineTransform *)a8
{
  double height;
  double width;
  double y;
  double x;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  TSDFrame *mFrame;
  double v22;
  double v23;
  void *v24;
  NSArray *mMasks;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSArray *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t DeviceRGB;
  CGColor *v46;
  CALayer *mMaskLayer;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v64;
  double v65;
  double v66;
  double v67;
  CALayer *v68;
  __int128 v69;
  __int128 v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  id v95;
  CGFloat v96;
  CGFloat v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  CGFloat v139;
  double v140;
  CGFloat v141;
  double v142;
  double v143;
  double v144;
  CGFloat v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  _OWORD v157[3];
  CGAffineTransform t2;
  CGAffineTransform transform;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a8->a == 0.0 && a8->b == 0.0 || a8->c == 0.0 && a8->d == 0.0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a5);
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:]");
    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m");
    v20 = *(_OWORD *)&a8->c;
    *(_OWORD *)&transform.a = *(_OWORD *)&a8->a;
    *(_OWORD *)&transform.c = v20;
    *(_OWORD *)&transform.tx = *(_OWORD *)&a8->tx;
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, v19, 270, CFSTR("bad maskLayerTransform: %@"), NSStringFromCGAffineTransform(&transform));
  }
  if (-[TSDFrame shouldRender](self->mFrame, "shouldRender"))
  {
    mFrame = self->mFrame;
    -[TSDFrame coverageRectWithoutAdornment:](mFrame, "coverageRectWithoutAdornment:", x, y, width, height);
    if (-[TSDFrame shouldRenderForSizeIncludingCoverage:](mFrame, "shouldRenderForSizeIncludingCoverage:", v22, v23))
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      v24 = (void *)objc_msgSend(a3, "sublayers");
      mMasks = self->mMasks;
      if (mMasks)
      {
        if (!self->mMaskLayer)
        {
          v26 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:]");
          objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 284, CFSTR("invalid nil value for '%s'"), "mMaskLayer");
        }
        if ((objc_msgSend((id)objc_msgSend(a6, "sublayers"), "containsObject:", self->mMaskLayer) & 1) == 0)
        {
          v28 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:]");
          objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 285, CFSTR("TSDFrameRep's mask layer is not a sublayer of the mask layer passed in"));
        }
      }
      v30 = -[TSDFrame i_willRenderForRect:](self->mFrame, "i_willRenderForRect:", x, y, width, height) ^ 1;
      if ((v30 & 1) != 0)
      {
        objc_msgSend(a3, "bounds");
        v42 = v41;
        v44 = v43;
        DeviceRGB = TSUCGColorCreateDeviceRGB();
        v46 = (CGColor *)DeviceRGB;
        if ((objc_msgSend(a3, "isHidden") & 1) != 0)
        {
LABEL_19:
          mMaskLayer = self->mMaskLayer;
          if (mMaskLayer)
          {
            if (!CGColorEqualToColor(-[CALayer backgroundColor](mMaskLayer, "backgroundColor"), v46))
              -[CALayer setBackgroundColor:](self->mMaskLayer, "setBackgroundColor:", v46);
            v48 = TSDRectWithSize();
            v50 = v49;
            v52 = v51;
            v54 = v53;
            -[CALayer bounds](self->mMaskLayer, "bounds");
            v164.origin.x = v55;
            v164.origin.y = v56;
            v164.size.width = v57;
            v164.size.height = v58;
            v160.origin.x = v48;
            v160.origin.y = v50;
            v160.size.width = v52;
            v160.size.height = v54;
            if (!CGRectEqualToRect(v160, v164))
              -[CALayer setBounds:](self->mMaskLayer, "setBounds:", v48, v50, v52, v54);
            v59 = -v42 / v52;
            v60 = -v44 / v54;
            -[CALayer anchorPoint](self->mMaskLayer, "anchorPoint");
            if (v59 != v62 || v60 != v61)
              -[CALayer setAnchorPoint:](self->mMaskLayer, "setAnchorPoint:", v59, v60);
            v64 = *MEMORY[0x24BDBEFB0];
            v65 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
            -[CALayer position](self->mMaskLayer, "position");
            if (v64 != v67 || v65 != v66)
              -[CALayer setPosition:](self->mMaskLayer, "setPosition:", v64, v65);
            v68 = self->mMaskLayer;
            if (v68)
              -[CALayer affineTransform](v68, "affineTransform");
            else
              memset(&t2, 0, sizeof(t2));
            v69 = *(_OWORD *)&a8->c;
            *(_OWORD *)&transform.a = *(_OWORD *)&a8->a;
            *(_OWORD *)&transform.c = v69;
            *(_OWORD *)&transform.tx = *(_OWORD *)&a8->tx;
            if (!CGAffineTransformEqualToTransform(&transform, &t2))
            {
              v70 = *(_OWORD *)&a8->c;
              v157[0] = *(_OWORD *)&a8->a;
              v157[1] = v70;
              v157[2] = *(_OWORD *)&a8->tx;
              -[CALayer setAffineTransform:](self->mMaskLayer, "setAffineTransform:", v157);
            }
          }
          CGColorRelease(v46);
          objc_msgSend(MEMORY[0x24BDE57D8], "commit");
          return;
        }
LABEL_18:
        objc_msgSend(a3, "setHidden:", v30);
        v46 = (CGColor *)DeviceRGB;
        goto LABEL_19;
      }
      v155 = *MEMORY[0x24BDBF090];
      v156 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v153 = x;
      -[TSDFrame coverageRectWithoutAdornment:](self->mFrame, "coverageRectWithoutAdornment:", x, y, width, height);
      v32 = v31;
      v151 = v34;
      v152 = v33;
      v154 = v35;
      v36 = TSDMultiplyRectScalar(v33, v34, v31, v35, a7);
      if (!self->mImages)
        goto LABEL_64;
      if (mMasks)
      {
        v38 = v36;
        v39 = v37;
        v40 = -[CALayer sublayers](self->mMaskLayer, "sublayers");
        v156 = v39;
        v155 = v38;
      }
      else
      {
        v40 = 0;
      }
      -[TSDFrame i_leftWidth](self->mFrame, "i_leftWidth");
      v72 = v71;
      -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
      v74 = v32 - v73;
      -[TSDFrame i_topHeight](self->mFrame, "i_topHeight");
      v76 = v75;
      -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
      v78 = v72 * a7;
      v79 = v76 * a7;
      v80 = (v154 - v77) * a7;
      if (v78 == v74 * a7)
        v81 = v78 + 1.0;
      else
        v81 = v74 * a7;
      if (v79 == v80)
        v80 = v79 + 1.0;
      v150 = v80;
      if (-[TSDFrameSpec i_tilingMode](-[TSDFrame frameSpec](self->mFrame, "frameSpec"), "i_tilingMode") == 2)
      {
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 0, v24, v40, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v78, v79);
        v82 = v81 - v78;
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 1, v24, v40, v78, 0.0, v81 - v78, v79);
        -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
        v84 = v83 * a7;
        -[TSDFrame i_topHeight](self->mFrame, "i_topHeight");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 2, v24, v40, v81, 0.0, v84, v85 * a7);
        -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 3, v24, v40, v81, v79, v86 * a7, v150 - v79);
        -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
        v88 = v87 * a7;
        -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 4, v24, v40, v81, v150, v88, v89 * a7);
        -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 5, v24, v40, v78, v150, v81 - v78, v90 * a7);
        -[TSDFrame i_leftWidth](self->mFrame, "i_leftWidth");
        v92 = v91 * a7;
        -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 6, v24, v40, 0.0, v150, v92, v93 * a7);
        -[TSDFrame i_leftWidth](self->mFrame, "i_leftWidth");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 7, v24, v40, 0.0, v79, v94 * a7, v150 - v79);
        if (mMasks)
        {
          v95 = -[NSArray objectAtIndex:](v40, "objectAtIndex:", 8);
          v96 = -1.0;
          v97 = -1.0;
          v98 = v78;
          v99 = v79;
          v100 = v82;
          v101 = v150 - v79;
          goto LABEL_62;
        }
      }
      else
      {
        -[TSDFrame assetScale](self->mFrame, "assetScale");
        v103 = v102;
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 0, v24, v40, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v78, v79);
        objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", 1), "dpiAdjustedFillSize");
        if (v104 <= 1.0)
          v105 = 1.0;
        else
          v105 = v103;
        v106 = v104 * v105 * a7;
        -[TSDFrame i_topHeight](self->mFrame, "i_topHeight");
        -[TSDFrameRep p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:](self, "p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:", 1, v24, v40, v78, 0.0, v106, v107 * a7, v78, v81);
        -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
        v109 = v108 * a7;
        -[TSDFrame i_topHeight](self->mFrame, "i_topHeight");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 2, v24, v40, v81, 0.0, v109, v110 * a7);
        objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", 3), "dpiAdjustedFillSize");
        if (v111 <= 1.0)
          v112 = 1.0;
        else
          v112 = v103;
        v113 = v111 * v112;
        -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
        -[TSDFrameRep p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:](self, "p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:", 3, v24, v40, v81, v79, v114 * a7, v113 * a7, v79, v150);
        -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
        v116 = v115 * a7;
        -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 4, v24, v40, v81, v150, v116, v117 * a7);
        objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", 5), "dpiAdjustedFillSize");
        if (v118 <= 1.0)
          v119 = 1.0;
        else
          v119 = v103;
        v120 = v118 * v119 * a7 + 1.0;
        -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
        -[TSDFrameRep p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:](self, "p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:", 5, v24, v40, v78, v150, v120, v121 * a7, v78, v81);
        -[TSDFrame i_leftWidth](self->mFrame, "i_leftWidth");
        v123 = v122 * a7;
        -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 6, v24, v40, 0.0, v150, v123, v124 * a7);
        objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", 7), "dpiAdjustedFillSize");
        if (v125 <= 1.0)
          v126 = 1.0;
        else
          v126 = v103;
        v127 = v125 * v126;
        -[TSDFrame i_leftWidth](self->mFrame, "i_leftWidth");
        -[TSDFrameRep p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:](self, "p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:", 7, v24, v40, 0.0, v79, v128 * a7, v127 * a7, v79, v150);
        if (mMasks)
        {
          v95 = -[NSArray objectAtIndex:](v40, "objectAtIndex:", 8);
          v100 = v81 - v78;
          v101 = v150 - v79;
          v96 = -1.0;
          v97 = -1.0;
          v98 = v78;
          v99 = v79;
LABEL_62:
          v161 = CGRectInset(*(CGRect *)&v98, v96, v97);
          v162 = CGRectIntegral(v161);
          v129 = v162.origin.x;
          v130 = v162.origin.y;
          v131 = v162.size.width;
          v132 = v162.size.height;
          objc_msgSend(v95, "frame");
          v165.origin.x = v129;
          v165.origin.y = v130;
          v165.size.width = v131;
          v165.size.height = v132;
          if (!CGRectEqualToRect(v163, v165))
            objc_msgSend(v95, "setFrame:", v129, v130, v131, v132);
LABEL_64:
          v42 = v155;
          goto LABEL_66;
        }
      }
      v42 = v155;
LABEL_66:
      if (self->mAdornment)
      {
        -[TSDFrame i_adornmentRectForRect:](self->mFrame, "i_adornmentRectForRect:", v152, v151, v32, v154);
        v134 = v133;
        v135 = v42;
        v137 = v136;
        v139 = v138;
        v141 = v140;
        v142 = TSDSubtractPoints(v153, y, v152);
        v143 = v137;
        v42 = v135;
        v144 = TSDAddPoints(v134, v143, v142);
        v146 = TSDMultiplyRectScalar(v144, v145, v139, v141, a7);
        objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 8 * (self->mImages != 0)), "setFrame:", v146, v147, v148, v149);
      }
      DeviceRGB = 0;
      v46 = 0;
      v44 = v156;
      if ((objc_msgSend(a3, "isHidden", v36) & 1) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
}

- (CGImage)p_newFrameForMask:(BOOL)a3 size:(CGSize)a4 forCALayer:(BOOL)a5 viewScale:(double)a6
{
  _BOOL8 v7;
  double height;
  double width;
  _BOOL8 v10;
  id v12;
  CGImage *result;
  CGImage *v14;
  CGImage *v15;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v10 = a3;
  v12 = +[TSDFrameImageCache sharedFrameImageCache](TSDFrameImageCache, "sharedFrameImageCache");
  result = (CGImage *)objc_msgSend(v12, "newCachedImageForFrame:size:viewScale:forCALayer:mask:", self->mFrame, v7, v10, width, height, a6);
  if (!result)
  {
    result = -[TSDFrameRep p_newRenderedFrameForMask:size:forCALayer:viewScale:](self, "p_newRenderedFrameForMask:size:forCALayer:viewScale:", v10, v7, width, height, a6);
    if (result)
    {
      v14 = result;
      v15 = (CGImage *)objc_msgSend(v12, "setCachedImage:forFrame:size:viewScale:forCALayer:mask:", result, self->mFrame, v7, v10, width, height, a6);
      CGImageRelease(v14);
      return v15;
    }
  }
  return result;
}

- (CGImage)p_newRenderedFrameForMask:(BOOL)a3 size:(CGSize)a4 forCALayer:(BOOL)a5 viewScale:(double)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  double v10;
  CGImage *v12;
  double v13;
  size_t v14;
  double v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t AlignedBytesPerRow;
  CGColorSpace *v20;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  uint32_t v23;
  NSArray *mImages;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  CGContext *v29;
  CGContext *v30;
  double v31;
  double v32;
  CGDataProvider *v33;
  CGContext *v34;
  CGFloat v35;
  CGFloat v36;
  CGImageRef Image;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v7 = a5;
  v8 = a3;
  v44 = *MEMORY[0x24BDAC8D0];
  if (TSDMultiplySizeScalar(a4.width, a4.height, a6) >= 4096.0 || v10 >= 4096.0)
    return 0;
  TSURound();
  v14 = (unint64_t)v13;
  TSURound();
  v16 = (unint64_t)v15;
  v17 = 16;
  if (v8)
    v17 = 24;
  v18 = *(uint64_t *)((char *)&self->super.isa + v17);
  if (v8)
  {
    AlignedBytesPerRow = TSUBitmapGetAlignedBytesPerRow();
    v20 = (CGColorSpace *)TSUDeviceGrayColorSpace();
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], AlignedBytesPerRow * v16);
    CFDataSetLength(Mutable, AlignedBytesPerRow * v16);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    v23 = 0;
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    mImages = self->mImages;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](mImages, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(mImages);
          if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "imageGamut") < 2)
          {
            AlignedBytesPerRow = TSUBitmapGetAlignedBytesPerRow();
            v20 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
            MutableBytePtr = 0;
            Mutable = 0;
            v23 = 8193;
            goto LABEL_20;
          }
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](mImages, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v26)
          continue;
        break;
      }
    }
    AlignedBytesPerRow = TSUBitmapGetAlignedBytesPerRow();
    v23 = 8193;
    v20 = (CGColorSpace *)TSUDeviceRGBColorSpace();
    MutableBytePtr = 0;
    Mutable = 0;
  }
LABEL_20:
  v29 = CGBitmapContextCreate(MutableBytePtr, v14, v16, 8uLL, AlignedBytesPerRow, v20, v23);
  if (v29)
  {
    v30 = v29;
    if (v7)
    {
      CGContextTranslateCTM(v29, 0.0, (double)v16);
      CGContextScaleCTM(v30, 1.0, -1.0);
    }
    if (v8)
    {
      CGContextSetGrayFillColor(v30, 1.0, 1.0);
      v31 = (double)v14;
      v32 = (double)v16;
      v45.origin.x = 0.0;
      v45.origin.y = 0.0;
      v45.size.width = (double)v14;
      v45.size.height = (double)v16;
      CGContextFillRect(v30, v45);
    }
    else
    {
      v32 = (double)v16;
      v31 = (double)v14;
    }
    -[TSDFrameRep p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:](self, "p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:", v30, v18, v8, 0.0, 0.0, v31 / a6, v32 / a6, a6);
    if (v8)
    {
      CGContextRelease(v30);
      v33 = CGDataProviderCreateWithCFData(Mutable);
      v12 = CGImageMaskCreate(v14, v16, 8uLL, 8uLL, AlignedBytesPerRow, v33, 0, 1);
      CGDataProviderRelease(v33);
      if (v7)
      {
        v34 = TSDBitmapContextCreate(3, v31);
        v35 = *MEMORY[0x24BDBEFB0];
        v36 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        v46.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
        v46.origin.y = v36;
        v46.size.width = v31;
        v46.size.height = v32;
        CGContextClipToMask(v34, v46, v12);
        CGContextSetRGBFillColor(v34, 1.0, 1.0, 1.0, 1.0);
        v47.origin.x = v35;
        v47.origin.y = v36;
        v47.size.width = v31;
        v47.size.height = v32;
        CGContextFillRect(v34, v47);
        Image = CGBitmapContextCreateImage(v34);
        CGContextRelease(v34);
        CGImageRelease(v12);
        v12 = Image;
      }
    }
    else
    {
      v12 = CGBitmapContextCreateImage(v30);
      CGContextRelease(v30);
    }
  }
  else
  {
    v12 = 0;
  }
  if (Mutable)
    CFRelease(Mutable);
  return v12;
}

- (void)p_drawFrameIntoRect:(CGRect)a3 inContext:(CGContext *)a4 withImages:(id)a5 atViewScale:(double)a6 isMask:(BOOL)a7
{
  _BOOL4 v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double MinY;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v7 = a7;
  v46.origin.x = TSDRoundedRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  MinX = CGRectGetMinX(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  CGRectGetMaxX(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MinY = CGRectGetMinY(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  CGRectGetMaxY(v49);
  -[TSDFrame i_leftWidth](self->mFrame, "i_leftWidth");
  TSURound();
  v43 = v16;
  -[TSDFrame i_topHeight](self->mFrame, "i_topHeight");
  TSURound();
  v44 = v17;
  -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
  TSURound();
  -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
  TSURound();
  -[TSDFrame i_leftWidth](self->mFrame, "i_leftWidth");
  -[TSDFrame i_rightWidth](self->mFrame, "i_rightWidth");
  -[TSDFrame i_topHeight](self->mFrame, "i_topHeight");
  -[TSDFrame i_bottomHeight](self->mFrame, "i_bottomHeight");
  TSURound();
  v19 = v18;
  TSURound();
  v21 = v20;
  TSURound();
  v23 = v22;
  TSURound();
  v25 = v19 + 1.0;
  if (v19 != v21)
    v25 = v21;
  v41 = v25;
  v42 = v19;
  if (v23 == v24)
    v26 = v23 + 1.0;
  else
    v26 = v24;
  -[TSDFrame assetScale](self->mFrame, "assetScale");
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 0), "drawImageInContext:rect:", a4, MinX, MinY, v43, v44);
  v27 = TSDRoundedSize();
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 6), "drawImageInContext:rect:", a4, MinX, v26, v27, v28);
  v29 = TSDRoundedSize();
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 2), "drawImageInContext:rect:", a4, v41, MinY, v29, v30);
  v31 = TSDRoundedSize();
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 4), "drawImageInContext:rect:", a4, v41, v26, v31, v32);
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 7), "dpiAdjustedFillSize");
  v33 = TSDRoundedSize();
  -[TSDFrameRep p_drawTiles:inContext:rect:start:end:vertical:](self, "p_drawTiles:inContext:rect:start:end:vertical:", objc_msgSend(a5, "objectAtIndex:", 7), a4, 1, MinX, v23, v33, v34, v23, v26);
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 3), "dpiAdjustedFillSize");
  v35 = TSDRoundedSize();
  -[TSDFrameRep p_drawTiles:inContext:rect:start:end:vertical:](self, "p_drawTiles:inContext:rect:start:end:vertical:", objc_msgSend(a5, "objectAtIndex:", 3), a4, 1, v41, v23, v35, v36, v23, v26);
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 1), "dpiAdjustedFillSize");
  v37 = TSDRoundedSize();
  -[TSDFrameRep p_drawTiles:inContext:rect:start:end:vertical:](self, "p_drawTiles:inContext:rect:start:end:vertical:", objc_msgSend(a5, "objectAtIndex:", 1), a4, 0, v42, MinY, v37, v38, v42, v41);
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 5), "dpiAdjustedFillSize");
  v39 = TSDRoundedSize();
  -[TSDFrameRep p_drawTiles:inContext:rect:start:end:vertical:](self, "p_drawTiles:inContext:rect:start:end:vertical:", objc_msgSend(a5, "objectAtIndex:", 5), a4, 0, v42, v26, v39, v40, v42, v41);
  if (v7)
  {
    CGContextSetGrayFillColor(a4, 0.0, 1.0);
    v50.size.width = v41 - v42;
    v50.size.height = v26 - v23;
    v50.origin.x = v42;
    v50.origin.y = v23;
    CGContextFillRect(a4, v50);
  }
}

- (void)p_drawTiles:(id)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 start:(double)a6 end:(double)a7 vertical:(BOOL)a8
{
  _BOOL4 v8;
  double x;
  double y;
  double width;
  double height;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v8 = a8;
  v33 = CGRectIntegral(a5);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  if (!CGRectIsEmpty(v33))
  {
    v18 = a7 - a6;
    if (v8)
      v19 = width;
    else
      v19 = a7 - a6;
    if (v8)
      v20 = a7 - a6;
    else
      v20 = height;
    if (-[TSDFrameSpec i_tilingMode](-[TSDFrame frameSpec](self->mFrame, "frameSpec"), "i_tilingMode") == 2)
    {
      objc_msgSend(a3, "drawImageInContext:rect:", a4, x, y, v19, v20);
    }
    else
    {
      if (v8)
        v21 = height;
      else
        v21 = width;
      v22 = v18 / v21;
      v23 = vcvtps_s32_f32(v22);
      if (-[TSDFrameSpec i_tilingMode](-[TSDFrame frameSpec](self->mFrame, "frameSpec"), "i_tilingMode") == 1)
      {
        if (v23 >= 1)
        {
          v24 = v18 / (double)v23;
          do
          {
            a6 = v24 + a6;
            TSURound();
            v26 = v25;
            v27 = x;
            v28 = y;
            v29 = width;
            v30 = height;
            if (v8)
            {
              height = v26 - CGRectGetMinY(*(CGRect *)&v27);
              objc_msgSend(a3, "drawImageInContext:rect:", a4, x, y, width, height);
              v34.origin.x = x;
              v34.origin.y = y;
              v34.size.width = width;
              v34.size.height = height;
              y = CGRectGetMaxY(v34);
            }
            else
            {
              width = v26 - CGRectGetMinX(*(CGRect *)&v27);
              objc_msgSend(a3, "drawImageInContext:rect:", a4, x, y, width, height);
              v35.origin.x = x;
              v35.origin.y = y;
              v35.size.width = width;
              v35.size.height = height;
              x = CGRectGetMaxX(v35);
            }
            --v23;
          }
          while (v23);
        }
      }
      else
      {
        CGContextSaveGState(a4);
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = v19;
        v36.size.height = v20;
        CGContextClipToRect(a4, v36);
        if (v23 >= 1)
        {
          if (v8)
            v31 = -0.0;
          else
            v31 = width;
          if (v8)
            v32 = height;
          else
            v32 = -0.0;
          do
          {
            objc_msgSend(a3, "drawImageInContext:rect:", a4, x, y, width, height);
            x = v31 + x;
            y = v32 + y;
            --v23;
          }
          while (v23);
        }
        CGContextRestoreGState(a4);
      }
    }
  }
}

- (void)p_addUnreplicatedLayerForIndex:(unsigned int)a3 toLayer:(id)a4 maskLayer:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  CGImage *v13;
  size_t Width;
  size_t Height;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v8 = p_addUnreplicatedLayerForIndex_toLayer_maskLayer__edgeAAMasks[a3];
  v9 = a3;
  objc_msgSend(a4, "contentsScale");
  v11 = v10;
  v12 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v13 = (CGImage *)objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", v9), "CGImageForNaturalSize");
  objc_msgSend(v12, "setContents:", v13);
  Width = CGImageGetWidth(v13);
  Height = CGImageGetHeight(v13);
  if (Width > 0x7FF || Height >= 0x800)
  {
    v16 = (double)Height;
    v17 = (double)Width;
    v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep p_addUnreplicatedLayerForIndex:toLayer:maskLayer:]");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 937, CFSTR("frame image is too big for %@ (%f, %f)"), -[TSDFrame frameName](self->mFrame, "frameName"), *(_QWORD *)&v17, *(_QWORD *)&v16);
  }
  objc_msgSend(v12, "setEdgeAntialiasingMask:", v8);
  objc_msgSend(v12, "setContentsScale:", v11);
  objc_msgSend(a4, "addSublayer:", v12);
  if (a5)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    objc_msgSend(v20, "setContents:", objc_msgSend(-[NSArray objectAtIndex:](self->mMasks, "objectAtIndex:", v9), "CGImageForNaturalSize"));
    objc_msgSend(v20, "setContentsScale:", v11);
    objc_msgSend(v20, "setEdgeAntialiasingMask:", v8);
    objc_msgSend(a5, "addSublayer:", v20);
  }
}

- (void)p_addEdgeLayerForIndex:(unsigned int)a3 toLayer:(id)a4 maskLayer:(id)a5
{
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v7 = *(_QWORD *)&a3;
  if (-[TSDFrameSpec i_tilingMode](-[TSDFrame frameSpec](self->mFrame, "frameSpec"), "i_tilingMode") == 2)
  {
    -[TSDFrameRep p_addUnreplicatedLayerForIndex:toLayer:maskLayer:](self, "p_addUnreplicatedLayerForIndex:toLayer:maskLayer:", v7, a4, a5);
  }
  else
  {
    v9 = v7 & 0xFFFFFFFB;
    v10 = objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", v7), "CGImageForNaturalSize");
    objc_msgSend(a4, "contentsScale");
    objc_msgSend(a4, "addSublayer:", -[TSDFrameRep p_createRepeatingLayerWithImage:vertical:screenScale:](self, "p_createRepeatingLayerWithImage:vertical:screenScale:", v10, (v7 & 0xFFFFFFFB) == 3));
    if (a5)
    {
      v11 = objc_msgSend(-[NSArray objectAtIndex:](self->mMasks, "objectAtIndex:", v7), "CGImageForNaturalSize");
      objc_msgSend(a4, "contentsScale");
      objc_msgSend(a5, "addSublayer:", -[TSDFrameRep p_createRepeatingLayerWithImage:vertical:screenScale:](self, "p_createRepeatingLayerWithImage:vertical:screenScale:", v11, v9 == 3));
    }
  }
}

- (id)p_createRepeatingLayerWithImage:(CGImage *)a3 vertical:(BOOL)a4 screenScale:(double)a5
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  size_t Width;
  size_t Height;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v9 = (void *)objc_msgSend(MEMORY[0x24BDE57E0], "layer");
  v10 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  objc_msgSend(v10, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  objc_msgSend(v10, "setContentsScale:", a5);
  objc_msgSend(v9, "addSublayer:", v10);
  objc_msgSend(v10, "setContents:", a3);
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  if (Width > 0x7FF || Height >= 0x800)
  {
    v13 = (double)Height;
    v14 = (double)Width;
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep p_createRepeatingLayerWithImage:vertical:screenScale:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 994, CFSTR("frame image is too big for %@ (%f, %f)"), -[TSDFrame frameName](self->mFrame, "frameName"), *(_QWORD *)&v14, *(_QWORD *)&v13);
  }
  if (v6)
    v17 = 3;
  else
    v17 = 12;
  objc_msgSend(v10, "setEdgeAntialiasingMask:", v17);
  return v9;
}

- (void)p_setUnreplicatedLayerWithIndex:(unsigned int)a3 sublayers:(id)a4 maskLayers:(id)a5 toRect:(CGRect)a6
{
  double y;
  double x;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  y = a6.origin.y;
  x = a6.origin.x;
  v9 = fmax(a6.size.width, 1.0);
  v10 = fmax(a6.size.height, 1.0);
  v11 = a3;
  v12 = (void *)objc_msgSend(a4, "objectAtIndex:", a3);
  objc_msgSend(v12, "frame");
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = v9;
  v16.size.height = v10;
  if (!CGRectEqualToRect(v14, v16))
    objc_msgSend(v12, "setFrame:", x, y, v9, v10);
  if (a5)
  {
    v13 = (void *)objc_msgSend(a5, "objectAtIndex:", v11);
    objc_msgSend(v13, "frame");
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = v9;
    v17.size.height = v10;
    if (!CGRectEqualToRect(v15, v17))
      objc_msgSend(v13, "setFrame:", x, y, v9, v10);
  }
}

- (void)p_setRepeatingLayerWithIndex:(unsigned int)a3 sublayers:(id)a4 maskLayers:(id)a5 toRect:(CGRect)a6 start:(double)a7 end:(double)a8
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v16;
  uint64_t v17;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a3 & 0xFFFFFFFB;
  v17 = a3;
  -[TSDFrameRep p_adjustRepeatingLayer:withImageRect:start:end:vertical:](self, "p_adjustRepeatingLayer:withImageRect:start:end:vertical:", objc_msgSend(a4, "objectAtIndex:", a3), (a3 & 0xFFFFFFFB) == 3, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7, a8);
  if (a5)
    -[TSDFrameRep p_adjustRepeatingLayer:withImageRect:start:end:vertical:](self, "p_adjustRepeatingLayer:withImageRect:start:end:vertical:", objc_msgSend(a5, "objectAtIndex:", v17), v16 == 3, x, y, width, height, a7, a8);
}

- (void)p_adjustRepeatingLayer:(id)a3 withImageRect:(CGRect)a4 start:(double)a5 end:(double)a6 vertical:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  void *v14;
  unint64_t v15;
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
  float v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  double v51;
  double v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  double v58;
  double v59;
  uint64_t j;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double x;
  double y;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v7 = a7;
  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v87 = *MEMORY[0x24BDAC8D0];
  v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "sublayers"), "objectAtIndex:", 0);
  v15 = objc_msgSend((id)objc_msgSend(a3, "sublayers"), "count");
  objc_msgSend(v14, "bounds");
  v70 = v17;
  v71 = v16;
  v68 = v19;
  v69 = v18;
  objc_msgSend(a3, "contentsScale");
  v21 = v20;
  v22 = a6 - a5;
  if (v7)
    v23 = height;
  else
    v23 = width;
  if (v7)
    v24 = a6 - a5;
  else
    v24 = height;
  v74 = v24;
  if (v7)
    v25 = width;
  else
    v25 = a6 - a5;
  v26 = v22 / v23;
  v27 = vcvtps_u32_f32(v26);
  if (!v27)
  {
    v28 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep p_adjustRepeatingLayer:withImageRect:start:end:vertical:]");
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 1070, CFSTR("Need at least one tile for a frame"));
  }
  if (v15 <= v27)
  {
    if (v15 < v27)
    {
      if (v7)
        v31 = 3;
      else
        v31 = 12;
      v32 = objc_msgSend(v14, "contents");
      v33 = *MEMORY[0x24BDBEFB0];
      v34 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v35 = v27 - v15;
      do
      {
        v36 = (void *)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
        objc_msgSend(v36, "setAnchorPoint:", v33, v34);
        objc_msgSend(v36, "setContentsScale:", v21);
        objc_msgSend(a3, "addSublayer:", v36);
        objc_msgSend(v36, "setContents:", v32);
        objc_msgSend(v36, "setEdgeAntialiasingMask:", v31);
        --v35;
      }
      while (v35);
    }
  }
  else
  {
    v30 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", objc_msgSend(a3, "sublayers"));
    objc_msgSend(v30, "removeObjectsInRange:", v27, v15 - v27);
    objc_msgSend(a3, "setSublayers:", v30);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "sublayers"), "count") != v27)
  {
    v37 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v38 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameRep p_adjustRepeatingLayer:withImageRect:start:end:vertical:]");
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 1093, CFSTR("Wrong number of layers: %li when expected %li"), objc_msgSend((id)objc_msgSend(a3, "sublayers"), "count"), v27);
  }
  v72 = (double)v27;
  v73 = v25;
  if (-[TSDFrameSpec i_tilingMode](-[TSDFrame frameSpec](self->mFrame, "frameSpec"), "i_tilingMode") == 1)
    v23 = v22 / (double)v27;
  v39 = TSDRectWithSize();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v88.origin.y = v70;
  v88.origin.x = v71;
  v88.size.height = v68;
  v88.size.width = v69;
  v90.origin.x = v39;
  v90.origin.y = v41;
  v90.size.width = v43;
  v90.size.height = v45;
  if (!CGRectEqualToRect(v88, v90))
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v46 = (void *)objc_msgSend(a3, "sublayers");
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v82 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "setBounds:", v39, v41, v43, v45);
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
      }
      while (v48);
    }
  }
  if (v7)
    v51 = 0.0;
  else
    v51 = v23;
  v79 = 0u;
  v80 = 0u;
  if (v7)
    v52 = v23;
  else
    v52 = 0.0;
  v77 = 0uLL;
  v78 = 0uLL;
  v53 = (void *)objc_msgSend(a3, "sublayers");
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  if (v54)
  {
    v55 = v54;
    v56 = 0;
    v57 = *(_QWORD *)v78;
    if (v7)
      v58 = width;
    else
      v58 = v23;
    if (v7)
      v59 = v23;
    else
      v59 = height;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v78 != v57)
          objc_enumerationMutation(v53);
        v61 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
        objc_msgSend(v61, "setBounds:", 0.0, 0.0, v58, v59);
        objc_msgSend(v61, "setPosition:", v51 * (double)(v56 + j), v52 * (double)(v56 + j));
        objc_msgSend(v61, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      v56 += j;
    }
    while (v55);
  }
  v62 = (void *)objc_msgSend((id)objc_msgSend(a3, "sublayers"), "lastObject");
  v63 = v23 * v72;
  if (v23 * v72 > v22)
  {
    v64 = v62;
    v65 = -(v22 - v72 * v23);
    if (v7)
      v66 = 1.0;
    else
      v66 = 1.0 - v65 / v23;
    if (v7)
      v67 = 1.0 - v65 / v23;
    else
      v67 = 1.0;
    objc_msgSend(v62, "setContentsRect:", 0.0, 0.0, v66, v67);
    objc_msgSend(v64, "bounds");
    objc_msgSend(v64, "setBounds:");
  }
  objc_msgSend(a3, "frame", v63);
  v91.origin.x = x;
  v91.origin.y = y;
  v91.size.width = v73;
  v91.size.height = v74;
  if (!CGRectEqualToRect(v89, v91))
    objc_msgSend(a3, "setFrame:", x, y, v73, v74);
}

@end
