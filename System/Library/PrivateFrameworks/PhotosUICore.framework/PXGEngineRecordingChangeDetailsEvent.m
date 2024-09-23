@implementation PXGEngineRecordingChangeDetailsEvent

- (PXGEngineRecordingChangeDetailsEvent)initWithChangeDetails:(id)a3
{
  id v4;
  PXGEngineRecordingChangeDetailsEvent *v5;
  uint64_t v6;
  PXGChangeDetails *changeDetails;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGEngineRecordingChangeDetailsEvent;
  v5 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v9, sel_initWithComponent_eventName_, 0, CFSTR("changeDetails"));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    changeDetails = v5->_changeDetails;
    v5->_changeDetails = (PXGChangeDetails *)v6;

  }
  return v5;
}

- (id)serializable
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  PXGEngineRecordingChangeDetailsSerializable *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self->_changeDetails, "hasAnyInsertionsRemovalsOrMoves"))
  {
    v4 = -[PXGChangeDetails spriteIndexAfterChangeBySpriteIndexBeforeChange](self->_changeDetails, "spriteIndexAfterChangeBySpriteIndexBeforeChange");
    if (-[PXGChangeDetails numberOfSpritesBeforeChange](self->_changeDetails, "numberOfSpritesBeforeChange"))
    {
      v5 = 0;
      do
      {
        v6 = *(unsigned int *)(v4 + 4 * v5);
        if (v5 != v6 && (_DWORD)v6 != -1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v8, v9);

        }
        ++v5;
      }
      while (v5 < -[PXGChangeDetails numberOfSpritesBeforeChange](self->_changeDetails, "numberOfSpritesBeforeChange"));
    }
  }
  v10 = objc_alloc_init(PXGEngineRecordingChangeDetailsSerializable);
  -[PXGEngineRecordingChangeDetailsSerializable setChangeDetails:](v10, "setChangeDetails:", v3);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

+ (id)eventWithChangeDetails:(id)a3
{
  id v3;
  PXGEngineRecordingChangeDetailsEvent *v4;

  v3 = a3;
  v4 = -[PXGEngineRecordingChangeDetailsEvent initWithChangeDetails:]([PXGEngineRecordingChangeDetailsEvent alloc], "initWithChangeDetails:", v3);

  return v4;
}

@end
