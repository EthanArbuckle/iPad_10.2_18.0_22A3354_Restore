@implementation RPClipSample

- (RPClipSample)init
{
  RPClipSample *v2;
  RPClipSample *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPClipSample;
  v2 = -[RPClipSample init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[RPClipSample setSampleBuffer:](v2, "setSampleBuffer:", 0);
    LODWORD(v4) = 0;
    -[RPClipSample setSeconds:](v3, "setSeconds:", v4);
    -[RPClipSample setIsKeyFrame:](v3, "setIsKeyFrame:", 0);
  }
  return v3;
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_sampleBuffer = a3;
}

- (float)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(float)a3
{
  self->_seconds = a3;
}

- (BOOL)isKeyFrame
{
  return self->_isKeyFrame;
}

- (void)setIsKeyFrame:(BOOL)a3
{
  self->_isKeyFrame = a3;
}

@end
