@implementation REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID)initWithParentReminderID:(id)a3 includeIncomplete:(BOOL)a4 includeCompleted:(BOOL)a5 isUnsupported:(BOOL)a6
{
  id v11;
  REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID *v12;
  REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID;
  v12 = -[REMStoreInvocationValueStorage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parentReminderID, a3);
    v13->_includeIncomplete = a4;
    v13->_includeCompleted = a5;
    v13->_isUnsupported = a6;
  }

  return v13;
}

- (REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentReminderID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeIncomplete"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeCompleted"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUnsupported"));

  if (v5)
  {
    self = -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID initWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:](self, "initWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:", v5, v6, v7, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID parentReminderID](self, "parentReminderID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("parentReminderID"));

  objc_msgSend(v5, "encodeBool:forKey:", -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID includeIncomplete](self, "includeIncomplete"), CFSTR("includeIncomplete"));
  objc_msgSend(v5, "encodeBool:forKey:", -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID includeCompleted](self, "includeCompleted"), CFSTR("includeCompleted"));
  objc_msgSend(v5, "encodeBool:forKey:", -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID isUnsupported](self, "isUnsupported"), CFSTR("isUnsupported"));

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
  int v11;
  int v12;
  int v13;
  _BOOL4 v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID parentReminderID](self, "parentReminderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentReminderID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID parentReminderID](self, "parentReminderID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentReminderID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_8;
  }
  v11 = -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID includeIncomplete](self, "includeIncomplete");
  if (v11 == objc_msgSend(v4, "includeIncomplete"))
  {
    v12 = -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID includeCompleted](self, "includeCompleted");
    if (v12 == objc_msgSend(v4, "includeCompleted"))
    {
      v15 = -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID isUnsupported](self, "isUnsupported");
      v13 = v15 ^ objc_msgSend(v4, "isUnsupported") ^ 1;
      goto LABEL_9;
    }
  }
LABEL_8:
  LOBYTE(v13) = 0;
LABEL_9:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID parentReminderID](self, "parentReminderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4
     + -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID includeIncomplete](self, "includeIncomplete");
  v6 = v5
     + -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID includeCompleted](self, "includeCompleted");
  v7 = v6 + -[REMRemindersDataViewInvocation_fetchReminderIDsByParentReminderID isUnsupported](self, "isUnsupported");

  return v7;
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (BOOL)includeIncomplete
{
  return self->_includeIncomplete;
}

- (BOOL)includeCompleted
{
  return self->_includeCompleted;
}

- (BOOL)isUnsupported
{
  return self->_isUnsupported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentReminderID, 0);
}

@end
