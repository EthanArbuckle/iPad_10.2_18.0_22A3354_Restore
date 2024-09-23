@implementation REMSharedToMeReminderPlaceholder

+ (BOOL)isChangeTrackableModel
{
  return 1;
}

+ (BOOL)rem_DA_supportsFetching
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(a1, "performSelector:", sel_isChangeTrackableFetchableModel) != 0;
}

+ (BOOL)rem_DA_supportsConcealedObjects
{
  return 0;
}

+ (NSArray)rem_DA_propertiesAffectingIsConcealed
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to check properties affecting isConcealed for REMSharedToMeReminderPlaceholder."));
  return 0;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to fetch by object ID for REMSharedToMeReminderPlaceholder."));
  return 0;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to fetch by object IDs for REMSharedToMeReminderPlaceholder."));
  return 0;
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_359;
}

uint64_t __115__REMSharedToMeReminderPlaceholder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke()
{
  return 0;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to call +rem_DA_deletedKeyFromConcealedModelObjectBlock for REMSharedToMeReminderPlaceholder."));
  return 0;
}

- (REMSharedToMeReminderPlaceholder)initWithObjectID:(id)a3 accountID:(id)a4
{
  id v7;
  id v8;
  REMSharedToMeReminderPlaceholder *v9;
  REMSharedToMeReminderPlaceholder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMSharedToMeReminderPlaceholder;
  v9 = -[REMSharedToMeReminderPlaceholder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectID, a3);
    objc_storeStrong((id *)&v10->_accountID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSharedToMeReminderPlaceholder)initWithCoder:(id)a3
{
  id v4;
  REMSharedToMeReminderPlaceholder *v5;
  uint64_t v6;
  REMObjectID *objectID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSharedToMeReminderPlaceholder;
  v5 = -[REMSharedToMeReminderPlaceholder init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectID = v5->_objectID;
    v5->_objectID = (REMObjectID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMSharedToMeReminderPlaceholder objectID](self, "objectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

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
    v7 = -[REMSharedToMeReminderPlaceholder isEqualToSharedToMeReminderPlaceholder:](self, "isEqualToSharedToMeReminderPlaceholder:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToSharedToMeReminderPlaceholder:(id)a3
{
  REMSharedToMeReminderPlaceholder *v4;
  REMSharedToMeReminderPlaceholder *v5;
  REMSharedToMeReminderPlaceholder *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (REMSharedToMeReminderPlaceholder *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMSharedToMeReminderPlaceholder objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharedToMeReminderPlaceholder objectID](v6, "objectID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {
        v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        -[REMSharedToMeReminderPlaceholder objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMSharedToMeReminderPlaceholder objectID](v6, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMSharedToMeReminderPlaceholder objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMSharedToMeReminderPlaceholder objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)objectIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[REMSharedToMeReminderPlaceholder objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  return (NSString *)CFSTR("REMCDSharedToMeReminderPlaceholder");
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
