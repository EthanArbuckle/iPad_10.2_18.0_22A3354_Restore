@implementation HOOnboardingSegmentViewController

+ (id)_buildPocketViewControllerWithOptions:(unint64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v7;
  NSMutableArray *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v7 = a4;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v8 = objc_opt_new(NSMutableArray);
  if ((a3 & 8) != 0)
  {
    v14 = sub_10000BF18(CFSTR("HOOnboardingGetStarted"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HUPocketButtonDescriptor descriptorWithTitle:style:target:action:userInfo:](HUPocketButtonDescriptor, "descriptorWithTitle:style:target:action:userInfo:", v15, 0, v7, a5, &off_1000BF4B8));
    -[NSMutableArray addObject:](v8, "addObject:", v16);

    if ((a3 & 4) == 0)
    {
LABEL_4:
      if ((a3 & 1) == 0)
        goto LABEL_5;
LABEL_12:
      v20 = HULocalizedString(CFSTR("HUNextTitle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[HUPocketButtonDescriptor descriptorWithTitle:style:target:action:userInfo:](HUPocketButtonDescriptor, "descriptorWithTitle:style:target:action:userInfo:", v21, 0, v7, a5, &off_1000BF4E8));
      -[NSMutableArray addObject:](v8, "addObject:", v22);

      if ((a3 & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_4;
  }
  v17 = sub_10000BF18(CFSTR("HOOnboardingSetUpLater"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[HUPocketButtonDescriptor descriptorWithTitle:style:target:action:userInfo:](HUPocketButtonDescriptor, "descriptorWithTitle:style:target:action:userInfo:", v18, 1, v7, a5, &off_1000BF4D0));
  -[NSMutableArray addObject:](v8, "addObject:", v19);

  if ((a3 & 1) != 0)
    goto LABEL_12;
LABEL_5:
  if ((a3 & 2) != 0)
  {
LABEL_6:
    v9 = sub_10000BF18(CFSTR("HODoneButtonTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HUPocketButtonDescriptor descriptorWithTitle:style:target:action:userInfo:](HUPocketButtonDescriptor, "descriptorWithTitle:style:target:action:userInfo:", v10, 0, v7, a5, &off_1000BF500));
    -[NSMutableArray addObject:](v8, "addObject:", v11);

  }
LABEL_7:
  v12 = objc_msgSend(objc_alloc((Class)HUPocketButtonViewController), "initWithButtonDescriptors:", v8);

LABEL_9:
  return v12;
}

- (HOOnboardingSegmentViewController)initWithContentViewController:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HOOnboardingSegmentViewController *v12;
  HOOnboardingSegmentViewController *v13;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOOnboardingSegmentViewController.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v9 = (void *)objc_opt_class(self);
  v10 = objc_msgSend(v9, "_buildPocketViewControllerWithOptions:target:action:", objc_msgSend((id)objc_opt_class(self), "pocketOptions"), self, "_buttonActivated:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v16.receiver = self;
  v16.super_class = (Class)HOOnboardingSegmentViewController;
  v12 = -[HOOnboardingSegmentViewController initWithContentViewController:pocketViewController:](&v16, "initWithContentViewController:pocketViewController:", v7, v11);
  v13 = v12;
  if (v12)
    -[HOOnboardingSegmentViewController setDelegate:](v12, "setDelegate:", v8);

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingSegmentViewController;
  -[HOOnboardingSegmentViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingSegmentViewController;
  -[HOOnboardingSegmentViewController viewWillAppear:](&v5, "viewWillAppear:");
  -[HOOnboardingSegmentViewController _setNavigationBarVisibility:](self, "_setNavigationBarVisibility:", v3);
}

+ (unint64_t)pocketOptions
{
  return 0;
}

- (NSString)segmentIdentifier
{
  return 0;
}

- (BOOL)showPocket
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController pocketViewController](self, "pocketViewController"));
  v3 = v2 != 0;

  return v3;
}

- (void)setShowPocket:(BOOL)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "pocketOptions");
    v5 = objc_msgSend((id)objc_opt_class(self), "_buildPocketViewControllerWithOptions:target:action:", v4, self, "_buttonActivated:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      v7 = v6;
      -[HOOnboardingSegmentViewController setPocketViewController:](self, "setPocketViewController:", v6);
      v6 = v7;
    }

  }
  else
  {
    -[HOOnboardingSegmentViewController setPocketViewController:](self, "setPocketViewController:", 0);
  }
}

- (void)_buttonActivated:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  int v14;
  HOOnboardingSegmentViewController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v5 = a3;
  v6 = HFLogForCategory(68);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v14 = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button (%@)", (uint8_t *)&v14, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v12 = (char *)objc_msgSend(v11, "unsignedIntegerValue");

  if ((unint64_t)(v12 - 1) < 2)
    goto LABEL_6;
  if (v12 == (char *)4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController delegate](self, "delegate"));
    objc_msgSend(v13, "childViewControllerDidFinish:shouldSkipRelatedChildren:", self, 1);
    goto LABEL_8;
  }
  if (v12 == (char *)8)
  {
LABEL_6:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController delegate](self, "delegate"));
    objc_msgSend(v13, "childViewControllerDidFinish:", self);
LABEL_8:

  }
}

- (unint64_t)_numberOfPocketButtons
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = objc_opt_class(HUPocketButtonViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController pocketViewController](self, "pocketViewController"));
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptors"));
  v8 = objc_msgSend(v7, "count");

  return (unint64_t)v8;
}

- (void)_setNavigationBarVisibility:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (id)-[HOOnboardingSegmentViewController _numberOfPocketButtons](self, "_numberOfPocketButtons") != (id)1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setHidesBackButton:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "setNavigationBarHidden:animated:", 0, v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController navigationController](self, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  objc_msgSend(v9, "setBarTintColor:", v10);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[HOOnboardingSegmentViewController navigationController](self, "navigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
  objc_msgSend(v11, "_setHidesShadow:", 1);

}

- (HOOnboardingChildViewControllerDelegate)delegate
{
  return (HOOnboardingChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate
{
  return (HOOnboardingChildViewControllerNavigationBarDelegate *)objc_loadWeakRetained((id *)&self->_navigationBarDelegate);
}

- (void)setNavigationBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationBarDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationBarDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
