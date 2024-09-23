@implementation VIStreamingFrame

- (VIStreamingFrame)initWithTimeStamp:(double)a3 imageContent:(id)a4 normalizedRegionOfInterest:(CGRect)a5 stabilityScore:(double)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  VIStreamingFrame *v15;
  VIStreamingFrame *v16;
  objc_super v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VIStreamingFrame;
  v15 = -[VIStreamingFrame init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_timestamp = a3;
    objc_storeStrong((id *)&v15->_imageContent, a4);
    v16->_normalizedRegionOfInterest.origin.y = y;
    v16->_normalizedRegionOfInterest.size.width = width;
    v16->_normalizedRegionOfInterest.size.height = height;
    v16->_stabilityScore = a6;
    v16->_normalizedRegionOfInterest.origin.x = x;
  }

  return v16;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (VIImageContent)imageContent
{
  return self->_imageContent;
}

- (CGRect)normalizedRegionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedRegionOfInterest.origin.x;
  y = self->_normalizedRegionOfInterest.origin.y;
  width = self->_normalizedRegionOfInterest.size.width;
  height = self->_normalizedRegionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)stabilityScore
{
  return self->_stabilityScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageContent, 0);
}

@end
