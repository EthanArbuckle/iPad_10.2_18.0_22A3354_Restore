@implementation SBSAGestureDescription

- (SBSAGestureDescription)initWithGestureDescription:(id)a3
{
  id v4;
  SBSAGestureDescription *v5;
  uint64_t v6;
  NSUUID *gestureIdentifier;
  uint64_t v8;
  NSUUID *associatedInterfaceElementIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSAGestureDescription;
  v5 = -[SBSAGestureDescription init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "gestureIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    gestureIdentifier = v5->_gestureIdentifier;
    v5->_gestureIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "associatedInterfaceElementIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    associatedInterfaceElementIdentifier = v5->_associatedInterfaceElementIdentifier;
    v5->_associatedInterfaceElementIdentifier = (NSUUID *)v8;

    v5->_gestureRecognizerState = objc_msgSend(v4, "gestureRecognizerState");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSUUID *gestureIdentifier;
  uint64_t v7;
  id v8;
  void *v9;
  NSUUID *associatedInterfaceElementIdentifier;
  id v11;
  void *v12;
  int64_t gestureRecognizerState;
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
  gestureIdentifier = self->_gestureIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34__SBSAGestureDescription_isEqual___block_invoke;
  v21[3] = &unk_1E8EA4320;
  v8 = v4;
  v22 = v8;
  objc_msgSend(v5, "appendObject:counterpart:", gestureIdentifier, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  associatedInterfaceElementIdentifier = self->_associatedInterfaceElementIdentifier;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __34__SBSAGestureDescription_isEqual___block_invoke_2;
  v19[3] = &unk_1E8EA4320;
  v11 = v8;
  v20 = v11;
  objc_msgSend(v9, "appendObject:counterpart:", associatedInterfaceElementIdentifier, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  gestureRecognizerState = self->_gestureRecognizerState;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __34__SBSAGestureDescription_isEqual___block_invoke_3;
  v17[3] = &unk_1E8EA3AB0;
  v18 = v11;
  v14 = v11;
  objc_msgSend(v12, "appendInteger:counterpart:", gestureRecognizerState, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v15, "isEqual");

  return v7;
}

uint64_t __34__SBSAGestureDescription_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gestureIdentifier");
}

uint64_t __34__SBSAGestureDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "associatedInterfaceElementIdentifier");
}

uint64_t __34__SBSAGestureDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gestureRecognizerState");
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
  objc_msgSend(v3, "appendObject:", self->_gestureIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_associatedInterfaceElementIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendInteger:", self->_gestureRecognizerState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t gestureRecognizerState;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  gestureRecognizerState = self->_gestureRecognizerState;
  if (gestureRecognizerState > 5)
    v6 = CFSTR("[Invalid]");
  else
    v6 = off_1E8EB20A8[gestureRecognizerState];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; gestureIdentifier: %@; associatedInterfaceElementIdentifier: %@; gestureRecognizerState: %@>"),
                       v4,
                       self,
                       self->_gestureIdentifier,
                       self->_associatedInterfaceElementIdentifier,
                       v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGestureDescription:", self);
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAGestureDescription copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithGestureDescription:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (NSUUID)gestureIdentifier
{
  return self->_gestureIdentifier;
}

- (void)_setGestureIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)associatedInterfaceElementIdentifier
{
  return self->_associatedInterfaceElementIdentifier;
}

- (void)_setAssociatedInterfaceElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)gestureRecognizerState
{
  return self->_gestureRecognizerState;
}

- (void)_setGestureRecognizerState:(int64_t)a3
{
  self->_gestureRecognizerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedInterfaceElementIdentifier, 0);
  objc_storeStrong((id *)&self->_gestureIdentifier, 0);
}

@end
