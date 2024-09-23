@implementation WFHarnessSiriInteraction

- (WFHarnessSiriInteraction)initWithSelector:(id)a3 siriActionRequestClass:(Class)a4 interaction:(id)a5
{
  id v10;
  id v11;
  WFHarnessSiriInteraction *v12;
  WFHarnessSiriInteraction *v13;
  uint64_t v14;
  id interaction;
  WFHarnessSiriInteraction *v16;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessSiriInteraction.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction"));

  }
  v19.receiver = self;
  v19.super_class = (Class)WFHarnessSiriInteraction;
  v12 = -[WFHarnessSiriInteraction init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_selector, a3);
    objc_storeStrong((id *)&v13->_siriActionRequestClass, a4);
    v14 = objc_msgSend(v11, "copy");
    interaction = v13->_interaction;
    v13->_interaction = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (WFHarnessActionSelector)selector
{
  return self->_selector;
}

- (Class)siriActionRequestClass
{
  return self->_siriActionRequestClass;
}

- (id)interaction
{
  return self->_interaction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interaction, 0);
  objc_storeStrong((id *)&self->_siriActionRequestClass, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

@end
