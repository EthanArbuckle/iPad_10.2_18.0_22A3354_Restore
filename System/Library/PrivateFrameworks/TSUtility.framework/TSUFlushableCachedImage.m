@implementation TSUFlushableCachedImage

- (TSUFlushableCachedImage)initWithDelegate:(id)a3 createImageSelector:(SEL)a4
{
  TSUFlushableCachedImage *result;

  result = -[TSUFlushableObject init](self, "init");
  if (result)
  {
    result->_delegate = a3;
    result->_delegateCreateImageSelector = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_delegate = 0;
  self->_delegateCreateImageSelector = 0;
  -[TSUFlushableCachedImage unload](self, "unload");
  v3.receiver = self;
  v3.super_class = (Class)TSUFlushableCachedImage;
  -[TSUFlushableObject dealloc](&v3, sel_dealloc);
}

- (void)unload
{
  CGImageRelease(self->_image);
  self->_image = 0;
}

- (BOOL)hasFlushableContent
{
  return self->_image != 0;
}

- (CGImage)newImage
{
  CGImage *image;
  CGImage *v4;

  -[TSUFlushableObject ownerWillAccess](self, "ownerWillAccess");
  objc_sync_enter(self);
  image = self->_image;
  if (!image)
  {
    image = (CGImage *)objc_msgSend(self->_delegate, "performSelector:", self->_delegateCreateImageSelector);
    self->_image = image;
  }
  v4 = CGImageRetain(image);
  objc_sync_exit(self);
  -[TSUFlushableObject ownerDidAccess](self, "ownerDidAccess");
  return v4;
}

@end
