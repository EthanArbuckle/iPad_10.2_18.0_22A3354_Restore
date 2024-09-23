@implementation MFTriageInteraction

+ (MFTriageInteraction)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 query:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = v15;
  if (v13 && v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFTriageInteraction.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(query && selection)"));

  }
  v17 = objc_msgSend(objc_alloc((Class)a1), "initWithQuery:", v16);
  objc_msgSend(v17, "setMessageListItemSelection:", v13);
  objc_msgSend(v17, "setUndoManager:", v14);
  objc_msgSend(v17, "setOrigin:", a5);
  objc_msgSend(v17, "setActor:", a6);

  return (MFTriageInteraction *)v17;
}

+ (MFTriageInteraction)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  return (MFTriageInteraction *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "interactionWithMessageListItemSelection:undoManager:origin:actor:query:", a3, a4, a5, a6, 0));
}

+ (MFTriageInteraction)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v16;

  v11 = a3;
  v12 = a4;
  if (!objc_msgSend(v11, "count"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFTriageInteraction.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageListItems.count"));

  }
  v13 = objc_msgSend(objc_alloc((Class)MSMessageListItemSelection), "initWithMessageListItems:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "interactionWithMessageListItemSelection:undoManager:origin:actor:", v13, v12, a5, a6));

  return (MFTriageInteraction *)v14;
}

+ (MFTriageInteraction)interactionWithQuery:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  return (MFTriageInteraction *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "interactionWithMessageListItemSelection:undoManager:origin:actor:query:", 0, a4, a5, a6, a3));
}

- (MFTriageInteraction)initWithQuery:(id)a3
{
  id v5;
  char *v6;
  MFTriageInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFTriageInteraction;
  v6 = -[MFTriageInteraction init](&v9, "init");
  v7 = (MFTriageInteraction *)v6;
  if (v6)
  {
    *(_WORD *)(v6 + 9) = 257;
    objc_storeStrong((id *)v6 + 7, a3);
  }

  return v7;
}

- (void)performInteraction
{
  -[MFTriageInteraction _performInteractionAfterPreparation:completion:](self, "_performInteractionAfterPreparation:completion:", 0, 0);
}

- (void)_performInteractionBoilerplateWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001BBF90;
    v9[3] = &unk_100522F50;
    v10 = v6;
    v8 = objc_retainBlock(v9);

  }
  else
  {
    v8 = 0;
  }
  -[MFTriageInteraction _performAsynchronousInteractionBoilerplateWithBlock:completion:](self, "_performAsynchronousInteractionBoilerplateWithBlock:completion:", v8, v7);

}

- (void)_performAsynchronousInteractionBoilerplateWithBlock:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD *);
  id v7;
  _QWORD *v8;
  void (**v9)(_QWORD);
  _QWORD v10[5];
  _QWORD *v11;
  id v12;
  _QWORD v13[5];
  BOOL v14;

  v6 = (void (**)(id, _QWORD *))a3;
  v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001BC150;
  v13[3] = &unk_10051C6A8;
  v13[4] = self;
  v14 = v6 != 0;
  v8 = objc_retainBlock(v13);
  v9 = (void (**)(_QWORD))v8;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001BC1C8;
    v10[3] = &unk_100522F78;
    v11 = v8;
    v12 = v7;
    v10[4] = self;
    v6[2](v6, v10);

  }
  else if (v7)
  {
    (*((void (**)(id, MFTriageInteraction *, _QWORD))v7 + 2))(v7, self, 0);
  }
  if (!-[MFTriageInteraction shouldDelayContextualActionHandlerCompletion](self, "shouldDelayContextualActionHandlerCompletion"))v9[2](v9);

}

- (void)performInteractionWithCompletion:(id)a3
{
  -[MFTriageInteraction _performInteractionAfterPreparation:completion:](self, "_performInteractionAfterPreparation:completion:", 0, a3);
}

- (void)_dispatchInteractionWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction triageAction](self, "triageAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction undoManager](self, "undoManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction undoTitle](self, "undoTitle"));
  objc_msgSend(v4, "performWithUndoManager:actionName:completion:", v5, v6, v7);

}

- (BOOL)_requiresConfirmationPrompt
{
  return 0;
}

- (void)_performContinuation:(id)a3 withAlertController:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;
  void *v13;
  void **v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001BC490;
  v19[3] = &unk_10051E438;
  v8 = v6;
  v20 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController mf_actionSheetWithTitle:cancellationHandler:](UIAlertController, "mf_actionSheetWithTitle:cancellationHandler:", 0, v19));
  v10 = -[MFTriageInteraction _preferredAlertActionStyle](self, "_preferredAlertActionStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction title](self, "title"));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1001BC4A0;
  v17 = &unk_10051E438;
  v12 = v8;
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, v10, &v14));
  objc_msgSend(v9, "addAction:", v13, v14, v15, v16, v17);

  v7[2](v7, v9);
}

- (void)_performInteractionIfPermittedWithContinuation:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001BC504;
  v3[3] = &unk_100522FA0;
  v3[4] = self;
  -[MFTriageInteraction _performContinuation:withAlertController:](self, "_performContinuation:withAlertController:", a3, v3);
}

- (void)_presentConfirmationSheet:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction presentationSource](self, "presentationSource"));

  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFTriageInteraction.m"), 152, CFSTR("Presenting a triage interaction confirmation prompt requires a presentationSource."));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewControllerForTriageInteraction:", self));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction presentationSource](self, "presentationSource"));
  objc_msgSend(v10, "mf_presentConfirmationSheetFromViewController:withSource:", v7, v8);

}

- (NSString)title
{
  -[MFTriageInteraction doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFTriageInteraction title]", "MFTriageInteraction.m", 162, "0");
}

- (NSString)accessibilityIdentifer
{
  return 0;
}

- (id)_iconImageName
{
  return 0;
}

- (id)_previewImageName
{
  return 0;
}

- (id)_tintColor
{
  return 0;
}

- (id)_icon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _fillIconImageName](self, "_fillIconImageName"));
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:textStyle:scale:weight:](UIImage, "mf_systemImageNamed:textStyle:scale:weight:", v2, UIFontTextStyleSubheadline, 2, 7));
  else
    v3 = 0;

  return v3;
}

- (UIImage)swipeActionIcon
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _fillIconImageName](self, "_fillIconImageName"));
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v2));
  else
    v3 = 0;

  return (UIImage *)v3;
}

- (UIImage)previewImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _previewImageName](self, "_previewImageName"));
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v2));
  else
    v3 = 0;

  return (UIImage *)v3;
}

- (id)_fillIconImageName
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _iconImageName](self, "_iconImageName"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "rangeOfString:", CFSTR(".fill")) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.fill"), v3));

    v3 = (void *)v4;
  }
  return v3;
}

- (UIColor)color
{
  return (UIColor *)+[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor");
}

- (BOOL)isPermitted
{
  return 1;
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (BOOL)isSelectAll
{
  void *v3;
  unsigned __int8 v4;

  if (!-[MFTriageInteraction supportsSelectAll](self, "supportsSelectAll"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v4 = objc_msgSend(v3, "isSelectAll");

  return v4;
}

- (BOOL)needShrinkAnimationAfterCompletion
{
  return 0;
}

- (int64_t)messageCount
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListItems"));
  v4 = objc_msgSend(v3, "em_messageListItemTotalCount");

  return (int64_t)v4;
}

- (NSString)updateReason
{
  return 0;
}

- (int64_t)_preferredAlertActionStyle
{
  return 0;
}

- (id)alertActionWithCompletion:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = -[MFTriageInteraction _preferredAlertActionStyle](self, "_preferredAlertActionStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction alertTitle](self, "alertTitle"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001BCA48;
  v10[3] = &unk_10051E460;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, v5, v10));

  return v8;
}

- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction swipeTitle](self, "swipeTitle", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction swipeActionIcon](self, "swipeActionIcon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _swipeColor](self, "_swipeColor"));
  v11 = -[MFTriageInteraction isDestructive](self, "isDestructive");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001BCC54;
  v19[3] = &unk_100522FC8;
  v19[4] = self;
  v12 = v6;
  v20 = v12;
  v13 = v7;
  v21 = v13;
  v14 = objc_retainBlock(v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", v11, v8, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithTintColor:renderingMode:", v16, 1));
  objc_msgSend(v15, "setImage:", v17);

  objc_msgSend(v15, "setBackgroundColor:", v10);
  return v15;
}

- (id)menuActionWithCompletion:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction menuActionWithPreparation:completion:](self, "menuActionWithPreparation:completion:", 0, a3));
}

- (id)menuActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (-[MFTriageInteraction includeTitleInMenuAction](self, "includeTitleInMenuAction"))
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction previewTitle](self, "previewTitle"));
  else
    v8 = &stru_100531B00;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction previewImage](self, "previewImage"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001BCE7C;
  v14[3] = &unk_100522FF0;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v14));

  if (-[MFTriageInteraction isDestructive](self, "isDestructive"))
    objc_msgSend(v12, "setAttributes:", 2);

  return v12;
}

- (UIAction)menuAction
{
  return (UIAction *)-[MFTriageInteraction menuActionWithCompletion:](self, "menuActionWithCompletion:", 0);
}

- (UIAlertAction)alertAction
{
  return (UIAlertAction *)-[MFTriageInteraction alertActionWithCompletion:](self, "alertActionWithCompletion:", 0);
}

- (UIContextualAction)swipeAction
{
  return (UIContextualAction *)-[MFTriageInteraction swipeActionWithPreparation:completion:](self, "swipeActionWithPreparation:completion:", 0, 0);
}

- (id)previewActionItemForSwipe:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _icon](self, "_icon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction color](self, "color"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction shortTitle](self, "shortTitle"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction title](self, "title"));
    v4 = 0;
    v5 = 0;
  }
  if (-[MFTriageInteraction isDestructive](self, "isDestructive"))
    v7 = 2;
  else
    v7 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001BD010;
  v10[3] = &unk_100523018;
  v10[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPreviewAction _actionWithTitle:style:color:image:handler:](UIPreviewAction, "_actionWithTitle:style:color:image:handler:", v6, v7, v5, v4, v10));

  return v8;
}

- (MFCardAction)cardAction
{
  return (MFCardAction *)-[MFTriageInteraction cardActionWithCompletion:](self, "cardActionWithCompletion:", 0);
}

- (id)cardActionWithCompletion:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction cardActionWithPreparation:completion:](self, "cardActionWithPreparation:completion:", 0, a3));
}

- (id)cardActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction cardTitle](self, "cardTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction cardShortTitle](self, "cardShortTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _cardActionWithTitle:shortTitle:preparation:completion:](self, "_cardActionWithTitle:shortTitle:preparation:completion:", v8, v9, v6, v7));

  return v10;
}

- (id)_cardActionWithTitle:(id)a3 shortTitle:(id)a4 preparation:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _iconImageName](self, "_iconImageName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction _tintColor](self, "_tintColor"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001BD2B8;
  v21[3] = &unk_100523068;
  v16 = v13;
  v21[4] = self;
  v22 = v16;
  v17 = v12;
  v23 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MFCardAction cardActionWithTitle:shortTitle:imageName:tintColor:handler:](MFCardAction, "cardActionWithTitle:shortTitle:imageName:tintColor:handler:", v10, v11, v14, v15, v21));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction accessibilityIdentifer](self, "accessibilityIdentifer"));
  objc_msgSend(v18, "setAccessibilityIdentifer:", v19);

  return v18;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001BD580;
  v14[3] = &unk_1005225D8;
  v14[4] = self;
  v7 = a4;
  v15 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001BD640;
  v11[3] = &unk_1005230B8;
  v11[4] = self;
  v8 = objc_retainBlock(v14);
  v12 = v8;
  v9 = v6;
  v13 = v9;
  v10 = objc_retainBlock(v11);
  if (-[MFTriageInteraction _requiresConfirmationPrompt](self, "_requiresConfirmationPrompt")
    && -[MFTriageInteraction shouldAskForConfirmation](self, "shouldAskForConfirmation"))
  {
    -[MFTriageInteraction _performInteractionIfPermittedWithContinuation:](self, "_performInteractionIfPermittedWithContinuation:", v10);
  }
  else
  {
    ((void (*)(_QWORD *, uint64_t))v10[2])(v10, 1);
  }

}

- (id)messageRepositoryForTriageAction:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "messageRepositoryForTriageInteraction:") & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageRepositoryForTriageInteraction:", self));
  else
    v5 = 0;

  return v5;
}

- (MFTriageInteractionDelegate)delegate
{
  return (MFTriageInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAskForConfirmation
{
  return self->_shouldAskForConfirmation;
}

- (void)setShouldAskForConfirmation:(BOOL)a3
{
  self->_shouldAskForConfirmation = a3;
}

- (MUIPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSource, a3);
}

- (BOOL)includeTitleInMenuAction
{
  return self->_includeTitleInMenuAction;
}

- (void)setIncludeTitleInMenuAction:(BOOL)a3
{
  self->_includeTitleInMenuAction = a3;
}

- (BOOL)titleIncludesCount
{
  return self->_titleIncludesCount;
}

- (void)setTitleIncludesCount:(BOOL)a3
{
  self->_titleIncludesCount = a3;
}

- (BOOL)titleIncludesAllMessages
{
  return self->_titleIncludesAllMessages;
}

- (void)setTitleIncludesAllMessages:(BOOL)a3
{
  self->_titleIncludesAllMessages = a3;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)actor
{
  return self->_actor;
}

- (void)setActor:(int64_t)a3
{
  self->_actor = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (BOOL)isTriggeredFromMenuAction
{
  return self->_triggeredFromMenuAction;
}

- (void)setTriggeredFromMenuAction:(BOOL)a3
{
  self->_triggeredFromMenuAction = a3;
}

- (MSMessageListItemSelection)messageListItemSelection
{
  return self->_messageListItemSelection;
}

- (void)setMessageListItemSelection:(id)a3
{
  objc_storeStrong((id *)&self->_messageListItemSelection, a3);
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (MSTriageAction)triageAction
{
  return self->_triageAction;
}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_triageAction, a3);
}

- (id)contextualActionHandlerCompletion
{
  return self->_contextualActionHandlerCompletion;
}

- (void)setContextualActionHandlerCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)shouldDelayContextualActionHandlerCompletion
{
  return self->_shouldDelayContextualActionHandlerCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextualActionHandlerCompletion, 0);
  objc_storeStrong((id *)&self->_triageAction, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_messageListItemSelection, 0);
  objc_storeStrong((id *)&self->_presentationSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
