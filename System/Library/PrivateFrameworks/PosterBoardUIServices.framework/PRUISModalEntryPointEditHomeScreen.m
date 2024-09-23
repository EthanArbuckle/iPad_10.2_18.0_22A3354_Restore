@implementation PRUISModalEntryPointEditHomeScreen

- (PRUISModalEntryPointEditHomeScreen)initWithServiceConfiguration:(id)a3
{
  id v4;
  PRUISModalEntryPointEditHomeScreen *v5;
  uint64_t v6;
  PFServerPosterPath *serverPosterPath;
  void *v9;
  objc_super v10;

  v4 = a3;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointEditHomeScreen initWithServiceConfiguration:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24460AF3CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointEditHomeScreen initWithServiceConfiguration:].cold.1();
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)PRUISModalEntryPointEditHomeScreen;
  v5 = -[PRUISModalEntryPointEditHomeScreen init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_path");
    v6 = objc_claimAutoreleasedReturnValue();
    serverPosterPath = v5->_serverPosterPath;
    v5->_serverPosterPath = (PFServerPosterPath *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  PFServerPosterPath *serverPosterPath;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  serverPosterPath = self->_serverPosterPath;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__PRUISModalEntryPointEditHomeScreen_isEqual___block_invoke;
  v10[3] = &unk_251535D18;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", serverPosterPath, v10);
  LOBYTE(serverPosterPath) = objc_msgSend(v5, "isEqual");

  return (char)serverPosterPath;
}

uint64_t __46__PRUISModalEntryPointEditHomeScreen_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serverPosterPath");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_serverPosterPath);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74C28]), "_initWithPath:", self->_serverPosterPath);
  v6 = (void *)objc_msgSend(v4, "initWithServiceConfiguration:", v5);

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointEditHomeScreen)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PRUISModalEntryPointEditHomeScreen *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverPosterPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74C28]), "_initWithPath:", v5);
    self = -[PRUISModalEntryPointEditHomeScreen initWithServiceConfiguration:](self, "initWithServiceConfiguration:", v6);

    v7 = self;
  }
  else
  {
    PRUISLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointEditing initWithBSXPCCoder:].cold.2();

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  PFServerPosterPath *serverPosterPath;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;

  v4 = a3;
  serverPosterPath = self->_serverPosterPath;
  v9 = 0;
  -[PFServerPosterPath extendContentsReadAccessToAuditToken:error:](serverPosterPath, "extendContentsReadAccessToAuditToken:error:", 0, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (!v6)
  {
    PRUISLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointEditHomeScreen encodeWithBSXPCCoder:].cold.1();

  }
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_serverPosterPath"));

}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return CFSTR("EditHomeScreen");
}

- (PFServerPosterPath)serverPosterPath
{
  return self->_serverPosterPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverPosterPath, 0);
}

- (void)initWithServiceConfiguration:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2445ED000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)encodeWithBSXPCCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_2445ED000, v0, v1, "PRUISModalEntryPointEditing: could not obtain poster path with sandbox extension: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
