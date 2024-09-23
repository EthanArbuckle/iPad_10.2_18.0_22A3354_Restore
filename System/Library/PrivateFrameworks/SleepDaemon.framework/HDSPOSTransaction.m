@implementation HDSPOSTransaction

void __49___HDSPOSTransaction_initWithIdentifier_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49___HDSPOSTransaction_initWithIdentifier_timeout___block_invoke_2;
  v3[3] = &unk_24D4E3498;
  v4 = WeakRetained;
  v2 = WeakRetained;
  objc_msgSend(v2, "_withLock:", v3);

}

uint64_t __49___HDSPOSTransaction_initWithIdentifier_timeout___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[4])
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v6 = 138543362;
      *(_QWORD *)&v6[4] = objc_opt_class();
      v5 = *(id *)&v6[4];
      _os_log_error_impl(&dword_21610C000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] transaction timed out", v6, 0xCu);

    }
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_locked_release", *(_OWORD *)v6);
}

uint64_t __38___HDSPOSTransaction_releaseAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_release");
}

@end
