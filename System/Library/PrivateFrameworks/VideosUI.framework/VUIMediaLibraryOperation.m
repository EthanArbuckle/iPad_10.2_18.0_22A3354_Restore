@implementation VUIMediaLibraryOperation

- (void)setAsyncWorkToken:(id)a3
{
  objc_storeStrong((id *)&self->_asyncWorkToken, a3);
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (VUIMediaLibraryOperation)initWithMediaLibrary:(id)a3
{
  id v5;
  VUIMediaLibraryOperation *v6;
  VUIMediaLibraryOperation *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaLibraryOperation;
  v6 = -[VUIMediaLibraryOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (VUIMediaLibraryOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIMediaLibraryOperation;
  -[VUIMediaLibraryOperation cancel](&v4, sel_cancel);
  -[VUIMediaLibraryOperation asyncWorkToken](self, "asyncWorkToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (VUIAsynchronousWorkToken)asyncWorkToken
{
  return self->_asyncWorkToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncWorkToken, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end
