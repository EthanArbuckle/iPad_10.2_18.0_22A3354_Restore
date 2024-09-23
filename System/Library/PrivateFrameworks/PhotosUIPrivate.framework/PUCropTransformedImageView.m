@implementation PUCropTransformedImageView

- (void)_setTracking:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[PUCropTransformedImageView isTracking](self, "isTracking") != a3)
  {
    if (v3)
    {
      -[PUCropTransformedImageView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cropTransformedImageViewWillBeginTracking:", self);

      self->_tracking = 1;
    }
    else
    {
      self->_tracking = 0;
      -[PUCropTransformedImageView delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cropTransformedImageViewDidEndTracking:", self);

    }
  }
}

- (id)cropModel
{
  return 0;
}

- (void)setModelCropRect:(CGRect)a3 viewCropRect:(CGRect)a4
{
  self->_cropRect = a4;
}

- (BOOL)isMuted
{
  return 0;
}

- (void)setImage:(id)a3
{
  PUCropTransformedImageView *v4;
  id v5;
  objc_class *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = self;
  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  v4 = (PUCropTransformedImageView *)((char *)v4 + 496);
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  v4->super.super.super.isa = v7;
  *(_QWORD *)&v4->super.super._responderFlags = v9;
}

- (CGRect)_imageBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PUCropTransformedImageView imageSize](self, "imageSize");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)canvasFrame
{
  CGRect *p_canvasFrame;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_canvasFrame = &self->_canvasFrame;
  if (CGRectIsEmpty(self->_canvasFrame))
  {
    -[PUCropTransformedImageView bounds](self, "bounds");
  }
  else
  {
    x = p_canvasFrame->origin.x;
    y = p_canvasFrame->origin.y;
    width = p_canvasFrame->size.width;
    height = p_canvasFrame->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVideoComposition:(id)a3 withSeekTime:(id *)a4
{
  objc_storeStrong((id *)&self->_videoComposition, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (NUMediaView)videoMediaView
{
  return self->_videoMediaView;
}

- (void)setVideoMediaView:(id)a3
{
  objc_storeStrong((id *)&self->_videoMediaView, a3);
}

- (NUComposition)autoloopComposition
{
  return self->_autoloopComposition;
}

- (void)setAutoloopComposition:(id)a3
{
  objc_storeStrong((id *)&self->_autoloopComposition, a3);
}

- (NUComposition)videoComposition
{
  return self->_videoComposition;
}

- ($5A0616AB7869379E861635CACF312FD6)imageModulationOptions
{
  $905D32049B9A80FAC5D7A68DC94C5166 *p_imageModulationOptions;
  int64_t privateInteger;
  uint64_t v4;
  $5A0616AB7869379E861635CACF312FD6 result;

  p_imageModulationOptions = &self->_imageModulationOptions;
  privateInteger = self->_imageModulationOptions.privateInteger;
  v4 = *(_QWORD *)&p_imageModulationOptions->privateFloat;
  result.var1 = *(float *)&v4;
  result.var0 = privateInteger;
  return result;
}

- (void)setImageModulationOptions:(id)a3
{
  self->_imageModulationOptions = ($905D32049B9A80FAC5D7A68DC94C5166)a3;
}

- (BOOL)shouldEnableImageModulation
{
  return self->_shouldEnableImageModulation;
}

- (void)setShouldEnableImageModulation:(BOOL)a3
{
  self->_shouldEnableImageModulation = a3;
}

- (PUCropTransformedImageViewDelegate)delegate
{
  return (PUCropTransformedImageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)straightenAngle
{
  return self->_straightenAngle;
}

- (void)setStraightenAngle:(double)a3
{
  self->_straightenAngle = a3;
}

- (double)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(double)a3
{
  self->_pitchAngle = a3;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(double)a3
{
  self->_yawAngle = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCanvasFrame:(CGRect)a3
{
  self->_canvasFrame = a3;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (BOOL)isDecelerating
{
  return self->_decelerating;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_autoloopComposition, 0);
  objc_storeStrong((id *)&self->_videoMediaView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
