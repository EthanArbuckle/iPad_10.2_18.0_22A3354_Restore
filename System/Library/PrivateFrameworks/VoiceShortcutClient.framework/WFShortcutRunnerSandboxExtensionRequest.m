@implementation WFShortcutRunnerSandboxExtensionRequest

- (WFShortcutRunnerSandboxExtensionRequest)initWithAccessResourceClassNames:(id)a3
{
  id v6;
  WFShortcutRunnerSandboxExtensionRequest *v7;
  WFShortcutRunnerSandboxExtensionRequest *v8;
  WFShortcutRunnerSandboxExtensionRequest *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShortcutRunnerSandboxExtensionManager.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessResourceClassNames"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFShortcutRunnerSandboxExtensionRequest;
  v7 = -[WFShortcutRunnerSandboxExtensionRequest init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_accessResourceClassNames, a3);
    v9 = v8;
  }

  return v8;
}

- (NSSet)accessResourceClassNames
{
  return self->_accessResourceClassNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessResourceClassNames, 0);
}

+ (id)all
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(&unk_1E60041C0, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithAccessResourceClassNames:", v5);

  return v6;
}

@end
