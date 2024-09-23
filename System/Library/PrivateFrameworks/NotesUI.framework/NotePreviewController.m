@implementation NotePreviewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NotePreviewController;
  -[NotePreviewController dealloc](&v4, sel_dealloc);
}

- (NotePreviewController)initWithNote:(id)a3 searchResult:(id)a4
{
  id v7;
  id v8;
  NotePreviewController *v9;
  NotePreviewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NotePreviewController;
  v9 = -[NotePreviewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_searchResult, a4);
    -[NotePreviewController registerForTraitChanges](v10, "registerForTraitChanges");
  }

  return v10;
}

- (NotePreviewController)initWithNote:(id)a3
{
  return -[NotePreviewController initWithNote:searchResult:](self, "initWithNote:searchResult:", a3, 0);
}

- (void)setupPreview
{
  -[NotePreviewController setupPreviewWithInitialFrame:](self, "setupPreviewWithInitialFrame:", 0.0, 0.0, 320.0, 320.0);
}

- (void)setupPreviewWithInitialFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NotesBackgroundView *v8;
  void *v9;
  void *v10;
  NoteContentLayer *v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  unsigned int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _QWORD v77[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v77[4] = *MEMORY[0x1E0C80C00];
  v8 = -[NotesBackgroundView initWithFrame:]([NotesBackgroundView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[NotePreviewController setView:](self, "setView:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "ICBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = -[NoteContentLayer initWithFrame:forPreview:]([NoteContentLayer alloc], "initWithFrame:forPreview:", 1, x, y, width, height);
  -[NotePreviewController setContentLayer:](self, "setContentLayer:", v11);

  -[NotePreviewController contentLayer](self, "contentLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttachmentPresentationDelegate:", self);

  -[NotePreviewController contentLayer](self, "contentLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsAttachments:", 1);

  -[NotePreviewController backgroundView](self, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPreviewing:", 1);

  -[NotePreviewController backgroundView](self, "backgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController contentLayer](self, "contentLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentView:useSafeAreaLayoutGuide:topMargin:bottomMargin:leadingMargin:trailingMargin:standalone:force:", v16, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);

  -[NotePreviewController contentLayer](self, "contentLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scrollToTopAnimated:", 0);

  -[NotePreviewController contentLayer](self, "contentLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "noteHTMLEditorView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUserInteractionEnabled:", 0);

  -[NotePreviewController contentLayer](self, "contentLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "noteHTMLEditorView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "webView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "leftAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leftAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v37);
  v38 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0CB3718];
  v69 = (void *)v30;
  v70 = (void *)v26;
  v77[0] = v26;
  v77[1] = v30;
  v67 = (void *)v38;
  v68 = (void *)v34;
  v77[2] = v34;
  v77[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v40);

  -[NotePreviewController note](self, "note");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v41, "isPlainText");

  -[NotePreviewController note](self, "note");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "content");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[NotePreviewController note](self, "note");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "attachments");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "allObjects");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[NoteAttachmentPresentation attachmentPresentationsForAttachments:](NoteAttachmentPresentation, "attachmentPresentationsForAttachments:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController setAttachmentPresentations:](self, "setAttachmentPresentations:", v46);

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  -[NotePreviewController attachmentPresentations](self, "attachmentPresentations");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v73 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v52, "contentIDURL");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[NotesCIDURLProtocol registerDataProvider:forCIDURL:](NotesCIDURLProtocol, "registerDataProvider:forCIDURL:", v52, v53);

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    }
    while (v49);
  }

  -[NotePreviewController contentLayer](self, "contentLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController note](self, "note");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "attachments");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "allObjects");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setContent:isPlainText:attachments:", v66, v65, v57);

  -[NotePreviewController note](self, "note");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "modificationDate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[NotePreviewController contentLayer](self, "contentLayer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setTimestampDate:", v59);

  -[NotePreviewController attachmentContentIDs](self, "attachmentContentIDs");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotePreviewController attachmentPresentations](self, "attachmentPresentations");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  +[NoteAttachmentPresentation prepareDocumentForPresentationWithAttachmentContentIDs:withAttachmentPresentations:occurences:](NoteAttachmentPresentation, "prepareDocumentForPresentationWithAttachmentContentIDs:withAttachmentPresentations:occurences:", v61, v62, &v71);
  v63 = v71;

  -[NotePreviewController updateForceLightContentIfNecessary](self, "updateForceLightContentIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

}

- (id)attachmentContentIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[NotePreviewController contentLayer](self, "contentLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteHTMLEditorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentContentIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NotesBackgroundView)backgroundView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NotePreviewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NotesBackgroundView *)v4;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[NotePreviewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_updateForceLightContentIfNecessary);

}

- (id)noteContentLayer:(id)a3 fileURLForAttachmentWithContentID:(id)a4
{
  void *v4;
  void *v5;

  -[NotePreviewController attachmentPresentationForContentID:](self, "attachmentPresentationForContentID:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)noteContentLayer:(id)a3 attachmentPresentationForContentID:(id)a4
{
  return -[NotePreviewController attachmentPresentationForContentID:](self, "attachmentPresentationForContentID:", a4);
}

- (id)attachmentPresentationForContentID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NotePreviewController attachmentPresentations](self, "attachmentPresentations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "contentID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateForceLightContentIfNecessary
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = objc_msgSend(MEMORY[0x1E0DC3E88], "ic_alwaysShowLightContent");
  v4 = v3;
  -[NotePreviewController traitOverrides](self, "traitOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setUserInterfaceStyle:", v3);
LABEL_5:

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "containsTrait:", objc_opt_class());

  if (v7)
  {
    -[NotePreviewController traitOverrides](self, "traitOverrides");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTrait:", objc_opt_class());
    goto LABEL_5;
  }
LABEL_6:
  -[NotePreviewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setOverrideUserInterfaceStyle:", v4);

  -[NotePreviewController contentLayer](self, "contentLayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setOverrideUserInterfaceStyle:", v4);

}

- (NoteContentLayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayer, a3);
}

- (NoteObject)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_storeStrong((id *)&self->_note, a3);
}

- (ICSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (NSArray)attachmentPresentations
{
  return self->_attachmentPresentations;
}

- (void)setAttachmentPresentations:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentPresentations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentPresentations, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
}

@end
