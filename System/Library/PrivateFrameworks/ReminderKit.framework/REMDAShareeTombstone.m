@implementation REMDAShareeTombstone

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMDAShareeTombstone objectIdentifier](self, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAShareeTombstone owningListIdentifier](self, "owningListIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, owningListIdentifier: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSUUID)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectIdentifier, a3);
}

- (NSUUID)owningListIdentifier
{
  return self->_owningListIdentifier;
}

- (void)setOwningListIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_owningListIdentifier, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_owningListIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
