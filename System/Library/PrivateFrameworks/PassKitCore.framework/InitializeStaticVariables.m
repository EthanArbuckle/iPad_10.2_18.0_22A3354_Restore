@implementation InitializeStaticVariables

void __InitializeStaticVariables_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = +[PKSpringAnimationFactory createDefaultFactory](PKSpringAnimationFactory, "createDefaultFactory");
  v1 = (void *)_MergedGlobals_206;
  _MergedGlobals_206 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_206, "springAnimationWithKeyPath:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECF22328;
  qword_1ECF22328 = v2;

  objc_msgSend((id)qword_1ECF22328, "timingFunction");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECF22320;
  qword_1ECF22320 = v4;

}

@end
