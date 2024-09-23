@implementation TPSEventsProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TPSEventsProviderDelegate)delegate
{
  return (TPSEventsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)queryEvents:(id)a3
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[TPSLogger default](TPSLogger, "default", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "queryEvents not supported for %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)registerEventsForCallback:(id)a3
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[TPSLogger default](TPSLogger, "default", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "registerEventsForCallback not supported for %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)registerEventsForWakingCallback:(id)a3 clientIdentifier:(id)a4
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[TPSLogger default](TPSLogger, "default", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19A906000, v4, OS_LOG_TYPE_DEFAULT, "registerEventsForWakingCallback not supported for %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)deregisterEventsForCallback:(id)a3
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[TPSLogger default](TPSLogger, "default", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "deregisterEventsForCallback not supported for %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)deregisterAllEventsForCallback
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[TPSLogger default](TPSLogger, "default");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19A906000, v2, OS_LOG_TYPE_DEFAULT, "deregisterEventsForCallback not supported for %@", (uint8_t *)&v5, 0xCu);

  }
}

@end
