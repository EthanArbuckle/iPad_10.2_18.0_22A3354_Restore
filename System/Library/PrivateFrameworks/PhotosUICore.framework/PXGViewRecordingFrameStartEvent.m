@implementation PXGViewRecordingFrameStartEvent

- (PXGViewRecordingFrameStartEvent)initWithViewSize:(CGSize)a3 renderOrigin:(CGPoint)a4 screenScale:(double)a5
{
  double y;
  double x;
  double height;
  double width;
  PXGViewRecordingFrameStartEvent *v10;
  PXGViewRecordingFrameStartEventSerializable *v11;
  PXGViewRecordingFrameStartEventSerializable *serializable;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)PXGViewRecordingFrameStartEvent;
  v10 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v14, sel_initWithComponent_eventName_, 2, CFSTR("frameStart"));
  if (v10)
  {
    v11 = objc_alloc_init(PXGViewRecordingFrameStartEventSerializable);
    serializable = v10->_serializable;
    v10->_serializable = v11;

    -[PXGViewRecordingFrameStartEventSerializable setViewSize:](v10->_serializable, "setViewSize:", width, height);
    -[PXGViewRecordingFrameStartEventSerializable setRenderOrigin:](v10->_serializable, "setRenderOrigin:", x, y);
    -[PXGViewRecordingFrameStartEventSerializable setScreenScale:](v10->_serializable, "setScreenScale:", a5);
  }
  return v10;
}

- (id)serializable
{
  return self->_serializable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializable, 0);
}

+ (id)eventWithViewSize:(CGSize)a3 renderOrigin:(CGPoint)a4 screenScale:(double)a5
{
  return -[PXGViewRecordingFrameStartEvent initWithViewSize:renderOrigin:screenScale:]([PXGViewRecordingFrameStartEvent alloc], "initWithViewSize:renderOrigin:screenScale:", a3.width, a3.height, a4.x, a4.y, a5);
}

@end
