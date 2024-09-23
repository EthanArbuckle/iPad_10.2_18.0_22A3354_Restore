@implementation MFReadLaterTriageInteraction

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteractionState stateWithMessageListItems:](_TtC10MobileMail33MFReadLaterTriageInteractionState, "stateWithMessageListItems:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:state:](MFReadLaterTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:state:", v9, v10, a5, a6, v11));

  return v12;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v11 = a3;
  v12 = a4;
  if (objc_msgSend(v11, "isSelectAll"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFReadLaterTriageInteraction.m"), 38, CFSTR("Select all is not supported"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListItems"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteractionState stateWithMessageListItems:](_TtC10MobileMail33MFReadLaterTriageInteractionState, "stateWithMessageListItems:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFReadLaterTriageInteraction interactionWithMessageListItemSelection:undoManager:origin:actor:state:](MFReadLaterTriageInteraction, "interactionWithMessageListItemSelection:undoManager:origin:actor:state:", v11, v12, a5, a6, v14));
  return v15;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 state:(id)a7
{
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v12 = a7;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___MFReadLaterTriageInteraction;
  v13 = objc_msgSendSuper2(&v16, "interactionWithMessageListItems:undoManager:origin:actor:", a3, a4, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v14, "setState:", v12);

  return v14;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 state:(id)a7
{
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v12 = a7;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___MFReadLaterTriageInteraction;
  v13 = objc_msgSendSuper2(&v16, "interactionWithMessageListItemSelection:undoManager:origin:actor:", a3, a4, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v14, "setState:", v12);

  return v14;
}

- (MFReadLaterTriageInteraction)init
{
  MFReadLaterTriageInteraction *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFReadLaterTriageInteraction;
  result = -[MFReadLaterTriageInteraction init](&v3, "init");
  if (result)
    result->_datePickerPresentationStyle = 7;
  return result;
}

- (id)_alertControllerWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  MFReadLaterTriageInteraction *v15;
  id v16;

  v4 = a3;
  v5 = _EFLocalizedString(CFSTR("Remind Me"), &unk_10059D2A0, &unk_10059D2A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0));

  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10019BF88;
  v13[3] = &unk_1005224F0;
  v8 = v7;
  v14 = v8;
  v15 = self;
  v9 = v4;
  v16 = v9;
  v10 = objc_retainBlock(v13);
  if (+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 19))((void (*)(_QWORD *, _QWORD, _QWORD))v10[2])(v10, 0, 0);
  ((void (*)(_QWORD *, uint64_t, _QWORD))v10[2])(v10, 1, 0);
  if ((+[MSSendLaterContext contextForCurrentDate](MSSendLaterContext, "contextForCurrentDate") & 4) != 0)((void (*)(_QWORD *, uint64_t, _QWORD))v10[2])(v10, 2, 0);
  ((void (*)(_QWORD *, uint64_t, _QWORD))v10[2])(v10, 3, 0);
  ((void (*)(_QWORD *, uint64_t, _QWORD))v10[2])(v10, 4, 0);
  ((void (*)(_QWORD *, uint64_t, uint64_t))v10[2])(v10, 5, 1);
  v11 = v8;

  return v11;
}

- (UIMenu)menu
{
  return (UIMenu *)-[MFReadLaterTriageInteraction _menuWithPreparation:completion:](self, "_menuWithPreparation:completion:", 0, 0);
}

- (id)menuWithCompletion:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction _menuWithPreparation:completion:](self, "_menuWithPreparation:completion:", 0, a3));
}

- (id)_menuWithPreparation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10019C324;
  v26[3] = &unk_100522540;
  v26[4] = self;
  v8 = v6;
  v27 = v8;
  v9 = v7;
  v28 = v9;
  v10 = objc_retainBlock(v26);
  v11 = objc_alloc_init((Class)NSMutableArray);
  if (+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 19))
  {
    v12 = ((uint64_t (*)(_QWORD *, _QWORD))v10[2])(v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "addObject:", v13);

  }
  v14 = ((uint64_t (*)(_QWORD *, uint64_t))v10[2])(v10, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v11, "addObject:", v15);

  if ((+[MSSendLaterContext contextForCurrentDate](MSSendLaterContext, "contextForCurrentDate") & 4) != 0)
  {
    v16 = ((uint64_t (*)(_QWORD *, uint64_t))v10[2])(v10, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v11, "addObject:", v17);

  }
  v18 = ((uint64_t (*)(_QWORD *, uint64_t))v10[2])(v10, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v11, "addObject:", v19);

  v20 = ((uint64_t (*)(_QWORD *, uint64_t))v10[2])(v10, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v11, "addObject:", v21);

  v22 = _EFLocalizedString(CFSTR("Remind Me"), &unk_10059D2A0, &unk_10059D2A8);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v23, 0, 0, 0, v11));

  return v24;
}

- (void)_performReadLaterAction:(int64_t)a3 preparation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
  objc_msgSend(v10, "perform:", a3);
  if (objc_msgSend(v10, "shouldPresentCustomDatePicker"))
  {
    -[MFReadLaterTriageInteraction _presentCustomDatePickerWithPreparation:completion:](self, "_presentCustomDatePickerWithPreparation:completion:", 0, v9);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MFReadLaterTriageInteraction;
    -[MFTriageInteraction _performInteractionAfterPreparation:completion:](&v11, "_performInteractionAfterPreparation:completion:", v8, v9);
  }

}

- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = -[MFReadLaterTriageInteraction isDestructive](self, "isDestructive");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction shortTitle](self, "shortTitle"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10019C7A0;
  v19[3] = &unk_100522568;
  objc_copyWeak(&v22, &location);
  v10 = v6;
  v20 = v10;
  v11 = v7;
  v21 = v11;
  v19[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", v8, v9, v19));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction color](self, "color"));
  objc_msgSend(v12, "setBackgroundColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction swipeActionIcon](self, "swipeActionIcon"));
  objc_msgSend(v12, "setImage:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
  v16 = objc_msgSend(v15, "isInitialState");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction _menuWithPreparation:completion:](self, "_menuWithPreparation:completion:", v10, v11));
    objc_msgSend(v12, "_setMenu:", v17);

  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10019C968;
  v10[3] = &unk_100522590;
  v10[4] = self;
  v7 = a4;
  v11 = v7;
  v8 = v6;
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v9, "performBlock:", v10);

}

- (id)triageAction
{
  MSTriageAction *triageAction;
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  MSTriageAction *v11;
  MSTriageAction *v12;

  triageAction = self->_triageAction;
  if (!triageAction)
  {
    v4 = objc_alloc((Class)MSReadLaterTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    v6 = -[MFTriageInteraction origin](self, "origin");
    v7 = -[MFTriageInteraction actor](self, "actor");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ec_integerDate"));
    v11 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:readLaterDate:", v5, v6, v7, self, v10);
    v12 = self->_triageAction;
    self->_triageAction = v11;

    triageAction = self->_triageAction;
  }
  return triageAction;
}

- (id)localizedStringForAction:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)a3 > 5)
    return 0;
  v3 = _EFLocalizedString(*(&off_1005225F8 + a3), &unk_10059D2A0, &unk_10059D2A8);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerRemindMe;
}

- (id)shortTitle
{
  const __CFString *v2;
  uint64_t v3;

  if (-[MFReadLaterTriageInteraction isRemoveReadLater](self, "isRemoveReadLater"))
    v2 = CFSTR("Clear");
  else
    v2 = CFSTR("Remind Me");
  v3 = _EFLocalizedString(v2, &unk_10059D2A0, &unk_10059D2A8);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)title
{
  const __CFString *v2;
  uint64_t v3;

  if (-[MFReadLaterTriageInteraction _hasReadLater](self, "_hasReadLater"))
    v2 = CFSTR("Edit Reminder");
  else
    v2 = CFSTR("Remind Me");
  v3 = _EFLocalizedString(v2, &unk_10059D2A0, &unk_10059D2A8);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)color
{
  void *v2;

  if (-[MFReadLaterTriageInteraction isRemoveReadLater](self, "isRemoveReadLater"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailRemoveReminderColor](UIColor, "mailRemoveReminderColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailReadLaterActionColor](UIColor, "mailReadLaterActionColor"));
  return v2;
}

- (id)_iconImageName
{
  id *v3;
  unsigned int v4;

  if (-[MFReadLaterTriageInteraction isRemoveReadLater](self, "isRemoveReadLater"))
  {
    v3 = (id *)&MFImageGlyphRemoveReadLater;
  }
  else
  {
    v4 = -[MFReadLaterTriageInteraction _hasReadLater](self, "_hasReadLater");
    v3 = (id *)&MFImageGlyphUpdateReadLater;
    if (!v4)
      v3 = (id *)&MFImageGlyphReadLater;
  }
  return *v3;
}

- (BOOL)hasReadLater
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
  v3 = objc_msgSend(v2, "hasReadLater");

  return v3;
}

- (BOOL)isRemoveReadLater
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
  v3 = objc_msgSend(v2, "isRemoveDate");

  return v3;
}

- (BOOL)_hasReadLater
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItems"));
  v4 = objc_msgSend(v3, "ef_any:", &stru_1005225B0);

  return v4;
}

- (id)_initialReadLaterDate
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItems"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "readLater"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));

      if (v8)
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

- (BOOL)isPresentCustom
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
  v3 = objc_msgSend(v2, "shouldPresentCustomDatePicker");

  return v3;
}

- (void)_presentCustomDatePickerWithPreparation:(id)a3 completion:(id)a4
{
  id v6;
  MFReadLaterTriageInteraction *v7;
  id v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  MFReadLaterTriageInteraction *v22;
  id v23;

  v6 = a4;
  -[MFReadLaterTriageInteraction setDatePickerPreparation:](self, "setDatePickerPreparation:", a3);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_10019D264;
  v21 = &unk_1005225D8;
  v7 = self;
  v22 = v7;
  v8 = v6;
  v23 = v8;
  -[MFReadLaterTriageInteraction setDatePickerCompletion:](v7, "setDatePickerCompletion:", &v18);
  v9 = objc_alloc((Class)MFDatePickerViewController);
  v10 = -[MFReadLaterTriageInteraction _hasReadLater](v7, "_hasReadLater", v18, v19, v20, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction _initialReadLaterDate](v7, "_initialReadLaterDate"));
  v12 = objc_msgSend(v9, "initWithType:shouldShowDeleteButton:initialDate:", 1, v10, v11);

  objc_msgSend(v12, "setDelegate:", v7);
  v13 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v12);
  objc_msgSend(v13, "setModalPresentationStyle:", -[MFReadLaterTriageInteraction datePickerPresentationStyle](v7, "datePickerPresentationStyle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction presentationSource](v7, "presentationSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "popoverPresentationController"));
  objc_msgSend(v14, "mui_setAsSourceForPopoverPresentationController:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](v7, "delegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presentingViewControllerForTriageInteraction:", v7));

  objc_msgSend(v17, "presentViewController:animated:completion:", v13, 1, 0);
}

- (NSDate)selectedDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "date"));

  return (NSDate *)v3;
}

- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
  objc_msgSend(v8, "didSelectCustomDate:", v7);

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction datePickerCompletion](self, "datePickerCompletion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction datePickerPreparation](self, "datePickerPreparation"));
  v11.receiver = self;
  v11.super_class = (Class)MFReadLaterTriageInteraction;
  -[MFTriageInteraction _performInteractionAfterPreparation:completion:](&v11, "_performInteractionAfterPreparation:completion:", v10, v9);

  -[MFReadLaterTriageInteraction setDatePickerCompletion:](self, "setDatePickerCompletion:", 0);
}

- (void)datePickerViewControllerDidDeleteDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction state](self, "state"));
  objc_msgSend(v5, "removeDate");

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction datePickerCompletion](self, "datePickerCompletion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFReadLaterTriageInteraction datePickerPreparation](self, "datePickerPreparation"));
  v8.receiver = self;
  v8.super_class = (Class)MFReadLaterTriageInteraction;
  -[MFTriageInteraction _performInteractionAfterPreparation:completion:](&v8, "_performInteractionAfterPreparation:completion:", v7, v6);

  -[MFReadLaterTriageInteraction setDatePickerCompletion:](self, "setDatePickerCompletion:", 0);
  -[MFReadLaterTriageInteraction setDatePickerPreparation:](self, "setDatePickerPreparation:", 0);

}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_triageAction, a3);
}

- (_TtC10MobileMail33MFReadLaterTriageInteractionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (int64_t)datePickerPresentationStyle
{
  return self->_datePickerPresentationStyle;
}

- (void)setDatePickerPresentationStyle:(int64_t)a3
{
  self->_datePickerPresentationStyle = a3;
}

- (id)datePickerPreparation
{
  return self->_datePickerPreparation;
}

- (void)setDatePickerPreparation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)datePickerCompletion
{
  return self->_datePickerCompletion;
}

- (void)setDatePickerCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_datePickerCompletion, 0);
  objc_storeStrong(&self->_datePickerPreparation, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
