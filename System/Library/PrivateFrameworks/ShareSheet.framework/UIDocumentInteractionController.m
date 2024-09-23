@implementation UIDocumentInteractionController

+ (UIDocumentInteractionController)interactionControllerWithURL:(NSURL *)url
{
  NSURL *v4;
  void *v5;

  v4 = url;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return (UIDocumentInteractionController *)v5;
}

- (UIDocumentInteractionController)initWithURL:(id)a3
{
  id v4;
  UIDocumentInteractionController *v5;
  NSURL *decompressedArchiveDocumentURL;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIDocumentInteractionController;
  v5 = -[UIDocumentInteractionController init](&v15, sel_init);
  if (v5)
  {
    -[UIDocumentInteractionController setIsContentManaged:](v5, "setIsContentManaged:", objc_msgSend(v4, "ui_isContentManaged"));
    -[UIDocumentInteractionController setURL:](v5, "setURL:", v4);
    v5->_shouldDecompressArchiveIfNecessary = 0;
    v5->_excludeDotFilesFromArchiveListings = 1;
    decompressedArchiveDocumentURL = v5->_decompressedArchiveDocumentURL;
    v5->_decompressedArchiveDocumentURL = 0;

    location = 0;
    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC4858];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__UIDocumentInteractionController_initWithURL___block_invoke;
    v12[3] = &unk_1E4003590;
    objc_copyWeak(&v13, &location);
    v10 = (id)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v9, 0, v8, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __47__UIDocumentInteractionController_initWithURL___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissMenuAnimated:", 0);

}

- (void)dealloc
{
  NSObject *v3;
  NSURL *tmpURLToDeleteOnDealloc;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  NSURL *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  -[QLPreviewController setDelegate:](self->_previewController, "setDelegate:", 0);
  -[_UIDICActivityViewController setDocumentInteractionActivityDelegate:](self->_activityViewController, "setDocumentInteractionActivityDelegate:", 0);
  if (self->_tmpURLToDeleteOnDealloc)
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      tmpURLToDeleteOnDealloc = self->_tmpURLToDeleteOnDealloc;
      *(_DWORD *)buf = 138412290;
      v8 = tmpURLToDeleteOnDealloc;
      _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up temporary URL: %@", buf, 0xCu);
    }

    v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v5, "removeItemAtURL:error:", self->_tmpURLToDeleteOnDealloc, 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentInteractionController;
  -[UIDocumentInteractionController dealloc](&v6, sel_dealloc);
}

- (void)setDelegate:(id)delegate
{
  id v4;
  id WeakRetained;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags;
  int v20;
  NSObject *v21;
  int v22;
  int v23;
  int v24;
  int v25;

  v4 = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!v4 || WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFFD | v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFFB | v7);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 0x20000;
    else
      v8 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFDFFFF | v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFF7 | v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFEF | v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 32;
    else
      v11 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFDF | v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 64;
    else
      v12 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFFBF | v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 128;
    else
      v13 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFF7F | v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 256;
    else
      v14 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFEFF | v14);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 512;
    else
      v15 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFDFF | v15);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 1024;
    else
      v16 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFFBFF | v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 2048;
    else
      v17 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFF7FF | v17);
    v18 = objc_opt_respondsToSelector();
    documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
    if ((v18 & 1) != 0)
      v20 = 4096;
    else
      v20 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&documentInteractionControllerFlags & 0xFFFFEFFF | v20);
    if ((*(_WORD *)&documentInteractionControllerFlags & 0x800) != 0 || (v18 & 1) != 0)
    {
      share_sheet_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[UIDocumentInteractionController setDelegate:].cold.1(v21);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = 0x2000;
    else
      v22 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFDFFF | v22);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = 0x4000;
    else
      v23 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFFBFFF | v23);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = 0x8000;
    else
      v24 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFF7FFF | v24);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = 0x10000;
    else
      v25 = 0;
    self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&self->_documentInteractionControllerFlags & 0xFFFEFFFF | v25);
  }

}

- (void)setIsContentManaged:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "setIsContentManaged: %i", (uint8_t *)v6, 8u);
  }

  self->_isContentManaged = v3;
  -[UIDocumentInteractionController _updateURLIsContentManaged](self, "_updateURLIsContentManaged");
}

- (void)_updateURLIsContentManaged
{
  id v3;

  -[UIDocumentInteractionController URL](self, "URL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ui_setIsContentManaged:", self->_isContentManaged);

}

- (void)setURL:(NSURL *)URL
{
  UIDocumentInteractionController *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSURL *v9;

  v9 = URL;
  v4 = self;
  objc_sync_enter(v4);
  -[UIDocumentInteractionController previewControllerItem](v4, "previewControllerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSURL isEqual:](v9, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[UIDocumentInteractionController previewControllerItem](v4, "previewControllerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreviewItemURL:", v9);

    -[UIDocumentInteractionController _invalidate](v4, "_invalidate");
    -[UIDocumentInteractionController _updateURLIsContentManaged](v4, "_updateURLIsContentManaged");
  }
  objc_sync_exit(v4);

}

- (NSURL)URL
{
  UIDocumentInteractionController *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[UIDocumentInteractionController previewControllerItem](v2, "previewControllerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewItemURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSURL *)v4;
}

- (void)setUTI:(NSString *)UTI
{
  UIDocumentInteractionController *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSString *v9;

  v9 = UTI;
  v4 = self;
  objc_sync_enter(v4);
  -[UIDocumentInteractionController previewControllerItem](v4, "previewControllerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemContentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSString isEqual:](v9, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[UIDocumentInteractionController previewControllerItem](v4, "previewControllerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreviewItemContentType:", v9);

    -[UIDocumentInteractionController _invalidate](v4, "_invalidate");
  }
  objc_sync_exit(v4);

}

+ (id)_UTIForFileURL:(id)a3
{
  return _UIQLPreviewUTIForURLAndMimeType(a3, 0);
}

- (NSString)UTI
{
  UIDocumentInteractionController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = self;
  objc_sync_enter(v2);
  -[UIDocumentInteractionController previewControllerItem](v2, "previewControllerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_primitive_previewItemContentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIDocumentInteractionController name](v2, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UIDocumentInteractionController URL](v2, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2->_shouldDecompressArchiveIfNecessary
        && -[UIDocumentInteractionController _isFilenameValidForDecompressing:allowsPreviewingArchive:](v2, "_isFilenameValidForDecompressing:allowsPreviewingArchive:", v5, 0))
      {
        objc_msgSend(v6, "path");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByDeletingPathExtension");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v9;
      }
      +[UIDocumentInteractionController _UTIForFileURL:](UIDocumentInteractionController, "_UTIForFileURL:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (void)setName:(NSString *)name
{
  UIDocumentInteractionController *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSString *v9;

  v9 = name;
  v4 = self;
  objc_sync_enter(v4);
  -[UIDocumentInteractionController previewControllerItem](v4, "previewControllerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSString isEqual:](v9, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[UIDocumentInteractionController previewControllerItem](v4, "previewControllerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreviewItemTitle:", v9);

    -[UIDocumentInteractionController _invalidate](v4, "_invalidate");
  }
  objc_sync_exit(v4);

}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  UIDocumentInteractionController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[UIDocumentInteractionController URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self;
  objc_sync_enter(v6);
  -[UIDocumentInteractionController previewControllerItem](v6, "previewControllerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewItemTitle");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v5;
  v11 = v10;

  objc_sync_exit(v6);
  return (NSString *)v11;
}

- (NSArray)icons
{
  NSArray *icons;
  void *v4;
  void *v5;
  __CFString *v6;
  NSArray *v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  icons = self->_icons;
  if (!icons)
  {
    -[UIDocumentInteractionController _documentProxy](self, "_documentProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "typeIdentifier");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v6, "length")
        && (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5A58])
         || UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5A60])))
      {
        if (passKitIconsIfIsPassKitDocument_onceToken != -1)
          dispatch_once(&passKitIconsIfIsPassKitDocument_onceToken, &__block_literal_global_421);
        v12[0] = passKitIconsIfIsPassKitDocument_genericPassIcon;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

      if (!-[NSArray count](v7, "count"))
      {
        iconsToIncludeInIconArrayForDocumentProxy(v5);
        v8 = objc_claimAutoreleasedReturnValue();

        v7 = (NSArray *)v8;
      }
    }
    else
    {
      v7 = 0;
    }
    if (!-[NSArray count](v7, "count"))
    {
      if (genericDocumentIcons_onceToken != -1)
        dispatch_once(&genericDocumentIcons_onceToken, &__block_literal_global_418);
      v9 = (NSArray *)(id)genericDocumentIcons_icons;

      v7 = v9;
    }
    v10 = self->_icons;
    self->_icons = v7;

    icons = self->_icons;
  }
  return icons;
}

- (BOOL)_isImage
{
  const __CFString *v3;
  CGImageSourceRef v4;

  v3 = -[UIDocumentInteractionController UTI](self, "UTI");
  LODWORD(v4) = UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E0CA5B90]);
  if ((_DWORD)v4)
  {
    v4 = CGImageSourceCreateWithURL((CFURLRef)-[UIDocumentInteractionController URL](self, "URL"), 0);
    if (v4)
    {
      CFRelease(v4);
      LOBYTE(v4) = 1;
    }
  }
  return (char)v4;
}

- (NSArray)gestureRecognizers
{
  NSArray *gestureRecognizers;
  NSArray *v4;
  void *v5;
  void *v6;
  NSArray *v7;

  gestureRecognizers = self->_gestureRecognizers;
  if (!gestureRecognizers)
  {
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__presentPreview_);
    -[NSArray addObject:](v4, "addObject:", v5);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__presentOptionsMenu_);
    -[NSArray addObject:](v4, "addObject:", v6);
    v7 = self->_gestureRecognizers;
    self->_gestureRecognizers = v4;

    gestureRecognizers = self->_gestureRecognizers;
  }
  return gestureRecognizers;
}

- (void)_invalidate
{
  QLPreviewController *previewController;
  NSArray *icons;

  previewController = self->_previewController;
  self->_previewController = 0;

  icons = self->_icons;
  self->_icons = 0;

}

- (id)_documentProxy
{
  _BOOL8 isContentManaged;
  void *v4;
  void *v5;

  isContentManaged = self->_isContentManaged;
  -[UIDocumentInteractionController URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController _documentProxyWithIsContentManaged:usingURL:](self, "_documentProxyWithIsContentManaged:usingURL:", isContentManaged, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_documentProxyWithIsContentManaged:(BOOL)a3 usingURL:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;

  v4 = a3;
  v6 = a4;
  -[UIDocumentInteractionController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v14 = 0;
    goto LABEL_10;
  }
  if (-[UIDocumentInteractionController _shouldAutoDecompressIfArchive](self, "_shouldAutoDecompressIfArchive"))
  {
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[UIDocumentInteractionController UTI](self, "UTI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController previewControllerItem](self, "previewControllerItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIDocumentInteractionController _shouldAutoDecompressIfArchive](self, "_shouldAutoDecompressIfArchive"))
  {
    objc_msgSend(v11, "previewItemTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      objc_msgSend(v11, "_primitive_previewItemContentType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && !v16)
      {
        objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForURL:isContentManaged:sourceAuditToken:", v6, v4, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForName:type:MIMEType:isContentManaged:sourceAuditToken:", v8, v10, 0, v4, 0);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v14 = (void *)v13;

LABEL_10:
  return v14;
}

- (BOOL)_delegateExistsAndImplementsRequiredMethods:(id *)a3
{
  void *v5;
  __CFString *v6;
  BOOL v7;

  -[UIDocumentInteractionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((*(_BYTE *)&self->_documentInteractionControllerFlags & 1) != 0)
    {
      v7 = 1;
      goto LABEL_8;
    }
    v6 = CFSTR("UIDocumentInteractionController delegate must implement documentInteractionControllerViewControllerForPreview: to allow preview");
  }
  else
  {
    v6 = CFSTR("UIDocumentInteractionController has no delegate.  A delegate is required and must implement documentInteractionControllerViewControllerForPreview: to allow preview.");
  }
  v7 = 0;
  if (a3)
    *a3 = v6;
LABEL_8:

  return v7;
}

- (void)setPreviewURLOverride:(id)a3
{
  UIDocumentInteractionController *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[UIDocumentInteractionController previewControllerItem](v4, "previewControllerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItemURLOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[UIDocumentInteractionController previewControllerItem](v4, "previewControllerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreviewItemURLOverride:", v9);

    -[UIDocumentInteractionController _invalidate](v4, "_invalidate");
  }
  objc_sync_exit(v4);

}

- (BOOL)_shouldReturnDefaultApplication
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CA5B90];
  v20[0] = *MEMORY[0x1E0CA5C20];
  v20[1] = v3;
  v4 = *MEMORY[0x1E0CA5CB8];
  v20[2] = *MEMORY[0x1E0CA5AC8];
  v20[3] = v4;
  v20[4] = *MEMORY[0x1E0CA5C00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController UTI](self, "UTI");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        if (UTTypeConformsTo(v6, *(CFStringRef *)(*((_QWORD *)&v15 + 1) + 8 * i)))
        {
          -[UIDocumentInteractionController previewControllerItem](self, "previewControllerItem", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = _UIQLCanPreviewItem(v13) ^ 1;

          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  LOBYTE(v12) = 1;
LABEL_11:

  return v12;
}

- (id)_defaultApplication
{
  void *v3;

  if (-[UIDocumentInteractionController _shouldReturnDefaultApplication](self, "_shouldReturnDefaultApplication"))
  {
    -[UIDocumentInteractionController _preferredApplicationForDocumentOpening](self, "_preferredApplicationForDocumentOpening");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_dismissEverythingWithExtremePrejudiceAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  BOOL v9;

  v3 = a3;
  if ((_UIAppUseModernRotationAndPresentationBehaviors() & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "userInterfaceIdiom"),
        v5,
        (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    -[UIDocumentInteractionController activityViewController](self, "activityViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v3, 0);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__UIDocumentInteractionController__dismissEverythingWithExtremePrejudiceAnimated___block_invoke;
    block[3] = &unk_1E4001A38;
    block[4] = self;
    v9 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __82__UIDocumentInteractionController__dismissEverythingWithExtremePrejudiceAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "popoverController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissPopoverAnimated:", *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)isArchive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  -[UIDocumentInteractionController URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIDocumentInteractionController _isFilenameValidForDecompressing:allowsPreviewingArchive:](self, "_isFilenameValidForDecompressing:allowsPreviewingArchive:", v5, 1))
  {
    -[UIDocumentInteractionController URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = !-[UIDocumentInteractionController _isPackageArchive:](self, "_isPackageArchive:", v6);

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)extractSubitemFromArchive:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__UIDocumentInteractionController_extractSubitemFromArchive_completion___block_invoke;
  v10[3] = &unk_1E40035B8;
  v11 = v6;
  v7 = v6;
  -[UIDocumentInteractionController __decompressArchiveAndSetupPayload:completion:](self, "__decompressArchiveAndSetupPayload:completion:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __72__UIDocumentInteractionController_extractSubitemFromArchive_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (QLPreviewController)previewController
{
  QLPreviewController *previewController;
  QLPreviewController *v4;
  QLPreviewController *v5;

  previewController = self->_previewController;
  if (!previewController)
  {
    v4 = (QLPreviewController *)objc_alloc_init(_UIQLPreviewControllerClass());
    v5 = self->_previewController;
    self->_previewController = v4;

    -[QLPreviewController setDelegate:](self->_previewController, "setDelegate:", self);
    previewController = self->_previewController;
  }
  return previewController;
}

- (_UIDICPreviewItem)previewControllerItem
{
  _UIDICPreviewItem *previewControllerItem;
  _UIDICPreviewItem *v4;
  _UIDICPreviewItem *v5;

  previewControllerItem = self->_previewControllerItem;
  if (!previewControllerItem)
  {
    v4 = objc_alloc_init(_UIDICPreviewItem);
    v5 = self->_previewControllerItem;
    self->_previewControllerItem = v4;

    previewControllerItem = self->_previewControllerItem;
  }
  return previewControllerItem;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  *a5 = objc_retainAutorelease(self->_presentView);
  x = self->_presentRect.origin.x;
  y = self->_presentRect.origin.y;
  width = self->_presentRect.size.width;
  height = self->_presentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)previewControllerDidDismiss:(id)a3
{
  UIDocumentInteractionController *v3;
  UIDocumentInteractionController *v4;
  id WeakRetained;
  UIViewController *presentingViewController;
  QLPreviewController *previewController;

  v3 = objc_retainAutorelease(self);
  v4 = v3;
  if ((*(_BYTE *)&v3->_documentInteractionControllerFlags & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v3->_delegate);
    objc_msgSend(WeakRetained, "documentInteractionControllerDidEndPreview:", v4);

  }
  presentingViewController = v4->_presentingViewController;
  v4->_presentingViewController = 0;

  previewController = v4->_previewController;
  v4->_previewController = 0;

}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  void *v5;
  id WeakRetained;

  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 2) & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "documentInteractionControllerTransitionImageForPreview:contentRect:", self, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)previewController:(id)a3 canEditItem:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  if (-[UIDocumentInteractionController previewsPresentWithMarkup](self, "previewsPresentWithMarkup"))
  {
    -[UIDocumentInteractionController dismissActionsForPreviewController:](self, "dismissActionsForPreviewController:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)previewController:(id)a3 shouldSaveEditedItem:(id)a4
{
  return 0;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  Class v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[UIDocumentInteractionController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIDocumentInteractionController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentInteractionControllerMarkupDismissActions:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
          v14 = _UIQLDismissActionClass();
          objc_msgSend(v13, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "image");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __70__UIDocumentInteractionController_dismissActionsForPreviewController___block_invoke;
          v21[3] = &unk_1E40035E0;
          v21[4] = v13;
          -[objc_class actionWithTitle:image:handler:](v14, "actionWithTitle:image:handler:", v15, v16, v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "addObject:", v17);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v8, "count"))
      v18 = v8;
    else
      v18 = 0;

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

void __70__UIDocumentInteractionController_dismissActionsForPreviewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v21 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "editedFileURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v12, "editedFileURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("UIDocumentInteractionControllerResultModifiedURL"));

          }
          objc_msgSend(v12, "item");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "previewItemURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v12, "item");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "previewItemURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("UIDocumentInteractionControllerResultOriginalURL"));

          }
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(v21 + 32), "completionHandler");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v20)[2](v20, *(_QWORD *)(v21 + 32), v6);

    v4 = v22;
  }

}

- (void)markupAction:(id)a3
{
  void *v4;
  char v5;
  QLPreviewController *previewController;
  void *v7;
  void *v8;
  id v9;

  -[UIDocumentInteractionController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIDocumentInteractionController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    previewController = self->_previewController;
    -[QLPreviewController currentPreviewItem](previewController, "currentPreviewItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewItemURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewController:willMarkUpAtURL:", previewController, v8);

  }
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  void *v3;
  id WeakRetained;

  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "excludedActivityTypesForDocumentInteractionController:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)additionalActivitiesTypesForPreviewController:(id)a3
{
  void *v3;
  id WeakRetained;

  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "additionalActivitiesForDocumentInteractionController:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (BOOL)_canPreviewDecompressedArchive
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[UIDocumentInteractionController URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIDocumentInteractionController _isFilenameValidForDecompressing:allowsPreviewingArchive:](self, "_isFilenameValidForDecompressing:allowsPreviewingArchive:", v4, 0))
  {
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;
  -[UIDocumentInteractionController previewControllerItem](self, "previewControllerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_primitive_previewItemContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UIQLPreviewUTIForURLAndMimeType(v9, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = _UIQLCanPreviewContentWithUTI(v8);

  return v10;
}

- (void)_clearPreviousPresentationContext
{
  UIView *presentView;
  UIBarButtonItem *presentItem;

  presentView = self->_presentView;
  self->_presentView = 0;

  presentItem = self->_presentItem;
  self->_presentItem = 0;

}

- (BOOL)_presentOptionsMenuAnimated:(BOOL)a3 willPresentBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id location;

  v4 = a3;
  v6 = a4;
  -[UIDocumentInteractionController _clearPreviousPresentationContext](self, "_clearPreviousPresentationContext");
  if (-[UIDocumentInteractionController _shouldAutoDecompressIfArchive](self, "_shouldAutoDecompressIfArchive"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__UIDocumentInteractionController__presentOptionsMenuAnimated_willPresentBlock___block_invoke;
    v8[3] = &unk_1E4003608;
    objc_copyWeak(&v10, &location);
    v9 = v6;
    v11 = v4;
    -[UIDocumentInteractionController _decompressArchiveAndSetupPayload:](self, "_decompressArchiveAndSetupPayload:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (-[UIDocumentInteractionController _setupForOptionsMenu](self, "_setupForOptionsMenu"))
  {
    (*((void (**)(id, UIDocumentInteractionController *))v6 + 2))(v6, self);
    _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(self, v4);
  }

  return 1;
}

void __80__UIDocumentInteractionController__presentOptionsMenuAnimated_willPresentBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
  {
    v7 = WeakRetained;
    v6 = objc_msgSend(WeakRetained, "_setupForOptionsMenu");
    v5 = v7;
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(v7, *(unsigned __int8 *)(a1 + 48));
      v5 = v7;
    }
  }

}

- (BOOL)presentOptionsMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
  _BOOL8 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *v11;
  UIView *v12;
  _QWORD v14[4];
  UIView *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;

  v5 = animated;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v11 = view;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__UIDocumentInteractionController_presentOptionsMenuFromRect_inView_animated___block_invoke;
  v14[3] = &unk_1E4003630;
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  v15 = v11;
  v12 = v11;
  LOBYTE(v5) = -[UIDocumentInteractionController _presentOptionsMenuAnimated:willPresentBlock:](self, "_presentOptionsMenuAnimated:willPresentBlock:", v5, v14);

  return v5;
}

__n128 __78__UIDocumentInteractionController_presentOptionsMenuFromRect_inView_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 56) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v2;
  objc_storeStrong((id *)(a2 + 72), *(id *)(a1 + 32));
  return result;
}

- (BOOL)presentOptionsMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  _BOOL8 v4;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  _QWORD v9[4];
  UIBarButtonItem *v10;

  v4 = animated;
  v6 = item;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__UIDocumentInteractionController_presentOptionsMenuFromBarButtonItem_animated___block_invoke;
  v9[3] = &unk_1E4003658;
  v10 = v6;
  v7 = v6;
  LOBYTE(v4) = -[UIDocumentInteractionController _presentOptionsMenuAnimated:willPresentBlock:](self, "_presentOptionsMenuAnimated:willPresentBlock:", v4, v9);

  return v4;
}

void __80__UIDocumentInteractionController_presentOptionsMenuFromBarButtonItem_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 80), *(id *)(a1 + 32));
}

- (id)presentingNavigationController
{
  UIViewController *presentingViewController;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    presentingViewController = self->_presentingViewController;
  else
    presentingViewController = 0;
  return presentingViewController;
}

- (BOOL)presentPreviewAnimated:(BOOL)animated
{
  _BOOL8 v3;
  void *v5;

  v3 = animated;
  -[UIDocumentInteractionController previewController](self, "previewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdditionalRightBarButtonItems:", MEMORY[0x1E0C9AA60]);

  return -[UIDocumentInteractionController __presentPreviewAnimated:](self, "__presentPreviewAnimated:", v3);
}

- (BOOL)__presentPreviewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = -[UIDocumentInteractionController _setupPreviewController](self, "_setupPreviewController");
  if (v5)
  {
    -[UIDocumentInteractionController previewController](self, "previewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIShimSetIsContentManaged(v6, -[UIDocumentInteractionController isContentManaged](self, "isContentManaged"));

    -[UIDocumentInteractionController previewController](self, "previewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentInteractionController previewControllerItem](self, "previewControllerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentPreviewItem:onViewController:withDelegate:animated:", v8, self->_presentingViewController, self, v3);

  }
  return v5;
}

- (BOOL)_presentOpenInMenuAnimated:(BOOL)a3 willPresentBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id location;

  v4 = a3;
  v6 = a4;
  -[UIDocumentInteractionController _clearPreviousPresentationContext](self, "_clearPreviousPresentationContext");
  if (-[UIDocumentInteractionController _shouldAutoDecompressIfArchive](self, "_shouldAutoDecompressIfArchive"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__UIDocumentInteractionController__presentOpenInMenuAnimated_willPresentBlock___block_invoke;
    v8[3] = &unk_1E4003608;
    objc_copyWeak(&v10, &location);
    v9 = v6;
    v11 = v4;
    -[UIDocumentInteractionController _decompressArchiveAndSetupPayload:](self, "_decompressArchiveAndSetupPayload:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (-[UIDocumentInteractionController _setupForOpenInMenu](self, "_setupForOpenInMenu"))
  {
    (*((void (**)(id, UIDocumentInteractionController *))v6 + 2))(v6, self);
    _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(self, v4);
  }

  return 1;
}

void __79__UIDocumentInteractionController__presentOpenInMenuAnimated_willPresentBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (a2)
  {
    v7 = WeakRetained;
    v6 = objc_msgSend(WeakRetained, "_setupForOpenInMenu");
    v5 = v7;
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      _UIDocumentInteractionControllerPresentPopoverOrShowActivityViewController(v7, *(unsigned __int8 *)(a1 + 48));
      v5 = v7;
    }
  }

}

- (BOOL)presentOpenInMenuFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated
{
  _BOOL8 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *v11;
  UIView *v12;
  _QWORD v14[4];
  UIView *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;

  v5 = animated;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v11 = view;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__UIDocumentInteractionController_presentOpenInMenuFromRect_inView_animated___block_invoke;
  v14[3] = &unk_1E4003630;
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  v15 = v11;
  v12 = v11;
  LOBYTE(v5) = -[UIDocumentInteractionController _presentOpenInMenuAnimated:willPresentBlock:](self, "_presentOpenInMenuAnimated:willPresentBlock:", v5, v14);

  return v5;
}

__n128 __77__UIDocumentInteractionController_presentOpenInMenuFromRect_inView_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 56) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v2;
  objc_storeStrong((id *)(a2 + 72), *(id *)(a1 + 32));
  return result;
}

- (BOOL)presentOpenInMenuFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated
{
  _BOOL8 v4;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  _QWORD v9[4];
  UIBarButtonItem *v10;

  v4 = animated;
  v6 = item;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__UIDocumentInteractionController_presentOpenInMenuFromBarButtonItem_animated___block_invoke;
  v9[3] = &unk_1E4003658;
  v10 = v6;
  v7 = v6;
  LOBYTE(v4) = -[UIDocumentInteractionController _presentOpenInMenuAnimated:willPresentBlock:](self, "_presentOpenInMenuAnimated:willPresentBlock:", v4, v9);

  return v4;
}

void __79__UIDocumentInteractionController_presentOpenInMenuFromBarButtonItem_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 80), *(id *)(a1 + 32));
}

- (void)dismissPreviewAnimated:(BOOL)animated
{
  _BOOL8 v3;
  id v4;

  v3 = animated;
  -[UIDocumentInteractionController previewController](self, "previewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissModalViewControllerAnimated:", v3);

}

- (void)dismissMenuAnimated:(BOOL)animated
{
  _BOOL8 v3;

  v3 = animated;
  if (!-[_UIDICActivityViewController isPerformingActivity](self->_activityViewController, "isPerformingActivity"))
    -[UIDocumentInteractionController _dismissEverythingWithExtremePrejudiceAnimated:](self, "_dismissEverythingWithExtremePrejudiceAnimated:", v3);
}

- (void)_presentPreview:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[UIDocumentInteractionController presentPreviewAnimated:](self, "presentPreviewAnimated:", 1))
  {
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](self, "presentOptionsMenuFromRect:inView:animated:", v4, 1);

  }
}

- (void)_presentOptionsMenu:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](self, "presentOptionsMenuFromRect:inView:animated:", v4, 1);

  }
}

- (void)openDocumentWithDefaultApplication
{
  id v3;

  -[UIDocumentInteractionController _preferredApplicationForDocumentOpening](self, "_preferredApplicationForDocumentOpening");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController _openDocumentWithApplication:](self, "_openDocumentWithApplication:", v3);

}

- (void)_openDocumentWithApplication:(id)a3
{
  id v4;
  void *v5;
  char CanOpenInPlaceByReferenceOriginalFile;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  char v17;
  id location;

  v4 = a3;
  -[UIDocumentInteractionController URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CanOpenInPlaceByReferenceOriginalFile = _UIApplicationCanOpenInPlaceByReferenceOriginalFile(v4, v5);

  v7 = -[UIDocumentInteractionController _shouldAutoDecompressIfArchive](self, "_shouldAutoDecompressIfArchive");
  location = 0;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__UIDocumentInteractionController__openDocumentWithApplication___block_invoke;
  v14[3] = &unk_1E4003680;
  objc_copyWeak(&v16, &location);
  v17 = CanOpenInPlaceByReferenceOriginalFile;
  v9 = v4;
  v15 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1A1AE9514](v14);
  v11 = v10;
  if (v7)
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __64__UIDocumentInteractionController__openDocumentWithApplication___block_invoke_2;
    v12[3] = &unk_1E40035B8;
    v13 = v10;
    -[UIDocumentInteractionController _decompressArchiveAndSetupPayload:](self, "_decompressArchiveAndSetupPayload:", v12);

  }
  else
  {
    v10[2](v10);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __64__UIDocumentInteractionController__openDocumentWithApplication___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = WeakRetained;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(WeakRetained, "__openUsingInPlaceMechanismToTransferDocumentToApplication:", v3);
  else
    objc_msgSend(WeakRetained, "__openUsingDefaultCopyMechanismToTransferDocumentToApplication:", v3);

}

uint64_t __64__UIDocumentInteractionController__openDocumentWithApplication___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)__openUsingDefaultCopyMechanismToTransferDocumentToApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL CanOpenInPlaceByCopyingFromOriginalFile;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController _invokeDelegateWillBeginOpenWithApplicationIdentifier:](self, "_invokeDelegateWillBeginOpenWithApplicationIdentifier:", v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CanOpenInPlaceByCopyingFromOriginalFile = _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile(v4, v7);

  if (CanOpenInPlaceByCopyingFromOriginalFile)
  {
    -[UIDocumentInteractionController URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v9, "ui_bookmarkForExportWithError:", &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    objc_msgSend(v6, "setValue:forKey:", v10, *MEMORY[0x1E0CA57E0]);

    objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CA5818]);
    -[UIDocumentInteractionController __performLaunchServiceDocumentOpenWithApplication:launchServiceOptions:](self, "__performLaunchServiceDocumentOpenWithApplication:launchServiceOptions:", v4, v6);
    objc_msgSend(v4, "applicationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentInteractionController _invokeDelegateDidFinishOpenWithApplicationIdentifier:](self, "_invokeDelegateDidFinishOpenWithApplicationIdentifier:", v12);

  }
  else
  {
    -[UIDocumentInteractionController __performLaunchServiceDocumentOpenWithApplication:launchServiceOptions:](self, "__performLaunchServiceDocumentOpenWithApplication:launchServiceOptions:", v4, v6);
  }

}

- (void)__openUsingInPlaceMechanismToTransferDocumentToApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (*v7)(uint64_t, uint64_t, void *);
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController _invokeDelegateWillBeginOpenWithApplicationIdentifier:](self, "_invokeDelegateWillBeginOpenWithApplicationIdentifier:", v5);
  -[UIDocumentInteractionController URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke;
  v10[3] = &unk_1E40036D0;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v7 = (void (*)(uint64_t, uint64_t, void *))softLinkFPExtendBookmarkForDocumentURL;
  v8 = v5;
  v9 = v4;
  v7((uint64_t)v6, (uint64_t)v8, v10);

}

void __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = (void *)objc_msgSend(a2, "copy");
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke_2;
  v8[3] = &unk_1E40036A8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v4, v8);

}

void __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CA57E0]);
  objc_msgSend(v2, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA5818]);
  objc_msgSend(*(id *)(a1 + 40), "__performLaunchServiceDocumentOpenWithApplication:launchServiceOptions:", *(_QWORD *)(a1 + 48), v2);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke_3;
  v3[3] = &unk_1E4001248;
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __94__UIDocumentInteractionController___openUsingInPlaceMechanismToTransferDocumentToApplication___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invokeDelegateDidFinishOpenWithApplicationIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)__performLaunchServiceDocumentOpenWithApplication:(id)a3 launchServiceOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *decompressedArchiveDocumentURL;
  NSURL *v12;
  void *v13;
  _BOOL4 CanOpenInPlaceByCopyingFromOriginalFile;
  NSURL *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v20[2];

  v6 = a3;
  v7 = a4;
  -[UIDocumentInteractionController annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController URL](self, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  decompressedArchiveDocumentURL = self->_decompressedArchiveDocumentURL;
  if (decompressedArchiveDocumentURL)
  {
    v12 = decompressedArchiveDocumentURL;
LABEL_5:
    v15 = v12;

    v10 = v15;
    goto LABEL_6;
  }
  -[UIDocumentInteractionController URL](self, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CanOpenInPlaceByCopyingFromOriginalFile = _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile(v6, v13);

  if (CanOpenInPlaceByCopyingFromOriginalFile)
  {
    -[UIDocumentInteractionController physicalURL](self, "physicalURL");
    v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  _UIActivityDefaultOpenApplicationLaunchServiceOptions();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "addEntriesFromDictionary:", v7);
  memset(v20, 0, sizeof(v20));
  _SharingUIAuditTokenForCurrentProcess((uint64_t)v20);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v10, v9, self->_uniqueIdentifier, self->_isContentManaged, v20, v8, v17, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_setAssociatedObject(v19, "_UIDICLaunchApplicationOperationTargetApplicationIdentifierProperty", v9, (void *)0x303);
  objc_msgSend(v19, "start");

}

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__UIDocumentInteractionController_openResourceOperation_didFinishCopyingResource___block_invoke;
  v7[3] = &unk_1E4001248;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __82__UIDocumentInteractionController_openResourceOperation_didFinishCopyingResource___block_invoke(uint64_t a1)
{
  id v2;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) & 4) != 0)
  {
    objc_getAssociatedObject(*(id *)(a1 + 40), "_UIDICLaunchApplicationOperationTargetApplicationIdentifierProperty");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_invokeDelegateDidFinishOpenWithApplicationIdentifier:", v2);

  }
}

- (id)_preferredApplicationForDocumentOpening
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  -[UIDocumentInteractionController _appOpeningDocumentProxy](self, "_appOpeningDocumentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__UIDocumentInteractionController__preferredApplicationForDocumentOpening__block_invoke;
  v8[3] = &unk_1E40036F8;
  v8[4] = &v9;
  _UIEnumerateApplicationsInPreferredOrderForOpeningDocument(v2, v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __74__UIDocumentInteractionController__preferredApplicationForDocumentOpening__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

- (id)_appOpeningDocumentProxy
{
  void *v3;
  void *v4;
  void *v5;

  -[UIDocumentInteractionController URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIDocumentInteractionController physicalURL](self, "physicalURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentInteractionController _documentProxyWithIsContentManaged:usingURL:](self, "_documentProxyWithIsContentManaged:usingURL:", self->_isContentManaged, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIDocumentInteractionController _documentProxy](self, "_documentProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)physicalURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[UIDocumentInteractionController URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController URL](self, "URL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_CFURLPromiseCopyPhysicalURL();

  -[UIDocumentInteractionController URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v5);

  if ((v4 & 1) == 0 && v5)
  {
    v7 = v5;

    v3 = v7;
  }

  return v3;
}

- (void)_invokeDelegateWillBeginOpenWithApplicationIdentifier:(id)a3
{
  UIDocumentInteractionControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 2) != 0)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "documentInteractionController:willBeginSendingToApplication:", self, v5);

  }
}

- (void)_invokeDelegateDidFinishOpenWithApplicationIdentifier:(id)a3
{
  UIDocumentInteractionControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 4) != 0)
  {
    p_delegate = &self->_delegate;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "documentInteractionController:didEndSendingToApplication:", self, v5);

  }
}

- (id)_preparedActivityViewControllerWithItems:(id)a3 activities:(id)a4 options:(unint64_t)a5
{
  unint64_t v7;
  id v8;
  id v9;
  _UIDICActivityViewController *v10;

  v7 = self->_isContentManaged | a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_UIDICActivityViewController initWithActivityItems:applicationActivities:options:]([_UIDICActivityViewController alloc], "initWithActivityItems:applicationActivities:options:", v9, v8, v7);

  -[_UIDICActivityViewController setDocumentInteractionActivityDelegate:](v10, "setDocumentInteractionActivityDelegate:", self);
  -[UIDocumentInteractionController setActivityViewController:](self, "setActivityViewController:", v10);
  return v10;
}

- (BOOL)_setupForOptionsMenu
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  _UIDICActivityItemProvider *v9;
  void *v10;
  _UIDICActivityItemProvider *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  UIPopoverController *v30;
  UIPopoverController *popoverController;
  $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags;
  id v33;
  id v35;
  _QWORD v36[3];
  uint8_t buf[4];
  void *v38;
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController _fixupFileExtensionIfNeeded](self, "_fixupFileExtensionIfNeeded");
  if (-[UIDocumentInteractionController _shouldIncludePreviewActivity](self, "_shouldIncludePreviewActivity"))
  {
    v4 = -[UIDocumentInteractionController _newPreviewActivity](self, "_newPreviewActivity");
    objc_msgSend(v3, "addObject:", v4);

  }
  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "additionalActivitiesForDocumentInteractionController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
      objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  v7 = 0;
  v39[0] = sel_print_;
  v39[1] = sel_copy_;
  v39[2] = sel_saveToCameraRoll_;
  do
  {
    v8 = -[UIDocumentInteractionController _newActivityIfNecessaryForLegacyActionDelegatingWithAction:](self, "_newActivityIfNecessaryForLegacyActionDelegatingWithAction:", v39[v7]);
    if (v8)
      objc_msgSend(v3, "addObject:", v8);

    ++v7;
  }
  while (v7 != 3);
  v35 = 0;
  objc_initWeak(&v35, self);
  v9 = [_UIDICActivityItemProvider alloc];
  -[UIDocumentInteractionController URL](self, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIDICActivityItemProvider initWithPlaceholderItem:documentInteractionController:](v9, "initWithPlaceholderItem:documentInteractionController:", v10, self);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 0x80) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "activityItemForDocumentInteractionController:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      share_sheet_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v13;
        _os_log_impl(&dword_19E419000, v15, OS_LOG_TYPE_DEFAULT, "delegateProvidedActivityItem: %@", buf, 0xCu);
      }

      objc_msgSend(v12, "removeAllObjects");
      objc_msgSend(v12, "addObject:", v13);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 2) & 1) != 0
    && (v16 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v16, "printInfoForDocumentInteractionController:", self),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v17))
  {
    objc_msgSend(v12, "addObject:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80C20], "printInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentInteractionController name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setJobName:", v19);

    objc_msgSend(v18, "setOutputType:", -[UIDocumentInteractionController _isImage](self, "_isImage"));
    objc_msgSend(v12, "addObject:", v18);

    v17 = 0;
  }
  -[UIDocumentInteractionController _preparedActivityViewControllerWithItems:activities:options:](self, "_preparedActivityViewControllerWithItems:activities:options:", v12, v3, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 0x20) != 0)
  {
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v22, "excludedActivityTypesForDocumentInteractionController:", self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v23);

  }
  if (-[UIDocumentInteractionController _delegateImplementsLegacyActions](self, "_delegateImplementsLegacyActions"))
  {
    v36[0] = CFSTR("com.apple.UIKit.activity.SaveToCameraRoll");
    v36[1] = CFSTR("com.apple.UIKit.activity.Print");
    v36[2] = CFSTR("com.apple.UIKit.activity.CopyToPasteboard");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v24);

  }
  share_sheet_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v21;
    _os_log_impl(&dword_19E419000, v25, OS_LOG_TYPE_DEFAULT, "excludedActivityTypes: %@", buf, 0xCu);
  }

  objc_msgSend(v20, "setExcludedActivityTypes:", v21);
  if ((_UIAppUseModernRotationAndPresentationBehaviors() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceIdiom");

    if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 1);
      v28 = objc_alloc(MEMORY[0x1E0DC3B48]);
      -[UIDocumentInteractionController activityViewController](self, "activityViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (UIPopoverController *)objc_msgSend(v28, "initWithContentViewController:", v29);
      popoverController = self->_popoverController;
      self->_popoverController = v30;

      -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    }
  }
  documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
  if ((*(_BYTE *)&documentInteractionControllerFlags & 0x20) != 0)
  {
    v33 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v33, "documentInteractionControllerWillPresentOptionsMenu:", self);

    documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
  }
  self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&documentInteractionControllerFlags & 0xFFF3FFFF | 0x40000);

  objc_destroyWeak(&v35);
  return 1;
}

- (BOOL)_setupForOpenInMenu
{
  void *v3;
  _UIDICActivityItemProvider *v4;
  void *v5;
  _UIDICActivityItemProvider *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  UIPopoverController *v15;
  UIPopoverController *popoverController;
  $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags;
  id v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController _fixupFileExtensionIfNeeded](self, "_fixupFileExtensionIfNeeded");
  v4 = [_UIDICActivityItemProvider alloc];
  -[UIDocumentInteractionController URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIDICActivityItemProvider initWithPlaceholderItem:documentInteractionController:](v4, "initWithPlaceholderItem:documentInteractionController:", v5, self);

  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentInteractionController _preparedActivityViewControllerWithItems:activities:options:](self, "_preparedActivityViewControllerWithItems:activities:options:", v7, v3, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "excludedActivityTypesForDocumentInteractionController:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExcludedActivityTypes:", v10);

  }
  if ((_UIAppUseModernRotationAndPresentationBehaviors() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 1);
      v13 = objc_alloc(MEMORY[0x1E0DC3B48]);
      -[UIDocumentInteractionController activityViewController](self, "activityViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (UIPopoverController *)objc_msgSend(v13, "initWithContentViewController:", v14);
      popoverController = self->_popoverController;
      self->_popoverController = v15;

      -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    }
  }
  documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
  if ((*(_BYTE *)&documentInteractionControllerFlags & 0x80) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "documentInteractionControllerWillPresentOpenInMenu:", self);

    documentInteractionControllerFlags = self->_documentInteractionControllerFlags;
  }
  self->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)(*(_DWORD *)&documentInteractionControllerFlags & 0xFFF3FFFF | 0x80000);

  return 1;
}

- (BOOL)_setupPreviewController
{
  void *v3;
  int v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  id WeakRetained;
  UIViewController *v9;
  UIViewController *presentingViewController;
  UIView *presentView;
  id v12;
  UIView *v13;
  UIView *v14;
  CGSize v15;
  UIView *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  NSObject *v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  UIBarButtonItem *presentItem;
  id v29;

  -[UIDocumentInteractionController _fixupFileExtensionIfNeeded](self, "_fixupFileExtensionIfNeeded");
  -[UIDocumentInteractionController previewControllerItem](self, "previewControllerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UIQLCanPreviewItem(v3);

  if (v4)
  {
    v29 = 0;
    v5 = -[UIDocumentInteractionController _delegateExistsAndImplementsRequiredMethods:](self, "_delegateExistsAndImplementsRequiredMethods:", &v29);
    v6 = v29;
    v7 = v6;
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "documentInteractionControllerViewControllerForPreview:", self);
      v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      presentingViewController = self->_presentingViewController;
      self->_presentingViewController = v9;

      presentView = self->_presentView;
      self->_presentView = 0;

      if ((*(_BYTE *)&self->_documentInteractionControllerFlags & 4) != 0)
      {
        v12 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v12, "documentInteractionControllerViewForPreview:", self);
        v13 = (UIView *)objc_claimAutoreleasedReturnValue();
        v14 = self->_presentView;
        self->_presentView = v13;

      }
      v15 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->_presentRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->_presentRect.size = v15;
      v16 = self->_presentView;
      if (v16)
      {
        if ((*(_BYTE *)&self->_documentInteractionControllerFlags & 2) != 0)
        {
          v22 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v22, "documentInteractionControllerRectForPreview:", self);
          self->_presentRect.origin.x = v23;
          self->_presentRect.origin.y = v24;
          self->_presentRect.size.width = v25;
          self->_presentRect.size.height = v26;

        }
        else
        {
          -[UIView bounds](v16, "bounds");
          self->_presentRect.origin.x = v17;
          self->_presentRect.origin.y = v18;
          self->_presentRect.size.width = v19;
          self->_presentRect.size.height = v20;
        }
      }
      presentItem = self->_presentItem;
      self->_presentItem = 0;

      if ((*(_BYTE *)&self->_documentInteractionControllerFlags & 8) == 0)
      {
        LOBYTE(v5) = 1;
        goto LABEL_18;
      }
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject documentInteractionControllerWillBeginPreview:](v21, "documentInteractionControllerWillBeginPreview:", self);
    }
    else
    {
      if (!v6)
      {
        LOBYTE(v5) = 0;
LABEL_18:

        return v5;
      }
      share_sheet_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[UIDocumentInteractionController _setupPreviewController].cold.1((uint64_t)v7, v21);
    }

    goto LABEL_18;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)_shouldIncludePreviewActivity
{
  void *v3;
  char v4;

  if ((*(_BYTE *)&self->_documentInteractionControllerFlags & 1) == 0)
    return 0;
  -[UIDocumentInteractionController previewControllerItem](self, "previewControllerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _UIQLCanPreviewItem(v3);

  return v4;
}

- (id)_newPreviewActivity
{
  id v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = +[_UIDICActionActivity newPreviewActionActivity](_UIDICActionActivity, "newPreviewActionActivity");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__UIDocumentInteractionController__newPreviewActivity__block_invoke;
  v4[3] = &unk_1E4003720;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "setActivityFinishedPerformingHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __54__UIDocumentInteractionController__newPreviewActivity__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentPreviewAnimated:", 1);

}

- (BOOL)_shouldIncludeActivityForLegacyDelegatingWithAction:(SEL)a3
{
  _BOOL4 v5;

  v5 = -[UIDocumentInteractionController _delegateImplementsLegacyActions](self, "_delegateImplementsLegacyActions");
  if (v5)
    LOBYTE(v5) = -[UIDocumentInteractionController _delegateCanPerformAction:](self, "_delegateCanPerformAction:", a3);
  return v5;
}

- (id)_newActivityIfNecessaryForLegacyActionDelegatingWithAction:(SEL)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9[2];
  id location;

  if (-[UIDocumentInteractionController _shouldIncludeActivityForLegacyDelegatingWithAction:](self, "_shouldIncludeActivityForLegacyDelegatingWithAction:"))
  {
    if (sel_print_ == a3)
    {
      v6 = +[_UIDICActionActivity newLegacyDelegationActionActivityForPrint](_UIDICActionActivity, "newLegacyDelegationActionActivityForPrint");
    }
    else if (sel_copy_ == a3)
    {
      v6 = +[_UIDICActionActivity newLegacyDelegationActionActivityForCopy](_UIDICActionActivity, "newLegacyDelegationActionActivityForCopy");
    }
    else
    {
      if (sel_saveToCameraRoll_ != a3)
      {
        v5 = 0;
LABEL_11:
        location = 0;
        objc_initWeak(&location, self);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __94__UIDocumentInteractionController__newActivityIfNecessaryForLegacyActionDelegatingWithAction___block_invoke;
        v8[3] = &unk_1E4003748;
        objc_copyWeak(v9, &location);
        v9[1] = (id)a3;
        objc_msgSend(v5, "setActivityPerformingHandler:", v8);
        objc_destroyWeak(v9);
        objc_destroyWeak(&location);
        return v5;
      }
      v6 = +[_UIDICActionActivity newLegacyDelegationActionActivityForSaveToCameraRoll](_UIDICActionActivity, "newLegacyDelegationActionActivityForSaveToCameraRoll");
    }
    v5 = v6;
    goto LABEL_11;
  }
  return 0;
}

uint64_t __94__UIDocumentInteractionController__newActivityIfNecessaryForLegacyActionDelegatingWithAction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_delegatePerformAction:", *(_QWORD *)(a1 + 40));

  return v3;
}

- (void)setShouldUnzipDocument:(BOOL)a3
{
  if (self->_shouldDecompressArchiveIfNecessary != a3)
  {
    self->_shouldDecompressArchiveIfNecessary = a3;
    -[UIDocumentInteractionController _invalidate](self, "_invalidate");
  }
}

- (BOOL)shouldUnzipDocument
{
  return self->_shouldDecompressArchiveIfNecessary;
}

+ (id)_archiveDecompressQueue
{
  if (_archiveDecompressQueue_onceToken != -1)
    dispatch_once(&_archiveDecompressQueue_onceToken, &__block_literal_global_37);
  return (id)_archiveDecompressQueue_theQueue;
}

uint64_t __58__UIDocumentInteractionController__archiveDecompressQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_archiveDecompressQueue_theQueue;
  _archiveDecompressQueue_theQueue = (uint64_t)v0;

  objc_msgSend((id)_archiveDecompressQueue_theQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)_archiveDecompressQueue_theQueue, "setName:", CFSTR("com.apple.archiveDecompressQueue"));
}

- (unint64_t)_archiveExtractionOptions
{
  return self->_excludeDotFilesFromArchiveListings;
}

- (id)_pathsInArchive:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v4 = a3;
  -[UIDocumentInteractionController URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIDocumentInteractionController _archiveExtractionOptions](self, "_archiveExtractionOptions");
  v7 = (void *)MEMORY[0x1E0CB34C8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__UIDocumentInteractionController__pathsInArchive___block_invoke;
  v13[3] = &unk_1E4002528;
  v14 = v5;
  v15 = v4;
  v16 = v6;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v7, "blockOperationWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDocumentInteractionController _archiveDecompressQueue](UIDocumentInteractionController, "_archiveDecompressQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v10);

  return v10;
}

void __51__UIDocumentInteractionController__pathsInArchive___block_invoke(uint64_t a1)
{
  _UIDICArchiveEnumerateFilePaths(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)__decompressArchiveAndSetupPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  UIDocumentInteractionController *v20;
  id v21;
  unint64_t v22;

  v6 = a3;
  v7 = a4;
  -[UIDocumentInteractionController URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIDocumentInteractionController _archiveExtractionOptions](self, "_archiveExtractionOptions");
  v10 = (void *)MEMORY[0x1E0CB34C8];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__UIDocumentInteractionController___decompressArchiveAndSetupPayload_completion___block_invoke;
  v17[3] = &unk_1E4003770;
  v18 = v8;
  v19 = v6;
  v20 = self;
  v21 = v7;
  v22 = v9;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  objc_msgSend(v10, "blockOperationWithBlock:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDocumentInteractionController _archiveDecompressQueue](UIDocumentInteractionController, "_archiveDecompressQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v14);

  return v14;
}

void __81__UIDocumentInteractionController___decompressArchiveAndSetupPayload_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_customExtactionRootURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _UIDICArchiveExtractArchiveSubpathToRoot(v2, v3, v4, *(void **)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_decompressArchiveAndSetupPayload:(id)a3
{
  id v4;
  UIDocumentInteractionController *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  UIDocumentInteractionController *v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__4;
  v11[4] = __Block_byref_object_dispose__4;
  v12 = 0;
  v5 = self;
  v12 = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__UIDocumentInteractionController__decompressArchiveAndSetupPayload___block_invoke;
  v8[3] = &unk_1E40037C0;
  v10 = v11;
  v6 = v4;
  v9 = v6;
  v7 = -[UIDocumentInteractionController __decompressArchiveAndSetupPayload:completion:](v5, "__decompressArchiveAndSetupPayload:completion:", 0, v8);

  _Block_object_dispose(v11, 8);
}

void __69__UIDocumentInteractionController__decompressArchiveAndSetupPayload___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setURL:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "previewControllerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setURLToDeleteOnDealloc:", v8);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__UIDocumentInteractionController__decompressArchiveAndSetupPayload___block_invoke_2;
  v15[3] = &unk_1E4003798;
  v11 = *(id *)(a1 + 32);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

uint64_t __69__UIDocumentInteractionController__decompressArchiveAndSetupPayload___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_setDecompressedArchiveDocumentURL:(id)a3
{
  UIDocumentInteractionController *v5;
  NSURL *v6;

  v6 = (NSURL *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_decompressedArchiveDocumentURL != v6)
    objc_storeStrong((id *)&v5->_decompressedArchiveDocumentURL, a3);
  objc_sync_exit(v5);

}

- (id)_decompressedArchiveDocumentURL
{
  UIDocumentInteractionController *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_decompressedArchiveDocumentURL;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_shouldAutoDecompressIfArchive
{
  UIDocumentInteractionController *v2;
  void *v3;
  void *v4;

  if (!self->_shouldDecompressArchiveIfNecessary)
    return 0;
  v2 = self;
  -[UIDocumentInteractionController URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[UIDocumentInteractionController _isFilenameValidForDecompressing:allowsPreviewingArchive:](v2, "_isFilenameValidForDecompressing:allowsPreviewingArchive:", v4, 0);

  return (char)v2;
}

- (BOOL)_shouldAutoDecompressIfArchiveForPreview
{
  UIDocumentInteractionController *v2;
  void *v3;
  void *v4;

  if (!self->_shouldDecompressArchiveIfNecessary)
    return 0;
  v2 = self;
  -[UIDocumentInteractionController URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[UIDocumentInteractionController _isFilenameValidForDecompressing:allowsPreviewingArchive:](v2, "_isFilenameValidForDecompressing:allowsPreviewingArchive:", v4, 1);

  return (char)v2;
}

- (BOOL)_documentNeedsHelpDecompressingArchiveForPreview
{
  void *v2;
  char v3;

  -[UIDocumentInteractionController URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIQLPreviewNeedsHelpDecompressingURL(v2);

  return v3;
}

- (BOOL)_isPackageArchive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  const __CFString *v10;
  const __CFString *PreferredIdentifierForTag;
  const __CFString *v12;
  CFStringRef *v13;
  BOOL v14;
  const __CFString *v15;
  const __CFString *v16;
  char v17;
  char v18;
  _QWORD v20[4];
  __CFString *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v8 = -[UIDocumentInteractionController _isFilenameValidForDecompressing:allowsPreviewingArchive:](self, "_isFilenameValidForDecompressing:allowsPreviewingArchive:", v5, 0);
  if (v7)
    v9 = v8;
  else
    v9 = 0;
  if (v9 && (-[__CFString isEqualToString:](v7, "isEqualToString:", &stru_1E4004990) & 1) == 0)
  {
    v10 = (const __CFString *)*MEMORY[0x1E0CA5A88];
    PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v7, (CFStringRef)*MEMORY[0x1E0CA5B30]);
    v12 = PreferredIdentifierForTag;
    v13 = (CFStringRef *)MEMORY[0x1E0CA5C18];
    if (PreferredIdentifierForTag)
    {
      v14 = UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x1E0CA5C18]) != 0;
      *((_BYTE *)v24 + 24) = v14;
      CFRelease(v12);
    }
    if (*((_BYTE *)v24 + 24))
    {
      v15 = UTTypeCreatePreferredIdentifierForTag(v10, v7, 0);
      v16 = v15;
      if (v15)
      {
        if (!UTTypeConformsTo(v15, *v13))
        {
          *((_BYTE *)v24 + 24) = 0;
          v17 = -[UIDocumentInteractionController _archiveExtractionOptions](self, "_archiveExtractionOptions");
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __53__UIDocumentInteractionController__isPackageArchive___block_invoke;
          v20[3] = &unk_1E40037E8;
          v21 = v7;
          v22 = &v23;
          _UIDICArchiveEnumerateFilePaths(v4, v20, v17);

        }
        CFRelease(v16);
      }
    }
  }
  v18 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return v18;
}

void __53__UIDocumentInteractionController__isPackageArchive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "stringByDeletingLastPathComponent", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pathExtension");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v10)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (BOOL)_isFilenameValidForDecompressing:(id)a3 allowsPreviewingArchive:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  BOOL v12;

  v6 = a3;
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIIsArchiveExtension(v7))
  {
    _UIStringByDeletingArchiveExtensions(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentInteractionController previewControllerItem](self, "previewControllerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previewItemContentType");
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    if (!a4
      && UTTypeConformsTo(v11, (CFStringRef)*MEMORY[0x1E0CA5AC0])
      && (objc_msgSend(v9, "isEqualToString:", &stru_1E4004990) & 1) != 0)
    {
      v12 = 0;
      if (!v11)
        goto LABEL_10;
    }
    else
    {
      v12 = 1;
      if (!v11)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    CFRelease(v11);
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)_isValidURL:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3620];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isWritableFileAtPath:", v6);
  return (char)v4;
}

- (BOOL)_canSaveToCameraRollForType
{
  const __CFString *v2;
  BOOL v3;

  -[UIDocumentInteractionController UTI](self, "UTI");
  v2 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  if (!UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5BF8]))
  {
    v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5B90]) != 0;
    if (!v2)
      return v3;
    goto LABEL_3;
  }
  v3 = 1;
  if (v2)
LABEL_3:
    CFRelease(v2);
  return v3;
}

- (BOOL)_delegateImplementsLegacyActions
{
  return (*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 0x18) != 0;
}

- (BOOL)_delegateCanPerformAction:(SEL)a3
{
  id WeakRetained;

  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 8) == 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "documentInteractionController:canPerformAction:", self, a3);

  return (char)a3;
}

- (BOOL)_delegatePerformAction:(SEL)a3
{
  id WeakRetained;

  if ((*((_BYTE *)&self->_documentInteractionControllerFlags + 1) & 0x10) == 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "documentInteractionController:performAction:", self, a3);

  return (char)a3;
}

- (void)popoverController:(id)a3 animationCompleted:(int64_t)a4
{
  void *v6;
  UIDocumentInteractionController *v7;
  $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags;
  unsigned int v9;
  id v10;

  -[UIDocumentInteractionController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    v10 = v6;
    v7 = objc_retainAutorelease(self);
    documentInteractionControllerFlags = v7->_documentInteractionControllerFlags;
    if ((*(_DWORD *)&documentInteractionControllerFlags & 0x80000) != 0)
    {
      if ((*(_WORD *)&documentInteractionControllerFlags & 0x100) != 0)
      {
        objc_msgSend(v10, "documentInteractionControllerDidDismissOpenInMenu:", v7);
        documentInteractionControllerFlags = v7->_documentInteractionControllerFlags;
      }
      v9 = *(_DWORD *)&documentInteractionControllerFlags & 0xFFF7FFFF;
      v6 = v10;
      goto LABEL_10;
    }
    v6 = v10;
    if ((*(_DWORD *)&documentInteractionControllerFlags & 0x40000) != 0)
    {
      if ((*(_BYTE *)&documentInteractionControllerFlags & 0x40) != 0)
      {
        objc_msgSend(v10, "documentInteractionControllerDidDismissOptionsMenu:", v7);
        v6 = v10;
        documentInteractionControllerFlags = v7->_documentInteractionControllerFlags;
      }
      v9 = *(_DWORD *)&documentInteractionControllerFlags & 0xFFFBFFFF;
LABEL_10:
      v7->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)v9;
    }
  }

}

- (void)activityViewController:(id)a3 openActivityWillBeginSendingToApplication:(id)a4
{
  -[UIDocumentInteractionController _invokeDelegateWillBeginOpenWithApplicationIdentifier:](self, "_invokeDelegateWillBeginOpenWithApplicationIdentifier:", a4);
}

- (void)activityViewController:(id)a3 openActivityDidEndSendingToApplication:(id)a4
{
  -[UIDocumentInteractionController _invokeDelegateDidFinishOpenWithApplicationIdentifier:](self, "_invokeDelegateDidFinishOpenWithApplicationIdentifier:", a4);
}

- (void)activityViewController:(id)a3 didFinishPresentingActivityType:(id)a4
{
  id v6;
  UIDocumentInteractionController *v7;
  UIDocumentInteractionController *v8;
  $96AC07DEF895863040D76A221CD18CBC documentInteractionControllerFlags;
  id v10;
  unsigned int v11;
  id WeakRetained;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(self);
  v8 = v7;
  documentInteractionControllerFlags = v7->_documentInteractionControllerFlags;
  if ((*(_DWORD *)&documentInteractionControllerFlags & 0x80000) != 0)
  {
    if ((*(_WORD *)&documentInteractionControllerFlags & 0x100) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
      objc_msgSend(WeakRetained, "documentInteractionControllerDidDismissOpenInMenu:", v8);

      documentInteractionControllerFlags = v8->_documentInteractionControllerFlags;
    }
    v11 = *(_DWORD *)&documentInteractionControllerFlags & 0xFFF7FFFF;
    goto LABEL_9;
  }
  if ((*(_DWORD *)&documentInteractionControllerFlags & 0x40000) != 0)
  {
    if ((*(_BYTE *)&documentInteractionControllerFlags & 0x40) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&v7->_delegate);
      objc_msgSend(v10, "documentInteractionControllerDidDismissOptionsMenu:", v8);

      documentInteractionControllerFlags = v8->_documentInteractionControllerFlags;
    }
    v11 = *(_DWORD *)&documentInteractionControllerFlags & 0xFFFBFFFF;
LABEL_9:
    v8->_documentInteractionControllerFlags = ($96AC07DEF895863040D76A221CD18CBC)v11;
  }

}

- (void)activityViewController:(id)a3 didFinishPerformingActivityType:(id)a4 completed:(BOOL)a5 items:(id)a6 error:(id)a7
{
  void (**completionWithItemsHandler)(id, id, BOOL, id, id);
  id v9;

  completionWithItemsHandler = (void (**)(id, id, BOOL, id, id))self->_completionWithItemsHandler;
  if (completionWithItemsHandler)
  {
    completionWithItemsHandler[2](completionWithItemsHandler, a4, a5, a6, a7);
    v9 = self->_completionWithItemsHandler;
    self->_completionWithItemsHandler = 0;

  }
}

- (void)_fixupFileExtensionIfNeeded
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_19E419000, a3, OS_LOG_TYPE_ERROR, "ERROR: Couldn't create temporary folder at: %@. Error: %@", (uint8_t *)&v6, 0x16u);

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)annotation
{
  objc_storeStrong(&self->_annotation, annotation);
}

- (id)_completionWithItemsHandler
{
  return self->_completionWithItemsHandler;
}

- (void)_setCompletionWithItemsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (_UIDICActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (UIPopoverController)popoverController
{
  return self->_popoverController;
}

- (void)setPopoverController:(id)a3
{
  objc_storeStrong((id *)&self->_popoverController, a3);
}

- (NSURL)_customExtactionRootURL
{
  return self->__customExtactionRootURL;
}

- (void)_setCustomExtactionRootURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (BOOL)previewsPresentWithMarkup
{
  return self->_previewsPresentWithMarkup;
}

- (void)setPreviewsPresentWithMarkup:(BOOL)a3
{
  self->_previewsPresentWithMarkup = a3;
}

- (BOOL)excludeDotFilesFromArchiveListings
{
  return self->_excludeDotFilesFromArchiveListings;
}

- (void)setExcludeDotFilesFromArchiveListings:(BOOL)a3
{
  self->_excludeDotFilesFromArchiveListings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->__customExtactionRootURL, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong(&self->_completionWithItemsHandler, 0);
  objc_storeStrong(&self->_annotation, 0);
  objc_storeStrong((id *)&self->_previewControllerItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_decompressedArchiveDocumentURL, 0);
  objc_storeStrong((id *)&self->_tmpURLToDeleteOnDealloc, 0);
  objc_storeStrong((id *)&self->_presentItem, 0);
  objc_storeStrong((id *)&self->_presentView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

- (void)setDelegate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "ERROR: UIDocumentInteractionControllerDelegate implements legacy action methods. Please remove them.", v1, 2u);
}

- (void)_setupPreviewController
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "ERROR: %@", (uint8_t *)&v2, 0xCu);
}

@end
