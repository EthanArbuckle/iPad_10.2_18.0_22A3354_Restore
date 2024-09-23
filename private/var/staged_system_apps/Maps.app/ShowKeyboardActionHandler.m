@implementation ShowKeyboardActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = objc_opt_class(ShowKeyboardAction);
  if ((objc_opt_isKindOfClass(v8, v4) & 1) != 0)
  {
    v5 = v8;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    v7 = objc_msgSend(v5, "interactionModel");

    objc_msgSend(v6, "launchIntoKeyboardSearchWithRequestedInteractionModel:", v7);
  }

}

@end
