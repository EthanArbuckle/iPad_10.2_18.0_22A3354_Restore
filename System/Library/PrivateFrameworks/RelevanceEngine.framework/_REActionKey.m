@implementation _REActionKey

- (_REActionKey)initWithIdentifier:(id)a3 actionType:(id)a4 relevanceProvidersHash:(unint64_t)a5
{
  id v9;
  id v10;
  _REActionKey *v11;
  _REActionKey *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_REActionKey;
  v11 = -[_REActionKey init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_actionType, a4);
    v12->_relevanceProvidersHash = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[REDonatedActionIdentifierProviding hash](self->_actionType, "hash") ^ v3 ^ self->_relevanceProvidersHash;
}

- (BOOL)isEqual:(id)a3
{
  _REActionKey *v4;
  _REActionKey *v5;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  BOOL v11;
  REDonatedActionIdentifierProviding *actionType;
  REDonatedActionIdentifierProviding *v13;
  REDonatedActionIdentifierProviding *v14;
  REDonatedActionIdentifierProviding *v15;
  int v16;

  v4 = (_REActionKey *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_11;
      }
      actionType = self->_actionType;
      v13 = v5->_actionType;
      if (actionType == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = actionType;
        v16 = -[REDonatedActionIdentifierProviding isEqual:](v15, "isEqual:", v14);

        if (!v16)
        {
LABEL_11:
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      v11 = self->_relevanceProvidersHash == v5->_relevanceProvidersHash;
      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (REDonatedActionIdentifierProviding)actionType
{
  return self->_actionType;
}

- (unint64_t)relevanceProvidersHash
{
  return self->_relevanceProvidersHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
