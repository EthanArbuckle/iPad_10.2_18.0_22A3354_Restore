@implementation PKAddPaymentPassController

+ (BOOL)canAddPaymentPass
{
  if ((objc_msgSend((id)objc_msgSend(a1, "_desiredClass"), "isEqual:", objc_opt_class()) & 1) != 0)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(a1, "_desiredClass"), "canAddPaymentPass");
}

- (PKAddPaymentPassController)init
{

  return 0;
}

- (PKAddPaymentPassController)initWithRequestConfiguration:(id)a3 delegate:(id)a4
{

  return 0;
}

- (void)presentWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)dismissWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (PKAddPaymentPassControllerDelegate)delegate
{
  return (PKAddPaymentPassControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKAddPaymentPassRequestConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
