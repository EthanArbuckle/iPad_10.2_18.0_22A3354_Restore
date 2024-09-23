@implementation _UIPageIndicatorStoreObject

- (CGSize)resolvedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_indicatorSize.width;
  height = self->_indicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)activeIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_activeIndicatorSize.width;
  height = self->_activeIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)indicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_indicatorSize.width;
  height = self->_indicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)hasImage
{
  return self->_customImage || self->_activeImage != 0;
}

- (int64_t)endIndex
{
  return self->_endIndex;
}

- (BOOL)validPageWithinBound:(int64_t)a3
{
  return self->_startIndex <= a3 && self->_endIndex > a3;
}

- (UIImage)customImage
{
  return self->_customImage;
}

- (int64_t)startIndex
{
  return self->_startIndex;
}

- (UIImage)activeImage
{
  return self->_activeImage;
}

- (void)setActiveIndicatorSize:(CGSize)a3
{
  self->_activeIndicatorSize = a3;
}

- (void)invalidateLayoutInfo
{
  -[_UIPageIndicatorStoreObject setIndicatorSize:](self, "setIndicatorSize:", -1.0, -1.0);
  -[_UIPageIndicatorStoreObject setActiveIndicatorSize:](self, "setActiveIndicatorSize:", -1.0, -1.0);
}

- (void)setIndicatorSize:(CGSize)a3
{
  self->_indicatorSize = a3;
}

- (_UIPageIndicatorStoreObject)initWithStartIndex:(int64_t)a3 endIndex:(int64_t)a4
{
  _UIPageIndicatorStoreObject *v6;
  _UIPageIndicatorStoreObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIPageIndicatorStoreObject;
  v6 = -[_UIPageIndicatorStoreObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[_UIPageIndicatorStoreObject setStartIndex:](v6, "setStartIndex:", a3);
    -[_UIPageIndicatorStoreObject setEndIndex:](v7, "setEndIndex:", a4);
  }
  return v7;
}

- (void)setEndIndex:(int64_t)a3
{
  self->_endIndex = a3;
}

- (void)setStartIndex:(int64_t)a3
{
  self->_startIndex = a3;
}

- (id)splitAtIndex:(int64_t)a3 withImage:(id)a4 active:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  uint64_t v10;
  void *v11;
  _UIPageIndicatorStoreObject *v12;
  int64_t v13;
  _UIPageIndicatorStoreObject *v14;
  _UIPageIndicatorStoreObject *v15;
  _UIPageIndicatorStoreObject *v16;
  _QWORD v18[2];

  v5 = a5;
  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (self->_endIndex - self->_startIndex == 1)
  {
    v10 = 8;
    if (v5)
      v10 = 16;
    objc_storeStrong((id *)((char *)&self->super.isa + v10), a4);
    v18[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)objc_opt_new();
    if (self->_startIndex < a3)
    {
      v12 = -[_UIPageIndicatorStoreObject initWithStartIndex:endIndex:]([_UIPageIndicatorStoreObject alloc], "initWithStartIndex:endIndex:", self->_startIndex, a3);
      -[_UIPageIndicatorStoreObject _copyImagesFromObject:](v12, "_copyImagesFromObject:", self);
      objc_msgSend(v11, "addObject:", v12);

    }
    v13 = a3 + 1;
    v14 = -[_UIPageIndicatorStoreObject initWithStartIndex:endIndex:]([_UIPageIndicatorStoreObject alloc], "initWithStartIndex:endIndex:", a3, a3 + 1);
    v15 = v14;
    if (v5)
      -[_UIPageIndicatorStoreObject setActiveImage:](v14, "setActiveImage:", v9);
    else
      -[_UIPageIndicatorStoreObject setCustomImage:](v14, "setCustomImage:", v9);
    objc_msgSend(v11, "addObject:", v15);
    if (v13 < self->_endIndex)
    {
      v16 = -[_UIPageIndicatorStoreObject initWithStartIndex:endIndex:]([_UIPageIndicatorStoreObject alloc], "initWithStartIndex:endIndex:", v13, self->_endIndex);

      -[_UIPageIndicatorStoreObject _copyImagesFromObject:](v16, "_copyImagesFromObject:", self);
      objc_msgSend(v11, "addObject:", v16);
      v15 = v16;
    }

  }
  return v11;
}

- (void)setCustomImage:(id)a3
{
  objc_storeStrong((id *)&self->_customImage, a3);
  __asm { FMOV            V0.2D, #-1.0 }
  self->_indicatorSize = _Q0;
}

- (void)_copyImagesFromObject:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *customImage;
  UIImage *v7;
  UIImage *activeImage;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;

  v4 = a3;
  objc_msgSend(v4, "customImage");
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  customImage = self->_customImage;
  self->_customImage = v5;

  objc_msgSend(v4, "activeImage");
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  activeImage = self->_activeImage;
  self->_activeImage = v7;

  objc_msgSend(v4, "indicatorSize");
  self->_indicatorSize.width = v9;
  self->_indicatorSize.height = v10;
  objc_msgSend(v4, "activeIndicatorSize");
  v12 = v11;
  v14 = v13;

  self->_activeIndicatorSize.width = v12;
  self->_activeIndicatorSize.height = v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeImage, 0);
  objc_storeStrong((id *)&self->_customImage, 0);
}

- (void)setActiveImage:(id)a3
{
  objc_storeStrong((id *)&self->_activeImage, a3);
  __asm { FMOV            V0.2D, #-1.0 }
  self->_activeIndicatorSize = _Q0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  if (self->_customImage)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (!self->_activeImage)
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Custom: %@, Active: %@, Range: %ld..<%ld"), v4, self, v6, v5, self->_startIndex, self->_endIndex);
}

@end
