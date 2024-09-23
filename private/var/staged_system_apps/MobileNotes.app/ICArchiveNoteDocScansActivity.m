@implementation ICArchiveNoteDocScansActivity

- (ICArchiveNoteDocScansActivity)initWithNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICArchiveNoteDocScansActivity *v12;
  ICArchiveNoteDocScansActivity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICArchiveNoteDocScansActivity;
  v12 = -[ICArchiveNoteDocScansActivity init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_note, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong((id *)&v13->_presentingBarButtonItem, a5);
  }

  return v13;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.zipper"));
}

- (id)activityTitle
{
  return CFSTR("Archive Doc Scans");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.archiveDocScans");
}

- (void)performActivityWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICArchiveNoteDocScansActivity presentingViewController](self, "presentingViewController"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICArchiveNoteDocScansActivity note](self, "note"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICArchiveNoteDocScansActivity presentingViewController](self, "presentingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICArchiveNoteDocScansActivity presentingBarButtonItem](self, "presentingBarButtonItem"));
    +[ICDocCamArchiveExporter showExportArchiveFromNote:presentingViewController:presentingBarButtonItem:](ICDocCamArchiveExporter, "showExportArchiveFromNote:presentingViewController:presentingBarButtonItem:", v5, v6, v7);

    -[ICArchiveNoteDocScansActivity activityDidFinish:](self, "activityDidFinish:", 1);
    v8 = v10;
    if (v10)
      goto LABEL_5;
  }
  else
  {
    -[ICArchiveNoteDocScansActivity activityDidFinish:](self, "activityDidFinish:", 0);
    v8 = v10;
    if (v10)
    {
LABEL_5:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICArchiveNoteDocScansActivity activityType](self, "activityType"));
      (*((void (**)(void))v10 + 2))();

      v8 = v10;
    }
  }

}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
