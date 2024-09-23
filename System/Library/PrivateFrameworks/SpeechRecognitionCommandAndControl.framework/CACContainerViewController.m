@implementation CACContainerViewController

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[CACContainerViewController setView:](self, "setView:", v3);

}

- (UIView)viewAboveContainedViews
{
  UIView *viewAboveContainedViews;
  id v4;
  void *v5;
  UIView *v6;
  UIView *v7;
  void *v8;

  viewAboveContainedViews = self->_viewAboveContainedViews;
  if (!viewAboveContainedViews)
  {
    v4 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[CACContainerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_viewAboveContainedViews;
    self->_viewAboveContainedViews = v6;

    -[UIView setAutoresizingMask:](self->_viewAboveContainedViews, "setAutoresizingMask:", 18);
    -[CACContainerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_viewAboveContainedViews);

    viewAboveContainedViews = self->_viewAboveContainedViews;
  }
  return viewAboveContainedViews;
}

- (void)installViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  CACContainerViewController *v43;
  void (**v44)(_QWORD);
  _QWORD v45[4];
  id v46;
  CACContainerViewController *v47;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v50;
  char v51;
  uint64_t v52;

  v6 = a4;
  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[CACContainerViewController viewControllers](self, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v8);

  if (v11)
  {
    CACLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_229A40000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to reinstall view controller that was already installed: %@", (uint8_t *)&buf, 0xCu);
    }

    if (v9)
      v9[2](v9);
  }
  else
  {
    -[CACContainerViewController viewControllers](self, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACContainerViewController setViewControllers:](self, "setViewControllers:", v14);

    }
    -[CACContainerViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v8, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    objc_msgSend(v8, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAutoresizingMask:", 18);

    -[CACContainerViewController addChildViewController:](self, "addChildViewController:", v8);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v50 = 0x2020000000;
    v51 = 0;
    -[CACContainerViewController viewControllers](self, "viewControllers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x24BDAC760];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __72__CACContainerViewController_installViewController_animated_completion___block_invoke;
    v45[3] = &unk_24F2ACF78;
    v28 = v8;
    v46 = v28;
    v47 = self;
    p_buf = &buf;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", v45);

    if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      -[CACContainerViewController viewControllers](self, "viewControllers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v28);

      if (self->_viewAboveContainedViews)
      {
        -[CACContainerViewController view](self, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "insertSubview:belowSubview:", v31, self->_viewAboveContainedViews);
      }
      else
      {
        -[CACContainerViewController view](self, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addSubview:", v31);
      }

    }
    v41[0] = v27;
    v41[1] = 3221225472;
    v41[2] = __72__CACContainerViewController_installViewController_animated_completion___block_invoke_2;
    v41[3] = &unk_24F2AA9E0;
    v32 = v28;
    v42 = v32;
    v43 = self;
    v44 = v9;
    v33 = MEMORY[0x22E2D5D40](v41);
    v34 = (void *)v33;
    if (v6)
    {
      objc_msgSend(v32, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAlpha:", 0.0);

      v36 = (void *)MEMORY[0x24BEBDB00];
      v39[0] = v27;
      v39[1] = 3221225472;
      v39[2] = __72__CACContainerViewController_installViewController_animated_completion___block_invoke_3;
      v39[3] = &unk_24F2AA860;
      v40 = v32;
      v37[0] = v27;
      v37[1] = 3221225472;
      v37[2] = __72__CACContainerViewController_installViewController_animated_completion___block_invoke_4;
      v37[3] = &unk_24F2AC7B0;
      v38 = v34;
      objc_msgSend(v36, "animateWithDuration:animations:completion:", v39, v37, 0.3);

    }
    else
    {
      (*(void (**)(uint64_t))(v33 + 16))(v33);
    }

    _Block_object_dispose(&buf, 8);
  }

}

void __72__CACContainerViewController_installViewController_animated_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = objc_msgSend(v12, "zOrder");
  if (v7 > objc_msgSend(*(id *)(a1 + 32), "zOrder"))
  {
    objc_msgSend(*(id *)(a1 + 40), "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), a3);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertSubview:belowSubview:", v10, v11);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

uint64_t __72__CACContainerViewController_installViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__CACContainerViewController_installViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __72__CACContainerViewController_installViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)uninstallViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(_QWORD);
  BOOL v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  CACLogGeneral();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v8;
    _os_log_impl(&dword_229A40000, v10, OS_LOG_TYPE_INFO, "Uninstalling view controller... %@", buf, 0xCu);
  }

  -[CACContainerViewController viewControllers](self, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    -[CACContainerViewController viewControllers](self, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v8);

    v14 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke;
    v24[3] = &unk_24F2ACFA0;
    v15 = v8;
    v25 = v15;
    v26 = v9;
    v27 = v6;
    v16 = MEMORY[0x22E2D5D40](v24);
    v17 = (void *)v16;
    if (v6)
    {
      v18 = (void *)MEMORY[0x24BEBDB00];
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_3;
      v22[3] = &unk_24F2AA860;
      v23 = v15;
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_4;
      v20[3] = &unk_24F2AC7B0;
      v21 = v17;
      objc_msgSend(v18, "animateWithDuration:animations:completion:", v22, v20, 0.3);

    }
    else
    {
      (*(void (**)(uint64_t))(v16 + 16))(v16);
    }

  }
  else
  {
    CACLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v8;
      _os_log_impl(&dword_229A40000, v19, OS_LOG_TYPE_DEFAULT, "Attempted to uninstall overlay view controller that was not installed: %@", buf, 0xCu);
    }

    if (v9)
      v9[2](v9);
  }

}

void __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_2;
  v7 = &unk_24F2AA990;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v2 = (void (**)(_QWORD))MEMORY[0x22E2D5D40](&v4);
  objc_msgSend(*(id *)(a1 + 32), "presentedViewController", v4, v5, v6, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 48), v2);
  else
    v2[2](v2);

}

uint64_t __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __74__CACContainerViewController_uninstallViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_viewAboveContainedViews, 0);
}

@end
