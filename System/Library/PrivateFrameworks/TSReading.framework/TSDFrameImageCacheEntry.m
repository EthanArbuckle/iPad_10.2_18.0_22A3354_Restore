@implementation TSDFrameImageCacheEntry

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 48; i != 80; i += 8)
    CGImageRelease(*(CGImageRef *)((char *)&self->super.isa + i));
  v4.receiver = self;
  v4.super_class = (Class)TSDFrameImageCacheEntry;
  -[TSDFrameImageCacheEntry dealloc](&v4, sel_dealloc);
}

- (CGImage)newImageForCALayer:(BOOL)a3 mask:(BOOL)a4
{
  uint64_t v4;
  Class *v5;
  CGImage *v6;

  v4 = 2;
  if (!a3)
    v4 = 0;
  v5 = &self->super.isa + (v4 | a4);
  v6 = v5[6];
  if (v6)
    CFRetain(v5[6]);
  return v6;
}

- (void)setImage:(CGImage *)a3 forCALayer:(BOOL)a4 mask:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGImage **mImages;

  v5 = a5;
  v6 = a4;
  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDFrameImageCacheEntry setImage:forCALayer:mask:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameImageCache.m"), 73, CFSTR("invalid nil value for '%s'"), "image");
  }
  v11 = 2;
  if (!v6)
    v11 = 0;
  v12 = v11 | v5;
  mImages = self->mImages;
  if (!mImages[v12])
    mImages[v12] = CGImageRetain(a3);
}

- (TSDFrameSpec)frameSpec
{
  return self->mFrameSpec;
}

- (void)setFrameSpec:(id)a3
{
  self->mFrameSpec = (TSDFrameSpec *)a3;
}

- (double)assetScale
{
  return self->mAssetScale;
}

- (void)setAssetScale:(double)a3
{
  self->mAssetScale = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->mSize.width;
  height = self->mSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  self->mViewScale = a3;
}

@end
