@implementation PXErrorRecoveryEnumerateOptionsForError

void __PXErrorRecoveryEnumerateOptionsForError_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  +[PXErrorRecoveryDelegate sharedErrorRecoveryDelegate](PXErrorRecoveryDelegate, "sharedErrorRecoveryDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:", v4, v5, v6, sel__didPresentErrorWithRecovery_contextInfo_, v2);

}

@end
