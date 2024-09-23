@implementation PPContactNameRecordChangeResult

- (PPContactNameRecordChangeResult)initWithChanges:(id)a3 changesTruncated:(BOOL)a4
{
  id v7;
  PPContactNameRecordChangeResult *v8;
  PPContactNameRecordChangeResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPContactNameRecordChangeResult;
  v8 = -[PPContactNameRecordChangeResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_changes, a3);
    v9->_changesTruncated = a4;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPContactNameRecordChangeResult ct:%d c:%@>"), self->_changesTruncated, self->_changes);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_changes, "hash");
  return self->_changesTruncated - v3 + 32 * v3;
}

- (PPContactNameRecordChangeResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PPContactNameRecordChangeResult *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D7805AC]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("c"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PPContactNameRecordChangeResult initWithChanges:changesTruncated:](self, "initWithChanges:changesTruncated:", v9, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ct")));

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *changes;
  id v5;

  changes = self->_changes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", changes, CFSTR("c"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_changesTruncated, CFSTR("ct"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  v6 = (void *)-[NSArray copyWithZone:](self->_changes, "copyWithZone:", a3);
  objc_msgSend(v5, "contactNameRecordChangeResultWithChanges:changesTruncated:", v6, self->_changesTruncated);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PPContactNameRecordChangeResult *v4;
  PPContactNameRecordChangeResult *v5;
  BOOL v6;

  v4 = (PPContactNameRecordChangeResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPContactNameRecordChangeResult isEqualToContactNameRecordChangeResult:](self, "isEqualToContactNameRecordChangeResult:", v5);

  return v6;
}

- (BOOL)isEqualToContactNameRecordChangeResult:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  NSArray *changes;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  v5 = (unsigned __int8 *)v4;
  if (!v4)
    goto LABEL_4;
  changes = self->_changes;
  v7 = (NSArray *)*((id *)v4 + 2);
  if (changes == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  v9 = changes;
  v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_6:
    v11 = self->_changesTruncated == v5[8];
    goto LABEL_7;
  }
LABEL_4:
  v11 = 0;
LABEL_7:

  return v11;
}

- (NSArray)changes
{
  return self->_changes;
}

- (BOOL)changesTruncated
{
  return self->_changesTruncated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
}

+ (id)contactNameRecordChangeResultWithChanges:(id)a3 changesTruncated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  PPContactNameRecordChangeResult *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[PPContactNameRecordChangeResult initWithChanges:changesTruncated:]([PPContactNameRecordChangeResult alloc], "initWithChanges:changesTruncated:", v5, v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
