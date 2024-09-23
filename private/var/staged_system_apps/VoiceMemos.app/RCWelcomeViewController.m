@implementation RCWelcomeViewController

+ (int64_t)reasonToShow
{
  return +[RCWelcomeUtilities reasonToShow](RCWelcomeUtilities, "reasonToShow");
}

- (RCWelcomeViewController)initWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RCWelcomeViewController *v7;
  id v8;
  id completionBlock;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_TITLE_FULL"), &stru_1001B2BC0, 0));
  v11.receiver = self;
  v11.super_class = (Class)RCWelcomeViewController;
  v7 = -[RCWelcomeViewController initWithTitle:detailText:icon:](&v11, "initWithTitle:detailText:icon:", v6, 0, 0);

  if (v7)
  {
    v8 = objc_retainBlock(v4);
    completionBlock = v7->_completionBlock;
    v7->_completionBlock = v8;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)RCWelcomeViewController;
  -[RCWelcomeViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("quote.bubble")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WELCOME_ITEM_1_TITLE"), &stru_1001B2BC0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WELCOME_ITEM_1_DESCRIPTION"), &stru_1001B2BC0, 0));
  -[RCWelcomeViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v5, v7, v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("waveform.and.stereo")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WELCOME_ITEM_2_TITLE"), &stru_1001B2BC0, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("WELCOME_ITEM_2_DESCRIPTION"), &stru_1001B2BC0, 0));
  -[RCWelcomeViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v10, v12, v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.square.on.square")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("WELCOME_ITEM_3_TITLE"), &stru_1001B2BC0, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("WELCOME_ITEM_3_DESCRIPTION"), &stru_1001B2BC0, 0));
  -[RCWelcomeViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v15, v17, v13);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("WELCOME_CONTINUE"), &stru_1001B2BC0, 0));
  objc_msgSend(v18, "setTitle:forState:", v20, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "standardInteractionTintColor"));
  objc_msgSend(v18, "setTintColor:", v22);

  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, "handleContinueButton:", 64);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCWelcomeViewController buttonTray](self, "buttonTray"));
  objc_msgSend(v23, "addButton:", v18);

  -[RCWelcomeViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, "handleContinueButton:"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCWelcomeViewController;
  -[RCWelcomeViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return (unint64_t)v3;
}

- (void)handleContinueButton:(id)a3
{
  +[RCWelcomeUtilities finishShowingWelcomeScreen](RCWelcomeUtilities, "finishShowingWelcomeScreen", a3);
  -[RCWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, self->_completionBlock);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
