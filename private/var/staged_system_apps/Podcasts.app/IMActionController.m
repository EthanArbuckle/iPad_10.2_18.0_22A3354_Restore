@implementation IMActionController

- (IMActionController)initWithDelegate:(id)a3
{
  id v4;
  IMActionController *v5;
  IMActionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMActionController;
  v5 = -[IMActionController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)setActionObject:(id)a3
{
  -[IMActionController setActionObject:reloadActions:](self, "setActionObject:reloadActions:", a3, 1);
}

- (void)setActionObject:(id)a3 reloadActions:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  objc_storeStrong((id *)&self->_actionObject, a3);
  if (a3)
  {
    if (v4)
      -[IMActionController reloadActions](self, "reloadActions");
  }
}

- (void)reloadActions
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMActionController allActions](self, "allActions"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000599D8;
  v6[3] = &unk_1004A6D60;
  v6[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexesOfObjectsPassingTest:", v6));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectsAtIndexes:", v3));
  -[IMActionController setAvailableActions:](self, "setAvailableActions:", v4);

}

- (id)presentAvailableActionsFromView:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self, "moreAction"));
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionBlock"));
  ((void (**)(_QWORD, IMActionController *, id))v6)[2](v6, self, v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertController"));
  return v7;
}

- (void)prepareForReuse
{
  void *v3;

  -[IMActionController setDelegate:](self, "setDelegate:", 0);
  -[IMActionController dismissActionSheetsAndPopovers](self, "dismissActionSheetsAndPopovers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self, "moreAction"));
  objc_msgSend(v3, "setAlertController:", 0);

  -[IMActionController setActionObject:](self, "setActionObject:", 0);
}

- (void)updateActionSheetsAndPopovers
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController availableActions](self, "availableActions"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059B9C;
  v5[3] = &unk_1004A6DC8;
  v6 = &stru_1004A6DA0;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self, "moreAction"));
  sub_100059B40(v4, v4);

}

- (void)dismissActionSheetsAndPopovers
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController availableActions](self, "availableActions"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059C98;
  v5[3] = &unk_1004A6DC8;
  v6 = &stru_1004A6DE8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActionController moreAction](self, "moreAction"));
  sub_100059C3C(v4, v4);

}

- (void)setAvailableActions:(id)a3
{
  NSArray *v4;
  NSArray *availableActions;

  v4 = (NSArray *)a3;
  -[IMActionController registerActions:](self, "registerActions:", v4);
  availableActions = self->_availableActions;
  self->_availableActions = v4;

}

- (void)registerActions:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100059D34;
  v3[3] = &unk_1004A6E10;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (id)createMoreAction
{
  IMActionSheetAction *v2;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *, void *);
  void *v7;
  id v8;
  id location;

  v2 = -[IMAction initWithTitle:icon:]([IMActionSheetAction alloc], "initWithTitle:icon:", 0, 0);
  objc_initWeak(&location, v2);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_100059E18;
  v7 = &unk_1004A6108;
  objc_copyWeak(&v8, &location);
  -[IMAction setActionBlock:](v2, "setActionBlock:", &v4);
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_1004A6E30, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

- (IMActionSheetAction)moreAction
{
  IMActionSheetAction *moreAction;
  IMActionSheetAction *v4;
  IMActionSheetAction *v5;

  moreAction = self->_moreAction;
  if (!moreAction)
  {
    v4 = (IMActionSheetAction *)objc_claimAutoreleasedReturnValue(-[IMActionController createMoreAction](self, "createMoreAction"));
    v5 = self->_moreAction;
    self->_moreAction = v4;

    -[IMAction setController:](self->_moreAction, "setController:", self);
    moreAction = self->_moreAction;
  }
  return moreAction;
}

- (NSObject)actionObject
{
  return self->_actionObject;
}

- (IMActionControllerDelegate)delegate
{
  return (IMActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setMoreAction:(id)a3
{
  objc_storeStrong((id *)&self->_moreAction, a3);
}

- (NSArray)allActions
{
  return self->_allActions;
}

- (void)setAllActions:(id)a3
{
  objc_storeStrong((id *)&self->_allActions, a3);
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_allActions, 0);
  objc_storeStrong((id *)&self->_moreAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionObject, 0);
}

@end
