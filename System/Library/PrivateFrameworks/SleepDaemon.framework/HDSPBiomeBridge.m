@implementation HDSPBiomeBridge

void __39___HDSPBiomeBridge_subscribe_callback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    objc_msgSend(v2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished subscribing with error %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

void __39___HDSPBiomeBridge_subscribe_callback___block_invoke_294(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = objc_opt_class();
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received callback with event %{public}@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

@end
