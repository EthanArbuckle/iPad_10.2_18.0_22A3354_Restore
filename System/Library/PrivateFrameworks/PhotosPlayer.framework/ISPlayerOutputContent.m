@implementation ISPlayerOutputContent

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_photo);
  v3.receiver = self;
  v3.super_class = (Class)ISPlayerOutputContent;
  -[ISPlayerOutputContent dealloc](&v3, sel_dealloc);
}

- (CGImage)photo
{
  return self->_photo;
}

- (ISPlayerOutputContent)initWithPhoto:(CGImage *)a3 photoIsOriginal:(BOOL)a4 photoEXIFOrientation:(int)a5 videoPlayer:(id)a6 aspectRatio:(id)a7
{
  id v13;
  id v14;
  ISPlayerOutputContent *v15;
  objc_super v17;

  v13 = a6;
  v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)ISPlayerOutputContent;
  v15 = -[ISPlayerOutputContent init](&v17, sel_init);
  if (v15)
  {
    v15->_photo = CGImageRetain(a3);
    v15->_photoIsOriginal = a4;
    v15->_photoEXIFOrientation = a5;
    objc_storeStrong((id *)&v15->_videoPlayer, a6);
    objc_storeStrong((id *)&v15->_aspectRatio, a7);
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISPlayerOutputContent;
  -[ISPlayerOutputContent description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" photo: %@, orientation: %d, video player: %@, aspect ratio: %@"), self->_photo, self->_photoEXIFOrientation, self->_videoPlayer, self->_aspectRatio);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)photoIsOriginal
{
  return self->_photoIsOriginal;
}

- (int)photoEXIFOrientation
{
  return self->_photoEXIFOrientation;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (CGSize)videoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_videoSize.width;
  height = self->_videoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSNumber)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatio, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
}

@end
