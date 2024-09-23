@implementation NSEnumerator(RCAdditions)

- (id)rc_firstObjectPassingTest:()RCAdditions
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSEnumerator(RCAdditions) rc_firstObjectPassingTest:].cold.1();
  v5 = 0;
  do
  {
    v6 = v5;
    objc_msgSend(a1, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (v5 && !v4[2](v4, v5));

  return v5;
}

- (void)rc_firstObjectPassingTest:()RCAdditions .cold.1()
{
  void *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "testBlock");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NSEnumerator(RCAdditions) rc_firstObjectPassingTest:]";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Categories/NSEnumerator+RCAdditions.m";
  v5 = 1024;
  v6 = 16;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

}

@end
