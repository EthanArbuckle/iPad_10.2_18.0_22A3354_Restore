@implementation WFMigratedRemoteServerResourceState

- (WFMigratedRemoteServerResourceState)initWithCoder:(id)a3
{
  id v4;
  WFMigratedRemoteServerResourceState *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *entries;
  WFMigratedRemoteServerResourceState *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFMigratedRemoteServerResourceState;
  v5 = -[WFMigratedRemoteServerResourceState init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("entries"));
    v9 = objc_claimAutoreleasedReturnValue();
    entries = v5->entries;
    v5->entries = (NSSet *)v9;

    v11 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->entries, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
