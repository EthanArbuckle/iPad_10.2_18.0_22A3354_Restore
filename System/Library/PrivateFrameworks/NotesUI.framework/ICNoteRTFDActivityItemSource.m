@implementation ICNoteRTFDActivityItemSource

- (ICNoteRTFDActivityItemSource)init
{
  -[ICNoteRTFDActivityItemSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICNoteRTFDActivityItemSource)initWithNote:(id)a3 noteExporter:(id)a4
{
  id v6;
  id v7;
  ICNoteRTFDActivityItemSource *v8;
  ICNoteRTFDActivityItemSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteRTFDActivityItemSource;
  v8 = -[ICNoteRTFDActivityItemSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICNoteRTFDActivityItemSource setNote:](v8, "setNote:", v6);
    -[ICNoteRTFDActivityItemSource setNoteExporter:](v9, "setNoteExporter:", v7);
  }

  return v9;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0C99E98]);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication-InPlace")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication-ByCopy")))&& (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CEB1C8]) & 1) == 0)
  {
    -[ICNoteRTFDActivityItemSource noteExporter](self, "noteExporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteRTFDActivityItemSource note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exportRTFDFileFromNote:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  int v4;
  id *v5;

  v4 = objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CEB1C8]);
  v5 = (id *)MEMORY[0x1E0CEC4E0];
  if (!v4)
    v5 = (id *)MEMORY[0x1E0CEC5C8];
  objc_msgSend(*v5, "identifier");
  return (id)objc_claimAutoreleasedReturnValue();
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
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  -[ICNoteRTFDActivityItemSource note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__ICNoteRTFDActivityItemSource_activityViewController_subjectForActivityType___block_invoke;
  v12[3] = &unk_1E5C1D9D0;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v9, "performBlockAndWait:", v12);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __78__ICNoteRTFDActivityItemSource_activityViewController_subjectForActivityType___block_invoke(uint64_t a1)
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

- (ICShareNoteExporter)noteExporter
{
  return self->_noteExporter;
}

- (void)setNoteExporter:(id)a3
{
  objc_storeStrong((id *)&self->_noteExporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteExporter, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
