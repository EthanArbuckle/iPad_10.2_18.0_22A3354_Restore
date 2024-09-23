@implementation REMAlarmContactTrigger

+ (id)cdEntityName
{
  return CFSTR("REMCAlarmContactTrigger");
}

- (REMAlarmContactTrigger)initWithObjectID:(id)a3 contactRepresentation:(id)a4
{
  id v7;
  REMAlarmContactTrigger *v8;
  REMAlarmContactTrigger *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)REMAlarmContactTrigger;
  v8 = -[REMAlarmTrigger initWithObjectID:](&v11, sel_initWithObjectID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_contactRepresentation, a4);

  return v9;
}

- (REMAlarmContactTrigger)initWithContactRepresentation:(id)a3
{
  id v5;
  REMAlarmContactTrigger *v6;
  REMAlarmContactTrigger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmContactTrigger;
  v6 = -[REMAlarmTrigger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactRepresentation, a3);

  return v7;
}

- (REMAlarmContactTrigger)initWithCoder:(id)a3
{
  id v4;
  REMAlarmContactTrigger *v5;
  uint64_t v6;
  REMContactRepresentation *contactRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmContactTrigger;
  v5 = -[REMAlarmTrigger initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactRepresentation"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactRepresentation = v5->_contactRepresentation;
    v5->_contactRepresentation = (REMContactRepresentation *)v6;

  }
  return v5;
}

- (id)_deepCopy
{
  REMAlarmContactTrigger *v3;
  void *v4;
  REMAlarmContactTrigger *v5;

  v3 = [REMAlarmContactTrigger alloc];
  -[REMAlarmContactTrigger contactRepresentation](self, "contactRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMAlarmContactTrigger initWithContactRepresentation:](v3, "initWithContactRepresentation:", v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  REMAlarmContactTrigger *v4;
  REMAlarmContactTrigger *v5;
  REMAlarmContactTrigger *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMAlarmContactTrigger *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMAlarmContactTrigger contactRepresentation](v6, "contactRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarmContactTrigger contactRepresentation](self, "contactRepresentation");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[REMAlarmContactTrigger contactRepresentation](v6, "contactRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarmContactTrigger contactRepresentation](self, "contactRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (BOOL)isTemporal
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAlarmContactTrigger contactRepresentation](self, "contactRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmContactTrigger;
  -[REMAlarmContactTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarmContactTrigger contactRepresentation](self, "contactRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {contact: %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMAlarmContactTrigger;
  v4 = a3;
  -[REMAlarmTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[REMAlarmContactTrigger contactRepresentation](self, "contactRepresentation", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contactRepresentation"));

}

- (REMContactRepresentation)contactRepresentation
{
  return self->_contactRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactRepresentation, 0);
}

@end
