@implementation NSMutableDictionary(RCAdditions)

- (void)rc_safelySetObjectAllowingNil:()RCAdditions forKey:
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
      objc_msgSend(a1, "setObject:forKey:", v6, v7);
    else
      objc_msgSend(a1, "removeObjectForKey:", v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NSMutableDictionary(RCAdditions) rc_safelySetObjectAllowingNil:forKey:].cold.1();
  }

}

- (void)rc_safelySetObjectAllowingNil:()RCAdditions forKey:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"key", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
