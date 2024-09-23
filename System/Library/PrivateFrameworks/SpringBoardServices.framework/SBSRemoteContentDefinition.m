@implementation SBSRemoteContentDefinition

- (SBSRemoteContentDefinition)init
{
  return -[SBSRemoteContentDefinition initWithServiceName:viewControllerClassName:](self, "initWithServiceName:viewControllerClassName:", 0, 0);
}

- (SBSRemoteContentDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4
{
  return -[SBSRemoteContentDefinition initWithServiceName:viewControllerClassName:xpcEndpoint:userInfo:](self, "initWithServiceName:viewControllerClassName:xpcEndpoint:userInfo:", a3, a4, 0, 0);
}

- (SBSRemoteContentDefinition)initWithServiceName:(id)a3 viewControllerClassName:(id)a4 xpcEndpoint:(id)a5 userInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBSRemoteContentDefinition *v15;
  uint64_t v16;
  NSString *serviceName;
  uint64_t v18;
  NSString *viewControllerClassName;
  void *v21;
  void *v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSRemoteContentDefinition.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSRemoteContentDefinition.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewControllerClassName"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)SBSRemoteContentDefinition;
  v15 = -[SBSRemoteContentDefinition init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    serviceName = v15->_serviceName;
    v15->_serviceName = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    viewControllerClassName = v15->_viewControllerClassName;
    v15->_viewControllerClassName = (NSString *)v18;

    objc_storeStrong((id *)&v15->_xpcEndpoint, a5);
    objc_storeStrong((id *)&v15->_userInfo, a6);
  }

  return v15;
}

- (NSString)description
{
  return (NSString *)-[SBSRemoteContentDefinition descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (SBSRemoteContentDefinition)initWithXPCDictionary:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  SBSRemoteContentDefinition *v11;

  v4 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v4, "endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeCFValueFromXPCDictionaryWithKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v5;
  else
    v9 = &stru_1E2893CD0;
  if (v6)
    v10 = v6;
  else
    v10 = &stru_1E2893CD0;
  v11 = -[SBSRemoteContentDefinition initWithServiceName:viewControllerClassName:xpcEndpoint:userInfo:](self, "initWithServiceName:viewControllerClassName:xpcEndpoint:userInfo:", v9, v10, v7, v8);

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  if (a3)
  {
    xdict = a3;
    BSSerializeStringToXPCDictionaryWithKey();
    BSSerializeStringToXPCDictionaryWithKey();
    xpc_dictionary_set_value(xdict, "endpoint", self->_xpcEndpoint);
    BSSerializeCFValueToXPCDictionaryWithKey();

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSRemoteContentDefinition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBSRemoteContentDefinition descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBSRemoteContentDefinition *v11;

  v4 = a3;
  -[SBSRemoteContentDefinition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SBSRemoteContentDefinition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E288D940;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __68__SBSRemoteContentDefinition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("service"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("vcClass"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("xpcEndpoint"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("userInfo"), 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServiceName:viewControllerClassName:", self->_serviceName, self->_viewControllerClassName);
  if (v4)
  {
    v5 = -[NSDictionary copy](self->_userInfo, "copy");
    v6 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v5;

    objc_storeStrong((id *)(v4 + 24), self->_xpcEndpoint);
  }
  return (id)v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (OS_xpc_object)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEndpoint, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
