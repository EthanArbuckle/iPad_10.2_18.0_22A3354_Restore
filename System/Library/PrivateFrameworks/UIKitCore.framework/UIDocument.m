@implementation UIDocument

+ (id)_typeForContentsOfURL:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  id *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v23;
  id v24;

  v5 = a3;
  v24 = 0;
  v6 = *MEMORY[0x1E0C99AD0];
  v23 = 0;
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v24, v6, &v23);
  v8 = v24;
  v9 = v23;
  v10 = v9;
  if (v7)
    v11 = v9 == 0;
  else
    v11 = 0;
  v12 = !v11 || v8 == 0;
  if (v12 || !objc_msgSend(v8, "length"))
  {
    objc_msgSend(v5, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pathExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = objc_claimAutoreleasedReturnValue();

      if (v16)
      {

        v10 = 0;
      }

      if (a4 && v10)
      {
        v10 = objc_retainAutorelease(v10);
        *a4 = v10;
      }
      v8 = (id)v16;
    }
    else
    {
      v17 = objc_msgSend(v5, "hasDirectoryPath");
      v18 = (id *)MEMORY[0x1E0CEC4F0];
      if (!v17)
        v18 = (id *)MEMORY[0x1E0CEC4A0];
      objc_msgSend(*v18, "identifier");
      v19 = objc_claimAutoreleasedReturnValue();

      v10 = 0;
      v8 = (id)v19;
    }
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v8, "length"))
    v20 = v8;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (UIDocument)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocument.m"), 348, CFSTR("do not call -[UIDocument init] - the designated initializer is -[UIDocument initWithFileURL:]"));

  return 0;
}

- (UIDocument)initWithFileURL:(NSURL *)url
{
  NSURL *v4;
  void *v5;
  BOOL v6;
  UIDocument *v7;
  UIDocument *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *fileAccessQueue;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *fileAccessSemaphore;
  NSOperationQueue *v13;
  NSOperationQueue *filePresenterQueue;
  NSLock *v15;
  NSLock *activityContinuationLock;
  NSDocumentDifferenceSize *v17;
  id differenceDueToRecentChanges;
  NSDocumentDifferenceSize *v19;
  id differenceSincePreservingPreviousVersion;
  NSDocumentDifferenceSize *v21;
  id differenceSinceSaving;
  uint64_t v23;
  NSMutableSet *progresses;
  void *v25;
  NSObject *v26;
  UIDocument *v27;
  objc_super v29;
  uint8_t buf[4];
  UIDocument *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = url;
  -[NSURL absoluteString](v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {

    goto LABEL_9;
  }
  v6 = -[NSURL isFileURL](v4, "isFileURL");

  if (!v6)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("must pass a valid file URL to -[UIDocument initWithFileURL:]"));
    v27 = 0;
    goto LABEL_10;
  }
  v29.receiver = self;
  v29.super_class = (Class)UIDocument;
  v7 = -[UIDocument init](&v29, sel_init);
  v8 = v7;
  if (v7)
  {
    -[UIDocument _setFileURL:](v7, "_setFileURL:", v4);
    v8->_lastPreservationTime = CFAbsoluteTimeGetCurrent();
    v9 = dispatch_queue_create("UIDocument File Access", 0);
    fileAccessQueue = v8->_fileAccessQueue;
    v8->_fileAccessQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_semaphore_create(0);
    fileAccessSemaphore = v8->_fileAccessSemaphore;
    v8->_fileAccessSemaphore = (OS_dispatch_semaphore *)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    filePresenterQueue = v8->_filePresenterQueue;
    v8->_filePresenterQueue = v13;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_filePresenterQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v8->_filePresenterQueue, "setName:", CFSTR("UIDocument File Presenting"));
    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    activityContinuationLock = v8->_activityContinuationLock;
    v8->_activityContinuationLock = v15;

    v17 = objc_alloc_init(NSDocumentDifferenceSize);
    differenceDueToRecentChanges = v8->_differenceDueToRecentChanges;
    v8->_differenceDueToRecentChanges = v17;

    v19 = objc_alloc_init(NSDocumentDifferenceSize);
    differenceSincePreservingPreviousVersion = v8->_differenceSincePreservingPreviousVersion;
    v8->_differenceSincePreservingPreviousVersion = v19;

    v21 = objc_alloc_init(NSDocumentDifferenceSize);
    differenceSinceSaving = v8->_differenceSinceSaving;
    v8->_differenceSinceSaving = v21;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    progresses = v8->_progresses;
    v8->_progresses = (NSMutableSet *)v23;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v8, sel__applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);
    objc_msgSend(v25, "addObserver:selector:name:object:", v8, sel__applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    _UIDocumentLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_DEFAULT, "initialized document instance: %@", buf, 0xCu);
    }

  }
  self = v8;
  v27 = self;
LABEL_10:

  return v27;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSTimer *autosavingTimer;
  NSUserActivity *currentUserActivity;
  void *v8;
  NSUserActivity *v9;
  NSUserActivity *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  objc_super v14;
  _QWORD v15[2];
  uint8_t buf[4];
  UIDocument *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "deallocing document instance: %@", buf, 0xCu);
  }

  if (os_variant_has_internal_diagnostics())
  {
    if ((*(_WORD *)&self->_docFlags & 0x200) != 0)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = self;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Document %@ is deallocating even though it is currently registered as a file presenter.", buf, 0xCu);
      }

    }
  }
  else if ((*(_WORD *)&self->_docFlags & 0x200) != 0)
  {
    v12 = dealloc___s_category_6;
    if (!dealloc___s_category_6)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&dealloc___s_category_6);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Document %@ is deallocating even though it is currently registered as a file presenter.", buf, 0xCu);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("UIApplicationWillResignActiveNotification");
  v15[1] = CFSTR("UIApplicationDidBecomeActiveNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  -[UIDocument _releaseUndoManager](self, "_releaseUndoManager");
  autosavingTimer = self->_autosavingTimer;
  if (autosavingTimer)
    -[NSTimer invalidate](autosavingTimer, "invalidate");
  if (self->_progressSubscriber)
    objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:");
  if ((*(_WORD *)&self->_docFlags & 0x2000) != 0)
    -[NSURL stopAccessingSecurityScopedResource](self->_fileURL, "stopAccessingSecurityScopedResource");
  currentUserActivity = self->_currentUserActivity;
  if (currentUserActivity)
  {
    v8 = (void *)UIApp;
    v9 = currentUserActivity;
    objc_msgSend(v8, "_removeDocument:forUserActivity:", self, v9);
    v10 = self->_currentUserActivity;
    self->_currentUserActivity = 0;

  }
  v14.receiver = self;
  v14.super_class = (Class)UIDocument;
  -[UIDocument dealloc](&v14, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  UIDocumentState v6;
  char v7;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  __int16 docFlags;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v18.receiver = self;
  v18.super_class = (Class)UIDocument;
  -[UIDocument description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR(" fileURL: %@ documentState: ["), self->_fileURL);
  v6 = -[UIDocument documentState](self, "documentState");
  if (v6)
  {
    v7 = v6;
    v8 = v6 & 1;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v5, "appendString:", CFSTR("Closed"));
      if ((v7 & 8) == 0)
      {
LABEL_4:
        if ((v7 & 2) == 0)
          goto LABEL_5;
        goto LABEL_18;
      }
    }
    else if ((v6 & 8) == 0)
    {
      goto LABEL_4;
    }
    if ((v7 & 1) != 0)
      v10 = CFSTR(" | EditingDisabled");
    else
      v10 = CFSTR("EditingDisabled");
    objc_msgSend(v5, "appendString:", v10);
    docFlags = (__int16)self->_docFlags;
    if ((docFlags & 0x100) != 0)
    {
      objc_msgSend(v5, "appendString:", CFSTR("(Permissions)"));
      docFlags = (__int16)self->_docFlags;
    }
    if ((docFlags & 0x80) != 0)
      objc_msgSend(v5, "appendString:", CFSTR("(Activity)"));
    v8 = 1;
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 4) == 0)
        goto LABEL_6;
      goto LABEL_22;
    }
LABEL_18:
    if (v8)
      v12 = CFSTR(" | InConflict");
    else
      v12 = CFSTR("InConflict");
    objc_msgSend(v5, "appendString:", v12);
    v8 = 1;
    if ((v7 & 4) == 0)
    {
LABEL_6:
      if ((v7 & 0x10) == 0)
      {
LABEL_33:
        v9 = CFSTR("]");
        goto LABEL_34;
      }
LABEL_26:
      if (v8)
        v14 = CFSTR(" | Progress");
      else
        v14 = CFSTR("Progress");
      objc_msgSend(v5, "appendString:", v14);
      -[UIDocument progress](self, "progress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isIndeterminate"))
      {
        objc_msgSend(v5, "appendString:", CFSTR(" (indet)"));
      }
      else
      {
        objc_msgSend(v15, "fractionCompleted");
        objc_msgSend(v5, "appendFormat:", CFSTR(" (%.0g)"), v16);
      }

      goto LABEL_33;
    }
LABEL_22:
    if (v8)
      v13 = CFSTR(" | SavingError");
    else
      v13 = CFSTR("SavingError");
    objc_msgSend(v5, "appendString:", v13);
    if ((v7 & 0x10) == 0)
      goto LABEL_33;
    goto LABEL_26;
  }
  v9 = CFSTR("Normal]");
LABEL_34:
  objc_msgSend(v5, "appendString:", v9);
  return (NSString *)v5;
}

- (void)_registerAsFilePresenterIfNecessary
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  UIDocument *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "document will register as file presenter if necessary on main thread: %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__UIDocument__registerAsFilePresenterIfNecessary__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[UIDocument _performBlockSynchronouslyOnMainThread:](self, "_performBlockSynchronouslyOnMainThread:", v4);
}

void __49__UIDocument__registerAsFilePresenterIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document running file presenter registration block on main thread: %@", (uint8_t *)&v6, 0xCu);
  }

  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 192) & 0x200) == 0)
  {
    _UIDocumentLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "registering document as file presenter: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", *(_QWORD *)(a1 + 32));
    *(_WORD *)(*(_QWORD *)(a1 + 32) + 192) |= 0x200u;
  }
}

- (void)_unregisterAsFilePresenterIfNecessary
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  UIDocument *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "document will unregister as file presenter if necessary on main thread: %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__UIDocument__unregisterAsFilePresenterIfNecessary__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[UIDocument _performBlockSynchronouslyOnMainThread:](self, "_performBlockSynchronouslyOnMainThread:", v4);
}

void __51__UIDocument__unregisterAsFilePresenterIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document running file presenter de-registration block on main thread: %@", (uint8_t *)&v6, 0xCu);
  }

  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 192) & 0x200) != 0)
  {
    _UIDocumentLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "unregistering document as file presenter: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", *(_QWORD *)(a1 + 32));
    *(_WORD *)(*(_QWORD *)(a1 + 32) + 192) &= ~0x200u;
  }
}

- (id)_userInfoForActivityContinuation
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[UIDocument fileURL](self, "fileURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6 = CFSTR("NSUserActivityDocumentURL");
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_titleForActivityContinuation
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  id v11;
  id v12;

  -[UIDocument fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v3 = *MEMORY[0x1E0C99A70];
  v11 = 0;
  v4 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v12, v3, &v11);
  v5 = v12;
  v6 = v11;
  v7 = v6;
  if (v4)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (v8)
  {
    NSLog(CFSTR("%s: Can't get localized name for URL %@: %@"), "-[UIDocument _titleForActivityContinuation]", v2, v6);
    objc_msgSend(v2, "lastPathComponent");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }

  return v5;
}

- (id)_userActivityWithActivityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIDocument _userInfoForActivityContinuation](self, "_userInfoForActivityContinuation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithActivityType:", v4);
    -[UIDocument _titleForActivityContinuation](self, "_titleForActivityContinuation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "setTitle:", v7);
    objc_msgSend(v6, "setUserInfo:", v5);
    objc_msgSend(v6, "becomeCurrent");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_documentIsUbiquitous
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[UIDocument fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ubiquityIdentityToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIDocument fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isUbiquitousItemAtURL:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_invalidateCurrentUserActivity
{
  NSUserActivity *currentUserActivity;
  NSUserActivity *v4;
  NSUserActivity *v5;

  -[NSLock lock](self->_activityContinuationLock, "lock");
  v5 = self->_currentUserActivity;
  currentUserActivity = self->_currentUserActivity;
  self->_currentUserActivity = 0;

  -[NSLock unlock](self->_activityContinuationLock, "unlock");
  v4 = v5;
  if (v5)
  {
    objc_msgSend((id)UIApp, "_removeDocument:forUserActivity:", self, v5);
    v4 = v5;
  }

}

- (id)_activityTypeIdentifierForCloudDocument:(BOOL *)a3
{
  BOOL *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  BOOL *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleDocumentTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = "-[UIDocument _activityTypeIdentifierForCloudDocument:]";
  if (_UIStateRestorationDebugLogEnabled())
  {
    -[UIDocument fileType](self, "fileType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Checking for document type matching file type %@. CFBundleDocumentTypes: %@"), "-[UIDocument _activityTypeIdentifierForCloudDocument:]", v8, v6);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: CFBundleDocumentTypes is an array"), "-[UIDocument _activityTypeIdentifierForCloudDocument:]");
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = v6;
    v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v35)
    {
      v30 = v6;
      v31 = v5;
      v10 = 0;
      v11 = *(_QWORD *)v42;
      v28 = *(_QWORD *)v42;
      v29 = v3;
      v33 = v9;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: Checking document type dictionary %@"), v7, v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (_UIStateRestorationDebugLogEnabled())
              NSLog(CFSTR("%s: document type dictionary is in fact a dictionary"), v7);
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSUbiquitousDocumentUserActivityType"));
            v14 = objc_claimAutoreleasedReturnValue();

            if (_UIStateRestorationDebugLogEnabled())
              NSLog(CFSTR("%s: Activity type identifier is %@"), v7, v14);
            if (v14)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (v3)
                  *v3 = 1;
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("LSItemContentTypes"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (_UIStateRestorationDebugLogEnabled())
                  NSLog(CFSTR("%s: Checking contentTypes: %@"), v7, v15);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v34 = (void *)v14;
                  if (_UIStateRestorationDebugLogEnabled())
                    NSLog(CFSTR("%s: contentTypes is an array"), v7);
                  v39 = 0u;
                  v40 = 0u;
                  v37 = 0u;
                  v38 = 0u;
                  v32 = v15;
                  v16 = v15;
                  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                  if (v17)
                  {
                    v18 = v17;
                    v19 = *(_QWORD *)v38;
                    while (2)
                    {
                      for (j = 0; j != v18; ++j)
                      {
                        if (*(_QWORD *)v38 != v19)
                          objc_enumerationMutation(v16);
                        v21 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
                        if (_UIStateRestorationDebugLogEnabled())
                          NSLog(CFSTR("%s: Checking contentType: %@"), v7, v21);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          if (_UIStateRestorationDebugLogEnabled())
                            NSLog(CFSTR("%s: contentType is a string"), v7);
                          -[UIDocument fileType](self, "fileType");
                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v22)
                          {
                            v23 = v7;
                            objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v22, 1);
                            v24 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v21, 1);
                            v25 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v24, "conformsToType:", v25))
                            {
                              if (_UIStateRestorationDebugLogEnabled())
                                NSLog(CFSTR("%s: document fileType %@ conforms to contentType %@, returning activity identifier %@"), v23, v22, v21, v34);
                              v10 = v34;

                              v26 = v10;
                              v6 = v30;
                              v5 = v31;
                              v9 = v33;
                              goto LABEL_57;
                            }

                            v7 = v23;
                          }

                        }
                      }
                      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                      if (v18)
                        continue;
                      break;
                    }
                  }

                  v11 = v28;
                  v3 = v29;
                  v9 = v33;
                  v14 = (uint64_t)v34;
                  v15 = v32;
                }

              }
              v10 = (id)v14;
            }
            else
            {
              v10 = 0;
            }
          }
        }
        v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v35);
      v26 = 0;
      v6 = v30;
      v5 = v31;
    }
    else
    {
      v10 = 0;
      v26 = 0;
    }
LABEL_57:

  }
  else
  {
    v10 = 0;
    v26 = 0;
  }

  return v26;
}

- (void)_reallyManageUserActivity
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v11 = 0;
  -[UIDocument _activityTypeIdentifierForCloudDocument:](self, "_activityTypeIdentifierForCloudDocument:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[UIDocument _documentIsUbiquitous](self, "_documentIsUbiquitous"))
  {
    -[UIDocument userActivity](self, "userActivity");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_8;
    v5 = (void *)v4;
    -[UIDocument userActivity](self, "userActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v3);

    if (v8)
    {
      -[UIDocument userActivity](self, "userActivity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNeedsSave:", 1);
    }
    else
    {
LABEL_8:
      -[UIDocument userActivity](self, "userActivity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        -[UIDocument _invalidateCurrentUserActivity](self, "_invalidateCurrentUserActivity");
      -[UIDocument _userActivityWithActivityType:](self, "_userActivityWithActivityType:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDocument setUserActivity:](self, "setUserActivity:", v9);
    }

    v11 = 0;
  }
  else if (v11)
  {
    -[UIDocument _invalidateCurrentUserActivity](self, "_invalidateCurrentUserActivity");
  }

}

- (void)_manageUserActivity
{
  _QWORD block[5];

  if (pthread_main_np() == 1)
  {
    -[UIDocument _reallyManageUserActivity](self, "_reallyManageUserActivity");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__UIDocument__manageUserActivity__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __33__UIDocument__manageUserActivity__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyManageUserActivity");
}

- (void)_clearUserActivity
{
  if (self->_currentUserActivity)
    -[UIDocument _invalidateCurrentUserActivity](self, "_invalidateCurrentUserActivity");
}

- (void)_setUserActivity:(id)a3
{
  NSUserActivity *v5;
  NSUserActivity *v6;

  v6 = (NSUserActivity *)a3;
  -[NSLock lock](self->_activityContinuationLock, "lock");
  v5 = self->_currentUserActivity;
  if (self->_currentUserActivity != v6)
    objc_storeStrong((id *)&self->_currentUserActivity, a3);
  -[NSLock unlock](self->_activityContinuationLock, "unlock");
  if (v5 != v6)
  {
    if (v5)
      objc_msgSend((id)UIApp, "_removeDocument:forUserActivity:", self, v5);
    if (v6)
      objc_msgSend((id)UIApp, "_addDocument:forUserActivity:", self, self->_currentUserActivity);
  }

}

- (void)setUserActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v4;
  _QWORD v5[5];
  NSUserActivity *v6;

  v4 = userActivity;
  if (pthread_main_np() == 1)
  {
    -[UIDocument _setUserActivity:](self, "_setUserActivity:", v4);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __30__UIDocument_setUserActivity___block_invoke;
    v5[3] = &unk_1E16B1B50;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __30__UIDocument_setUserActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUserActivity:", *(_QWORD *)(a1 + 40));
}

- (NSUserActivity)userActivity
{
  NSUserActivity *v3;

  -[NSLock lock](self->_activityContinuationLock, "lock");
  v3 = self->_currentUserActivity;
  -[NSLock unlock](self->_activityContinuationLock, "unlock");
  return v3;
}

- (void)updateUserActivityState:(NSUserActivity *)userActivity
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSUserActivity *v9;

  v9 = userActivity;
  -[UIDocument _userInfoForActivityContinuation](self, "_userInfoForActivityContinuation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSUserActivity addUserInfoEntriesFromDictionary:](v9, "addUserInfoEntriesFromDictionary:", v4);
  -[UIDocument _titleForActivityContinuation](self, "_titleForActivityContinuation");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[UIDocument userActivity](self, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = v5;
  else
    v8 = CFSTR("Document");
  objc_msgSend(v6, "setTitle:", v8);

  -[UIDocument autosaveWithCompletionHandler:](self, "autosaveWithCompletionHandler:", 0);
}

- (void)openWithCompletionHandler:(void *)completionHandler
{
  void *v5;
  NSObject *v6;
  void *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *v9;
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  OS_dispatch_queue *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  UIDocument *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = completionHandler;
  if (-[UIDocument _isInOpen](self, "_isInOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocument fileURL](self, "fileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocument.m"), 698, CFSTR("attempt to open or a revert document that already has an open or revert operation in flight: %@"), v15);

  }
  _UIDocumentLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "opening document: %@", buf, 0xCu);
  }

  -[UIDocument _setInOpen:](self, "_setInOpen:", 1);
  -[UIDocument fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_current_queue();
  v8 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  if (v8 == self->_fileAccessQueue)
  {
    v9 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];

    v8 = v9;
  }
  -[UIDocument _registerAsFilePresenterIfNecessary](self, "_registerAsFilePresenterIfNecessary");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__UIDocument_openWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E16B4420;
  v16[4] = self;
  v17 = v8;
  v18 = v7;
  v19 = v5;
  v11 = v5;
  v12 = v7;
  v13 = v8;
  -[UIDocument performAsynchronousFileAccessUsingBlock:](self, "performAsynchronousFileAccessUsingBlock:", v16);

}

void __40__UIDocument_openWithCompletionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  _WORD *v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[7];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)a1[4] + 10, a1[5]);
  v34 = 0;
  v35 = (id *)&v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__68;
  v38 = __Block_byref_object_dispose__68;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v41 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "attempting coordinated reading for document: %@", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", a1[4]);
  v5 = a1[6];
  v29 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __40__UIDocument_openWithCompletionHandler___block_invoke_211;
  v28[3] = &unk_1E16C3A38;
  v28[4] = a1[4];
  v28[5] = &v30;
  v28[6] = &v34;
  objc_msgSend(v4, "coordinateReadingItemAtURL:options:error:byAccessor:", v5, 0, &v29, v28);
  v7 = v29;
  v8 = v29;
  if (v8)
    objc_storeStrong(v35 + 5, v7);
  if (*((_BYTE *)v31 + 24))
  {
    _UIDocumentLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "document will update file modification date on main thread: %@", buf, 0xCu);
    }

    v11 = a1[4];
    v26[0] = v6;
    v26[1] = 3221225472;
    v26[2] = __40__UIDocument_openWithCompletionHandler___block_invoke_213;
    v26[3] = &unk_1E16B1B50;
    v26[4] = v11;
    v27 = a1[6];
    objc_msgSend(v11, "_performBlockSynchronouslyOnMainThread:", v26);

  }
  else if (!v35[5])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v35[5];
    v35[5] = (id)v12;

  }
  objc_msgSend(a1[4], "_setInOpen:", 0);
  objc_msgSend(a1[4], "_setOpen:", *((unsigned __int8 *)v31 + 24));
  if (*((_BYTE *)v31 + 24))
  {
    objc_msgSend(a1[4], "_manageUserActivity");
    v14 = a1[4];
    if ((v14[96] & 8) == 0)
      objc_msgSend(v14, "_updateLastUsedDate");
  }
  else
  {
    _UIDocumentLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = a1[4];
      v17 = v35[5];
      *(_DWORD *)buf = 138412546;
      v41 = v16;
      v42 = 2112;
      v43 = v17;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "document: %@ failed with error: %@", buf, 0x16u);
    }

    objc_msgSend(a1[4], "handleError:userInteractionPermitted:", v35[5], 1);
    objc_msgSend(a1[4], "_unregisterAsFilePresenterIfNecessary");
    objc_msgSend(a1[4], "_clearUserActivity");
  }
  if (a1[7])
  {
    _UIDocumentLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = a1[4];
      *(_DWORD *)buf = 138412290;
      v41 = v19;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "document will perform opening completion handler on calling queue: %@", buf, 0xCu);
    }

    v20 = a1[4];
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __40__UIDocument_openWithCompletionHandler___block_invoke_215;
    v23[3] = &unk_1E16C3A60;
    v23[4] = v20;
    v24 = a1[7];
    v25 = &v30;
    objc_msgSend(v20, "_performBlock:synchronouslyOnQueue:", v23, a1[5]);

  }
  v21 = a1[4];
  v22 = (void *)v21[10];
  v21[10] = 0;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

}

void __40__UIDocument_openWithCompletionHandler___block_invoke_211(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  id obj;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "file coordination lock received, now reading document: %@", buf, 0xCu);
  }

  v6 = (void *)a1[4];
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "readFromURL:error:", v3, &obj);

  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
}

uint64_t __40__UIDocument_openWithCompletionHandler___block_invoke_213(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document is updating file modification date on main thread: %@", (uint8_t *)&v7, 0xCu);
  }

  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 136) = CFAbsoluteTimeGetCurrent();
  v4 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "_fileModificationDateForURL:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileModificationDate:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_updateLocalizedName");
}

uint64_t __40__UIDocument_openWithCompletionHandler___block_invoke_215(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document is performing completion handler on calling queue: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_setFileURL:(id)a3
{
  id v4;
  UIDocument *v5;
  NSURL *v6;
  id *p_fileURL;
  __int16 v8;
  void *v9;
  NSURL *fileURL;
  uint64_t v11;
  id progressSubscriber;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "ui_URLByResolvingSymlinksAndCopyingSecurityScope");
  v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  p_fileURL = (id *)&v5->_fileURL;
  if (v6 != v5->_fileURL)
  {
    if (v5->_progressSubscriber)
      objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:");
    if ((*(_WORD *)&v5->_docFlags & 0x2000) != 0)
      objc_msgSend(*p_fileURL, "stopAccessingSecurityScopedResource");
    objc_storeStrong((id *)&v5->_fileURL, v6);
    if (dyld_program_sdk_at_least())
    {
      if (objc_msgSend(*p_fileURL, "startAccessingSecurityScopedResource"))
        v8 = 0x2000;
      else
        v8 = 0;
      *(_WORD *)&v5->_docFlags = *(_WORD *)&v5->_docFlags & 0xDFFF | v8;
    }
    objc_initWeak(&location, v5);
    v9 = (void *)MEMORY[0x1E0CB38A8];
    fileURL = v5->_fileURL;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __26__UIDocument__setFileURL___block_invoke;
    v13[3] = &unk_1E16C3A88;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v9, "_addSubscriberForFileURL:withPublishingHandler:", fileURL, v13);
    v11 = objc_claimAutoreleasedReturnValue();
    progressSubscriber = v5->_progressSubscriber;
    v5->_progressSubscriber = (id)v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v5);
  -[UIDocument _updateConflictState](v5, "_updateConflictState");

}

id __26__UIDocument__setFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_progressPublished:", v3);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __26__UIDocument__setFileURL___block_invoke_2;
  v9[3] = &unk_1E16B1500;
  objc_copyWeak(&v11, v4);
  v6 = v3;
  v10 = v6;
  v7 = (void *)objc_msgSend(v9, "copy");

  objc_destroyWeak(&v11);
  return v7;
}

void __26__UIDocument__setFileURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_progressUnpublished:", *(_QWORD *)(a1 + 32));

}

- (NSURL)fileURL
{
  UIDocument *v2;
  NSURL *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fileURL;
  objc_sync_exit(v2);

  return v3;
}

- (void)setFileType:(id)a3
{
  UIDocument *v4;
  uint64_t v5;
  NSString *fileType;
  NSString *v7;

  v7 = (NSString *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_fileType != v7)
  {
    v5 = -[NSString copy](v7, "copy");
    fileType = v4->_fileType;
    v4->_fileType = (NSString *)v5;

  }
  objc_sync_exit(v4);

}

- (NSString)fileType
{
  UIDocument *v2;
  NSString *fileType;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v2 = self;
  objc_sync_enter(v2);
  fileType = v2->_fileType;
  if (fileType)
  {
    v4 = fileType;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    -[UIDocument fileURL](v2, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v5, "_typeForContentsOfURL:error:", v6, &v8);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v2);

  return v4;
}

- (void)setFileModificationDate:(NSDate *)fileModificationDate
{
  UIDocument *v4;
  uint64_t v5;
  NSDate *v6;
  NSDate *v7;

  v7 = fileModificationDate;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_fileModificationDate != v7)
  {
    v5 = -[NSDate copy](v7, "copy");
    v6 = v4->_fileModificationDate;
    v4->_fileModificationDate = (NSDate *)v5;

  }
  objc_sync_exit(v4);

}

- (NSDate)fileModificationDate
{
  UIDocument *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fileModificationDate;
  objc_sync_exit(v2);

  return v3;
}

- (void)_updateLastUsedDate
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECD7D728)
  {
    v10 = xmmword_1E16C3CA8;
    v11 = 0;
    qword_1ECD7D728 = _sl_dlopen();
  }
  if (qword_1ECD7D728)
  {
    -[UIDocument fileURL](self, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__UIDocument__updateLastUsedDate__block_invoke;
    v9[3] = &unk_1E16C3AB0;
    v9[4] = self;
    v4 = v9;
    *(_QWORD *)&v10 = 0;
    *((_QWORD *)&v10 + 1) = &v10;
    v11 = 0x2020000000;
    v5 = off_1ECD7D730;
    v12 = off_1ECD7D730;
    if (!off_1ECD7D730)
    {
      v6 = FileProviderLibrary_0();
      v5 = dlsym(v6, "FPUpdateLastUsedDate");
      *(_QWORD *)(*((_QWORD *)&v10 + 1) + 24) = v5;
      off_1ECD7D730 = v5;
    }
    _Block_object_dispose(&v10, 8);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _FPUpdateLastUsedDate(CFURLRef, void (^__strong)(CFErrorRef))");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("UIDocument.m"), 54, CFSTR("%s"), dlerror());

      __break(1u);
    }
    ((void (*)(void *, _QWORD *))v5)(v3, v4);

  }
}

void __33__UIDocument__updateLastUsedDate__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _UIDocumentLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = a2;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "error %@ while updating the last used date on document %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)_setEditingTemporarilyDisabled:(BOOL)a3
{
  _UIDocumentSetEditingDisabled(self, a3, 1);
}

- (BOOL)_isEditingTemporarilyDisabled
{
  UIDocument *v2;
  _BOOL4 v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_WORD *)&v2->_docFlags >> 7) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setEditingDisabledDueToPermissions:(BOOL)a3
{
  _UIDocumentSetEditingDisabled(self, a3, 0);
}

- (BOOL)_isEditingDisabledDueToPermissions
{
  UIDocument *v2;
  _BOOL4 v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = HIBYTE(*(_WORD *)&v2->_docFlags) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setOpen:(BOOL)a3
{
  _BOOL8 v3;
  UIDocument *v5;
  __int16 docFlags;
  unsigned int v7;
  __int16 v8;
  int v9;
  void *v10;
  id v11;

  v3 = a3;
  -[UIDocument fileURL](self, "fileURL");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  docFlags = (__int16)v5->_docFlags;
  v7 = ((docFlags & 2) == 0) ^ v3;
  if ((v7 & 1) == 0)
  {
    if (v3)
      v8 = 2;
    else
      v8 = 0;
    docFlags = docFlags & 0xFFFD | v8;
    *(_WORD *)&v5->_docFlags = docFlags;
  }
  v9 = v7 ^ 1;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3648], "unresolvedConflictVersionsOfItemAtURL:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)&v5->_docFlags = *(_WORD *)&v5->_docFlags & 0xEFFF | ((objc_msgSend(v10, "count") != 0) << 12);

    v9 |= (unsigned __int16)((*(_WORD *)&v5->_docFlags ^ docFlags) & 0x1000) >> 12;
  }
  objc_sync_exit(v5);

  -[UIDocument _updatePermissionsState:](v5, "_updatePermissionsState:", v3);
  if (v9)
    -[UIDocument _sendStateChangedNotification](v5, "_sendStateChangedNotification");

}

- (BOOL)_isOpen
{
  UIDocument *v2;
  _BOOL4 v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_WORD *)&v2->_docFlags >> 1) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setInOpen:(BOOL)a3
{
  _BOOL4 v3;
  __int16 v4;
  UIDocument *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (v3)
    v4 = 4;
  else
    v4 = 0;
  *(_WORD *)&obj->_docFlags = *(_WORD *)&obj->_docFlags & 0xFFFB | v4;
  objc_sync_exit(obj);

}

- (BOOL)_isInOpen
{
  UIDocument *v2;
  _BOOL4 v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_WORD *)&v2->_docFlags >> 2) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setHasSavingError:(BOOL)a3
{
  _BOOL4 v3;
  __int16 docFlags;
  __int16 v5;
  UIDocument *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  docFlags = (__int16)obj->_docFlags;
  if (((((docFlags & 0x800) == 0) ^ v3) & 1) != 0)
  {
    objc_sync_exit(obj);

  }
  else
  {
    if (v3)
      v5 = 2048;
    else
      v5 = 0;
    *(_WORD *)&obj->_docFlags = docFlags & 0xF7FF | v5;
    objc_sync_exit(obj);

    -[UIDocument _sendStateChangedNotification](obj, "_sendStateChangedNotification");
  }
}

- (BOOL)_hasSavingError
{
  UIDocument *v2;
  _BOOL4 v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_WORD *)&v2->_docFlags >> 11) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setInConflict:(BOOL)a3
{
  _BOOL4 v3;
  __int16 docFlags;
  __int16 v5;
  UIDocument *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  docFlags = (__int16)obj->_docFlags;
  if (((((docFlags & 0x1000) == 0) ^ v3) & 1) != 0)
  {
    objc_sync_exit(obj);

  }
  else
  {
    if (v3)
      v5 = 4096;
    else
      v5 = 0;
    *(_WORD *)&obj->_docFlags = docFlags & 0xEFFF | v5;
    objc_sync_exit(obj);

    -[UIDocument _sendStateChangedNotification](obj, "_sendStateChangedNotification");
  }
}

- (BOOL)_isInConflict
{
  UIDocument *v2;
  _BOOL4 v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_WORD *)&v2->_docFlags >> 12) & 1;
  objc_sync_exit(v2);

  return v3;
}

- (void)_sendStateChangedNotification
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  UIDocument *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "document will send state changed notification on main thread: %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__UIDocument__sendStateChangedNotification__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[UIDocument _performBlockSynchronouslyOnMainThread:](self, "_performBlockSynchronouslyOnMainThread:", v4);
}

void __43__UIDocument__sendStateChangedNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document is sending state changed notification on main thread: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("UIDocumentStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (UIDocumentState)documentState
{
  UIDocument *v2;
  __docFlags docFlags;
  uint64_t v4;
  uint64_t v5;
  UIDocumentState v6;
  UIDocumentState v7;

  v2 = self;
  objc_sync_enter(v2);
  docFlags = v2->_docFlags;
  v4 = -[NSMutableSet count](v2->_progresses, "count");
  v5 = (*(_BYTE *)&docFlags & 2) == 0;
  if ((*(_WORD *)&docFlags & 0x180) != 0)
    v5 |= 8uLL;
  v6 = v5 | (*(unsigned int *)&docFlags >> 11) & 2 | (*(unsigned int *)&docFlags >> 9) & 4;
  if (v4)
    v7 = v6 | 0x10;
  else
    v7 = v6;
  objc_sync_exit(v2);

  return v7;
}

- (void)performAsynchronousFileAccessUsingBlock:(void *)block
{
  void *v3;
  uint64_t v4;
  id v5;

  if (block)
  {
    dispatch_async((dispatch_queue_t)self->_fileAccessQueue, block);
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("must pass a non-nil block to %@"), v5);

  }
}

- (void)_lockFileAccessQueueAndPerformBlock:(id)a3
{
  void (**v5)(_QWORD);
  int has_internal_diagnostics;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *fileAccessQueue;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(_QWORD))a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  dispatch_get_current_queue();
  v7 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  fileAccessQueue = self->_fileAccessQueue;

  if (has_internal_diagnostics)
  {
    if (v7 == fileAccessQueue)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_14;
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v10;
    _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "%@ must be called on the fileAccessQueue", (uint8_t *)&v14, 0xCu);
LABEL_13:

LABEL_14:
    goto LABEL_3;
  }
  if (v7 != fileAccessQueue)
  {
    v12 = _lockFileAccessQueueAndPerformBlock____s_category;
    if (!_lockFileAccessQueueAndPerformBlock____s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_lockFileAccessQueueAndPerformBlock____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v9 = v13;
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "%@ must be called on the fileAccessQueue", (uint8_t *)&v14, 0xCu);
      goto LABEL_13;
    }
  }
LABEL_3:
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocument.m"), 1059, CFSTR("UIDocument bug: file access queue is being locked without an unlock handler"));

  }
  v5[2](v5);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_fileAccessSemaphore, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)_unlockFileAccessQueue
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_fileAccessSemaphore);
}

- (void)_progressPublished:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__UIDocument__progressPublished___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIDocument _performBlockSynchronouslyOnMainThread:](self, "_performBlockSynchronouslyOnMainThread:", v6);

}

void __33__UIDocument__progressPublished___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  if (v3 != v4)
    objc_msgSend(*(id *)(a1 + 32), "_sendStateChangedNotification");
}

- (void)_progressUnpublished:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__UIDocument__progressUnpublished___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[UIDocument _performBlockSynchronouslyOnMainThread:](self, "_performBlockSynchronouslyOnMainThread:", v6);

}

void __35__UIDocument__progressUnpublished___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "removeObject:", *(_QWORD *)(a1 + 40));
  LOBYTE(v3) = (v3 == 0) ^ (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "count") != 0);
  objc_sync_exit(v2);

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_sendStateChangedNotification");
}

- (NSProgress)progress
{
  UIDocument *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableSet allObjects](v2->_progresses, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__UIDocument_progress__block_invoke_2;
  v7[3] = &unk_1E16C3AF8;
  v8 = &__block_literal_global_224_0;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSProgress *)v5;
}

uint64_t __22__UIDocument_progress__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB30F8]);

  if ((_DWORD)v4)
  {
    objc_msgSend(v2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB30B0]))
    {
      if (objc_msgSend(v2, "isIndeterminate"))
        v4 = 1;
      else
        v4 = 2;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB30B8]) & 1) != 0)
    {
      v4 = 3;
    }
    else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB30E0]))
    {
      v4 = 4;
    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

uint64_t __22__UIDocument_progress__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  id v7;
  int v8;
  int v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v8 = v6(v5, a2);
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  if (v8 < v9)
    return -1;
  else
    return v9 < v8;
}

+ (id)_customizationOfError:(id)a3 withDescription:(id)a4 recoverySuggestion:(id)a5 recoveryAttempter:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "mutableCopy");

  if (!v14)
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v14, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
  if (v10)
  {
    v15 = v10;
  }
  else
  {
    objc_msgSend(v9, "localizedDescription");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_7;
  }
  objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x1E0CB2D50]);

LABEL_7:
  objc_msgSend(v9, "localizedFailureReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v14, "setObject:forKey:", v16, *MEMORY[0x1E0CB2D68]);
  if (v11)
  {
    v17 = v11;
  }
  else
  {
    objc_msgSend(v9, "localizedRecoverySuggestion");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_13;
  }
  objc_msgSend(v14, "setObject:forKey:", v17, *MEMORY[0x1E0CB2D80]);

LABEL_13:
  objc_msgSend(v9, "localizedRecoveryOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v14, "setObject:forKey:", v18, *MEMORY[0x1E0CB2D78]);
  if (v12)
  {
    v19 = v12;
LABEL_18:
    objc_msgSend(v14, "setObject:forKey:", v19, *MEMORY[0x1E0CB3148]);

    goto LABEL_19;
  }
  objc_msgSend(v9, "recoveryAttempter");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
    goto LABEL_18;
LABEL_19:
  v20 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v9, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, objc_msgSend(v9, "code"), v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)revertToContentsOfURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  NSURL *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  UIDocument *v16;
  __int16 v17;
  NSURL *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = url;
  v8 = completionHandler;
  if (!-[UIDocument _isOpen](self, "_isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocument fileURL](self, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocument.m"), 1184, CFSTR("attempt to revert document at URL (%@) to URL (%@) that is not yet open"), v12, v7);

  }
  _UIDocumentLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "document: %@ reverting to contents of URL: %@", buf, 0x16u);
  }

  -[UIDocument _setFileURL:](self, "_setFileURL:", v7);
  -[UIDocument _setEditingTemporarilyDisabled:](self, "_setEditingTemporarilyDisabled:", 1);
  *(_WORD *)&self->_docFlags |= 8u;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__UIDocument_revertToContentsOfURL_completionHandler___block_invoke;
  v13[3] = &unk_1E16BC218;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  -[UIDocument openWithCompletionHandler:](self, "openWithCompletionHandler:", v13);

}

uint64_t __54__UIDocument_revertToContentsOfURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    v6 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)a2)
      v5 = CFSTR("YES");
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document: %@ reverted successfully: %@", (uint8_t *)&v12, 0x16u);
  }

  *(_WORD *)(*(_QWORD *)(a1 + 32) + 192) &= ~8u;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFileType:", 0);
    objc_msgSend(*(id *)(a1 + 32), "updateChangeCount:", 3);
    objc_msgSend(*(id *)(a1 + 32), "undoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isUndoRegistrationEnabled");

    objc_msgSend(*(id *)(a1 + 32), "undoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllActions");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "undoManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "disableUndoRegistration");

    }
    objc_msgSend(*(id *)(a1 + 32), "_setEditingTemporarilyDisabled:", 0);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (BOOL)readFromURL:(NSURL *)url error:(NSError *)outError
{
  NSURL *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *openingQueue;
  OS_dispatch_queue *v12;
  id v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  __int128 *p_buf;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = url;
  _UIDocumentLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "document performing readFromURL: %@", (uint8_t *)&buf, 0xCu);
  }

  if (outError)
    *outError = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (!-[NSURL isFileURL](v6, "isFileURL"))
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    NSStringFromSelector(sel_readFromURL_error_);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_loadFromContents_ofType_error_);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("you must override %@ or %@ to support reading files"), v8, v9);
LABEL_20:

    goto LABEL_21;
  }
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v6, 1, outError);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_typeForContentsOfURL:error:", v6, outError);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__68;
      v29 = __Block_byref_object_dispose__68;
      v30 = 0;
      -[UIDocument _readingProgressForURL:](self, "_readingProgressForURL:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v10, "becomeCurrentWithPendingUnitCount:", objc_msgSend(v10, "totalUnitCount"));
        -[UIDocument _progressPublished:](self, "_progressPublished:", v10);
      }
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __32__UIDocument_readFromURL_error___block_invoke;
      v17[3] = &unk_1E16C3B20;
      v20 = &v22;
      v17[4] = self;
      v8 = v8;
      v18 = v8;
      v9 = v9;
      v19 = v9;
      p_buf = &buf;
      openingQueue = self->_openingQueue;
      v12 = openingQueue;
      if (!openingQueue)
      {
        v12 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
        v13 = MEMORY[0x1E0C80D38];
      }
      -[UIDocument _performBlock:synchronouslyOnQueue:](self, "_performBlock:synchronouslyOnQueue:", v17, v12);
      if (!openingQueue)

      if (dyld_program_sdk_at_least())
      {
        -[UIDocument _progressUnpublished:](self, "_progressUnpublished:", v10);
        objc_msgSend(v10, "resignCurrent");
      }
      if (outError)
        *outError = (NSError *)objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));

      _Block_object_dispose(&buf, 8);
    }
    goto LABEL_20;
  }
LABEL_21:

  v15 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __32__UIDocument_readFromURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "isRegularFile");
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "regularFileContents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v2, "loadFromContents:ofType:error:", v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
  if (v3)

}

- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError *)outError
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ is a subclass responsibility but has not been overridden."), v7);

  return 0;
}

+ (void)_finishWritingToURL:(id)a3 withTemporaryDirectoryURL:(id)a4 newContentsURL:(id)a5 afterSuccess:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (v9 && !a6)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v14 = 0;
    v11 = objc_msgSend(v10, "removeItemAtURL:error:", v9, &v14);
    v12 = v14;
    if ((v11 & 1) == 0)
    {
      _UIDocumentLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v9;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "UIDocument could not delete the temporary item at %@. Here's the error:\n%@", buf, 0x16u);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3650], "_removeTemporaryDirectoryAtURL:", v8);

}

- (id)_presentableFileNameForSaveOperation:(int64_t)a3 url:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v5 = a4;
  v6 = v5;
  if (a3 != 1
    || (v11 = 0,
        objc_msgSend(v5, "getResourceValue:forKey:error:", &v11, *MEMORY[0x1E0C99A70], 0),
        (v7 = v11) == 0))
  {
    objc_msgSend(v6, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByDeletingPathExtension");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_readingProgressForURL:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB38A8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB30C8];
  v12[0] = *MEMORY[0x1E0CB30F0];
  v12[1] = v7;
  v8 = *MEMORY[0x1E0CB30D0];
  v13[0] = v4;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v5, "initWithParent:userInfo:", v6, v9);
  objc_msgSend(v10, "setKind:", *MEMORY[0x1E0CB30F8]);
  objc_msgSend(v10, "setTotalUnitCount:", 1);
  return v10;
}

- (id)_writingProgressForURL:(id)a3 indeterminate:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB38A8];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB30C8];
  v15[0] = *MEMORY[0x1E0CB30F0];
  v15[1] = v9;
  v10 = *MEMORY[0x1E0CB30B0];
  v16[0] = v6;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v7, "initWithParent:userInfo:", v8, v11);
  objc_msgSend(v12, "setKind:", *MEMORY[0x1E0CB30F8]);
  if (v4)
    v13 = -1;
  else
    v13 = 1;
  objc_msgSend(v12, "setTotalUnitCount:", v13);
  return v12;
}

- (BOOL)writeContents:(id)contents andAttributes:(NSDictionary *)additionalFileAttributes safelyToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation error:(NSError *)outError
{
  id v12;
  NSDictionary *v13;
  NSURL *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIDocumentSaveOperation v22;
  id v23;
  void *v24;
  void *v25;
  UIDocumentSaveOperation v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _BOOL8 v30;
  void *v32;
  NSDictionary *v33;
  uint8_t buf[4];
  UIDocument *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = contents;
  v13 = additionalFileAttributes;
  v14 = url;
  _UIDocumentLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = self;
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "document performing writeContents:andAttributes:safelyToURL: %@", buf, 0xCu);
  }

  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3650], "_temporaryDirectoryURLForWritingToURL:error:", v14, outError);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v32 = (void *)v16;
    v33 = v13;
    v19 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v17, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL lastPathComponent](v14, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", v21);
    v22 = saveOperation;
    v23 = v12;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:isDirectory:", v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v23;
    v26 = v22;

    -[UIDocument fileURL](self, "fileURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIDocument writeContents:toURL:forSaveOperation:originalContentsURL:error:](self, "writeContents:toURL:forSaveOperation:originalContentsURL:error:", v12, v25, v22, v27, outError))
    {
      v28 = v32;
      v13 = v33;
      if (v33)
      {
        if (v26 == UIDocumentSaveForOverwriting)
          v29 = objc_msgSend(MEMORY[0x1E0CB3650], "_finishWritingToURL:byTakingContentsFromItemAtURL:addingAttributes:usingTemporaryDirectoryAtURL:backupFileName:error:", v14, v25, v33, v18, 0, outError);
        else
          v29 = objc_msgSend(MEMORY[0x1E0CB3650], "_finishWritingToURL:byMovingItemAtURL:addingAttributes:error:", v14, v25, v33, outError);
        v30 = v29;
      }
      else
      {
        v30 = 0;
      }
    }
    else
    {

      v30 = 0;
      v25 = 0;
      v28 = v32;
      v13 = v33;
    }
    objc_msgSend(v28, "_finishWritingToURL:withTemporaryDirectoryURL:newContentsURL:afterSuccess:", v14, v18, v25, v30);

  }
  else
  {
    LOBYTE(v30) = 0;
  }

  return v30;
}

- (BOOL)writeContents:(id)contents toURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation originalContentsURL:(NSURL *)originalContentsURL error:(NSError *)outError
{
  id v13;
  NSURL *v14;
  NSURL *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSURL *v19;
  char v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  uint8_t buf[4];
  UIDocument *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = contents;
  v14 = url;
  v15 = originalContentsURL;
  _UIDocumentLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "document performing writeContents:toURL: %@", buf, 0xCu);
  }

  if (!-[NSURL isFileURL](v14, "isFileURL"))
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "raise:format:", v22, CFSTR("%@ must be overridden for your application to support non-'file:' URLs."), v18);
    v23 = 0;
    goto LABEL_18;
  }
  -[UIDocument fileURL](self, "fileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocument _writingProgressForURL:indeterminate:](self, "_writingProgressForURL:indeterminate:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v18, "becomeCurrentWithPendingUnitCount:", -1);
    -[UIDocument _progressPublished:](self, "_progressPublished:", v18);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (saveOperation == UIDocumentSaveForOverwriting)
      v19 = v15;
    else
      v19 = 0;
    v20 = objc_msgSend(v13, "writeToURL:options:originalContentsURL:error:", v14, 2 * (saveOperation == UIDocumentSaveForOverwriting), v19, outError);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v13, "writeToURL:atomically:", v14, 0);
LABEL_14:
    v23 = v20;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The default implementation of -[UIDocument writeContents:toURL:forSaveOperation:originalContentsURL:error: only understands contents of type NSFileWrapper or NSData, not %@. You must override one of the write methods to support custom content types"), objc_opt_class());
  v23 = 0;
LABEL_16:
  if (dyld_program_sdk_at_least())
  {
    -[UIDocument _progressUnpublished:](self, "_progressUnpublished:", v18);
    objc_msgSend(v18, "resignCurrent");
  }
LABEL_18:

  if (outError && !v23)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, 0);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (NSDictionary)fileAttributesToWriteToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation error:(NSError *)outError
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", url, saveOperation, outError);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (saveOperation != UIDocumentSaveForOverwriting)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x1E0CB2A48]);

  }
  return (NSDictionary *)v6;
}

+ (BOOL)_url:(id)a3 matchesURL:(id)a4
{
  id v5;
  id v6;
  int v7;
  char v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "isEqual:", v5);
  v8 = v7;
  if (v6 && v5 && !v7)
  {
    v14 = 0;
    v9 = *MEMORY[0x1E0C99948];
    v10 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v14, *MEMORY[0x1E0C99948], 0);
    v11 = v14;
    if (v10)
    {
      v13 = 0;
      if (objc_msgSend(v6, "getResourceValue:forKey:error:", &v13, v9, 0))
        v8 = objc_msgSend(v11, "isEqual:", v13);
    }

  }
  return v8;
}

- (BOOL)_coordinateWritingItemAtURL:(id)a3 error:(id *)a4 byAccessor:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int16 docFlags;
  NSObject *v14;
  _BOOL4 v15;
  id *v16;
  id *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];
  _QWORD v25[5];
  id v26;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  UIDocument *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_opt_class();
  -[UIDocument fileURL](self, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend((id)v10, "_url:matchesURL:", v11, v8);

  if ((v10 & 1) == 0)
    *(_WORD *)&self->_docFlags |= 0x400u;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  docFlags = (__int16)self->_docFlags;
  _UIDocumentLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((docFlags & 0x400) != 0)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "document: %@ attempting coordinated writing for moving to new URL: %@", buf, 0x16u);
    }

    -[UIDocument fileURL](self, "fileURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __59__UIDocument__coordinateWritingItemAtURL_error_byAccessor___block_invoke;
    v25[3] = &unk_1E16C3B48;
    v25[4] = self;
    v27[1] = &v28;
    v27[0] = v9;
    v26 = v12;
    objc_msgSend(v26, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v18, 2, v8, 8, a4, v25);

    v16 = (id *)v27;
    v17 = &v26;
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "document attempting coordinated writing: %@", buf, 0xCu);
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __59__UIDocument__coordinateWritingItemAtURL_error_byAccessor___block_invoke_255;
    v22[3] = &unk_1E16C3B70;
    v22[4] = self;
    v24[1] = &v28;
    v24[0] = v9;
    v23 = v12;
    objc_msgSend(v23, "coordinateWritingItemAtURL:options:error:byAccessor:", v8, 0, a4, v22);
    v16 = (id *)v24;
    v17 = &v23;
  }

  if (*((_BYTE *)v29 + 24))
  {
    v19 = 1;
  }
  else
  {
    _UIDocumentLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "document failed to start coordinated writing: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    v19 = *((_BYTE *)v29 + 24) != 0;
  }
  _Block_object_dispose(&v28, 8);

  return v19;
}

void __59__UIDocument__coordinateWritingItemAtURL_error_byAccessor___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document got coordinated writing lock, now writing: %@", (uint8_t *)&v7, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  (*(void (**)(void))(a1[6] + 16))();

}

void __59__UIDocument__coordinateWritingItemAtURL_error_byAccessor___block_invoke_255(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document got coordinated writing lock, now writing: %@", (uint8_t *)&v6, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)contentsForType:(NSString *)typeName error:(NSError *)outError
{
  NSObject *v5;
  int v7;
  UIDocument *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document invoked default implementation of contentsForType:error: which only returns nil: %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)saveToURL:(NSURL *)url forSaveOperation:(UIDocumentSaveOperation)saveOperation completionHandler:(void *)completionHandler
{
  NSURL *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSURL *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSURL *v21;
  NSObject *v22;
  OS_dispatch_queue *v23;
  OS_dispatch_queue *v24;
  id v25;
  void *v26;
  void *v27;
  OS_dispatch_queue *v28;
  id v29;
  _QWORD v30[5];
  NSURL *v31;
  id v32;
  id v33;
  OS_dispatch_queue *v34;
  id v35;
  UIDocumentSaveOperation v36;
  id v37;
  uint8_t buf[4];
  UIDocument *v39;
  __int16 v40;
  NSURL *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  NSURL *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = url;
  v9 = completionHandler;
  -[UIDocument savingFileType](self, "savingFileType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocument fileType](self, "fileType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_7;
  }
  v14 = v13;
  if (v12 && v13)
  {
    v15 = objc_msgSend(v12, "isEqual:", v13);

    if (!v15)
      goto LABEL_9;
LABEL_7:
    v16 = v8;
    goto LABEL_10;
  }

LABEL_9:
  -[UIDocument fileNameExtensionForType:saveOperation:](self, "fileNameExtensionForType:saveOperation:", v12, saveOperation);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByDeletingPathExtension](v8, "URLByDeletingPathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByAppendingPathExtension:", v17);
  v16 = (NSURL *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  _UIDocumentLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v39 = self;
    v40 = 2112;
    v41 = v8;
    v42 = 2112;
    v43 = v12;
    v44 = 2112;
    v45 = v16;
    _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "document: %@ saving to URL: %@ with file type: %@, using final URL: %@", buf, 0x2Au);
  }

  v37 = 0;
  -[UIDocument contentsForType:error:](self, "contentsForType:error:", v12, &v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (NSURL *)v37;
  if (v21)
  {
    _UIDocumentLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = self;
      v40 = 2112;
      v41 = v21;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_DEFAULT, "document: %@ got error from contentsForType:error: %@", buf, 0x16u);
    }

    -[UIDocument handleError:userInteractionPermitted:](self, "handleError:userInteractionPermitted:", v21, 1);
  }
  else
  {
    dispatch_get_current_queue();
    v23 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    if (v23 == self->_fileAccessQueue)
    {
      v24 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v25 = MEMORY[0x1E0C80D38];

      v23 = v24;
    }
    -[UIDocument _registerAsFilePresenterIfNecessary](self, "_registerAsFilePresenterIfNecessary");
    -[UIDocument undoManager](self, "undoManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_processEndOfEventNotification:", 0);

    -[UIDocument changeCountTokenForSaveOperation:](self, "changeCountTokenForSaveOperation:", saveOperation);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke;
    v30[3] = &unk_1E16C3C10;
    v30[4] = self;
    v31 = v16;
    v36 = saveOperation;
    v32 = v20;
    v33 = v27;
    v34 = v23;
    v35 = v9;
    v28 = v23;
    v29 = v27;
    -[UIDocument performAsynchronousFileAccessUsingBlock:](self, "performAsynchronousFileAccessUsingBlock:", v30);

  }
}

void __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke(uint64_t a1)
{
  void **v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = (void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__68;
  v32 = __Block_byref_object_dispose__68;
  v33 = 0;
  v4 = *v2;
  v27 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_2;
  v19[3] = &unk_1E16C3BE8;
  v6 = *(_QWORD *)(a1 + 80);
  v19[4] = v4;
  v26 = v6;
  v7 = *(_QWORD *)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  v8 = v3;
  v22 = v8;
  v23 = *(id *)(a1 + 40);
  v24 = &v34;
  v25 = &v28;
  objc_msgSend(v4, "_coordinateWritingItemAtURL:error:byAccessor:", v7, &v27, v19);
  v9 = v27;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleError:userInteractionPermitted:", v9, 1);
  }
  else if (*((_BYTE *)v35 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setOpen:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_updateLastUsedDate");
  }
  else
  {
    _UIDocumentLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = v29[5];
      *(_DWORD *)buf = 138412546;
      v39 = v11;
      v40 = 2112;
      v41 = v12;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "document: %@ hit writing error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "handleError:userInteractionPermitted:", v29[5], 1);
  }
  if (*(_QWORD *)(a1 + 72))
  {
    _UIDocumentLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v39 = v14;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "document will perform saving completion handler on calling queue: %@", buf, 0xCu);
    }

    v15 = *(void **)(a1 + 32);
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_260;
    v16[3] = &unk_1E16C3A60;
    v16[4] = v15;
    v17 = *(id *)(a1 + 72);
    v18 = &v34;
    objc_msgSend(v15, "_performBlock:synchronouslyOnQueue:", v16, *(_QWORD *)(a1 + 64));

  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t (**v11)(void *, id *);
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  id obj;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD aBlock[5];
  id v26;
  id v27;
  uint64_t v28;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_3;
    aBlock[3] = &unk_1E16C3B98;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = *(_QWORD *)(a1 + 88);
    v26 = v9;
    v28 = v10;
    v27 = *(id *)(a1 + 40);
    v11 = (uint64_t (**)(void *, id *))_Block_copy(aBlock);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_4;
    v18[3] = &unk_1E16C3BC0;
    v18[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = *(_QWORD *)(a1 + 88);
    v19 = v12;
    v24 = v13;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    v23 = v5;
    v14 = _Block_copy(v18);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v15 + 40);
    v16 = v11[2](v11, &obj);
    objc_storeStrong((id *)(v15 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v16;
    (*((void (**)(void *, _QWORD, _QWORD))v14 + 2))(v14, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

  }
}

uint64_t __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_writingProgressForURL:indeterminate:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v6, "becomeCurrentWithPendingUnitCount:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_progressPublished:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "fileAttributesToWriteToURL:forSaveOperation:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "writeContents:andAttributes:safelyToURL:forSaveOperation:error:", *(_QWORD *)(a1 + 48), v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), a2);
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(*(id *)(a1 + 32), "_progressUnpublished:", v6);
    objc_msgSend(v6, "resignCurrent");
  }

  return v8;
}

void __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2;
  unsigned int v3;
  int v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int16 *)(v2 + 192);
  *(_WORD *)(v2 + 192) = v3 & 0xFBFF;
  if (a2)
  {
    v5 = v3 & 0x400;
    v6 = (v3 >> 10) & 1;
    _UIDocumentLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "document will finish saving on main thread: %@", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_257;
    v16[3] = &unk_1E16BFD20;
    v9 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 32);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 80);
    v18 = v10;
    v20 = v11;
    v19 = *(id *)(a1 + 48);
    v21 = v6;
    objc_msgSend(v17, "_performBlockSynchronouslyOnMainThread:", v16);
    if (v5)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      objc_msgSend(v12, "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);
      _UIDocumentLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138412546;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "document: %@ did move to URL: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 72), "itemAtURL:didMoveToURL:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }

  }
}

void __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_257(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document is finishing saving on main thread: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_finishSavingToURL:forSaveOperation:changeCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 136) = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (v5 = *(unsigned __int8 *)(a1 + 64), v4, v5))
    objc_msgSend(*(id *)(a1 + 32), "_manageUserActivity");
}

uint64_t __59__UIDocument_saveToURL_forSaveOperation_completionHandler___block_invoke_260(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document is performing saving completion handler on calling queue: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_finishSavingToURL:(id)a3 forSaveOperation:(int64_t)a4 changeCount:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C998D8], *MEMORY[0x1E0C99A70], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v14, "resourceValuesForKeys:error:", v9, 0);

  v11 = objc_opt_class();
  if ((unint64_t)a4 <= 1)
  {
    v12 = (void *)v11;
    -[UIDocument _setFileURL:](self, "_setFileURL:", v14);
    -[UIDocument setFileType:](self, "setFileType:", 0);
    objc_msgSend(v12, "_fileModificationDateForURL:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocument setFileModificationDate:](self, "setFileModificationDate:", v13);

    -[UIDocument _updateLocalizedName](self, "_updateLocalizedName");
    -[UIDocument updateChangeCountWithToken:forSaveOperation:](self, "updateChangeCountWithToken:forSaveOperation:", v8, a4);
  }

}

- (double)_autosavingDelay
{
  return 15.0;
}

+ (void)_autosavingTimerDidFireSoContinue:(id)a3
{
  void (**v3)(void);

  objc_msgSend(a3, "userInfo");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (void)_autosavingCompletedSuccessfully:(BOOL)a3
{
  *(_WORD *)&self->_docFlags &= ~0x10u;
  if (a3)
  {
    if (-[UIDocument hasUnsavedChanges](self, "hasUnsavedChanges"))
      -[UIDocument _scheduleAutosaving](self, "_scheduleAutosaving");
    -[UIDocument _updateLastUsedDate](self, "_updateLastUsedDate");
  }
}

- (void)_rescheduleAutosaving
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  UIDocument *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "document is rescheduling autosaving: %@", (uint8_t *)&v9, 0xCu);
  }

  if ((*(_WORD *)&self->_docFlags & 0x10) == 0 && -[UIDocument hasUnsavedChanges](self, "hasUnsavedChanges"))
  {
    v4 = self->_lastSaveTime - CFAbsoluteTimeGetCurrent() + 300.0;
    if (v4 <= 0.0)
    {
      *(_WORD *)&self->_docFlags |= 0x10u;
      -[UIDocument _autosaveWithCompletionHandler:](self, "_autosaveWithCompletionHandler:", 0);
    }
    else
    {
      v5 = v4 / 300.0;
      if (v4 / 300.0 >= 0.5)
      {
        -[UIDocument _autosavingDelay](self, "_autosavingDelay");
      }
      else if (v5 >= 0.25)
      {
        -[UIDocument _autosavingDelay](self, "_autosavingDelay");
        v7 = v8 * 0.5;
      }
      else
      {
        -[UIDocument _autosavingDelay](self, "_autosavingDelay");
        v7 = v6 * 0.125;
        if (v5 < 0.125 && v7 >= v4)
          v7 = v4;
      }
      -[UIDocument _scheduleAutosavingAfterDelay:reset:](self, "_scheduleAutosavingAfterDelay:reset:", 1, v7);
    }
  }
}

- (void)_scheduleAutosavingAfterDelay:(double)a3 reset:(BOOL)a4
{
  _BOOL4 v5;
  _BOOL4 v7;
  BOOL v8;
  NSObject *v9;
  NSTimer *autosavingTimer;
  NSTimer *v11;
  NSTimer *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSTimer *v17;
  NSTimer *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  UIDocument *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_docFlags & 0x10) != 0
    || ((v5 = a4, v7 = -[UIDocument hasUnsavedChanges](self, "hasUnsavedChanges"), a3 < 1.79769313e308)
      ? (v8 = !v7)
      : (v8 = 1),
        v8))
  {
    if (self->_autosavingTimer)
    {
      _UIDocumentLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = self;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "document is unscheduling autosaving: %@", buf, 0xCu);
      }

      -[NSTimer invalidate](self->_autosavingTimer, "invalidate");
      autosavingTimer = self->_autosavingTimer;
      self->_autosavingTimer = 0;

    }
  }
  else
  {
    v11 = self->_autosavingTimer;
    if (!v11)
      goto LABEL_16;
    if (v5)
    {
      -[NSTimer invalidate](v11, "invalidate");
      v12 = self->_autosavingTimer;
      self->_autosavingTimer = 0;

    }
    else
    {
      -[UIDocument _rescheduleAutosaving](self, "_rescheduleAutosaving");
    }
    if (!self->_autosavingTimer)
    {
LABEL_16:
      _UIDocumentLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = self;
        v22 = 2048;
        v23 = a3;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "document: %@ scheduling autosaving with delay: %f", buf, 0x16u);
      }

      v14 = (void *)MEMORY[0x1E0C99E88];
      v15 = objc_opt_class();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __50__UIDocument__scheduleAutosavingAfterDelay_reset___block_invoke;
      v19[3] = &unk_1E16B1B28;
      v19[4] = self;
      v16 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v14, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v15, sel__autosavingTimerDidFireSoContinue_, v16, 0, a3);
      v17 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v18 = self->_autosavingTimer;
      self->_autosavingTimer = v17;

    }
  }
}

uint64_t __50__UIDocument__scheduleAutosavingAfterDelay_reset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

  *(_WORD *)(*(_QWORD *)(a1 + 32) + 192) |= 0x10u;
  return objc_msgSend(*(id *)(a1 + 32), "_autosaveWithCompletionHandler:", 0);
}

- (void)_scheduleAutosaving
{
  -[UIDocument _autosavingDelay](self, "_autosavingDelay");
  -[UIDocument _scheduleAutosavingAfterDelay:reset:](self, "_scheduleAutosavingAfterDelay:reset:", 0);
}

- (void)_saveUnsavedChangesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *v7;
  id v8;
  id v9;
  OS_dispatch_queue *v10;
  _QWORD v11[5];
  OS_dispatch_queue *v12;
  id v13;
  uint8_t buf[4];
  UIDocument *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document will save if necessary: %@", buf, 0xCu);
  }

  dispatch_get_current_queue();
  v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  if (v6 == self->_fileAccessQueue)
  {
    v7 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];

    v6 = v7;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E16BAD68;
  v11[4] = self;
  v12 = v6;
  v13 = v4;
  v9 = v4;
  v10 = v6;
  -[UIDocument performAsynchronousFileAccessUsingBlock:](self, "performAsynchronousFileAccessUsingBlock:", v11);

}

void __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hasUnsavedChanges");
  _UIDocumentLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "document has unsaved changes and will now save: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_264;
    block[3] = &unk_1E16B1D18;
    v6 = *(NSObject **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    dispatch_async(v6, block);
    v7 = v14;
    goto LABEL_9;
  }
  if (v4)
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "document is skipping saving because there are no unsaved changes: %@", buf, 0xCu);
  }

  v9 = *(void **)(a1 + 48);
  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_265;
    v11[3] = &unk_1E16B1BF8;
    v12 = v9;
    objc_msgSend(v10, "_performBlock:synchronouslyOnQueue:", v11, *(_QWORD *)(a1 + 40));
    v7 = v12;
LABEL_9:

  }
}

void __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_264(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E16BC218;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "saveToURL:forSaveOperation:completionHandler:", v3, 1, v5);

}

uint64_t __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  _QWORD v6[5];
  char v7;

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E16B1B78;
  v6[4] = v4;
  v7 = a2;
  objc_msgSend(v4, "_performBlockSynchronouslyOnMainThread:", v6);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_autosavingCompletedSuccessfully:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __55__UIDocument__saveUnsavedChangesWithCompletionHandler___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_autosaveWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  UIDocument *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document is invoking autosaving and waiting for completion handler: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__UIDocument__autosaveWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E16BC218;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[UIDocument autosaveWithCompletionHandler:](self, "autosaveWithCompletionHandler:", v7);

}

uint64_t __45__UIDocument__autosaveWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document autosaving has completed and completion handler is now invoked: %@", (uint8_t *)&v7, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)closeWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  UIDocument *v5;
  __int16 docFlags;
  NSObject *v7;
  NSTimer *autosavingTimer;
  NSTimer *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  UIDocument *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  docFlags = (__int16)v5->_docFlags;
  if ((docFlags & 3) == 2)
  {
    *(_WORD *)&v5->_docFlags = docFlags | 1;
    _UIDocumentLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "document now closing: %@", buf, 0xCu);
    }

    -[UIDocument _clearUserActivity](v5, "_clearUserActivity");
    autosavingTimer = v5->_autosavingTimer;
    if (autosavingTimer)
    {
      -[NSTimer invalidate](autosavingTimer, "invalidate");
      v9 = v5->_autosavingTimer;
      v5->_autosavingTimer = 0;

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__UIDocument_closeWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E16BC218;
    v10[4] = v5;
    v11 = v4;
    -[UIDocument _saveUnsavedChangesWithCompletionHandler:](v5, "_saveUnsavedChangesWithCompletionHandler:", v10);

  }
  objc_sync_exit(v5);

}

uint64_t __41__UIDocument_closeWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_unregisterAsFilePresenterIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_setOpen:", 0);
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 192) &= ~1u;
  objc_sync_exit(v4);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (BOOL)_hasUnsavedChanges
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "generationCount"))
  {
    v4 = 1;
  }
  else
  {
    -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "changeCount") != 0;

  }
  return v4;
}

- (void)updateChangeCount:(UIDocumentChangeKind)change
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  UIDocument *v29;
  __int16 v30;
  UIDocumentChangeKind v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412546;
    v29 = self;
    v30 = 2048;
    v31 = change;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document: %@ updating change count with change type: %ld", (uint8_t *)&v28, 0x16u);
  }

  switch(change)
  {
    case UIDocumentChangeDone:
      if (!-[UIDocument _hasUnsavedChanges](self, "_hasUnsavedChanges"))
        self->_lastSaveTime = CFAbsoluteTimeGetCurrent();
      -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "changeCount");

      if (v7 < 0)
      {
        -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setGenerationCount:", objc_msgSend(v8, "generationCount") + 1);

      }
      -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setChangeCount:", objc_msgSend(v9, "changeCount") + 1);

      -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "changeCount");

      if (v11 < 0)
      {
        -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setGenerationCount:", objc_msgSend(v12, "generationCount") + 1);

      }
      -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setChangeCount:", objc_msgSend(v13, "changeCount") + 1);

      -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "changeCount");

      if (v15 < 0)
      {
        -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setGenerationCount:", objc_msgSend(v16, "generationCount") + 1);

      }
      -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case UIDocumentChangeUndone:
      -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setChangeCount:", objc_msgSend(v18, "changeCount") - 1);

      -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setChangeCount:", objc_msgSend(v19, "changeCount") - 1);

      -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "changeCount") - 1;
      goto LABEL_16;
    case UIDocumentChangeRedone:
      -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setChangeCount:", objc_msgSend(v22, "changeCount") + 1);

      -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setChangeCount:", objc_msgSend(v23, "changeCount") + 1);

      -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v20 = v17;
      v21 = objc_msgSend(v17, "changeCount") + 1;
LABEL_16:
      v24 = v20;
      goto LABEL_18;
    case UIDocumentChangeCleared:
      -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setGenerationCount:", 0);

      -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setChangeCount:", 0);

      -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setGenerationCount:", 0);

      -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v24;
      v21 = 0;
LABEL_18:
      objc_msgSend(v24, "setChangeCount:", v21);

      break;
    default:
      break;
  }
  -[UIDocument _scheduleAutosaving](self, "_scheduleAutosaving");
}

- (id)changeCountTokenForSaveOperation:(UIDocumentSaveOperation)saveOperation
{
  NSDocumentDifferenceSizeTriple *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v5 = objc_alloc_init(NSDocumentDifferenceSizeTriple);
  -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "generationCount");
  -[NSDocumentDifferenceSizeTriple dueToRecentChangesBeforeSaving](v5, "dueToRecentChangesBeforeSaving");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGenerationCount:", v7);

  -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "changeCount");
  -[NSDocumentDifferenceSizeTriple dueToRecentChangesBeforeSaving](v5, "dueToRecentChangesBeforeSaving");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setChangeCount:", v10);

  -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "generationCount");
  -[NSDocumentDifferenceSizeTriple betweenPreservingPreviousVersionAndSaving](v5, "betweenPreservingPreviousVersionAndSaving");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setGenerationCount:", v13);

  -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "changeCount");
  -[NSDocumentDifferenceSizeTriple betweenPreservingPreviousVersionAndSaving](v5, "betweenPreservingPreviousVersionAndSaving");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setChangeCount:", v16);

  if ((unint64_t)saveOperation > UIDocumentSaveForOverwriting)
  {
    -[NSDocumentDifferenceSizeTriple betweenPreviousSavingAndSaving](v5, "betweenPreviousSavingAndSaving");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setGenerationCount:", 0);

    -[NSDocumentDifferenceSizeTriple betweenPreviousSavingAndSaving](v5, "betweenPreviousSavingAndSaving");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setChangeCount:", 0);
  }
  else
  {
    -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "generationCount");
    -[NSDocumentDifferenceSizeTriple betweenPreviousSavingAndSaving](v5, "betweenPreviousSavingAndSaving");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setGenerationCount:", v19);

    -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "changeCount");
    -[NSDocumentDifferenceSizeTriple betweenPreviousSavingAndSaving](v5, "betweenPreviousSavingAndSaving");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setChangeCount:", v22);

  }
  return v5;
}

- (void)updateChangeCountWithToken:(id)changeCountToken forSaveOperation:(UIDocumentSaveOperation)saveOperation
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if ((unint64_t)saveOperation <= UIDocumentSaveForOverwriting)
  {
    v5 = changeCountToken;
    -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "betweenPreviousSavingAndSaving");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGenerationCount:", objc_msgSend(v6, "generationCount") - objc_msgSend(v7, "generationCount"));

    -[UIDocument differenceSinceSaving](self, "differenceSinceSaving");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "betweenPreviousSavingAndSaving");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setChangeCount:", objc_msgSend(v8, "changeCount") - objc_msgSend(v9, "changeCount"));

    -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dueToRecentChangesBeforeSaving");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGenerationCount:", objc_msgSend(v10, "generationCount") - objc_msgSend(v11, "generationCount"));

    -[UIDocument differenceDueToRecentChanges](self, "differenceDueToRecentChanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dueToRecentChangesBeforeSaving");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setChangeCount:", objc_msgSend(v12, "changeCount") - objc_msgSend(v13, "changeCount"));

    -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "betweenPreservingPreviousVersionAndSaving");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGenerationCount:", objc_msgSend(v14, "generationCount") - objc_msgSend(v15, "generationCount"));

    -[UIDocument differenceSincePreservingPreviousVersion](self, "differenceSincePreservingPreviousVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dueToRecentChangesBeforeSaving");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setChangeCount:", objc_msgSend(v16, "changeCount") - objc_msgSend(v17, "changeCount"));
  }
  -[UIDocument _scheduleAutosaving](self, "_scheduleAutosaving");
}

- (void)_changeWasDone:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  UIDocument *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document undoManager change was done: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "groupingLevel");

  if (v7 <= 1)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("NSUndoManagerGroupIsEmpty"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) == 0)
      -[UIDocument updateChangeCount:](self, "updateChangeCount:", 0);
  }

}

- (void)_changeWasUndone:(id)a3
{
  NSObject *v4;
  int v5;
  UIDocument *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document undoManager change was undone: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((*(_WORD *)&self->_docFlags & 0x40) == 0)
    -[UIDocument updateChangeCount:](self, "updateChangeCount:", 1);
}

- (void)_changeWasRedone:(id)a3
{
  NSObject *v4;
  int v5;
  UIDocument *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document undoManager change was redone: %@", (uint8_t *)&v5, 0xCu);
  }

  if ((*(_WORD *)&self->_docFlags & 0x40) == 0)
    -[UIDocument updateChangeCount:](self, "updateChangeCount:", 2);
}

- (void)_releaseUndoManager
{
  NSUndoManager *undoManager;
  id v4;

  if (self->_undoManager)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33B8], self->_undoManager);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33B0], self->_undoManager);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33C0], self->_undoManager);
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33A8], self->_undoManager);
    undoManager = self->_undoManager;
    self->_undoManager = 0;

  }
}

- (void)setUndoManager:(NSUndoManager *)undoManager
{
  NSUndoManager *v5;
  NSUndoManager *v6;
  void *v7;
  NSUndoManager *v8;

  v5 = undoManager;
  v6 = self->_undoManager;
  v8 = v5;
  if (v6 != v5)
  {
    if (v6)
      -[UIDocument _releaseUndoManager](self, "_releaseUndoManager");
    objc_storeStrong((id *)&self->_undoManager, undoManager);
    if (self->_undoManager)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__changeWasUndone_, *MEMORY[0x1E0CB33B8], self->_undoManager);
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__changeWasRedone_, *MEMORY[0x1E0CB33B0], self->_undoManager);
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__changeWasDone_, *MEMORY[0x1E0CB33C0], self->_undoManager);

    }
  }

}

- (NSUndoManager)undoManager
{
  NSUndoManager *undoManager;
  NSUndoManager *v3;

  undoManager = self->_undoManager;
  if (undoManager)
  {
    v3 = undoManager;
  }
  else
  {
    v3 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E0CB3A48]);
    -[UIDocument setUndoManager:](self, "setUndoManager:", v3);
  }
  return v3;
}

- (void)handleError:(NSError *)error userInteractionPermitted:(BOOL)userInteractionPermitted
{
  _BOOL4 v4;
  NSError *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  UIDocument *v10;
  NSError *v11;
  uint64_t v12;
  NSObject *v13;
  UIDocument *v14;
  NSError *v15;
  id v16;
  id alertPresenter;
  _QWORD v18[5];
  NSError *v19;
  uint8_t buf[4];
  UIDocument *v21;
  __int16 v22;
  NSError *v23;
  uint64_t v24;

  v4 = userInteractionPermitted;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = error;
  _UIDocumentLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "document: %@ handling error: %@", buf, 0x16u);
  }

  -[NSError recoveryAttempter](v6, "recoveryAttempter");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v4 && v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend(v9, "attemptSilentRecoveryFromError:error:", v6, 0))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__UIDocument_handleError_userInteractionPermitted___block_invoke;
      v18[3] = &unk_1E16B2218;
      v18[4] = self;
      v19 = v6;
      v16 = +[UIDocumentAlertPresenter _presentAlertWithError:completionHandler:](UIDocumentAlertPresenter, "_presentAlertWithError:completionHandler:", v19, v18);
      alertPresenter = self->_alertPresenter;
      self->_alertPresenter = v16;

      goto LABEL_13;
    }
    v10 = self;
    v11 = v6;
    v12 = 1;
  }
  else
  {
    _UIDocumentLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[NSError localizedDescription](v6, "localizedDescription");
      v14 = (UIDocument *)objc_claimAutoreleasedReturnValue();
      -[NSError localizedFailureReason](v6, "localizedFailureReason");
      v15 = (NSError *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "UIDocument unrecoverable error with description: %@ reason: %@", buf, 0x16u);

    }
    v10 = self;
    v11 = v6;
    v12 = 0;
  }
  -[UIDocument finishedHandlingError:recovered:](v10, "finishedHandlingError:recovered:", v11, v12);
LABEL_13:

}

uint64_t __51__UIDocument_handleError_userInteractionPermitted___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "finishedHandlingError:recovered:", *(_QWORD *)(a1 + 40), a2);
}

- (void)finishedHandlingError:(NSError *)error recovered:(BOOL)recovered
{
  _BOOL4 v4;
  NSError *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v4 = recovered;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = error;
  if (!v4)
  {
    _UIDocumentLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NSError localizedDescription](v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSError localizedFailureReason](v6, "localizedFailureReason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Failed to recover from error with description: %@ reason: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  -[UIDocument _setHasSavingError:](self, "_setHasSavingError:", !v4);

}

- (void)userInteractionNoLongerPermittedForError:(NSError *)error
{
  objc_msgSend(self->_alertPresenter, "_forceFinishNow", error);
}

- (void)_updateLocalizedName
{
  UIDocument *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *localizedName;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](v2->_fileURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNameAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = objc_claimAutoreleasedReturnValue();
  localizedName = v2->_localizedName;
  v2->_localizedName = (NSString *)v6;

  objc_sync_exit(v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__UIDocument__updateLocalizedName__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __34__UIDocument__updateLocalizedName__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("UIDocumentLocalizedNameChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (NSString)localizedName
{
  UIDocument *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_localizedName;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)fileNameExtensionForType:(NSString *)typeName saveOperation:(UIDocumentSaveOperation)saveOperation
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", typeName, saveOperation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFilenameExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_filePresenterQueue;
}

- (void)relinquishPresentedItemToReader:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  UIDocument *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document relinquishing to reader: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4)
    v4[2](v4, 0);

}

- (BOOL)_shouldAllowWritingInResponseToPresenterMessage
{
  UIDocument *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (*(_WORD *)&v2->_docFlags & 6) == 2;
  objc_sync_exit(v2);

  return v3;
}

- (void)_updatePermissionsState:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (a3 && dyld_program_sdk_at_least())
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
    -[UIDocument fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__UIDocument__updatePermissionsState___block_invoke;
    v6[3] = &unk_1E16C3C38;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v4, "coordinateReadingItemAtURL:options:error:byAccessor:", v5, 4, 0, v6);

  }
  -[UIDocument _setEditingDisabledDueToPermissions:](self, "_setEditingDisabledDueToPermissions:", *((unsigned __int8 *)v8 + 24));
  _Block_object_dispose(&v7, 8);
}

void __38__UIDocument__updatePermissionsState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v4, "isWritableFileAtPath:", v3) ^ 1;

}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  _QWORD *v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void (*v11)(_QWORD *, _QWORD *);
  id v12;
  _QWORD v13[5];
  id v14;
  void *v15;
  BOOL v16;
  uint8_t buf[4];
  UIDocument *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document relinquishing to writer: %@", buf, 0xCu);
  }

  if (-[UIDocument _shouldAllowWritingInResponseToPresenterMessage](self, "_shouldAllowWritingInResponseToPresenterMessage"))
  {
    if (v4)
    {
      v6 = -[UIDocument _isEditingTemporarilyDisabled](self, "_isEditingTemporarilyDisabled");
      -[UIDocument _setEditingTemporarilyDisabled:](self, "_setEditingTemporarilyDisabled:", 1);
      v7 = (void *)objc_opt_class();
      -[UIDocument fileURL](self, "fileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v7, "_fileModificationDateForURL:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      _UIDocumentLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = self;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "document waiting for writer to finish and invoke reacquirer: %@", buf, 0xCu);
      }

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __46__UIDocument_relinquishPresentedItemToWriter___block_invoke;
      v13[3] = &unk_1E16C3C60;
      v16 = v6;
      v13[4] = self;
      v14 = v9;
      v15 = v7;
      v11 = (void (*)(_QWORD *, _QWORD *))v4[2];
      v12 = v9;
      v11(v4, v13);

    }
  }
  else if (v4)
  {
    ((void (*)(_QWORD *, _QWORD))v4[2])(v4, 0);
  }

}

void __46__UIDocument_relinquishPresentedItemToWriter___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document finished waiting for writer and the reacquirer is now invoked: %@", buf, 0xCu);
  }

  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document will respond to writer on main thread: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updatePermissionsState:", 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__UIDocument_relinquishPresentedItemToWriter___block_invoke_277;
  v9[3] = &unk_1E16C3C60;
  v6 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v13 = *(_BYTE *)(a1 + 56);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  v11 = v7;
  v12 = v8;
  objc_msgSend(v10, "_performBlockSynchronouslyOnMainThread:", v9);

}

void __46__UIDocument_relinquishPresentedItemToWriter___block_invoke_277(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v19 = 138412290;
    v20 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document is responding to writer on main thread: %@", (uint8_t *)&v19, 0xCu);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldAllowWritingInResponseToPresenterMessage") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if ((v7 & 1) != 0)
    {
      if (v4 && *(_QWORD *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 48), "_fileModificationDateForURL:", v4);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && (-[NSObject isEqual:](v8, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "revertToContentsOfURL:completionHandler:", v4, 0);

          goto LABEL_22;
        }
        _UIDocumentLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          v19 = 138412802;
          v20 = v11;
          v21 = 2112;
          v22 = v9;
          v23 = 2112;
          v24 = v12;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "document: %@ skipping revert with newModifcationDate: %@ and oldModificationDate: %@", (uint8_t *)&v19, 0x20u);
        }

      }
      else
      {
        _UIDocumentLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 32);
          v18 = *(_QWORD *)(a1 + 40);
          v19 = 138412802;
          v20 = v17;
          v21 = 2112;
          v22 = v4;
          v23 = 2112;
          v24 = v18;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "document: %@ skipping revert because fileURL: %@ or oldModificationDate: %@ is nil", (uint8_t *)&v19, 0x20u);
        }
      }

    }
    else
    {
      _UIDocumentLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        v20 = v16;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "document deleted by writer, so initiating save: %@", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "saveToURL:forSaveOperation:completionHandler:", v4, 0, 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "_setEditingTemporarilyDisabled:", *(unsigned __int8 *)(a1 + 56));
LABEL_22:

    return;
  }
  _UIDocumentLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v19 = 138412290;
    v20 = v14;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "document was moved from open to closed while handling writer, stopping processing: %@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setEditingTemporarilyDisabled:", *(unsigned __int8 *)(a1 + 56));
}

- (void)savePresentedItemChangesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  UIDocument *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document saving presented item changes: %@", buf, 0xCu);
  }

  if (-[UIDocument _shouldAllowWritingInResponseToPresenterMessage](self, "_shouldAllowWritingInResponseToPresenterMessage"))
  {
    _UIDocumentLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = self;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "document will save changes on main thread: %@", buf, 0xCu);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__UIDocument_savePresentedItemChangesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E16B1D18;
    v7[4] = self;
    v8 = v4;
    -[UIDocument _performBlockSynchronouslyOnMainThread:](self, "_performBlockSynchronouslyOnMainThread:", v7);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __60__UIDocument_savePresentedItemChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "document is saving changes on main thread: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__UIDocument_savePresentedItemChangesWithCompletionHandler___block_invoke_279;
  v5[3] = &unk_1E16B1BA0;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_saveUnsavedChangesWithCompletionHandler:", v5);

}

uint64_t __60__UIDocument_savePresentedItemChangesWithCompletionHandler___block_invoke_279(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_applicationWillResignActive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *fileBookmark;
  id v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[5];
  void *v27;
  __int128 buf;
  uint64_t v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document is handling application resigning active: %@", (uint8_t *)&buf, 0xCu);
  }

  if (-[UIDocument _isOpen](self, "_isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.uikit"), CFSTR("SaveDocument"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D87C98]);
    v27 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithExplanation:target:attributes:", CFSTR("UIDocument resigning as file presenter"), v6, v9);

    v11 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __43__UIDocument__applicationWillResignActive___block_invoke;
    v26[3] = &unk_1E16C3C88;
    v26[4] = self;
    objc_msgSend(v10, "acquireWithInvalidationHandler:", v26);
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __43__UIDocument__applicationWillResignActive___block_invoke_290;
    v24[3] = &unk_1E16B2218;
    v24[4] = self;
    v13 = v12;
    v25 = v13;
    -[UIDocument _saveUnsavedChangesWithCompletionHandler:](self, "_saveUnsavedChangesWithCompletionHandler:", v24);
    if (!qword_1ECD7D728)
    {
      buf = xmmword_1E16C3CA8;
      v29 = 0;
      qword_1ECD7D728 = _sl_dlopen();
    }
    if (qword_1ECD7D728)
    {
      -[UIDocument fileURL](self, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v29 = 0x2020000000;
      v15 = off_1ECD7D738;
      v30 = off_1ECD7D738;
      if (!off_1ECD7D738)
      {
        v16 = FileProviderLibrary_0();
        v15 = dlsym(v16, "FPCreateBookmarkableStringFromDocumentURL");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v15;
        off_1ECD7D738 = v15;
      }
      _Block_object_dispose(&buf, 8);
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef _FPCreateBookmarkableStringFromDocumentURL(CFURLRef, CFErrorRef *)");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("UIDocument.m"), 55, CFSTR("%s"), dlerror());

        __break(1u);
      }
      ((void (*)(void *, _QWORD))v15)(v14, 0);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      fileBookmark = self->_fileBookmark;
      self->_fileBookmark = v17;

    }
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __43__UIDocument__applicationWillResignActive___block_invoke_291;
    block[3] = &unk_1E16B1B28;
    v23 = v10;
    v19 = v10;
    dispatch_group_notify(v13, MEMORY[0x1E0C80D38], block);

  }
}

void __43__UIDocument__applicationWillResignActive___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "document saving on resign active expired with error %@: %@", (uint8_t *)&v7, 0x16u);
  }

}

void __43__UIDocument__applicationWillResignActive___block_invoke_290(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_unregisterAsFilePresenterIfNecessary");
  _UIDocumentLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_INFO, "document saving on resign active finished: %@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __43__UIDocument__applicationWillResignActive___block_invoke_291(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_applicationDidBecomeActive:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  UIDocument *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document is handling application becoming active: %@", buf, 0xCu);
  }

  if (-[UIDocument _isOpen](self, "_isOpen"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__UIDocument__applicationDidBecomeActive___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    -[UIDocument performAsynchronousFileAccessUsingBlock:](self, "performAsynchronousFileAccessUsingBlock:", v5);
  }
}

void __42__UIDocument__applicationDidBecomeActive___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  void *v31;
  void *v32;
  _BYTE buf[24];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_registerAsFilePresenterIfNecessary");
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[4])
    goto LABEL_19;
  if (!qword_1ECD7D728)
  {
    *(_OWORD *)buf = xmmword_1E16C3CA8;
    *(_QWORD *)&buf[16] = 0;
    qword_1ECD7D728 = _sl_dlopen();
    v2 = *(_QWORD **)(a1 + 32);
  }
  if (!qword_1ECD7D728)
    goto LABEL_19;
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v5 = off_1ECD7D740;
  v34 = off_1ECD7D740;
  if (!off_1ECD7D740)
  {
    v6 = FileProviderLibrary_0();
    v5 = dlsym(v6, "FPCreateDocumentURLFromBookmarkableString");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v5;
    off_1ECD7D740 = v5;
  }
  _Block_object_dispose(buf, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFURLRef _FPCreateDocumentURLFromBookmarkableString(CFStringRef, CFErrorRef *)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("UIDocument.m"), 56, CFSTR("%s"), dlerror());

    __break(1u);
  }
  ((void (*)(uint64_t, void **))v5)(v4, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isEqual:", v3) & 1) == 0)
    {
      _UIDocumentLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v3;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        *(_WORD *)&buf[22] = 2112;
        v34 = v10;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "document moved from %@ to %@: %@", buf, 0x20u);
      }

      v11 = (void *)MEMORY[0x1E0CB34C8];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __42__UIDocument__applicationDidBecomeActive___block_invoke_293;
      v29[3] = &unk_1E16B1B50;
      v29[4] = *(_QWORD *)(a1 + 32);
      v30 = v8;
      objc_msgSend(v11, "blockOperationWithBlock:", v29);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "presentedItemOperationQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addOperations:waitUntilFinished:", v14, 1);

    }
LABEL_18:

    v2 = *(_QWORD **)(a1 + 32);
LABEL_19:
    objc_msgSend(v2, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDocument _fileModificationDateForURL:](UIDocument, "_fileModificationDateForURL:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fileModificationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToDate:", v21);

    v23 = *(void **)(a1 + 32);
    if (v22)
    {
      objc_msgSend(v23, "_updateConflictState");
    }
    else
    {
      objc_msgSend(v23, "fileURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "revertToContentsOfURL:completionHandler:", v24, 0);

    }
    return;
  }
  v15 = v31;
  v16 = objc_msgSend(v3, "checkPromisedItemIsReachableAndReturnError:", 0);
  _UIDocumentLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "document is unable to resolve document bookmark, but file still exists: %@", buf, 0xCu);
    }

    goto LABEL_18;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v25;
    _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "document is unable to resolve document bookmark and original is gone, forcing re-save: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "saveToURL:forSaveOperation:completionHandler:", v3, 0, 0);
}

uint64_t __42__UIDocument__applicationDidBecomeActive___block_invoke_293(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentedItemDidMoveToURL:", *(_QWORD *)(a1 + 40));
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  UIDocument *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document presented item will be deleted: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4)
    v4[2](v4, 0);

}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  UIDocument *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document: %@ did move to new URL: %@", (uint8_t *)&v6, 0x16u);
  }

  -[UIDocument _setFileURL:](self, "_setFileURL:", v4);
  -[UIDocument _updateLocalizedName](self, "_updateLocalizedName");
  -[UIDocument _manageUserActivity](self, "_manageUserActivity");

}

- (void)presentedItemDidChange
{
  NSObject *v3;
  int v4;
  UIDocument *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "document presented item did change: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_updateConflictState
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__UIDocument__updateConflictState__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(v3, block);

}

void __34__UIDocument__updateConflictState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB3648];
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unresolvedConflictVersionsOfItemAtURL:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setInConflict:", objc_msgSend(v3, "count") != 0);

}

- (void)presentedItemDidGainVersion:(id)a3
{
  NSObject *v4;
  int v5;
  UIDocument *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document did gain version: %@", (uint8_t *)&v5, 0xCu);
  }

  -[UIDocument _updateConflictState](self, "_updateConflictState");
}

- (void)presentedItemDidLoseVersion:(id)a3
{
  NSObject *v4;
  int v5;
  UIDocument *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document did lose version: %@", (uint8_t *)&v5, 0xCu);
  }

  -[UIDocument _updateConflictState](self, "_updateConflictState");
}

- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  int v9;
  UIDocument *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  _UIDocumentLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "document: %@ subitem will be deleted at URL: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7)
    v7[2](v7, 0);

}

- (void)presentedSubitemDidAppearAtURL:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  UIDocument *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document: %@ subitem did appear at URL: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)presentedSubitemDidChangeAtURL:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  UIDocument *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIDocumentLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "document: %@ subitem did change at URL: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)presentedSubitemAtURL:(id)a3 didMoveToURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  UIDocument *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _UIDocumentLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "document: %@ subitem at URL: %@ did move to URL: %@", (uint8_t *)&v9, 0x20u);
  }

  -[UIDocument _updateConflictState](self, "_updateConflictState");
}

- (void)presentedSubitemAtURL:(id)a3 didGainVersion:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  UIDocument *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _UIDocumentLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "document: %@ subitem did gain version at URL: %@", (uint8_t *)&v7, 0x16u);
  }

  -[UIDocument _updateConflictState](self, "_updateConflictState");
}

- (void)presentedSubitemAtURL:(id)a3 didLoseVersion:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  UIDocument *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _UIDocumentLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "document: %@ subitem did lose version at URL: %@", (uint8_t *)&v7, 0x16u);
  }

  -[UIDocument _updateConflictState](self, "_updateConflictState");
}

- (void)presentedItemDidResolveConflictVersion:(id)a3
{
  NSObject *v4;
  int v5;
  UIDocument *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIDocumentLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "document: %@ did resolve conflict version", (uint8_t *)&v5, 0xCu);
  }

  -[UIDocument _updateConflictState](self, "_updateConflictState");
}

- (void)presentedSubitemAtURL:(id)a3 didResolveConflictVersion:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  UIDocument *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _UIDocumentLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "document: %@ did resolve conflict at URL: %@", (uint8_t *)&v7, 0x16u);
  }

  -[UIDocument _updateConflictState](self, "_updateConflictState");
}

- (void)presentedItemHasUnsavedChangesWithCompletionHandler:(id)a3
{
  void (**v4)(id, _BOOL8);
  _BOOL8 v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  UIDocument *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BOOL8))a3;
  v5 = -[UIDocument hasUnsavedChanges](self, "hasUnsavedChanges");
  if (v4)
    v4[2](v4, v5);
  _UIDocumentLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "document: %@ did report %@ for unsaved changes", (uint8_t *)&v8, 0x16u);
  }

}

- (NSDocumentDifferenceSize)differenceDueToRecentChanges
{
  return (NSDocumentDifferenceSize *)self->_differenceDueToRecentChanges;
}

- (NSDocumentDifferenceSize)differenceSincePreservingPreviousVersion
{
  return (NSDocumentDifferenceSize *)self->_differenceSincePreservingPreviousVersion;
}

- (NSDocumentDifferenceSize)differenceSinceSaving
{
  return (NSDocumentDifferenceSize *)self->_differenceSinceSaving;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progresses, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong(&self->_alertPresenter, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong(&self->_versionWithoutRecentChanges, 0);
  objc_storeStrong((id *)&self->_autosavingTimer, 0);
  objc_storeStrong(&self->_differenceSinceSaving, 0);
  objc_storeStrong(&self->_differenceSincePreservingPreviousVersion, 0);
  objc_storeStrong(&self->_differenceDueToRecentChanges, 0);
  objc_storeStrong((id *)&self->_filePresenterQueue, 0);
  objc_storeStrong((id *)&self->_fileAccessSemaphore, 0);
  objc_storeStrong((id *)&self->_openingQueue, 0);
  objc_storeStrong((id *)&self->_fileAccessQueue, 0);
  objc_storeStrong((id *)&self->_fileModificationDate, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_fileBookmark, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_activityContinuationLock, 0);
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
}

+ (id)_documentWithContentsOfFileURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  id v23;
  void *v24;
  int v25;
  unint64_t v26;
  NSObject *v27;
  unint64_t v28;
  NSObject *v29;
  id *v31;
  id v32;
  int v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "utTypeToDocumentClassMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  v40 = 0;
  v9 = *MEMORY[0x1E0C998E0];
  v39 = 0;
  LODWORD(v6) = objc_msgSend(v5, "getResourceValue:forKey:error:", &v40, v9, &v39);
  v10 = v40;
  v11 = v39;
  v12 = v11;
  if (!(_DWORD)v6)
  {
    v26 = qword_1ECD7D720;
    if (!qword_1ECD7D720)
    {
      v26 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v26, (unint64_t *)&qword_1ECD7D720);
    }
    v27 = *(NSObject **)(v26 + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v5;
      v43 = 2112;
      v44 = v12;
      _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "Unable to create document from file at URL <%@>: %@", buf, 0x16u);
    }
    v24 = 0;
    if (v8)
      goto LABEL_30;
    goto LABEL_31;
  }
  v33 = v8;
  v34 = v11;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v7, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v14)
  {
    v15 = v14;
    v31 = a4;
    v32 = v5;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToType:", v20, v31)
          && (!v17 || objc_msgSend(v17, "isSupertypeOfType:", v20)))
        {
          v21 = objc_msgSend(v7, "objectForKey:", v20);
          if (v21)
          {
            v22 = (objc_class *)v21;
            v23 = v20;

            v16 = v22;
            v17 = v23;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v15);

    if (v16)
    {
      v5 = v32;
      v24 = (void *)objc_msgSend([v16 alloc], "initWithFileURL:", v32);
      a4 = v31;
      v25 = v33;
      goto LABEL_29;
    }
    a4 = v31;
    v5 = v32;
  }
  else
  {

    v17 = 0;
  }
  v25 = v33;
  v28 = qword_1ECD7D718;
  if (!qword_1ECD7D718)
  {
    v28 = __UILogCategoryGetNode("UIDocument", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v28, (unint64_t *)&qword_1ECD7D718);
  }
  v29 = *(NSObject **)(v28 + 8);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v5;
    _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Unable to create document from file at URL <%@>: no document class found. Define the correct UIDocument subclass with the key UIDocumentClass in the info.plist's CFBundleDocumentTypes dictionary.", buf, 0xCu);
  }
  v24 = 0;
LABEL_29:

  v12 = v34;
  if (v25)
LABEL_30:
    objc_msgSend(v5, "stopAccessingSecurityScopedResource");
LABEL_31:
  if (a4 && v12)
    *a4 = objc_retainAutorelease(v12);

  return v24;
}

- (id)_fileOpeningQueue
{
  return self->_openingQueue;
}

+ (id)_fileModificationDateForURL:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  v4 = *MEMORY[0x1E0C998D8];
  v11 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v12, v4, &v11);
  v6 = v12;
  v7 = v11;
  if ((v5 & 1) == 0)
  {
    _UIDocumentLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "failed to get modification date for URL: %@ with error: %@", buf, 0x16u);

    }
  }

  return v6;
}

- (void)_performBlock:(id)a3 synchronouslyOnQueue:(id)a4
{
  NSObject *v5;
  void (**v6)(_QWORD);
  NSObject *queue;

  queue = a4;
  dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void (**)(_QWORD))a3;

  if (v5 == queue)
    v6[2](v6);
  else
    dispatch_sync(queue, v6);

}

- (void)_performBlockSynchronouslyOnMainThread:(id)a3
{
  -[UIDocument _performBlock:synchronouslyOnQueue:](self, "_performBlock:synchronouslyOnQueue:", a3, MEMORY[0x1E0C80D38]);
}

@end
