@implementation REMChangeTrackingState

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMChangeTrackingState lastConsumedChangeToken](self, "lastConsumedChangeToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("lastConsumedChangeToken"));

  -[REMChangeTrackingState lastConsumedDate](self, "lastConsumedDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lastConsumedDate"));

}

- (REMChangeTrackingState)initWithCoder:(id)a3
{
  id v4;
  REMChangeTrackingState *v5;
  REMChangeToken *v6;
  REMChangeToken *lastConsumedChangeToken;
  REMChangeToken *v8;
  uint64_t v9;
  NSDate *lastConsumedDate;
  REMChangeTrackingState *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)REMChangeTrackingState;
  v5 = -[REMChangeTrackingState init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastConsumedChangeToken"));
    v6 = (REMChangeToken *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    lastConsumedChangeToken = v5->_lastConsumedChangeToken;
    v5->_lastConsumedChangeToken = v6;
    v8 = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastConsumedDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    lastConsumedDate = v5->_lastConsumedDate;
    v5->_lastConsumedDate = (NSDate *)v9;

  }
  v11 = v5;
LABEL_6:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMChangeToken)lastConsumedChangeToken
{
  return self->_lastConsumedChangeToken;
}

- (void)setLastConsumedChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_lastConsumedChangeToken, a3);
}

- (NSDate)lastConsumedDate
{
  return self->_lastConsumedDate;
}

- (void)setLastConsumedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastConsumedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConsumedDate, 0);
  objc_storeStrong((id *)&self->_lastConsumedChangeToken, 0);
}

- (BOOL)isEqual:(id)a3
{
  REMChangeTrackingState *v4;
  REMChangeTrackingState *v5;
  REMChangeTrackingState *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (REMChangeTrackingState *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMChangeTrackingState lastConsumedChangeToken](self, "lastConsumedChangeToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMChangeTrackingState lastConsumedChangeToken](v6, "lastConsumedChangeToken");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMChangeTrackingState lastConsumedChangeToken](self, "lastConsumedChangeToken");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMChangeTrackingState lastConsumedChangeToken](v6, "lastConsumedChangeToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[REMChangeTrackingState lastConsumedDate](self, "lastConsumedDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMChangeTrackingState lastConsumedDate](v6, "lastConsumedDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {
        v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        -[REMChangeTrackingState lastConsumedDate](self, "lastConsumedDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMChangeTrackingState lastConsumedDate](v6, "lastConsumedDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "isEqual:", v18);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

@end
