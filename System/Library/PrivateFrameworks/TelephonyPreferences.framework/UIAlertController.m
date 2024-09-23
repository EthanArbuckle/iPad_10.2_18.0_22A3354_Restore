@implementation UIAlertController

void __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke_2;
  v4[3] = &unk_1EA2CD7E0;
  v5 = v3;
  objc_msgSend(v2, "openURL:configuration:completionHandler:", v5, 0, v4);

}

void __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    TPSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke_2_cold_1(a1, (uint64_t)v4, v5);

  }
}

void __82__UIAlertController_TelephonyPreferences__tps_tapToRadarAlertControllerWithError___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1DB4B7000, log, OS_LOG_TYPE_ERROR, "Opening URL %@ failed with error %@", (uint8_t *)&v4, 0x16u);
}

@end
