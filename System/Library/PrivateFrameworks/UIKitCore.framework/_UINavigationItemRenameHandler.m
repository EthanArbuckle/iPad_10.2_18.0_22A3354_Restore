@implementation _UINavigationItemRenameHandler

- (_UINavigationItemRenameHandler)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to initialize an instance of _UINavigationItemRenameHandler by calling init."));

  return 0;
}

- (_UINavigationItemRenameHandler)initWithDidEndRenamingHandler:(id)a3
{
  id v5;
  _UINavigationItemRenameHandler *v6;
  _UINavigationItemRenameHandler *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationItemRenameHandler.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("didEndRenamingHandler != NULL"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationItemRenameHandler;
  v6 = -[_UINavigationItemRenameHandler init](&v10, sel_init);
  v7 = v6;
  if (v6)
    -[_UINavigationItemRenameHandler setDidEndRenamingHandler:](v6, "setDidEndRenamingHandler:", v5);

  return v7;
}

+ (id)handlerWithDidEndRenamingHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDidEndRenamingHandler:", v4);

  return v5;
}

- (UINavigationItem)associatedItem
{
  return (UINavigationItem *)objc_loadWeakRetained((id *)&self->_associatedItem);
}

- (void)setAssociatedItem:(id)a3
{
  objc_storeWeak((id *)&self->_associatedItem, a3);
}

- (id)shouldBeginRenamingHandler
{
  return self->_shouldBeginRenamingHandler;
}

- (void)setShouldBeginRenamingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)willBeginRenamingHandler
{
  return self->_willBeginRenamingHandler;
}

- (void)setWillBeginRenamingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)didEndRenamingHandler
{
  return self->_didEndRenamingHandler;
}

- (void)setDidEndRenamingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)willBeginRenamingWithRangeHandler
{
  return self->_willBeginRenamingWithRangeHandler;
}

- (void)setWillBeginRenamingWithRangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)shouldEndRenamingHandler
{
  return self->_shouldEndRenamingHandler;
}

- (void)setShouldEndRenamingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)fileURLForRenaming
{
  return self->_fileURLForRenaming;
}

- (void)setFileURLForRenaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)fileRenameDidFail
{
  return self->_fileRenameDidFail;
}

- (void)setFileRenameDidFail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)fileRenameDidEnd
{
  return self->_fileRenameDidEnd;
}

- (void)setFileRenameDidEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileRenameDidEnd, 0);
  objc_storeStrong(&self->_fileRenameDidFail, 0);
  objc_storeStrong(&self->_fileURLForRenaming, 0);
  objc_storeStrong(&self->_shouldEndRenamingHandler, 0);
  objc_storeStrong(&self->_willBeginRenamingWithRangeHandler, 0);
  objc_storeStrong(&self->_didEndRenamingHandler, 0);
  objc_storeStrong(&self->_willBeginRenamingHandler, 0);
  objc_storeStrong(&self->_shouldBeginRenamingHandler, 0);
  objc_destroyWeak((id *)&self->_associatedItem);
}

- (BOOL)_canRename
{
  uint64_t (**shouldBeginRenamingHandler)(void);

  shouldBeginRenamingHandler = (uint64_t (**)(void))self->_shouldBeginRenamingHandler;
  if (shouldBeginRenamingHandler)
    return shouldBeginRenamingHandler[2]();
  else
    return +[_UINavigationItemRenameHandler defaultNavigationItemShouldBeginRenaming:forValidDelegate:](_UINavigationItemRenameHandler, "defaultNavigationItemShouldBeginRenaming:forValidDelegate:", 0, 1);
}

- (id)_willBeginRenamingWithTitle:(id)a3 selectedRange:(_NSRange *)a4
{
  id v6;
  void (**willBeginRenamingHandler)(id, id);
  void *v8;
  NSUInteger v9;
  void (**willBeginRenamingWithRangeHandler)(id, id, _NSRange *);

  v6 = a3;
  willBeginRenamingHandler = (void (**)(id, id))self->_willBeginRenamingHandler;
  if (willBeginRenamingHandler)
  {
    willBeginRenamingHandler[2](willBeginRenamingHandler, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "length");
    a4->location = 0;
    a4->length = v9;
  }
  else
  {
    willBeginRenamingWithRangeHandler = (void (**)(id, id, _NSRange *))self->_willBeginRenamingWithRangeHandler;
    if (willBeginRenamingWithRangeHandler)
      willBeginRenamingWithRangeHandler[2](willBeginRenamingWithRangeHandler, v6, a4);
    else
      +[_UINavigationItemRenameHandler defaultNavigationItem:willBeginRenamingWithSuggestedTitle:selectedRange:](_UINavigationItemRenameHandler, "defaultNavigationItem:willBeginRenamingWithSuggestedTitle:selectedRange:", 0, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)_shouldEndRenamingWithTitle:(id)a3
{
  uint64_t (**shouldEndRenamingHandler)(id, id);

  shouldEndRenamingHandler = (uint64_t (**)(id, id))self->_shouldEndRenamingHandler;
  if (shouldEndRenamingHandler)
    return shouldEndRenamingHandler[2](shouldEndRenamingHandler, a3);
  else
    return +[_UINavigationItemRenameHandler defaultNavigationItem:shouldEndRenamingWithTitle:](_UINavigationItemRenameHandler, "defaultNavigationItem:shouldEndRenamingWithTitle:", 0, a3);
}

- (void)_didEndRenamingWithTitle:(id)a3
{
  (*((void (**)(void))self->_didEndRenamingHandler + 2))();
}

- (id)_fileURLForRenaming
{
  void (**fileURLForRenaming)(_QWORD, _QWORD);

  fileURLForRenaming = (void (**)(_QWORD, _QWORD))self->_fileURLForRenaming;
  if (fileURLForRenaming)
  {
    ((void (**)(_QWORD, SEL))fileURLForRenaming)[2](fileURLForRenaming, a2);
    fileURLForRenaming = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return fileURLForRenaming;
}

- (void)_fileRenameDidFailWithError:(id)a3
{
  void (**fileRenameDidFail)(id, id);

  fileRenameDidFail = (void (**)(id, id))self->_fileRenameDidFail;
  if (fileRenameDidFail)
    fileRenameDidFail[2](fileRenameDidFail, a3);
}

- (void)_fileRenameDidEndWithFinalURL:(id)a3
{
  void (**fileRenameDidEnd)(id, id);

  fileRenameDidEnd = (void (**)(id, id))self->_fileRenameDidEnd;
  if (fileRenameDidEnd)
    fileRenameDidEnd[2](fileRenameDidEnd, a3);
}

+ (BOOL)defaultNavigationItemShouldBeginRenaming:(id)a3 forValidDelegate:(BOOL)a4
{
  return a4;
}

+ (id)defaultNavigationItem:(id)a3 willBeginRenamingWithSuggestedTitle:(id)a4 selectedRange:(_NSRange *)a5
{
  return a4;
}

+ (BOOL)defaultNavigationItem:(id)a3 shouldEndRenamingWithTitle:(id)a4
{
  return 1;
}

@end
