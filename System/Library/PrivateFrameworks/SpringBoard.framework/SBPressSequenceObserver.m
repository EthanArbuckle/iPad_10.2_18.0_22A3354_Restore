@implementation SBPressSequenceObserver

- (SBPressSequenceObserver)init
{
  return -[SBPressSequenceObserver initWithPressName:](self, "initWithPressName:", CFSTR("None"));
}

- (SBPressSequenceObserver)initWithPressName:(id)a3
{
  NSString *v4;
  SBPressSequenceObserver *v5;
  SBPressSequenceObserver *v6;
  SBPressCollector *v7;
  SBPressCollector *pressCollector;
  void *v9;
  objc_super v11;

  v4 = (NSString *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPressSequenceObserver;
  v5 = -[SBPressSequenceObserver init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_pressName = v4;
    v7 = objc_alloc_init(SBPressCollector);
    pressCollector = v6->_pressCollector;
    v6->_pressCollector = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__notePowerDownImminent, CFSTR("SBRestartManagerWillRebootNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBRestartManagerWillRebootNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SBPressSequenceObserver;
  -[SBPressSequenceObserver dealloc](&v4, sel_dealloc);
}

- (void)noteDidBeginSOSWithUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sosTriggerUUID, a3);
}

- (void)pressCollector:(id)a3 didCollectSequence:(id)a4
{
  NSObject *v5;
  NSUUID *sosTriggerUUID;

  if (objc_msgSend(a4, "count", a3))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBPressSequenceObserver pressCollector:didCollectSequence:].cold.1((uint64_t)self, v5);

  }
  sosTriggerUUID = self->_sosTriggerUUID;
  self->_sosTriggerUUID = 0;

}

- (void)_notePowerDownImminent
{
  -[SBPressCollector endCurrentSequence](self->_pressCollector, "endCurrentSequence");
}

- (void)_setPressCollector:(id)a3
{
  objc_storeStrong((id *)&self->_pressCollector, a3);
}

- (NSString)pressName
{
  return self->_pressName;
}

- (SBPressCollector)pressCollector
{
  return self->_pressCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressCollector, 0);
  objc_storeStrong((id *)&self->_sosTriggerUUID, 0);
}

- (void)pressCollector:(uint64_t)a1 didCollectSequence:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 8), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[SBPressSequenceObserver pressCollector:didCollectSequence:]";
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "%s: _sosTriggerUUID: %@", (uint8_t *)&v4, 0x16u);

}

@end
