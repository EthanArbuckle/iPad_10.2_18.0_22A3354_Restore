@implementation PLProcessAssertion

- (PLProcessAssertion)initWithIdentifier:(id)a3
{
  id v4;
  PLProcessAssertion *v5;
  uint64_t v6;
  id processAssertion;
  PLProcessAssertion *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLProcessAssertion;
  v5 = -[PLProcessAssertion init](&v10, sel_init);
  if (v5)
  {
    getpid();
    v6 = SBSProcessAssertionCreateForPID();
    processAssertion = v5->_processAssertion;
    v5->_processAssertion = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p:%@ %@ %p>"), self, v4, objc_opt_class(), self->_processAssertion);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processAssertion, 0);
}

@end
