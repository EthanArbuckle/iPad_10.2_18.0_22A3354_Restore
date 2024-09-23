@implementation REMReminderFetchMetadataDueDateCount

- (REMReminderFetchMetadataDueDateCount)initWithDueDate:(id)a3 count:(int64_t)a4
{
  id v7;
  REMReminderFetchMetadataDueDateCount *v8;
  REMReminderFetchMetadataDueDateCount *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMReminderFetchMetadataDueDateCount;
  v8 = -[REMReminderFetchMetadataDueDateCount init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dueDate, a3);
    v9->_count = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderFetchMetadataDueDateCount)initWithCoder:(id)a3
{
  id v4;
  REMReminderFetchMetadataDueDateCount *v5;
  uint64_t v6;
  NSDate *dueDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFetchMetadataDueDateCount;
  v5 = -[REMReminderFetchMetadataDueDateCount init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v6;

    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[REMReminderFetchMetadataDueDateCount dueDate](self, "dueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("dueDate"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[REMReminderFetchMetadataDueDateCount count](self, "count"), CFSTR("count"));
}

- (BOOL)isEqual:(id)a3
{
  REMReminderFetchMetadataDueDateCount *v4;
  REMReminderFetchMetadataDueDateCount *v5;
  REMReminderFetchMetadataDueDateCount *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  int64_t v14;

  v4 = (REMReminderFetchMetadataDueDateCount *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMReminderFetchMetadataDueDateCount dueDate](self, "dueDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderFetchMetadataDueDateCount dueDate](v6, "dueDate");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMReminderFetchMetadataDueDateCount dueDate](self, "dueDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderFetchMetadataDueDateCount dueDate](v6, "dueDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      v14 = -[REMReminderFetchMetadataDueDateCount count](self, "count");
      v13 = v14 == -[REMReminderFetchMetadataDueDateCount count](v6, "count");
      goto LABEL_9;
    }
LABEL_5:
    v13 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[REMReminderFetchMetadataDueDateCount dueDate](self, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[REMReminderFetchMetadataDueDateCount count](self, "count") + v4;

  return v5;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDate, 0);
}

@end
