@implementation SASActivationInstrumentation

- (SASActivationInstrumentation)initWithSender:(id)a3
{
  id v5;
  SASActivationInstrumentation *v6;
  SASActivationInstrumentation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASActivationInstrumentation;
  v6 = -[SASActivationInstrumentation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_instrumentationSender, a3);

  return v7;
}

- (id)buttonDownWithIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SASActivationInstrumentation setActivationEventIdentifier:](self, "setActivationEventIdentifier:", v6);

  -[SASActivationInstrumentation _instrumentButtonInteractionType:buttonIdentifier:](self, "_instrumentButtonInteractionType:buttonIdentifier:", 1, v5);
  return -[SASActivationInstrumentation activationEventIdentifier](self, "activationEventIdentifier");
}

- (id)buttonUpWithIdentifier:(id)a3
{
  -[SASActivationInstrumentation _instrumentButtonInteractionType:buttonIdentifier:](self, "_instrumentButtonInteractionType:buttonIdentifier:", 2, a3);
  return -[SASActivationInstrumentation activationEventIdentifier](self, "activationEventIdentifier");
}

- (id)buttonTapWithIdentifier:(id)a3 associateWithButtonDown:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  if (!a4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    -[SASActivationInstrumentation setActivationEventIdentifier:](self, "setActivationEventIdentifier:", v7);

  }
  -[SASActivationInstrumentation _instrumentButtonInteractionType:buttonIdentifier:](self, "_instrumentButtonInteractionType:buttonIdentifier:", 3, v6);
  -[SASActivationInstrumentation activationEventIdentifier](self, "activationEventIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_instrumentButtonInteractionType:(int)a3 buttonIdentifier:(id)a4
{
  uint64_t v4;
  SASActivationInstrumentationSending *instrumentationSender;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  instrumentationSender = self->_instrumentationSender;
  v7 = a4;
  -[SASActivationInstrumentation activationEventIdentifier](self, "activationEventIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SASActivationInstrumentationSending instrumentButtonInteractionType:buttonIdentifier:activationEventIdentifier:](instrumentationSender, "instrumentButtonInteractionType:buttonIdentifier:activationEventIdentifier:", v4, v7, v8);

}

- (NSUUID)activationEventIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActivationEventIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationEventIdentifier, 0);
  objc_storeStrong((id *)&self->_instrumentationSender, 0);
}

@end
