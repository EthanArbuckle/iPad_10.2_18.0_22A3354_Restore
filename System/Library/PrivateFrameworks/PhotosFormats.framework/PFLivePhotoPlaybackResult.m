@implementation PFLivePhotoPlaybackResult

- (void)setPhoto:(CGImage *)a3
{
  CGImage *photo;

  photo = self->_photo;
  if (photo != a3)
  {
    CGImageRelease(photo);
    self->_photo = CGImageRetain(a3);
  }
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_photo);
  v3.receiver = self;
  v3.super_class = (Class)PFLivePhotoPlaybackResult;
  -[PFLivePhotoPlaybackResult dealloc](&v3, sel_dealloc);
}

- (CGImage)photo
{
  return self->_photo;
}

- (int)photoExifOrientation
{
  return self->_photoExifOrientation;
}

- (void)setPhotoExifOrientation:(int)a3
{
  self->_photoExifOrientation = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setPhotoTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_photoTime.epoch = a3->var3;
  *(_OWORD *)&self->_photoTime.value = v3;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (void)setVideoAsset:(id)a3
{
  objc_storeStrong((id *)&self->_videoAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAsset, 0);
}

@end
