@implementation STShowDraftMessageRequest

- (id)_initWithDraftMessageIdentifier:(id)a3
{
  id v4;
  STShowDraftMessageRequest *v5;
  uint64_t v6;
  NSURL *draftMessageIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowDraftMessageRequest;
  v5 = -[AFSiriRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    draftMessageIdentifier = v5->_draftMessageIdentifier;
    v5->_draftMessageIdentifier = (NSURL *)v6;

  }
  return v5;
}

- (id)draftMessageIdentifier
{
  return self->_draftMessageIdentifier;
}

- (id)message
{
  return 0;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (id)createUsageResult
{
  STShowDraftMessageUsageResult *v3;
  void *v4;
  id v5;

  v3 = [STShowDraftMessageUsageResult alloc];
  -[AFSiriRequest _originatingAceID](self, "_originatingAceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AFSiriTaskUsageResult _initWithOriginatingAceID:](v3, "_initWithOriginatingAceID:", v4);

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<%@ %p: draftMessageIdentifier=%@>"), objc_opt_class(), self, self->_draftMessageIdentifier);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowDraftMessageRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_draftMessageIdentifier, CFSTR("_draftMessageIdentifier"), v5.receiver, v5.super_class);

}

- (STShowDraftMessageRequest)initWithCoder:(id)a3
{
  id v4;
  STShowDraftMessageRequest *v5;
  uint64_t v6;
  NSURL *draftMessageIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowDraftMessageRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_draftMessageIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    draftMessageIdentifier = v5->_draftMessageIdentifier;
    v5->_draftMessageIdentifier = (NSURL *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draftMessageIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
