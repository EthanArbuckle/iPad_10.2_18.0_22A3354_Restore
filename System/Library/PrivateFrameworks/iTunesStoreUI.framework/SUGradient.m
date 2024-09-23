@implementation SUGradient

- (SUGradient)initWithPoint0:(SUGradientPoint *)a3 point1:(SUGradientPoint *)a4 type:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  SUGradient *v18;
  objc_super v20;

  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  v16 = v6;
  v17 = v5;
  v20.receiver = self;
  v20.super_class = (Class)SUGradient;
  v18 = -[SUGradient init](&v20, sel_init, a3, a4, a5);
  if (v18)
  {
    v18->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    v18->_p0.point.x = v17;
    v18->_p0.point.y = v16;
    v18->_p0.radius = v15;
    v18->_p1.point.x = v14;
    v18->_p1.point.y = v13;
    v18->_p1.radius = v12;
    v18->_type = (int64_t)a3;
  }
  return v18;
}

- (SUGradient)initWithPropertyList:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SUGradient *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("top-color"));
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithStyleString:", v6);
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "addObject:", v7);

  }
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("bottom-color"));
  if (v9)
  {
    v10 = v9;
    if ((objc_msgSend(v6, "isEqualToString:", v9) & 1) == 0)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithStyleString:", v10);
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(v5, "addObject:", v11);

      }
    }
  }
  if (objc_msgSend(v5, "count"))
  {
    v13 = -[SUGradient initWithType:](self, "initWithType:", 0);
    v14 = objc_msgSend(v5, "count");
    if (v14 >= 1)
    {
      v15 = v14;
      v16 = 0;
      v17 = (double)v14 + -1.0;
      do
      {
        -[SUGradient addColorStopWithOffset:color:](v13, "addColorStopWithOffset:color:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v16), "CGColor"), (double)v16 / v17);
        ++v16;
      }
      while (v15 != v16);
    }
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (SUGradient)initWithType:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (a3 == 1)
  {
    v3 = 0.5;
    v4 = 0.5;
    v5 = 0.5;
    v6 = 1.0;
  }
  else
  {
    v3 = 0.0;
    v4 = 0.5;
    v5 = 1.0;
    v6 = 0.0;
  }
  return -[SUGradient initWithPoint0:point1:type:](self, "initWithPoint0:point1:type:", 0.5, v3, 0.0, v4, v5, v6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUGradient;
  -[SUGradient dealloc](&v3, sel_dealloc);
}

+ (SUGradient)gradientWithColor:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 0);
  objc_msgSend(v4, "addColorStopWithOffset:color:", objc_msgSend(a3, "CGColor"), 0.0);
  return (SUGradient *)v4;
}

- (SUGradient)initWithCoder:(id)a3
{
  SUGradient *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  float v8;
  CGFloat v9;
  CGFloat v10;
  float v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)SUGradient;
  v4 = -[SUGradient init](&v13, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v4->_colorStops = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2)), CFSTR("colorstops"));
    objc_msgSend(a3, "decodeCGPointForKey:", CFSTR("point0"));
    v4->_p0.point.x = v6;
    v4->_p0.point.y = v7;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("radius0"));
    v4->_p0.radius = v8;
    objc_msgSend(a3, "decodeCGPointForKey:", CFSTR("point1"));
    v4->_p1.point.x = v9;
    v4->_p1.point.y = v10;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("radius1"));
    v4->_p1.radius = v11;
    v4->_type = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("type"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double radius;
  double v6;

  -[NSLock lock](self->_lock, "lock");
  objc_msgSend(a3, "encodeObject:forKey:", self->_colorStops, CFSTR("colorstops"));
  objc_msgSend(a3, "encodeCGPoint:forKey:", CFSTR("point0"), self->_p0.point.x, self->_p0.point.y);
  radius = self->_p0.radius;
  *(float *)&radius = radius;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("radius0"), radius);
  objc_msgSend(a3, "encodeCGPoint:forKey:", CFSTR("point1"), self->_p1.point.x, self->_p1.point.y);
  v6 = self->_p1.radius;
  *(float *)&v6 = v6;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("radius1"), v6);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  -[NSLock unlock](self->_lock, "unlock");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  double radius;
  CGPoint point;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NSLock lock](self->_lock, "lock");
  *(_QWORD *)(v5 + 8) = -[NSMutableArray copyWithZone:](self->_colorStops, "copyWithZone:", a3);
  radius = self->_p0.radius;
  *(CGPoint *)(v5 + 24) = self->_p0.point;
  *(double *)(v5 + 40) = radius;
  point = self->_p1.point;
  *(double *)(v5 + 64) = self->_p1.radius;
  *(CGPoint *)(v5 + 48) = point;
  *(_BYTE *)(v5 + 72) = self->_sorted;
  *(_QWORD *)(v5 + 80) = self->_type;
  -[NSLock unlock](self->_lock, "unlock");
  return (id)v5;
}

- (void)addColorStopWithOffset:(double)a3 color:(CGColor *)a4
{
  SUGradientColorStop *v7;

  -[NSLock lock](self->_lock, "lock");
  if (!self->_colorStops)
    self->_colorStops = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = -[SUGradientColorStop initWithColor:offset:]([SUGradientColorStop alloc], "initWithColor:offset:", a4, a3);
  -[NSMutableArray addObject:](self->_colorStops, "addObject:", v7);

  self->_sorted = 0;
  -[NSLock unlock](self->_lock, "unlock");
}

- (NSArray)colorStopColors
{
  NSArray *v3;
  NSMutableArray *colorStops;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  CGColor *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  -[NSLock lock](self->_lock, "lock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  colorStops = self->_colorStops;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](colorStops, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(colorStops);
        v9 = (CGColor *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "copyCGColor");
        -[NSArray addObject:](v3, "addObject:", v9);
        CGColorRelease(v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](colorStops, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSArray)colorStopOffsets
{
  NSArray *v3;
  NSMutableArray *colorStops;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  -[NSLock lock](self->_lock, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  colorStops = self->_colorStops;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](colorStops, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(colorStops);
        v9 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "offset");
        *(float *)&v10 = v10;
        -[NSArray addObject:](v3, "addObject:", objc_msgSend(v9, "numberWithFloat:", v10));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](colorStops, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (CGGradient)copyCGGradient
{
  uint64_t v3;
  uint64_t v4;
  CGFloat *v5;
  CGFloat *v6;
  void *v7;
  uint64_t i;
  void *v9;
  CGColor *v10;
  CGFloat v11;
  CGGradient *v12;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[NSMutableArray count](self->_colorStops, "count");
  if (v3 >= 1 && (v4 = v3, (v5 = (CGFloat *)malloc_type_malloc(8 * v3, 0x100004000313F17uLL)) != 0))
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
    for (i = 0; i != v4; ++i)
    {
      v9 = (void *)-[NSMutableArray objectAtIndex:](self->_colorStops, "objectAtIndex:", i);
      v10 = (CGColor *)objc_msgSend(v9, "copyCGColor");
      objc_msgSend(v7, "addObject:", v10);
      CGColorRelease(v10);
      objc_msgSend(v9, "offset");
      v6[i] = v11;
    }
    v12 = CGGradientCreateWithColors(0, (CFArrayRef)v7, v6);

    free(v6);
  }
  else
  {
    v12 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v12;
}

- (CGShading)copyShading
{
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v4;
  void *v5;
  CGFunction *v6;
  CGFloat x;
  CGFloat y;
  CGShadingRef Radial;
  CGShading *v10;
  CGFunctionCallbacks v12;
  CGFloat range[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CGFloat domain[3];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB)
    return 0;
  v4 = DeviceRGB;
  -[NSLock lock](self->_lock, "lock");
  if (!self->_sorted)
  {
    -[NSMutableArray sortUsingSelector:](self->_colorStops, "sortUsingSelector:", sel_compare_);
    self->_sorted = 1;
  }
  v5 = (void *)-[NSMutableArray copy](self->_colorStops, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  *(_OWORD *)domain = xmmword_21B558270;
  range[0] = 0.0;
  v14 = 0;
  v16 = 0;
  range[1] = 1.0;
  v15 = 0x3FF0000000000000;
  v17 = 0x3FF0000000000000;
  v18 = 0;
  v19 = 0x3FF0000000000000;
  *(_OWORD *)&v12.version = xmmword_24DE7D1B0;
  v12.releaseInfo = (CGFunctionReleaseInfoCallback)0x182A98718;
  v6 = CGFunctionCreate(v5, 1uLL, domain, 4uLL, range, &v12);
  x = self->_p0.point.x;
  y = self->_p0.point.y;
  if (self->_type)
    Radial = CGShadingCreateRadial(v4, *(CGPoint *)&x, self->_p0.radius, self->_p1.point, self->_p1.radius, v6, 1, 1);
  else
    Radial = CGShadingCreateAxial(v4, *(CGPoint *)&x, self->_p1.point, v6, 1, 1);
  v10 = Radial;
  CGFunctionRelease(v6);
  CGColorSpaceRelease(v4);
  return v10;
}

- (int64_t)gradientType
{
  return self->_type;
}

- (id)newPatternColorWithSize:(CGSize)a3 opaque:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  void *v8;
  CGGradient *v9;
  CGGradient *v10;
  double v11;
  CGFloat v12;
  CGContext *CurrentContext;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGSize v21;
  CGPoint v22;
  CGPoint v23;

  height = a3.height;
  width = a3.width;
  if (-[SUGradient gradientType](self, "gradientType"))
    return 0;
  v9 = -[SUGradient copyCGGradient](self, "copyCGGradient");
  if (!v9)
    return 0;
  v10 = v9;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  v12 = v11;
  v21.width = width;
  v21.height = height;
  UIGraphicsBeginImageContextWithOptions(v21, a4, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, width, height);
  -[SUGradient p0](self, "p0");
  v15 = v14;
  v17 = v16;
  -[SUGradient p1](self, "p1");
  v23.x = v18;
  v23.y = v19;
  v22.x = v15;
  v22.y = v17;
  CGContextDrawLinearGradient(CurrentContext, v10, v22, v23, 3u);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithPatternImage:", UIGraphicsGetImageFromCurrentImageContext());
  if (v8)
  {
    objc_setAssociatedObject(v8, "com.apple.iTunesStoreUI.SUGradient.iscolor", (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), (void *)1);
    objc_setAssociatedObject(v8, "com.apple.iTunesStoreUI.SUGradient.size", (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", width, height), (void *)1);
  }
  UIGraphicsEndImageContext();
  CGGradientRelease(v10);
  return v8;
}

- (int64_t)numberOfColorStops
{
  int64_t v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[NSMutableArray count](self->_colorStops, "count");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (SUGradientPoint)p0
{
  return self;
}

- (SUGradientPoint)p1
{
  return self;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUGradient;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Colorstops: %@"), -[SUGradient description](&v3, sel_description), self->_colorStops);
}

@end
