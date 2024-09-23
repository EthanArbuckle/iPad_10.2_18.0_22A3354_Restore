@implementation PKVehicleInitiatedPairingProxCardRequest

- (PKVehicleInitiatedPairingProxCardRequest)initWithSupportedTerminal:(id)a3 referralSource:(unint64_t)a4
{
  id v7;
  PKVehicleInitiatedPairingProxCardRequest *v8;
  PKVehicleInitiatedPairingProxCardRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKVehicleInitiatedPairingProxCardRequest;
  v8 = -[PKProxCardRequest initWithProxCardType:](&v11, sel_initWithProxCardType_, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_supportedTerminal, a3);
    v9->_referralSource = a4;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKVehicleInitiatedPairingProxCardRequest;
  v4 = a3;
  -[PKProxCardRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedTerminal, CFSTR("supportedTerminal"), v6.receiver, v6.super_class);
  PKSubcredentialPairingReferralSourceToString(self->_referralSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("referralSource"));

}

- (PKVehicleInitiatedPairingProxCardRequest)initWithCoder:(id)a3
{
  id v4;
  PKVehicleInitiatedPairingProxCardRequest *v5;
  uint64_t v6;
  PKCarUnlockSupportedTerminal *supportedTerminal;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKVehicleInitiatedPairingProxCardRequest;
  v5 = -[PKProxCardRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportedTerminal"));
    v6 = objc_claimAutoreleasedReturnValue();
    supportedTerminal = v5->_supportedTerminal;
    v5->_supportedTerminal = (PKCarUnlockSupportedTerminal *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referralSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_referralSource = PKSubcredentialPairingReferralSourceFromString(v8);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCarUnlockSupportedTerminal)supportedTerminal
{
  return self->_supportedTerminal;
}

- (unint64_t)referralSource
{
  return self->_referralSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTerminal, 0);
}

@end
