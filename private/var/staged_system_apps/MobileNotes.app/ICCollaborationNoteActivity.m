@implementation ICCollaborationNoteActivity

- (ICCollaborationNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 eventReporter:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICCollaborationNoteActivity *v17;
  ICCollaborationNoteActivity *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICCollaborationNoteActivity;
  v17 = -[ICCollaborationNoteActivity init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_note, a3);
    objc_storeStrong((id *)&v18->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v18->_presentingSourceView, a6);
    objc_storeStrong((id *)&v18->_presentingViewController, a4);
    objc_storeStrong((id *)&v18->_eventReporter, a7);
  }

  return v18;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationNoteActivity note](self, "note"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shareViaICloudManageActionTitle"));

  return v3;
}

- (id)activityImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationNoteActivity note](self, "note"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shareViaICloudSystemImageName"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3));
  return v4;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.collaborationNote");
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationNoteActivity note](self, "note"));
  if ((objc_msgSend(v5, "canBeSharedViaICloud") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationNoteActivity note](self, "note"));
    v7 = objc_msgSend(v6, "isEmpty");

    if (!v7)
    {
      if (-[ICCollaborationNoteActivity contextPathEnum](self, "contextPathEnum"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationNoteActivity eventReporter](self, "eventReporter"));
        objc_msgSend(v8, "pushContextPathDataWithContextPathEnum:", -[ICCollaborationNoteActivity contextPathEnum](self, "contextPathEnum"));

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationNoteActivity presentingViewController](self, "presentingViewController"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000C7C8C;
      v12[3] = &unk_100550160;
      v12[4] = self;
      v13 = v4;
      objc_msgSend(v9, "ic_dismissPresentedViewControllerAnimated:completion:", 1, v12);

      goto LABEL_11;
    }
  }
  else
  {

  }
  v10 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10040A9A8(v10);

  -[ICCollaborationNoteActivity activityDidFinish:](self, "activityDidFinish:", 0);
  if (v4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationNoteActivity activityType](self, "activityType"));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v11);

  }
LABEL_11:

}

- (ICCollaborationUIController)collaborationUIController
{
  return +[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance");
}

- (ICNoteContext)noteContext
{
  return (ICNoteContext *)+[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, a3);
}

- (UIView)presentingSourceView
{
  return self->_presentingSourceView;
}

- (void)setPresentingSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSourceView, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
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
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
}

@end
