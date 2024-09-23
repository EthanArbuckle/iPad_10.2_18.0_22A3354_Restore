@implementation REMRemindersDataViewInvocation_fetchByPredicateDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByPredicateDescriptor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMRemindersDataViewInvocation_fetchByPredicateDescriptor *v12;
  REMRemindersDataViewInvocation_fetchByPredicateDescriptor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMRemindersDataViewInvocation_fetchByPredicateDescriptor;
  v12 = -[REMStoreInvocationValueStorage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_predicateDescriptor, a3);
    objc_storeStrong((id *)&v13->_sortDescriptors, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (REMRemindersDataViewInvocation_fetchByPredicateDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  REMRemindersDataViewInvocation_fetchByPredicateDescriptor *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicateDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sortDescriptors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor initWithPredicateDescriptor:sortDescriptors:options:](self, "initWithPredicateDescriptor:sortDescriptors:options:", v5, v9, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor predicateDescriptor](self, "predicateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("predicateDescriptor"));

  -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor sortDescriptors](self, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sortDescriptors"));

  -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor options](self, "options");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("options"));

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
  -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor predicateDescriptor](self, "predicateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateDescriptor");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor predicateDescriptor](self, "predicateDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_8;
  }
  -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor sortDescriptors](self, "sortDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptors");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor sortDescriptors](self, "sortDescriptors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortDescriptors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
    {
LABEL_8:
      v17 = 0;
      goto LABEL_14;
    }
  }
  -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor options](self, "options");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v18 == (void *)v19)
  {
    v17 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor options](self, "options");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v21, "isEqual:", v22);

  }
LABEL_14:

  return v17;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMRemindersDataViewInvocation_fetchByPredicateDescriptor predicateDescriptor](self, "predicateDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (REMReminderPredicateDescriptor)predicateDescriptor
{
  return self->_predicateDescriptor;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (REMReminderFetchOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicateDescriptor, 0);
}

@end
