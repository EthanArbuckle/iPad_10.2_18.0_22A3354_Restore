@implementation UIDICActivityItemProvider

void __69___UIDICActivityItemProvider__shouldExecuteItemOperationForActivity___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _shouldExecuteItemOperationForActivity__executeInShareUI = objc_msgSend(v0, "BOOLForKey:", CFSTR("UIOpenInByCopyPerformedInShareUI"));

}

@end
