@implementation _UIPopoverHostManagerProviderMac

+ (id)sharedPopoverManager
{
  if (_MergedGlobals_1221 != -1)
    dispatch_once(&_MergedGlobals_1221, &__block_literal_global_498);
  return (id)qword_1ECD803A0;
}

+ (BOOL)_defaultsUseNSPopover
{
  return 0;
}

+ (id)managerForPresentationController:(id)a3
{
  return 0;
}

@end
