@implementation PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration

- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithActiveConfiguration:(id)a3
{
  return -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:](self, "initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:", a3, 0, 0);
}

- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithActiveConfiguration:(id)a3 transitionOverlayRenderId:(unint64_t)a4 transitionOverlayContextId:(unsigned int)a5
{
  id v8;
  PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration *v9;
  uint64_t v10;
  PFServerPosterPath *serverPosterPath;
  void *v13;
  objc_super v14;

  v8 = a3;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24460B460);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:].cold.1();
    goto LABEL_11;
  }

  v14.receiver = self;
  v14.super_class = (Class)PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration;
  v9 = -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "_path");
    v10 = objc_claimAutoreleasedReturnValue();
    serverPosterPath = v9->_serverPosterPath;
    v9->_serverPosterPath = (PFServerPosterPath *)v10;

    v9->_transitionOverlayRenderId = a4;
    v9->_transitionOverlayContextId = a5;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PFServerPosterPath *serverPosterPath;
  uint64_t v8;
  id v9;
  id v10;
  unint64_t transitionOverlayRenderId;
  id v12;
  id v13;
  uint64_t transitionOverlayContextId;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  serverPosterPath = self->_serverPosterPath;
  v8 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke;
  v22[3] = &unk_251535D18;
  v9 = v6;
  v23 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", serverPosterPath, v22);
  transitionOverlayRenderId = self->_transitionOverlayRenderId;
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke_2;
  v20[3] = &unk_251535C78;
  v12 = v9;
  v21 = v12;
  v13 = (id)objc_msgSend(v5, "appendInt64:counterpart:", transitionOverlayRenderId, v20);
  transitionOverlayContextId = self->_transitionOverlayContextId;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke_3;
  v18[3] = &unk_251535C78;
  v19 = v12;
  v15 = v12;
  v16 = (id)objc_msgSend(v5, "appendInt64:counterpart:", transitionOverlayContextId, v18);
  LOBYTE(transitionOverlayContextId) = objc_msgSend(v5, "isEqual");

  return transitionOverlayContextId;
}

uint64_t __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serverPosterPath");
}

uint64_t __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionOverlayRenderId");
}

uint64_t __77__PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionOverlayContextId");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_serverPosterPath);
  v5 = (id)objc_msgSend(v3, "appendInt64:", self->_transitionOverlayRenderId);
  v6 = (id)objc_msgSend(v3, "appendInt64:", self->_transitionOverlayContextId);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74C28]), "_initWithPath:", self->_serverPosterPath);
  v6 = (void *)objc_msgSend(v4, "initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:", v5, self->_transitionOverlayRenderId, self->_transitionOverlayContextId);

  return v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverPosterPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_transitionOverlayRenderId"));
    v7 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_transitionOverlayContextId"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74C28]), "_initWithPath:", v5);
    self = -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:](self, "initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:", v8, v6, v7);

    v9 = self;
  }
  else
  {
    PRUISLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration initWithBSXPCCoder:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  PFServerPosterPath *serverPosterPath;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;

  serverPosterPath = self->_serverPosterPath;
  v9 = 0;
  v5 = a3;
  -[PFServerPosterPath extendContentsReadAccessToAuditToken:error:](serverPosterPath, "extendContentsReadAccessToAuditToken:error:", 0, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (!v6)
  {
    PRUISLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration encodeWithBSXPCCoder:].cold.1();

  }
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_serverPosterPath"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_transitionOverlayRenderId, CFSTR("_transitionOverlayRenderId"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_transitionOverlayContextId, CFSTR("_transitionOverlayContextId"));

}

- (unint64_t)transitionOverlayRenderId
{
  return self->_transitionOverlayRenderId;
}

- (unsigned)transitionOverlayContextId
{
  return self->_transitionOverlayContextId;
}

- (PFServerPosterPath)serverPosterPath
{
  return self->_serverPosterPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverPosterPath, 0);
}

- (void)initWithActiveConfiguration:transitionOverlayRenderId:transitionOverlayContextId:.cold.1()
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

- (void)initWithBSXPCCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_2(&dword_2445ED000, v0, v1, "PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration: could not decode poster path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_2();
}

- (void)encodeWithBSXPCCoder:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  _os_log_fault_impl(&dword_2445ED000, v0, OS_LOG_TYPE_FAULT, "PRUISModalEntryPointAmbientEditingSwitcherWithActiveConfiguration: could not obtain poster path with sandbox extension: %@", v1, 0xCu);
  OUTLINED_FUNCTION_8();
}

@end
