@implementation SBStatusBarBackgroundActivityDescriptor

- (SBStatusBarBackgroundActivityDescriptor)initWithBackgroundActivityIdentifier:(id)a3 pid:(int)a4
{
  id v7;
  SBStatusBarBackgroundActivityDescriptor *v8;
  SBStatusBarBackgroundActivityDescriptor *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBStatusBarBackgroundActivityDescriptor;
  v8 = -[SBStatusBarBackgroundActivityDescriptor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backgroundActivityIdentifier, a3);
    v9->_pid = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_backgroundActivityIdentifier);
  v5 = (id)objc_msgSend(v3, "appendInt64:", self->_pid);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SBStatusBarBackgroundActivityDescriptor *v4;
  SBStatusBarBackgroundActivityDescriptor *v5;
  int pid;
  NSString *backgroundActivityIdentifier;
  void *v8;
  char v9;

  v4 = (SBStatusBarBackgroundActivityDescriptor *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      pid = self->_pid;
      if (pid == -[SBStatusBarBackgroundActivityDescriptor pid](v5, "pid"))
      {
        backgroundActivityIdentifier = self->_backgroundActivityIdentifier;
        -[SBStatusBarBackgroundActivityDescriptor backgroundActivityIdentifier](v5, "backgroundActivityIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSString isEqualToString:](backgroundActivityIdentifier, "isEqualToString:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackgroundActivityIdentifier:pid:", self->_backgroundActivityIdentifier, self->_pid);
}

- (id)description
{
  return -[SBStatusBarBackgroundActivityDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E8EC7EC0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBStatusBarBackgroundActivityDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBStatusBarBackgroundActivityDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  STBackgroundActivityIdentifierDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("activity"));

  v5 = (id)objc_msgSend(v3, "appendInt64:withName:", self->_pid, CFSTR("pid"));
  return v3;
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
}

@end
