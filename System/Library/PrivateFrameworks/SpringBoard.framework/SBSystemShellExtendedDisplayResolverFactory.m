@implementation SBSystemShellExtendedDisplayResolverFactory

- (int64_t)displayWindowingMode
{
  return 1;
}

- (id)resolverForPhysicalDisplay:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SBSystemShellExtendedDisplayResolver *v11;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayResolverFactory.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootDisplayIdentity isRootIdentity]"));

  }
  if (objc_msgSend(v6, "_sb_supportsExtendedDisplayMode"))
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "externalDisplayDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA9D58], "withDisplay:useNativeSize:", v5, objc_msgSend(v8, "chamois"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportedScales");

    if (v10)
      v11 = -[SBSystemShellExtendedDisplayResolver initWithRootDisplay:]([SBSystemShellExtendedDisplayResolver alloc], "initWithRootDisplay:", v6);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
