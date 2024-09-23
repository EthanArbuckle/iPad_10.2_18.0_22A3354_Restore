@implementation ICNoteQuickLookViewController

+ (void)initialize
{
  void *v2;
  id v3;

  +[ICNoteContext startSharedContextWithOptions:](ICNoteContext, "startSharedContextWithOptions:", 546);
  v3 = objc_alloc_init((Class)ICHTMLSearchIndexerDataSource);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
  objc_msgSend(v2, "addDataSource:", v3);

  +[NSTextAttachment registerTextAttachmentClass:forFileType:](NSTextAttachment, "registerTextAttachmentClass:forFileType:", objc_opt_class(ICSystemPaperTextAttachment), PKApplePaperTypeIdentifier);
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  id v35;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainContextObjectForObjectIDURIString:", v7));

  if (v10)
  {
    v11 = objc_opt_class(ICAttachment);
    v12 = ICDynamicCast(v11, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_opt_class(NoteAttachmentObject);
    v15 = ICDynamicCast(v14, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_opt_class(ICNote);
    v18 = ICDynamicCast(v17, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_opt_class(NoteObject);
    v21 = ICDynamicCast(v20, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (v13)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "note"));
      v24 = v19;
      v19 = (void *)v23;
    }
    else
    {
      if (!v16)
        goto LABEL_10;
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "note"));
      v24 = v22;
      v22 = (void *)v26;
    }

LABEL_10:
    if (v19)
    {
      v33 = v16;
      v27 = objc_alloc((Class)ICNotePreviewController);
      v28 = v19;
    }
    else
    {
      if (!v22)
      {
LABEL_15:

        goto LABEL_16;
      }
      v33 = v16;
      v27 = objc_alloc((Class)NotePreviewController);
      v28 = v22;
    }
    v29 = objc_msgSend(v27, "initWithNote:", v28);
    objc_msgSend(v29, "setupPreviewWithInitialFrame:", 0.0, 0.0, 343.0, 490.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteQuickLookViewController view](self, "view"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "view"));
    objc_msgSend(v30, "addSubview:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "view"));
    -[ICNoteQuickLookViewController setNotePreviewControllerView:](self, "setNotePreviewControllerView:", v32);

    v16 = v33;
    goto LABEL_15;
  }
  v25 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to get searchIndexableObject for objectIDURI %@", buf, 0xCu);
  }

LABEL_16:
  v8[2](v8, 0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICNoteQuickLookViewController;
  -[ICNoteQuickLookViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[ICNoteQuickLookViewController updateNotePreviewControllerFrame](self, "updateNotePreviewControllerFrame");
}

- (void)updateNotePreviewControllerFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  if (-[ICNoteQuickLookViewController _appearState](self, "_appearState") == 2
    || -[ICNoteQuickLookViewController _appearState](self, "_appearState") == 1)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteQuickLookViewController view](self, "view"));
    objc_msgSend(v12, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteQuickLookViewController notePreviewControllerView](self, "notePreviewControllerView"));
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  }
}

- (UIView)notePreviewControllerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_notePreviewControllerView);
}

- (void)setNotePreviewControllerView:(id)a3
{
  objc_storeWeak((id *)&self->_notePreviewControllerView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notePreviewControllerView);
}

@end
