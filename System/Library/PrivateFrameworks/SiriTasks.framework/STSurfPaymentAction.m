@implementation STSurfPaymentAction

- (id)_initWithInteraction:(id)a3
{
  id v5;
  STSurfPaymentAction *v6;
  STSurfPaymentAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSurfPaymentAction;
  v6 = -[AFSiriRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_interaction, a3);

  return v7;
}

- (id)interaction
{
  return self->_interaction;
}

- (unint64_t)action
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;

  -[STSurfPaymentAction interaction](self, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 0;
  -[STSurfPaymentAction interaction](self, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
    return 1;
  else
    return 2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSurfPaymentAction;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_interaction, CFSTR("_interaction"), v5.receiver, v5.super_class);

}

- (STSurfPaymentAction)initWithCoder:(id)a3
{
  id v4;
  STSurfPaymentAction *v5;
  uint64_t v6;
  INInteraction *interaction;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSurfPaymentAction;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interaction"));
    v6 = objc_claimAutoreleasedReturnValue();
    interaction = v5->_interaction;
    v5->_interaction = (INInteraction *)v6;

  }
  return v5;
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
