@implementation WFWorkflowConflictResolution

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFWorkflowConflictResolution keepLocal](self, "keepLocal");
  -[WFWorkflowConflictResolution localWorkflowID](self, "localWorkflowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFWorkflowConflictResolution keepRemote](self, "keepRemote");
  -[WFWorkflowConflictResolution remoteWorkflowID](self, "remoteWorkflowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p keepLocal=%d (%@) keepRemote=%d (%@)>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)localWorkflowID
{
  return self->_localWorkflowID;
}

- (void)setLocalWorkflowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)remoteWorkflowID
{
  return self->_remoteWorkflowID;
}

- (void)setRemoteWorkflowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)keepLocal
{
  return self->_keepLocal;
}

- (void)setKeepLocal:(BOOL)a3
{
  self->_keepLocal = a3;
}

- (BOOL)keepRemote
{
  return self->_keepRemote;
}

- (void)setKeepRemote:(BOOL)a3
{
  self->_keepRemote = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteWorkflowID, 0);
  objc_storeStrong((id *)&self->_localWorkflowID, 0);
}

@end
