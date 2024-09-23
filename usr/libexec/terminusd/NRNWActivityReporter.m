@implementation NRNWActivityReporter

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc((Class)NSString);
  if (self->_started)
    v4 = "";
  else
    v4 = "!";
  return objc_msgSend(v3, "initWithFormat:", CFSTR("[%llu %sreporting %@]"), self->_identifier, v4, self->_nrUUID);
}

- (void)dealloc
{
  NRNWActivityReporter *v2;
  void *v3;
  int IsLevelEnabled;
  const char *v5;
  NSUUID *nrUUID;
  NSUUID *v7;
  uint64_t v8;
  void *v9;
  NSUUID *v10;
  void *v11;
  objc_super v12;

  v2 = self;
  if (self)
    self = (NRNWActivityReporter *)self->_nrUUID;
  v3 = (void *)_NRCopyLogObjectForNRUUID(self, a2);
  IsLevelEnabled = _NRLogIsLevelEnabled(v3, 1);

  if (IsLevelEnabled)
  {
    if (v2)
      nrUUID = v2->_nrUUID;
    else
      nrUUID = 0;
    v7 = nrUUID;
    v9 = (void *)_NRCopyLogObjectForNRUUID(v7, v8);
    _NRLogWithArgs(v9, 1, "%s%.30s:%-4d %@: dealloc", ", "-[NRNWActivityReporter dealloc]", 63, v2);

  }
  if (v2)
  {
    v2->_started = 0;
    objc_setProperty_nonatomic_copy(v2, v5, 0, 40);
    v10 = v2->_nrUUID;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRNWActivityReporter description](v2, "description"));
    sub_100121E18(v10, 40003, v11, 0);

  }
  v12.receiver = v2;
  v12.super_class = (Class)NRNWActivityReporter;
  -[NRNWActivityReporter dealloc](&v12, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
}

@end
