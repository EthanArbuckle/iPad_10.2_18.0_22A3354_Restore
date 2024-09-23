@implementation _PBUIImageSlotRepositoryEntry

- (void)dealloc
{
  objc_super v3;

  -[_PBUIImageSlotRepositoryEntry _setBlockSet:](self, "_setBlockSet:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_PBUIImageSlotRepositoryEntry;
  -[_PBUIImageSlotRepositoryEntry dealloc](&v3, sel_dealloc);
}

- (IOSurface)ioSurface
{
  id ioSurface;
  IOSurface **p_ioSurface;
  void *v5;
  uint64_t v7;

  p_ioSurface = &self->_ioSurface;
  ioSurface = self->_ioSurface;
  if (!ioSurface)
  {
    ioSurface = self->_image;
    if (ioSurface)
    {
      v7 = 0;
      PBUICreateIOSurfaceForImage(ioSurface, &v7, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_storeStrong((id *)p_ioSurface, v5);
        -[_PBUIImageSlotRepositoryEntry _setBlockSet:](self, "_setBlockSet:", v7);
      }
      if (v7)
        CGImageBlockSetRelease();

      ioSurface = *p_ioSurface;
    }
  }
  return (IOSurface *)ioSurface;
}

- (void)_setBlockSet:(CGImageBlockSet *)a3
{
  CGImageBlockSet *blockSet;

  blockSet = self->_blockSet;
  if (blockSet != a3)
  {
    CGImageBlockSetRetain();
    self->_blockSet = a3;
    if (blockSet)
      CGImageBlockSetRelease();
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (int64_t)actualStyle
{
  return self->_actualStyle;
}

- (void)setActualStyle:(int64_t)a3
{
  self->_actualStyle = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_ioSurface, 0);
}

@end
