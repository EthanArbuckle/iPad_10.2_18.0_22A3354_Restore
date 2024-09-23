@implementation NSArray(RCAdditions)

- (BOOL)rc_containsObjectPassingTest:()RCAdditions
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "rc_firstObjectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)rc_firstObjectPassingTest:()RCAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NSArray(RCAdditions) rc_firstObjectPassingTest:].cold.1();
  objc_msgSend(a1, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rc_firstObjectPassingTest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)rc_arrayByTransformingWithBlockWithIndex:()RCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__NSArray_RCAdditions__rc_arrayByTransformingWithBlockWithIndex___block_invoke;
  v11[3] = &unk_1E470E108;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)rc_arrayByTransformingWithBlock:()RCAdditions
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSArray_RCAdditions__rc_arrayByTransformingWithBlock___block_invoke;
  v8[3] = &unk_1E470E130;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "rc_arrayByTransformingWithBlockWithIndex:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)rc_description
{
  return objc_msgSend(a1, "componentsJoinedByString:", CFSTR(", "));
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
  v2 = "-[NSArray(RCAdditions) rc_firstObjectPassingTest:]";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Categories/NSArray+RCAdditions.m";
  v5 = 1024;
  v6 = 18;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

}

@end
