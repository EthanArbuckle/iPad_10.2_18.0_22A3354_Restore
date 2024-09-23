@implementation MFMoveToPredictionTriageInteraction

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 presentationSource:(id)a7 delegate:(id)a8 presentingViewController:(id)a9 predictedMailbox:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v16 = a3;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v32.receiver = a1;
  v32.super_class = (Class)&OBJC_METACLASS___MFMoveToPredictionTriageInteraction;
  v21 = objc_msgSendSuper2(&v32, "interactionWithMessageListItems:undoManager:origin:actor:", v16, a4, a5, a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "setTransferUIViewController:", v19);
    objc_msgSend(v23, "setDelegate:", v18);
    objc_msgSend(v23, "setPresentationSource:", v17);
    if (v20)
    {
      objc_msgSend(v23, "setPrediction:", v20);
    }
    else
    {
      objc_msgSend(v23, "setPrediction:", 0);
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v23);
      v26 = _NSConcreteStackBlock;
      v27 = 3221225472;
      v28 = sub_10018F9B0;
      v29 = &unk_100522170;
      objc_copyWeak(&v30, &location);
      v24 = objc_msgSend(a1, "predictMailboxForMovingMessages:completionHandler:", v16, &v26);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v23, "setCanHavePrediction:", 1, v26, v27, v28, v29);
  }

  return v23;
}

+ (id)predictMailboxForMovingMessages:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemonInterface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageRepository"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10018FB38;
  v13[3] = &unk_100522198;
  v10 = v6;
  v14 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predictMailboxForMovingMessages:completionHandler:", v5, v13));

  return v11;
}

+ (id)predictMailboxForMovingMessages:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageRepository"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10018FDBC;
  v16[3] = &unk_1005221C0;
  v8 = v4;
  v17 = v8;
  v9 = v3;
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predictMailboxForMovingMessages:completionHandler:", v9, v16));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "future"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10018FE98;
  v14[3] = &unk_10051B140;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "addFailureBlock:", v14);

  return v11;
}

+ (id)predictMailboxForMovingMessagesWithIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageRepository"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001900D0;
  v16[3] = &unk_1005221C0;
  v8 = v4;
  v17 = v8;
  v9 = v3;
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predictMailboxForMovingMessagesWithIDs:completionHandler:", v9, v16));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "future"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100190190;
  v14[3] = &unk_10051B140;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "addFailureBlock:", v14);

  return v11;
}

- (void)moveToTargetEMMailbox:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[MFMoveMessageTriageInteraction setTargetMailbox:](self, "setTargetMailbox:", v4);
  v5.receiver = self;
  v5.super_class = (Class)MFMoveToPredictionTriageInteraction;
  -[MFTriageInteraction _performInteractionAfterPreparation:completion:](&v5, "_performInteractionAfterPreparation:completion:", 0, 0);

}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v5;

  v5 = a4;
  if (-[MFMoveToPredictionTriageInteraction hasPrediction](self, "hasPrediction"))
    -[MFMoveToPredictionTriageInteraction _presentFollowUpActionSheetWithCompletion:](self, "_presentFollowUpActionSheetWithCompletion:", v5);
  else
    -[MFMoveToPredictionTriageInteraction _presentTransferUI](self, "_presentTransferUI");

}

- (id)previewActionItemForSwipe:(BOOL)a3
{
  id v4;
  void *v6;
  void *v7;
  objc_super v8;

  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFMoveToPredictionTriageInteraction;
    v4 = -[MFTriageInteraction previewActionItemForSwipe:](&v8, "previewActionItemForSwipe:", 1);
    return (id)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoveMessageTriageInteraction title](self, "title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_MFLazyPreviewActionItem previewActionItemWithTitle:dataSource:](_MFLazyPreviewActionItem, "previewActionItemWithTitle:dataSource:", v6, self));

    return v7;
  }
}

- (id)lazyPreviewActions
{
  NSArray *v3;
  NSArray *previewActions;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[4];
  NSArray *v10;

  if (!self->_previewActions)
  {
    if (-[MFMoveToPredictionTriageInteraction hasPrediction](self, "hasPrediction"))
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100190450;
      v9[3] = &unk_100522210;
      v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
      v10 = v3;
      -[MFMoveToPredictionTriageInteraction _enumeratePredictionActions:](self, "_enumeratePredictionActions:", v9);
      previewActions = self->_previewActions;
      self->_previewActions = v3;
      v5 = v3;

    }
    else
    {
      v6 = (NSArray *)objc_alloc_init((Class)NSArray);
      v7 = self->_previewActions;
      self->_previewActions = v6;

    }
  }
  return self->_previewActions;
}

- (id)lazyPreviewActionHandler
{
  id previewActionHandler;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  previewActionHandler = self->_previewActionHandler;
  if (!previewActionHandler)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100190608;
    v7[3] = &unk_100522238;
    objc_copyWeak(&v8, &location);
    v4 = objc_msgSend(v7, "copy");
    v5 = self->_previewActionHandler;
    self->_previewActionHandler = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    previewActionHandler = self->_previewActionHandler;
  }
  return objc_retainBlock(previewActionHandler);
}

- (BOOL)needShrinkAnimationAfterCompletion
{
  return 1;
}

- (id)cardActionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  MFMoveToPredictionTriageInteraction *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v4 = a3;
  if (-[MFMoveToPredictionTriageInteraction hasPrediction](self, "hasPrediction"))
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001908A0;
    v22[3] = &unk_100522288;
    v22[4] = self;
    v24 = v4;
    v6 = v5;
    v23 = v6;
    -[MFMoveToPredictionTriageInteraction _enumeratePredictionActions:](self, "_enumeratePredictionActions:", v22);
    v7 = objc_msgSend(v6, "copy");

    v8 = v24;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoveMessageTriageInteraction cardTitle](self, "cardTitle"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_stringByTrimmingWhitespaceAndNewlineCharacters"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoveMessageTriageInteraction _iconImageName](self, "_iconImageName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _tintColor](self, "_tintColor"));
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_100190A8C;
    v19 = &unk_1005222B0;
    v20 = self;
    v21 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFCardAction cardActionWithTitle:shortTitle:imageName:tintColor:handler:](MFCardAction, "cardActionWithTitle:shortTitle:imageName:tintColor:handler:", v6, 0, v10, v11, &v16));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoveMessageTriageInteraction accessibilityIdentifer](self, "accessibilityIdentifer"));
    objc_msgSend(v12, "setAccessibilityIdentifer:", v13);

    v14 = objc_alloc((Class)NSArray);
    v7 = objc_msgSend(v14, "initWithObjects:", v12, 0, v16, v17, v18, v19);

    v8 = v21;
  }

  return v7;
}

- (id)alertActionsWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  if (-[MFMoveToPredictionTriageInteraction hasPrediction](self, "hasPrediction"))
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100190C34;
    v9[3] = &unk_100522300;
    v11 = v4;
    v9[4] = self;
    v6 = v5;
    v10 = v6;
    -[MFMoveToPredictionTriageInteraction _enumeratePredictionActions:](self, "_enumeratePredictionActions:", v9);
    v7 = objc_msgSend(v6, "copy");

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction alertActionWithCompletion:](self, "alertActionWithCompletion:", v4));
    v12 = v6;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  }

  return v7;
}

- (BOOL)hasPrediction
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoveToPredictionTriageInteraction prediction](self, "prediction"));
  v3 = v2 != 0;

  return v3;
}

- (id)_mailboxForObjectID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemonInterface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxRepository"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxForObjectID:", v3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));

  return v8;
}

- (void)_enumeratePredictionActions:(id)a3
{
  id v4;
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
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MOVE_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, -[MFTriageInteraction messageCount](self, "messageCount")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_100531B00, CFSTR("Main")));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100191108;
  v17[3] = &unk_10051AA98;
  v17[4] = self;
  (*((void (**)(id, void *, _QWORD, _QWORD *))v4 + 2))(v4, v9, 0, v17);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoveToPredictionTriageInteraction prediction](self, "prediction"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MOVE_TO"), &stru_100531B00, CFSTR("Main")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100191110;
    v15[3] = &unk_10051A910;
    v15[4] = self;
    v16 = v10;
    (*((void (**)(id, void *, uint64_t, _QWORD *))v4 + 2))(v4, v14, 1, v15);

  }
}

- (void)_presentTransferUI
{
  MFTriageInteractionDelegate *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFMoveToPredictionTriageInteraction;
  v3 = -[MFTriageInteraction delegate](&v10, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___MFMoveToPredictionTriageInteractionDelegate))
  {
    -[MFMoveMessageTriageInteraction setDidPresentTransferUI:](self, "setDidPresentTransferUI:", 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoveToPredictionTriageInteraction prediction](self, "prediction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMoveToPredictionTriageInteraction transferUIViewController](self, "transferUIViewController"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100191298;
    v7[3] = &unk_10051B1B8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "presentTransferUIWithMoveInteraction:prediction:fromViewController:didDismissHandler:", self, v5, v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)_presentFollowUpActionSheetWithCompletion:(id)a3
{
  Block_layout *v4;
  Block_layout *v5;
  Block_layout *v6;
  id v7;
  Block_layout *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  MFMoveToPredictionTriageInteraction *v15;
  Block_layout *v16;
  _QWORD v17[5];
  Block_layout *v18;

  v4 = (Block_layout *)a3;
  v5 = &stru_100522368;
  if (v4)
    v5 = v4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100191540;
  v17[3] = &unk_100522390;
  v6 = v5;
  v17[4] = self;
  v18 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100191554;
  v13[3] = &unk_100522288;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController mf_actionSheetWithTitle:cancellationHandler:](UIAlertController, "mf_actionSheetWithTitle:cancellationHandler:", 0, v17));
  v14 = v7;
  v8 = v6;
  v15 = self;
  v16 = v8;
  -[MFMoveToPredictionTriageInteraction _enumeratePredictionActions:](self, "_enumeratePredictionActions:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("MFMoveToPredictionTriageInteractionPredictionPresented"), self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentingViewControllerForTriageInteraction:", self));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction presentationSource](self, "presentationSource"));
  objc_msgSend(v7, "mf_presentFromViewController:withSource:", v11, v12);

}

- (EMMailbox)prediction
{
  return self->_prediction;
}

- (void)setPrediction:(id)a3
{
  objc_storeStrong((id *)&self->_prediction, a3);
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UIViewController)transferUIViewController
{
  return self->_transferUIViewController;
}

- (void)setTransferUIViewController:(id)a3
{
  objc_storeStrong((id *)&self->_transferUIViewController, a3);
}

- (NSArray)previewActions
{
  return self->_previewActions;
}

- (void)setPreviewActions:(id)a3
{
  objc_storeStrong((id *)&self->_previewActions, a3);
}

- (id)previewActionHandler
{
  return self->_previewActionHandler;
}

- (void)setPreviewActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previewActionHandler, 0);
  objc_storeStrong((id *)&self->_previewActions, 0);
  objc_storeStrong((id *)&self->_transferUIViewController, 0);
  objc_storeStrong(&self->_didDismissHandler, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
}

@end
