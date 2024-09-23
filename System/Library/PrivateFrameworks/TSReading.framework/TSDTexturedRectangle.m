@implementation TSDTexturedRectangle

- (TSDTexturedRectangle)initWithSize:(CGSize)a3 offset:(CGPoint)a4 renderBlock:(id)a5
{
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TSDTexturedRectangle;
  v11 = -[TSDTexturedRectangle init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    v13 = (void *)*((_QWORD *)v11 + 16);
    *((_QWORD *)v11 + 16) = v12;

    *((_QWORD *)v11 + 20) = 0x3FF0000000000000;
    v14 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    v15 = (void *)*((_QWORD *)v11 + 15);
    *((_QWORD *)v11 + 15) = v14;

    objc_msgSend(*((id *)v11 + 15), "setEdgeAntialiasingMask:", 0);
    objc_msgSend(*((id *)v11 + 15), "setAllowsEdgeAntialiasing:", 1);
    v16 = (void *)*((_QWORD *)v11 + 15);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("kTSDTextureLayerKeyHasContents"));

    v18 = (void *)*((_QWORD *)v11 + 15);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forKey:", v19, CFSTR("kTSDTextureLayerKeyTexturedRectangle"));

    *((CGFloat *)v11 + 5) = width;
    *((CGFloat *)v11 + 6) = height;
    objc_msgSend(v11, "setOffset:", x, y);
    *((_QWORD *)v11 + 7) = 0;
    *((_QWORD *)v11 + 8) = 0;
    *(_OWORD *)(v11 + 72) = *(_OWORD *)(v11 + 40);
  }

  return (TSDTexturedRectangle *)v11;
}

- (TSDTexturedRectangle)initWithLayer:(id)a3
{
  id v5;
  TSDTexturedRectangle *v6;
  TSDTexturedRectangle *v7;
  id mRenderBlock;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CALayer *mLayer;
  void *v20;
  CALayer *v21;
  void *v22;
  TSDTexturedRectangle *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TSDTexturedRectangle;
  v6 = -[TSDTexturedRectangle init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    mRenderBlock = v6->mRenderBlock;
    v6->mRenderBlock = 0;

    objc_msgSend(v5, "frame");
    v7->mSize.width = v9;
    v7->mSize.height = v10;
    objc_msgSend(v5, "frame");
    v7->mOffset.x = v11;
    v7->mOffset.y = v12;
    objc_msgSend(v5, "position");
    v7->mOriginalPosition.x = v13;
    v7->mOriginalPosition.y = v14;
    objc_msgSend(v5, "frame");
    v7->mOriginalFrame.origin.x = v15;
    v7->mOriginalFrame.origin.y = v16;
    v7->mOriginalFrame.size.width = v17;
    v7->mOriginalFrame.size.height = v18;
    v7->mContentRect.origin.x = 0.0;
    v7->mContentRect.origin.y = 0.0;
    v7->mContentRect.size = v7->mSize;
    v7->mTextureOpacity = 1.0;
    objc_storeStrong((id *)&v7->mLayer, a3);
    mLayer = v7->mLayer;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setValue:forKey:](mLayer, "setValue:forKey:", v20, CFSTR("kTSDTextureLayerKeyHasContents"));

    v21 = v7->mLayer;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setValue:forKey:](v21, "setValue:forKey:", v22, CFSTR("kTSDTextureLayerKeyTexturedRectangle"));

    v23 = v7;
  }

  return v7;
}

- (TSDTexturedRectangle)initWithSize:(CGSize)a3 image:(CGImage *)a4
{
  CGFloat height;
  CGFloat width;
  TSDTexturedRectangle *result;

  height = a3.height;
  width = a3.width;
  result = -[TSDTexturedRectangle initWithCGImage:](self, "initWithCGImage:", a4);
  result->mSize.width = width;
  result->mSize.height = height;
  return result;
}

- (TSDTexturedRectangle)initWithCGImage:(CGImage *)a3
{
  char *v4;
  size_t Height;
  uint64_t v6;
  id v7;
  void *v8;
  double Width;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TSDTexturedRectangle;
  v4 = -[TSDTexturedRectangle init](&v22, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 17) = CGImageRetain(a3);
    *((_QWORD *)v4 + 20) = 0x3FF0000000000000;
    *((double *)v4 + 5) = (double)CGImageGetWidth(a3);
    Height = CGImageGetHeight(a3);
    *((double *)v4 + 6) = (double)Height;
    *(_OWORD *)(v4 + 8) = *MEMORY[0x24BDBEFB0];
    v6 = *((_QWORD *)v4 + 5);
    *((_QWORD *)v4 + 7) = 0;
    *((_QWORD *)v4 + 8) = 0;
    *((_QWORD *)v4 + 9) = v6;
    *((double *)v4 + 10) = (double)Height;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v7 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    v8 = (void *)*((_QWORD *)v4 + 15);
    *((_QWORD *)v4 + 15) = v7;

    objc_msgSend(*((id *)v4 + 15), "setContents:", a3);
    Width = (double)CGImageGetWidth(a3);
    objc_msgSend(*((id *)v4 + 15), "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(a3));
    objc_msgSend(*((id *)v4 + 15), "setPosition:", *((double *)v4 + 5) * 0.5, *((double *)v4 + 6) * 0.5);
    objc_msgSend(*((id *)v4 + 15), "setEdgeAntialiasingMask:", 0);
    objc_msgSend(*((id *)v4 + 15), "position");
    *((_QWORD *)v4 + 3) = v10;
    *((_QWORD *)v4 + 4) = v11;
    objc_msgSend(*((id *)v4 + 15), "frame");
    *((_QWORD *)v4 + 11) = v12;
    *((_QWORD *)v4 + 12) = v13;
    *((_QWORD *)v4 + 13) = v14;
    *((_QWORD *)v4 + 14) = v15;
    v16 = (void *)*((_QWORD *)v4 + 15);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("kTSDTextureLayerKeyHasContents"));

    v18 = (void *)*((_QWORD *)v4 + 15);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forKey:", v19, CFSTR("kTSDTextureLayerKeyTexturedRectangle"));

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    v20 = v4;
  }

  return (TSDTexturedRectangle *)v4;
}

- (void)teardown
{
  id mRenderBlock;

  mRenderBlock = self->mRenderBlock;
  self->mRenderBlock = 0;

  -[TSDTexturedRectangle releaseSingleTexture](self, "releaseSingleTexture");
}

- (void)dealloc
{
  CGImage *mBakedImage;
  CGImage *mSourceImage;
  objc_super v5;

  -[TSDTexturedRectangle releaseSingleTexture](self, "releaseSingleTexture");
  mBakedImage = self->mBakedImage;
  if (mBakedImage)
    CGImageRelease(mBakedImage);
  mSourceImage = self->mSourceImage;
  if (mSourceImage)
    CGImageRelease(mSourceImage);
  v5.receiver = self;
  v5.super_class = (Class)TSDTexturedRectangle;
  -[TSDTexturedRectangle dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  CGRect v11;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TSDStringFromTextureType(-[TSDTexturedRectangle textureType](self, "textureType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("textureType:%@"), v4);

  -[TSDTexturedRectangle frame](self, "frame");
  NSStringFromCGRect(v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" frame:%@"), v5);

  v6 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)TSDTexturedRectangle;
  -[TSDTexturedRectangle description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: {%@}"), v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDTexturedRectangle *v5;
  TSDTexturedRectangle *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  if (self->mRenderBlock)
  {
    v5 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:](+[TSDTexturedRectangle allocWithZone:](TSDTexturedRectangle, "allocWithZone:", a3), "initWithSize:offset:renderBlock:", self->mRenderBlock, self->mOriginalFrame.size.width, self->mOriginalFrame.size.height, self->mOriginalFrame.origin.x, self->mOriginalFrame.origin.y);
  }
  else
  {
    if (!self->mSourceImage)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle copyWithZone:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 259, CFSTR("Trying to make a copy from a texture with no content"));

      v6 = 0;
      goto LABEL_6;
    }
    v5 = -[TSDTexturedRectangle initWithCGImage:](+[TSDTexturedRectangle allocWithZone:](TSDTexturedRectangle, "allocWithZone:", a3), "initWithCGImage:", self->mSourceImage);
  }
  v6 = v5;
LABEL_6:
  -[TSDTexturedRectangle setOffset:](v6, "setOffset:", self->mOffset.x, self->mOffset.y);
  -[TSDTexturedRectangle setTextureType:](v6, "setTextureType:", self->mTextureType);
  v7 = (void *)-[NSMutableDictionary copyWithZone:](self->mAttributes, "copyWithZone:", a3);
  -[TSDTexturedRectangle setAttributes:](v6, "setAttributes:", v7);

  -[TSDTexturedRectangle setTextureOpacity:](v6, "setTextureOpacity:", self->mTextureOpacity);
  -[TSDTexturedRectangle setContentRect:](v6, "setContentRect:", self->mContentRect.origin.x, self->mContentRect.origin.y, self->mContentRect.size.width, self->mContentRect.size.height);
  v8 = (void *)-[NSMutableArray copyWithZone:](self->mTags, "copyWithZone:", a3);
  -[TSDTexturedRectangle setTags:](v6, "setTags:", v8);

  -[TSDTexturedRectangle setText:](v6, "setText:", self->_text);
  -[TSDTexturedRectangle setTextColor:](v6, "setTextColor:", self->_textColor);
  -[TSDTexturedRectangle setTextRange:](v6, "setTextRange:", self->_textRange.location, self->_textRange.length);
  -[TSDTexturedRectangle setTextXHeight:](v6, "setTextXHeight:", self->_textXHeight);
  return v6;
}

- (float)opacityFromAttributes
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[NSMutableDictionary objectForKey:](self->mAttributes, "objectForKey:", CFSTR("kSFXOpacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (CATransform3D)transformFromAttributes
{
  void *v4;
  float v5;
  CATransform3D *result;
  id v7;

  -[NSMutableDictionary objectForKey:](self->mAttributes, "objectForKey:", CFSTR("kSFXAngle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
    objc_msgSend(v4, "floatValue");
  else
    v5 = 0.0;
  CATransform3DMakeRotation(retstr, v5 / 180.0 * -3.14159265, 0.0, 0.0, 1.0);

  return result;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->mOffset.x;
  y = self->mOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  self->mOffset = a3;
  -[CALayer setFrame:](self->mLayer, "setFrame:");
  -[CALayer position](self->mLayer, "position");
  self->mOriginalPosition.x = v4;
  self->mOriginalPosition.y = v5;
  -[CALayer frame](self->mLayer, "frame");
  self->mOriginalFrame.origin.x = v6;
  self->mOriginalFrame.origin.y = v7;
  self->mOriginalFrame.size.width = v8;
  self->mOriginalFrame.size.height = v9;
}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[TSDTexturedRectangle offset](self, "offset");
  v4 = v3;
  v6 = v5;
  -[TSDTexturedRectangle size](self, "size");
  v8 = v7;
  v10 = v9;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)adjustAnchorRelativeToParentsCenterOfRotation:(CGPoint)a3 isMagicMove:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  __int128 v19;
  CGFloat tx;
  CGFloat ty;
  void *v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double x;
  double y;
  CGAffineTransform v31;
  CGAffineTransform v32;

  v4 = a4;
  if (!a4 || (self->mTextureType & 0xFFFFFFFE) != 2)
  {
    x = a3.x;
    y = a3.y;
    width = self->mOriginalFrame.size.width;
    height = self->mOriginalFrame.size.height;
    v8 = TSDCenterOfRect(self->mOriginalFrame.origin.x, self->mOriginalFrame.origin.y, width, height);
    v9 = TSDSubtractPoints(x, y, v8);
    -[CALayer setAnchorPoint:](self->mLayer, "setAnchorPoint:", v9 / width + 0.5, v10 / height + 0.5);
    -[CALayer setPosition:](self->mLayer, "setPosition:", x, y);
    if (v4 && -[TSDTexturedRectangle textureType](self, "textureType") != 9)
    {
      -[CALayer superlayer](self->mLayer, "superlayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v16 = TSDCenterOfRect(v12, v13, v14, v15);
      v18 = v17;

      v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v31.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v31.c = v19;
      *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      CGAffineTransformTranslate(&v32, &v31, v16, v18);
      v25 = *(_OWORD *)&v32.c;
      v27 = *(_OWORD *)&v32.a;
      tx = v32.tx;
      ty = v32.ty;
      -[TSDTexturedRectangle parent](self, "parent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "textureAngle");
      *(_OWORD *)&v31.a = v27;
      *(_OWORD *)&v31.c = v25;
      v31.tx = tx;
      v31.ty = ty;
      CGAffineTransformRotate(&v32, &v31, -v23);
      v26 = *(_OWORD *)&v32.c;
      v28 = *(_OWORD *)&v32.a;
      v24 = *(_OWORD *)&v32.tx;

      *(_OWORD *)&v31.a = v28;
      *(_OWORD *)&v31.c = v26;
      *(_OWORD *)&v31.tx = v24;
      CGAffineTransformTranslate(&v32, &v31, -v16, -v18);
      -[CALayer setPosition:](self->mLayer, "setPosition:", vaddq_f64(*(float64x2_t *)&v32.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v32.c, y), *(float64x2_t *)&v32.a, x)));
    }
    self->mOriginalPosition.x = x;
    self->mOriginalPosition.y = y;
  }
}

- (void)resetAnchorPoint
{
  double v3;
  CGFloat v4;
  double v5;

  -[CALayer setAnchorPoint:](self->mLayer, "setAnchorPoint:", 0.5, 0.5);
  -[CALayer bounds](self->mLayer, "bounds");
  v4 = self->mOffset.x + v3 * 0.5;
  -[CALayer bounds](self->mLayer, "bounds");
  -[CALayer setPosition:](self->mLayer, "setPosition:", v4, self->mOffset.y + v5 * 0.5);
}

- (void)setTextureType:(int)a3
{
  id v4;

  if (self->mTextureType != a3)
  {
    self->mTextureType = a3;
    TSDStringFromTextureType(-[TSDTexturedRectangle textureType](self, "textureType"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CALayer setName:](self->mLayer, "setName:", v4);

  }
}

- (CGColorSpace)p_colorSpace
{
  CGColorSpace *v3;
  CGColorSpace *result;
  TSDTextureSet **p_mParent;
  id WeakRetained;
  uint64_t v7;
  id v8;
  CGColorSpace *v9;

  v3 = (CGColorSpace *)TSUDeviceRGBColorSpace();
  result = self->mColorSpace;
  if (!result)
  {
    p_mParent = &self->mParent;
    WeakRetained = objc_loadWeakRetained((id *)p_mParent);
    v7 = objc_msgSend(WeakRetained, "colorSpace");

    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)p_mParent);
      v9 = (CGColorSpace *)objc_msgSend(v8, "colorSpace");

      return v9;
    }
    else
    {
      return v3;
    }
  }
  return result;
}

- (CGImage)p_newImageAndBufferWithAngle:(double)a3 scale:(double)a4 offset:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGContext *v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void (**mRenderBlock)(id, CGContext *);
  CGImage *mSourceImage;
  size_t Height;
  CGFloat Width;
  void *v28;
  void *v29;
  void *v30;
  CGImage *Image;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGAffineTransform v37;
  CGAffineTransform transform;
  CGAffineTransform v39;
  CGRect v40;

  y = a5.y;
  x = a5.x;
  v10 = CGBitmapContextCreate(0, (unint64_t)self->mSize.width, (unint64_t)self->mSize.height, 8uLL, 4 * (unint64_t)self->mSize.width, -[TSDTexturedRectangle p_colorSpace](self, "p_colorSpace"), 1u);
  TSDSetCGContextInfo((uint64_t)v10, 0, 0, 0, 0, 1.0);
  CGContextTranslateCTM(v10, 0.0, self->mSize.height);
  CGContextScaleCTM(v10, 1.0, -1.0);
  CGContextTranslateCTM(v10, x, y);
  if (a3 != 0.0 || a4 != 1.0)
  {
    v35 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v39.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v39.c = v35;
    *(_OWORD *)&v39.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[CALayer frame](self->mLayer, "frame", *(_QWORD *)&v39.tx, *(_QWORD *)&v39.ty, *(_QWORD *)&v39.a, *(_QWORD *)&v39.b, v35);
    v12 = -v11;
    -[CALayer frame](self->mLayer, "frame");
    *(_OWORD *)&transform.a = v34;
    *(_OWORD *)&transform.c = v36;
    *(_OWORD *)&transform.tx = v33;
    CGAffineTransformTranslate(&v39, &transform, v12, -v13);
    -[CALayer position](self->mLayer, "position");
    v15 = v14;
    -[CALayer position](self->mLayer, "position");
    v37 = v39;
    CGAffineTransformTranslate(&transform, &v37, v15, v16);
    v39 = transform;
    v37 = transform;
    CGAffineTransformScale(&transform, &v37, a4, a4);
    v39 = transform;
    v37 = transform;
    CGAffineTransformRotate(&transform, &v37, a3);
    v39 = transform;
    -[CALayer anchorPoint](self->mLayer, "anchorPoint");
    v18 = v17;
    v20 = v19;
    -[CALayer bounds](self->mLayer, "bounds");
    v22 = TSDMultiplyPointBySize(v18, v20, v21);
    v37 = v39;
    CGAffineTransformTranslate(&transform, &v37, -v22, -v23);
    v39 = transform;
    CGContextConcatCTM(v10, &transform);
  }
  mRenderBlock = (void (**)(id, CGContext *))self->mRenderBlock;
  if (mRenderBlock)
  {
    mRenderBlock[2](mRenderBlock, v10);
  }
  else
  {
    mSourceImage = self->mSourceImage;
    if (mSourceImage)
    {
      Height = CGImageGetHeight(mSourceImage);
      CGContextTranslateCTM(v10, 0.0, (double)Height);
      CGContextScaleCTM(v10, 1.0, -1.0);
      Width = (double)CGImageGetWidth(self->mSourceImage);
      v40.size.height = (double)CGImageGetHeight(self->mSourceImage);
      v40.origin.x = 0.0;
      v40.origin.y = 0.0;
      v40.size.width = Width;
      CGContextDrawImage(v10, v40, self->mSourceImage);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle p_newImageAndBufferWithAngle:scale:offset:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 423, CFSTR("Nothing to render from."));

    }
  }
  TSDClearCGContextInfo((uint64_t)v10);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

- (void)resetToSourceImage
{
  id WeakRetained;

  CGImageRelease(self->mBakedImage);
  self->mBakedImage = 0;
  -[CALayer setFrame:](self->mLayer, "setFrame:", self->mOriginalFrame.origin.x, self->mOriginalFrame.origin.y, self->mOriginalFrame.size.width, self->mOriginalFrame.size.height);
  -[CALayer setContents:](self->mLayer, "setContents:", self->mSourceImage);
  self->mSize = self->mOriginalFrame.size;
  self->mOffset = self->mOriginalFrame.origin;
  WeakRetained = objc_loadWeakRetained((id *)&self->mParent);
  objc_msgSend(WeakRetained, "setIsBaked:", 0);

}

- (BOOL)isRenderable
{
  return self->mSourceImage || self->mRenderBlock != 0;
}

- (void)renderLayerContentsIfNeeded
{
  void *v3;
  CGImage *v4;
  void *v5;
  void *v6;
  void *v7;
  CGImage *mSourceImage;
  double mTextureOpacity;
  void *v10;
  void *v11;
  CGImage *v12;

  -[CALayer contents](self->mLayer, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->mBakedImage)
    {
      -[CALayer contents](self->mLayer, "contents");
      v4 = (CGImage *)objc_claimAutoreleasedReturnValue();
      if (v4 == self->mBakedImage)
      {
        v12 = v4;
        -[CALayer superlayer](self->mLayer, "superlayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "superlayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          -[TSDTexturedRectangle resetToSourceImage](self, "resetToSourceImage");
      }
      else
      {

      }
    }
  }
  else
  {
    if (!self->mRenderBlock && !self->mSourceImage)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle renderLayerContentsIfNeeded]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 455, CFSTR("Nothing to render from"));

    }
    mSourceImage = self->mSourceImage;
    if (!mSourceImage)
    {
      mSourceImage = -[TSDTexturedRectangle p_newImageAndBufferWithAngle:scale:offset:](self, "p_newImageAndBufferWithAngle:scale:offset:", 0.0, 1.0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      self->mSourceImage = mSourceImage;
    }
    -[CALayer setContents:](self->mLayer, "setContents:", mSourceImage);
    mTextureOpacity = self->mTextureOpacity;
    *(float *)&mTextureOpacity = mTextureOpacity;
    -[CALayer setOpacity:](self->mLayer, "setOpacity:", mTextureOpacity);
  }
}

- (void)setupSingleTextureAndGenerateMipMaps:(BOOL)a3
{
  double height;
  double width;
  CGImage *v6;
  void *v7;
  CGContext *v8;
  CGFloat v9;
  size_t v10;
  CGFloat v11;
  void (**mRenderBlock)(id, CGContext *);
  void *v13;
  void *v14;
  void *v15;
  CGRect v16;
  CGRect v17;

  if (!self->mSingleTextureName || a3 && !self->mSingleTextureContainsMipmaps)
  {
    -[TSDTexturedRectangle releaseSingleTexture](self, "releaseSingleTexture", a3);
    width = self->mSize.width;
    height = self->mSize.height;
    v6 = -[TSDTexturedRectangle image](self, "image");
    v7 = malloc_type_malloc(4 * (unint64_t)width * (unint64_t)height, 0x774322F7uLL);
    v8 = CGBitmapContextCreate(v7, (unint64_t)width, (unint64_t)height, 8uLL, 4 * (unint64_t)width, -[TSDTexturedRectangle p_colorSpace](self, "p_colorSpace"), 1u);
    TSDSetCGContextInfo((uint64_t)v8, 0, 0, 0, 0, 1.0);
    CGContextScaleCTM(v8, 1.0, -1.0);
    v9 = (double)(unint64_t)height;
    CGContextTranslateCTM(v8, 0.0, -v9);
    v16.size.width = (double)(unint64_t)width;
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.height = v9;
    CGContextClearRect(v8, v16);
    if (v6)
    {
      v10 = CGImageGetHeight(v6);
      CGContextTranslateCTM(v8, 0.0, (double)v10);
      CGContextScaleCTM(v8, 1.0, -1.0);
      v11 = (double)CGImageGetWidth(v6);
      v17.size.height = (double)CGImageGetHeight(v6);
      v17.origin.x = 0.0;
      v17.origin.y = 0.0;
      v17.size.width = v11;
      CGContextDrawImage(v8, v17, v6);
    }
    else
    {
      mRenderBlock = (void (**)(id, CGContext *))self->mRenderBlock;
      if (mRenderBlock)
      {
        mRenderBlock[2](mRenderBlock, v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle setupSingleTextureAndGenerateMipMaps:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 501, CFSTR("Nothing to render from"));

      }
    }
    TSDClearCGContextInfo((uint64_t)v8);
    CGContextRelease(v8);
  }
}

- (void)setupSingleTexture
{
  -[TSDTexturedRectangle setupSingleTextureAndGenerateMipMaps:](self, "setupSingleTextureAndGenerateMipMaps:", 0);
}

- (unsigned)singleTextureName
{
  -[TSDTexturedRectangle setupSingleTexture](self, "setupSingleTexture");
  return self->mSingleTextureName;
}

- (unsigned)singleTextureTarget
{
  return 3553;
}

- (void)releaseSingleTexture
{
  if (self->mSingleTextureName)
    self->mSingleTextureName = 0;
}

- (double)singleTextureOpacity
{
  void *v3;
  float v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;

  -[TSDTexturedRectangle layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "opacity");
  v5 = v4;

  -[TSDTexturedRectangle parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TSDTexturedRectangle parent](self, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "opacity");
    v5 = v5 * v9;

  }
  return v5;
}

- (TSUColor)textColor
{
  return self->_textColor;
}

- (CGImage)image
{
  CGImage *mBakedImage;
  CALayer *mLayer;
  void *v5;
  void *v6;
  void *v7;

  mBakedImage = self->mBakedImage;
  if (mBakedImage)
    return mBakedImage;
  mBakedImage = self->mSourceImage;
  if (mBakedImage)
    return mBakedImage;
  mLayer = self->mLayer;
  if (!mLayer)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle image]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 573, CFSTR("Can't make an image from this TSDTexturedRectangle!"));

    return 0;
  }
  return -[CALayer newRasterizedImageRef](mLayer, "newRasterizedImageRef");
}

- (void)bakeLayerWithAngle:(double)a3 scale:(double)a4
{
  CALayer *mLayer;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double x;
  double y;
  double v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  CGImage *mBakedImage;
  double v29;
  double v30;
  CGImage *v31;
  CALayer *v32;
  void *v33;
  CALayer *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[8];
  CGRect v40;
  CGRect v41;

  mLayer = self->mLayer;
  if (mLayer)
  {
    v8 = -[CALayer setContents:](mLayer, "setContents:", 0);
    -[CALayer setBounds:](self->mLayer, "setBounds:", TSDRectWithOriginAndSize(v8, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), self->mOriginalFrame.size.width, self->mOriginalFrame.size.height));
    -[CALayer superlayer](self->mLayer, "superlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    -[CALayer frame](self->mLayer, "frame");
    v15 = TSDAddPoints(v11, v13, v14);
    v17 = v16;

    v18 = -[CALayer frame](self->mLayer, "frame");
    v40.origin.x = TSDRectWithOriginAndSize(v18, v15, v17, v19, v20);
    x = v40.origin.x;
    y = v40.origin.y;
    v41 = CGRectIntegral(v40);
    v23 = v41.origin.x;
    v24 = v41.origin.y;
    self->mSize.width = v41.size.width;
    self->mSize.height = v41.size.height;
    -[CALayer superlayer](self->mLayer, "superlayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    self->mOffset.x = TSDSubtractPoints(v23, v24, v26);
    self->mOffset.y = v27;

    mBakedImage = self->mBakedImage;
    if (mBakedImage)
      CGImageRelease(mBakedImage);
    v29 = TSDSubtractPoints(x, y, v23);
    v31 = -[TSDTexturedRectangle p_newImageAndBufferWithAngle:scale:offset:](self, "p_newImageAndBufferWithAngle:scale:offset:", a3, a4, v29, v30);
    self->mBakedImage = v31;
    -[CALayer setContents:](self->mLayer, "setContents:", v31);
    if (a3 != 0.0)
      -[CALayer setValue:forKeyPath:](self->mLayer, "setValue:forKeyPath:", &unk_24D8FB770, CFSTR("transform.rotation.z"));
    if (a4 != 1.0)
      -[CALayer setValue:forKeyPath:](self->mLayer, "setValue:forKeyPath:", &unk_24D8FB780, CFSTR("transform.scale.xy"));
    v32 = self->mLayer;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setValue:forKey:](v32, "setValue:forKey:", v33, CFSTR("kTSDTextureLayerKeyBakedScale"));

    v34 = self->mLayer;
    v35 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v39[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v39[5] = v35;
    v36 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v39[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v39[7] = v36;
    v37 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v39[0] = *MEMORY[0x24BDE5598];
    v39[1] = v37;
    v38 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v39[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v39[3] = v38;
    -[CALayer setFrame:](self->mLayer, "setFrame:", TSDRectWithOriginAndSize(-[CALayer setTransform:](v34, "setTransform:", v39), self->mOffset.x, self->mOffset.y, self->mSize.width, self->mSize.height));
  }
}

- (void)renderIntoContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;
  CGFloat v7;
  CALayer *mLayer;
  CALayer *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double mTextureOpacity;
  void (**mRenderBlock)(id, CGContext *);
  CGImage *mSourceImage;
  size_t Height;
  CGFloat Width;
  void *v22;
  void *v23;
  void *v24;
  CGAffineTransform v25;
  CATransform3D v26;
  CGRect v27;

  if (!-[CALayer isHidden](self->mLayer, "isHidden"))
  {
    CGContextSaveGState(a3);
    -[CALayer position](self->mLayer, "position");
    v6 = v5;
    -[CALayer position](self->mLayer, "position");
    CGContextTranslateCTM(a3, v6, v7);
    mLayer = self->mLayer;
    if (mLayer)
      -[CALayer transform](mLayer, "transform");
    else
      memset(&v26, 0, sizeof(v26));
    if (!CATransform3DIsIdentity(&v26))
    {
      v9 = self->mLayer;
      if (v9)
        -[CALayer affineTransform](v9, "affineTransform");
      else
        memset(&v25, 0, sizeof(v25));
      CGContextConcatCTM(a3, &v25);
    }
    -[CALayer bounds](self->mLayer, "bounds", *(_OWORD *)&v25.a, *(_OWORD *)&v25.c, *(_OWORD *)&v25.tx, *(_QWORD *)&v26.m11, *(_QWORD *)&v26.m12, *(_QWORD *)&v26.m13, *(_QWORD *)&v26.m14, *(_QWORD *)&v26.m21, *(_QWORD *)&v26.m22, *(_QWORD *)&v26.m23, *(_QWORD *)&v26.m24, *(_QWORD *)&v26.m31, *(_QWORD *)&v26.m32, *(_QWORD *)&v26.m33, *(_QWORD *)&v26.m34, *(_QWORD *)&v26.m41, *(_QWORD *)&v26.m42,
      *(_QWORD *)&v26.m43,
      *(_QWORD *)&v26.m44);
    v11 = v10;
    -[CALayer anchorPoint](self->mLayer, "anchorPoint");
    v13 = -(v11 * v12);
    -[CALayer bounds](self->mLayer, "bounds");
    v15 = v14;
    -[CALayer anchorPoint](self->mLayer, "anchorPoint");
    CGContextTranslateCTM(a3, v13, -(v15 * v16));
    mTextureOpacity = self->mTextureOpacity;
    if (mTextureOpacity != 1.0)
    {
      CGContextSetAlpha(a3, mTextureOpacity);
      CGContextBeginTransparencyLayer(a3, 0);
    }
    mRenderBlock = (void (**)(id, CGContext *))self->mRenderBlock;
    if (mRenderBlock)
    {
      mRenderBlock[2](mRenderBlock, a3);
    }
    else
    {
      mSourceImage = self->mSourceImage;
      if (mSourceImage)
      {
        Height = CGImageGetHeight(mSourceImage);
        CGContextTranslateCTM(a3, 0.0, (double)Height);
        CGContextScaleCTM(a3, 1.0, -1.0);
        Width = (double)CGImageGetWidth(self->mSourceImage);
        v27.size.height = (double)CGImageGetHeight(self->mSourceImage);
        v27.origin.x = 0.0;
        v27.origin.y = 0.0;
        v27.size.width = Width;
        CGContextDrawImage(a3, v27, self->mSourceImage);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle renderIntoContext:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, v24, 639, CFSTR("Nothing to render from."));

      }
    }
    if (self->mTextureOpacity != 1.0)
      CGContextEndTransparencyLayer(a3);
    CGContextRestoreGState(a3);
  }
}

- (BOOL)isBackgroundTexture
{
  void *v3;
  void *v4;
  char v5;

  -[TSDTexturedRectangle parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TSDTexturedRectangle parent](self, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBackgroundTexture:", self);

  return v5;
}

- (CGRect)boundingRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a4;
  -[TSDTexturedRectangle frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TSDTexturedRectangle parent](self, "parent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TSDTexturedRectangle parent](self, "parent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "boundingRectForStage:isBuildIn:", a3, v4);
    v8 = v17;
    v10 = v18;
    v12 = v19;
    v14 = v20;

  }
  v21 = v8;
  v22 = v10;
  v23 = v12;
  v24 = v14;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CALayer)parentLayer
{
  void *v3;
  void *v4;
  void *v5;

  -[TSDTexturedRectangle parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TSDTexturedRectangle parent](self, "parent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (CALayer *)v5;
}

- (CGRect)frameOnCanvas
{
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
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
  CGRect v24;
  CGRect v25;
  CGRect result;

  x = self->mFrameOnCanvas.origin.x;
  y = self->mFrameOnCanvas.origin.y;
  width = self->mFrameOnCanvas.size.width;
  height = self->mFrameOnCanvas.size.height;
  -[TSDTexturedRectangle parent](self, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TSDTexturedRectangle frame](self, "frame");
    v9 = v8;
    -[TSDTexturedRectangle parent](self, "parent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    x = v9 + v11;
    -[TSDTexturedRectangle parent](self, "parent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    -[TSDTexturedRectangle frame](self, "frame");
    y = v14 + CGRectGetMaxY(v24);

    -[TSDTexturedRectangle frame](self, "frame");
    width = v15;
    -[TSDTexturedRectangle frame](self, "frame");
    height = v16;
  }
  if (CGRectIsEmpty(self->mFrameOnCanvas))
  {
    -[TSDTexturedRectangle frame](self, "frame");
    x = v17;
    -[TSDTexturedRectangle frame](self, "frame");
    y = CGRectGetMaxY(v25);
    -[TSDTexturedRectangle frame](self, "frame");
    width = v18;
    -[TSDTexturedRectangle frame](self, "frame");
    height = v19;
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (char)p_setupTextureDataWithSize:(CGSize)a3 isBGRA:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  CGImage *mBakedImage;
  size_t v9;
  double v10;
  double v11;
  CGColorSpace *v12;
  uint64_t v13;
  size_t v14;
  uint32_t v15;
  size_t v16;
  size_t v17;
  id mRenderBlock;
  CALayer *mLayer;
  double v20;
  double v21;
  void *v22;
  CGColorSpace *ColorSpace;
  CGContext *v24;
  CGFloat v25;
  void (**v26)(id, CGContext *);
  void *v27;
  void *v28;
  void *v29;
  CGColorSpace *space;
  int v32;
  CGRect v33;
  CGRect v34;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  mBakedImage = self->mBakedImage;
  if (!mBakedImage)
    mBakedImage = self->mSourceImage;
  v9 = (unint64_t)a3.width;
  v11 = self->mSize.width;
  v10 = self->mSize.height;
  v12 = -[TSDTexturedRectangle p_colorSpace](self, "p_colorSpace");
  v13 = TSUP3ColorSpace();
  if (v12 == (CGColorSpace *)v13)
  {
    space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
    v14 = 8 * v9;
    v15 = 4353;
    v16 = 16;
  }
  else
  {
    v14 = 4 * v9;
    if (v4)
      v15 = 8194;
    else
      v15 = 1;
    v16 = 8;
    space = v12;
  }
  v17 = (unint64_t)height;
  mRenderBlock = self->mRenderBlock;
  if (mRenderBlock)
  {
    LODWORD(mRenderBlock) = 0;
  }
  else
  {
    mLayer = self->mLayer;
    if (mLayer && !mBakedImage)
    {
      mBakedImage = -[CALayer newRasterizedImageRef](mLayer, "newRasterizedImageRef");
      LODWORD(mRenderBlock) = 1;
    }
  }
  v32 = (int)mRenderBlock;
  v20 = width / v11;
  v21 = height / v10;
  v22 = malloc_type_malloc(v14 * v17, 0xBC658E53uLL);
  if (-[TSDTexturedRectangle textureType](self, "textureType") == 7 && mBakedImage)
  {
    if (v12 == (CGColorSpace *)v13)
      CGColorSpaceRelease(space);
    ColorSpace = CGImageGetColorSpace(mBakedImage);
    v24 = CGBitmapContextCreate(v22, v9, v17, v16, v14, ColorSpace, v15);
  }
  else
  {
    v24 = CGBitmapContextCreate(v22, v9, v17, v16, v14, space, v15);
    if (v12 == (CGColorSpace *)v13)
      CGColorSpaceRelease(space);
  }
  TSDSetCGContextInfo((uint64_t)v24, 0, 0, 0, 0, 1.0);
  CGContextScaleCTM(v24, 1.0, -1.0);
  CGContextTranslateCTM(v24, 0.0, -(double)v17);
  CGContextScaleCTM(v24, v20, v21);
  v33.size.width = (double)v9;
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.height = (double)v17;
  CGContextClearRect(v24, v33);
  if (-[TSDTexturedRectangle textureType](self, "textureType") == 7)
    CGContextSetInterpolationQuality(v24, kCGInterpolationNone);
  if (mBakedImage)
  {
    -[CALayer bounds](self->mLayer, "bounds");
    CGContextTranslateCTM(v24, 0.0, v25);
    CGContextScaleCTM(v24, 1.0, -1.0);
    -[CALayer bounds](self->mLayer, "bounds");
    CGContextDrawImage(v24, v34, mBakedImage);
  }
  else
  {
    v26 = (void (**)(id, CGContext *))self->mRenderBlock;
    if (v26)
    {
      v26[2](v26, v24);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle p_setupTextureDataWithSize:isBGRA:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 757, CFSTR("%p - Nothing to render from"), self);

    }
  }
  if (v32)
    CGImageRelease(mBakedImage);
  TSDClearCGContextInfo((uint64_t)v24);
  CGContextRelease(v24);
  return (char *)v22;
}

- (BOOL)isMetalTextureSetup
{
  return self->_metalTexture != 0;
}

- (void)releaseMetalTexture
{
  MTLTexture *metalTexture;

  metalTexture = self->_metalTexture;
  self->_metalTexture = 0;

}

- (id)p_allocateMetalTextureForDevice:(id)a3
{
  id v4;
  void *v5;
  CGColorSpace *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumMetalTextureSizeForDevice:", v4);

  v6 = -[TSDTexturedRectangle p_colorSpace](self, "p_colorSpace");
  if (v6 == (CGColorSpace *)TSUP3ColorSpace())
    v7 = 115;
  else
    v7 = 80;
  TSUShrinkSizeToFitInSize();
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v7, (unint64_t)v9, (unint64_t)v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "newTextureWithDescriptor:", v10);

  return v11;
}

- (void)setupMetalTextureForDevice:(id)a3
{
  id v4;
  MTLTexture *v5;
  MTLTexture *metalTexture;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  char *v12;
  MTLTexture *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];

  v4 = a3;
  if (!self->_metalTexture)
  {
    -[TSDTexturedRectangle p_allocateMetalTextureForDevice:](self, "p_allocateMetalTextureForDevice:", v4);
    v5 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    metalTexture = self->_metalTexture;
    self->_metalTexture = v5;

    v7 = -[MTLTexture width](self->_metalTexture, "width");
    v8 = -[MTLTexture height](self->_metalTexture, "height");
    v9 = -[MTLTexture pixelFormat](self->_metalTexture, "pixelFormat");
    v10 = 2;
    if (v9 == 115)
      v10 = 3;
    v11 = v7 << v10;
    v12 = -[TSDTexturedRectangle p_setupTextureDataWithSize:isBGRA:](self, "p_setupTextureDataWithSize:isBGRA:", 1, (double)v7, (double)v8);
    memset(v17, 0, 24);
    v13 = self->_metalTexture;
    v17[3] = v7;
    v17[4] = v8;
    v17[5] = 1;
    -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](v13, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v17, 0, v12, v11);
    if ((unint64_t)-[MTLTexture mipmapLevelCount](self->_metalTexture, "mipmapLevelCount") >= 2)
    {
      v14 = (void *)objc_msgSend(v4, "newCommandQueue");
      objc_msgSend(v14, "commandBuffer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "blitCommandEncoder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "generateMipmapsForTexture:", self->_metalTexture);
      objc_msgSend(v16, "endEncoding");
      objc_msgSend(v15, "commit");

    }
    free(v12);
  }

}

+ (id)setupMetalShaderForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  TSDMetalShader *v12;
  void *v13;
  id v14;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDTexturedRectangle setupMetalShaderForContext:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 846, CFSTR("invalid nil value for '%s'"), "context");

  }
  objc_msgSend(v3, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDTexturedRectangle setupMetalShaderForContext:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 847, CFSTR("invalid nil value for '%s'"), "context.device");

  }
  v11 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
  objc_msgSend(v11, "setPixelFormat:", objc_msgSend(v3, "pixelFormat"));
  objc_msgSend(v11, "setBlendingEnabled:", 1);
  objc_msgSend(v11, "setRgbBlendOperation:", 0);
  objc_msgSend(v11, "setAlphaBlendOperation:", 0);
  objc_msgSend(v11, "setSourceRGBBlendFactor:", 1);
  objc_msgSend(v11, "setSourceAlphaBlendFactor:", 1);
  objc_msgSend(v11, "setDestinationAlphaBlendFactor:", 5);
  objc_msgSend(v11, "setDestinationRGBBlendFactor:", 5);
  v12 = [TSDMetalShader alloc];
  objc_msgSend(v3, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TSDMetalShader initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:](v12, "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v13, v11);

  return v14;
}

- (void)drawFrameAtLayerTime:(double)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
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
  double v19;
  double v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float32x4_t v51[4];

  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle drawFrameAtLayerTime:context:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 867, CFSTR("invalid nil value for '%s'"), "context");

  }
  -[TSDTexturedRectangle frameOnCanvas](self, "frameOnCanvas");
  v10 = v9;
  objc_msgSend(v5, "layerSize");
  v12 = v11;
  -[TSDTexturedRectangle frameOnCanvas](self, "frameOnCanvas");
  v14 = v12 - v13;
  -[TSDTexturedRectangle frameOnCanvas](self, "frameOnCanvas");
  v16 = v14 - v15;
  -[TSDTexturedRectangle frameOnCanvas](self, "frameOnCanvas");
  v18 = v17;
  -[TSDTexturedRectangle frameOnCanvas](self, "frameOnCanvas");
  v20 = v19;
  objc_msgSend(v5, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v21, v10, v16, v18, v20, *MEMORY[0x24BEB3F48], *(double *)(MEMORY[0x24BEB3F48] + 8), *(double *)(MEMORY[0x24BEB3F48] + 16), *(double *)(MEMORY[0x24BEB3F48] + 24));

  objc_msgSend(v5, "layerSize");
  v24 = v23;
  v26 = v25;
  objc_msgSend(v5, "shader");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle drawFrameAtLayerTime:context:]");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 874, CFSTR("invalid nil value for '%s'"), "context.shader");

  }
  objc_msgSend(v5, "renderEncoder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle drawFrameAtLayerTime:context:]");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, v34, 875, CFSTR("invalid nil value for '%s'"), "context.renderEncoder");

  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v43, 0.0, v24, 0.0, v26, -1.0, 1.0);
  v51[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v43), v44);
  v51[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v45), v46);
  v51[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v47), v48);
  v51[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49), v50);
  -[TSDTexturedRectangle singleTextureOpacity](self, "singleTextureOpacity");
  *(float *)&v35 = v35;
  v42 = LODWORD(v35);
  objc_msgSend(v5, "renderEncoder");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDTexturedRectangle metalTexture](self, "metalTexture");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFragmentTexture:atIndex:", v37, 0);

  objc_msgSend(v5, "shader");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderEncoder");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v39, v51, &v42);

  objc_msgSend(v5, "renderEncoder");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shader");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "drawWithEncoder:atIndex:", v40, objc_msgSend(v41, "bufferIndex"));

}

- (id)metalTextureWithContext:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  _BOOL4 shouldUseDisplayLinkPresentationTime;
  double v10;
  double v11;
  double v12;
  TSDTexturedRectangle *v13;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *liveMetalTexturesSemaphore;
  uint64_t v16;
  NSMutableDictionary *liveMetalTextureToTimestamp;
  uint64_t v18;
  NSMutableDictionary *liveMetalTimestampToTexture;
  uint64_t v20;
  NSMutableArray *liveMetalTexturePool;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  TSDMetalShader *v39;
  void *v40;
  uint64_t v41;
  TSDMetalShader *liveTextureSourceShader;
  NSMutableArray *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[4];
  id v79;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_liveTexturedRectangleSourceProxy);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_liveTexturedRectangleSourceProxy);
    objc_msgSend(v6, "metalTextureWithContext:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (!self->_liveTexturedRectangleSource)
  {
    -[TSDTexturedRectangle metalTexture](self, "metalTexture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  shouldUseDisplayLinkPresentationTime = self->_shouldUseDisplayLinkPresentationTime;
  objc_msgSend(v4, "timingInfo");
  if (shouldUseDisplayLinkPresentationTime)
    v12 = v10;
  else
    v12 = v11;
  v13 = self;
  objc_sync_enter(v13);
  if (!v13->_liveMetalTexturePool)
  {
    v13->_liveMetalTexturePoolIndex = -1;
    v14 = dispatch_semaphore_create(3);
    liveMetalTexturesSemaphore = v13->_liveMetalTexturesSemaphore;
    v13->_liveMetalTexturesSemaphore = (OS_dispatch_semaphore *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
    liveMetalTextureToTimestamp = v13->_liveMetalTextureToTimestamp;
    v13->_liveMetalTextureToTimestamp = (NSMutableDictionary *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
    liveMetalTimestampToTexture = v13->_liveMetalTimestampToTexture;
    v13->_liveMetalTimestampToTexture = (NSMutableDictionary *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    liveMetalTexturePool = v13->_liveMetalTexturePool;
    v13->_liveMetalTexturePool = (NSMutableArray *)v20;

  }
  v22 = v13->_liveMetalTimestampToTexture;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v22, "objectForKey:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = v24;
LABEL_27:
    v7 = v25;
    LODWORD(v33) = 0;
    goto LABEL_28;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[TSDLiveTexturedRectangleSource requiresOffscreenPass](self->_liveTexturedRectangleSource, "requiresOffscreenPass") & 1) == 0&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDLiveTexturedRectangleSource metalTextureWithContext:](self->_liveTexturedRectangleSource, "metalTextureWithContext:", v4);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if ((-[TSDLiveTexturedRectangleSource shouldDrawToMetalTextureWithContext:](self->_liveTexturedRectangleSource, "shouldDrawToMetalTextureWithContext:", v4) & 1) == 0)
  {
    -[TSDTexturedRectangle p_latestTextureNotAfterLayerTime:](v13, "p_latestTextureNotAfterLayerTime:", v12);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if ((unint64_t)-[NSMutableArray count](v13->_liveMetalTexturePool, "count") > 2)
  {
LABEL_21:
    if (!v13->_liveTextureSourceShader)
    {
      if (!v4)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle metalTextureWithContext:]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, v36, 949, CFSTR("invalid nil value for '%s'"), "callingMetalContext");

      }
      v37 = objc_alloc_init(MEMORY[0x24BDDD6A8]);
      -[NSMutableArray firstObject](v13->_liveMetalTexturePool, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setPixelFormat:", objc_msgSend(v38, "pixelFormat"));

      objc_msgSend(v37, "setBlendingEnabled:", 1);
      objc_msgSend(v37, "setRgbBlendOperation:", 0);
      objc_msgSend(v37, "setAlphaBlendOperation:", 0);
      objc_msgSend(v37, "setSourceRGBBlendFactor:", 1);
      objc_msgSend(v37, "setSourceAlphaBlendFactor:", 1);
      objc_msgSend(v37, "setDestinationAlphaBlendFactor:", 5);
      objc_msgSend(v37, "setDestinationRGBBlendFactor:", 5);
      v39 = [TSDMetalShader alloc];
      objc_msgSend(v4, "device");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[TSDMetalShader initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:](v39, "initDefaultTextureAndOpacityShaderWithDevice:colorAttachment:", v40, v37);
      liveTextureSourceShader = v13->_liveTextureSourceShader;
      v13->_liveTextureSourceShader = (TSDMetalShader *)v41;

    }
    v7 = 0;
    LODWORD(v33) = 1;
    goto LABEL_28;
  }
  +[TSDCapabilities currentCapabilities](TSDCapabilities, "currentCapabilities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "maximumMetalTextureSizeForDevice:", v27);
  v29 = v28;
  v31 = v30;

  objc_msgSend(v4, "device");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDTexturedRectangle p_allocateMetalTextureForDevice:renderTarget:writable:private:maxSize:](v13, "p_allocateMetalTextureForDevice:renderTarget:writable:private:maxSize:", v32, 1, 0, 1, v29, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[NSMutableArray addObject:](v13->_liveMetalTexturePool, "addObject:", v33);

    goto LABEL_21;
  }
  v7 = 0;
LABEL_28:

  objc_sync_exit(v13);
  if ((_DWORD)v33)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)v13->_liveMetalTexturesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v43 = v13->_liveMetalTexturePool;
    v13->_liveMetalTexturePoolIndex = (v13->_liveMetalTexturePoolIndex + 1) % 3;
    -[NSMutableArray objectAtIndexedSubscript:](v43, "objectAtIndexedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "colorAttachments");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTexture:", v7);

    objc_msgSend(v45, "colorAttachments");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setLoadAction:", 2);

    objc_msgSend(v45, "colorAttachments");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setStoreAction:", 1);

    objc_msgSend(v45, "colorAttachments");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    v54 = (void *)objc_msgSend(v4, "copy");
    -[NSMutableArray firstObject](v13->_liveMetalTexturePool, "firstObject");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setPixelFormat:", objc_msgSend(v55, "pixelFormat"));

    -[TSDTexturedRectangle metalTexture](v13, "metalTexture");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (double)(unint64_t)objc_msgSend(v56, "width");
    -[TSDTexturedRectangle metalTexture](v13, "metalTexture");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setLayerSize:", v57, (double)(unint64_t)objc_msgSend(v58, "height"));

    objc_msgSend(v54, "setShader:", v13->_liveTextureSourceShader);
    objc_msgSend(v54, "setCurrentBuffer:", v13->_liveMetalTexturePoolIndex);
    objc_msgSend(v54, "commandQueue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "commandBuffer");
    v60 = objc_claimAutoreleasedReturnValue();

    v77 = (void *)v60;
    objc_msgSend(v54, "setCommandBuffer:", v60);
    objc_msgSend(v54, "commandBuffer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v44;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle metalTextureWithContext:]");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v64, v65, 991, CFSTR("invalid nil value for '%s'"), "context.commandBuffer");

      v44 = v63;
    }
    objc_msgSend(v54, "setPassDescriptor:", v45);
    objc_msgSend(v54, "commandBuffer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "passDescriptor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "renderCommandEncoderWithDescriptor:", v67);
    v68 = objc_claimAutoreleasedReturnValue();

    v76 = (void *)v68;
    objc_msgSend(v54, "setRenderEncoder:", v68);
    v69 = v13;
    objc_sync_enter(v69);
    objc_msgSend(v69[30], "objectForKey:", v44);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      objc_msgSend(v69[30], "removeObjectForKey:", v44);
      -[NSMutableDictionary removeObjectForKey:](v13->_liveMetalTimestampToTexture, "removeObjectForKey:", v70);
    }

    objc_sync_exit(v69);
    -[TSDLiveTexturedRectangleSource drawToMetalTextureWithContext:](self->_liveTexturedRectangleSource, "drawToMetalTextureWithContext:", v54);
    objc_msgSend(v54, "renderEncoder");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "endEncoding");

    objc_initWeak(&location, v13->_liveMetalTexturesSemaphore);
    objc_msgSend(v54, "commandBuffer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __48__TSDTexturedRectangle_metalTextureWithContext___block_invoke;
    v78[3] = &unk_24D82C110;
    objc_copyWeak(&v79, &location);
    objc_msgSend(v72, "addCompletedHandler:", v78);

    objc_msgSend(v54, "commandBuffer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "commit");

    v74 = v69;
    objc_sync_enter(v74);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69[30], "setObject:forKey:", v75, v44);
    -[NSMutableDictionary setObject:forKey:](v13->_liveMetalTimestampToTexture, "setObject:forKey:", v7, v75);

    objc_sync_exit(v74);
    objc_destroyWeak(&v79);
    objc_destroyWeak(&location);

  }
LABEL_3:

  return v7;
}

void __48__TSDTexturedRectangle_metalTextureWithContext___block_invoke(uint64_t a1)
{
  NSObject *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_semaphore_signal(WeakRetained);

}

- (CGSize)p_textureSizeWithDevice:(id)a3 maxSize:(CGSize)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CALayer contentsRect](self->mLayer, "contentsRect", a3);
  if (v5 != 0.0)
  {
    -[CALayer contentsRect](self->mLayer, "contentsRect");
    if (v6 != 0.0)
    {
      -[CALayer contentsRect](self->mLayer, "contentsRect");
      -[CALayer contentsRect](self->mLayer, "contentsRect");
    }
  }
  TSUShrinkSizeToFitInSize();
  if (self->mSize.width != 0.0)
  {
    v9 = fmax(v7, 1.0);
    v10 = fmax(v8, 1.0);
    if (self->mSize.height != 0.0)
    {
      v8 = v10;
      v7 = v9;
    }
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)p_allocateMetalTextureForDevice:(id)a3 renderTarget:(BOOL)a4 writable:(BOOL)a5 private:(BOOL)a6 maxSize:(CGSize)a7
{
  double height;
  double width;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  id v13;
  double v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  BOOL v18;
  void *v19;
  CGColorSpace *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  height = a7.height;
  width = a7.width;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v13 = a3;
  -[TSDTexturedRectangle p_textureSizeWithDevice:maxSize:](self, "p_textureSizeWithDevice:maxSize:", v13, width, height);
  v15 = (unint64_t)v14;
  v17 = (unint64_t)v16;
  if ((unint64_t)v14)
    v18 = v17 == 0;
  else
    v18 = 1;
  if (v18)
  {
    v19 = 0;
    goto LABEL_21;
  }
  v20 = -[TSDTexturedRectangle p_colorSpace](self, "p_colorSpace");
  v21 = TSUP3ColorSpace();
  v22 = 70;
  if (v11)
    v22 = 80;
  v23 = 115;
  if (v11)
    v23 = 552;
  if (v20 == (CGColorSpace *)v21)
    v24 = v23;
  else
    v24 = v22;
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v24, v15, v17, self->mShouldGenerateMipmap);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v11)
  {
    if (!v10)
      goto LABEL_16;
LABEL_23:
    objc_msgSend(v26, "setUsage:", objc_msgSend(v26, "usage") | 2);
    if (!v9)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(v25, "setUsage:", 5);
  if (v10)
    goto LABEL_23;
LABEL_16:
  if (v9)
  {
LABEL_17:
    objc_msgSend(v26, "setResourceOptions:", 32);
    objc_msgSend(v26, "setStorageMode:", 2);
  }
LABEL_18:
  v19 = (void *)objc_msgSend(v13, "newTextureWithDescriptor:", v26);

  if (v19 && objc_msgSend(v19, "width"))
    objc_msgSend(v19, "height");
LABEL_21:

  return v19;
}

- (id)p_latestTextureNotAfterLayerTime:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_liveMetalTexturePool, "count"))
  {
    -[NSMutableDictionary allKeys](self->_liveMetalTimestampToTexture, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (!v8)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_21;
    }
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (!v11)
        {
          -[NSMutableDictionary objectForKey:](self->_liveMetalTimestampToTexture, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v14;
          goto LABEL_15;
        }
        objc_msgSend(v6, "doubleValue");
        v16 = v15;
        objc_msgSend(v10, "doubleValue");
        v18 = v17;
        objc_msgSend(v14, "doubleValue");
        v20 = v19 > v16;
        v21 = v16 - v19;
        if (!v20 && v21 < v16 - v18)
        {
          v23 = v14;

          -[NSMutableDictionary objectForKey:](self->_liveMetalTimestampToTexture, "objectForKey:", v23);
          v10 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

          v10 = v23;
          continue;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v21);
      if (!v9)
      {
LABEL_21:

        return v11;
      }
    }
  }
  -[TSDTexturedRectangle metalTexture](self, "metalTexture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (void)setLiveTexturedRectangleSource:(id)a3
{
  TSDLiveTexturedRectangleSource *v4;
  TSDLiveTexturedRectangleSource *liveTexturedRectangleSource;

  v4 = (TSDLiveTexturedRectangleSource *)a3;
  objc_storeWeak((id *)&self->_liveTexturedRectangleSourceProxy, 0);
  liveTexturedRectangleSource = self->_liveTexturedRectangleSource;
  self->_liveTexturedRectangleSource = v4;

}

- (void)setLiveTexturedRectangleSourceProxy:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  if (self->_liveTexturedRectangleSource)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTexturedRectangle setLiveTexturedRectangleSourceProxy:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTexturedRectangle.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 1165, CFSTR("expected nil value for '%s'"), "_liveTexturedRectangleSource", obj);

  }
  objc_storeWeak((id *)&self->_liveTexturedRectangleSourceProxy, obj);

}

- (BOOL)hasLiveTexturedRectangleSource
{
  BOOL v2;
  id WeakRetained;

  if (self->_liveTexturedRectangleSource)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_liveTexturedRectangleSourceProxy);
  v2 = WeakRetained != 0;

  return v2;
}

- (NSMutableDictionary)attributes
{
  return self->mAttributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->mAttributes, a3);
}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mContentRect.origin.x;
  y = self->mContentRect.origin.y;
  width = self->mContentRect.size.width;
  height = self->mContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  self->mContentRect = a3;
}

- (CGColorSpace)colorSpace
{
  return self->mColorSpace;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->mColorSpace = a3;
}

- (CALayer)layer
{
  return self->mLayer;
}

- (BOOL)isFlattened
{
  return self->mIsFlattened;
}

- (void)setIsFlattened:(BOOL)a3
{
  self->mIsFlattened = a3;
}

- (CGPoint)originalPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->mOriginalPosition.x;
  y = self->mOriginalPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalPosition:(CGPoint)a3
{
  self->mOriginalPosition = a3;
}

- (TSDTextureSet)parent
{
  return (TSDTextureSet *)objc_loadWeakRetained((id *)&self->mParent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->mParent, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->mSize.width;
  height = self->mSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)textureType
{
  return self->mTextureType;
}

- (double)textureOpacity
{
  return self->mTextureOpacity;
}

- (void)setTextureOpacity:(double)a3
{
  self->mTextureOpacity = a3;
}

- (NSMutableArray)tags
{
  return self->mTags;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->mTags, a3);
}

- (void)setFrameOnCanvas:(CGRect)a3
{
  self->mFrameOnCanvas = a3;
}

- (BOOL)shouldUseDisplayLinkPresentationTime
{
  return self->_shouldUseDisplayLinkPresentationTime;
}

- (void)setShouldUseDisplayLinkPresentationTime:(BOOL)a3
{
  self->_shouldUseDisplayLinkPresentationTime = a3;
}

- (BOOL)shouldGenerateMipmap
{
  return self->mShouldGenerateMipmap;
}

- (void)setShouldGenerateMipmap:(BOOL)a3
{
  self->mShouldGenerateMipmap = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (double)textBaseline
{
  return self->_textBaseline;
}

- (void)setTextBaseline:(double)a3
{
  self->_textBaseline = a3;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (_NSRange)textRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textRange.length;
  location = self->_textRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (double)textXHeight
{
  return self->_textXHeight;
}

- (void)setTextXHeight:(double)a3
{
  self->_textXHeight = a3;
}

- (TSUColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (double)bakedScale
{
  return self->_bakedScale;
}

- (BOOL)isVerticalText
{
  return self->_isVerticalText;
}

- (void)setIsVerticalText:(BOOL)a3
{
  self->_isVerticalText = a3;
}

- (MTLTexture)metalTexture
{
  return self->_metalTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalTexture, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->mParent);
  objc_storeStrong((id *)&self->_liveTextureSourceShader, 0);
  objc_storeStrong((id *)&self->_liveMetalTimestampToTexture, 0);
  objc_storeStrong((id *)&self->_liveMetalTextureToTimestamp, 0);
  objc_storeStrong((id *)&self->_liveMetalTexturePool, 0);
  objc_destroyWeak((id *)&self->_liveTexturedRectangleSourceProxy);
  objc_storeStrong((id *)&self->_liveTexturedRectangleSource, 0);
  objc_storeStrong((id *)&self->_liveMetalTexturesSemaphore, 0);
  objc_storeStrong((id *)&self->mTags, 0);
  objc_storeStrong((id *)&self->mAttributes, 0);
  objc_storeStrong(&self->mRenderBlock, 0);
  objc_storeStrong((id *)&self->mLayer, 0);
}

@end
