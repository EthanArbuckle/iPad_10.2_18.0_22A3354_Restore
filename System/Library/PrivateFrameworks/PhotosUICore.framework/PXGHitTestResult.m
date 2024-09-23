@implementation PXGHitTestResult

- (PXGHitTestResult)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGHitTestResult.m"), 25, CFSTR("%s is not available as initializer"), "-[PXGHitTestResult init]");

  abort();
}

- (PXGHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userDataProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXGHitTestResult *v15;
  PXGHitTestResult *v16;
  void *v17;
  id userDataProvider;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PXGHitTestResult;
  v15 = -[PXGHitTestResult init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_spriteReference, a3);
    objc_storeStrong((id *)&v16->_layout, a4);
    objc_storeStrong((id *)&v16->_identifier, a5);
    v17 = _Block_copy(v14);
    userDataProvider = v16->_userDataProvider;
    v16->_userDataProvider = v17;

  }
  return v16;
}

- (PXGHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userData:(id)a6
{
  id v11;
  id v12;
  PXGHitTestResult *v13;
  PXGHitTestResult *v14;
  _QWORD v16[4];
  id v17;

  v11 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__PXGHitTestResult_initWithSpriteReference_layout_identifier_userData___block_invoke;
  v16[3] = &unk_1E5136B38;
  v12 = v11;
  v17 = v12;
  v13 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userDataProvider:](self, "initWithSpriteReference:layout:identifier:userDataProvider:", a3, a4, a5, v16);
  v14 = v13;
  if (v13)
    objc_storeStrong(&v13->_userData, a6);

  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)userData
{
  id userData;
  void (**userDataProvider)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  userData = self->_userData;
  if (!userData)
  {
    userDataProvider = (void (**)(id, void *, void *))self->_userDataProvider;
    if (userDataProvider)
    {
      -[PXGHitTestResult layout](self, "layout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGHitTestResult spriteReference](self, "spriteReference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      userDataProvider[2](userDataProvider, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_userData;
      self->_userData = v7;

      v9 = self->_userDataProvider;
      self->_userDataProvider = 0;

      userData = self->_userData;
    }
    else
    {
      userData = 0;
    }
  }
  return userData;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGHitTestResult identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGHitTestResult userData](self, "userData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXGHitTestResult isDecorated](self, "isDecorated"))
    v8 = CFSTR("decorated ");
  else
    v8 = &stru_1E5149688;
  -[PXGHitTestResult spriteReference](self, "spriteReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier=%@ userData=%@ %@spriteReference=%@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PXGSpriteReference)spriteReference
{
  return self->_spriteReference;
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (BOOL)isDecorated
{
  return self->_isDecorated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_spriteReference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_userData, 0);
  objc_storeStrong(&self->_userDataProvider, 0);
}

id __71__PXGHitTestResult_initWithSpriteReference_layout_identifier_userData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
