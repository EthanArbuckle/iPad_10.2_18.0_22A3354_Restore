@implementation WFSiriOpenInteractionRequest

- (WFSiriOpenInteractionRequest)initWithInteraction:(id)a3
{
  id v5;
  WFSiriOpenInteractionRequest *v6;
  WFSiriOpenInteractionRequest *v7;
  WFSiriOpenInteractionRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriOpenInteractionRequest;
  v6 = -[WFSiriActionRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interaction, a3);
    v8 = v7;
  }

  return v7;
}

- (WFSiriOpenInteractionRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriOpenInteractionRequest *v5;
  uint64_t v6;
  INInteraction *interaction;
  WFSiriOpenInteractionRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriOpenInteractionRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interaction"));
    v6 = objc_claimAutoreleasedReturnValue();
    interaction = v5->_interaction;
    v5->_interaction = (INInteraction *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSiriOpenInteractionRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriOpenInteractionRequest interaction](self, "interaction", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("interaction"));

}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
