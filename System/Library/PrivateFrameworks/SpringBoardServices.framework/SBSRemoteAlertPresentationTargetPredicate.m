@implementation SBSRemoteAlertPresentationTargetPredicate

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSRemoteAlertPresentationTargetPredicate;
  return -[SBSRemoteAlertPresentationTargetPredicate init](&v3, sel_init);
}

+ (id)predicateForProcess:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[SBSRemoteAlertPresentationTargetPredicate _init]([SBSRemoteAlertPresentationTargetPredicate alloc], "_init");
  objc_msgSend(v4, "setProcess:", v3);

  return v4;
}

+ (id)predicateForLaunchingApplicationIdentity:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[SBSRemoteAlertPresentationTargetPredicate _init]([SBSRemoteAlertPresentationTargetPredicate alloc], "_init");
  objc_msgSend(v4, "setLaunchingApplicationIdentity:", v3);

  return v4;
}

- (SBSRemoteAlertPresentationTargetPredicate)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  SBSRemoteAlertPresentationTargetPredicate *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  objc_opt_class();
  v6 = BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v7 = (void *)v6;
  if (v5)
  {
    +[SBSRemoteAlertPresentationTargetPredicate predicateForProcess:](SBSRemoteAlertPresentationTargetPredicate, "predicateForProcess:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_8;
    }
    +[SBSRemoteAlertPresentationTargetPredicate predicateForLaunchingApplicationIdentity:](SBSRemoteAlertPresentationTargetPredicate, "predicateForLaunchingApplicationIdentity:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (SBSRemoteAlertPresentationTargetPredicate *)v8;
  if (v8)
  {
    v10 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    -[SBSRemoteAlertPresentationTargetPredicate setScenePersistentIdentifier:](v9, "setScenePersistentIdentifier:", v10);

  }
LABEL_8:

  return v9;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_process)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  else if (self->_launchingApplicationIdentity)
  {
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  }
  BSSerializeStringToXPCDictionaryWithKey();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteAlertPresentationTargetPredicate)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  SBSRemoteAlertPresentationTargetPredicate *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@"),
      v5,
      v12);
    v13 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v5 = v4;
  if (objc_msgSend(v5, "containsValueForKey:", CFSTR("process")))
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("process"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSRemoteAlertPresentationTargetPredicate predicateForProcess:](SBSRemoteAlertPresentationTargetPredicate, "predicateForProcess:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "containsValueForKey:", CFSTR("launchingIdentity")))
    {
      v13 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchingIdentity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSRemoteAlertPresentationTargetPredicate predicateForLaunchingApplicationIdentity:](SBSRemoteAlertPresentationTargetPredicate, "predicateForLaunchingApplicationIdentity:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (SBSRemoteAlertPresentationTargetPredicate *)v7;

  if (v13)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scenePersistentIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSRemoteAlertPresentationTargetPredicate setScenePersistentIdentifier:](v13, "setScenePersistentIdentifier:", v12);
    goto LABEL_9;
  }
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  objc_class *v9;
  void *v10;
  NSString *scenePersistentIdentifier;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v12;
    v5 = v4;
    if (self->_process || self->_launchingApplicationIdentity)
      objc_msgSend(v4, "encodeObject:forKey:");
    scenePersistentIdentifier = self->_scenePersistentIdentifier;
    if (scenePersistentIdentifier)
      objc_msgSend(v5, "encodeObject:forKey:", scenePersistentIdentifier, CFSTR("scenePersistentIdentifier"));
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with %@"),
      v5,
      v10);

  }
}

- (NSString)description
{
  return (NSString *)-[SBSRemoteAlertPresentationTargetPredicate descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSRemoteAlertPresentationTargetPredicate succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSRemoteAlertPresentationTargetPredicate descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  -[SBSRemoteAlertPresentationTargetPredicate succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSProcessHandle description](self->_process, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("process"), 1);

  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_launchingApplicationIdentity, CFSTR("launchingApplicationIdentity"), 1);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_scenePersistentIdentifier, CFSTR("scenePersistentIdentifier"), 1);
  return v4;
}

- (NSString)scenePersistentIdentifier
{
  return self->_scenePersistentIdentifier;
}

- (void)setScenePersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (LSApplicationIdentity)launchingApplicationIdentity
{
  return self->_launchingApplicationIdentity;
}

- (void)setLaunchingApplicationIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_launchingApplicationIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchingApplicationIdentity, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_scenePersistentIdentifier, 0);
}

@end
