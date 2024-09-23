@implementation REUIElementIntentAction

- (INIntent)intent
{
  void *v2;
  void *v3;

  -[REUIElementDonatedActionAction properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INIntent *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REUIElementDonatedActionAction properties](self, "properties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("properties"));

}

- (REUIElementIntentAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REUIElementIntentAction *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("properties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REUIElementDonatedActionAction initWithProperties:](self, "initWithProperties:", v5);
  return v6;
}

- (id)_newPerformer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REUIElementIntentAction;
  return -[REUIElementDonatedActionAction _newPerformer](&v3, sel__newPerformer);
}

@end
