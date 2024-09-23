@implementation PXStoryVisionSaliencyArea

- (PXStoryVisionSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4
{
  return -[PXStoryVisionSaliencyArea initWithContentsRect:confidence:type:sourceRegionOfInterest:](self, "initWithContentsRect:confidence:type:sourceRegionOfInterest:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24));
}

- (PXStoryVisionSaliencyArea)initWithContentsRect:(CGRect)a3 confidence:(float)a4 type:(int64_t)a5 sourceRegionOfInterest:(CGRect)a6
{
  PXStoryVisionSaliencyArea *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryVisionSaliencyArea;
  result = -[PXStoryConcreteSaliencyArea initWithContentsRect:confidence:](&v8, sel_initWithContentsRect_confidence_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_type = a5;
    result->_sourceRegionOfInterest = a6;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (CGRect)sourceRegionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRegionOfInterest.origin.x;
  y = self->_sourceRegionOfInterest.origin.y;
  width = self->_sourceRegionOfInterest.size.width;
  height = self->_sourceRegionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
