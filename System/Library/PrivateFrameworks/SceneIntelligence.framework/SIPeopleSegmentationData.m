@implementation SIPeopleSegmentationData

- (SIPeopleSegmentationData)initWithConfig:(id)a3
{
  id v4;
  SIPeopleSegmentationData *v5;
  SIPeopleSegmentationData *v6;
  double v7;
  double v8;
  SIPeopleSegmentationData *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIPeopleSegmentationData;
  v5 = -[SIPeopleSegmentationData init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SIPeopleSegmentationData _resolutionByConfig:](v5, "_resolutionByConfig:", v4);
    v6->_segmentation = SICreateCVPixelBuffer((unint64_t)v7, (unint64_t)v8, 0x4C303038u, 1);
    v9 = v6;
  }

  return v6;
}

- (SIPeopleSegmentationData)initWithOutputSemanticBuffer:(__CVBuffer *)a3
{
  SIPeopleSegmentationData *v4;
  SIPeopleSegmentationData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SIPeopleSegmentationData;
  v4 = -[SIPeopleSegmentationData init](&v7, sel_init);
  if (v4)
  {
    v4->_segmentation = CVPixelBufferRetain(a3);
    v5 = v4;
  }

  return v4;
}

- (CGSize)_resolutionByConfig:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v3 = objc_msgSend(a3, "networkModeEnum");
  v4 = 256.0;
  if (v3 == 1)
    v5 = 192.0;
  else
    v5 = 256.0;
  if (v3 != 1)
    v4 = 192.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_segmentation);
  v3.receiver = self;
  v3.super_class = (Class)SIPeopleSegmentationData;
  -[SIPeopleSegmentationData dealloc](&v3, sel_dealloc);
}

- (__CVBuffer)segmentation
{
  return self->_segmentation;
}

- (void)setSegmentation:(__CVBuffer *)a3
{
  self->_segmentation = a3;
}

@end
