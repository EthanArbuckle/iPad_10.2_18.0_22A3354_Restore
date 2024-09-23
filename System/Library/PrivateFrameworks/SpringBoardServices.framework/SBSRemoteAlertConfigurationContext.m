@implementation SBSRemoteAlertConfigurationContext

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyAlertOptions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

+ (id)configurationContextWithLegacyAlertOptions:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("UserInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInfo:", v6);

  if (v5)
  {
    v7 = objc_msgSend(v4, "copy");
    v8 = (void *)v5[4];
    v5[4] = v7;

  }
  return v5;
}

- (SBSRemoteAlertConfigurationContext)initWithXPCDictionary:(id)a3
{
  id v4;
  SBSRemoteAlertConfigurationContext *v5;
  uint64_t v6;
  NSDictionary *userInfo;
  uint64_t v8;
  OS_xpc_object *xpcEndpoint;
  uint64_t v10;
  NSSet *actions;
  uint64_t v12;
  NSDictionary *legacyAlertOptions;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBSRemoteAlertConfigurationContext;
  v5 = -[SBSRemoteAlertConfigurationContext init](&v15, sel_init);
  if (v5)
  {
    BSDeserializeCFValueFromXPCDictionaryWithKey();
    v6 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v6;

    xpc_dictionary_get_value(v4, "c__endpoint");
    v8 = objc_claimAutoreleasedReturnValue();
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (OS_xpc_object *)v8;

    BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v10 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSSet *)v10;

    BSDeserializeCFValueFromXPCDictionaryWithKey();
    v12 = objc_claimAutoreleasedReturnValue();
    legacyAlertOptions = v5->_legacyAlertOptions;
    v5->_legacyAlertOptions = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  OS_xpc_object *xpcEndpoint;
  void *v6;
  xpc_object_t xdict;

  v4 = a3;
  xpcEndpoint = self->_xpcEndpoint;
  xdict = v4;
  if (xpcEndpoint)
    xpc_dictionary_set_value(v4, "c__endpoint", xpcEndpoint);
  if (self->_userInfo)
    BSSerializeCFValueToXPCDictionaryWithKey();
  if (-[NSSet count](self->_actions, "count"))
    BSSerializeSetToXPCDictionaryWithKey();
  v6 = xdict;
  if (self->_legacyAlertOptions)
  {
    BSSerializeCFValueToXPCDictionaryWithKey();
    v6 = xdict;
  }

}

id __62__SBSRemoteAlertConfigurationContext_encodeWithXPCDictionary___block_invoke()
{
  return (id)BSCreateSerializedBSXPCEncodableObject();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  NSDictionary *userInfo;
  OS_xpc_object *xpcEndpoint;
  xpc_object_t v8;
  NSDictionary *legacyAlertOptions;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSRemoteAlertConfigurationContext.m"), 87, CFSTR("This class may only be encoded by an NSXPCCoder."));

  }
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v11, "encodeObject:forKey:", userInfo, CFSTR("__userInfo"));
  xpcEndpoint = self->_xpcEndpoint;
  if (xpcEndpoint)
    objc_msgSend(v11, "encodeXPCObject:forKey:", xpcEndpoint, CFSTR("__endpoint"));
  if (-[NSSet count](self->_actions, "count"))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    BSSerializeSetToXPCDictionaryWithKey();
    objc_msgSend(v11, "encodeXPCObject:forKey:", v8, CFSTR("__actions"));

  }
  legacyAlertOptions = self->_legacyAlertOptions;
  v10 = v11;
  if (legacyAlertOptions)
  {
    objc_msgSend(v11, "encodeObject:forKey:", legacyAlertOptions, CFSTR("__legacyAlertOptions"));
    v10 = v11;
  }

}

id __54__SBSRemoteAlertConfigurationContext_encodeWithCoder___block_invoke()
{
  return (id)BSCreateSerializedBSXPCEncodableObject();
}

- (SBSRemoteAlertConfigurationContext)initWithCoder:(id)a3
{
  id v5;
  SBSRemoteAlertConfigurationContext *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *userInfo;
  uint64_t v16;
  OS_xpc_object *xpcEndpoint;
  void *v18;
  uint64_t v19;
  NSSet *actions;
  void *v21;
  SBSRemoteAlertConfigurationContext *v22;
  void *v23;
  void *v25;
  objc_super v26;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)SBSRemoteAlertConfigurationContext;
    v6 = -[SBSRemoteAlertConfigurationContext init](&v26, sel_init);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("__userInfo"));
      v14 = objc_claimAutoreleasedReturnValue();
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v14;

      if (v6->_userInfo)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SBSRemoteAlertConfigurationContext.m"), 122, CFSTR("User info must be a dictionary type."));

        }
      }
      objc_msgSend(v5, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("__endpoint"));
      v16 = objc_claimAutoreleasedReturnValue();
      xpcEndpoint = v6->_xpcEndpoint;
      v6->_xpcEndpoint = (OS_xpc_object *)v16;

      objc_msgSend(v5, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("__actions"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
      v19 = objc_claimAutoreleasedReturnValue();
      actions = v6->_actions;
      v6->_actions = (NSSet *)v19;

      objc_msgSend(v5, "decodePropertyListForKey:", CFSTR("__legacyAlertOptions"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isNSDictionary"))
        objc_storeStrong((id *)&v6->_legacyAlertOptions, v21);

    }
    self = v6;
    v22 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSRemoteAlertConfigurationContext.m"), 114, CFSTR("This class may only be decoded by an NSXPCCoder."));

    v22 = 0;
  }

  return v22;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (OS_xpc_object)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEndpoint, a3);
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)legacyAlertOptions
{
  return self->_legacyAlertOptions;
}

@end
