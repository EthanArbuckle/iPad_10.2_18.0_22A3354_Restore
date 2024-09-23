@implementation VGHRTFEarsFrameData

- (id)initEmpty
{
  VGHRTFEarsFrameData *v2;
  VGHRTFEarsFrameData *v3;
  VGHRTFEarsFrameData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarsFrameData;
  v2 = -[VGHRTFEarsFrameData init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (NSArray)leftEarFrames
{
  return self->_leftEarFrames;
}

- (void)setLeftEarFrames:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarFrames, a3);
}

- (NSArray)rightEarFrames
{
  return self->_rightEarFrames;
}

- (void)setRightEarFrames:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarFrames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarFrames, 0);
  objc_storeStrong((id *)&self->_leftEarFrames, 0);
}

@end
