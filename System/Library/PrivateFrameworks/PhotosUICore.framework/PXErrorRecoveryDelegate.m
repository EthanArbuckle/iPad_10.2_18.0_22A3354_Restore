@implementation PXErrorRecoveryDelegate

- (void)_didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4
{
  void *v4;

  if (a4)
  {
    v4 = a4;
    (*((void (**)(void *, BOOL))a4 + 2))(a4, a3);
    a4 = v4;
  }

}

+ (id)sharedErrorRecoveryDelegate
{
  if (sharedErrorRecoveryDelegate_onceToken != -1)
    dispatch_once(&sharedErrorRecoveryDelegate_onceToken, &__block_literal_global_101631);
  return (id)sharedErrorRecoveryDelegate_sharedErrorRecoveryDelegate;
}

void __54__PXErrorRecoveryDelegate_sharedErrorRecoveryDelegate__block_invoke()
{
  PXErrorRecoveryDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(PXErrorRecoveryDelegate);
  v1 = (void *)sharedErrorRecoveryDelegate_sharedErrorRecoveryDelegate;
  sharedErrorRecoveryDelegate_sharedErrorRecoveryDelegate = (uint64_t)v0;

}

@end
