@implementation PRSPosterRoleCollectionObserver

- (PRSPosterRoleCollectionObserver)initWithRole:(id)a3 needsSandboxExtensions:(BOOL)a4
{
  id v6;
  PRSPosterRoleCollectionObserver *v7;
  uint64_t v8;
  NSString *role;
  void *v11;
  objc_super v12;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterRoleCollectionObserver initWithRole:needsSandboxExtensions:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49B0A54);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterRoleCollectionObserver initWithRole:needsSandboxExtensions:].cold.1();
    goto LABEL_11;
  }

  v12.receiver = self;
  v12.super_class = (Class)PRSPosterRoleCollectionObserver;
  v7 = -[PRSPosterRoleCollectionObserver init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    role = v7->_role;
    v7->_role = (NSString *)v8;

    v7->_needsSandboxExtensions = a4;
  }

  return v7;
}

- (PRSPosterRoleCollectionObserver)initWithRole:(id)a3
{
  return -[PRSPosterRoleCollectionObserver initWithRole:needsSandboxExtensions:](self, "initWithRole:needsSandboxExtensions:", a3, 0);
}

- (void)issueUpdatedState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PRSPosterRoleCollectionObserver *v8;
  NSOrderedSet *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E40];
  v12 = v4;
  objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = self;
  objc_sync_enter(v8);
  if ((BSEqualObjects() & 1) == 0)
  {
    v9 = v8->_posterCollection;
    objc_storeStrong((id *)&v8->_posterCollection, v7);
    -[PRSPosterRoleCollectionObserver handler](v8, "handler");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      (*(void (**)(uint64_t, PRSPosterRoleCollectionObserver *, NSOrderedSet *, void *))(v10 + 16))(v10, v8, v9, v7);

  }
  objc_sync_exit(v8);

}

id __53__PRSPosterRoleCollectionObserver_issueUpdatedState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v2);

  return v3;
}

- (NSString)role
{
  return self->_role;
}

- (BOOL)needsSandboxExtensions
{
  return self->_needsSandboxExtensions;
}

- (id)handler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSOrderedSet)posterCollection
{
  return self->_posterCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterCollection, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

- (void)initWithRole:needsSandboxExtensions:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
