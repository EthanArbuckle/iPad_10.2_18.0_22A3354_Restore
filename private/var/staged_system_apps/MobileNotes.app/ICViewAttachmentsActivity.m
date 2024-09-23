@implementation ICViewAttachmentsActivity

- (ICViewAttachmentsActivity)initWithPresentingViewController:(id)a3 eventReporter:(id)a4
{
  id v6;
  id v7;
  ICViewAttachmentsActivity *v8;
  ICViewAttachmentsActivity *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICViewAttachmentsActivity;
  v8 = -[ICViewAttachmentsActivity init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingViewController, v6);
    objc_storeStrong((id *)&v9->_eventReporter, a4);
  }

  return v9;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("View Attachments"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("paperclip"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.viewAttachments");
}

- (void)performActivityWithCompletion:(id)a3
{
  -[ICViewAttachmentsActivity performActivityUserInitiated:completion:](self, "performActivityUserInitiated:completion:", 1, a3);
}

- (void)performActivityUserInitiated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  ICBrowseAttachmentsCollectionController *v7;
  ICBrowseAttachmentsCollectionController *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v4 = a3;
  v6 = a4;
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
    v7 = -[ICBrowseAttachmentsCollectionController initWithAttachmentSection:]([ICBrowseAttachmentsCollectionController alloc], "initWithAttachmentSection:", 1);
  else
    v7 = objc_alloc_init(ICBrowseAttachmentsCollectionController);
  v8 = v7;
  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
  objc_msgSend(v9, "setModalPresentationStyle:", +[UIDevice ic_isVision](UIDevice, "ic_isVision") ^ 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICViewAttachmentsActivity presentingViewController](self, "presentingViewController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C7510;
  v12[3] = &unk_100554190;
  v12[4] = self;
  v13 = v6;
  v14 = v4;
  v11 = v6;
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v4, v12);

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
