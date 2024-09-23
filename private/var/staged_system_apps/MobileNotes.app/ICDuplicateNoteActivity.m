@implementation ICDuplicateNoteActivity

- (ICDuplicateNoteActivity)initWithNote:(id)a3
{
  id v5;
  ICDuplicateNoteActivity *v6;
  ICDuplicateNoteActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDuplicateNoteActivity;
  v6 = -[ICDuplicateNoteActivity init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_note, a3);

  return v7;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.on.doc"));
}

- (id)activityTitle
{
  return CFSTR("Duplicate");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.duplicateNote");
}

- (void)performActivityWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, void *);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = (void (**)(id, uint64_t, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDuplicateNoteActivity note](self, "note"));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = +[ICNote undoablyDuplicateNotes:](ICNote, "undoablyDuplicateNotes:", v6);

  -[ICDuplicateNoteActivity activityDidFinish:](self, "activityDidFinish:", 1);
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDuplicateNoteActivity activityType](self, "activityType"));
    v4[2](v4, 1, v8);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
