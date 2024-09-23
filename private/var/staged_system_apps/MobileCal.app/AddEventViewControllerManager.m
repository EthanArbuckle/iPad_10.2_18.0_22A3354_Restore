@implementation AddEventViewControllerManager

- (AddEventViewControllerManager)initWithCalendarModel:(id)a3
{
  id v5;
  AddEventViewControllerManager *v6;
  AddEventViewControllerManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AddEventViewControllerManager;
  v6 = -[AddEventViewControllerManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (NSString)newItemTitle
{
  void *v2;
  NSString *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NewEventItemTitle"), CFSTR("Event"), 0));

  return v3;
}

- (NSString)newItemBackButtonTitle
{
  void *v2;
  NSString *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NewEventItemBackButtonTitle"), CFSTR("New Event"), 0));

  return v3;
}

- (id)createViewController:(id)a3
{
  EKEventEditViewControllerImpl *viewController;
  id v5;
  EKEventEditViewControllerImpl *v6;
  EKEventEditViewControllerImpl *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDate *v16;
  NSDate *originalStartDate;

  viewController = self->_viewController;
  if (!viewController)
  {
    v5 = a3;
    v6 = (EKEventEditViewControllerImpl *)objc_claimAutoreleasedReturnValue(+[EKEventEditViewController editViewControllerImplementation](EKEventEditViewController, "editViewControllerImplementation"));
    v7 = self->_viewController;
    self->_viewController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addItemState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "event"));
    -[EKEventEditViewControllerImpl setEvent:](self->_viewController, "setEvent:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addItemState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "event"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventStore"));
    -[EKEventEditViewControllerImpl setEventStore:](self->_viewController, "setEventStore:", v12);

    -[EKEventEditViewControllerImpl setEditViewDelegate:](self->_viewController, "setEditViewDelegate:", self);
    -[EKEventEditViewControllerImpl setTimeImplicitlySet:](self->_viewController, "setTimeImplicitlySet:", objc_msgSend(v5, "creationMethod") == (id)2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionKey"));
    -[EKEventEditViewControllerImpl setSuggestionKey:](self->_viewController, "setSuggestionKey:", v13);

    -[EKEventEditViewControllerImpl setEventCreationMethod:](self->_viewController, "setEventCreationMethod:", objc_msgSend(v5, "creationMethod"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addItemState"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "event"));
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
    originalStartDate = self->_originalStartDate;
    self->_originalStartDate = v16;

    viewController = self->_viewController;
  }
  return viewController;
}

- (void)updateUIFromState:(id)a3
{
  -[EKEventEditViewControllerImpl refreshUIForUpdatedEvent](self->_viewController, "refreshUIForUpdatedEvent", a3);
}

- (void)updateStateFromUI:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKEventEditViewControllerImpl event](self->_viewController, "event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  LOBYTE(self) = objc_msgSend(v5, "isEqualToDate:", self->_originalStartDate);

  if ((self & 1) == 0)
    objc_msgSend(v6, "setExplicitTime:", 1);

}

- (UIViewController)viewController
{
  return (UIViewController *)self->_viewController;
}

- (id)_eventEditorForTestingOnly
{
  return -[EKEventEditViewControllerImpl _eventEditorForTestingOnly](self->_viewController, "_eventEditorForTestingOnly");
}

- (void)setEditorBackgroundColor:(id)a3
{
  -[EKEventEditViewControllerImpl setEditorBackgroundColor:](self->_viewController, "setEditorBackgroundColor:", a3);
}

- (BOOL)canDismiss
{
  return -[EKEventEditViewControllerImpl isModalInPresentation](self->_viewController, "isModalInPresentation") ^ 1;
}

- (id)confirmDismissAlertController
{
  return -[EKEventEditViewControllerImpl confirmDismissAlertController](self->_viewController, "confirmDismissAlertController");
}

- (void)presentationControllerDidAttemptToDismiss
{
  -[EKEventEditViewControllerImpl presentationControllerDidAttemptToDismiss](self->_viewController, "presentationControllerDidAttemptToDismiss");
}

- (BOOL)hasUnsavedChanges
{
  return -[EKEventEditViewControllerImpl hasUnsavedChanges](self->_viewController, "hasUnsavedChanges");
}

- (BOOL)willPresentDialogOnSave
{
  return -[EKEventEditViewControllerImpl willPresentDialogOnSave](self->_viewController, "willPresentDialogOnSave");
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  -[EKEventEditViewControllerImpl completeAndSaveWithContinueBlock:](self->_viewController, "completeAndSaveWithContinueBlock:", a3);
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  -[EKEventEditViewControllerImpl setIgnoreUnsavedChanges:](self->_viewController, "setIgnoreUnsavedChanges:", a3);
}

- (BOOL)ignoreUnsavedChanges
{
  return -[EKEventEditViewControllerImpl ignoreUnsavedChanges](self->_viewController, "ignoreUnsavedChanges");
}

- (void)cancelEditing
{
  -[EKEventEditViewControllerImpl cancelEditing](self->_viewController, "cancelEditing");
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_addItemViewControllerManagerDelegate);
  objc_msgSend(WeakRetained, "addItemViewControllerManager:didCompleteWithAction:", self, a4);

}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_addItemViewControllerManagerDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pasteboardManager"));

  return v4;
}

- (id)calendarModel
{
  return self->_model;
}

- (void)attemptDisplayReviewPrompt
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_addItemViewControllerManagerDelegate);
  objc_msgSend(WeakRetained, "attemptDisplayReviewPrompt");

}

- (AddItemViewControllerManagerDelegate)addItemViewControllerManagerDelegate
{
  return (AddItemViewControllerManagerDelegate *)objc_loadWeakRetained((id *)&self->_addItemViewControllerManagerDelegate);
}

- (void)setAddItemViewControllerManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_addItemViewControllerManagerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_addItemViewControllerManagerDelegate);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_originalStartDate, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
