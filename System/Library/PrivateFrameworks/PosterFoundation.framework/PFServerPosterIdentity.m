@implementation PFServerPosterIdentity

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (PFServerPosterIdentity)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PFServerPosterIdentity *result;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  PFServerPosterIdentity *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not allowed on %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("PFServerPosterIdentity.m");
    v21 = 1024;
    v22 = 87;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_24462A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (PFServerPosterIdentity *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithProvider:(uint64_t)a3 type:(void *)a4 role:(void *)a5 posterUUID:(uint64_t)a6 version:(uint64_t)a7 supplement:(void *)a8 descriptorIdentifier:
{
  if (result)
    return -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](result, a2, a3, a4, a5, a6, a7, a8, 0);
  return result;
}

- (id)_initWithProvider:(uint64_t)a3 type:(void *)a4 role:(void *)a5 posterUUID:(uint64_t)a6 version:(uint64_t)a7 supplement:(void *)a8 descriptorIdentifier:(char)a9 isIncomingConfiguration:
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  objc_super v36;

  v16 = a2;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  if (!a1)
    goto LABEL_13;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("provider"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:].cold.1();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244634A64);
  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("role"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:].cold.2();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244634AC8);
  }
  if ((unint64_t)(a3 - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFServerPosterTypeIsValid(type)"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:].cold.3();
    goto LABEL_22;
  }
  v36.receiver = a1;
  v36.super_class = (Class)PFServerPosterIdentity;
  a1 = objc_msgSendSuper2(&v36, sel_init);
  if (a1)
  {
    v20 = objc_msgSend(v16, "copy");
    v21 = (void *)*((_QWORD *)a1 + 2);
    *((_QWORD *)a1 + 2) = v20;

    *((_QWORD *)a1 + 3) = a3;
    v22 = objc_msgSend(v17, "copy");
    v23 = (void *)*((_QWORD *)a1 + 8);
    *((_QWORD *)a1 + 8) = v22;

    v24 = objc_msgSend(v18, "copy");
    v25 = (void *)*((_QWORD *)a1 + 4);
    *((_QWORD *)a1 + 4) = v24;

    *((_QWORD *)a1 + 5) = a6;
    *((_QWORD *)a1 + 6) = a7;
    v26 = objc_msgSend(v19, "copy");
    v27 = (void *)*((_QWORD *)a1 + 7);
    *((_QWORD *)a1 + 7) = v26;

    *((_BYTE *)a1 + 8) = a9;
    if (!__disableUniquing)
    {
      os_unfair_lock_lock(&__allIdentitiesLock);
      objc_msgSend((id)__allIdentities, "member:", a1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        os_unfair_lock_unlock(&__allIdentitiesLock);
        v29 = v28;

        a1 = v29;
      }
      else
      {
        v30 = (void *)__allIdentities;
        if (!__allIdentities)
        {
          objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)__allIdentities;
          __allIdentities = v31;

          v30 = (void *)__allIdentities;
        }
        objc_msgSend(v30, "addObject:", a1);
        os_unfair_lock_unlock(&__allIdentitiesLock);
      }

    }
  }
LABEL_13:

  return a1;
}

- (void)dealloc
{
  PFServerPosterIdentity *v3;
  PFServerPosterIdentity *v4;
  objc_super v6;

  os_unfair_lock_lock(&__allIdentitiesLock);
  objc_msgSend((id)__allIdentities, "member:", self);
  v3 = (PFServerPosterIdentity *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == self || v3 == 0)
    objc_msgSend((id)__allIdentities, "removeObject:", self);
  os_unfair_lock_unlock(&__allIdentitiesLock);

  v6.receiver = self;
  v6.super_class = (Class)PFServerPosterIdentity;
  -[PFServerPosterIdentity dealloc](&v6, sel_dealloc);
}

+ (id)staticDescriptorIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PFServerPosterIdentity *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v11;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244634D64);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244634DC8);
  }

  v16 = v12;
  NSClassFromString(CFSTR("NSString"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244634E2CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.2();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244634E90);
  }

  v17 = v14;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.3();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244634EF4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.3();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244634F58);
  }

  v18 = [PFServerPosterIdentity alloc];
  if (v18)
    v19 = -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](v18, v15, 2, v13, v17, a7, 0, v16, 0);
  else
    v19 = 0;

  return v19;
}

+ (id)descriptorIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PFServerPosterIdentity *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v11;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244635104);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244635168);
  }

  v16 = v12;
  NSClassFromString(CFSTR("NSString"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446351CCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.2();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244635230);
  }

  v17 = v14;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.3();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244635294);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:].cold.3();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446352F8);
  }

  v18 = [PFServerPosterIdentity alloc];
  if (v18)
    v19 = -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](v18, v15, 1, v13, v17, a7, 0, v16, 0);
  else
    v19 = 0;

  return v19;
}

+ (id)configurationIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7 supplement:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  PFServerPosterIdentity *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v13;
  NSClassFromString(CFSTR("NSString"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244635530);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244635594);
  }

  v18 = v14;
  if (v18)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.7();
      objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x244635788);
    }
  }

  v19 = v16;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.2();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446355F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463565CLL);
  }

  if ((PFPosterRoleIsValid(v15) & 1) != 0)
  {
    v20 = v15;
  }
  else
  {
    PFPosterDefaultRoleForBundleIdentifier(v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    PFLogPosterContents();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.5();

  }
  v22 = v20;
  NSClassFromString(CFSTR("NSString"));
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.3();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446356C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.3();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244635724);
  }

  v23 = [PFServerPosterIdentity alloc];
  if (v23)
    v24 = -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](v23, v17, 3, v22, v19, a7, a8, v18, 0);
  else
    v24 = 0;

  return v24;
}

+ (id)incomingConfigurationIdentityWithProvider:(id)a3 role:(id)a4 posterUUID:(id)a5 version:(unint64_t)a6 supplement:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v11;
  NSClassFromString(CFSTR("NSString"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446358FCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244635960);
  }

  v15 = v13;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2446359C4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterIdentity incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:].cold.2();
    goto LABEL_17;
  }

  v16 = -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:]([PFServerPosterIdentity alloc], v14, 3, v12, v15, a6, a7, 0, 1);
  return v16;
}

- (BOOL)isNewerVersionOfIdentity:(id)a3
{
  _QWORD *v4;
  unint64_t version;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  v7 = 0;
  if (-[PFServerPosterIdentity _isRootEqual:]((uint64_t)self, v4))
  {
    version = self->_version;
    v6 = v4[5];
    if (version > v6 || version == v6 && self->_supplement > v4[6])
      v7 = 1;
  }

  return v7;
}

- (uint64_t)_isRootEqual:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((_QWORD *)a1 == v3)
    {
      a1 = 1;
    }
    else
    {
      v5 = objc_opt_class();
      if (v5 == objc_opt_class()
        && (*(_QWORD *)(a1 + 24) == 3 || BSEqualStrings())
        && BSEqualStrings()
        && *(_QWORD *)(a1 + 24) == v4[3]
        && BSEqualObjects())
      {
        a1 = objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", v4[8]);
      }
      else
      {
        a1 = 0;
      }
    }
  }

  return a1;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSComparisonResult v6;
  int64_t type;
  int64_t v8;
  unint64_t version;
  unint64_t v10;
  unint64_t supplement;
  unint64_t v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  int64_t result;
  void *v17;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = -[NSString compare:](self->_role, "compare:", v4[8]);
    if (v6 == NSOrderedSame)
    {
      v6 = -[NSString compare:](self->_provider, "compare:", v5[2]);
      if (v6 == NSOrderedSame)
      {
        type = self->_type;
        v8 = v5[3];
        if (type == v8)
        {
          v6 = -[NSUUID compare:](self->_posterUUID, "compare:", v5[4]);
          if (v6 == NSOrderedSame)
          {
            version = self->_version;
            v10 = v5[5];
            if (version == v10)
            {
              supplement = self->_supplement;
              v12 = v5[6];
              v13 = supplement >= v12;
              v14 = supplement == v12;
              v15 = -1;
              if (v13)
                v15 = 1;
              if (v14)
                v6 = NSOrderedSame;
              else
                v6 = v15;
            }
            else if (version < v10)
            {
              v6 = NSOrderedAscending;
            }
            else
            {
              v6 = NSOrderedDescending;
            }
          }
        }
        else if (type < v8)
        {
          v6 = NSOrderedAscending;
        }
        else
        {
          v6 = NSOrderedDescending;
        }
      }
    }

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("other"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFServerPosterIdentity compare:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (void)_setDisableUniquing:(BOOL)a3
{
  __disableUniquing = a3;
}

+ (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x249514230](a1, a2);
  os_unfair_lock_lock(&__allIdentitiesLock);
  objc_msgSend((id)__allIdentities, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&__allIdentitiesLock);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("allIdentities = %llu {"), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v5, "appendString:", CFSTR("\n\t"));
        objc_msgSend(v11, "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\n}"));
  objc_autoreleasePoolPop(v2);
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *provider;
  id v5;

  provider = self->_provider;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", provider, CFSTR("p"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("t"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_posterUUID, CFSTR("u"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_version, CFSTR("v"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_supplement, CFSTR("s"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptorIdentifier, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_role, CFSTR("r"));

}

- (PFServerPosterIdentity)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("p"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("t"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("u"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("v"));
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("s"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((PFPosterRoleIsValid(v11) & 1) != 0)
  {
    v12 = v11;
    if (!v5)
      goto LABEL_10;
    goto LABEL_7;
  }
  PFPosterDefaultRoleForBundleIdentifier(v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PFLogPosterContents();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[PFServerPosterIdentity initWithBSXPCCoder:].cold.1();

  if (v5)
  {
LABEL_7:
    if ((unint64_t)(v6 - 1) <= 2 && v7)
      PFPosterRoleIsValid(v12);
  }
LABEL_10:
  if (self)
    self = (PFServerPosterIdentity *)-[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](self, v5, v6, v12, v7, v8, v9, v10, 0);

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *provider;
  id v5;

  provider = self->_provider;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", provider, CFSTR("p"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("t"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_posterUUID, CFSTR("u"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_version, CFSTR("v"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_supplement, CFSTR("s"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptorIdentifier, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_role, CFSTR("r"));

}

- (PFServerPosterIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("t"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("u"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("v"));
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("s"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((PFPosterRoleIsValid(v11) & 1) != 0)
  {
    v12 = v11;
    if (!v5)
      goto LABEL_8;
LABEL_7:
    PFPosterRoleIsValid(v12);
    goto LABEL_8;
  }
  PFPosterDefaultRoleForBundleIdentifier(v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PFLogPosterContents();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[PFServerPosterIdentity initWithCoder:].cold.1();

  if (v5)
    goto LABEL_7;
LABEL_8:
  if (self)
    self = (PFServerPosterIdentity *)-[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](self, v5, v6, v12, v7, v8, v9, v10, 0);

  return self;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t supplement;
  unint64_t v6;

  v3 = -[NSString hash](self->_provider, "hash");
  v4 = -[NSUUID hash](self->_posterUUID, "hash") ^ v3;
  supplement = self->_supplement;
  v6 = 0xBF58476D1CE4E5B9 * (v4 ^ self->_version ^ ((v4 ^ self->_version) >> 30));
  return -[NSString hash](self->_role, "hash") ^ supplement ^ ((0x94D049BB133111EBLL * (v6 ^ (v6 >> 27))) >> 31) ^ (0x94D049BB133111EBLL * (v6 ^ (v6 >> 27)));
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = -[PFServerPosterIdentity _isRootEqual:]((uint64_t)self, v4)
    && self->_version == v4[5]
    && self->_supplement == v4[6]
    && -[NSString isEqualToString:](self->_role, "isEqualToString:", v4[8]);

  return v5;
}

- (NSString)description
{
  NSString *descriptorIdentifier;
  void *v4;
  NSString *provider;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  descriptorIdentifier = self->_descriptorIdentifier;
  v4 = (void *)MEMORY[0x24BDD17C8];
  provider = self->_provider;
  NSStringFromPFServerPosterType(self->_type);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (descriptorIdentifier)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@:%@(%@)/%@/%llu-%llu"), provider, v6, self->_descriptorIdentifier, self->_posterUUID, self->_role, self->_version, self->_supplement);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@:%@/%@/%llu-%llu"), provider, v6, self->_posterUUID, self->_role, self->_version, self->_supplement, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)stablePersistenceIdentifier
{
  NSString *descriptorIdentifier;
  void *v4;
  NSString *provider;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  descriptorIdentifier = self->_descriptorIdentifier;
  v4 = (void *)MEMORY[0x24BDD17C8];
  provider = self->_provider;
  NSStringFromPFServerPosterType(self->_type);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (descriptorIdentifier)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@_%@(%@)_%@_%llu-%llu"), provider, v6, self->_descriptorIdentifier, self->_posterUUID, self->_role, self->_version, self->_supplement);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@_%@_%@_%llu-%llu"), provider, v6, self->_posterUUID, self->_role, self->_version, self->_supplement, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFServerPosterIdentity description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)provider
{
  return self->_provider;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)posterUUID
{
  return self->_posterUUID;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)supplement
{
  return self->_supplement;
}

- (BOOL)isIncomingConfiguration
{
  return self->_isIncomingConfiguration;
}

- (NSString)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_posterUUID, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)_initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:.cold.2()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:.cold.3()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.2()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.3()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)descriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)descriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.2()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)descriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.3()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.2()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.3()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_1(&dword_24462A000, v0, v1, "[Invalid Role][%{public}s] role was invalid, recovered: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_0();
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.7()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:.cold.2()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)compare:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithBSXPCCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_1(&dword_24462A000, v0, v1, "[Invalid Role][%{public}s] role was invalid, recovered: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_0();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_1(&dword_24462A000, v0, v1, "[Invalid Role][%{public}s] role was invalid, recovered: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_9_0();
}

@end
