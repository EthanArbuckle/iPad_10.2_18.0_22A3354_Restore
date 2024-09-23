@implementation OSALogIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bugType, 0);
  objc_storeStrong((id *)&self->_incidentID, 0);
}

- (OSALogIdentity)initWithIncidentID:(id)a3 bugType:(id)a4
{
  id v7;
  id v8;
  OSALogIdentity *v9;
  OSALogIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSALogIdentity;
  v9 = -[OSALogIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_incidentID, a3);
    objc_storeStrong((id *)&v10->_bugType, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), self->_incidentID, self->_bugType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *incidentID;
  id v5;

  incidentID = self->_incidentID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", incidentID, CFSTR("incidentID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bugType, CFSTR("bugType"));

}

- (OSALogIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OSALogIdentity *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("incidentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("OSALogIdentity missing incidentID"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bugType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("OSALogIdentity missing bugType"));
  v7 = -[OSALogIdentity initWithIncidentID:bugType:](self, "initWithIncidentID:bugType:", v5, v6);

  return v7;
}

- (NSString)incidentID
{
  return self->_incidentID;
}

- (NSString)bugType
{
  return self->_bugType;
}

@end
