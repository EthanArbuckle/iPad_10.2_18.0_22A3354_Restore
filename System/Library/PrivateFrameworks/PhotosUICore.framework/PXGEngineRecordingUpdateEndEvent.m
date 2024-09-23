@implementation PXGEngineRecordingUpdateEndEvent

- (PXGEngineRecordingUpdateEndEvent)initWithUpdated:(BOOL)a3
{
  _BOOL8 v3;
  PXGEngineRecordingUpdateEndEvent *v4;
  PXGEngineRecordingUpdateEndEventSerializable *v5;
  PXGEngineRecordingUpdateEndEventSerializable *serializable;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGEngineRecordingUpdateEndEvent;
  v4 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v8, sel_initWithComponent_eventName_, 0, CFSTR("updateEnd"));
  if (v4)
  {
    v5 = objc_alloc_init(PXGEngineRecordingUpdateEndEventSerializable);
    serializable = v4->_serializable;
    v4->_serializable = v5;

    -[PXGEngineRecordingUpdateEndEventSerializable setUpdated:](v4->_serializable, "setUpdated:", v3);
  }
  return v4;
}

- (id)serializable
{
  return self->_serializable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializable, 0);
}

+ (id)eventWithUpdated:(BOOL)a3
{
  return -[PXGEngineRecordingUpdateEndEvent initWithUpdated:]([PXGEngineRecordingUpdateEndEvent alloc], "initWithUpdated:", a3);
}

@end
