@implementation TSUURLTracker

- (TSUURLTracker)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUURLTracker init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUURLTracker.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 56, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSUURLTracker init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (TSUURLTracker)initWithURL:(id)a3 bookmarkData:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  TSUURLTracker *v11;
  TSUURLTrackerFilePresenter *v12;
  TSUURLTrackerFilePresenter *filePresenter;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TSUURLTracker;
  v11 = -[TSUURLTracker init](&v15, sel_init);
  if (v11)
  {
    v12 = -[TSUURLTrackerFilePresenter initWithURL:bookmarkData:delegate:]([TSUURLTrackerFilePresenter alloc], "initWithURL:bookmarkData:delegate:", v8, v9, v10);
    filePresenter = v11->_filePresenter;
    v11->_filePresenter = v12;

    -[TSUURLTracker resume](v11, "resume");
  }

  return v11;
}

- (TSUURLTracker)initWithURL:(id)a3
{
  return -[TSUURLTracker initWithURL:bookmarkData:delegate:](self, "initWithURL:bookmarkData:delegate:", a3, 0, 0);
}

- (TSUURLTracker)initWithURL:(id)a3 delegate:(id)a4
{
  return -[TSUURLTracker initWithURL:bookmarkData:delegate:](self, "initWithURL:bookmarkData:delegate:", a3, 0, a4);
}

- (TSUURLTracker)initWithBookmarkData:(id)a3
{
  return -[TSUURLTracker initWithURL:bookmarkData:delegate:](self, "initWithURL:bookmarkData:delegate:", 0, a3, 0);
}

- (TSUURLTracker)initWithBookmarkData:(id)a3 delegate:(id)a4
{
  return -[TSUURLTracker initWithURL:bookmarkData:delegate:](self, "initWithURL:bookmarkData:delegate:", 0, a3, a4);
}

- (void)dealloc
{
  TSUURLTrackerFilePresenter *v3;
  NSObject *v4;
  TSUURLTrackerFilePresenter *v5;
  objc_super v6;
  _QWORD block[4];
  TSUURLTrackerFilePresenter *v8;

  v3 = self->_filePresenter;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__TSUURLTracker_dealloc__block_invoke;
  block[3] = &unk_24F39B528;
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)TSUURLTracker;
  -[TSUURLTracker dealloc](&v6, sel_dealloc);
}

uint64_t __24__TSUURLTracker_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (NSURL)URL
{
  return (NSURL *)-[TSUURLTrackerFilePresenter URLAndReturnError:](self->_filePresenter, "URLAndReturnError:", 0);
}

- (id)URLAndReturnError:(id *)a3
{
  return -[TSUURLTrackerFilePresenter URLAndReturnError:](self->_filePresenter, "URLAndReturnError:", a3);
}

- (NSData)bookmarkData
{
  return -[TSUURLTrackerFilePresenter bookmarkData](self->_filePresenter, "bookmarkData");
}

- (void)pause
{
  -[TSUURLTrackerFilePresenter pause](self->_filePresenter, "pause");
}

- (void)resume
{
  -[TSUURLTrackerFilePresenter startOrResume](self->_filePresenter, "startOrResume");
}

- (void)stop
{
  -[TSUURLTrackerFilePresenter stop](self->_filePresenter, "stop");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1570], "filePresenters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", self->_filePresenter);
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p started=%@ filePresenter=%@>"), v5, self, v8, self->_filePresenter);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePresenter, 0);
}

@end
