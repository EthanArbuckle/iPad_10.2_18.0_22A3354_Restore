@implementation REMListFetchMetadata

- (REMListFetchMetadata)initWithIncompleteReminderCounts:(id)a3 scheduledCount:(int64_t)a4
{
  id v7;
  REMListFetchMetadata *v8;
  REMListFetchMetadata *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMListFetchMetadata;
  v8 = -[REMListFetchMetadata init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_incompleteReminderCounts, a3);
    v9->_scheduledCount = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListFetchMetadata)initWithCoder:(id)a3
{
  id v4;
  REMListFetchMetadata *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *incompleteReminderCounts;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)REMListFetchMetadata;
  v5 = -[REMFetchMetadata initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("incompleteReminderCounts"));
    v10 = objc_claimAutoreleasedReturnValue();
    incompleteReminderCounts = v5->_incompleteReminderCounts;
    v5->_incompleteReminderCounts = (NSDictionary *)v10;

    v5->_scheduledCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduledCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMListFetchMetadata;
  v4 = a3;
  -[REMFetchMetadata encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[REMListFetchMetadata incompleteReminderCounts](self, "incompleteReminderCounts", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("incompleteReminderCounts"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListFetchMetadata scheduledCount](self, "scheduledCount"), CFSTR("scheduledCount"));
}

- (BOOL)isEqual:(id)a3
{
  REMListFetchMetadata *v4;
  REMListFetchMetadata *v5;
  REMListFetchMetadata *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMListFetchMetadata *)a3;
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
      -[REMListFetchMetadata incompleteReminderCounts](self, "incompleteReminderCounts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListFetchMetadata incompleteReminderCounts](v6, "incompleteReminderCounts");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[REMListFetchMetadata incompleteReminderCounts](self, "incompleteReminderCounts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMListFetchMetadata incompleteReminderCounts](v6, "incompleteReminderCounts");
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

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMListFetchMetadata incompleteReminderCounts](self, "incompleteReminderCounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSDictionary)incompleteReminderCounts
{
  return self->_incompleteReminderCounts;
}

- (int64_t)scheduledCount
{
  return self->_scheduledCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incompleteReminderCounts, 0);
}

@end
