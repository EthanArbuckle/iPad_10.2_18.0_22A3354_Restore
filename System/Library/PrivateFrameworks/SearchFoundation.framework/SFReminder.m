@implementation SFReminder

- (SFReminder)initWithProtobuf:(id)a3
{
  id v4;
  SFReminder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFReminder *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFReminder;
  v5 = -[SFReminder init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFReminder setTitle:](v5, "setTitle:", v7);

    }
    objc_msgSend(v4, "dueDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "dueDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v9, "secondsSince1970");
      objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFReminder setDueDate:](v5, "setDueDate:", v11);

    }
    objc_msgSend(v4, "notes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "notes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFReminder setNotes:](v5, "setNotes:", v13);

    }
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFReminder)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBReminder *v6;
  SFReminder *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBReminder initWithData:]([_SFPBReminder alloc], "initWithData:", v5);
  v7 = -[SFReminder initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBReminder *v6;

  v4 = a3;
  v6 = -[_SFPBReminder initWithFacade:]([_SFPBReminder alloc], "initWithFacade:", self);
  -[_SFPBReminder data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBReminder *v2;
  void *v3;

  v2 = -[_SFPBReminder initWithFacade:]([_SFPBReminder alloc], "initWithFacade:", self);
  -[_SFPBReminder dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBReminder *v2;
  void *v3;

  v2 = -[_SFPBReminder initWithFacade:]([_SFPBReminder alloc], "initWithFacade:", self);
  -[_SFPBReminder jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFReminder title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  -[SFReminder dueDate](self, "dueDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDueDate:", v8);

  -[SFReminder notes](self, "notes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setNotes:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFReminder *v5;
  SFReminder *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = (SFReminder *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFReminder isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFReminder title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFReminder title](v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      -[SFReminder title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFReminder title](self, "title");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFReminder title](v6, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      -[SFReminder dueDate](self, "dueDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFReminder dueDate](v6, "dueDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_27;
      }
      -[SFReminder dueDate](self, "dueDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v25 = v12;
        -[SFReminder dueDate](self, "dueDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFReminder dueDate](v6, "dueDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      -[SFReminder notes](self, "notes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFReminder notes](v6, "notes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v17 == 0) == (v18 != 0))
      {

        v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30)
          goto LABEL_26;
      }
      else
      {
        v24 = v17;
        v26 = v18;
        -[SFReminder notes](self, "notes");
        v19 = objc_claimAutoreleasedReturnValue();
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          -[SFReminder notes](self, "notes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFReminder notes](v6, "notes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v22, "isEqual:");

        }
        else
        {

          v11 = 1;
        }
        v3 = v27;
        if (!v30)
          goto LABEL_26;
      }
LABEL_25:

LABEL_26:
LABEL_27:
      v10 = v31;
      if (!v9)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    v11 = 0;
  }
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SFReminder title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFReminder dueDate](self, "dueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFReminder notes](self, "notes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
