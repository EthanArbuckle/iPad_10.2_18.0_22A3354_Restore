@implementation THBookOpener

+ (id)loadingQueue
{
  id result;
  id v4;

  result = (id)qword_543170;
  if (!qword_543170)
  {
    objc_sync_enter(a1);
    if (!qword_543170)
    {
      v4 = objc_alloc_init((Class)NSOperationQueue);
      __dmb(0xBu);
      qword_543170 = (uint64_t)v4;
      if (!v4)
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookOpener loadingQueue]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookOpener.m"), 59, CFSTR("Couldn't create singleton instance of NSOperationQueue"));
        v4 = (id)qword_543170;
      }
      objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);
    }
    objc_sync_exit(a1);
    return (id)qword_543170;
  }
  return result;
}

- (THBookOpener)initWithDocumentRoot:(id)a3
{
  THBookOpener *v4;
  THBookOpener *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THBookOpener;
  v4 = -[THBookOpener init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THBookOpener setDocumentRoot:](v4, "setDocumentRoot:", a3);
  return v5;
}

- (BOOL)wasError
{
  return -[THBookOpener error](self, "error") || -[THBookOpener exception](self, "exception") != 0;
}

- (BOOL)isSuccessful
{
  if (-[THBookOpener wasError](self, "wasError"))
    return 0;
  else
    return -[THBookOpener isCancelled](self, "isCancelled") ^ 1;
}

- (void)main
{
  id v3;
  NSString *v4;
  unsigned int v5;
  unsigned int v6;
  NSURL *v7;
  NSURL *v8;
  NSString *v9;
  __CFString **v10;
  uint64_t v11;
  id v12;
  char v13;

  v3 = objc_alloc_init((Class)NSAutoreleasePool);
  v4 = -[THBookDescription tspObjectContextPath](-[THDocumentRoot bookDescription](-[THBookOpener documentRoot](self, "documentRoot"), "bookDescription"), "tspObjectContextPath");
  if (v4)
  {
    v13 = 0;
    v5 = -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", v4, &v13);
    if (v13)
      v6 = 0;
    else
      v6 = v5;
    if (v6 == 1)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookOpener main]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookOpener.m"), 104, CFSTR("The object context path should have been a folder."));
      if (!v13)
        -[THBookOpener setError:](self, "setError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.Thunderfish"), 101, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, NSFilePathErrorKey, 0)));
    }
    if (-[THBookOpener isSuccessful](self, "isSuccessful"))
    {
      v7 = -[THBookDescription bookBundleUrl](-[THDocumentRoot bookDescription](-[THBookOpener documentRoot](self, "documentRoot"), "bookDescription"), "bookBundleUrl");
      v8 = v7;
      v12 = 0;
      if (v7 && -[NSURL path](v7, "path") && -[NSString length](-[NSURL path](v8, "path"), "length"))
      {
        if (+[THApplePubController readAppPubFileToDocumentRoot:url:error:](THApplePubController, "readAppPubFileToDocumentRoot:url:error:", -[THBookOpener documentRoot](self, "documentRoot"), v8, &v12))
        {
          if (-[THBookOpener isSuccessful](self, "isSuccessful"))
          {
            -[THDocumentRoot setLibraryDatabaseKey:](-[THBookOpener documentRoot](self, "documentRoot"), "setLibraryDatabaseKey:", -[THBookDescription databaseKey](-[THDocumentRoot bookDescription](-[THBookOpener documentRoot](self, "documentRoot"), "bookDescription"), "databaseKey"));
            if (!-[THDocumentRoot loadEquationFontsIfNeeded](-[THBookOpener documentRoot](self, "documentRoot"), "loadEquationFontsIfNeeded"))-[THBookOpener setError:](self, "setError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.Thunderfish"), 102, 0));
          }
        }
        if (!v12)
          goto LABEL_20;
      }
      else
      {
        v12 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.iWork.Thunderfish"), 101, 0);
        if (!v12)
          goto LABEL_20;
      }
      -[THBookOpener setError:](self, "setError:");
    }
  }
LABEL_20:
  objc_msgSend(v3, "drain");
  if (!-[THBookOpener error](self, "error"))
  {
    if (qword_543180 != -1)
      dispatch_once(&qword_543180, &stru_427C98);
    if (byte_543178)
    {
      v9 = -[NSUserDefaults stringForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "stringForKey:", CFSTR("THBookOpenSimulatedError"));
      if (-[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("open-failed")))
      {
        v10 = &kTHErrorDomain;
        v11 = 101;
LABEL_32:
        -[THBookOpener setError:](self, "setError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", *v10, v11, 0));
        return;
      }
      if (-[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("drm-user-removed")))
      {
        v11 = -42595;
LABEL_31:
        v10 = &mbkFCZS0leKzYP1BBPFY;
        goto LABEL_32;
      }
      if (-[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("drm-family-content-unplayable"))
        || -[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("drm-user-departed-family")))
      {
        v11 = -42597;
        goto LABEL_31;
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  self->mDocumentRoot = 0;
  self->mError = 0;

  self->mException = 0;
  v3.receiver = self;
  v3.super_class = (Class)THBookOpener;
  -[THBookOpener dealloc](&v3, "dealloc");
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSError)error
{
  return self->mError;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSException)exception
{
  return self->mException;
}

- (void)setException:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
