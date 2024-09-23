@implementation PKProcessAssertionProxy

- (PKProcessAssertionProxy)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  PKProcessAssertionProxy *v11;
  uint64_t v12;
  BKSProcessAssertion *bksObject;
  objc_super v15;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PKProcessAssertionProxy;
  v11 = -[PKProcessAssertionProxy init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE300]), "initWithPID:flags:reason:name:", v8, v7, v6, v10);
    bksObject = v11->__bksObject;
    v11->__bksObject = (BKSProcessAssertion *)v12;

  }
  return v11;
}

- (id)invalidationHandler
{
  void *v2;
  void *v3;

  -[PKProcessAssertionProxy _bksObject](self, "_bksObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKProcessAssertionProxy _bksObject](self, "_bksObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvalidationHandler:", v4);

}

- (BOOL)acquire
{
  void *v2;
  char v3;

  -[PKProcessAssertionProxy _bksObject](self, "_bksObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "acquire");

  return v3;
}

- (void)invalidate
{
  id v2;

  -[PKProcessAssertionProxy _bksObject](self, "_bksObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BKSProcessAssertion)_bksObject
{
  return (BKSProcessAssertion *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__bksObject, 0);
}

@end
