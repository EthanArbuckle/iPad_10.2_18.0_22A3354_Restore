@implementation SBFKeyWindowStack

void __36___SBFKeyWindowStack_sharedInstance__block_invoke()
{
  _SBFKeyWindowStack *v0;
  void *v1;

  v0 = objc_alloc_init(_SBFKeyWindowStack);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

void __60___SBFKeyWindowStack_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v2, CFSTR("stack"), 0);

}

@end
