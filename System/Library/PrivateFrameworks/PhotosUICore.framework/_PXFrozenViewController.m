@implementation _PXFrozenViewController

- (_PXFrozenViewController)initWithSnapshotView:(id)a3
{
  id v5;
  _PXFrozenViewController *v6;
  _PXFrozenViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXFrozenViewController;
  v6 = -[_PXFrozenViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_snapshotView, a3);

  return v7;
}

- (void)unfreezeAnimated:(BOOL)a3
{
  UIView *snapshotView;
  _BOOL4 v4;
  UIView *v6;
  NSObject *v7;
  UIView *v8;
  double v9;
  void *v10;
  uint64_t v11;
  UIView *v12;
  _QWORD v13[4];
  UIView *v14;
  _QWORD v15[4];
  UIView *v16;
  uint8_t buf[4];
  UIView *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  snapshotView = self->_snapshotView;
  if (snapshotView)
  {
    v4 = a3;
    v6 = snapshotView;
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "Unfreezing snapshot: %p", buf, 0xCu);
    }

    v8 = self->_snapshotView;
    self->_snapshotView = 0;

    if (v4)
      v9 = 0.3;
    else
      v9 = 0.0;
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44___PXFrozenViewController_unfreezeAnimated___block_invoke;
    v15[3] = &unk_1E5149198;
    v16 = v6;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __44___PXFrozenViewController_unfreezeAnimated___block_invoke_2;
    v13[3] = &unk_1E5147360;
    v14 = v16;
    v12 = v16;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v15, v13, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end
