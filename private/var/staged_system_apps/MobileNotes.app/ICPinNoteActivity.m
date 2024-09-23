@implementation ICPinNoteActivity

- (ICPinNoteActivity)initWithNote:(id)a3 eventReporter:(id)a4
{
  id v7;
  id v8;
  ICPinNoteActivity *v9;
  ICPinNoteActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICPinNoteActivity;
  v9 = -[ICPinNoteActivity init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_eventReporter, a4);
  }

  return v10;
}

- (id)activityTitle
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICPinNoteActivity note](self, "note"));
  v3 = objc_msgSend(v2, "isPinned");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Unpin");
  else
    v6 = CFSTR("Pin");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1005704B8, 0));

  return v7;
}

- (id)activityImage
{
  void *v2;
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICPinNoteActivity note](self, "note"));
  v3 = objc_msgSend(v2, "isPinned");
  v4 = CFSTR("pin.fill");
  if (v3)
    v4 = CFSTR("pin.slash.fill");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5));
  return v6;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.pinNote");
}

- (void)performActivityWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = (void (**)(id, uint64_t, void *))a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICPinNoteActivity note](self, "note"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000F4E7C;
  v13 = &unk_10054FF58;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v6, "performBlockAndWait:", &v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICPinNoteActivity eventReporter](self, "eventReporter", v10, v11, v12, v13));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICPinNoteActivity note](self, "note"));
  objc_msgSend(v7, "submitNotePinEventForModernNote:contextPath:", v8, 1);

  -[ICPinNoteActivity activityDidFinish:](self, "activityDidFinish:", 1);
  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICPinNoteActivity activityType](self, "activityType"));
    v4[2](v4, 1, v9);

  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (id)activityTintColor
{
  return +[UIColor systemOrangeColor](UIColor, "systemOrangeColor");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
