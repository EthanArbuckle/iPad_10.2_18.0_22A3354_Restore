@implementation SBSRemoteAlertPresentationTarget

- (SBSRemoteAlertPresentationTarget)initWithTargetProcess:(id)a3
{
  void *v4;
  SBSRemoteAlertPresentationTarget *v5;

  +[SBSRemoteAlertPresentationTargetPredicate predicateForProcess:](SBSRemoteAlertPresentationTargetPredicate, "predicateForProcess:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBSRemoteAlertPresentationTarget initWithTargetPredicate:](self, "initWithTargetPredicate:", v4);

  return v5;
}

- (SBSRemoteAlertPresentationTarget)initWithTargetPredicate:(id)a3
{
  id v5;
  SBSRemoteAlertPresentationTarget *v6;
  SBSRemoteAlertPresentationTarget *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSRemoteAlertPresentationTarget;
  v6 = -[SBSRemoteAlertPresentationTarget init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_targetPredicate, a3);
    v7->_shouldDismissInSwitcher = 1;
  }

  return v7;
}

- (SBSRemoteAlertPresentationTarget)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  SBSRemoteAlertPresentationTarget *v6;

  v4 = a3;
  v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  if (v5
    && (self = -[SBSRemoteAlertPresentationTarget initWithTargetPredicate:](self, "initWithTargetPredicate:", v5)) != 0)
  {
    -[SBSRemoteAlertPresentationTarget setShouldDismissOnUILock:](self, "setShouldDismissOnUILock:", xpc_dictionary_get_BOOL(v4, "shouldDismissOnUILock"));
    -[SBSRemoteAlertPresentationTarget setShouldDismissInSwitcher:](self, "setShouldDismissInSwitcher:", xpc_dictionary_get_BOOL(v4, "shouldDismissInSwitcher"));
    -[SBSRemoteAlertPresentationTarget setRequiresFullscreenPresentation:](self, "setRequiresFullscreenPresentation:", xpc_dictionary_get_BOOL(v4, "requiresFullscreenPresentation"));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "shouldDismissOnUILock", self->_shouldDismissOnUILock);
  xpc_dictionary_set_BOOL(xdict, "shouldDismissInSwitcher", self->_shouldDismissInSwitcher);
  xpc_dictionary_set_BOOL(xdict, "requiresFullscreenPresentation", self->_requiresFullscreenPresentation);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteAlertPresentationTarget)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  SBSRemoteAlertPresentationTarget *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  objc_class *v11;

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
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@"),
      v5,
      v6);
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetPredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  self = -[SBSRemoteAlertPresentationTarget initWithTargetPredicate:](self, "initWithTargetPredicate:", v6);
  if (!self)
    goto LABEL_6;
  -[SBSRemoteAlertPresentationTarget setShouldDismissOnUILock:](self, "setShouldDismissOnUILock:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("shouldDismissOnUILock")));
  -[SBSRemoteAlertPresentationTarget setShouldDismissInSwitcher:](self, "setShouldDismissInSwitcher:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("shouldDismissInSwitcher")));
  -[SBSRemoteAlertPresentationTarget setRequiresFullscreenPresentation:](self, "setRequiresFullscreenPresentation:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("requiresFullscreenPresentation")));
  v7 = self;
LABEL_7:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  SBSRemoteAlertPresentationTargetPredicate *targetPredicate;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  objc_class *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v12;
    v5 = v4;
    targetPredicate = self->_targetPredicate;
    if (targetPredicate)
      objc_msgSend(v4, "encodeObject:forKey:", targetPredicate, CFSTR("targetPredicate"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_shouldDismissOnUILock, CFSTR("shouldDismissOnUILock"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_shouldDismissInSwitcher, CFSTR("shouldDismissInSwitcher"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_requiresFullscreenPresentation, CFSTR("requiresFullscreenPresentation"));
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with %@"),
      v5,
      v11);

  }
}

- (BSProcessHandle)targetProcess
{
  return -[SBSRemoteAlertPresentationTargetPredicate process](self->_targetPredicate, "process");
}

- (NSString)scenePersistentIdentifier
{
  return -[SBSRemoteAlertPresentationTargetPredicate scenePersistentIdentifier](self->_targetPredicate, "scenePersistentIdentifier");
}

- (void)setScenePersistentIdentifier:(id)a3
{
  -[SBSRemoteAlertPresentationTargetPredicate setScenePersistentIdentifier:](self->_targetPredicate, "setScenePersistentIdentifier:", a3);
}

- (NSString)description
{
  return (NSString *)-[SBSRemoteAlertPresentationTarget descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSRemoteAlertPresentationTarget succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBSRemoteAlertPresentationTarget descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  -[SBSRemoteAlertPresentationTarget succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_targetPredicate, 0);
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_shouldDismissOnUILock, CFSTR("shouldDismissOnUILock"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_shouldDismissInSwitcher, CFSTR("shouldDismissInSwitcher"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", self->_requiresFullscreenPresentation, CFSTR("requiresFullscreenPresentation"));
  return v4;
}

- (SBSRemoteAlertPresentationTargetPredicate)targetPredicate
{
  return self->_targetPredicate;
}

- (BOOL)shouldDismissOnUILock
{
  return self->_shouldDismissOnUILock;
}

- (void)setShouldDismissOnUILock:(BOOL)a3
{
  self->_shouldDismissOnUILock = a3;
}

- (BOOL)shouldDismissInSwitcher
{
  return self->_shouldDismissInSwitcher;
}

- (void)setShouldDismissInSwitcher:(BOOL)a3
{
  self->_shouldDismissInSwitcher = a3;
}

- (BOOL)requiresFullscreenPresentation
{
  return self->_requiresFullscreenPresentation;
}

- (void)setRequiresFullscreenPresentation:(BOOL)a3
{
  self->_requiresFullscreenPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPredicate, 0);
}

@end
