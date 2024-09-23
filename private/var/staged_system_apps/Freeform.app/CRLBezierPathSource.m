@implementation CRLBezierPathSource

+ (id)pathSourceWithBezierPath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithBezierPath:", v4);

  return v6;
}

- (CRLBezierPathSource)initWithBezierPath:(id)a3
{
  id v4;
  CRLBezierPathSource *v5;
  double width;
  double height;
  BOOL v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRLBezierPathSource;
  v5 = -[CRLBezierPathSource init](&v16, "init");
  if (v5)
  {
    if ((uint64_t)objc_msgSend(v4, "elementCount") < 1)
    {
      width = CGRectNull.size.width;
      height = CGRectNull.size.height;
    }
    else
    {
      objc_msgSend(v4, "controlPointBounds");
    }
    v8 = width == CGSizeZero.width && height == CGSizeZero.height;
    if (v8 || sub_1000637C8())
    {
      v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237ED0);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFA6F8((uint64_t)v4, v9, v10);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237EF0);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE8358(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSource initWithBezierPath:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBezierPathSource.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 31, 0, "Ignoring invalid bezier path %@", v4);

      v14 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithDefaultsForErrorCases](CRLBezierPath, "bezierPathWithDefaultsForErrorCases"));
      v4 = (id)v14;
    }
    if (v4)
    {
      -[CRLBezierPathSource p_setBezierPath:](v5, "p_setBezierPath:", v4);
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (CRLBezierPathSource)initWithNaturalSize:(CGSize)a3
{
  void *v4;
  CRLBezierPathSource *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", 0.0, 0.0, a3.width, a3.height));
  v5 = -[CRLBezierPathSource initWithBezierPath:](self, "initWithBezierPath:", v4);

  return v5;
}

- (CRLBezierPathSource)init
{
  return -[CRLBezierPathSource initWithBezierPath:](self, "initWithBezierPath:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[CRLBezierPath copy](self->mPath, "copy");
  v7 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, v6), "allocWithZone:", a3), "initWithBezierPath:", v5);
  objc_msgSend(v7, "setHasHorizontalFlip:", -[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
  objc_msgSend(v7, "setHasVerticalFlip:", -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource localizationKey](self, "localizationKey"));
  objc_msgSend(v7, "setLocalizationKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedIdentifier](self, "userDefinedIdentifier"));
  objc_msgSend(v7, "setUserDefinedIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  objc_msgSend(v7, "setUserDefinedName:", v10);

  -[CRLBezierPathSource naturalSize](self, "naturalSize");
  objc_msgSend(v7, "setNaturalSize:");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLBezierPathSource *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  CRLBezierPath *mPath;
  BOOL v10;
  objc_super v12;

  v5 = (CRLBezierPathSource *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(CRLBezierPathSource, v4);
    v7 = sub_100221D0C(v6, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v10 = v8
       && (v12.receiver = self,
           v12.super_class = (Class)CRLBezierPathSource,
           -[CRLPathSource isEqual:](&v12, "isEqual:", v5))
       && ((mPath = self->mPath, mPath == *(CRLBezierPath **)(v8 + 56)) || -[CRLBezierPath isEqual:](mPath, "isEqual:"))
       && self->mIsRectangular != (*(_BYTE *)(v8 + 64) == 0)
       && sub_10005FDF0(self->mNaturalSize.width, self->mNaturalSize.height, *(double *)(v8 + 72), *(double *)(v8 + 80));

  }
  return v10;
}

- (unint64_t)hash
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  id v5;

  v2 = (objc_class *)objc_opt_class(self, a2);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "hash");

  return (unint64_t)v5;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLBezierPathSource;
  v3 = -[CRLBezierPathSource description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource localizationKey](self, "localizationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  v8 = NSStringFromCGSize(self->mNaturalSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("; localizationKey=%@; userDefinedName=%@; naturalSize=%@; path=%@; isRectangular=%d"),
                    v6,
                    v7,
                    v9,
                    self->mPath,
                    self->mIsRectangular));
  objc_msgSend(v5, "appendString:", v10);

  return v5;
}

- (void)setNaturalSize:(CGSize)a3
{
  CRLBezierPath *mBezierPathWithoutFlips;

  self->mNaturalSize = a3;
  mBezierPathWithoutFlips = self->mBezierPathWithoutFlips;
  self->mBezierPathWithoutFlips = 0;

}

- (CGAffineTransform)transformToNaturalSize
{
  double v5;
  double v6;
  double v7;
  double v8;
  double height;
  double width;
  CGAffineTransform *result;
  __int128 v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;

  -[CRLBezierPath bounds](self->mPath, "bounds");
  v6 = v5;
  v8 = v7;
  width = self->mNaturalSize.width;
  height = self->mNaturalSize.height;
  result = (CGAffineTransform *)sub_10005FDF0(v5, v7, width, height);
  if ((result & 1) != 0)
  {
    v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    v13 = 1.0;
    v14 = 1.0;
    if (v6 > 0.01)
    {
      v15 = width / v6;
      v14 = v15;
    }
    if (v8 > 0.01)
    {
      v16 = height / v8;
      v13 = v16;
    }
    if (width == 0.0)
      v14 = 1.0;
    v17 = v14;
    if (height == 0.0)
      v13 = 1.0;
    v18 = v13;
    return CGAffineTransformMakeScale(retstr, v17, v18);
  }
  return result;
}

- (id)bezierPathWithoutFlips
{
  id v3;
  CRLBezierPath *v4;
  CRLBezierPath *mBezierPathWithoutFlips;
  CGAffineTransform v7[2];

  v3 = -[CRLBezierPath copy](self->mBezierPathWithoutFlips, "copy");
  if (!v3)
  {
    v4 = (CRLBezierPath *)-[CRLBezierPath copy](self->mPath, "copy");
    memset(&v7[1], 0, sizeof(CGAffineTransform));
    -[CRLBezierPathSource transformToNaturalSize](self, "transformToNaturalSize");
    v7[0] = v7[1];
    if (!CGAffineTransformIsIdentity(v7))
    {
      v7[0] = v7[1];
      -[CRLBezierPath transformUsingAffineTransform:](v4, "transformUsingAffineTransform:", v7);
    }
    v3 = -[CRLBezierPath copy](v4, "copy");
    mBezierPathWithoutFlips = self->mBezierPathWithoutFlips;
    self->mBezierPathWithoutFlips = v4;

  }
  return v3;
}

- (BOOL)isRectangular
{
  return self->mIsRectangular;
}

- (BOOL)isCircular
{
  return -[CRLBezierPath isCircular](self->mPath, "isCircular");
}

- (BOOL)isClosed
{
  return !-[CRLBezierPath isOpen](self->mPath, "isOpen");
}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLShapeLibrary sharedLibrary](CRLShapeLibrary, "sharedLibrary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource localizationKey](self, "localizationKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shapeWithLocalizationKey:", v5));

    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  }
  return v3;
}

- (void)p_setBezierPath:(id)a3
{
  CRLBezierPath *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CRLBezierPath *mPath;
  CRLBezierPath *v16;
  CGFloat v17;
  CGFloat v18;
  CRLBezierPath *mBezierPathWithoutFlips;
  CGAffineTransform v20;

  v4 = (CRLBezierPath *)a3;
  if (!v4)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237F10);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA7A4(v5, v6, v7);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237F30);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierPathSource p_setBezierPath:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBezierPathSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 178, 0, "invalid nil value for '%{public}s'", "path");

  }
  -[CRLBezierPath bounds](v4, "bounds");
  v12 = v11;
  v14 = v13;
  if (!sub_10005FDF0(v11, v13, CGPointZero.x, CGPointZero.y))
  {
    CGAffineTransformMakeTranslation(&v20, -v12, -v14);
    -[CRLBezierPath transformUsingAffineTransform:](v4, "transformUsingAffineTransform:", &v20);
  }
  mPath = self->mPath;
  self->mPath = v4;
  v16 = v4;

  -[CRLBezierPath bounds](self->mPath, "bounds");
  self->mNaturalSize.width = v17;
  self->mNaturalSize.height = v18;
  self->mIsRectangular = -[CRLBezierPath isRectangular](self->mPath, "isRectangular");
  mBezierPathWithoutFlips = self->mBezierPathWithoutFlips;
  self->mBezierPathWithoutFlips = 0;

}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CRLBezierPath inferredAccessibilityDescription](self->mPath, "inferredAccessibilityDescription"));

    v3 = (void *)v4;
  }
  return v3;
}

- (id)inferredAccessibilityDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLShapeLibrary sharedLibrary](CRLShapeLibrary, "sharedLibrary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource localizationKey](self, "localizationKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shapeWithLocalizationKey:", v5));

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v3 = (void *)v7;
  }
  if (!objc_msgSend(v3, "length"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CRLBezierPath inferredAccessibilityDescription](self->mPath, "inferredAccessibilityDescription"));

    v3 = (void *)v8;
  }
  return v3;
}

- (id)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  return -[CRLBezierPath inferredLocalizedAccessibilityDescriptionPlaceholder](self->mPath, "inferredLocalizedAccessibilityDescriptionPlaceholder");
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->mNaturalSize.width;
  height = self->mNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBezierPathWithoutFlips, 0);
  objc_storeStrong((id *)&self->mPath, 0);
}

@end
