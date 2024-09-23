@implementation BKPictureBookViewGeometry

+ (id)geometryWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 ignoresPadding:(BOOL)a6 containerBounds:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v11;
  _BOOL8 v12;
  double v13;
  double v14;
  id v16;
  id v17;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v11 = a6;
  v12 = a5;
  v13 = a3.height;
  v14 = a3.width;
  v16 = a4;
  v17 = objc_msgSend(objc_alloc((Class)a1), "initWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v16, v12, v11, v14, v13, x, y, width, height);

  return v17;
}

+ (id)geometryWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 containerBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  double v11;
  double v12;
  id v14;
  id v15;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  v11 = a3.height;
  v12 = a3.width;
  v14 = a4;
  v15 = objc_msgSend(objc_alloc((Class)a1), "initWithContentSize:configuration:drawsSpine:ignoresPadding:containerBounds:", v14, v10, 0, v12, v11, x, y, width, height);

  return v15;
}

- (BKPictureBookViewGeometry)initWithContentSize:(CGSize)a3 configuration:(id)a4 drawsSpine:(BOOL)a5 ignoresPadding:(BOOL)a6 containerBounds:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  CGFloat v15;
  id v17;
  BKPictureBookViewGeometry *v18;
  BKPictureBookViewGeometry *v19;
  objc_super v21;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v14 = a3.height;
  v15 = a3.width;
  v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BKPictureBookViewGeometry;
  v18 = -[BKPictureBookViewGeometry init](&v21, "init");
  v19 = v18;
  if (v18)
  {
    v18->_contentSize.width = v15;
    v18->_contentSize.height = v14;
    v18->_drawsSpine = a5;
    objc_storeStrong((id *)&v18->_configuration, a4);
    v19->_ignoresPadding = a6;
    v19->_containerBounds.origin.x = x;
    v19->_containerBounds.origin.y = y;
    v19->_containerBounds.size.width = width;
    v19->_containerBounds.size.height = height;
  }

  return v19;
}

- (CGSize)sizeForSpread:(BOOL)a3 landscape:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  double width;
  double height;
  CGSize result;

  v4 = a4;
  v5 = a3;
  -[BKPictureBookViewGeometry contentSize](self, "contentSize");
  if (v7 <= 0.0 || (-[BKPictureBookViewGeometry contentSize](self, "contentSize"), v8 <= 0.0))
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    -[BKPictureBookViewGeometry contentSize](self, "contentSize");
    v10 = v9;
    -[BKPictureBookViewGeometry contentSize](self, "contentSize");
    v12 = v10 / v11;
    -[BKPictureBookViewGeometry scaleForSpread:landscape:](self, "scaleForSpread:landscape:", v5, v4);
    v13 = CGSizeScale(-[BKPictureBookViewGeometry contentSize](self, "contentSize"));
    v14 = floor(v13);
    v15 = vcvtmd_s64_f64(v13);
    width = v14 + 1.0;
    if ((v15 & 1) == 0)
      width = v14;
    height = floor(1.0 / v12 * width);
  }
  result.height = height;
  result.width = width;
  return result;
}

- (double)scaleForSpread:(BOOL)a3 landscape:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  double result;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;

  v4 = a3;
  -[BKPictureBookViewGeometry contentSize](self, "contentSize", a3, a4);
  if (v6 <= 0.0)
    return 1.0;
  -[BKPictureBookViewGeometry contentSize](self, "contentSize");
  if (v7 <= 0.0 || CGRectIsEmpty(self->_containerBounds))
    return 1.0;
  -[BKPictureBookViewGeometry contentSize](self, "contentSize");
  if (v4)
    v10 = v9 + v9;
  else
    v10 = v9;
  v11 = -[BKPictureBookViewGeometry contentSize](self, "contentSize");
  v13 = v12;
  v14 = IMActionSafeRectForRect(v11);
  v16 = v15;
  v18 = v17;
  if (!v4 && !self->_ignoresPadding)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookViewGeometry configuration](self, "configuration"));
    objc_msgSend(v19, "singlePagePadding");
    v16 = v16 - v20;

  }
  CGSizeScaleThatFitsInCGSize(v14, v10, v13, v16, v18);
  return result;
}

- (CGSize)maximumSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double width;
  double height;
  CGSize result;

  -[BKPictureBookViewGeometry contentSize](self, "contentSize");
  if (v3 <= 0.0 || (-[BKPictureBookViewGeometry contentSize](self, "contentSize"), v4 <= 0.0))
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    -[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 0, 1);
    v6 = v5;
    v8 = v7;
    -[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 0, 0);
    if (v6 > width)
    {
      width = v6;
      height = v8;
    }
  }
  result.height = height;
  result.width = width;
  return result;
}

- (double)scaleForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  double result;
  double v18;

  height = a3.height;
  width = a3.width;
  -[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 0, 1);
  v8 = width == v7 && height == v6;
  if (v8
    || ((-[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 0, 1), width == v10)
      ? (v11 = height == v9)
      : (v11 = 0),
        v11
     || ((-[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 0, 1), width == v13)
       ? (v14 = height == v12)
       : (v14 = 0),
         v14
      || (-[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 0, 1), width == v16)
      && height == v15)))
  {
    -[BKPictureBookViewGeometry scaleForSpread:landscape:](self, "scaleForSpread:landscape:", 0, 1);
  }
  else
  {
    -[BKPictureBookViewGeometry contentSize](self, "contentSize");
    return width / v18;
  }
  return result;
}

- (id)sizes
{
  void *v3;
  double v4;
  double v5;
  double v6;
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
  double height;
  double width;
  void *v20;
  void *v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v30;
  double v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 1, 1);
  v30 = v5;
  v31 = v4;
  -[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 1, 0);
  v7 = v6;
  v9 = v8;
  -[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 0, 1);
  v11 = v10;
  v13 = v12;
  -[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", 0, 0);
  v15 = v14;
  v17 = v16;
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, v9));
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v31, v30));
  objc_msgSend(v3, "addObject:", v21);

  v22 = height < width;
  if (height >= width)
    v23 = v11;
  else
    v23 = v15;
  if (height >= width)
    v24 = v13;
  else
    v24 = v17;
  if (height >= width)
    v25 = v15;
  else
    v25 = v11;
  if (v22)
    v26 = v13;
  else
    v26 = v17;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v23, v24));
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v25, v26));
  objc_msgSend(v3, "addObject:", v28);

  return v3;
}

- (id)imageSizes
{
  void *v3;
  double v4;
  double v5;
  double v6;
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
  double height;
  double width;
  void *v20;
  void *v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v30;
  double v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKPictureBookViewGeometry imageSizeForSpread:landscape:](self, "imageSizeForSpread:landscape:", 1, 1);
  v30 = v5;
  v31 = v4;
  -[BKPictureBookViewGeometry imageSizeForSpread:landscape:](self, "imageSizeForSpread:landscape:", 1, 0);
  v7 = v6;
  v9 = v8;
  -[BKPictureBookViewGeometry imageSizeForSpread:landscape:](self, "imageSizeForSpread:landscape:", 0, 1);
  v11 = v10;
  v13 = v12;
  -[BKPictureBookViewGeometry imageSizeForSpread:landscape:](self, "imageSizeForSpread:landscape:", 0, 0);
  v15 = v14;
  v17 = v16;
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, v9));
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v31, v30));
  objc_msgSend(v3, "addObject:", v21);

  v22 = height < width;
  if (height >= width)
    v23 = v11;
  else
    v23 = v15;
  if (height >= width)
    v24 = v13;
  else
    v24 = v17;
  if (height >= width)
    v25 = v15;
  else
    v25 = v11;
  if (v22)
    v26 = v13;
  else
    v26 = v17;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v23, v24));
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v25, v26));
  objc_msgSend(v3, "addObject:", v28);

  return v3;
}

- (CGSize)imageSizeForSpread:(BOOL)a3 landscape:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  CGSize result;

  -[BKPictureBookViewGeometry sizeForSpread:landscape:](self, "sizeForSpread:landscape:", a3, a4);
  v6 = v5;
  v8 = v7;
  objc_opt_class(self);
  objc_msgSend(v9, "imageSizeForSize:", v6, v8);
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)imageSizeForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = v6;

  v8 = width * v7;
  v9 = height * v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_contentSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)drawsSpine
{
  return self->_drawsSpine;
}

- (BKThumbnailBookViewConfiguring)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (CGRect)containerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerBounds.origin.x;
  y = self->_containerBounds.origin.y;
  width = self->_containerBounds.size.width;
  height = self->_containerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (BOOL)ignoresPadding
{
  return self->_ignoresPadding;
}

- (void)setIgnoresPadding:(BOOL)a3
{
  self->_ignoresPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
