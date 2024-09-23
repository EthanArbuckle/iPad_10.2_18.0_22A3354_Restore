@implementation SBPPTLockInterfaceOrientation

uint64_t __SBPPTLockInterfaceOrientation_block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;

  if (objc_msgSend((id)SBApp, "activeInterfaceOrientation") != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void SBPPTLockInterfaceOrientation(UIInterfaceOrientation, __strong dispatch_block_t)_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBPPTSupport.m"), 33, CFSTR("Failed to force orientation %ld"), *(_QWORD *)(a1 + 40));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
