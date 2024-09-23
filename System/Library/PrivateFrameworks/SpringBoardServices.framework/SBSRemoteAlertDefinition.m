@implementation SBSRemoteAlertDefinition

- (SBSRemoteAlertDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SBSRemoteAlertDefinition *v10;
  uint64_t v11;
  NSString *serviceName;
  uint64_t v13;
  NSString *viewControllerClassName;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSRemoteAlertDefinition.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSRemoteAlertDefinition.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewControllerClassName"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)SBSRemoteAlertDefinition;
  v10 = -[SBSRemoteAlertDefinition init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    serviceName = v10->_serviceName;
    v10->_serviceName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    viewControllerClassName = v10->_viewControllerClassName;
    v10->_viewControllerClassName = (NSString *)v13;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impersonatedCarPlayAppIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_secondaryViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_secondaryConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneProvidingProcess, 0);
}

- (SBSRemoteAlertDefinition)initWithSceneProvidingProcess:(id)a3 configurationIdentifier:(id)a4
{
  id v8;
  id v9;
  SBSRemoteAlertDefinition *v10;
  SBSRemoteAlertDefinition *v11;
  uint64_t v12;
  NSString *configurationIdentifier;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSRemoteAlertDefinition.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneProvidingProcess"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SBSRemoteAlertDefinition;
  v10 = -[SBSRemoteAlertDefinition init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sceneProvidingProcess, a3);
    v12 = objc_msgSend(v9, "copy");
    configurationIdentifier = v11->_configurationIdentifier;
    v11->_configurationIdentifier = (NSString *)v12;

  }
  return v11;
}

- (NSString)description
{
  return (NSString *)-[SBSRemoteAlertDefinition descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (SBSRemoteAlertDefinition)initWithXPCDictionary:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  SBSRemoteAlertDefinition *v9;
  const __CFString *v10;
  const __CFString *v11;
  SBSRemoteAlertDefinition *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = (void *)BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = -[SBSRemoteAlertDefinition initWithSceneProvidingProcess:configurationIdentifier:](self, "initWithSceneProvidingProcess:configurationIdentifier:", v7, v8);
  }
  else
  {
    if (v5)
      v10 = v5;
    else
      v10 = &stru_1E2893CD0;
    if (v6)
      v11 = v6;
    else
      v11 = &stru_1E2893CD0;
    v9 = -[SBSRemoteAlertDefinition initWithServiceName:viewControllerClassName:](self, "initWithServiceName:viewControllerClassName:", v10, v11);
  }
  v12 = v9;
  if (v9)
  {
    BSDeserializeCFValueFromXPCDictionaryWithKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SBSRemoteAlertDefinition setUserInfo:](v12, "setUserInfo:", v13);
    if (v7)
    {
      v14 = xpc_dictionary_get_BOOL(v4, "supportsMultipleDisplayPresentations");
      BSDeserializeStringFromXPCDictionaryWithKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSRemoteAlertDefinition setSupportsMultipleDisplayPresentations:](v12, "setSupportsMultipleDisplayPresentations:", v14);
      -[SBSRemoteAlertDefinition setSecondaryConfigurationIdentifier:](v12, "setSecondaryConfigurationIdentifier:", v15);
    }
    else
    {
      BSDeserializeStringFromXPCDictionaryWithKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSRemoteAlertDefinition setSecondaryViewControllerClassName:](v12, "setSecondaryViewControllerClassName:", v15);
    }

    -[SBSRemoteAlertDefinition setPrefersEmbeddedDisplayPresentation:](v12, "setPrefersEmbeddedDisplayPresentation:", xpc_dictionary_get_BOOL(v4, "prefersEmbeddedDisplayPresentation"));
    BSDeserializeStringFromXPCDictionaryWithKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSRemoteAlertDefinition setImpersonatedCarPlayAppIdentifier:](v12, "setImpersonatedCarPlayAppIdentifier:", v16);

    -[SBSRemoteAlertDefinition setForCarPlay:](v12, "setForCarPlay:", xpc_dictionary_get_BOOL(v4, "forCarPlay"));
  }

  return v12;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  if (v4)
  {
    xdict = v4;
    if (self->_sceneProvidingProcess)
    {
      BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
      BSSerializeStringToXPCDictionaryWithKey();
      if (self->_supportsMultipleDisplayPresentations)
        xpc_dictionary_set_BOOL(xdict, "supportsMultipleDisplayPresentations", 1);
    }
    else
    {
      BSSerializeStringToXPCDictionaryWithKey();
      BSSerializeStringToXPCDictionaryWithKey();
    }
    BSSerializeStringToXPCDictionaryWithKey();
    if (self->_prefersEmbeddedDisplayPresentation)
      xpc_dictionary_set_BOOL(xdict, "prefersEmbeddedDisplayPresentation", 1);
    BSSerializeCFValueToXPCDictionaryWithKey();
    BSSerializeStringToXPCDictionaryWithKey();
    v4 = xdict;
    if (self->_forCarPlay)
    {
      xpc_dictionary_set_BOOL(xdict, "forCarPlay", 1);
      v4 = xdict;
    }
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSRemoteAlertDefinition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBSRemoteAlertDefinition descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSRemoteAlertDefinition *v11;

  v4 = a3;
  -[SBSRemoteAlertDefinition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SBSRemoteAlertDefinition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E288D940;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __66__SBSRemoteAlertDefinition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("service"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("vcClass"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("secondaryVCClass"), 1);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("sceneProvidingProcess"), 1);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("configurationIdentifier"), 1);
  v7 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v7 + 8))
  {
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, CFSTR("supportsMultipleDisplayPresentations"));
    v7 = *(_QWORD *)(a1 + 40);
  }
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(v7 + 32), CFSTR("secondaryConfigurationIdentifier"), 1);
  v10 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v10 + 9))
  {
    v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, CFSTR("prefersEmbeddedDisplayPresentation"));
    v10 = *(_QWORD *)(a1 + 40);
  }
  if (*(_BYTE *)(v10 + 10))
  {
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", 1, CFSTR("forCarPlay"));
    v10 = *(_QWORD *)(a1 + 40);
  }
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(v10 + 72), CFSTR("impersonatesCarPlayApp"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("userInfo"), 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBSProcessIdentity *sceneProvidingProcess;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  sceneProvidingProcess = self->_sceneProvidingProcess;
  v5 = objc_alloc((Class)objc_opt_class());
  if (sceneProvidingProcess)
    v6 = objc_msgSend(v5, "initWithSceneProvidingProcess:configurationIdentifier:", self->_sceneProvidingProcess, self->_configurationIdentifier);
  else
    v6 = objc_msgSend(v5, "initWithServiceName:viewControllerClassName:", self->_serviceName, self->_viewControllerClassName);
  v7 = v6;
  if (v6)
  {
    *(_BYTE *)(v6 + 10) = self->_forCarPlay;
    v8 = -[NSString copy](self->_impersonatedCarPlayAppIdentifier, "copy");
    v9 = *(void **)(v7 + 72);
    *(_QWORD *)(v7 + 72) = v8;

    v10 = -[NSDictionary copy](self->_userInfo, "copy");
    v11 = *(void **)(v7 + 64);
    *(_QWORD *)(v7 + 64) = v10;

    v12 = -[NSString copy](self->_secondaryViewControllerClassName, "copy");
    v13 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = v12;

    *(_BYTE *)(v7 + 8) = self->_supportsMultipleDisplayPresentations;
    v14 = -[NSString copy](self->_secondaryConfigurationIdentifier, "copy");
    v15 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v14;

    *(_BYTE *)(v7 + 9) = self->_prefersEmbeddedDisplayPresentation;
  }
  return (id)v7;
}

- (RBSProcessIdentity)sceneProvidingProcess
{
  return self->_sceneProvidingProcess;
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (BOOL)supportsMultipleDisplayPresentations
{
  return self->_supportsMultipleDisplayPresentations;
}

- (void)setSupportsMultipleDisplayPresentations:(BOOL)a3
{
  self->_supportsMultipleDisplayPresentations = a3;
}

- (NSString)secondaryConfigurationIdentifier
{
  return self->_secondaryConfigurationIdentifier;
}

- (void)setSecondaryConfigurationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return self->_prefersEmbeddedDisplayPresentation;
}

- (void)setPrefersEmbeddedDisplayPresentation:(BOOL)a3
{
  self->_prefersEmbeddedDisplayPresentation = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (NSString)secondaryViewControllerClassName
{
  return self->_secondaryViewControllerClassName;
}

- (void)setSecondaryViewControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)impersonatedCarPlayAppIdentifier
{
  return self->_impersonatedCarPlayAppIdentifier;
}

- (void)setImpersonatedCarPlayAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isForCarPlay
{
  return self->_forCarPlay;
}

- (void)setForCarPlay:(BOOL)a3
{
  self->_forCarPlay = a3;
}

@end
