@implementation UISceneSessionActivationRequest

- (id)_initWithSession:(id)a3 role:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  UISceneSessionActivationRequest *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *role;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[16];

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!(v7 | v8))
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Request cannot be initialized without a role or an existing scene session.", buf, 2u);
      }

    }
  }
  else if (!(v7 | v8))
  {
    v16 = _initWithSession_role____s_category;
    if (!_initWithSession_role____s_category)
    {
      v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&_initWithSession_role____s_category);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Request cannot be initialized without a role or an existing scene session.", buf, 2u);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)UISceneSessionActivationRequest;
  v9 = -[UISceneSessionActivationRequest init](&v18, sel_init);
  if (v9)
  {
    objc_msgSend((id)v7, "role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (NSString *)objc_msgSend((id)v8, "copy");
    role = v9->_role;
    v9->_role = v12;

    objc_storeStrong((id *)&v9->_session, a3);
  }

  return v9;
}

+ (UISceneSessionActivationRequest)request
{
  return (UISceneSessionActivationRequest *)-[UISceneSessionActivationRequest _initWithSession:role:]([UISceneSessionActivationRequest alloc], "_initWithSession:role:", 0, CFSTR("UIWindowSceneSessionRoleApplication"));
}

+ (UISceneSessionActivationRequest)requestWithRole:(UISceneSessionRole)role
{
  NSString *v3;
  id v4;

  v3 = role;
  v4 = -[UISceneSessionActivationRequest _initWithSession:role:]([UISceneSessionActivationRequest alloc], "_initWithSession:role:", 0, v3);

  return (UISceneSessionActivationRequest *)v4;
}

+ (UISceneSessionActivationRequest)requestWithSession:(UISceneSession *)session
{
  UISceneSession *v3;
  id v4;

  v3 = session;
  v4 = -[UISceneSessionActivationRequest _initWithSession:role:]([UISceneSessionActivationRequest alloc], "_initWithSession:role:", v3, 0);

  return (UISceneSessionActivationRequest *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UISceneSessionActivationRequest *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = [UISceneSessionActivationRequest alloc];
  -[UISceneSessionActivationRequest session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISceneSessionActivationRequest role](self, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UISceneSessionActivationRequest _initWithSession:role:](v4, "_initWithSession:role:", v5, v6);

  -[UISceneSessionActivationRequest userActivity](self, "userActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserActivity:", v8);

  -[UISceneSessionActivationRequest options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setOptions:", v10);

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)-[UISceneSessionActivationRequest debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UISceneSessionActivationRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  UISceneSessionActivationRequest *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__UISceneSessionActivationRequest_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E16B1B50;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendProem:block:", 0, v7);
  v5 = v4;

  return v5;
}

void __61__UISceneSessionActivationRequest_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "role");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, CFSTR("role"));

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[4];
  id v10;
  UISceneSessionActivationRequest *v11;

  v4 = a3;
  -[UISceneSessionActivationRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);
  -[UISceneSessionActivationRequest session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (-[UISceneSessionActivationRequest role](self, "role"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[UISceneSessionActivationRequest userActivity](self, "userActivity"),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[UISceneSessionActivationRequest options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__UISceneSessionActivationRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v10 = v5;
  v11 = self;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E16EDF20, v4, v9);

LABEL_6:
  return v5;
}

void __73__UISceneSessionActivationRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("session"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("userActivity"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "options");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v10, CFSTR("options"), 1);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneSessionActivationRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneSessionActivationRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UISceneSessionRole)role
{
  return self->_role;
}

- (UISceneSession)session
{
  return self->_session;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(NSUserActivity *)userActivity
{
  objc_storeStrong((id *)&self->_userActivity, userActivity);
}

- (UISceneActivationRequestOptions)options
{
  return self->_options;
}

- (void)setOptions:(UISceneActivationRequestOptions *)options
{
  objc_setProperty_nonatomic_copy(self, a2, options, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
