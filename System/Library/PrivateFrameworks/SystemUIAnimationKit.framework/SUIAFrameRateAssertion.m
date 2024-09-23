@implementation SUIAFrameRateAssertion

- (SUIAFrameRateAssertion)initWithFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4;
  float preferred;
  float maximum;
  float minimum;
  SUIAFrameRateAssertion *v8;
  SUIAFrameRateAssertion *v9;
  id v10;
  void *v11;
  SUIAFrameRateAssertion *v12;
  uint64_t v13;
  BSSimpleAssertion *assertion;
  _QWORD v16[4];
  SUIAFrameRateAssertion *v17;
  int v18;
  objc_super v19;

  v4 = *(_QWORD *)&a4;
  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  v19.receiver = self;
  v19.super_class = (Class)SUIAFrameRateAssertion;
  v8 = -[SUIAFrameRateAssertion init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_updateRequest.flags = 0;
    v8->_updateRequest.minRate = minimum;
    v8->_updateRequest.preferredRate = preferred;
    v8->_updateRequest.maxRate = maximum;
    _UIUpdateRequestActivate();
    v10 = objc_alloc(MEMORY[0x24BE0BE98]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SBFFrameRateReason-%d"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __69__SUIAFrameRateAssertion_initWithFrameRateRange_highFrameRateReason___block_invoke;
    v16[3] = &unk_251945110;
    v12 = v9;
    v17 = v12;
    v18 = v4;
    v13 = objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SUIAFrameRateAssertion"), v11, v16);
    assertion = v12->_assertion;
    v12->_assertion = (BSSimpleAssertion *)v13;

  }
  return v9;
}

uint64_t __69__SUIAFrameRateAssertion_initWithFrameRateRange_highFrameRateReason___block_invoke()
{
  return _UIUpdateRequestDeactivate();
}

- (void)invalidate
{
  -[BSSimpleAssertion invalidate](self->_assertion, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
