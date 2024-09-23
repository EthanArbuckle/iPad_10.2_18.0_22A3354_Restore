@implementation DisplayModeNavActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  v6 = objc_opt_class(DisplayModeNavAction);
  if ((objc_opt_isKindOfClass(v16, v6) & 1) != 0)
  {
    v7 = v16;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v9 = objc_msgSend(v8, "isInNavigatingState");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v11 = objc_msgSend(v10, "isCurrentlyConnectedToAnyCarScene");

      v12 = objc_msgSend(v7, "showDetails");
      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
        v14 = v13;
        if ((v12 & 1) != 0)
          objc_msgSend(v13, "goToDetail");
        else
          objc_msgSend(v13, "goToOverview");
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navActionCoordinator"));
        v14 = v15;
        if (v12)
          objc_msgSend(v15, "pressedZoomToManeuverWithSender:", 0);
        else
          objc_msgSend(v15, "pressedShowOverviewWithSender:", 0);
      }

    }
  }

}

@end
