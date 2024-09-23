@implementation WFSiriKitIntentRequest

- (WFSiriKitIntentRequest)initWithIntent:(id)a3
{
  id v5;
  WFSiriKitIntentRequest *v6;
  WFSiriKitIntentRequest *v7;
  WFSiriKitIntentRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriKitIntentRequest;
  v6 = -[WFSiriActionRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_intent, a3);
    v8 = v7;
  }

  return v7;
}

- (WFSiriKitIntentRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriKitIntentRequest *v5;
  uint64_t v6;
  INIntent *intent;
  WFSiriKitIntentRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriKitIntentRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
    v6 = objc_claimAutoreleasedReturnValue();
    intent = v5->_intent;
    v5->_intent = (INIntent *)v6;

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
  v6.super_class = (Class)WFSiriKitIntentRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriKitIntentRequest intent](self, "intent", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intent"));

}

- (INIntent)intent
{
  return self->_intent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
