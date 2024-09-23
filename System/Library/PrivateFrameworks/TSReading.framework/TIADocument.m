@implementation TIADocument

- (TIADocument)initWithTemporaryFileURL:(id)a3
{
  TIADocument *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = -[UIDocument initWithFileURL:](self, "initWithFileURL:", a3);
  if (v3)
  {
    -[TIADocument setContext:](v3, "setContext:", -[TSPObjectContext initWithDelegate:]([TSPObjectContext alloc], "initWithDelegate:", v3));
    v4 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(+[TSAApplicationDelegate sharedDelegate](TSAApplicationDelegate, "sharedDelegate"), "documentRootClass")), "initDocumentObjectWithContext:", -[TIADocument context](v3, "context"));
    if (!v4)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TIADocument initWithTemporaryFileURL:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TIADocument.m"), 209, CFSTR("invalid nil value for '%s'"), "documentRoot");
    }
    objc_msgSend(v4, "setDelegate:", v3);
  }
  return v3;
}

- (void)dealloc
{
  NSObject *ioQueue;
  NSObject *ioOperationQueue;
  objc_super v5;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self->_documentStateChangedObserver);

  -[TSADocumentRoot setDelegate:](-[TIADocument documentRoot](self, "documentRoot"), "setDelegate:", 0);
  ioQueue = self->_ioQueue;
  if (ioQueue)
    dispatch_release(ioQueue);
  ioOperationQueue = self->_ioOperationQueue;
  if (ioOperationQueue)
    dispatch_release(ioOperationQueue);

  v5.receiver = self;
  v5.super_class = (Class)TIADocument;
  -[UIDocument dealloc](&v5, sel_dealloc);
}

- (TSADocumentRoot)documentRoot
{
  objc_opt_class();
  -[TSPObjectContext documentObject](-[TIADocument context](self, "context"), "documentObject");
  return (TSADocumentRoot *)TSUDynamicCast();
}

- (BOOL)hasUnsavedChanges
{
  objc_super v4;

  if (-[TIADocument isReadOnly](self, "isReadOnly")
    || -[TIADocument isClosingWithoutSaving](self, "isClosingWithoutSaving")
    || -[TIADocument isClosed](self, "isClosed")
    || self->_documentRootForDocumentDidLoad)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TIADocument;
  return -[UIDocument hasUnsavedChanges](&v4, sel_hasUnsavedChanges);
}

- (id)documentUUID
{
  return 0;
}

- (NSString)documentCachePath
{
  return (NSString *)-[TIADocumentInfo documentCachePath](-[TIADocument documentInfo](self, "documentInfo"), "documentCachePath");
}

- (BOOL)isClosed
{
  return -[UIDocument documentState](self, "documentState") & 1;
}

- (void)closeWithCompletionHandler:(id)a3
{
  _BOOL4 v5;
  TIADocumentInfo *documentInfo;
  TIADocumentInfo *v7;
  uint64_t v8;
  _QWORD v9[6];
  objc_super v10;
  _QWORD v11[5];
  char v12;

  v5 = -[TIADocument isClosed](self, "isClosed");
  documentInfo = self->_documentInfo;
  if (v5)
  {
    if (-[TIADocumentInfo isSaving](documentInfo, "isSaving"))
    {
      v7 = self->_documentInfo;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __42__TIADocument_closeWithCompletionHandler___block_invoke;
      v9[3] = &unk_24D82C328;
      v9[4] = self;
      v9[5] = a3;
      -[TIADocumentInfo notifySaveIsFinishedUsingQueue:completion:](v7, "notifySaveIsFinishedUsingQueue:completion:", MEMORY[0x24BDAC9B8], v9);
    }
    else if (a3)
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
    }
  }
  else
  {
    -[TIADocumentInfo beginSave](documentInfo, "beginSave");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__TIADocument_closeWithCompletionHandler___block_invoke_5;
    v11[3] = &unk_24D82FAB8;
    v11[4] = &v8;
    v12 = 1;
    v10.receiver = self;
    v10.super_class = (Class)TIADocument;
    -[UIDocument closeWithCompletionHandler:](&v10, sel_closeWithCompletionHandler_, v11, MEMORY[0x24BDAC760], 3221225472, __42__TIADocument_closeWithCompletionHandler___block_invoke_2, &unk_24D82A8A8, self, a3);
  }
}

uint64_t __42__TIADocument_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__TIADocument_closeWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t result;
  _QWORD v7[5];

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "documentRoot");
  v5 = (id)objc_msgSend(v4, "accessController");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TIADocument_closeWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_24D829278;
  v7[4] = v4;
  objc_msgSend(v5, "performRead:", v7);

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "context"), "close");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "endSave");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "isSynced"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "setWillDownload:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __42__TIADocument_closeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willClose");
}

uint64_t __42__TIADocument_closeWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)p_performSynchronousBlockOnMainThread:(id)a3
{
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    (*((void (**)(id))a3 + 2))(a3);
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], a3);
}

- (id)contentsForType:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (void)documentDidLoad
{
  TSADocumentRoot *v3;
  unint64_t *p_documentRootForDocumentDidLoad;
  unint64_t v5;

  v3 = -[TIADocument documentRoot](self, "documentRoot");
  p_documentRootForDocumentDidLoad = (unint64_t *)&self->_documentRootForDocumentDidLoad;
  while (1)
  {
    v5 = __ldaxr(p_documentRootForDocumentDidLoad);
    if ((TSADocumentRoot *)v5 != v3)
      break;
    if (!__stlxr(0, p_documentRootForDocumentDidLoad))
    {
      -[TSADocumentRoot documentDidLoad](v3, "documentDidLoad");
      return;
    }
  }
  __clrex();
}

- (BOOL)shouldAbandonDocumentRevert
{
  return 0;
}

- (BOOL)hasPersistenceErrors
{
  return self->_hasPersistenceErrors != 0;
}

- (NSString)name
{
  return (NSString *)-[TIADocumentInfo displayName](-[TIADocument documentInfo](self, "documentInfo"), "displayName");
}

- (void)passwordStateDidChange
{
  -[UIDocument updateChangeCount:](self, "updateChangeCount:", 0);
}

- (void)coordinatedReadUsingAccessor:(id)a3
{
  NSURL *templateURL;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  templateURL = self->_templateURL;
  if (!templateURL)
    templateURL = -[UIDocument fileURL](self, "fileURL");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__TIADocument_coordinatedReadUsingAccessor___block_invoke;
  v7[3] = &unk_24D82FAE0;
  v7[4] = a3;
  v7[5] = &v9;
  objc_msgSend(v6, "coordinateReadingItemAtURL:options:error:byAccessor:", templateURL, 1, &v8, v7);

  if (!*((_BYTE *)v10 + 24))
  {
    TSULogErrorInFunction();
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __44__TIADocument_coordinatedReadUsingAccessor___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)packageDataForWrite
{
  return -[TSADocumentRoot packageDataForWrite](-[TIADocument documentRoot](self, "documentRoot"), "packageDataForWrite");
}

- (id)additionalDocumentPropertiesForWrite
{
  return -[TSADocumentRoot additionalDocumentPropertiesForWrite](-[TIADocument documentRoot](self, "documentRoot"), "additionalDocumentPropertiesForWrite");
}

- (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5
{
  return (id)objc_msgSend((id)objc_msgSend(+[TSABaseApplicationDelegate sharedDelegate](TSABaseApplicationDelegate, "sharedDelegate"), "documentRootClass"), "persistenceWarningsForData:isReadable:isExternal:", a3, a4, a5);
}

- (void)context:(id)a3 didDownloadDocumentResources:(id)a4 failedOrCancelledDocumentResources:(id)a5 error:(id)a6
{
  objc_opt_class();
  objc_msgSend(a3, "documentObject");
  objc_msgSend((id)TSUDynamicCast(), "didDownloadDocumentResources:failedOrCancelledDocumentResources:error:", a4, a5, a6);
}

- (BOOL)_shouldPreventFileProtectionUpgradeToLevel:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDD0CD0])
      && (-[TSKDocumentViewController isPrintingDocument](-[TSKDocumentRoot viewController](-[TIADocument documentRoot](self, "documentRoot"), "viewController"), "isPrintingDocument") & 1) != 0;
}

- (void)setFileProtectionTo:(id)a3 atPath:(id)a4
{
  void *v6;
  uint64_t v7;

  if (a4)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", a4))
    {
      v7 = 0;
      v6 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      objc_msgSend(v6, "changeFileProtectionAtURL:toProtection:recursively:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a4), a3, 1, &v7);
    }
  }
}

- (void)setDocumentFileProtectionTo:(id)a3
{
  -[TIADocument setFileProtectionTo:atPath:](self, "setFileProtectionTo:atPath:", a3, -[NSURL path](-[UIDocument fileURL](self, "fileURL"), "path"));
}

- (BOOL)isPasswordProtected
{
  return -[TIADocument encryptionKey](self, "encryptionKey") != 0;
}

- (void)setDocumentPasswordHint:(id)a3
{
  -[TSPObjectContext setDocumentPasswordHint:](self->_context, "setDocumentPasswordHint:", a3);
  -[UIDocument updateChangeCount:](self, "updateChangeCount:", 0);
}

- (void)setEncryptionKeyWithPassphrase:(id)a3
{
  id v5;
  id v6;

  -[TIADocument willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isPasswordProtected"));
  if (a3)
  {
    v5 = objc_alloc(MEMORY[0x24BEB3C08]);
    v6 = (id)objc_msgSend(v5, "initAes128KeyFromPassphrase:iterationCount:", a3, *MEMORY[0x24BEB3D38]);
  }
  else
  {
    v6 = 0;
  }
  -[TIADocument setEncryptionKey:](self, "setEncryptionKey:", v6);
  -[TIADocument didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isPasswordProtected"));
  -[UIDocument updateChangeCount:](self, "updateChangeCount:", 0);
}

- (BOOL)validatePassphrase:(id)a3
{
  id v5;

  if (!-[TIADocument isPasswordProtected](self, "isPasswordProtected") || !self->_encryptionKey)
    return 1;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C08]), "initAes128KeyFromPassphrase:withIterationCountAndSaltDataFromCryptoKey:", a3, self->_encryptionKey);
  return SFUEqualCryptoKeys();
}

- (NSString)documentPasswordHint
{
  return -[TSPObjectContext documentPasswordHint](-[TIADocument context](self, "context"), "documentPasswordHint");
}

- (id)newExporterForType:(id)a3 options:(id)a4 preferredType:(id *)a5
{
  return -[TSADocumentRoot newExporterForType:options:preferredType:](-[TIADocument documentRoot](self, "documentRoot"), "newExporterForType:options:preferredType:", a3, a4, a5);
}

- (BOOL)passwordEntryWasAbandoned
{
  return self->_passwordEntryWasAbandoned;
}

- (TSPObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (TIADocumentInfo)documentInfo
{
  return self->_documentInfo;
}

- (void)setDocumentInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (BOOL)isShowingConflictResolutionSheet
{
  return self->_isShowingConflictResolutionSheet;
}

- (BOOL)isClosingWithoutSaving
{
  return self->_isClosingWithoutSaving;
}

- (void)setIsClosingWithoutSaving:(BOOL)a3
{
  self->_isClosingWithoutSaving = a3;
}

- (TIADocumentPassphraseDelegate)passphraseDelegate
{
  return self->_passphraseDelegate;
}

- (void)setPassphraseDelegate:(id)a3
{
  self->_passphraseDelegate = (TIADocumentPassphraseDelegate *)a3;
}

- (SFUCryptoKey)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (NSString)sourcePathForNondestructiveImport
{
  return self->_sourcePathForNondestructiveImport;
}

- (void)setSourcePathForNondestructiveImport:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (TSPObjectContext)contextForRevert
{
  return self->_contextForRevert;
}

- (void)setContextForRevert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (NSURL)templateURL
{
  return self->_templateURL;
}

- (void)setTemplateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void)setIsReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (BOOL)documentNeedsDownloadOnRevert
{
  return self->_documentNeedsDownloadOnRevert;
}

- (BOOL)documentRevertWasAbandoned
{
  return self->_documentRevertWasAbandoned;
}

@end
