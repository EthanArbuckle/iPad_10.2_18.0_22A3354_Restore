@implementation SANewThreadInfo

- (id)debugDescription
{
  id v3;
  unint64_t newTid;
  uint64_t oldPid;
  uint64_t newPid;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  newTid = self->_newTid;
  oldPid = self->_oldPid;
  newPid = self->_newPid;
  -[SATimestamp debugDescription](self->_timestamp, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%d] -> [%d] 0x%llx @ %@"), oldPid, newPid, newTid, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
