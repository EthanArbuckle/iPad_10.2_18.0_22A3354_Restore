@implementation PLFetchRecordingIndexEntry

- (PLFetchRecordingIndexEntry)initWithOffset:(int64_t)a3
{
  PLFetchRecordingIndexEntry *result;
  void *v7;
  objc_super v8;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFetchRecording.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offset > 0"));

  }
  v8.receiver = self;
  v8.super_class = (Class)PLFetchRecordingIndexEntry;
  result = -[PLFetchRecordingIndexEntry init](&v8, sel_init);
  if (result)
  {
    result->_entryLock._os_unfair_lock_opaque = 0;
    result->_offset = a3;
  }
  return result;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_entryLock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_entryLock);
}

- (void)entryLocked_markUnavailable
{
  os_unfair_lock_assert_owner(&self->_entryLock);
  self->_unavailable = 1;
}

- (PLFetchRecordingFileNormalizedStatementHeader)entryLocked_statementEntryFomBuffer:(void *)a3
{
  if (!a3)
    return 0;
  if (-[PLFetchRecordingIndexEntry unavailable](self, "unavailable"))
    return 0;
  return (PLFetchRecordingFileNormalizedStatementHeader *)((char *)a3
                                                         + -[PLFetchRecordingIndexEntry offset](self, "offset"));
}

- (int64_t)offset
{
  return self->_offset;
}

- (BOOL)unavailable
{
  return self->_unavailable;
}

@end
