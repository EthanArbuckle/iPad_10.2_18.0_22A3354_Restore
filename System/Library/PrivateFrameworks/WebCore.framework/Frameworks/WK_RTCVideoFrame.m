@implementation WK_RTCVideoFrame

- (int)width
{
  return -[RTCVideoFrameBuffer width](self->_buffer, "width");
}

- (int)height
{
  return -[RTCVideoFrameBuffer height](self->_buffer, "height");
}

- (int64_t)rotation
{
  return self->_rotation;
}

- (int64_t)timeStampNs
{
  return self->_timeStampNs;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (id)newI420VideoFrame
{
  WK_RTCVideoFrame *v3;
  void *v4;
  WK_RTCVideoFrame *v5;

  v3 = [WK_RTCVideoFrame alloc];
  -[RTCVideoFrameBuffer toI420](self->_buffer, "toI420");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WK_RTCVideoFrame initWithBuffer:rotation:timeStampNs:](v3, "initWithBuffer:rotation:timeStampNs:", v4, self->_rotation, self->_timeStampNs);

  return v5;
}

- (WK_RTCVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 rotation:(int64_t)a4 timeStampNs:(int64_t)a5
{

  return 0;
}

- (WK_RTCVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 scaledWidth:(int)a4 scaledHeight:(int)a5 cropWidth:(int)a6 cropHeight:(int)a7 cropX:(int)a8 cropY:(int)a9 rotation:(int64_t)a10 timeStampNs:(int64_t)a11
{

  return 0;
}

- (WK_RTCVideoFrame)initWithBuffer:(id)a3 rotation:(int64_t)a4 timeStampNs:(int64_t)a5
{
  id v9;
  WK_RTCVideoFrame *v10;
  WK_RTCVideoFrame *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WK_RTCVideoFrame;
  v10 = -[WK_RTCVideoFrame init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_buffer, a3);
    v11->_rotation = a4;
    v11->_timeStampNs = a5;
    v11->_duration = 0;
  }

  return v11;
}

- (RTCVideoFrameBuffer)buffer
{
  return self->_buffer;
}

- (int64_t)timeStamp
{
  return self->timeStamp;
}

- (void)setTimeStamp:(int64_t)a3
{
  self->timeStamp = a3;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
