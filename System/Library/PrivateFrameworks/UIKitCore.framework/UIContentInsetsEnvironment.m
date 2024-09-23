@implementation UIContentInsetsEnvironment

void __46___UIContentInsetsEnvironment_nullEnvironment__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "insetEnvironmentForInsetReference:safeAreaInsets:layoutMarginsInsets:readableContentInsets:scrollAccessoryInsets:", 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD7CF38;
  qword_1ECD7CF38 = v1;

}

@end
