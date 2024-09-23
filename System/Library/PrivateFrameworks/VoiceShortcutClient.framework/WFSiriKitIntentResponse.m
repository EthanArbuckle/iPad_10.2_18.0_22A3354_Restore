@implementation WFSiriKitIntentResponse

- (WFSiriKitIntentResponse)initWithInteraction:(id)a3 andError:(id)a4
{
  id v7;
  WFSiriKitIntentResponse *v8;
  WFSiriKitIntentResponse *v9;
  WFSiriKitIntentResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSiriKitIntentResponse;
  v8 = -[WFSiriActionResponse initWithError:](&v12, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_interaction, a3);
    v10 = v9;
  }

  return v9;
}

- (WFSiriKitIntentResponse)initWithCoder:(id)a3
{
  id v4;
  WFSiriKitIntentResponse *v5;
  uint64_t v6;
  INInteraction *interaction;
  WFSiriKitIntentResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriKitIntentResponse;
  v5 = -[WFSiriActionResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
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
  v6.super_class = (Class)WFSiriKitIntentResponse;
  v4 = a3;
  -[WFSiriActionResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriKitIntentResponse interaction](self, "interaction", v6.receiver, v6.super_class);
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
