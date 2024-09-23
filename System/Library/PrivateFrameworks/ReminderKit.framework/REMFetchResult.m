@implementation REMFetchResult

- (REMFetchResult)initWithType:(int64_t)a3
{
  REMFetchResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMFetchResult;
  result = -[REMFetchResult init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (REMFetchResult)initWithCount:(int64_t)a3
{
  REMFetchResult *result;

  result = -[REMFetchResult initWithType:](self, "initWithType:", 2);
  if (result)
    result->_count = a3;
  return result;
}

- (REMFetchResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 requestedObjectIDs:(id)a6 metadata:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  REMFetchResult *v17;
  REMFetchResult *v18;
  id v20;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[REMFetchResult initWithType:](self, "initWithType:", 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fetchedAccountStorages, a3);
    objc_storeStrong((id *)&v18->_fetchedListStorages, a4);
    objc_storeStrong((id *)&v18->_fetchedReminderStorages, a5);
    objc_storeStrong((id *)&v18->_requestedObjectIDs, a6);
    objc_storeStrong((id *)&v18->_metadata, a7);
  }

  return v18;
}

- (REMFetchResult)initWithAccountStorages:(id)a3
{
  id v5;
  REMFetchResult *v6;
  REMFetchResult *v7;

  v5 = a3;
  v6 = -[REMFetchResult initWithType:](self, "initWithType:", 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fetchedAccountStorages, a3);

  return v7;
}

- (REMFetchResult)initWithListStorages:(id)a3
{
  id v5;
  REMFetchResult *v6;
  REMFetchResult *v7;

  v5 = a3;
  v6 = -[REMFetchResult initWithType:](self, "initWithType:", 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fetchedListStorages, a3);

  return v7;
}

- (REMFetchResult)initWithReminderStorages:(id)a3
{
  id v5;
  REMFetchResult *v6;
  REMFetchResult *v7;

  v5 = a3;
  v6 = -[REMFetchResult initWithType:](self, "initWithType:", 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fetchedReminderStorages, a3);

  return v7;
}

- (REMFetchResult)initWithRequestedObjectIDs:(id)a3
{
  id v5;
  REMFetchResult *v6;
  REMFetchResult *v7;

  v5 = a3;
  v6 = -[REMFetchResult initWithType:](self, "initWithType:", 3);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestedObjectIDs, a3);

  return v7;
}

- (REMFetchResult)initWithMetadata:(id)a3
{
  id v5;
  REMFetchResult *v6;
  REMFetchResult *v7;

  v5 = a3;
  v6 = -[REMFetchResult initWithType:](self, "initWithType:", 4);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metadata, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFetchResult)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  REMFetchResult *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *fetchedAccountStorages;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *fetchedListStorages;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *fetchedReminderStorages;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *requestedObjectIDs;
  uint64_t v28;
  REMFetchResultToken *fetchResultToken;
  uint64_t v30;
  REMFetchMetadata *metadata;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v5 >= 5)
  {
    v6 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[REMFetchResult initWithCoder:].cold.1(v5, v6);

    v5 = 0;
  }
  v7 = -[REMFetchResult initWithType:](self, "initWithType:", v5);
  if (v7)
  {
    v7->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("fetchedAccountStorages"));
    v11 = objc_claimAutoreleasedReturnValue();
    fetchedAccountStorages = v7->_fetchedAccountStorages;
    v7->_fetchedAccountStorages = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("fetchedListStorages"));
    v16 = objc_claimAutoreleasedReturnValue();
    fetchedListStorages = v7->_fetchedListStorages;
    v7->_fetchedListStorages = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("fetchedReminderStorages"));
    v21 = objc_claimAutoreleasedReturnValue();
    fetchedReminderStorages = v7->_fetchedReminderStorages;
    v7->_fetchedReminderStorages = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("requestedObjectIDs"));
    v26 = objc_claimAutoreleasedReturnValue();
    requestedObjectIDs = v7->_requestedObjectIDs;
    v7->_requestedObjectIDs = (NSArray *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fetchResultToken"));
    v28 = objc_claimAutoreleasedReturnValue();
    fetchResultToken = v7->_fetchResultToken;
    v7->_fetchResultToken = (REMFetchResultToken *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v30 = objc_claimAutoreleasedReturnValue();
    metadata = v7->_metadata;
    v7->_metadata = (REMFetchMetadata *)v30;

  }
  return v7;
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
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFetchResult type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFetchResult count](self, "count"), CFSTR("count"));
  -[REMFetchResult fetchedAccountStorages](self, "fetchedAccountStorages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fetchedAccountStorages"));

  -[REMFetchResult fetchedListStorages](self, "fetchedListStorages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fetchedListStorages"));

  -[REMFetchResult fetchedReminderStorages](self, "fetchedReminderStorages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("fetchedReminderStorages"));

  -[REMFetchResult requestedObjectIDs](self, "requestedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("requestedObjectIDs"));

  -[REMFetchResult fetchResultToken](self, "fetchResultToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("fetchResultToken"));

  -[REMFetchResult metadata](self, "metadata");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("metadata"));

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  switch(-[REMFetchResult type](self, "type"))
  {
    case 0:
    case 1:
      v3 = (void *)MEMORY[0x1E0CB3940];
      -[REMFetchResult fetchedAccountStorages](self, "fetchedAccountStorages");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");
      -[REMFetchResult fetchedListStorages](self, "fetchedListStorages");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      -[REMFetchResult fetchedReminderStorages](self, "fetchedReminderStorages");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      -[REMFetchResult requestedObjectIDs](self, "requestedObjectIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("[a:%ld,l:%ld,r:%ld,ids:%ld]"), v5, v7, v9, objc_msgSend(v10, "count"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count: %ld"), -[REMFetchResult count](self, "count"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[REMFetchResult requestedObjectIDs](self, "requestedObjectIDs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("objectIDs.count: %ld"), objc_msgSend(v4, "count"));
      goto LABEL_7;
    case 4:
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[REMFetchResult metadata](self, "metadata");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("metadata: %@"), v4);
LABEL_7:
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      break;
    default:
      v11 = &stru_1E67FB1F0;
      break;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[REMFetchResult fetchResultToken](self, "fetchResultToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[REMFetchResult fetchResultToken](self, "fetchResultToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("fetchResultToken: %@"), v17);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addObject:", v18);
  }
  else
  {
    v18 = &stru_1E67FB1F0;
  }
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    objc_msgSend(CFSTR(", "), "stringByAppendingString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  v22 = objc_opt_class();
  NSStringFromREMFetchRequestType(-[REMFetchResult type](self, "type"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p type: %@%@%@>"), v22, self, v23, v11, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (NSArray)requestedObjectIDs
{
  return self->_requestedObjectIDs;
}

- (NSArray)fetchedAccountStorages
{
  return self->_fetchedAccountStorages;
}

- (NSArray)fetchedListStorages
{
  return self->_fetchedListStorages;
}

- (NSArray)fetchedReminderStorages
{
  return self->_fetchedReminderStorages;
}

- (REMFetchMetadata)metadata
{
  return self->_metadata;
}

- (REMFetchResultToken)fetchResultToken
{
  return self->_fetchResultToken;
}

- (void)setFetchResultToken:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResultToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResultToken, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fetchedReminderStorages, 0);
  objc_storeStrong((id *)&self->_fetchedListStorages, 0);
  objc_storeStrong((id *)&self->_fetchedAccountStorages, 0);
  objc_storeStrong((id *)&self->_requestedObjectIDs, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMFetchRequestType %ld", (uint8_t *)&v2, 0xCu);
}

@end
