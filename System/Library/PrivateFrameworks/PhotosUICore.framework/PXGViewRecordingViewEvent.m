@implementation PXGViewRecordingViewEvent

- (PXGViewRecordingViewEvent)initWithSpriteTexture:(id)a3 payload:(id)a4 spriteIndex:(unsigned int)a5 needsParenting:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  PXGViewRecordingViewEvent *v12;
  PXGViewRecordingViewSerializable *v13;
  PXGViewRecordingViewSerializable *serializable;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  objc_super v19;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PXGViewRecordingViewEvent;
  v12 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v19, sel_initWithComponent_eventName_, 2, CFSTR("frameEnd"));
  if (v12)
  {
    v13 = objc_alloc_init(PXGViewRecordingViewSerializable);
    serializable = v12->_serializable;
    v12->_serializable = v13;

    -[PXGViewRecordingViewSerializable setSpriteIndex:](v12->_serializable, "setSpriteIndex:", v7);
    -[PXGViewRecordingViewSerializable setPresentationType:](v12->_serializable, "setPresentationType:", objc_msgSend(v10, "presentationType"));
    NSStringFromClass((Class)objc_msgSend(v11, "viewClass"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = &stru_1E5149688;
    -[PXGViewRecordingViewSerializable setPayloadViewClass:](v12->_serializable, "setPayloadViewClass:", v17);

    -[PXGViewRecordingViewSerializable setNeedsParenting:](v12->_serializable, "setNeedsParenting:", v6);
  }

  return v12;
}

- (id)serializable
{
  return self->_serializable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializable, 0);
}

+ (id)eventWithSpriteTexture:(id)a3 payload:(id)a4 spriteIndex:(unsigned int)a5 needsParenting:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpriteTexture:payload:spriteIndex:needsParenting:", v11, v10, v7, v6);

  return v12;
}

@end
