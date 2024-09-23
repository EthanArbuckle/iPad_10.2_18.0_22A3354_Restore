@implementation RBSProcessHostIdentifierPredicate

- (BOOL)matchesProcess:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;

  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isXPCService"))
  {
    objc_msgSend(v4, "hostIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "rbs_pid");
      v8 = v7 == -[RBSProcessIdentifier rbs_pid](self->super._identifier, "rbs_pid");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
