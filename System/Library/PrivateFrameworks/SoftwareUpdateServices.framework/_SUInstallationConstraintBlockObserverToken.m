@implementation _SUInstallationConstraintBlockObserverToken

- (_SUInstallationConstraintBlockObserverToken)initWithObserver:(id)a3
{
  id v4;
  _SUInstallationConstraintBlockObserverToken *v5;
  _SUInstallationConstraintBlockObserverToken *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SUInstallationConstraintBlockObserverToken;
  v5 = -[_SUInstallationConstraintBlockObserverToken init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    SULogInstallConstraints();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_SUInstallationConstraintBlockObserverToken initWithObserver:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v6;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1(&dword_2128D9000, a2, a3, "[Token] Dealloc: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)invalidate
{
  OUTLINED_FUNCTION_1(&dword_2128D9000, a2, a3, "[Token] Invalidate: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

- (void)initWithObserver:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2128D9000, a2, a3, "[Token] Create: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
