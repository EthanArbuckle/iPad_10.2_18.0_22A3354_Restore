@implementation PBCodable

- (id)_nsurlsessionproxy_launchUUID
{
  void *v3;
  void *v4;
  void *v5;

  if ((objc_opt_respondsToSelector(self, "launchUUID") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable launchUUID](self, "launchUUID"));
  }
  else
  {
    if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchUUID"));

    }
    else
    {
      if ((objc_opt_respondsToSelector(self, "hasSession") & 1) == 0
        || !-[PBCodable hasSession](self, "hasSession"))
      {
        v3 = 0;
        return v3;
      }
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "launchUUID"));
    }

  }
  return v3;
}

- (void)_nsurlsessionproxy_setLaunchUUID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
    objc_msgSend(v5, "setLaunchUUID:", v6);

LABEL_7:
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector(self, "hasSession") & 1) != 0
    && -[PBCodable hasSession](self, "hasSession"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
    objc_msgSend(v4, "setLaunchUUID:", v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)_nsurlsessionproxy_sessionUUID
{
  void *v3;
  void *v4;
  void *v5;

  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuidString"));

  }
  else
  {
    if ((objc_opt_respondsToSelector(self, "hasSession") & 1) == 0
      || !-[PBCodable hasSession](self, "hasSession"))
    {
      v5 = 0;
      return v5;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuidString"));
  }

  return v5;
}

- (void)_nsurlsessionproxy_setSessionUUID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
    objc_msgSend(v5, "setUuidString:", v6);

LABEL_7:
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector(self, "hasSession") & 1) != 0
    && -[PBCodable hasSession](self, "hasSession"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
    objc_msgSend(v4, "setUuidString:", v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)_nsurlsessionproxy_sessionIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionIdentifier"));

  }
  else
  {
    if ((objc_opt_respondsToSelector(self, "hasSession") & 1) == 0
      || !-[PBCodable hasSession](self, "hasSession"))
    {
      v5 = 0;
      return v5;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sessionIdentifier"));
  }

  return v5;
}

- (unint64_t)_nsurlsessionproxy_taskIdentifier
{
  void *v3;
  id v4;

  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) == 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
  v4 = objc_msgSend(v3, "taskIdentifier");

  return (unint64_t)v4;
}

- (unint64_t)_nsurlsessionproxy_sequenceNumber
{
  void *v3;
  void *v4;
  id v5;

  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
    v5 = objc_msgSend(v4, "sequenceNumber");

  }
  else
  {
    if ((objc_opt_respondsToSelector(self, "hasSession") & 1) == 0
      || !-[PBCodable hasSession](self, "hasSession"))
    {
      return 0;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
    v5 = objc_msgSend(v3, "sequenceNumber");
  }

  return (unint64_t)v5;
}

- (void)_nsurlsessionproxy_setSequenceNumber:(unint64_t)a3
{
  void *v5;
  id v6;

  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
    objc_msgSend(v5, "setSequenceNumber:", a3);

LABEL_7:
    return;
  }
  if ((objc_opt_respondsToSelector(self, "hasSession") & 1) != 0
    && -[PBCodable hasSession](self, "hasSession"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
    objc_msgSend(v6, "setSequenceNumber:", a3);
    goto LABEL_7;
  }
}

- (int64_t)_nsurlsessionproxy_messagePriority
{
  void *v3;
  void *v4;
  id v5;

  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
    v5 = objc_msgSend(v4, "idsPriority");

  }
  else
  {
    if ((objc_opt_respondsToSelector(self, "hasSession") & 1) == 0
      || !-[PBCodable hasSession](self, "hasSession"))
    {
      return 0;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
    v5 = objc_msgSend(v3, "idsPriority");
  }

  return (int64_t)v5;
}

- (void)_nsurlsessionproxy_setMessagePriority:(int64_t)a3
{
  void *v5;
  id v6;

  if ((objc_opt_respondsToSelector(self, "hasTask") & 1) != 0 && -[PBCodable hasTask](self, "hasTask"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PBCodable task](self, "task"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
    objc_msgSend(v5, "setIdsPriority:", a3);

LABEL_7:
    return;
  }
  if ((objc_opt_respondsToSelector(self, "hasSession") & 1) != 0
    && -[PBCodable hasSession](self, "hasSession"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PBCodable session](self, "session"));
    objc_msgSend(v6, "setIdsPriority:", a3);
    goto LABEL_7;
  }
}

@end
