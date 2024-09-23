@implementation SBUnhideProtectedAppAlertControllerFor

void ___SBUnhideProtectedAppAlertControllerFor_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CF96A0], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v4 = objc_msgSend(v2, "setSubject:isHidden:error:", v3, 0, &v7);
  v5 = v7;

  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___SBUnhideProtectedAppAlertControllerFor_block_invoke_cold_1();

  }
}

void ___SBUnhideProtectedAppAlertControllerFor_block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v0, (uint64_t)v0, "Error unhiding subject when adding to home screen: %@ %@", v1);
  OUTLINED_FUNCTION_2_0();
}

@end
