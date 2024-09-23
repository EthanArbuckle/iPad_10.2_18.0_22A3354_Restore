@implementation ICUIApplicationShim

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

void __37__ICUIApplicationShim_sharedInstance__block_invoke()
{
  ICUIApplicationShim *v0;
  void *v1;

  v0 = objc_alloc_init(ICUIApplicationShim);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

+ (ICUIApplicationShim)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_20);
  return (ICUIApplicationShim *)(id)sharedInstance_sharedInstance;
}

- (UIWindow)keyWindow
{
  void *v2;
  void *v3;

  -[ICUIApplicationShim delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v3;
}

- (BOOL)isSecureScreenShowing
{
  void *v2;
  char v3;

  -[ICUIApplicationShim delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSecureScreenShowing");

  return v3;
}

- (BOOL)isQuickNoteSessionActive
{
  void *v2;
  char v3;

  -[ICUIApplicationShim delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isQuickNoteSessionActive");

  return v3;
}

- (ICUIApplicationShimDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
