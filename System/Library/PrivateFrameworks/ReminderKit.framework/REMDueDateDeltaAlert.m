@implementation REMDueDateDeltaAlert

- (REMDueDateDeltaAlert)initWithIdentifier:(id)a3 reminderID:(id)a4 accountID:(id)a5 dueDateDelta:(id)a6 creationDate:(id)a7 acknowledgedDate:(id)a8 minimumSupportedAppVersion:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  REMDueDateDeltaAlert *v19;
  REMDueDateDeltaAlert *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)REMDueDateDeltaAlert;
  v19 = -[REMDueDateDeltaAlert init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_reminderID, a4);
    objc_storeStrong((id *)&v20->_accountID, a5);
    objc_storeStrong((id *)&v20->_dueDateDelta, a6);
    objc_storeStrong((id *)&v20->_creationDate, a7);
    objc_storeStrong((id *)&v20->_acknowledgedDate, a8);
    v20->_minimumSupportedAppVersion = a9;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDueDateDeltaAlert)initWithCoder:(id)a3
{
  id v4;
  REMDueDateDeltaAlert *v5;
  NSUUID *v6;
  REMObjectID *v7;
  REMObjectID *v8;
  NSDate *v9;
  uint64_t v10;
  REMDueDateDeltaInterval *v11;
  NSUUID *identifier;
  NSUUID *v13;
  REMObjectID *reminderID;
  REMObjectID *v15;
  REMObjectID *accountID;
  REMObjectID *v17;
  NSDate *creationDate;
  NSDate *v19;
  REMDueDateDeltaInterval *dueDateDelta;
  REMDueDateDeltaInterval *v21;
  uint64_t v22;
  NSDate *acknowledgedDate;
  REMDueDateDeltaAlert *v24;
  NSObject *v25;
  const char *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)REMDueDateDeltaAlert;
  v5 = -[REMDueDateDeltaAlert init](&v28, sel_init);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reminderID"));
  v7 = (REMObjectID *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v8 = (REMObjectID *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDateDelta"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (REMDueDateDeltaInterval *)v10;
  if (!v6)
  {
    +[REMLogStore read](REMLogStore, "read");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaAlert initWithCoder:].cold.1();
    v26 = "identifier";
    goto LABEL_24;
  }
  if (!v7)
  {
    +[REMLogStore read](REMLogStore, "read");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaAlert initWithCoder:].cold.2();
    v26 = "reminderID";
    goto LABEL_24;
  }
  if (!v8)
  {
    +[REMLogStore read](REMLogStore, "read");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaAlert initWithCoder:].cold.3();
    v26 = "accountID";
    goto LABEL_24;
  }
  if (!v9)
  {
    +[REMLogStore read](REMLogStore, "read");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaAlert initWithCoder:].cold.4();
    v26 = "creationDate";
    goto LABEL_24;
  }
  if (!v10)
  {
    +[REMLogStore read](REMLogStore, "read");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[REMDueDateDeltaAlert initWithCoder:].cold.5();
    v26 = "dueDateDelta";
LABEL_24:

    NSLog(CFSTR("'%s' is unexpectedly nil"), v26);
    v24 = 0;
    goto LABEL_25;
  }
  identifier = v5->_identifier;
  v5->_identifier = v6;
  v13 = v6;

  reminderID = v5->_reminderID;
  v5->_reminderID = v7;
  v15 = v7;

  accountID = v5->_accountID;
  v5->_accountID = v8;
  v17 = v8;

  creationDate = v5->_creationDate;
  v5->_creationDate = v9;
  v19 = v9;

  dueDateDelta = v5->_dueDateDelta;
  v5->_dueDateDelta = v11;
  v21 = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acknowledgedDate"));
  v22 = objc_claimAutoreleasedReturnValue();
  acknowledgedDate = v5->_acknowledgedDate;
  v5->_acknowledgedDate = (NSDate *)v22;

  v5->_minimumSupportedAppVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumSupportedAppVersion"));
LABEL_8:
  v24 = v5;
LABEL_25:

  return v24;
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
  -[REMDueDateDeltaAlert identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[REMDueDateDeltaAlert reminderID](self, "reminderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("reminderID"));

  -[REMDueDateDeltaAlert accountID](self, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("accountID"));

  -[REMDueDateDeltaAlert dueDateDelta](self, "dueDateDelta");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("dueDateDelta"));

  -[REMDueDateDeltaAlert creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("creationDate"));

  -[REMDueDateDeltaAlert acknowledgedDate](self, "acknowledgedDate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("acknowledgedDate"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[REMDueDateDeltaAlert isContentEqual:](self, "isContentEqual:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isContentEqual:(id)a3
{
  REMDueDateDeltaAlert *v4;
  REMDueDateDeltaAlert *v5;
  REMDueDateDeltaAlert *v6;
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
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = (REMDueDateDeltaAlert *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMDueDateDeltaAlert identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMDueDateDeltaAlert identifier](v6, "identifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMDueDateDeltaAlert identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMDueDateDeltaAlert identifier](v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_22;
      }
      -[REMDueDateDeltaAlert reminderID](self, "reminderID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMDueDateDeltaAlert reminderID](v6, "reminderID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMDueDateDeltaAlert reminderID](self, "reminderID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMDueDateDeltaAlert reminderID](v6, "reminderID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_22;
      }
      -[REMDueDateDeltaAlert accountID](self, "accountID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMDueDateDeltaAlert accountID](v6, "accountID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMDueDateDeltaAlert accountID](self, "accountID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMDueDateDeltaAlert accountID](v6, "accountID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_22;
      }
      -[REMDueDateDeltaAlert dueDateDelta](self, "dueDateDelta");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMDueDateDeltaAlert dueDateDelta](v6, "dueDateDelta");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[REMDueDateDeltaAlert dueDateDelta](self, "dueDateDelta");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMDueDateDeltaAlert dueDateDelta](v6, "dueDateDelta");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_22;
      }
      -[REMDueDateDeltaAlert creationDate](self, "creationDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMDueDateDeltaAlert creationDate](v6, "creationDate");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[REMDueDateDeltaAlert creationDate](self, "creationDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMDueDateDeltaAlert creationDate](v6, "creationDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_22;
      }
      -[REMDueDateDeltaAlert acknowledgedDate](self, "acknowledgedDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMDueDateDeltaAlert acknowledgedDate](v6, "acknowledgedDate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v39 == (void *)v40)
      {
        v13 = 1;
        v41 = v39;
      }
      else
      {
        v41 = (void *)v40;
        -[REMDueDateDeltaAlert acknowledgedDate](self, "acknowledgedDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMDueDateDeltaAlert acknowledgedDate](v6, "acknowledgedDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v42, "isEqual:", v43);

      }
      goto LABEL_23;
    }
LABEL_22:
    v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v13 = 1;
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMDueDateDeltaAlert identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMDueDateDeltaAlert identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDueDateDeltaAlert reminderID](self, "reminderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDueDateDeltaAlert dueDateDelta](self, "dueDateDelta");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDueDateDeltaAlert acknowledgedDate](self, "acknowledgedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifier: %@, reminderID: %@, delta: %@, ackdate: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (REMObjectID)remObjectID
{
  void *v2;
  void *v3;
  void *v4;

  -[REMDueDateDeltaAlert identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMDueDateDeltaAlert cdEntityName](REMDueDateDeltaAlert, "cdEntityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMObjectID *)v4;
}

+ (id)newObjectID
{
  NSObject *v3;
  void *v4;
  void *v5;

  +[REMLogStore read](REMLogStore, "read");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    +[REMDueDateDeltaAlert newObjectID].cold.1(v3);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDDueDateDeltaAlert");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMDueDateDeltaInterval)dueDateDelta
{
  return self->_dueDateDelta;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)acknowledgedDate
{
  return self->_acknowledgedDate;
}

- (int64_t)minimumSupportedAppVersion
{
  return self->_minimumSupportedAppVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_dueDateDelta, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithCoder:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.4()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.5()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

+ (void)newObjectID
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
}

@end
