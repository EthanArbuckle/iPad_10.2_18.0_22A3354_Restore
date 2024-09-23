@implementation REMSiriSearchLimitedDataViewInvocation_fetchReminders

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSiriSearchLimitedDataViewInvocation_fetchReminders)initWithTitle:(id)a3 dueAfter:(id)a4 dueBefore:(id)a5 isCompleted:(id)a6 hasLocation:(id)a7 location:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  REMSiriSearchLimitedDataViewInvocation_fetchReminders *v20;
  uint64_t v21;
  NSString *title;
  uint64_t v23;
  NSDate *dueBefore;
  uint64_t v25;
  NSDate *dueAfter;
  uint64_t v27;
  NSNumber *completed;
  uint64_t v29;
  NSNumber *hasLocation;
  uint64_t v31;
  NSString *location;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)REMSiriSearchLimitedDataViewInvocation_fetchReminders;
  v20 = -[REMStoreInvocationValueStorage init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    title = v20->_title;
    v20->_title = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    dueBefore = v20->_dueBefore;
    v20->_dueBefore = (NSDate *)v23;

    v25 = objc_msgSend(v15, "copy");
    dueAfter = v20->_dueAfter;
    v20->_dueAfter = (NSDate *)v25;

    v27 = objc_msgSend(v17, "copy");
    completed = v20->_completed;
    v20->_completed = (NSNumber *)v27;

    v29 = objc_msgSend(v18, "copy");
    hasLocation = v20->_hasLocation;
    v20->_hasLocation = (NSNumber *)v29;

    v31 = objc_msgSend(v19, "copy");
    location = v20->_location;
    v20->_location = (NSString *)v31;

  }
  return v20;
}

- (REMSiriSearchLimitedDataViewInvocation_fetchReminders)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  REMSiriSearchLimitedDataViewInvocation_fetchReminders *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueBefore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueAfter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[REMSiriSearchLimitedDataViewInvocation_fetchReminders initWithTitle:dueAfter:dueBefore:isCompleted:hasLocation:location:](self, "initWithTitle:dueAfter:dueBefore:isCompleted:hasLocation:location:", v5, v7, v6, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders dueBefore](self, "dueBefore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dueBefore"));

  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders dueAfter](self, "dueAfter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dueAfter"));

  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders completed](self, "completed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("completed"));

  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders hasLocation](self, "hasLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("hasLocation"));

  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders location](self, "location");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("location"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  char v35;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_20;
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMSiriSearchLimitedDataViewInvocation_fetchReminders title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_20;
  }
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders dueBefore](self, "dueBefore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueBefore");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMSiriSearchLimitedDataViewInvocation_fetchReminders dueBefore](self, "dueBefore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dueBefore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders dueAfter](self, "dueAfter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dueAfter");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[REMSiriSearchLimitedDataViewInvocation_fetchReminders dueAfter](self, "dueAfter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dueAfter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_20;
  }
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders completed](self, "completed");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completed");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v23 == (void *)v24)
  {

  }
  else
  {
    v25 = (void *)v24;
    -[REMSiriSearchLimitedDataViewInvocation_fetchReminders completed](self, "completed");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completed");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_20;
  }
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders hasLocation](self, "hasLocation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hasLocation");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v29 == (void *)v30)
  {

  }
  else
  {
    v31 = (void *)v30;
    -[REMSiriSearchLimitedDataViewInvocation_fetchReminders hasLocation](self, "hasLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hasLocation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if (!v34)
    {
LABEL_20:
      v35 = 0;
      goto LABEL_21;
    }
  }
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders location](self, "location");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v37 == (void *)v38)
  {
    v35 = 1;
    v39 = v37;
  }
  else
  {
    v39 = (void *)v38;
    -[REMSiriSearchLimitedDataViewInvocation_fetchReminders location](self, "location");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v40, "isEqual:", v41);

  }
LABEL_21:

  return v35;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders dueBefore](self, "dueBefore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders dueAfter](self, "dueAfter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders completed](self, "completed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders hasLocation](self, "hasLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[REMSiriSearchLimitedDataViewInvocation_fetchReminders location](self, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)dueAfter
{
  return self->_dueAfter;
}

- (NSDate)dueBefore
{
  return self->_dueBefore;
}

- (NSNumber)completed
{
  return self->_completed;
}

- (NSNumber)hasLocation
{
  return self->_hasLocation;
}

- (NSString)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_hasLocation, 0);
  objc_storeStrong((id *)&self->_completed, 0);
  objc_storeStrong((id *)&self->_dueBefore, 0);
  objc_storeStrong((id *)&self->_dueAfter, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
