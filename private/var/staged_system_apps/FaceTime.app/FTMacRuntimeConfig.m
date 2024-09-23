@implementation FTMacRuntimeConfig

+ (FTMacRuntimeConfig)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F6FC;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A36E0 != -1)
    dispatch_once(&qword_1000A36E0, block);
  return (FTMacRuntimeConfig *)(id)qword_1000A36D8;
}

+ (FTMacRuntimeConfig)allocWithZone:(_NSZone *)a3
{
  return (FTMacRuntimeConfig *)objc_claimAutoreleasedReturnValue(+[FTMacRuntimeConfig sharedInstance](FTMacRuntimeConfig, "sharedInstance", a3));
}

- (BOOL)showsCallsFromService:(int)a3
{
  return 0;
}

- (unsigned)userInterfaceStyle
{
  return 1;
}

- (BOOL)shouldUseCompactHorizontalLayout
{
  return 0;
}

- (BOOL)contentViewCanRotate
{
  return 0;
}

- (UIColor)applicationTintColor
{
  return +[UIColor systemGreenColor](UIColor, "systemGreenColor");
}

- (BOOL)headerViewShowsAllRecentCalls
{
  return 0;
}

- (int64_t)headerViewNumberOfCallsToShow
{
  return 1;
}

- (BOOL)showsTelephonyCalls
{
  return 0;
}

- (int64_t)statusBarOrientation
{
  return 0;
}

- (BOOL)tabBarFillsScreen
{
  return 0;
}

- (BOOL)tabBarCanSlide
{
  return 1;
}

- (BOOL)isSuspended
{
  return 0;
}

- (BOOL)inCall
{
  return 0;
}

+ (id)sharedNumberFormatter
{
  return 0;
}

- (unsigned)contentViewOffscreenEdge
{
  return 2 * (objc_msgSend(UIApp, "userInterfaceLayoutDirection") != 0);
}

- (BOOL)alwaysShowLocalVideo
{
  return 1;
}

- (BOOL)usesUnifiedInterface
{
  return 1;
}

- (BOOL)contentViewAnimationsFadeInsteadOfMove
{
  return 0;
}

- (id)callHistoryController
{
  return -[FTMacRuntimeConfig callHistoryControllerWithCoalescingStrategy:](self, "callHistoryControllerWithCoalescingStrategy:", 2);
}

- (id)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3
{
  return +[TUCallHistoryController sharedControllerWithCoalescingStrategy:options:](TUCallHistoryController, "sharedControllerWithCoalescingStrategy:options:", a3, -[FTMacRuntimeConfig callHistoryControllerOptions](self, "callHistoryControllerOptions"));
}

- (unint64_t)callHistoryControllerOptions
{
  return 7;
}

- (PHRecentsController)recentsController
{
  PHRecentsController *recentsController;
  void *v4;
  PHRecentsController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PHRecentsController *v11;
  PHRecentsController *v12;

  recentsController = self->_recentsController;
  if (!recentsController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTApplicationServices sharedInstance](FTApplicationServices, "sharedInstance"));
    v5 = [PHRecentsController alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FTMacRuntimeConfig callHistoryController](self, "callHistoryController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callProviderManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestedContactStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadataCache"));
    v11 = -[PHRecentsController initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:](v5, "initWithCallHistoryController:callProviderManager:contactStore:suggestedContactStore:metadataCache:", v6, v7, v8, v9, v10);
    v12 = self->_recentsController;
    self->_recentsController = v11;

    recentsController = self->_recentsController;
  }
  return recentsController;
}

- (BOOL)usesBlendModes
{
  return 1;
}

- (PhoneRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_storeStrong((id *)&self->_launchURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
}

@end
