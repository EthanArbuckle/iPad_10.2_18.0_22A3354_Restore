@implementation VKFrameInfo

- (unint64_t)sceneStability
{
  return self->_sceneStability;
}

- (void)setSceneStability:(unint64_t)a3
{
  self->_sceneStability = a3;
}

- (double)luminosity
{
  return self->_luminosity;
}

- (void)setLuminosity:(double)a3
{
  self->_luminosity = a3;
}

- (CGSize)dimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_dimensions.width;
  height = self->_dimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDimensions:(CGSize)a3
{
  self->_dimensions = a3;
}

- (CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRegionOfInterest:(CGRect)a3
{
  self->_regionOfInterest = a3;
}

- (CGAffineTransform)visionToLayerTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (void)setVisionToLayerTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_visionToLayerTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_visionToLayerTransform.c = v4;
  *(_OWORD *)&self->_visionToLayerTransform.a = v3;
}

- (CGAffineTransform)visionToCroppedImageTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].b;
  return self;
}

- (void)setVisionToCroppedImageTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_visionToCroppedImageTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_visionToCroppedImageTransform.c = v4;
  *(_OWORD *)&self->_visionToCroppedImageTransform.a = v3;
}

- (CGAffineTransform)imageToLayerTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].b;
  return self;
}

- (void)setImageToLayerTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_imageToLayerTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_imageToLayerTransform.c = v4;
  *(_OWORD *)&self->_imageToLayerTransform.a = v3;
}

@end
