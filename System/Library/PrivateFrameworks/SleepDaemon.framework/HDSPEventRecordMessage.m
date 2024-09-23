@implementation HDSPEventRecordMessage

- (HDSPEventRecordMessage)initWithDate:(id)a3
{
  id v5;
  HDSPEventRecordMessage *v6;
  HDSPEventRecordMessage *v7;
  HDSPEventRecordMessage *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPEventRecordMessage;
  v6 = -[HDSPEventRecordMessage init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)destinations
{
  return 3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_date, CFSTR("date"));
}

- (HDSPEventRecordMessage)initWithCoder:(id)a3
{
  id v4;
  HDSPEventRecordMessage *v5;
  uint64_t v6;
  NSDate *date;
  HDSPEventRecordMessage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPEventRecordMessage;
  v5 = -[HDSPEventRecordMessage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HDSPEventRecordMessage succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)dateDescription
{
  return (NSString *)&stru_24D4E68A0;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPEventRecordMessage date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPEventRecordMessage dateDescription](self, "dateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v4, v5);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HDSPEventRecordMessage descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
