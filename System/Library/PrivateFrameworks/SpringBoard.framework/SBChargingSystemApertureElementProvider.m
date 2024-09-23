@implementation SBChargingSystemApertureElementProvider

- (SBChargingSystemApertureElementProvider)init
{
  SBChargingSystemApertureElementProvider *v2;
  objc_class *v3;
  uint64_t v4;
  NSString *elementIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBChargingSystemApertureElementProvider;
  v2 = -[SBChargingSystemApertureElementProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    elementIdentifier = v2->_elementIdentifier;
    v2->_elementIdentifier = (NSString *)v4;

  }
  return v2;
}

- (id)powerElementWithBatteryCapacity:(double)a3
{
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLowPowerModeEnabled");

  return -[SBPowerAlertElement initWithIdentifier:style:batteryPercentage:lowPowerModeEnabled:action:]([SBPowerAlertElement alloc], "initWithIdentifier:style:batteryPercentage:lowPowerModeEnabled:action:", self, 0, v6, 0, a3);
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end
