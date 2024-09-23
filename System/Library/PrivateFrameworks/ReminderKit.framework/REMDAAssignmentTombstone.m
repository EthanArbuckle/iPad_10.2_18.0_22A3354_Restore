@implementation REMDAAssignmentTombstone

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMDAAssignmentTombstone objectIdentifier](self, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAAssignmentTombstone owningReminderIdentifier](self, "owningReminderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, owningReminderIdentifier: %@>"), v4, self, v5, v6);
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

- (NSUUID)owningReminderIdentifier
{
  return self->_owningReminderIdentifier;
}

- (void)setOwningReminderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_owningReminderIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningReminderIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
