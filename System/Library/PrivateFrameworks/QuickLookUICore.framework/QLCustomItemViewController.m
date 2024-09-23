@implementation QLCustomItemViewController

- (void)dismissPreviewController
{
  id v2;

  -[QLCustomItemViewController hostViewControllerProxy](self, "hostViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissQuickLook");

}

- (void)presentActivityViewControllerFromView:(id)a3
{
  -[QLCustomItemViewController presentActivityViewControllerFromView:withURL:](self, "presentActivityViewControllerFromView:withURL:", a3, 0);
}

- (void)presentActivityViewControllerFromView:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_storeWeak((id *)&self->_shareSheetPresentationView, v6);
  objc_initWeak(&location, self);
  -[QLCustomItemViewController hostViewControllerProxy](self, "hostViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__QLCustomItemViewController_presentActivityViewControllerFromView_withURL___block_invoke;
  v9[3] = &unk_1E9EFC7D8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "presentShareSheetWithPopoverTracker:customSharedURL:dismissCompletion:", self, v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __76__QLCustomItemViewController_presentActivityViewControllerFromView_withURL___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __76__QLCustomItemViewController_presentActivityViewControllerFromView_withURL___block_invoke_2;
  v1[3] = &unk_1E9EFC7D8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  QLRunInMainThread(v1);
  objc_destroyWeak(&v2);
}

void __76__QLCustomItemViewController_presentActivityViewControllerFromView_withURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "didDismissActivityViewController");
    WeakRetained = v2;
  }

}

- (void)setFullScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLCustomItemViewController hostViewControllerProxy](self, "hostViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFullScreen:", v3);

}

- (void)forwardMessageToHost:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  if (v6)
    v7 = v6;
  else
    v7 = &__block_literal_global_2;
  v8 = a3;
  -[QLCustomItemViewController hostViewControllerProxy](self, "hostViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__QLCustomItemViewController_forwardMessageToHost_completionHandler___block_invoke_2;
  v11[3] = &unk_1E9EFC848;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "forwardMessageToHostOfCustomViewController:completionHandler:", v8, v11);

}

void __69__QLCustomItemViewController_forwardMessageToHost_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__QLCustomItemViewController_forwardMessageToHost_completionHandler___block_invoke_3;
  v10[3] = &unk_1E9EFC820;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  QLRunInMainThread(v10);

}

uint64_t __69__QLCustomItemViewController_forwardMessageToHost_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  QLAppearance *v6;
  uint64_t v7;
  QLAppearance *lastAppearance;

  v4 = a4;
  v6 = (QLAppearance *)a3;
  v7 = -[QLAppearance presentationMode](v6, "presentationMode");
  if (v7 != -[QLAppearance presentationMode](self->_lastAppearance, "presentationMode"))
    -[QLCustomItemViewController presentationModeDidChange:animated:](self, "presentationModeDidChange:animated:", -[QLAppearance presentationMode](v6, "presentationMode"), v4);
  lastAppearance = self->_lastAppearance;
  self->_lastAppearance = v6;

}

- (void)getFrameWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__QLCustomItemViewController_getFrameWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E9EFC870;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  QLRunInMainThread(v6);

}

void __58__QLCustomItemViewController_getFrameWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id WeakRetained;

  v3 = (id *)a1;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 992;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  if (WeakRetained)
  {
    v1 = objc_loadWeakRetained((id *)v3[4] + 124);
    objc_msgSend(v1, "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (uint64_t)objc_loadWeakRetained((id *)v3[4] + 124);
    objc_msgSend((id)v5, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v3[4], "view");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertRect:toView:", v3, v11, v13, v15, v17);
  }
  else
  {
    v6.n128_u64[0] = *MEMORY[0x1E0C9D648];
    v7.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
    v8.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
    v9.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  }
  (*(void (**)(uint64_t, __n128, __n128, __n128, __n128))(v4 + 16))(v4, v6, v7, v8, v9);
  if (WeakRetained)
  {

  }
}

- (NSDictionary)previewOptions
{
  return self->_previewOptions;
}

- (void)setPreviewOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)isShareEnabled
{
  return self->_isShareEnabled;
}

- (void)setIsShareEnabled:(BOOL)a3
{
  self->_isShareEnabled = a3;
}

- (UIView)shareSheetPresentationView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_shareSheetPresentationView);
}

- (void)setShareSheetPresentationView:(id)a3
{
  objc_storeWeak((id *)&self->_shareSheetPresentationView, a3);
}

- (QLCustomItemViewControllerHost)hostViewControllerProxy
{
  return (QLCustomItemViewControllerHost *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setHostViewControllerProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewControllerProxy, 0);
  objc_destroyWeak((id *)&self->_shareSheetPresentationView);
  objc_storeStrong((id *)&self->_previewOptions, 0);
  objc_storeStrong((id *)&self->_lastAppearance, 0);
}

@end
