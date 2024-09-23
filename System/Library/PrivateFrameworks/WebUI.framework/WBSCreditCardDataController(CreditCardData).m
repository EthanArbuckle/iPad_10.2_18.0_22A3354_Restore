@implementation WBSCreditCardDataController(CreditCardData)

+ (id)creditCardDataController
{
  return +[WBUCreditCardDataController sharedCreditCardDataController](WBUCreditCardDataController, "sharedCreditCardDataController");
}

@end
