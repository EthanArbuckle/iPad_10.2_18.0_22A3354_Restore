@implementation ICPagesHandoffActivity

- (ICNAEventReporter)eventReporter
{
  void *v3;
  void *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  ICNAEventReporter *v11;
  ICNAEventReporter *eventReporter;
  void *v13;

  if (!self->_eventReporter)
  {
    if (+[ICNAEventReporter isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICPagesHandoffActivity viewController](self, "viewController"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewIfLoaded"));

      if (v4)
      {
        v5 = objc_alloc((Class)ICNAEventReporter);
        v6 = (objc_class *)objc_opt_class(self);
        v7 = NSStringFromClass(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICPagesHandoffActivity viewController](self, "viewController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
        v11 = (ICNAEventReporter *)objc_msgSend(v5, "initWithSubTrackerName:view:", v8, v10);
        eventReporter = self->_eventReporter;
        self->_eventReporter = v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v13, "addObserver:selector:name:object:", self, "eventReporterLostSession:", ICNAEventReporterLostSessionNotification, self->_eventReporter);

      }
    }
  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = ICNAEventReporterLostSessionNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "object"));

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (ICPagesHandoffActivity)initWithNote:(id)a3 viewController:(id)a4
{
  id v7;
  id v8;
  ICPagesHandoffActivity *v9;
  ICPagesHandoffActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICPagesHandoffActivity;
  v9 = -[ICPagesHandoffActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeWeak((id *)&v10->_viewController, v8);
  }

  return v10;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Open in Pages"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityImage
{
  return +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("apple.pages"));
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.PagesHandoff");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  ICPagesHandoffManager *v15;

  v15 = objc_alloc_init(ICPagesHandoffManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICPagesHandoffActivity note](self, "note"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICPagesHandoffActivity viewController](self, "viewController"));
  -[ICPagesHandoffManager launchPagesWithArchiveFromNote:viewController:](v15, "launchPagesWithArchiveFromNote:viewController:", v3, v4);

  v5 = objc_opt_class(ICNoteEditorViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICPagesHandoffActivity viewController](self, "viewController"));
  v7 = ICDynamicCast(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_opt_class(ICSystemPaperViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICPagesHandoffActivity viewController](self, "viewController"));
  v11 = ICDynamicCast(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);

  if (v8 | v12)
    v13 = 2;
  else
    v13 = 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICPagesHandoffActivity eventReporter](self, "eventReporter"));
  objc_msgSend(v14, "submitNotesToPagesEventWithContextPath:", v13);

  -[ICPagesHandoffActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (ICNote)note
{
  return self->_note;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (id)performActivityBlock
{
  return self->_performActivityBlock;
}

- (void)setPerformActivityBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performActivityBlock, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
