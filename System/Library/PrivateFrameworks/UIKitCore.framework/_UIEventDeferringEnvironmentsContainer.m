@implementation _UIEventDeferringEnvironmentsContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environments, 0);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  unint64_t v6;
  NSSet *environments;
  char v8;

  if (a3 == self)
    return 1;
  v4 = a3;
  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isEqual:", objc_opt_class())
    && (v6 = -[_UIEventDeferringEnvironmentsContainer hash](self, "hash"), v6 == objc_msgSend(v4, "hash")))
  {
    environments = self->_environments;
    if (environments == (NSSet *)v4[1])
      v8 = 1;
    else
      v8 = -[NSSet isEqual:](environments, "isEqual:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_QWORD)environments
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[1];
    if (v1)
      return v1;
    a1 = (_QWORD *)objc_opt_new();
  }
  return a1;
}

- (_UIEventDeferringEnvironmentsContainer)initWithXPCDictionary:(id)a3
{
  void *v4;
  _UIEventDeferringEnvironmentsContainer *v5;

  objc_msgSend(CFSTR("_UIEventDeferringEnvironmentsContainerKey_Environments"), "UTF8String");
  BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_UIEventDeferringEnvironmentsContainer *)-[_UIEventDeferringEnvironmentsContainer _initWithEnvironments:](self, v4);

  return v5;
}

- (_QWORD)_initWithEnvironments:(_QWORD *)a1
{
  _QWORD *v2;
  uint64_t v4;
  void *v5;
  void *v7;
  objc_super v8;

  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithEnvironments_, v2, CFSTR("_UIEventDeferringEnvironmentsContainer.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environments"));

    }
    v8.receiver = v2;
    v8.super_class = (Class)_UIEventDeferringEnvironmentsContainer;
    v2 = objc_msgSendSuper2(&v8, sel_init);
    if (v2)
    {
      v4 = objc_msgSend(a2, "copy");
      v5 = (void *)v2[1];
      v2[1] = v4;

    }
  }
  return v2;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  objc_msgSend(CFSTR("_UIEventDeferringEnvironmentsContainerKey_Environments"), "UTF8String");
  BSSerializeSetToXPCDictionaryWithKey();
}

- (_UIEventDeferringEnvironmentsContainer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringEnvironmentsContainer.m"), 54, CFSTR("%s: init is not allowed on %@"), "-[_UIEventDeferringEnvironmentsContainer init]", objc_opt_class());

  return 0;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_environments);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIEventDeferringEnvironmentsContainer debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIEventDeferringEnvironmentsContainer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEventDeferringEnvironmentsContainerSetDescription(self->_environments);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("environments"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringEnvironmentsContainer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringEnvironmentsContainer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIEventDeferringEnvironmentsContainer *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80___UIEventDeferringEnvironmentsContainer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_environments, CFSTR("_UIEventDeferringEnvironmentsContainerKey_Environments"));
}

- (_UIEventDeferringEnvironmentsContainer)initWithCoder:(id)a3
{
  _UIEventDeferringEnvironmentsContainer *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *environments;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIEventDeferringEnvironmentsContainer;
  v4 = -[_UIEventDeferringEnvironmentsContainer init](&v14, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v7, CFSTR("_UIEventDeferringEnvironmentsContainerKey_Environments"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v8, "copy");
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (NSSet *)objc_opt_new();
    environments = v4->_environments;
    v4->_environments = v11;

  }
  return v4;
}

@end
