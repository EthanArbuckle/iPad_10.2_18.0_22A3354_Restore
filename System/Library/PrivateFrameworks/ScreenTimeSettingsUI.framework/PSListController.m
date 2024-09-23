@implementation PSListController

uint64_t __46__PSListController_PIN__st_sharedPINSpecifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("PIN"), 0, 0, 0, 0, -1, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)st_sharedPINSpecifier_specifier;
  st_sharedPINSpecifier_specifier = v0;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)st_sharedPINSpecifier_specifier, "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BE75C60]);

  objc_msgSend((id)st_sharedPINSpecifier_specifier, "setObject:forKeyedSubscript:", &unk_24DBBEA90, *MEMORY[0x24BE75E18]);
  return objc_msgSend((id)st_sharedPINSpecifier_specifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], 0x24DB91010);
}

void __46__PSListController_PIN__st_didAcceptRemovePIN__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __58__STPasscodeGroupSpecifierProvider__removeManagedPasscode__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "coordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHasAlreadyEnteredPINForSession:", 0);

  }
}

void __64__PSListController_PIN__st_devicePINController_didAcceptSetPIN___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __64__PSListController_PIN__st_devicePINController_didAcceptSetPIN___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __68__PSListController_PIN__st_devicePINController_didAcceptChangedPIN___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __68__PSListController_PIN__st_devicePINController_didAcceptChangedPIN___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "coordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHasAlreadyEnteredPINForSession:", 0);

  }
}

void __64__PSListController_PIN__st_devicePINController_didAcceptSetPIN___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "Failed to set Screen Time passcode: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __68__PSListController_PIN__st_devicePINController_didAcceptChangedPIN___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219AB4000, MEMORY[0x24BDACB70], a3, "Failed to change Screen Time passcode: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
