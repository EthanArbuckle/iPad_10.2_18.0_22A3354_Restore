@implementation _UIDocumentURLChangeObserver

- (_UIDocumentURLChangeObserver)initWithFileURL:(id)a3
{
  id v6;
  _UIDocumentURLChangeObserver *v7;
  _UIDocumentURLChangeObserver *v8;
  uint64_t v9;
  NSOperationQueue *presentedItemOperationQueue;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDocumentURLChangeObserver.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIDocumentURLChangeObserver;
  v7 = -[_UIDocumentURLChangeObserver init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_presentedItemURL, a3);
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    presentedItemOperationQueue = v8->_presentedItemOperationQueue;
    v8->_presentedItemOperationQueue = (NSOperationQueue *)v9;

  }
  return v8;
}

- (BOOL)isObserving
{
  void *v2;
  BOOL v3;

  -[_UIDocumentURLChangeObserver changeHandler](self, "changeHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)startObservingWithChangeHandler:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDocumentURLChangeObserver.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeHandler != NULL"));

  }
  if (-[_UIDocumentURLChangeObserver isObserving](self, "isObserving"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDocumentURLChangeObserver.m"), 43, CFSTR("Already observing."));

  }
  -[_UIDocumentURLChangeObserver setChangeHandler:](self, "setChangeHandler:", v7);
  objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", self);

}

- (void)stopObserving
{
  void *v4;

  if (!-[_UIDocumentURLChangeObserver isObserving](self, "isObserving"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDocumentURLChangeObserver.m"), 50, CFSTR("Not observing."));

  }
  objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", self);
  -[_UIDocumentURLChangeObserver setChangeHandler:](self, "setChangeHandler:", 0);
}

- (void)presentedItemDidChange
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  -[_UIDocumentURLChangeObserver changeHandler](self, "changeHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, 0);
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

- (void)presentedItemDidMoveToURL:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_presentedItemURL, a3);
  -[_UIDocumentURLChangeObserver changeHandler](self, "changeHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
}

@end
