@implementation OITSUAssertionHandler

+ (id)performBlockIgnoringAssertions:(id)a3
{
  return (id)objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 0);
}

+ (id)performBlockIgnoringFatalAssertions:(id)a3
{
  return (id)objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:", a3, 1);
}

+ (id)p_performBlockIgnoringAssertions:(id)a3 onlyFatal:(BOOL)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v4 = _ignoreAssertionsCallback;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__OITSUAssertionHandler_p_performBlockIgnoringAssertions_onlyFatal___block_invoke;
  v8[3] = &unk_24F39A700;
  v9 = a4;
  v8[4] = &v10;
  _ignoreAssertionsCallback = (uint64_t)v8;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  _ignoreAssertionsCallback = v4;
  v5 = (id)v11[5];
  v6 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __68__OITSUAssertionHandler_p_performBlockIgnoringAssertions_onlyFatal___block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v6;

  if (TSUDefaultCat_init_token == -1)
  {
    if ((a3 & 1) != 0)
    {
LABEL_3:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Terminating application due to %@"), a2);
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_1);
    if ((a3 & 1) != 0)
      goto LABEL_3;
  }
  if (*(_BYTE *)(a1 + 40))
    return;
  v6 = objc_msgSend(a2, "copy");
LABEL_7:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v6;
}

os_log_t __68__OITSUAssertionHandler_p_performBlockIgnoringAssertions_onlyFatal___block_invoke_2()
{
  os_log_t result;

  result = TSULogCreateCategory("TSUDefaultCat");
  TSUDefaultCat_log_t = (uint64_t)result;
  return result;
}

+ (void)logBacktrace
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary");
  v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logBacktrace_lastStackAddress"));
  v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "callStackReturnAddresses"), "copy");
  if (v4 && objc_msgSend(v4, "isEqualToArray:", v5))
  {
    objc_msgSend(a1, "logBacktraceWithCallStackSymbols:", &unk_24F469E38);
  }
  else
  {
    objc_msgSend(a1, "logBacktraceWithCallStackSymbols:", objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("logBacktrace_lastStackAddress"));
  }

}

+ (void)logBacktraceWithCallStackSymbols:(id)a3
{
  if (TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_25);
  objc_msgSend(a1, "simulateCrashWithMessage:", CFSTR("+[TSUAssert logBacktrace]"));
}

os_log_t __58__OITSUAssertionHandler_logBacktraceWithCallStackSymbols___block_invoke()
{
  os_log_t result;

  result = TSULogCreateCategory("TSUDefaultCat");
  TSUDefaultCat_log_t = (uint64_t)result;
  return result;
}

+ (int)_atomicIncrementAssertCount
{
  int result;

  do
    result = __ldaxr((unsigned int *)&sAssertionCount);
  while (__stlxr(result + 1, (unsigned int *)&sAssertionCount));
  return result;
}

@end
