@implementation PXCornerMaskCacheEntry

- (PXCornerMaskCacheEntry)initWithCornerRadius:(id)a3 size:(CGSize)a4 image:(id)a5
{
  float v5;
  float v6;
  double v7;
  double v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  float v12;
  float v13;
  float v14;
  float v15;
  id v17;
  PXCornerMaskCacheEntry *v18;
  PXCornerMaskCacheEntry *v19;
  objc_super v21;

  v9 = *(void **)&a3.var0.var0.var0;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v14 = *(float *)&a4.height;
  v15 = *(float *)&a4.width;
  v17 = *(id *)&a3.var0.var0.var0;
  v21.receiver = self;
  v21.super_class = (Class)PXCornerMaskCacheEntry;
  v18 = -[PXCornerMaskCacheEntry init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_cornerRadius.var0.var0.topLeft = v15;
    v18->_cornerRadius.var0.var0.topRight = v14;
    v18->_cornerRadius.var0.var0.bottomLeft = v13;
    v18->_cornerRadius.var0.var0.bottomRight = v12;
    v18->_size.width = v11;
    v18->_size.height = v10;
    objc_storeStrong((id *)&v18->_image, v9);
  }

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGSize v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCornerMaskCacheEntry size](self, "size");
  NSStringFromCGSize(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCornerMaskCacheEntry cornerRadius](self, "cornerRadius");
  PXGCornerRadiusDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; size:%@ cornerRadius:%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
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

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
