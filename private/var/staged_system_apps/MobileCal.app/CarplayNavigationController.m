@implementation CarplayNavigationController

- (CarplayNavigationController)initWithModel:(id)a3
{
  id v5;
  CarplayNavigationController *v6;
  CarplayNavigationController *v7;
  id *p_model;
  void *v9;
  void *v10;
  EKUIIntegrationAlertDisplayer *v11;
  EKUIIntegrationAlertDisplayer *alertDisplayer;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v25;
  _QWORD v26[2];

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CarplayNavigationController;
  v6 = -[CarplayNavigationController init](&v25, "init");
  v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "undoManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "undoableEditor"));

    v11 = (EKUIIntegrationAlertDisplayer *)objc_msgSend(objc_alloc((Class)EKUIIntegrationAlertDisplayer), "initWithViewController:options:", v7, 0);
    alertDisplayer = v7->_alertDisplayer;
    v7->_alertDisplayer = v11;

    v13 = objc_alloc((Class)CUIKIPendingReminderTracker);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "eventStore"));
    v15 = objc_msgSend(v13, "initWithEventStore:", v14);

    objc_msgSend(v5, "setPendingReminderTracker:", v15);
    v16 = objc_alloc((Class)CUIKIReminderEditor);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "eventStore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "undoManager"));
    v19 = objc_msgSend(v16, "initWithEventStore:undoManager:alertDisplayer:pendingReminderTracker:", v17, v18, v7->_alertDisplayer, v15);

    v20 = objc_alloc((Class)CUIKCompositeEditor);
    v26[0] = v10;
    v26[1] = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    v22 = objc_msgSend(v20, "initWithEditors:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_model, "undoManager"));
    objc_msgSend(v23, "setUndoableEditor:", v22);

    -[CarplayNavigationController _initializeAndPushListView](v7, "_initializeAndPushListView");
  }

  return v7;
}

- (void)handleURL:(id)a3
{
  id v4;
  CUIKCalendarModel *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v4 = a3;
  v5 = self->_model;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
  if (objc_msgSend(v6, "isEqualToString:", _EKEventURLScheme))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel eventStore](v5, "eventStore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_eventWithURI:checkValid:", v4, 1));

    if (v8)
    {
      v9 = kCalUILogCarplayHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "handling url as showing event:%@", (uint8_t *)&v15, 0xCu);
      }
      -[CarplayNavigationController _dismissPresentedViewController](self, "_dismissPresentedViewController");
      -[CarplayNavigationController _showEvent:animated:](self, "_showEvent:animated:", v8, 1);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("calshow")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourceSpecifier"));
    if (objc_msgSend(v8, "length"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(int)objc_msgSend(v8, "intValue")));
      v11 = kCalUILogCarplayHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "handling url as scrolling to date:%@", (uint8_t *)&v15, 0xCu);
      }
      -[CarplayNavigationController _dismissPresentedViewController](self, "_dismissPresentedViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](v5, "calendar"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeZone"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v10, v13));
      -[CarplayNavigationController _showListScrolledToDate:](self, "_showListScrolledToDate:", v14);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_dismissPresentedViewController
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarplayNavigationController presentedViewController](self, "presentedViewController"));
  if (v4)
    -[CarplayNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v3 = -[CarplayNavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 1);

}

- (void)_showEvent:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  CarplayDetailViewController *v11;
  id v12;
  id v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayNavigationController bottomViewController](self, "bottomViewController"));
  v8 = objc_msgSend(v7, "sectionForEvent:", v6);
  v9 = kCalUILogCarplayHandle;
  v10 = os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_DEBUG);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Showing detail view as modal", buf, 2u);
    }
    v11 = -[CarplayDetailViewController initWithEvent:showDayName:]([CarplayDetailViewController alloc], "initWithEvent:showDayName:", v6, 1);
    v12 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v11);
    v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "_dismissModalView:");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDetailViewController navigationItem](v11, "navigationItem"));
    objc_msgSend(v14, "setLeftBarButtonItem:", v13);

    -[CarplayNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, v4, 0);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Showing detail view on nav stack", v15, 2u);
    }
    objc_msgSend(v7, "setViewControllerTitleForSelectedEventInSection:", v8);
    v11 = -[CarplayDetailViewController initWithEvent:showDayName:]([CarplayDetailViewController alloc], "initWithEvent:showDayName:", v6, 0);
    -[CarplayNavigationController pushViewController:animated:](self, "pushViewController:animated:", v11, v4);
  }

}

- (void)_dismissModalView:(id)a3
{
  -[CarplayNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_showListScrolledToDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarplayNavigationController bottomViewController](self, "bottomViewController"));
  objc_msgSend(v5, "scrollToDate:", v4);

}

- (void)_initializeAndPushListView
{
  CarplayListViewController *v3;

  v3 = -[CarplayListViewController initWithModel:]([CarplayListViewController alloc], "initWithModel:", self->_model);
  -[CarplayNavigationController pushViewController:animated:](self, "pushViewController:animated:", v3, 0);

}

- (id)undoManager
{
  return -[CUIKCalendarModel undoManager](self->_model, "undoManager");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertDisplayer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
