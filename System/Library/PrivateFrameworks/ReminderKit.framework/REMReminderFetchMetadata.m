@implementation REMReminderFetchMetadata

- (REMReminderFetchMetadata)initWithSubtaskCounts:(id)a3
{
  id v5;
  REMReminderFetchMetadata *v6;
  REMReminderFetchMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFetchMetadata;
  v6 = -[REMReminderFetchMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subtaskCounts, a3);

  return v7;
}

- (REMReminderFetchMetadata)initWithDueDateCounts:(id)a3
{
  id v5;
  REMReminderFetchMetadata *v6;
  REMReminderFetchMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFetchMetadata;
  v6 = -[REMReminderFetchMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dueDateCounts, a3);

  return v7;
}

- (REMReminderFetchMetadata)initWithSubtaskCounts:(id)a3 dueDateCounts:(id)a4
{
  id v7;
  id v8;
  REMReminderFetchMetadata *v9;
  REMReminderFetchMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMReminderFetchMetadata;
  v9 = -[REMReminderFetchMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subtaskCounts, a3);
    objc_storeStrong((id *)&v10->_dueDateCounts, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderFetchMetadata)initWithCoder:(id)a3
{
  id v4;
  REMReminderFetchMetadata *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *subtaskCounts;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *dueDateCounts;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)REMReminderFetchMetadata;
  v5 = -[REMFetchMetadata initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("subtaskCounts"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtaskCounts = v5->_subtaskCounts;
    v5->_subtaskCounts = (NSDictionary *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("dueDateCounts"));
    v15 = objc_claimAutoreleasedReturnValue();
    dueDateCounts = v5->_dueDateCounts;
    v5->_dueDateCounts = (NSArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMReminderFetchMetadata;
  v4 = a3;
  -[REMFetchMetadata encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[REMReminderFetchMetadata subtaskCounts](self, "subtaskCounts", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("subtaskCounts"));

  -[REMReminderFetchMetadata dueDateCounts](self, "dueDateCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dueDateCounts"));

}

- (BOOL)isEqual:(id)a3
{
  REMReminderFetchMetadata *v4;
  REMReminderFetchMetadata *v5;
  REMReminderFetchMetadata *v6;
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

  v4 = (REMReminderFetchMetadata *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMReminderFetchMetadata subtaskCounts](self, "subtaskCounts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderFetchMetadata subtaskCounts](v6, "subtaskCounts");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMReminderFetchMetadata subtaskCounts](self, "subtaskCounts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderFetchMetadata subtaskCounts](v6, "subtaskCounts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[REMReminderFetchMetadata dueDateCounts](self, "dueDateCounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderFetchMetadata dueDateCounts](v6, "dueDateCounts");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {
        v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        -[REMReminderFetchMetadata dueDateCounts](self, "dueDateCounts");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderFetchMetadata dueDateCounts](v6, "dueDateCounts");
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

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMReminderFetchMetadata subtaskCounts](self, "subtaskCounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSDictionary)subtaskCounts
{
  return self->_subtaskCounts;
}

- (NSArray)dueDateCounts
{
  return self->_dueDateCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDateCounts, 0);
  objc_storeStrong((id *)&self->_subtaskCounts, 0);
}

@end
