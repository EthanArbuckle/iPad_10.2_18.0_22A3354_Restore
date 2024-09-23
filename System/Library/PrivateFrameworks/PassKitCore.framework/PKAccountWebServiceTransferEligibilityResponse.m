@implementation PKAccountWebServiceTransferEligibilityResponse

- (PKAccountWebServiceTransferEligibilityResponse)initWithData:(id)a3
{
  return -[PKAccountWebServiceTransferEligibilityResponse initWithData:account:request:](self, "initWithData:account:request:", a3, 0, 0);
}

- (PKAccountWebServiceTransferEligibilityResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5
{
  PKAccountWebServiceTransferEligibilityResponse *v5;
  PKAccountWebServiceTransferEligibilityResponse *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSDecimalNumber *overflowAmount;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKAccountWebServiceTransferEligibilityResponse;
  v5 = -[PKWebServiceResponse initWithData:](&v13, sel_initWithData_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PKWebServiceResponse JSONObject](v5, "JSONObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      objc_msgSend(v8, "PKStringForKey:", CFSTR("eligibility"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_eligibility = PKAccountTransferEligibilityFromString(v9);

      objc_msgSend(v8, "PKDecimalNumberForKey:", CFSTR("overflowAmount"));
      v10 = objc_claimAutoreleasedReturnValue();

      overflowAmount = v6->_overflowAmount;
      v6->_overflowAmount = (NSDecimalNumber *)v10;

    }
  }
  return v6;
}

- (unint64_t)eligibility
{
  return self->_eligibility;
}

- (NSDecimalNumber)overflowAmount
{
  return self->_overflowAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overflowAmount, 0);
}

@end
