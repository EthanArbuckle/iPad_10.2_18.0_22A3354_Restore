@implementation RBSProcessIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

- (BOOL)matchesProcess:(id)a3
{
  int pid;

  pid = self->_pid;
  return pid == objc_msgSend(a3, "rbs_pid");
}

+ (RBSProcessIdentifier)identifierWithPid:(int)a3
{
  return -[RBSProcessIdentifier initWithPid:]([RBSProcessIdentifier alloc], "initWithPid:", *(_QWORD *)&a3);
}

- (RBSProcessIdentifier)initWithPid:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  RBSProcessIdentifier *v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  if (initWithPid__onceToken != -1)
    dispatch_once(&initWithPid__onceToken, &__block_literal_global_5);
  if ((int)v3 < 1)
  {
    v7 = 0;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&__Lock);
    v5 = (void *)__ProcessIdentifiers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (RBSProcessIdentifier *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = self;
      v7->_pid = v3;
      v8 = (void *)__ProcessIdentifiers;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v9);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock);
  }

  return v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessIdentifier)initWithRBSXPCCoder:(id)a3
{
  return -[RBSProcessIdentifier initWithPid:](self, "initWithPid:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("_pid")));
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_pid, CFSTR("_pid"));
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessIdentifier *v4;
  uint64_t v5;
  int pid;
  BOOL v7;

  v4 = (RBSProcessIdentifier *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (objc_opt_respondsToSelector() & 1) != 0)
    {
      pid = self->_pid;
      v7 = pid == -[RBSProcessIdentifier rbs_pid](v4, "rbs_pid");
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (int)rbs_pid
{
  return self->_pid;
}

- (unint64_t)hash
{
  return self->_pid;
}

+ (id)identifierForCurrentProcess
{
  return (id)objc_msgSend(a1, "identifierWithPid:", getpid());
}

+ (id)identifierForIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "identifierWithPid:", objc_msgSend(v4, "rbs_pid"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (NSString)description
{
  RBSProcessIdentifier *v2;
  NSString *description;
  uint64_t v4;
  NSString *v5;
  NSString *v6;

  v2 = self;
  objc_sync_enter(v2);
  description = v2->_description;
  if (!description)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), v2->_pid);
    v5 = v2->_description;
    v2->_description = (NSString *)v4;

    description = v2->_description;
  }
  v6 = description;
  objc_sync_exit(v2);

  return v6;
}

void __36__RBSProcessIdentifier_initWithPid___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__ProcessIdentifiers;
  __ProcessIdentifiers = v0;

}

- (RBSProcessIdentifier)init
{
  return -[RBSProcessIdentifier initWithPid:](self, "initWithPid:", getpid());
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
