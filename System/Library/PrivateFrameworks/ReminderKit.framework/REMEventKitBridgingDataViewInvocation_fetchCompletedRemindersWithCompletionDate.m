@implementation REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate)initWithListIDs:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate *v12;
  REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate;
  v12 = -[REMStoreInvocationValueStorage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listIDs, a3);
    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_endDate, a5);
  }

  return v13;
}

- (REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("listIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate initWithListIDs:startDate:endDate:](self, "initWithListIDs:startDate:endDate:", v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate listIDs](self, "listIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("listIDs"));

  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("startDate"));

  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate endDate](self, "endDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("endDate"));

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
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate listIDs](self, "listIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listIDs");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate listIDs](self, "listIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_8;
  }
  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate startDate](self, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
    {
LABEL_8:
      v17 = 0;
      goto LABEL_14;
    }
  }
  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate endDate](self, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v18 == (void *)v19)
  {
    v17 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate endDate](self, "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v21, "isEqual:", v22);

  }
LABEL_14:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate listIDs](self, "listIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[REMEventKitBridgingDataViewInvocation_fetchCompletedRemindersWithCompletionDate endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSArray)listIDs
{
  return self->_listIDs;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_listIDs, 0);
}

@end
