@implementation VFXRenderOptions

- (MTLRasterizationRateMap)rasterizationRateMap
{
  return self->_rasterizationRateMap;
}

- (void)setRasterizationRateMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)viewpoints
{
  return self->_viewpoints;
}

- (void)setViewpoints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void)setCoordinateSpace:(unint64_t)a3
{
  self->_coordinateSpace = a3;
}

- (BOOL)waitUntilCompleted
{
  return self->_waitUntilCompleted;
}

- (void)setWaitUntilCompleted:(BOOL)a3
{
  self->_waitUntilCompleted = a3;
}

@end
