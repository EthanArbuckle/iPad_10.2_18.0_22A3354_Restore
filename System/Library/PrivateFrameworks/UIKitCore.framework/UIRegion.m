@implementation UIRegion

- (PKRegion)_region
{
  return self->_region;
}

- (UIBezierPath)path
{
  return +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", -[PKRegion path](self->_region, "path"));
}

+ (UIRegion)infiniteRegion
{
  if (qword_1ECD7D828 != -1)
    dispatch_once(&qword_1ECD7D828, &__block_literal_global_178);
  return (UIRegion *)(id)_MergedGlobals_1024;
}

void __26__UIRegion_infiniteRegion__block_invoke()
{
  UIRegion *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(UIRegion);
  v1 = (void *)_MergedGlobals_1024;
  _MergedGlobals_1024 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0D7D338], "infiniteRegion");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(_MergedGlobals_1024 + 8);
  *(_QWORD *)(_MergedGlobals_1024 + 8) = v2;

}

- (UIRegion)initWithCoder:(id)a3
{
  id v4;
  UIRegion *v5;
  uint64_t v6;
  PKRegion *region;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRegion;
  v5 = -[UIRegion init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_region"));
    v6 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (PKRegion *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKRegion *region;
  id v5;

  v5 = a3;
  region = self->_region;
  if (region)
    objc_msgSend(v5, "encodeObject:forKey:", region, CFSTR("_region"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_region);
  return v4;
}

- (UIRegion)initWithRadius:(CGFloat)radius
{
  UIRegion *v4;
  id v5;
  float v6;
  CGFloat v7;
  uint64_t v8;
  PKRegion *region;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIRegion;
  v4 = -[UIRegion init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D7D338]);
    PKGet_PTM_RATIO();
    v7 = v6 * radius;
    *(float *)&v7 = v7;
    v8 = objc_msgSend(v5, "initWithRadius:", v7);
    region = v4->_region;
    v4->_region = (PKRegion *)v8;

  }
  return v4;
}

- (UIRegion)initWithSize:(CGSize)size
{
  double height;
  double width;
  UIRegion *v5;
  float v6;
  float v7;
  int v8;
  id v9;
  double v10;
  uint64_t v11;
  PKRegion *region;
  objc_super v14;

  height = size.height;
  width = size.width;
  v14.receiver = self;
  v14.super_class = (Class)UIRegion;
  v5 = -[UIRegion init](&v14, sel_init);
  if (v5)
  {
    PKGet_PTM_RATIO();
    v7 = v6;
    v8 = dyld_program_sdk_at_least();
    v9 = objc_alloc(MEMORY[0x1E0D7D338]);
    v10 = v7;
    if (!v8)
      v10 = v7 * 0.5;
    v11 = objc_msgSend(v9, "initWithSize:", width * v10, height * v10);
    region = v5->_region;
    v5->_region = (PKRegion *)v11;

  }
  return v5;
}

- (UIRegion)initWithPath:(id)a3
{
  id v4;
  UIRegion *v5;
  uint64_t v6;
  PKRegion *region;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRegion;
  v5 = -[UIRegion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7D338]), "initWithPath:", objc_msgSend(objc_retainAutorelease(v4), "CGPath"));
    region = v5->_region;
    v5->_region = (PKRegion *)v6;

  }
  return v5;
}

- (UIRegion)inverseRegion
{
  id *v2;
  uint64_t v3;
  id v4;

  v2 = (id *)-[UIRegion copy](self, "copy");
  objc_msgSend(v2[1], "inverseRegion");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v2[1];
  v2[1] = (id)v3;

  return (UIRegion *)v2;
}

- (UIRegion)regionByUnionWithRegion:(UIRegion *)region
{
  UIRegion *v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = region;
  v5 = (id *)-[UIRegion copy](self, "copy");
  objc_msgSend(v5[1], "regionByUnionWithRegion:", v4->_region);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[1];
  v5[1] = (id)v6;

  return (UIRegion *)v5;
}

- (UIRegion)regionByDifferenceFromRegion:(UIRegion *)region
{
  UIRegion *v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = region;
  v5 = (id *)-[UIRegion copy](self, "copy");
  objc_msgSend(v5[1], "regionByDifferenceFromRegion:", v4->_region);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[1];
  v5[1] = (id)v6;

  return (UIRegion *)v5;
}

- (UIRegion)regionByIntersectionWithRegion:(UIRegion *)region
{
  UIRegion *v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = region;
  v5 = (id *)-[UIRegion copy](self, "copy");
  objc_msgSend(v5[1], "regionByIntersectionWithRegion:", v4->_region);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[1];
  v5[1] = (id)v6;

  return (UIRegion *)v5;
}

- (BOOL)containsPoint:(CGPoint)point
{
  PKRegion *region;

  region = self->_region;
  if (region)
    LOBYTE(region) = -[PKRegion containsPoint:](region, "containsPoint:", point.x, point.y);
  return (char)region;
}

- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a7 >= 1)
  {
    v21 = v12;
    v22 = v11;
    v23 = v10;
    v24 = v9;
    v25 = v8;
    v26 = v7;
    v27 = v13;
    v28 = v14;
    v15 = a7;
    v20 = (float *)(a3 + 1);
    do
    {
      *a5 = -[UIRegion containsPoint:](self, "containsPoint:", *(v20 - 1), *v20, v21, v22, v23, v24, v25, v26, v27, v28);
      a5 += a6;
      v20 = (float *)((char *)v20 + a4);
      --v15;
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

@end
