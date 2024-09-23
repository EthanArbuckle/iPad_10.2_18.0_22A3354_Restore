@implementation SBFHandleRemoteBasebandLoggingStatusChanged

void __SBFHandleRemoteBasebandLoggingStatusChanged_block_invoke()
{
  id v0;

  +[SBFRemoteBasebandLoggingManager sharedInstance](SBFRemoteBasebandLoggingManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_notifyObservers");

}

@end
