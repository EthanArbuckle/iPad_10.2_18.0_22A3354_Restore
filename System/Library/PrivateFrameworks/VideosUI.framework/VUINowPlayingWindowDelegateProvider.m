@implementation VUINowPlayingWindowDelegateProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_31 != -1)
    dispatch_once(&sharedInstance_onceToken_31, &__block_literal_global_136);
  return (id)sharedInstance___sharedInstance_4;
}

void __53__VUINowPlayingWindowDelegateProvider_sharedInstance__block_invoke()
{
  VUINowPlayingWindowDelegateProvider *v0;
  void *v1;

  v0 = objc_alloc_init(VUINowPlayingWindowDelegateProvider);
  v1 = (void *)sharedInstance___sharedInstance_4;
  sharedInstance___sharedInstance_4 = (uint64_t)v0;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldNowPlayingWindowDismiss
{
  void *v2;
  void *v3;
  char v4;

  -[VUINowPlayingWindowDelegateProvider delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "shouldNowPlayingWindowDismiss");
  else
    v4 = 1;

  return v4;
}

- (VUINowPlayingWindowDelegate)delegate
{
  return (VUINowPlayingWindowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
