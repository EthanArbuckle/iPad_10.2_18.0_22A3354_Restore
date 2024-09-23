@implementation TRDeviceSetupFinishAction

- (TRDeviceSetupFinishAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupFinishAction;
  return (TRDeviceSetupFinishAction *)-[TRDeviceSetupAction _initWithActionType:parameters:](&v3, sel__initWithActionType_parameters_, CFSTR("finish"), 0);
}

@end
