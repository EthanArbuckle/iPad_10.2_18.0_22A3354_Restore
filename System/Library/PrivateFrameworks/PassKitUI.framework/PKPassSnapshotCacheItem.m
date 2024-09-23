@implementation PKPassSnapshotCacheItem

- (PKPassSnapshotCacheItem)initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  PKPassSnapshotCacheItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassSnapshotCacheItem;
  v6 = -[PKPassSnapshotCacheItem init](&v8, sel_init);
  if (v6)
  {
    v6->_image = CGImageRetain(a3);
    v6->_scale = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PKPassSnapshotCacheItem;
  -[PKPassSnapshotCacheItem dealloc](&v3, sel_dealloc);
}

- (id)UIImageFromCache
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", self->_image, 0, self->_scale);
}

@end
