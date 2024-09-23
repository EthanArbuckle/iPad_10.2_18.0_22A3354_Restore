@implementation PXGMetalRecordingFrameStartEvent

- (PXGMetalRecordingFrameStartEvent)initWithViewSize:(CGSize)a3 renderOrigin:(double)a4 screenScale:
{
  double v4;
  double v5;
  double height;
  double width;
  PXGMetalRecordingFrameStartEvent *v8;
  PXGMetalRecordingFrameStartEventSerializable *v9;
  PXGMetalRecordingFrameStartEventSerializable *serializable;
  objc_super v13;

  v5 = v4;
  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PXGMetalRecordingFrameStartEvent;
  v8 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v13, sel_initWithComponent_eventName_, 1, CFSTR("frameStart"));
  if (v8)
  {
    v9 = objc_alloc_init(PXGMetalRecordingFrameStartEventSerializable);
    serializable = v8->_serializable;
    v8->_serializable = v9;

    -[PXGMetalRecordingFrameStartEventSerializable setViewSize:](v8->_serializable, "setViewSize:", width, height);
    -[PXGMetalRecordingFrameStartEventSerializable setRenderOrigin:](v8->_serializable, "setRenderOrigin:", a4);
    -[PXGMetalRecordingFrameStartEventSerializable setScreenScale:](v8->_serializable, "setScreenScale:", v5);
  }
  return v8;
}

- (id)serializable
{
  return self->_serializable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializable, 0);
}

+ (id)eventWithViewSize:(CGSize)a3 renderOrigin:(double)a4 screenScale:
{
  double v4;

  return -[PXGMetalRecordingFrameStartEvent initWithViewSize:renderOrigin:screenScale:]([PXGMetalRecordingFrameStartEvent alloc], "initWithViewSize:renderOrigin:screenScale:", a3.width, a3.height, a4, v4);
}

@end
