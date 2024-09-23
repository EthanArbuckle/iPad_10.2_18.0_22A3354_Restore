@implementation SIRINLURRGroupIdentifier

- (SIRINLURRGroupIdentifier)initWithGroupId:(id)a3 seq:(int)a4
{
  id v7;
  SIRINLURRGroupIdentifier *v8;
  SIRINLURRGroupIdentifier *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLURRGroupIdentifier;
  v8 = -[SIRINLURRGroupIdentifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groupId, a3);
    v9->_seq = a4;
  }

  return v9;
}

- (SIRINLURRGroupIdentifier)initWithCoder:(id)a3
{
  id v4;
  SIRINLURRGroupIdentifier *v5;
  uint64_t v6;
  NSString *groupId;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SIRINLURRGroupIdentifier;
  v5 = -[SIRINLURRGroupIdentifier init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupId"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupId = v5->_groupId;
    v5->_groupId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seq"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_seq = objc_msgSend(v8, "intValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupId;
  id v5;
  id v6;

  groupId = self->_groupId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupId, CFSTR("groupId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_seq);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("seq"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{RRGroupIdentifier\n  groupId: %@\n  seq: %d\n}"), self->_groupId, self->_seq);
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (int)seq
{
  return self->_seq;
}

- (void)setSeq:(int)a3
{
  self->_seq = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
