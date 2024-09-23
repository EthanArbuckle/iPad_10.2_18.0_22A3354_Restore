@implementation REMAlarmDateTrigger

+ (id)cdEntityName
{
  return CFSTR("REMCDAlarmDateTrigger");
}

- (REMAlarmDateTrigger)initWithDateComponents:(id)a3
{
  id v4;
  REMAlarmDateTrigger *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmDateTrigger;
  v5 = -[REMAlarmTrigger init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "rem_gregorianEquivalent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAlarmDateTrigger setDateComponents:](v5, "setDateComponents:", v6);

  }
  return v5;
}

- (REMAlarmDateTrigger)initWithObjectID:(id)a3 dateComponents:(id)a4
{
  id v6;
  REMAlarmDateTrigger *v7;
  REMAlarmDateTrigger *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)REMAlarmDateTrigger;
  v7 = -[REMAlarmTrigger initWithObjectID:](&v10, sel_initWithObjectID_, a3);
  v8 = v7;
  if (v7)
    -[REMAlarmDateTrigger setDateComponents:](v7, "setDateComponents:", v6);

  return v8;
}

- (id)_deepCopy
{
  REMAlarmDateTrigger *v3;
  void *v4;
  REMAlarmDateTrigger *v5;

  v3 = [REMAlarmDateTrigger alloc];
  -[REMAlarmDateTrigger dateComponents](self, "dateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMAlarmDateTrigger initWithDateComponents:](v3, "initWithDateComponents:", v4);

  return v5;
}

- (BOOL)isTemporal
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[REMAlarmDateTrigger dateComponents](self, "dateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAlarmDateTrigger dateComponents](self, "dateComponents");
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
  v8.super_class = (Class)REMAlarmDateTrigger;
  -[REMAlarmDateTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarmDateTrigger dateComponents](self, "dateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAlarmDateTrigger)initWithCoder:(id)a3
{
  id v4;
  REMAlarmDateTrigger *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmDateTrigger;
  v5 = -[REMAlarmTrigger initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateComponents"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAlarmDateTrigger setDateComponents:](v5, "setDateComponents:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMAlarmDateTrigger;
  v4 = a3;
  -[REMAlarmTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[REMAlarmDateTrigger dateComponents](self, "dateComponents", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dateComponents"));

}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void)setDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end
