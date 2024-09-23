@implementation CRLCanvasLayoutGeometry

- (CRLCanvasLayoutGeometry)initWithSize:(CGSize)a3 transform:(CGAffineTransform *)a4
{
  CGFloat height;
  CGFloat width;
  CRLCanvasLayoutGeometry *result;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasLayoutGeometry;
  result = -[CRLCanvasLayoutGeometry init](&v10, "init");
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    v8 = *(_OWORD *)&a4->a;
    v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)&a4->tx;
    *(_OWORD *)&result->_transform.c = v9;
    *(_OWORD *)&result->_transform.a = v8;
  }
  return result;
}

- (CRLCanvasLayoutGeometry)init
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", v4, 100.0, 100.0);
}

- (CRLCanvasLayoutGeometry)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  CGAffineTransform v7;

  height = a3.size.height;
  width = a3.size.width;
  CGAffineTransformMakeTranslation(&v7, a3.origin.x, a3.origin.y);
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", &v7, width, height);
}

- (CRLCanvasLayoutGeometry)initWithInfoGeometry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CRLCanvasLayoutGeometry *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (!objc_msgSend(v4, "heightValid") || (objc_msgSend(v5, "widthValid") & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F1F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E35EA8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125F218);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutGeometry initWithInfoGeometry:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutGeometry.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 53, 0, "can't create layout geometry from info geometry if width and height are not valid");

    }
    objc_msgSend(v5, "size");
    v10 = v9;
    v12 = v11;
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "transform");
    v18[0] = v19;
    v18[1] = v20;
    v18[2] = v21;
    self = -[CRLCanvasLayoutGeometry initWithSize:transform:](self, "initWithSize:transform:", v18, v10, v12);
    v13 = self;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F1B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E35DFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F1D8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasLayoutGeometry initWithInfoGeometry:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasLayoutGeometry.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 48, 0, "invalid nil value for '%{public}s'", "infoGeometry");

    v13 = 0;
  }

  return v13;
}

+ (id)geometryFromFullTransform:(CGAffineTransform *)a3
{
  double b;
  double a;
  double v6;
  double d;
  double c;
  double v9;
  CRLCanvasLayoutGeometry *v10;
  __int128 v11;
  _OWORD v13[3];

  a = a3->a;
  b = a3->b;
  v6 = sqrt(b * b + a * a);
  c = a3->c;
  d = a3->d;
  v9 = sqrt(d * d + c * c);
  if (v6 > 0.01)
  {
    a3->a = a / v6;
    a3->b = b / v6;
  }
  if (v9 > 0.01)
  {
    a3->c = c / v9;
    a3->d = d / v9;
  }
  v10 = [CRLCanvasLayoutGeometry alloc];
  v11 = *(_OWORD *)&a3->c;
  v13[0] = *(_OWORD *)&a3->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a3->tx;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](v10, "initWithSize:transform:", v13, v6, v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  Class v4;
  id v5;
  double width;
  double height;
  __int128 v8;
  _OWORD v10[3];

  objc_opt_class(self, a2);
  v5 = [v4 alloc];
  width = self->_size.width;
  height = self->_size.height;
  v8 = *(_OWORD *)&self->_transform.c;
  v10[0] = *(_OWORD *)&self->_transform.a;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&self->_transform.tx;
  return objc_msgSend(v5, "initWithSize:transform:", v10, width, height);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRLCanvasMutableLayoutGeometry *v4;
  double width;
  double height;
  __int128 v7;
  _OWORD v9[3];

  v4 = [CRLCanvasMutableLayoutGeometry alloc];
  width = self->_size.width;
  height = self->_size.height;
  v7 = *(_OWORD *)&self->_transform.c;
  v9[0] = *(_OWORD *)&self->_transform.a;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&self->_transform.tx;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](v4, "initWithSize:transform:", v9, width, height);
}

- (BOOL)isEqual:(id)a3
{
  CRLCanvasLayoutGeometry *v4;
  uint64_t v5;
  CRLCanvasLayoutGeometry *v6;
  uint64_t v7;
  CRLCanvasLayoutGeometry *v8;
  CRLCanvasLayoutGeometry *v9;
  double width;
  double v11;
  double height;
  double v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  _OWORD v18[3];
  _OWORD v19[3];

  v4 = (CRLCanvasLayoutGeometry *)a3;
  v6 = v4;
  if (!v4)
    goto LABEL_9;
  if (v4 == self)
  {
    v14 = 1;
    goto LABEL_13;
  }
  objc_opt_class(CRLCanvasLayoutGeometry, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = v8;
    width = self->_size.width;
    v11 = v8->_size.width;
    if ((width == v11 || vabdd_f64(width, v11) < 0.000000001)
      && ((height = self->_size.height, v13 = v8->_size.height, height == v13) || vabdd_f64(height, v13) < 0.000000001))
    {
      v15 = *(_OWORD *)&self->_transform.c;
      v19[0] = *(_OWORD *)&self->_transform.a;
      v19[1] = v15;
      v19[2] = *(_OWORD *)&self->_transform.tx;
      v16 = *(_OWORD *)&v8->_transform.c;
      v18[0] = *(_OWORD *)&v8->_transform.a;
      v18[1] = v16;
      v18[2] = *(_OWORD *)&v8->_transform.tx;
      v14 = sub_10005FEA0(v19, v18);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
LABEL_9:
    v14 = 0;
  }
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  return 0xCBF29CE484222325;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  CGAffineTransform transform;
  CGSize v15;
  CGRect v16;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[CRLCanvasLayoutGeometry frame](self, "frame");
  v6 = NSStringFromCGRect(v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CRLCanvasLayoutGeometry size](self, "size");
  v8 = NSStringFromCGSize(v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[CRLCanvasLayoutGeometry transform](self, "transform");
  v10 = NSStringFromCGAffineTransform(&transform);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p frame=%@ size=%@ xform=%@>"), v5, self, v7, v9, v11));

  return v12;
}

- (void)i_setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)i_setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (CGPoint)center
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vaddq_f64(*(float64x2_t *)&self->_transform.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transform.c, self->_size.height * 0.5), *(float64x2_t *)&self->_transform.a, self->_size.width * 0.5));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (CGRect)frame
{
  __int128 v3;
  CGAffineTransform v4;
  CGRect v5;

  v5.origin.x = sub_10005FDDC();
  v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v4.c = v3;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->_transform.tx;
  return CGRectApplyAffineTransform(v5, &v4);
}

- (CGAffineTransform)inverseTransform
{
  __int128 v3;
  CGAffineTransform v5;

  v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v5.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGAffineTransform)fullTransform
{
  CGFloat v3;
  CGFloat v4;
  __int128 v5;
  CGAffineTransform v7;

  v3 = fmax(self->_size.width, 0.00000001);
  v4 = fmax(self->_size.height, 0.00000001);
  v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformScale(retstr, &v7, v3, v4);
}

- (CRLCanvasInfoGeometry)infoGeometry
{
  CRLCanvasInfoGeometry *v3;
  uint64_t v5;

  v3 = [CRLCanvasInfoGeometry alloc];
  -[CRLCanvasLayoutGeometry transform](self, "transform");
  -[CRLCanvasLayoutGeometry size](self, "size");
  return -[CRLCanvasInfoGeometry initWithTransform:size:](v3, "initWithTransform:size:", &v5);
}

- (id)geometryByTransformingBy:(CGAffineTransform *)a3
{
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CRLCanvasLayoutGeometry *v13;
  CGAffineTransform v15;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v18;

  memset(&v18, 0, sizeof(v18));
  -[CRLCanvasLayoutGeometry transform](self, "transform");
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v5;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v18, &t1, &t2);
  t2 = v18;
  v6 = sub_100079240(&t2.a);
  v8 = v7;
  v15 = v18;
  memset(&t2, 0, sizeof(t2));
  CGAffineTransformScale(&t2, &v15, 1.0 / v6, 1.0 / v7);
  -[CRLCanvasLayoutGeometry size](self, "size");
  v10 = v6 * v9;
  -[CRLCanvasLayoutGeometry size](self, "size");
  v12 = v8 * v11;
  v13 = [CRLCanvasLayoutGeometry alloc];
  v15 = t2;
  return -[CRLCanvasLayoutGeometry initWithSize:transform:](v13, "initWithSize:transform:", &v15, v10, v12);
}

- (id)geometryByTranslatingBy:(CGPoint)a3
{
  CGAffineTransform v5;

  CGAffineTransformMakeTranslation(&v5, a3.x, a3.y);
  return (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutGeometry geometryByTransformingBy:](self, "geometryByTransformingBy:", &v5));
}

- (id)geometryByOutsettingBy:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  v5 = -[CRLCanvasLayoutGeometry mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "outsetBy:", width, height);
  return v5;
}

- (CGAffineTransform)transformByConcatenatingTransformTo:(SEL)a3
{
  __int128 v4;
  __int128 v5;
  CGAffineTransform v7;
  CGAffineTransform t1;

  v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformConcat(retstr, &t1, &v7);
}

- (BOOL)differsInMoreThanTranslationFrom:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v13;
  double v14[6];

  v4 = a3;
  if (v4
    && (-[CRLCanvasLayoutGeometry frame](self, "frame"),
        v6 = v5,
        v8 = v7,
        objc_msgSend(v4, "frame"),
        sub_10005FDF0(v6, v8, v9, v10)))
  {
    -[CRLCanvasLayoutGeometry transform](self, "transform");
    objc_msgSend(v4, "transform");
    v11 = !sub_100079164(v14, &v13);
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

@end
