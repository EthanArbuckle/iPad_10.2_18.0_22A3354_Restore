@implementation SWSystemActivityProvider

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SWSystemActivityProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_253DA1588 != -1)
    dispatch_once(&qword_253DA1588, block);
  return (id)_MergedGlobals_0;
}

void __42__SWSystemActivityProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v1;

}

- (id)declareSystemActivityWithName:(id)a3
{
  id v3;
  SWDeclareSystemActivityResult *v4;

  v3 = a3;
  v4 = -[SWDeclareSystemActivityResult initWithReturnValue:assertionID:systemState:]([SWDeclareSystemActivityResult alloc], "initWithReturnValue:assertionID:systemState:", IOPMAssertionDeclareSystemActivity(), 0, 0);

  return v4;
}

- (void)releaseAssertionID:(unsigned int)a3
{
  IOPMAssertionRelease(a3);
}

- (id)createTimerWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD78]), "initWithIdentifier:", v3);

  return v4;
}

@end
