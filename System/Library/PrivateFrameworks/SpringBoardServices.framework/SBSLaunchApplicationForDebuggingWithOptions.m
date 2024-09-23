@implementation SBSLaunchApplicationForDebuggingWithOptions

intptr_t __SBSLaunchApplicationForDebuggingWithOptions_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unsigned int v4;

  if (a2)
  {
    v3 = objc_msgSend(a2, "code");
    if (v3 > 8)
      v4 = 12;
    else
      v4 = dword_18EBC9338[v3];
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
