@implementation TPSGenerativeModelsAvailabilityValidation

- (void)validateWithCompletion:(id)a3
{
  void *v4;
  TPSGenerativeModelsAvailabilityValidation *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1DAC79670(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (TPSGenerativeModelsAvailabilityValidation)initWithTargetContext:(id)a3
{
  void *v4;
  TPSGenerativeModelsAvailabilityValidation *v5;
  objc_super v7;

  sub_1DACA2D58();
  v4 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for GenerativeModelsAvailabilityValidation();
  v5 = -[TPSTargetingValidation initWithTargetContext:](&v7, sel_initWithTargetContext_, v4);

  return v5;
}

- (TPSGenerativeModelsAvailabilityValidation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeModelsAvailabilityValidation();
  return -[TPSGenerativeModelsAvailabilityValidation init](&v3, sel_init);
}

@end
