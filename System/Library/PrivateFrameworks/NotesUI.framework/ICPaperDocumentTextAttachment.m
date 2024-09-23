@implementation ICPaperDocumentTextAttachment

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", NSClassFromString(CFSTR("ICPaperDocumentTextAttachmentViewProvider")), *MEMORY[0x1E0D640F0]);
}

+ (BOOL)isEnabled
{
  void *v2;
  char v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICPaperDocumentTextAttachment;
  if (!objc_msgSendSuper2(&v5, sel_isEnabled) || !ICInternalSettingsIsPDFsInNotesEnabled())
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_canEditNotes");

  return v3;
}

- (ICPaperDocumentTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  void *v6;
  ICPaperDocumentTextAttachment *v7;
  objc_super v9;

  v5 = a3;
  -[ICPaperDocumentTextAttachment fileType](self, "fileType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)ICPaperDocumentTextAttachment;
  v7 = -[ICSystemPaperTextAttachment initWithData:ofType:](&v9, sel_initWithData_ofType_, v5, v6);

  return v7;
}

- (id)fileType
{
  return (id)*MEMORY[0x1E0D640F0];
}

- (id)attachmentAsNSTextAttachment
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = -[ICPaperDocumentTextAttachment isLegacyMediaType](self, "isLegacyMediaType");
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "attachmentType");

    if (v6 == 6
      || (-[ICAbstractTextAttachment attachment](self, "attachment"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "attachmentType"),
          v13,
          v14 == 11))
    {
      v15 = (objc_class *)objc_opt_class();
    }
    else
    {
      v15 = 0;
    }
    v21 = [v15 alloc];
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v21, "initWithAttachment:", v20);
    objc_msgSend(v19, "attachmentAsNSTextAttachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v12;
  }
  v7 = objc_msgSend(v4, "isPasswordProtected");

  if (!v7)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3650]);
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "previewItemURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v19 = (void *)objc_msgSend(v16, "initWithURL:options:error:", v18, 0, &v26);
    v20 = v26;

    if (v19)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
      objc_msgSend(v12, "setFileWrapper:", v19);
    }
    else
    {
      v23 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[ICAbstractTextAttachment attachment](self, "attachment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "shortLoggingDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v25;
        v29 = 2112;
        v30 = v20;
        _os_log_impl(&dword_1AC7A1000, v23, OS_LOG_TYPE_DEFAULT, "Failed to create fallback PDF file wrapper for attachment %@ error: %@", buf, 0x16u);

      }
      v12 = 0;
    }
    goto LABEL_12;
  }
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fallbackPDFData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackPDFUTI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithData:ofType:", v9, v11);

  return v12;
}

- (void)paperDidChange
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1AC7A1000, v2, v3, "Received debounced paperDidChange for paper document %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_3();
}

uint64_t __47__ICPaperDocumentTextAttachment_paperDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasPaperForm:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDidRunPaperFormDetection:", 0);
}

void __47__ICPaperDocumentTextAttachment_paperDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ICPaperDocumentTextAttachment_paperDidChange__block_invoke_3;
  v5[3] = &unk_1E5C1D9A8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "performBlockAndWait:", v5);

}

uint64_t __47__ICPaperDocumentTextAttachment_paperDidChange__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAttachmentChangeCountAndSave:", *(_QWORD *)(a1 + 40));
}

- (id)supportedPresentationSizes
{
  if (supportedPresentationSizes_onceToken != -1)
    dispatch_once(&supportedPresentationSizes_onceToken, &__block_literal_global_4);
  return (id)supportedPresentationSizes_supportedSizes;
}

void __59__ICPaperDocumentTextAttachment_supportedPresentationSizes__block_invoke()
{
  void *v0;

  v0 = (void *)supportedPresentationSizes_supportedSizes;
  supportedPresentationSizes_supportedSizes = (uint64_t)&unk_1E5C719E8;

}

- (ICPDFEncryptionStateChecker)encryptionStateChecker
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  ICPDFEncryptionStateChecker *v8;
  ICPDFEncryptionStateChecker *encryptionStateChecker;

  if (!self->_encryptionStateChecker)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "attachmentType");

    if (v4 == 6)
    {
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "media");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = -[ICPDFEncryptionStateChecker initWithPDFURL:]([ICPDFEncryptionStateChecker alloc], "initWithPDFURL:", v7);
        encryptionStateChecker = self->_encryptionStateChecker;
        self->_encryptionStateChecker = v8;

      }
    }
  }
  return self->_encryptionStateChecker;
}

- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICPaperDocumentTextAttachment;
  v5 = -[ICBaseTextAttachment effectiveAttachmentViewSizeForTextContainer:](&v12, sel_effectiveAttachmentViewSizeForTextContainer_, v4);
  if (v5 != 1)
  {
    ICProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "insideSystemPaper") & 1) != 0)
    {
      LOWORD(v5) = 1;
    }
    else
    {
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "attachmentType");

      if (v8 == 6)
      {
        -[ICPaperDocumentTextAttachment encryptionStateChecker](self, "encryptionStateChecker");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "encryptionState");

        if (v10 != 2)
          LOWORD(v5) = 1;
      }
    }

  }
  return v5;
}

- (void)attachmentView:(id)a3 willMoveToWindow:(id)a4
{
  id v5;
  void *v6;
  id v7;

  if (!a4)
  {
    v5 = a3;
    -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICSystemPaperTextAttachmentWillDisappearNotification"), v5);

  }
}

- (void)attachmentView:(id)a3 didMoveToWindow:(id)a4
{
  id v5;
  void *v6;
  id v7;

  if (a4)
  {
    v5 = a3;
    -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    -[ICInlineCanvasTextAttachment updatePaletteVisibility](self, "updatePaletteVisibility");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICSystemPaperTextAttachmentDidAppearNotification"), v5);

  }
}

- (id)inlineViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICSystemPaperTextAttachment systemPaperViews](self, "systemPaperViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        ICGatherInterestingSubviewsFromViewInArray(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v8++), v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (BOOL)isLegacyMediaType
{
  ICPaperDocumentTextAttachment *v2;
  void *v3;
  int v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v2 = self;
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "attachmentType");

  v5 = v4 - 3;
  if ((v4 - 3) < 0xD && ((0x1909u >> v5) & 1) != 0)
  {
    LODWORD(v2) = (0x109u >> v5) & 1;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D641A0];
    -[ICAbstractTextAttachment attachment](v2, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "attachmentType");
    -[ICAbstractTextAttachment attachment](v2, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = 1;
    objc_msgSend(v6, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICPaperDocumentTextAttachment isLegacyMediaType]", 1, 0, CFSTR("Unexpected type %hd for attachment %@"), v8, v10);

  }
  return (char)v2;
}

- (NSURL)pdfURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICAbstractTextAttachment attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "attachmentType") == 6)
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (id)_paperBundleURL
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[ICPaperDocumentTextAttachment isLegacyMediaType](self, "isLegacyMediaType"))
  {
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "temporaryPaperBundleURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICPaperDocumentTextAttachment;
    -[ICSystemPaperTextAttachment _paperBundleURL](&v6, sel__paperBundleURL);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGColorSpaceRef v27;
  ICPrintableTextAttachment *v28;
  void *v29;
  void *v30;
  ICPrintableTextAttachment *v31;
  double v32;
  double v33;
  double v34;

  -[ICAbstractTextAttachment attachment](self, "attachment", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "preferredViewSize");

  if (v7 == 1)
  {
    v8 = 0;
    return v8;
  }
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "attachmentType");

  if (v10 != 11)
  {
    v17 = (id)*MEMORY[0x1E0CEC570];
    -[ICAbstractTextAttachment attachment](self, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "attachmentType");

    if (v19 == 6)
    {
      v20 = (void *)MEMORY[0x1E0C99D50];
      -[ICPaperDocumentTextAttachment pdfURL](self, "pdfURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataWithContentsOfURL:", v21);
    }
    else
    {
      -[ICAbstractTextAttachment attachment](self, "attachment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "fallbackPDFData");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD0DB8]), "initWithData:", v13);
      objc_msgSend(v16, "pageAtIndex:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "boundsForBox:", 1);
      TSDScaleSizeWithinSize();
      v24 = v23;
      v26 = v25;
      v27 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
      objc_msgSend(MEMORY[0x1E0D63BF8], "renderedImageForPage:scale:size:colorSpace:", objc_msgSend(v22, "pageRef"), v27, 1.0, v24, v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v27);

      goto LABEL_11;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  -[ICAbstractTextAttachment attachment](self, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "galleryModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstSubAttachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v17 = 0;
    goto LABEL_13;
  }
  +[ICGalleryAttachmentUtilities imageForSubAttachment:rotateForMacImageGallery:allowCached:](ICGalleryAttachmentUtilities, "imageForSubAttachment:rotateForMacImageGallery:allowCached:", v13, 1, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(v13, "typeUTI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "typeWithIdentifier:", v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_14:
  if (v14)
  {
    v28 = [ICPrintableTextAttachment alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[ICPrintableTextAttachment initWithData:ofType:](v28, "initWithData:ofType:", v29, v30);

    -[ICPrintableTextAttachment setImage:](v31, "setImage:", v14);
    objc_msgSend(v14, "size");
    v33 = v32;
    objc_msgSend(v14, "size");
    -[ICPrintableTextAttachment setBounds:](v31, "setBounds:", 0.0, 0.0, v33, v34);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canDragWithoutSelecting
{
  return 1;
}

- (BOOL)viewportShouldSnapToAttachmentView
{
  return self->_viewportShouldSnapToAttachmentView;
}

- (void)setViewportShouldSnapToAttachmentView:(BOOL)a3
{
  self->_viewportShouldSnapToAttachmentView = a3;
}

- (void)setEncryptionStateChecker:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionStateChecker, 0);
}

@end
