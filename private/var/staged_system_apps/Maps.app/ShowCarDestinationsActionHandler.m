@implementation ShowCarDestinationsActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;

  v4 = a3;
  v5 = objc_opt_class(ShowCarDestinationsAction);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v7, "displayDestinations");

  }
}

@end
