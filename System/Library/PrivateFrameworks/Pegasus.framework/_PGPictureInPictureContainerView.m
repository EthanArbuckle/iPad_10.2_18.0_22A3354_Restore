@implementation _PGPictureInPictureContainerView

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _PGPictureInPictureContainerView *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_PGPictureInPictureContainerView;
  v4 = a3;
  -[_PGPictureInPictureContainerView willMoveToSuperview:](&v9, sel_willMoveToSuperview_, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_vcForDebugging);
  objc_msgSend(WeakRetained, "viewIfLoaded", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[_PGPictureInPictureContainerView willMoveToSuperview:]";
    v12 = 2048;
    v13 = self;
    v14 = 1024;
    v15 = v7;
    _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s %p newSuperview is VC's view: %{BOOL}u", buf, 0x1Cu);
  }

}

- (void)didMoveToSuperview
{
  void *v3;
  id WeakRetained;
  void *v5;
  int v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _PGPictureInPictureContainerView *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_PGPictureInPictureContainerView;
  -[_PGPictureInPictureContainerView didMoveToSuperview](&v8, sel_didMoveToSuperview);
  -[_PGPictureInPictureContainerView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_vcForDebugging);
  objc_msgSend(WeakRetained, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[_PGPictureInPictureContainerView didMoveToSuperview]";
    v11 = 2048;
    v12 = self;
    v13 = 1024;
    v14 = v6;
    _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p newSuperview is VC's view: %{BOOL}u", buf, 0x1Cu);
  }

}

- (PGPictureInPictureViewController)vcForDebugging
{
  return (PGPictureInPictureViewController *)objc_loadWeakRetained((id *)&self->_vcForDebugging);
}

- (void)setVcForDebugging:(id)a3
{
  objc_storeWeak((id *)&self->_vcForDebugging, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_vcForDebugging);
}

@end
