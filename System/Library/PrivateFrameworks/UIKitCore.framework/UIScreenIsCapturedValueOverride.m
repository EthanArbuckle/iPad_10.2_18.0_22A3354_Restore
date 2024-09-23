@implementation UIScreenIsCapturedValueOverride

void ___UIScreenIsCapturedValueOverride_block_invoke()
{
  void *v0;
  id obj;

  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIScreenIsCapturedValue"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_storeStrong((id *)&qword_1ECD79A28, obj);

}

@end
