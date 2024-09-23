@implementation OCMapper

- (OCMapper)init
{
  OCMapper *v2;
  OCCancel *v3;
  OCCancel *mCancel;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OCMapper;
  v2 = -[OCMapper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OCCancel);
    mCancel = v2->mCancel;
    v2->mCancel = v3;

  }
  return v2;
}

- (void)cancel
{
  -[OCCancel cancel](self->mCancel, "cancel");
}

- (BOOL)isCancelled
{
  return -[OCCancel isCancelled](self->mCancel, "isCancelled");
}

- (void)quit
{
  -[OCCancel quit](self->mCancel, "quit");
}

- (void)setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kOCMapper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OCMapper setup]");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCMapper.mm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v5, 53, 0, "More than one exporter document controller in one thread");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", self, CFSTR("kOCMapper"));

}

- (void)teardown
{
  void *v3;
  void *v4;
  OCMapper *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  OITSUTemporaryDirectory *mTemporaryDirectoryObject;

  +[TCBundleResourceManager disposeInstance](TCBundleResourceManager, "disposeInstance");
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("kOCMapper"));
  v5 = (OCMapper *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OCMapper teardown]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCMapper.mm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 63, 0, "More than one exporter document controller in one thread");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("kOCMapper"));

  mTemporaryDirectoryObject = self->mTemporaryDirectoryObject;
  self->mTemporaryDirectoryObject = 0;

}

+ (id)mapperForCurrentThread
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kOCMapper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)temporaryDirectoryPath
{
  OITSUTemporaryDirectory *mTemporaryDirectoryObject;
  OITSUTemporaryDirectory *v4;
  OITSUTemporaryDirectory *v5;

  mTemporaryDirectoryObject = self->mTemporaryDirectoryObject;
  if (!mTemporaryDirectoryObject)
  {
    v4 = -[OITSUTemporaryDirectory initWithError:]([OITSUTemporaryDirectory alloc], "initWithError:", 0);
    v5 = self->mTemporaryDirectoryObject;
    self->mTemporaryDirectoryObject = v4;

    mTemporaryDirectoryObject = self->mTemporaryDirectoryObject;
  }
  return -[OITSUTemporaryDirectory path](mTemporaryDirectoryObject, "path");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTemporaryDirectoryObject, 0);
  objc_storeStrong((id *)&self->mCancel, 0);
}

@end
