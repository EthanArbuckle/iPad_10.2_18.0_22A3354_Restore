@implementation PLDebugEnableCoreDataMultithreadedAsserts

uint64_t __PLDebugEnableCoreDataMultithreadedAsserts_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("-")))
    v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("com.apple.CoreData.ConcurrencyDebug"));
  else
    v3 = 0;

  return v3;
}

@end
