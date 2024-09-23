@implementation WFWorkflowConflict

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowConflict localWorkflowID](self, "localWorkflowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowConflict remoteWorkflowID](self, "remoteWorkflowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p local: (%@) remote: (%@)>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WFWorkflowConflict *v4;
  WFWorkflowConflict *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (WFWorkflowConflict *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WFWorkflowConflict localWorkflowID](self, "localWorkflowID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowConflict localWorkflowID](v5, "localWorkflowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[WFWorkflowConflict remoteWorkflowID](self, "remoteWorkflowID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowConflict remoteWorkflowID](v5, "remoteWorkflowID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)resolutionKeepingLocal:(BOOL)a3 keepingRemote:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_opt_new();
  -[WFWorkflowConflict localWorkflowID](self, "localWorkflowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalWorkflowID:", v8);

  -[WFWorkflowConflict remoteWorkflowID](self, "remoteWorkflowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteWorkflowID:", v9);

  objc_msgSend(v7, "setKeepLocal:", v5);
  objc_msgSend(v7, "setKeepRemote:", v4);
  return v7;
}

- (NSString)localWorkflowID
{
  return self->_localWorkflowID;
}

- (void)setLocalWorkflowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (WFWorkflowRecord)localWorkflowRecord
{
  return self->_localWorkflowRecord;
}

- (void)setLocalWorkflowRecord:(id)a3
{
  objc_storeStrong((id *)&self->_localWorkflowRecord, a3);
}

- (NSString)remoteWorkflowID
{
  return self->_remoteWorkflowID;
}

- (void)setRemoteWorkflowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (WFWorkflowRecord)remoteWorkflowRecord
{
  return self->_remoteWorkflowRecord;
}

- (void)setRemoteWorkflowRecord:(id)a3
{
  objc_storeStrong((id *)&self->_remoteWorkflowRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteWorkflowRecord, 0);
  objc_storeStrong((id *)&self->_remoteWorkflowID, 0);
  objc_storeStrong((id *)&self->_localWorkflowRecord, 0);
  objc_storeStrong((id *)&self->_localWorkflowID, 0);
}

@end
