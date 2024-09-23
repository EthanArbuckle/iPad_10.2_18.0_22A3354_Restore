@implementation PLSearchIndexPendingWorkItem

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(PLSearchIndexPendingWorkItem);
  *((_BYTE *)result + 8) = self->_rebuildInProgress;
  *((_WORD *)result + 5) = self->_jobType;
  *((_QWORD *)result + 2) = self->_jobFlags;
  return result;
}

- (BOOL)rebuildInProgress
{
  return self->_rebuildInProgress;
}

- (void)setRebuildInProgress:(BOOL)a3
{
  self->_rebuildInProgress = a3;
}

- (signed)jobType
{
  return self->_jobType;
}

- (void)setJobType:(signed __int16)a3
{
  self->_jobType = a3;
}

- (int64_t)jobFlags
{
  return self->_jobFlags;
}

- (void)setJobFlags:(int64_t)a3
{
  self->_jobFlags = a3;
}

+ (id)rebuildInProgressPendingWorkItem
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setRebuildInProgress:", 1);
  return v2;
}

+ (id)pendingWorkItemWithType:(signed __int16)a3 flags:(int64_t)a4
{
  uint64_t v5;
  id v6;

  v5 = a3;
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setJobType:", v5);
  objc_msgSend(v6, "setJobFlags:", a4);
  return v6;
}

@end
