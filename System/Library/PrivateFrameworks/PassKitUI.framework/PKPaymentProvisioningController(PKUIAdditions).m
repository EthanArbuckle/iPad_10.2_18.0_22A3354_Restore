@implementation PKPaymentProvisioningController(PKUIAdditions)

- (uint64_t)alertForDisplayableError:()PKUIAdditions
{
  return objc_msgSend(a1, "alertForDisplayableError:earlyExitHandler:", a3, 0);
}

- (id)alertForDisplayableError:()PKUIAdditions earlyExitHandler:
{
  return PKAlertForDisplayableErrorWithHandlers(a3, a4, 0, 0);
}

@end
