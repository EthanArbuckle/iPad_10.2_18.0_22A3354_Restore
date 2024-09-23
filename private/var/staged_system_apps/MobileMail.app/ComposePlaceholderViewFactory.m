@implementation ComposePlaceholderViewFactory

- (ComposePlaceholderViewFactory)initWithDaemonInterface:(id)a3
{
  id v4;
  ComposePlaceholderViewFactory *v5;
  uint64_t v6;
  EMMessageRepository *messageRepository;
  MFComposeWebView *v8;
  MFComposeWebView *webview;
  NSMutableDictionary *v10;
  NSMutableDictionary *contentFuturesByID;
  uint64_t v12;
  EFScheduler *snapshotQueue;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ComposePlaceholderViewFactory;
  v5 = -[ComposePlaceholderViewFactory init](&v17, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageRepository"));
    messageRepository = v5->_messageRepository;
    v5->_messageRepository = (EMMessageRepository *)v6;

    v8 = (MFComposeWebView *)objc_msgSend(objc_alloc((Class)MFComposeWebView), "initWithFrame:isQuickReply:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    webview = v5->_webview;
    v5->_webview = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contentFuturesByID = v5->_contentFuturesByID;
    v5->_contentFuturesByID = v10;

    v12 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:](EFScheduler, "serialDispatchQueueSchedulerWithName:", CFSTR("ComposePlaceholderSnapshotQueue")));
    snapshotQueue = v5->_snapshotQueue;
    v5->_snapshotQueue = (EFScheduler *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountRepository"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deliveryAccounts"));
    v5->_showSenderField = (unint64_t)objc_msgSend(v15, "count") > 1;

  }
  return v5;
}

- (id)placeholderViewForUserActivity:(id)a3 frame:(CGRect)a4 parentMargins:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  double y;
  double x;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  ComposePlaceholderView *v18;
  void *v19;
  ComposePlaceholderView *v20;
  ComposePlaceholderView *v21;
  _QWORD v23[4];
  ComposePlaceholderView *v24;
  ComposePlaceholderViewFactory *v25;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeySubject));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderViewFactory _requestContentForActivity:](self, "_requestContentForActivity:", v14));
  v18 = -[ComposePlaceholderView initWithFrame:subject:modelFuture:]([ComposePlaceholderView alloc], "initWithFrame:subject:modelFuture:", v16, v17, x, y, width, height);
  -[ComposePlaceholderView setLayoutMargins:](v18, "setLayoutMargins:", top, left, bottom, right);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderViewFactory snapshotQueue](self, "snapshotQueue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000505DC;
  v23[3] = &unk_10051A910;
  v20 = v18;
  v24 = v20;
  v25 = self;
  objc_msgSend(v19, "performBlock:", v23);

  v21 = v20;
  return v21;
}

- (id)_requestContentForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  ComposePlaceholderViewFactory *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyAutosaveID));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderViewFactory contentFuturesByID](self, "contentFuturesByID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100050830;
    v15[3] = &unk_10051A960;
    v11 = v6;
    v16 = v11;
    v12 = v9;
    v17 = v12;
    v18 = self;
    objc_msgSend(v10, "performBlock:", v15);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "future"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComposePlaceholderViewFactory contentFuturesByID](self, "contentFuturesByID"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v11);

  }
  return v8;
}

- (id)_placeholderContentWithMessage:(id)a3
{
  id v4;
  ComposePlaceholderViewModel *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;

  v4 = a3;
  v5 = objc_alloc_init(ComposePlaceholderViewModel);
  -[ComposePlaceholderViewModel setShowSenderAddress:](v5, "setShowSenderAddress:", -[ComposePlaceholderViewFactory showSenderField](self, "showSenderField"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstSender"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddressValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "simpleAddress"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  v11 = v10;

  -[ComposePlaceholderViewModel setSenderAddress:](v5, "setSenderAddress:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "to"));
  v13 = sub_100050B4C(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[ComposePlaceholderViewModel setToRecipients:](v5, "setToRecipients:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cc"));
  v16 = sub_100050B4C(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[ComposePlaceholderViewModel setCcRecipients:](v5, "setCcRecipients:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bcc"));
  v19 = sub_100050B4C(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[ComposePlaceholderViewModel setBccRecipients:](v5, "setBccRecipients:", v20);

  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bestAlternativePart"));
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = &stru_100531B00;
  -[ComposePlaceholderViewModel setHtmlContent:](v5, "setHtmlContent:", v23);

  return v5;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (void)setMessageRepository:(id)a3
{
  objc_storeStrong((id *)&self->_messageRepository, a3);
}

- (MFComposeWebView)webview
{
  return self->_webview;
}

- (void)setWebview:(id)a3
{
  objc_storeStrong((id *)&self->_webview, a3);
}

- (NSMutableDictionary)contentFuturesByID
{
  return self->_contentFuturesByID;
}

- (void)setContentFuturesByID:(id)a3
{
  objc_storeStrong((id *)&self->_contentFuturesByID, a3);
}

- (EFScheduler)snapshotQueue
{
  return self->_snapshotQueue;
}

- (void)setSnapshotQueue:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotQueue, a3);
}

- (BOOL)showSenderField
{
  return self->_showSenderField;
}

- (void)setShowSenderField:(BOOL)a3
{
  self->_showSenderField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_contentFuturesByID, 0);
  objc_storeStrong((id *)&self->_webview, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
}

@end
