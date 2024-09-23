@implementation NSFileManager

void __68__NSFileManager_RCAdditions__rc_moveToTempAndMarkAsPurgeable_error___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  id v6;

  v2 = (_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = _RCCleanUpURL(v1, &v6);
  v4 = v6;
  if (!v3)
  {
    OSLogForCategory(CFSTR("Default"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__NSFileManager_RCAdditions__rc_moveToTempAndMarkAsPurgeable_error___block_invoke_cold_1(v2, (uint64_t)v4, v5);

  }
}

uint64_t __58__NSFileManager_RCAdditions__rc_cleanUpTemporaryDirectory__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("voicememos-purgeable")) ^ 1;

  return v3;
}

uint64_t __56__NSFileManager_RCAdditions__rc_cleanUpM4AsInDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  OSLogForCategory(CFSTR("Default"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __56__NSFileManager_RCAdditions__rc_cleanUpM4AsInDirectory___block_invoke_cold_1();

  return 1;
}

void __68__NSFileManager_RCAdditions__rc_moveToTempAndMarkAsPurgeable_error___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[NSFileManager(RCAdditions) rc_moveToTempAndMarkAsPurgeable:error:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_6(&dword_1BD830000, a2, a3, "%s -- Failed to mark directory as purgeable, url = %@, error = %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
}

void __56__NSFileManager_RCAdditions__rc_cleanUpM4AsInDirectory___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1BD830000, v0, v1, "%s -- enumeratorAtURL error %@ url %@", v2);
}

@end
