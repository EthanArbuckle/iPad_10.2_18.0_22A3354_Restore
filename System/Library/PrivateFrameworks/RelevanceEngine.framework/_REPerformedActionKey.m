@implementation _REPerformedActionKey

+ (id)keyForBundleIdentifier:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[2];
  v7[2] = v5;
  v9 = v5;

  v10 = (void *)v7[1];
  v7[1] = v6;

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[REDonatedActionIdentifierProviding hash](self->_identifier, "hash");
  return -[NSString hash](self->_bundleIdentifier, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _REPerformedActionKey *v4;
  _REPerformedActionKey *v5;
  NSString *bundleIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  char v11;
  REDonatedActionIdentifierProviding *identifier;
  REDonatedActionIdentifierProviding *v13;
  REDonatedActionIdentifierProviding *v14;
  REDonatedActionIdentifierProviding *v15;

  v4 = (_REPerformedActionKey *)a3;
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
      bundleIdentifier = self->_bundleIdentifier;
      v7 = v5->_bundleIdentifier;
      if (bundleIdentifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = bundleIdentifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      identifier = self->_identifier;
      v13 = v5->_identifier;
      v14 = identifier;
      v15 = v14;
      if (v14 == v13)
        v11 = 1;
      else
        v11 = -[REDonatedActionIdentifierProviding isEqual:](v14, "isEqual:", v13);

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%p: %@> bundleIdentifier=%@, identifier=%@"), self, objc_opt_class(), self->_bundleIdentifier, self->_identifier);
}

- (REDonatedActionIdentifierProviding)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
