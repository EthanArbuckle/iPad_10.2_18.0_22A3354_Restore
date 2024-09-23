@implementation TPSCloudDeviceHasPhoneOrPadValidation

- (void)validateWithCompletion:(id)a3
{
  void *v4;
  TPSCloudDeviceHasPhoneOrPadValidation *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1DAC9DA04(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (TPSCloudDeviceHasPhoneOrPadValidation)initWithTargetContext:(id)a3
{
  void *v4;
  TPSCloudDeviceHasPhoneOrPadValidation *v5;
  objc_super v7;

  sub_1DACA2D58();
  v4 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  v5 = -[TPSTargetingValidation initWithTargetContext:](&v7, sel_initWithTargetContext_, v4);

  return v5;
}

- (TPSCloudDeviceHasPhoneOrPadValidation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  return -[TPSCloudDeviceHasPhoneOrPadValidation init](&v3, sel_init);
}

@end
