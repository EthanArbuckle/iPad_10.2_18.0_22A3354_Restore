@implementation SBSAContainerResizeAction

- (SBSAContainerResizeAction)initWithResult:(int64_t)a3 associatedInterfaceElementIdentifier:(id)a4 reasons:(id)a5
{
  id v8;
  id v9;
  SBSAContainerResizeAction *v10;
  SBSAContainerResizeAction *v11;
  uint64_t v12;
  NSUUID *associatedInterfaceElementIdentifier;
  uint64_t v14;
  NSArray *reasons;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSAContainerResizeAction;
  v10 = -[SBSAContainerResizeAction init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_resizeActionResult = a3;
    v12 = objc_msgSend(v8, "copy");
    associatedInterfaceElementIdentifier = v11->_associatedInterfaceElementIdentifier;
    v11->_associatedInterfaceElementIdentifier = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    reasons = v11->_reasons;
    v11->_reasons = (NSArray *)v14;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t resizeActionResult;
  uint64_t v7;
  id v8;
  void *v9;
  NSUUID *associatedInterfaceElementIdentifier;
  id v11;
  void *v12;
  NSArray *reasons;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  resizeActionResult = self->_resizeActionResult;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__SBSAContainerResizeAction_isEqual___block_invoke;
  v21[3] = &unk_1E8EA3AB0;
  v8 = v4;
  v22 = v8;
  objc_msgSend(v5, "appendInteger:counterpart:", resizeActionResult, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __37__SBSAContainerResizeAction_isEqual___block_invoke_2;
  v19[3] = &unk_1E8EA4320;
  v11 = v8;
  v20 = v11;
  objc_msgSend(v9, "appendObject:counterpart:", associatedInterfaceElementIdentifier, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  reasons = self->_reasons;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __37__SBSAContainerResizeAction_isEqual___block_invoke_3;
  v17[3] = &unk_1E8EA4320;
  v18 = v11;
  v14 = v11;
  objc_msgSend(v12, "appendObject:counterpart:", reasons, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v15, "isEqual");

  return v7;
}

uint64_t __37__SBSAContainerResizeAction_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resizeActionResult");
}

uint64_t __37__SBSAContainerResizeAction_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "associatedInterfaceElementIdentifier");
}

uint64_t __37__SBSAContainerResizeAction_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reasons");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendInteger:", self->_resizeActionResult);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_associatedInterfaceElementIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:", self->_reasons);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_resizeActionResult + 1;
  if (v5 > 2)
    v6 = CFSTR("[invalid]");
  else
    v6 = off_1E8EA7AF0[v5];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; resizeActionResult: %@; associatedInterfaceElementIdentifier: %@; reasons: %@>"),
                       v4,
                       self,
                       v6,
                       self->_associatedInterfaceElementIdentifier,
                       self->_reasons);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResult:associatedInterfaceElementIdentifier:reasons:", self->_resizeActionResult, self->_associatedInterfaceElementIdentifier, self->_reasons);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (int64_t)resizeActionResult
{
  return self->_resizeActionResult;
}

- (NSUUID)associatedInterfaceElementIdentifier
{
  return self->_associatedInterfaceElementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedInterfaceElementIdentifier, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
