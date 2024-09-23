@implementation REMRemindersDataViewInvocation_fetchByListID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByListID)initWithListID:(id)a3 includingSubtasks:(BOOL)a4
{
  id v7;
  REMRemindersDataViewInvocation_fetchByListID *v8;
  REMRemindersDataViewInvocation_fetchByListID *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMRemindersDataViewInvocation_fetchByListID;
  v8 = -[REMStoreInvocationValueStorage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_listID, a3);
    v9->_includingSubtasks = a4;
  }

  return v9;
}

- (REMRemindersDataViewInvocation_fetchByListID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMRemindersDataViewInvocation_fetchByListID *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includingSubtasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[REMRemindersDataViewInvocation_fetchByListID initWithListID:includingSubtasks:](self, "initWithListID:includingSubtasks:", v5, objc_msgSend(v6, "BOOLValue"));
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
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMRemindersDataViewInvocation_fetchByListID listID](self, "listID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("listID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMRemindersDataViewInvocation_fetchByListID includingSubtasks](self, "includingSubtasks"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("includingSubtasks"));

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
  -[REMRemindersDataViewInvocation_fetchByListID listID](self, "listID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

    goto LABEL_6;
  }
  v7 = (void *)v6;
  -[REMRemindersDataViewInvocation_fetchByListID listID](self, "listID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
LABEL_6:
    v12 = -[REMRemindersDataViewInvocation_fetchByListID includingSubtasks](self, "includingSubtasks");
    v11 = v12 ^ objc_msgSend(v4, "includingSubtasks") ^ 1;
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

  -[REMRemindersDataViewInvocation_fetchByListID listID](self, "listID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 + -[REMRemindersDataViewInvocation_fetchByListID includingSubtasks](self, "includingSubtasks");

  return v5;
}

- (BOOL)includingSubtasks
{
  return self->_includingSubtasks;
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listID, 0);
}

@end
