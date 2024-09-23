@implementation ShowLPROnboardingActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "coordinator", a3));
  objc_msgSend(v4, "presentLPRWithVehicle:scenario:presenter:completionBlock:", 0, 0, 0, 0);

}

@end
