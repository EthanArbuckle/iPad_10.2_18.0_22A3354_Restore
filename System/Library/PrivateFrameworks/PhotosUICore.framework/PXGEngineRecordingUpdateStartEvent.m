@implementation PXGEngineRecordingUpdateStartEvent

- (PXGEngineRecordingUpdateStartEvent)initWithTargetTimestamp:(double)a3 needsUpdate:(unint64_t)a4 pendingUpdateEntities:(unint64_t)a5
{
  PXGEngineRecordingUpdateStartEvent *v8;
  PXGEngineRecordingUpdateStartEventSerializable *v9;
  PXGEngineRecordingUpdateStartEventSerializable *serializable;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXGEngineRecordingUpdateStartEvent;
  v8 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v12, sel_initWithComponent_eventName_, 0, CFSTR("updateStart"));
  if (v8)
  {
    v9 = objc_alloc_init(PXGEngineRecordingUpdateStartEventSerializable);
    serializable = v8->_serializable;
    v8->_serializable = v9;

    -[PXGEngineRecordingUpdateStartEventSerializable setTargetTimestamp:](v8->_serializable, "setTargetTimestamp:", a3);
    -[PXGEngineRecordingUpdateStartEventSerializable setNeedsUpdate:](v8->_serializable, "setNeedsUpdate:", a4);
    -[PXGEngineRecordingUpdateStartEventSerializable setPendingUpdateEntities:](v8->_serializable, "setPendingUpdateEntities:", a5);
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

+ (id)eventWithTargetTimestamp:(double)a3 needsUpdate:(unint64_t)a4 pendingUpdateEntities:(unint64_t)a5
{
  return -[PXGEngineRecordingUpdateStartEvent initWithTargetTimestamp:needsUpdate:pendingUpdateEntities:]([PXGEngineRecordingUpdateStartEvent alloc], "initWithTargetTimestamp:needsUpdate:pendingUpdateEntities:", a4, a5, a3);
}

@end
