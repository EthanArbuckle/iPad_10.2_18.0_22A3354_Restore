@implementation TSKDocumentRootICloudObserver

- (TSKDocumentRootICloudObserver)initWithBlock:(id)a3
{
  TSKDocumentRootICloudObserver *v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSKDocumentRootICloudObserver;
  v4 = -[TSKDocumentRootICloudObserver init](&v8, sel_init);
  if (v4)
  {
    v4->_block = (id)objc_msgSend(a3, "copy");
    do
    {
      v5 = __ldxr(&nextICloudObserverID);
      v6 = v5 + 1;
    }
    while (__stxr(v6, &nextICloudObserverID));
    v4->_identifer = v6;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKDocumentRootICloudObserver;
  -[TSKDocumentRootICloudObserver dealloc](&v3, sel_dealloc);
}

- (void)invokeWithDocumentRoot:(id)a3
{
  void *v4;
  uint64_t v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentRootICloudObserver invokeWithDocumentRoot:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 112, CFSTR("This operation must only be performed on the main thread."));
  }
  (*((void (**)(void))self->_block + 2))();
}

- (int64_t)identifer
{
  return self->_identifer;
}

@end
