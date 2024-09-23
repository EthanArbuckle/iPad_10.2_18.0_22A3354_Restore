@implementation PKPaymentAuthorizationErrorStateParam

+ (id)paramWithError:(id)a3
{
  return (id)objc_msgSend(a1, "paramWithError:clientFailure:", a3, 0);
}

+ (id)paramWithError:(id)a3 clientFailure:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "param");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setError:", v6);

  objc_msgSend(v7, "setClientFailure:", v4);
  return v7;
}

+ (id)paramWithError:(id)a3 paymentOffersError:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "param");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setError:", v6);

  objc_msgSend(v7, "setPaymentOffersError:", v4);
  return v7;
}

- (id)description
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  if (self->_clientFailure)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("clientFailure: '%@'; "), v4);
  if (self->_paymentOffersError)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentOffersError: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isClientFailure
{
  return self->_clientFailure;
}

- (void)setClientFailure:(BOOL)a3
{
  self->_clientFailure = a3;
}

- (BOOL)isPaymentOffersError
{
  return self->_paymentOffersError;
}

- (void)setPaymentOffersError:(BOOL)a3
{
  self->_paymentOffersError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
