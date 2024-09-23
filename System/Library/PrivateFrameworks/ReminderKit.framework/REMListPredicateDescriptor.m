@implementation REMListPredicateDescriptor

- (REMListPredicateDescriptor)initWithType:(int64_t)a3
{
  REMListPredicateDescriptor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMListPredicateDescriptor;
  result = -[REMListPredicateDescriptor init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

+ (id)predicateDescriptorForAllLists
{
  return -[REMListPredicateDescriptor initWithType:]([REMListPredicateDescriptor alloc], "initWithType:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListPredicateDescriptor)initWithCoder:(id)a3
{
  id v4;
  REMListPredicateDescriptor *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *objectIDs;
  uint64_t v14;
  REMObjectID *accountID;
  uint64_t v16;
  REMObjectID *parentListID;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)REMListPredicateDescriptor;
  v5 = -[REMListPredicateDescriptor init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    if (v6)
    {
      v7 = v6;
      v8 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[REMListPredicateDescriptor initWithCoder:].cold.1(v7, v8);

    }
    v5->_type = 0;
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("objectIDs"));
    v12 = objc_claimAutoreleasedReturnValue();
    objectIDs = v5->_objectIDs;
    v5->_objectIDs = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v14 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentListID"));
    v16 = objc_claimAutoreleasedReturnValue();
    parentListID = v5->_parentListID;
    v5->_parentListID = (REMObjectID *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListPredicateDescriptor type](self, "type"), CFSTR("type"));
  -[REMListPredicateDescriptor objectIDs](self, "objectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectIDs"));

  -[REMListPredicateDescriptor accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountID"));

  -[REMListPredicateDescriptor parentListID](self, "parentListID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parentListID"));

}

- (BOOL)isEqual:(id)a3
{
  REMListPredicateDescriptor *v4;
  REMListPredicateDescriptor *v5;
  REMListPredicateDescriptor *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (REMListPredicateDescriptor *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    v7 = -[REMListPredicateDescriptor type](self, "type");
    if (v7 != -[REMListPredicateDescriptor type](v6, "type"))
      goto LABEL_11;
    -[REMListPredicateDescriptor accountID](self, "accountID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListPredicateDescriptor accountID](v6, "accountID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[REMListPredicateDescriptor accountID](self, "accountID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListPredicateDescriptor accountID](v6, "accountID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_11;
    }
    -[REMListPredicateDescriptor parentListID](self, "parentListID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListPredicateDescriptor parentListID](v6, "parentListID");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[REMListPredicateDescriptor parentListID](self, "parentListID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListPredicateDescriptor parentListID](v6, "parentListID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
      {
LABEL_11:
        v14 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    -[REMListPredicateDescriptor objectIDs](self, "objectIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListPredicateDescriptor objectIDs](v6, "objectIDs");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {
      v14 = 1;
      v24 = v22;
    }
    else
    {
      v24 = (void *)v23;
      -[REMListPredicateDescriptor objectIDs](self, "objectIDs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListPredicateDescriptor objectIDs](v6, "objectIDs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v25, "isEqual:", v26);

    }
    goto LABEL_12;
  }
  v14 = 1;
LABEL_13:

  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (REMObjectID)parentListID
{
  return self->_parentListID;
}

- (void)setParentListID:(id)a3
{
  objc_storeStrong((id *)&self->_parentListID, a3);
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_parentListID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMListPredicateDescriptorType %ld", (uint8_t *)&v2, 0xCu);
}

@end
