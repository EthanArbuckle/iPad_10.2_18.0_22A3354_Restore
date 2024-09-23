@implementation ICNoteHTMLActivityItemSource

- (ICNoteHTMLActivityItemSource)init
{
  -[ICNoteHTMLActivityItemSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICNoteHTMLActivityItemSource)initWithNote:(id)a3
{
  id v4;
  ICNoteHTMLActivityItemSource *v5;
  ICNoteHTMLActivityItemSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteHTMLActivityItemSource;
  v5 = -[ICNoteHTMLActivityItemSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICNoteHTMLActivityItemSource setNote:](v5, "setNote:", v4);

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "string", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1D0]))
  {
    -[ICNoteHTMLActivityItemSource note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "htmlStringWithHTMLAttachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<html><body>%@</body></html>"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  -[ICNoteHTMLActivityItemSource note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__ICNoteHTMLActivityItemSource_activityViewController_subjectForActivityType___block_invoke;
  v12[3] = &unk_1E5C1D9D0;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v9, "performBlockAndWait:", v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __78__ICNoteHTMLActivityItemSource_activityViewController_subjectForActivityType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
