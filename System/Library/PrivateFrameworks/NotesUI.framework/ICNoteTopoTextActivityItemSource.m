@implementation ICNoteTopoTextActivityItemSource

- (ICNoteTopoTextActivityItemSource)initWithNote:(id)a3
{
  id v4;
  ICNoteTopoTextActivityItemSource *v5;
  ICNoteTopoTextActivityItemSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteTopoTextActivityItemSource;
  v5 = -[ICNoteTopoTextActivityItemSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICNoteTopoTextActivityItemSource setNote:](v5, "setNote:", v4);

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1C0]))
    return 0;
  -[ICNoteTopoTextActivityItemSource note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  objc_msgSend(v6, "mergeableString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributedSubstringFromRange:", 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D63AC8]);
  -[ICNoteTopoTextActivityItemSource note](self, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithObjectIdentifier:forPasteboard:", v13, 1);

  +[ICTextController removeBeginningListStyleIfNecessaryForAttributedString:fromTextStorage:andRange:](ICTextController, "removeBeginningListStyleIfNecessaryForAttributedString:fromTextStorage:andRange:", v10, v6, 0, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, v14, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63BD8]), "initWithAttributedStringData:dataPersister:", v18, v14);
    v23 = *MEMORY[0x1E0D637F0];
    objc_msgSend(v19, "persistenceData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1C0]))
    return (id)*MEMORY[0x1E0D637F0];
  objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  return (id)objc_claimAutoreleasedReturnValue();
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
