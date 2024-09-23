@implementation _SBSUICFUserNotificationContentExtensionContextHost

+ (id)_allowedItemPayloadClasses
{
  if (_allowedItemPayloadClasses_onceToken != -1)
    dispatch_once(&_allowedItemPayloadClasses_onceToken, &__block_literal_global_14);
  return (id)_allowedItemPayloadClasses_allowedItemPayloadClasses;
}

@end
