@implementation REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount)initWithFromDate:(id)a3 toDate:(id)a4
{
  id v7;
  id v8;
  REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *v9;
  REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount;
  v9 = -[REMStoreInvocationValueStorage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fromDate, a3);
    objc_storeStrong((id *)&v10->_toDate, a4);
  }

  return v10;
}

- (REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("fromDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("toDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount initWithFromDate:toDate:](self, "initWithFromDate:toDate:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount fromDate](self, "fromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fromDate"));

  -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount toDate](self, "toDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("toDate"));

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
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount fromDate](self, "fromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromDate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount fromDate](self, "fromDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount toDate](self, "toDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {
    v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount toDate](self, "toDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqual:", v16);

  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount fromDate](self, "fromDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount toDate](self, "toDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

@end
