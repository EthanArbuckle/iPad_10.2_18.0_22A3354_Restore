@implementation IMSizeConfigurationPredicate

+ (id)predicateForSize:(CGSize)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithSize:hasWidth:hasHeight:exactSize:", 1, 1, 0, a3.width, a3.height);
}

+ (id)predicateForExactSize:(CGSize)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithSize:hasWidth:hasHeight:exactSize:", 1, 1, 1, a3.width, a3.height);
}

+ (id)predicateForWidth:(double)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithSize:hasWidth:hasHeight:exactSize:", 1, 0, 0, a3, 0.0);
}

+ (id)predicateForHeight:(double)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithSize:hasWidth:hasHeight:exactSize:", 0, 1, 0, 0.0, a3);
}

+ (id)predicateForDisplayClassSize:(CGSize)a3
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:hasWidth:hasHeight:exactSize:", 1, 1, 0, a3.width, a3.height);
  objc_msgSend(v3, "setIsDisplayClassSize:", 1);
  return v3;
}

+ (id)predicateForLargerThan:(CGSize)a3
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:hasWidth:hasHeight:exactSize:", 1, 1, 0, a3.width, a3.height);
  objc_msgSend(v3, "setLargerThan:", 1);
  return v3;
}

- (IMSizeConfigurationPredicate)initWithSize:(CGSize)a3 hasWidth:(BOOL)a4 hasHeight:(BOOL)a5 exactSize:(BOOL)a6
{
  double height;
  double width;
  IMSizeConfigurationPredicate *v11;
  IMSizeConfigurationPredicate *v12;
  uint64_t v13;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)IMSizeConfigurationPredicate;
  v11 = -[IMConfigurationPredicate init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    v11->_size.width = width;
    v11->_size.height = height;
    v11->_hasWidth = a4;
    v11->_hasHeight = a5;
    v11->_exactSize = a6;
    if (a6)
    {
      v13 = 1000000000;
LABEL_7:
      -[IMConfigurationPredicate setScore:](v11, "setScore:", v13);
      return v12;
    }
    if (width > 0.0 && height > 0.0)
    {
      v13 = (uint64_t)(1000000000.0 - width * height);
      goto LABEL_7;
    }
  }
  return v12;
}

- (IMSizeConfigurationPredicate)init
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromSelector("initWithSize:hasWidth:hasHeight:exactSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Please use the designated initializer -[%@ %@]"), v5, v7);

  return 0;
}

- (BOOL)evaluateWithContext:(id)a3
{
  return -[IMSizeConfigurationPredicate evaluateWithFrameEnvironmentContext:](self, "evaluateWithFrameEnvironmentContext:", a3);
}

- (BOOL)evaluateWithFrameEnvironmentContext:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;

  objc_msgSend(a3, "im_frameEnvironmentBounds");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  v8 = CGRectGetWidth(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v9 = CGRectGetHeight(v23);
  if (!-[IMSizeConfigurationPredicate exactSize](self, "exactSize"))
  {
    if (-[IMSizeConfigurationPredicate largerThan](self, "largerThan"))
    {
      -[IMSizeConfigurationPredicate size](self, "size");
      if (v8 > v13)
      {
        -[IMSizeConfigurationPredicate size](self, "size");
        return v9 > v14;
      }
      return 0;
    }
    if (-[IMSizeConfigurationPredicate isDisplayClassSize](self, "isDisplayClassSize"))
    {
      -[IMSizeConfigurationPredicate size](self, "size");
      if (v8 > v9)
      {
        if (v8 <= v16)
          return 1;
        -[IMSizeConfigurationPredicate size](self, "size");
        v18 = v9 > v17;
        return !v18;
      }
      if (v8 <= v15)
        return 1;
    }
    else if (-[IMSizeConfigurationPredicate hasHeight](self, "hasHeight")
           && -[IMSizeConfigurationPredicate hasWidth](self, "hasWidth"))
    {
      -[IMSizeConfigurationPredicate size](self, "size");
      if (v8 > v19)
        return 0;
    }
    else if (!-[IMSizeConfigurationPredicate hasHeight](self, "hasHeight"))
    {
      if (!-[IMSizeConfigurationPredicate hasWidth](self, "hasWidth"))
        return 1;
      -[IMSizeConfigurationPredicate size](self, "size");
      v18 = v8 > v20;
      return !v18;
    }
    -[IMSizeConfigurationPredicate size](self, "size");
    v18 = v9 > v21;
    return !v18;
  }
  -[IMSizeConfigurationPredicate size](self, "size");
  if (v8 != v10 && vabdd_f64(v8, v10) >= fabs(v10 * 0.000000999999997))
    return 0;
  -[IMSizeConfigurationPredicate size](self, "size");
  if (v9 == v11)
    return 1;
  return vabdd_f64(v9, v11) < fabs(v11 * 0.000000999999997);
}

- (BOOL)hasWidth
{
  return self->_hasWidth;
}

- (void)setHasWidth:(BOOL)a3
{
  self->_hasWidth = a3;
}

- (BOOL)hasHeight
{
  return self->_hasHeight;
}

- (void)setHasHeight:(BOOL)a3
{
  self->_hasHeight = a3;
}

- (BOOL)isDisplayClassSize
{
  return self->_isDisplayClassSize;
}

- (void)setIsDisplayClassSize:(BOOL)a3
{
  self->_isDisplayClassSize = a3;
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

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (BOOL)exactSize
{
  return self->_exactSize;
}

- (void)setExactSize:(BOOL)a3
{
  self->_exactSize = a3;
}

- (BOOL)largerThan
{
  return self->_largerThan;
}

- (void)setLargerThan:(BOOL)a3
{
  self->_largerThan = a3;
}

@end
