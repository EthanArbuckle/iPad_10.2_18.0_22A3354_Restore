@implementation DraftGestureHelper

- (DraftGestureHelper)initWithConversationViewController:(id)a3 scene:(id)a4
{
  id v6;
  id v7;
  DraftGestureHelper *v8;
  DraftGestureHelper *v9;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *draftTapGesture;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DraftGestureHelper;
  v8 = -[DraftGestureHelper init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_conversationViewController, v6);
    v10 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v9, "_tapRecognized:");
    draftTapGesture = v9->_draftTapGesture;
    v9->_draftTapGesture = v10;

    -[UITapGestureRecognizer setDelegate:](v9->_draftTapGesture, "setDelegate:", v9);
    objc_storeWeak((id *)&v9->_scene, v7);
  }

  return v9;
}

- (void)enableGesture:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DraftGestureHelper conversationViewController](self, "conversationViewController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DraftGestureHelper draftTapGesture](self, "draftTapGesture"));
  if (v3)
    objc_msgSend(v7, "addGestureRecognizer:", v6);
  else
    objc_msgSend(v7, "removeGestureRecognizer:", v6);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v4;
  uint64_t v5;
  char isKindOfClass;

  v4 = a4;
  v5 = objc_opt_class(UIPanGestureRecognizer);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  return isKindOfClass & 1;
}

- (void)_tapRecognized:(id)a3
{
  void *v4;
  unsigned __int8 v5;
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
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = (id)objc_claimAutoreleasedReturnValue(-[DraftGestureHelper conversationViewController](self, "conversationViewController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "collectionView"));
  v5 = objc_msgSend(v4, "isDecelerating");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "referenceMessageListItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailboxProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxObjectIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legacyMailboxForObjectID:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFComposeMailMessage legacyMessageWithMessage:mailboxUid:](MFComposeMailMessage, "legacyMessageWithMessage:mailboxUid:", v8, v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    v17 = objc_msgSend(v16, "type");

    if (v17 == (id)5)
      v18 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initDraftRestoreOfMessage:legacyMessage:", v8, v14);
    else
      v18 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initOutboxRestoreOfMessage:legacyMessage:", v8, v14);
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DraftGestureHelper scene](self, "scene"));
    objc_msgSend(v20, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v19, 1, 0, 0, 0);

  }
}

- (UITapGestureRecognizer)draftTapGesture
{
  return self->_draftTapGesture;
}

- (void)setDraftTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_draftTapGesture, a3);
}

- (ConversationViewController)conversationViewController
{
  return (ConversationViewController *)objc_loadWeakRetained((id *)&self->_conversationViewController);
}

- (void)setConversationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_conversationViewController, a3);
}

- (ComposeCapable)scene
{
  return (ComposeCapable *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_conversationViewController);
  objc_storeStrong((id *)&self->_draftTapGesture, 0);
}

@end
