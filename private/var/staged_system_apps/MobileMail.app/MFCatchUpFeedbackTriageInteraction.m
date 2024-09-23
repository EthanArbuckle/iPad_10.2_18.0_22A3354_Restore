@implementation MFCatchUpFeedbackTriageInteraction

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014B014;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA088 != -1)
    dispatch_once(&qword_1005AA088, block);
  return (OS_os_log *)(id)qword_1005AA080;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  MFCatchUpFeedbackTriageInteraction *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFCatchUpFeedbackTriageInteraction title](self, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFCatchUpFeedbackTriageInteraction _iconImageName](self, "_iconImageName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFCatchUpFeedbackCardHeaderAction cardActionWithTitle:shortTitle:imageName:tintColor:handler:](MFCatchUpFeedbackCardHeaderAction, "cardActionWithTitle:shortTitle:imageName:tintColor:handler:", v5, 0, v6, 0, &stru_100520880));

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10014B1EC;
  v14 = &unk_1005208A8;
  v15 = self;
  v8 = v4;
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFCatchUpFeedbackCardAction cardActionWithTitle:shortTitle:imageName:tintColor:handler:](MFCatchUpFeedbackCardAction, "cardActionWithTitle:shortTitle:imageName:tintColor:handler:", 0, 0, 0, 0, &v11));
  objc_msgSend(v7, "setFeedbackAction:", v9, v11, v12, v13, v14, v15);

  return v7;
}

- (id)title
{
  return (id)_EFLocalizedString(CFSTR("Share Summary Feedback"), &unk_10059D2A0, &unk_10059D2A8);
}

- (id)_iconImageName
{
  return MFImageGlyphCatchUpFeedback;
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (void)performInteractionWithType:(int64_t)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;
  objc_super v25;
  uint8_t buf[24];

  v25.receiver = self;
  v25.super_class = (Class)MFCatchUpFeedbackTriageInteraction;
  -[MFTriageInteraction performInteractionWithCompletion:](&v25, "performInteractionWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "generatedSummary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageItemID"));

  if (v10)
  {
    v11 = objc_alloc((Class)EMMessageObjectID);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[EMMailboxScope allMailboxesScope](EMMailboxScope, "allMailboxesScope"));
    v13 = objc_msgSend(v11, "initWithCollectionItemID:mailboxScope:", v10, v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "messageRepositoryForTriageInteraction:", self));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presentingViewControllerForTriageInteraction:", self));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "messageForObjectID:", v13));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10014B5A0;
    v22[3] = &unk_1005208D0;
    v24 = a3;
    v18 = v16;
    v23 = v18;
    objc_msgSend(v17, "addSuccessBlock:", v22);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10014B6AC;
    v20[3] = &unk_10051B140;
    v21 = v10;
    objc_msgSend(v17, "addFailureBlock:", v20);

  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[MFCatchUpFeedbackTriageInteraction log](MFCatchUpFeedbackTriageInteraction, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_publicDescription"));
      sub_100393C84(v19, buf, v13);
    }
  }

}

- (MFCatchUpFeedbackCardAction)feedbackCardAction
{
  return self->_feedbackCardAction;
}

- (void)setFeedbackCardAction:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackCardAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackCardAction, 0);
}

@end
