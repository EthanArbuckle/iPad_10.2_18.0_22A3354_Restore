@implementation STLocalOrganization

+ (id)fetchOrCreateLocalOrganizationWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  STLocalOrganization *v11;
  STLocalOrganizationSettings *v12;

  v6 = a3;
  objc_msgSend(a1, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      +[STLog persistence](STLog, "persistence");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        +[STLocalOrganization fetchOrCreateLocalOrganizationWithContext:error:].cold.1();

    }
    objc_msgSend(v9, "firstObject");
    v11 = (STLocalOrganization *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      v11 = -[STLocalOrganization initWithContext:]([STLocalOrganization alloc], "initWithContext:", v6);
    -[STLocalOrganization settings](v11, "settings");
    v12 = (STLocalOrganizationSettings *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = -[STLocalOrganizationSettings initWithContext:]([STLocalOrganizationSettings alloc], "initWithContext:", v6);
      -[STLocalOrganizationSettings setOrganization:](v12, "setOrganization:", v11);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STLocalOrganization;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("RMLocalOrganization");
}

+ (void)fetchOrCreateLocalOrganizationWithContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "local organization should be unique in the database: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
