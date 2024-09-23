@implementation SBSystemActionElementPreviewingCoordinator

- (uint64_t)initWithElement:(_QWORD *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t result;
  void *v7;
  objc_super v8;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_5;
  if (v3)
  {
    v8.receiver = a1;
    v8.super_class = (Class)SBSystemActionElementPreviewingCoordinator;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeWeak((id *)v5 + 5, v4);
      a1[4] = 0;
    }
LABEL_5:

    return (uint64_t)a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("element != ((void *)0)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBSystemActionElementPreviewingCoordinator initWithElement:].cold.1(sel_initWithElement_, (uint64_t)a1, (uint64_t)v7);
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)elementInvalidatedProperties
{
  if (a1)
    -[SBSystemActionElementPreviewingCoordinator _updateAnimationAndPriorityAssertions](a1);
}

- (void)_updateAnimationAndPriorityAssertions
{
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBStringFromSBSADynamicPersistentAnimation(*(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "(%@) Dropping expansion animation assertion with style %@", (uint8_t *)&v5, 0x16u);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_element);
  objc_storeStrong((id *)&self->_expansionAssertion, 0);
  objc_storeStrong((id *)&self->_alertingAssertion, 0);
  objc_storeStrong((id *)&self->_urgencyAssertion, 0);
}

- (void)initWithElement:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSystemActionElementPreviewingCoordinator.m");
  v16 = 1024;
  v17 = 30;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
