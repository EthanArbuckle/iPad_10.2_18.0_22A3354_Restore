@implementation UIPrintingProgressViewController

- (UIPrintingProgressViewController)initWithTitle:(id)a3 message:(id)a4 printingProgress:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIPrintingProgressViewController *v11;
  UIPrintingProgressViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  UIWindow *window;
  uint64_t v21;
  UINavigationController *navController;
  UIPrintingMessageView *v23;
  void *v24;
  uint64_t v25;
  UIPrintingMessageView *messageView;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)UIPrintingProgressViewController;
  v11 = -[UIPrintingProgressViewController initWithStyle:](&v28, sel_initWithStyle_, 1);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_printingProgress, v10);
    -[UIPrintingProgressViewController setDonePrinting:](v12, "setDonePrinting:", 0);
    -[UIPrintingProgressViewController view](v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBounces:", 0);

    objc_msgSend(v10, "hostingWindowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_findUISceneForLegacyInterfaceOrientation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHostingWindowScene:", v16);

    }
    v17 = objc_alloc(MEMORY[0x1E0DC3F98]);
    objc_msgSend(v10, "hostingWindowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithWindowScene:", v18);
    window = v12->_window;
    v12->_window = (UIWindow *)v19;

    -[UIWindow setWindowLevel:](v12->_window, "setWindowLevel:", *MEMORY[0x1E0DC5638] + -6.0);
    -[UIWindow setHidden:](v12->_window, "setHidden:", 1);
    -[UIWindow _setRoleHint:](v12->_window, "_setRoleHint:", *MEMORY[0x1E0DC5B00]);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v12);
    navController = v12->_navController;
    v12->_navController = (UINavigationController *)v21;

    -[UIWindow setRootViewController:](v12->_window, "setRootViewController:", v12->_navController);
    v23 = [UIPrintingMessageView alloc];
    -[UIPrintingProgressViewController view](v12, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[UIPrintingMessageView initInView:title:](v23, "initInView:title:", v24, v8);
    messageView = v12->_messageView;
    v12->_messageView = (UIPrintingMessageView *)v25;

    -[UIPrintingMessageView setMessage:](v12->_messageView, "setMessage:", v9);
    -[UIPrintingMessageView setHidden:](v12->_messageView, "setHidden:", 0);
  }

  return v12;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  UIWindow *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6)
    return 1;
  if (a3 == 2)
    return 0;
  v7 = 1;
  objc_msgSend(MEMORY[0x1E0DC3F98], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(UIWindow **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v13 != self->_window
          && !-[UIWindow _shouldAutorotateToInterfaceOrientation:](v13, "_shouldAutorotateToInterfaceOrientation:", a3, (_QWORD)v15))
        {
          v7 = 0;
          goto LABEL_16;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 30;
  objc_msgSend(MEMORY[0x1E0DC3F98], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    v4 = 26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v4 &= objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_supportedInterfaceOrientationsForRootViewController");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  else
  {
    v4 = 26;
  }

  return v4;
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  self->_rotationDelay = a4;
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  self->_rotationDelay = 0.0;
}

- (void)doneProgress
{
  objc_msgSend(objc_loadWeakRetained((id *)&self->_printingProgress), "hideProgressAnimated:", 1);
}

- (void)cancelProgress
{
  objc_msgSend(objc_loadWeakRetained((id *)&self->_printingProgress), "progressCancel");
  -[UIPrintingProgressViewController doneProgress](self, "doneProgress");
}

- (void)setMessage:(id)a3
{
  -[UIPrintingMessageView setMessage:](self->_messageView, "setMessage:", a3);
}

- (void)setDonePrinting:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  char **v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v6 = &selRef_doneProgress;
  if (!v3)
    v6 = &selRef_cancelProgress;
  v8 = (id)objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", !v3, self, *v6);
  -[UIPrintingProgressViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v8);

}

- (void)show
{
  -[UIWindow setHidden:](self->_window, "setHidden:", 0);
}

- (void)cleanupAfterDismiss
{
  UIPrintingProgressViewController *v2;
  UIWindow *window;
  UINavigationController *navController;

  v2 = objc_retainAutorelease(self);
  -[UIWindow setHidden:](v2->_window, "setHidden:", 1);
  window = v2->_window;
  v2->_window = 0;

  navController = v2->_navController;
  v2->_navController = 0;

}

- (void)dismissAnimated:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double Width;
  double Height;
  _QWORD v20[5];
  _QWORD v21[11];

  if (!a3)
  {
    -[UIPrintingProgressViewController cleanupAfterDismiss](self, "cleanupAfterDismiss");
    return;
  }
  -[UIWindow frame](self->_window, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIWindow windowScene](self->_window, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "interfaceOrientation");

  v14 = v5;
  v15 = v7;
  v16 = v9;
  v17 = v11;
  if (v13 == 2)
  {
    Height = -CGRectGetHeight(*(CGRect *)&v14);
LABEL_11:
    Width = 0.0;
    goto LABEL_12;
  }
  if (v13 == 3)
  {
    Width = -CGRectGetWidth(*(CGRect *)&v14);
    goto LABEL_9;
  }
  if (v13 != 4)
  {
    Height = CGRectGetHeight(*(CGRect *)&v14);
    goto LABEL_11;
  }
  Width = CGRectGetWidth(*(CGRect *)&v14);
LABEL_9:
  Height = 0.0;
LABEL_12:
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__UIPrintingProgressViewController_dismissAnimated___block_invoke;
  v21[3] = &unk_1E9D97308;
  v21[4] = self;
  v21[5] = v5;
  v21[6] = v7;
  v21[7] = v9;
  v21[8] = v11;
  *(double *)&v21[9] = Width;
  *(double *)&v21[10] = Height;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__UIPrintingProgressViewController_dismissAnimated___block_invoke_2;
  v20[3] = &unk_1E9D97330;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v21, v20, 0.3);
}

uint64_t __52__UIPrintingProgressViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  CGRect v3;

  v3 = CGRectOffset(*(CGRect *)(a1 + 40), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setFrame:", v3.origin.x, v3.origin.y, v3.size.width, v3.size.height);
}

uint64_t __52__UIPrintingProgressViewController_dismissAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupAfterDismiss");
}

- (BOOL)visible
{
  return -[UIWindow isHidden](self->_window, "isHidden") ^ 1;
}

- (double)rotationDelay
{
  return self->_rotationDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_destroyWeak((id *)&self->_printingProgress);
}

@end
