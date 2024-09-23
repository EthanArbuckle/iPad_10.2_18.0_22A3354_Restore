@implementation PXGViewRecordingFrameEndEvent

- (PXGViewRecordingFrameEndEvent)init
{
  PXGViewRecordingFrameEndEvent *v2;
  PXGViewRecordingFrameEndEventSerializable *v3;
  PXGViewRecordingFrameEndEventSerializable *serializable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGViewRecordingFrameEndEvent;
  v2 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v6, sel_initWithComponent_eventName_, 2, CFSTR("frameEnd"));
  if (v2)
  {
    v3 = objc_alloc_init(PXGViewRecordingFrameEndEventSerializable);
    serializable = v2->_serializable;
    v2->_serializable = v3;

  }
  return v2;
}

- (id)serializable
{
  return self->_serializable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializable, 0);
}

+ (id)event
{
  return objc_alloc_init((Class)a1);
}

@end
