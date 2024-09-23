@implementation REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID)initWithParentReminderID:(id)a3 includingConcealed:(BOOL)a4
{
  id v7;
  REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID *v8;
  REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID;
  v8 = -[REMStoreInvocationValueStorage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parentReminderID, a3);
    v9->_includingConcealed = a4;
  }

  return v9;
}

- (REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentReminderID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includingConcealed"));

  if (v5)
  {
    self = -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID initWithParentReminderID:includingConcealed:](self, "initWithParentReminderID:includingConcealed:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID parentReminderID](self, "parentReminderID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("parentReminderID"));

  objc_msgSend(v5, "encodeBool:forKey:", -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID includingConcealed](self, "includingConcealed"), CFSTR("includingConcealed"));
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
  _BOOL4 v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID parentReminderID](self, "parentReminderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentReminderID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

    goto LABEL_6;
  }
  v7 = (void *)v6;
  -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID parentReminderID](self, "parentReminderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentReminderID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
LABEL_6:
    v12 = -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID includingConcealed](self, "includingConcealed");
    v11 = v12 ^ objc_msgSend(v4, "includingConcealed") ^ 1;
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v11) = 0;
LABEL_7:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID parentReminderID](self, "parentReminderID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4
     + -[REMRemindersDataViewInvocation_fetchSubtasksMasksByParentReminderID includingConcealed](self, "includingConcealed");

  return v5;
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (BOOL)includingConcealed
{
  return self->_includingConcealed;
}

- (void)setIncludingConcealed:(BOOL)a3
{
  self->_includingConcealed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentReminderID, 0);
}

@end
