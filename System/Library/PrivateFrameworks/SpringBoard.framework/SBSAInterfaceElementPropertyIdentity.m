@implementation SBSAInterfaceElementPropertyIdentity

uint64_t __48__SBSAInterfaceElementPropertyIdentity_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "associatedInterfaceElementIdentifier");
}

uint64_t __48__SBSAInterfaceElementPropertyIdentity_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interfaceElementProperty");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_associatedInterfaceElementIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", self->_interfaceElementProperty);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceElementProperty, 0);
  objc_storeStrong((id *)&self->_associatedInterfaceElementIdentifier, 0);
}

- (BOOL)isContentBoundsProperty
{
  return BSEqualStrings();
}

- (NSString)interfaceElementProperty
{
  return self->_interfaceElementProperty;
}

- (NSUUID)associatedInterfaceElementIdentifier
{
  return self->_associatedInterfaceElementIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssociatedInterfaceElementIdentifier:andProperty:", self->_associatedInterfaceElementIdentifier, self->_interfaceElementProperty);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSUUID *associatedInterfaceElementIdentifier;
  uint64_t v7;
  id v8;
  void *v9;
  NSString *interfaceElementProperty;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__SBSAInterfaceElementPropertyIdentity_isEqual___block_invoke;
  v19[3] = &unk_1E8EA4320;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v5, "appendObject:counterpart:", associatedInterfaceElementIdentifier, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceElementProperty = self->_interfaceElementProperty;
  v14 = v7;
  v15 = 3221225472;
  v16 = __48__SBSAInterfaceElementPropertyIdentity_isEqual___block_invoke_2;
  v17 = &unk_1E8EA89D0;
  v18 = v8;
  v11 = v8;
  objc_msgSend(v9, "appendString:counterpart:", interfaceElementProperty, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v12, "isEqual", v14, v15, v16, v17);

  return v7;
}

- (SBSAInterfaceElementPropertyIdentity)initWithAssociatedInterfaceElementIdentifier:(id)a3 andProperty:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SBSAInterfaceElementPropertyIdentity *v10;
  uint64_t v11;
  NSUUID *associatedInterfaceElementIdentifier;
  uint64_t v13;
  NSString *interfaceElementProperty;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAViewDescription.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(associatedInterfaceElementIdentifier != nil) && ([property length] > 0)"));

  }
  v17.receiver = self;
  v17.super_class = (Class)SBSAInterfaceElementPropertyIdentity;
  v10 = -[SBSAInterfaceElementPropertyIdentity init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    associatedInterfaceElementIdentifier = v10->_associatedInterfaceElementIdentifier;
    v10->_associatedInterfaceElementIdentifier = (NSUUID *)v11;

    v13 = objc_msgSend(v9, "copy");
    interfaceElementProperty = v10->_interfaceElementProperty;
    v10->_interfaceElementProperty = (NSString *)v13;

  }
  return v10;
}

- (BOOL)isBoundsProperty
{
  return BSEqualStrings();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; associatedInterfaceElementIdentifier: %@; interfaceElementProperty: %@>"),
                       objc_opt_class(),
                       self,
                       self->_associatedInterfaceElementIdentifier,
                       self->_interfaceElementProperty);
}

@end
