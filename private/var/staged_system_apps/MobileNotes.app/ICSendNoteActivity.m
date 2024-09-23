@implementation ICSendNoteActivity

- (ICSendNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 presentingSourceRect:(CGRect)a7 eventReporter:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  id v21;
  ICSendNoteActivity *v22;
  ICSendNoteActivity *v23;
  id v25;
  objc_super v26;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v25 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v26.receiver = self;
  v26.super_class = (Class)ICSendNoteActivity;
  v22 = -[ICSendNoteActivity init](&v26, "init");
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_note, a3);
    objc_storeStrong((id *)&v23->_presentingViewController, a4);
    objc_storeStrong((id *)&v23->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v23->_presentingSourceView, a6);
    v23->_presentingSourceRect.origin.x = x;
    v23->_presentingSourceRect.origin.y = y;
    v23->_presentingSourceRect.size.width = width;
    v23->_presentingSourceRect.size.height = height;
    objc_storeStrong((id *)&v23->_eventReporter, a8);
  }

  return v23;
}

- (ICSendNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5
{
  return -[ICSendNoteActivity initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:](self, "initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:", a3, a4, 0, 0, a5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Share"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.sendNote");
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up"));
}

- (void)performActivityWithCompletion:(id)a3
{
  -[ICSendNoteActivity performActivityWithExcludedTypes:completion:](self, "performActivityWithExcludedTypes:completion:", &__NSArray0__struct, a3);
}

- (void)performActivityWithExcludedTypes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;

  v6 = a4;
  v7 = a3;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivity presentingViewController](self, "presentingViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivity presentingViewController](self, "presentingViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivity presentationSourceItem](self, "presentationSourceItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivity presentingSourceView](self, "presentingSourceView"));
  -[ICSendNoteActivity presentingSourceRect](self, "presentingSourceRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivity note](self, "note"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivity eventReporter](self, "eventReporter"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10004EDD8;
  v26[3] = &unk_100550160;
  v26[4] = self;
  v27 = v6;
  v23 = v6;
  objc_msgSend(v24, "presentSendNoteActivityViewControllerWithPresentingWindow:presentingViewController:sourceItem:sourceView:sourceRect:note:excludedTypes:eventReporter:didPresentActivityHandler:", v9, v10, v11, v12, v21, v7, v14, v16, v18, v20, v22, v26);

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

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
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

- (CGRect)presentingSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentingSourceRect.origin.x;
  y = self->_presentingSourceRect.origin.y;
  width = self->_presentingSourceRect.size.width;
  height = self->_presentingSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentingSourceRect:(CGRect)a3
{
  self->_presentingSourceRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSourceView, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
