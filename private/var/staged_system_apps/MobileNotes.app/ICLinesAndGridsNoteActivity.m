@implementation ICLinesAndGridsNoteActivity

- (ICLinesAndGridsNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 shouldCreateNewNoteBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICLinesAndGridsNoteActivity *v15;
  ICLinesAndGridsNoteActivity *v16;
  id v17;
  id shouldCreateNewNoteBlock;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id from;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100087DA4;
  v21[3] = &unk_10054FC48;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  v20.receiver = self;
  v20.super_class = (Class)ICLinesAndGridsNoteActivity;
  v15 = -[ICLinesAndGridsNoteActivity initWithPerformActivity:](&v20, "initWithPerformActivity:", v21);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_note, a3);
    objc_storeWeak((id *)&v16->_presentingViewController, v12);
    objc_storeStrong((id *)&v16->_eventReporter, a5);
    v17 = objc_retainBlock(v14);
    shouldCreateNewNoteBlock = v16->_shouldCreateNewNoteBlock;
    v16->_shouldCreateNewNoteBlock = v17;

  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v16;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("rectangle.split.3x3"));
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Lines & Grids"), &stru_1005704B8, 0));

  return v3;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.linesAndGrids");
}

- (void)paperStyleSheetCollectionViewController:(id)a3 didFinishWithPaperStyleType:(unint64_t)a4
{
  uint64_t (**v6)(void);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity note](self, "note", a3));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity shouldCreateNewNoteBlock](self, "shouldCreateNewNoteBlock"));

    if (!v7)
      goto LABEL_5;
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity shouldCreateNewNoteBlock](self, "shouldCreateNewNoteBlock"));
    v8 = v6[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[ICLinesAndGridsNoteActivity setNote:](self, "setNote:", v9);

  }
LABEL_5:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity note](self, "note"));
  v11 = (int)objc_msgSend(v10, "paperStyleType");

  if (v11 != a4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity note](self, "note"));
    objc_msgSend(v12, "setPaperStyleType:", (__int16)a4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity note](self, "note"));
    objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Changed paper style"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity note](self, "note"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "managedObjectContext"));
    objc_msgSend(v15, "ic_save");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity eventReporter](self, "eventReporter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICLinesAndGridsNoteActivity activityType](self, "activityType"));
    objc_msgSend(v16, "submitNoteActionMenuEventForNoteEditorWithUsageType:activityType:", 3, v17);

  }
  -[ICLinesAndGridsNoteActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
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

- (ICPaperStyleSheetCollectionViewController)paperStyleViewController
{
  return self->_paperStyleViewController;
}

- (void)setPaperStyleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_paperStyleViewController, a3);
}

- (id)shouldCreateNewNoteBlock
{
  return self->_shouldCreateNewNoteBlock;
}

- (void)setShouldCreateNewNoteBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldCreateNewNoteBlock, 0);
  objc_storeStrong((id *)&self->_paperStyleViewController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
