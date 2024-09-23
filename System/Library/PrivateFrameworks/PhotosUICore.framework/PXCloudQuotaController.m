@implementation PXCloudQuotaController

- (PXCloudQuotaController)init
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  PXCloudQuotaController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("Only subclasses can be instanciated %@"), v7);

  }
  PLUserStatusGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v4;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> init", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)PXCloudQuotaController;
  return -[PXCloudQuotaController init](&v10, sel_init);
}

- (void)setInformationView:(id)a3
{
  UIView *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  UIView *informationView;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  PXCloudQuotaController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  UIView *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  if (self->_informationView != v5)
  {
    objc_storeStrong((id *)&self->_informationView, a3);
    -[PXCloudQuotaController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLUserStatusGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      v10 = (void *)objc_opt_class();
      v11 = v10;
      v12 = (void *)objc_opt_class();
      informationView = self->_informationView;
      v15 = 138544642;
      v16 = v8;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = v10;
      v21 = 2048;
      v22 = v6;
      v23 = 2114;
      v24 = v12;
      v25 = 2048;
      v26 = informationView;
      v14 = v12;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> delegate:<%{public}@:%p>, informationViewDidChange:<%{public}@:%p>", (uint8_t *)&v15, 0x3Eu);

    }
    objc_msgSend(v6, "cloudQuotaController:informationViewDidChange:", self, self->_informationView);

  }
}

- (id)presentingViewControllerForInformationView
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  int v12;
  void *v13;
  __int16 v14;
  PXCloudQuotaController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PXCloudQuotaController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForCloudQuotaController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLUserStatusGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    v12 = 138544642;
    v13 = v6;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 2048;
    v19 = v3;
    v20 = 2114;
    v21 = (id)objc_opt_class();
    v22 = 2048;
    v23 = v4;
    v10 = v21;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> delegate:<%{public}@:%p>, presenting view controller:<%{public}@:%p>", (uint8_t *)&v12, 0x3Eu);

  }
  return v4;
}

- (UIView)informationView
{
  return self->_informationView;
}

- (PXCloudQuotaControllerDelegate)delegate
{
  return (PXCloudQuotaControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_informationView, 0);
}

@end
