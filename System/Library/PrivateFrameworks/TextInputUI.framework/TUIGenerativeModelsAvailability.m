@implementation TUIGenerativeModelsAvailability

+ (BOOL)isAvailable
{
  return sub_18C798160() & 1;
}

- (TUIGenerativeModelsAvailability)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TUIGenerativeModelsAvailability init](&v3, sel_init);
}

@end
