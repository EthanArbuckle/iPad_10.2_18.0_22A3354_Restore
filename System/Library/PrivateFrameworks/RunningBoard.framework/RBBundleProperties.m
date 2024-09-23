@implementation RBBundleProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcBundleProperties, 0);
  objc_storeStrong((id *)&self->_lsBundleProperties, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcProvider, 0);
  objc_storeStrong((id *)&self->_lsProvider, 0);
}

- (RBBundleProperties)initWithLSProvider:(id)a3 xpcProvider:(id)a4 processIdentity:(id)a5 processIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RBBundleProperties *v15;
  RBBundleProperties *v16;
  id *p_isa;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13 && (objc_msgSend(v13, "isAnonymous") & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)RBBundleProperties;
    v16 = -[RBBundleProperties init](&v19, sel_init);
    p_isa = (id *)&v16->super.isa;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_lsProvider, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 3, a6);
    }
    self = p_isa;
    v15 = self;
  }

  return v15;
}

- (NSString)bundlePath
{
  void *v2;
  void *v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)continuousBackgroundMode
{
  void *v2;
  char v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "continuousBackgroundMode");

  return v3;
}

- (id)_bundleProperties
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 24))
      -[RBBundleProperties _xpcBundleProperties]((id *)a1);
    else
      -[RBBundleProperties _lsBundleProperties]((id *)a1);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (id)_xpcBundleProperties
{
  id *v1;
  id v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    v1 = a1;
    v2 = a1[6];
    if (!v2)
    {
      if (a1[3])
      {
        objc_msgSend(a1[2], "propertiesForIdentifier:");
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = v1[6];
        v1[6] = (id)v3;

        v2 = v1[6];
      }
      else
      {
        v2 = 0;
      }
    }
    a1 = (id *)v2;
  }
  return a1;
}

- (BOOL)isExtension
{
  void *v2;
  BOOL v3;

  -[RBBundleProperties extensionPointIdentifier](self, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)extensionPointIdentifier
{
  void *v2;
  void *v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionPointIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleInfoValuesForKeys:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)usesSocketMonitoring
{
  void *v2;
  char v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesSocketMonitoring");

  return v3;
}

- (NSString)executablePath
{
  void *v2;
  void *v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executablePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)dataContainerURL
{
  void *v2;
  void *v3;

  -[RBBundleProperties _lsBundleProperties]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSDictionary)environmentVariables
{
  void *v2;
  void *v3;

  -[RBBundleProperties _lsBundleProperties]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environmentVariables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)_lsBundleProperties
{
  id *v1;
  id v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    v1 = a1;
    v2 = a1[5];
    if (!v2)
    {
      if (a1[4])
      {
        objc_msgSend(a1[1], "propertiesForIdentity:");
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = v1[5];
        v1[5] = (id)v3;

        v2 = v1[5];
      }
      else
      {
        v2 = 0;
      }
    }
    a1 = (id *)v2;
  }
  return a1;
}

- (BOOL)supportsBackgroundContentFetching
{
  void *v2;
  char v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsBackgroundContentFetching");

  return v3;
}

- (BOOL)supportsBackgroundNetworkAuthentication
{
  void *v2;
  char v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsBackgroundNetworkAuthentication");

  return v3;
}

- (BOOL)supportsBackgroundAudio
{
  void *v2;
  char v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsBackgroundAudio");

  return v3;
}

- (BOOL)supportsUnboundedTaskCompletion
{
  void *v2;
  char v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsUnboundedTaskCompletion");

  return v3;
}

- (BOOL)hasPreferredJetsamBand
{
  void *v2;
  char v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPreferredJetsamBand");

  return v3;
}

- (int)platform
{
  return -[RBSProcessIdentity platform](self->_processIdentity, "platform");
}

- (int)preferredJetsamBand
{
  void *v2;
  int v3;

  -[RBBundleProperties _bundleProperties]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredJetsamBand");

  return v3;
}

- (NSString)containerOverrideIdentifier
{
  void *v2;
  void *v3;

  -[RBBundleProperties _lsBundleProperties]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerOverrideIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| lsBundleProperties:%@ xpcBundleProperties:%@ processIdentity:%@ processIdentifier:%@>"), v4, self->_lsBundleProperties, self->_xpcBundleProperties, self->_processIdentity, self->_processIdentifier);

  return (NSString *)v5;
}

@end
