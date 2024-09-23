@implementation TPSDeviceCapabilityValidation

- (TPSDeviceCapabilityValidation)initWithQueries:(id)a3
{
  id v4;
  TPSDeviceCapabilityValidation *v5;
  TPSDeviceCapabilityValidation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSDeviceCapabilityValidation;
  v5 = -[TPSDeviceCapabilityValidation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TPSTargetingValidation setTargetContext:](v5, "setTargetContext:", v4);

  return v6;
}

@end
