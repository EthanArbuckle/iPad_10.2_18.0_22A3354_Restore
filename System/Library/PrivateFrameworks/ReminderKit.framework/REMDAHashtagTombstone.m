@implementation REMDAHashtagTombstone

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMDAHashtagTombstone objectIdentifier](self, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAHashtagTombstone name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAHashtagTombstone reminderIdentifier](self, "reminderIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, name: %@, reminderIdentifier: %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSUUID)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectIdentifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSUUID)reminderIdentifier
{
  return self->_reminderIdentifier;
}

- (void)setReminderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_reminderIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
