@implementation VUIRootControllerConfig

- (VUIRootControllerConfig)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIRootControllerConfig;
  v2 = -[VUIRootControllerConfig init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 30);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 20);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v5;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v7;

    v9 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = &unk_1EA0BBA78;

    *((_QWORD *)v2 + 1) = 28;
    *((_QWORD *)v2 + 8) = 0x407E000000000000;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
  }
  return (VUIRootControllerConfig *)v2;
}

- (void)setWarningControllerLimit:(id)a3
{
  objc_storeStrong((id *)&self->_warningControllerLimit, a3);
}

- (void)setUserDrivenSidebarTimeout:(double)a3
{
  self->_userDrivenSidebarTimeout = a3;
}

- (void)setStackActiveDuration:(double)a3
{
  self->_stackActiveDuration = a3;
}

- (void)setSidebarImagePrefetchBatchLimit:(int64_t)a3
{
  self->_sidebarImagePrefetchBatchLimit = a3;
}

- (void)setProgrammaticOpenSidebarTimeout:(double)a3
{
  self->_programmaticOpenSidebarTimeout = a3;
}

- (void)setNormalControllerLimit:(id)a3
{
  objc_storeStrong((id *)&self->_normalControllerLimit, a3);
}

- (void)setDoNotPurgeList:(id)a3
{
  objc_storeStrong((id *)&self->_doNotPurgeList, a3);
}

- (void)setCriticalControllerLimit:(id)a3
{
  objc_storeStrong((id *)&self->_criticalControllerLimit, a3);
}

- (int64_t)sidebarImagePrefetchBatchLimit
{
  return self->_sidebarImagePrefetchBatchLimit;
}

- (double)programmaticOpenSidebarTimeout
{
  return self->_programmaticOpenSidebarTimeout;
}

- (double)userDrivenSidebarTimeout
{
  return self->_userDrivenSidebarTimeout;
}

- (NSNumber)normalControllerLimit
{
  return self->_normalControllerLimit;
}

- (NSNumber)warningControllerLimit
{
  return self->_warningControllerLimit;
}

- (NSNumber)criticalControllerLimit
{
  return self->_criticalControllerLimit;
}

- (NSArray)doNotPurgeList
{
  return self->_doNotPurgeList;
}

- (double)stackActiveDuration
{
  return self->_stackActiveDuration;
}

- (int64_t)numTeachableMomentsPerUser
{
  return self->_numTeachableMomentsPerUser;
}

- (void)setNumTeachableMomentsPerUser:(int64_t)a3
{
  self->_numTeachableMomentsPerUser = a3;
}

- (double)teachableMomentSidebarTimeout
{
  return self->_teachableMomentSidebarTimeout;
}

- (void)setTeachableMomentSidebarTimeout:(double)a3
{
  self->_teachableMomentSidebarTimeout = a3;
}

- (double)teachableMomentPillUITimeout
{
  return self->_teachableMomentPillUITimeout;
}

- (void)setTeachableMomentPillUITimeout:(double)a3
{
  self->_teachableMomentPillUITimeout = a3;
}

- (double)teachableBackgroundReshowTime
{
  return self->_teachableBackgroundReshowTime;
}

- (void)setTeachableBackgroundReshowTime:(double)a3
{
  self->_teachableBackgroundReshowTime = a3;
}

- (NSNumber)teachableMomentImpressionsDictionaryHash
{
  return self->_teachableMomentImpressionsDictionaryHash;
}

- (void)setTeachableMomentImpressionsDictionaryHash:(id)a3
{
  objc_storeStrong((id *)&self->_teachableMomentImpressionsDictionaryHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teachableMomentImpressionsDictionaryHash, 0);
  objc_storeStrong((id *)&self->_doNotPurgeList, 0);
  objc_storeStrong((id *)&self->_criticalControllerLimit, 0);
  objc_storeStrong((id *)&self->_warningControllerLimit, 0);
  objc_storeStrong((id *)&self->_normalControllerLimit, 0);
}

@end
