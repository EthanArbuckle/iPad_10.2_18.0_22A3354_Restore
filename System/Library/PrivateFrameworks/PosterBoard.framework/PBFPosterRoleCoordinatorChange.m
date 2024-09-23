@implementation PBFPosterRoleCoordinatorChange

+ (id)addPosterToRole:(id)a3 incomingPoster:(id)a4
{
  id v5;
  id v6;
  PBFPosterRoleCoordinatorChange *v7;
  void *v8;
  PBFPosterRoleCoordinatorChange *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v7, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAddPoster"), v6, v8);
  return v9;
}

+ (id)updatePosterWithinRole:(id)a3 incomingPoster:(id)a4
{
  id v5;
  id v6;
  PBFPosterRoleCoordinatorChange *v7;
  void *v8;
  PBFPosterRoleCoordinatorChange *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v7, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdatePoster"), v6, v8);
  return v9;
}

+ (id)removePosterFromRole:(id)a3 matchingUUID:(id)a4
{
  id v5;
  id v6;
  PBFPosterRoleCoordinatorChange *v7;
  void *v8;
  PBFPosterRoleCoordinatorChange *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v7, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRemovePoster"), v6, v8);
  return v9;
}

+ (id)reorderPostersForRole:(id)a3 sortedPosterUUIDs:(id)a4
{
  id v5;
  id v6;
  PBFPosterRoleCoordinatorChange *v7;
  void *v8;
  PBFPosterRoleCoordinatorChange *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyOrderedUUIDs");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v7, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeReorderPosters"), v6, v8);
  return v9;
}

+ (id)duplicatePosterWithinRole:(id)a3 matchingUUID:(id)a4 toUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  PBFPosterRoleCoordinatorChange *v10;
  void *v11;
  PBFPosterRoleCoordinatorChange *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [PBFPosterRoleCoordinatorChange alloc];
  v14[0] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID");
  v14[1] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyOutPosterUUID");
  v15[0] = v8;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v10, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeDuplicatePoster"), v9, v11);
  return v12;
}

+ (id)assignAttributeToPosterWithinRole:(id)a3 matchingUUID:(id)a4 attribute:(id)a5
{
  id v7;
  id v8;
  id v9;
  PBFPosterRoleCoordinatorChange *v10;
  void *v11;
  void *v12;
  PBFPosterRoleCoordinatorChange *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [PBFPosterRoleCoordinatorChange alloc];
  v16[0] = v8;
  v15[0] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID");
  v15[1] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType");
  objc_msgSend(v7, "attributeType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttribute");
  v16[1] = v11;
  v16[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v10, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAssignAttribute"), v9, v12);
  return v13;
}

+ (id)removeAttributeFromPosterWithinRole:(id)a3 matchingUUID:(id)a4 attributeType:(id)a5
{
  id v7;
  id v8;
  id v9;
  PBFPosterRoleCoordinatorChange *v10;
  void *v11;
  PBFPosterRoleCoordinatorChange *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [PBFPosterRoleCoordinatorChange alloc];
  v14[0] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID");
  v14[1] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType");
  v15[0] = v8;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v10, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRemoveAttribute"), v9, v11);
  return v12;
}

+ (id)selectPosterForRole:(id)a3 matchingUUID:(id)a4
{
  id v5;
  id v6;
  PBFPosterRoleCoordinatorChange *v7;
  void *v8;
  PBFPosterRoleCoordinatorChange *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v7, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeSelectPoster"), v6, v8);
  return v9;
}

+ (id)updateConfiguredProperties:(id)a3 forPosterWithinRole:(id)a4 matchingUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  PBFPosterRoleCoordinatorChange *v10;
  void *v11;
  PBFPosterRoleCoordinatorChange *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [PBFPosterRoleCoordinatorChange alloc];
  v14[0] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID");
  v14[1] = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyConfiguredProperties");
  v15[0] = v7;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v10, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties"), v8, v11);
  return v12;
}

+ (id)refreshRoleCoordinator:(id)a3
{
  id v3;
  PBFPosterRoleCoordinatorChange *v4;
  PBFPosterRoleCoordinatorChange *v5;

  v3 = a3;
  v4 = [PBFPosterRoleCoordinatorChange alloc];
  v5 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v4, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRefreshRoleCoordinator"), v3, MEMORY[0x1E0C9AA70]);

  return v5;
}

+ (id)resetRole:(id)a3
{
  id v3;
  PBFPosterRoleCoordinatorChange *v4;
  PBFPosterRoleCoordinatorChange *v5;

  v3 = a3;
  v4 = [PBFPosterRoleCoordinatorChange alloc];
  v5 = -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:](v4, "initWithType:role:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeTypeResetRoleCoordinator"), v3, MEMORY[0x1E0C9AA70]);

  return v5;
}

+ (id)distillArrayOfChangesIntoChangesOrderedByPosterRoleEntropy:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (!v9
          || (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "role", (_QWORD)v19),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v9, "isEqual:", v13),
              v13,
              (v14 & 1) == 0))
        {
          objc_msgSend(v12, "role", (_QWORD)v19);
          v15 = objc_claimAutoreleasedReturnValue();

          v16 = objc_opt_new();
          objc_msgSend(v4, "addObject:", v16);
          v8 = (void *)v16;
          v9 = (void *)v15;
        }
        objc_msgSend(v8, "addObject:", v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

- (PBFPosterRoleCoordinatorChange)initWithType:(id)a3 role:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  PBFPosterRoleCoordinatorChange *v15;
  PBFPosterRoleCoordinatorChange *v16;
  uint64_t v17;
  NSDictionary *userInfo;
  uint64_t v19;
  NSUUID *uniqueIdentifier;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  NSClassFromString(CFSTR("NSString"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA371D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA3723CLL);
  }

  v13 = v10;
  NSClassFromString(CFSTR("NSString"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:].cold.2();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA372A0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:].cold.2();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA37304);
  }

  v14 = v11;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:].cold.3();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA37368);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:].cold.3();
    goto LABEL_27;
  }

  v27.receiver = self;
  v27.super_class = (Class)PBFPosterRoleCoordinatorChange;
  v15 = -[PBFPosterRoleCoordinatorChange init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_changeType, a3);
    objc_storeStrong((id *)&v16->_role, a4);
    v17 = objc_msgSend(v14, "copy");
    userInfo = v16->_userInfo;
    v16->_userInfo = (NSDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSUUID *)v19;

  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_changeType, "hash");
  v4 = -[NSString hash](self->_role, "hash") ^ v3;
  v5 = -[NSDictionary hash](self->_userInfo, "hash");
  v6 = 0xBF58476D1CE4E5B9 * (v4 ^ v5 ^ ((v4 ^ v5) >> 30));
  return (0x94D049BB133111EBLL * (v6 ^ (v6 >> 27))) ^ ((0x94D049BB133111EBLL * (v6 ^ (v6 >> 27))) >> 31);
}

- (BOOL)isEqualToChange:(id)a3
{
  PBFPosterRoleCoordinatorChange *v4;
  char v5;

  v4 = (PBFPosterRoleCoordinatorChange *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (BSEqualStrings() && BSEqualStrings())
  {
    v5 = BSEqualDictionaries();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PBFPosterRoleCoordinatorChange *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (PBFPosterRoleCoordinatorChange *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0 && -[PBFPosterRoleCoordinatorChange isEqualToChange:](self, "isEqualToChange:", v4);
  }

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const __CFString *changeType;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAddPoster"))|| -[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdatePoster")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration"), 0, v30, v31);
LABEL_8:
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = (void *)v6;
    goto LABEL_10;
  }
  if (-[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRemovePoster"))|| -[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeSelectPoster")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v29 = 0;
LABEL_7:
    objc_msgSend(v5, "setWithObjects:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"), v29, v30, v31);
    goto LABEL_8;
  }
  if (-[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeReorderPosters")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyOrderedUUIDs"), 0, v30, v31);
    goto LABEL_8;
  }
  if (-[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeDuplicatePoster")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v28 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyOutPosterUUID");
LABEL_44:
    v29 = v28;
    v30 = 0;
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAssignAttribute")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v30 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttribute");
    v31 = 0;
    v29 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType");
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRemoveAttribute")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v28 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType");
    goto LABEL_44;
  }
  if (-[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v28 = CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyConfiguredProperties");
    goto LABEL_44;
  }
  if (-[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRefreshRoleCoordinator"))|| -[NSString isEqualToString:](self->_changeType, "isEqualToString:", CFSTR("PBFPosterRoleCoordinatorChangeTypeResetRoleCoordinator")))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = 0;
LABEL_10:
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[NSDictionary allKeys](self->_userInfo, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = (void *)MEMORY[0x1E0C99E08];
  v32[0] = CFSTR("expectedUserInfoKeys");
  objc_msgSend(v7, "allObjects");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = MEMORY[0x1E0C9AA60];
  if (v15)
    v18 = v15;
  else
    v18 = MEMORY[0x1E0C9AA60];
  v33[0] = v18;
  v32[1] = CFSTR("receivedUserInfoKeys");
  objc_msgSend(v13, "allObjects");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = v19;
  else
    v21 = v17;
  v32[2] = CFSTR("changeType");
  changeType = (const __CFString *)self->_changeType;
  if (!changeType)
    changeType = CFSTR("PBFPosterRoleCoordinatorChangeTypeUnknown");
  v33[1] = v21;
  v33[2] = changeType;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSDictionary count](self->_userInfo, "count"))
  {
    if (!a3)
      goto LABEL_32;
    v26 = -3343;
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PBFPosterRoleCoordinatorChangeErrorDomain"), v26, v24);
    v25 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  if (!v7)
  {
    if (!a3)
      goto LABEL_32;
    v26 = -3342;
    goto LABEL_31;
  }
  if ((objc_msgSend(v13, "isSubsetOfSet:", v7) & 1) == 0)
  {
    if (a3)
    {
      v26 = -3341;
      goto LABEL_31;
    }
LABEL_32:
    v25 = 0;
    goto LABEL_33;
  }
  v25 = 1;
LABEL_33:

  return v25;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_changeType, CFSTR("changeType"));
  objc_msgSend(v3, "appendString:withName:", self->_role, CFSTR("role"));
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)changeType
{
  return self->_changeType;
}

- (NSString)role
{
  return self->_role;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_changeType, 0);
}

- (void)initWithType:role:userInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithType:role:userInfo:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithType:role:userInfo:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
