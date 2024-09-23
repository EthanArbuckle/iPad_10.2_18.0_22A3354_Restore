@implementation REMReminderServiceViewController

- (void)viewDidLoad
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_20D753000, v0, v1, "Loading extension %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __47__REMReminderServiceViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  __int128 v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE7D208], "ui");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __47__REMReminderServiceViewController_viewDidLoad__block_invoke_cold_2();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE7D208], "ui");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __47__REMReminderServiceViewController_viewDidLoad__block_invoke_cold_1(a1, (uint64_t)v7, v9);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "endDelayingDisplayOfRemoteController");
    objc_msgSend(*(id *)(a1 + 32), "setDeferredErrorDuringPresentation:", v7);
  }
  else
  {
    objc_msgSend(v6, "setPublicViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "serviceViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __47__REMReminderServiceViewController_viewDidLoad__block_invoke_3;
    v11[3] = &unk_24C79E268;
    v12 = *(_OWORD *)(a1 + 32);
    objc_msgSend((id)v12, "remoteViewControllerDidLoad:setupCompletion:", v10, v11);

  }
}

void __47__REMReminderServiceViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, double a3, double a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_presentationSemanticContext");

  if (v8 != 3)
    objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", a3, a4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "endDelayingDisplayOfRemoteController");
  v9 = v10;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeferredErrorDuringPresentation:", v10);
    v9 = v10;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMReminderServiceViewController;
  -[REMReminderServiceViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[REMReminderServiceViewController deferredErrorDuringPresentation](self, "deferredErrorDuringPresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[REMReminderServiceViewController deferredErrorDuringPresentation](self, "deferredErrorDuringPresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderServiceViewController setDeferredErrorDuringPresentation:](self, "setDeferredErrorDuringPresentation:", 0);
    objc_msgSend(MEMORY[0x24BE7D208], "ui");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REMReminderServiceViewController viewDidAppear:].cold.1();

    -[REMReminderServiceViewController viewServiceDidFailWithError:](self, "viewServiceDidFailWithError:", v5);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMReminderServiceViewController;
  -[REMReminderServiceViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BE7D208], "ui");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[REMReminderServiceViewController viewDidDisappear:].cold.1(v4);

  -[REMReminderServiceViewController remoteViewController](self, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewHostDidDismiss");

}

- (void)setChildViewController:(id)a3
{
  _UIResilientRemoteViewContainerViewController *v4;
  _UIResilientRemoteViewContainerViewController *childViewController;
  _UIResilientRemoteViewContainerViewController *v6;
  void *v7;
  REMReminderServiceViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  REMReminderServiceViewController *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v4 = (_UIResilientRemoteViewContainerViewController *)a3;
  if (self->_childViewController)
  {
    objc_msgSend(MEMORY[0x24BE7D208], "ui");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[REMReminderServiceViewController setChildViewController:].cold.1(v17);

  }
  childViewController = self->_childViewController;
  self->_childViewController = v4;
  v6 = v4;

  -[REMReminderServiceViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIResilientRemoteViewContainerViewController view](v6, "view");
  v8 = self;
  v25 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIResilientRemoteViewContainerViewController beginAppearanceTransition:animated:](v6, "beginAppearanceTransition:animated:", 1, 0);
  -[REMReminderServiceViewController addChildViewController:](v8, "addChildViewController:", v6);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "addSubview:", v9);
  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v9, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  objc_msgSend(v9, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v12;
  objc_msgSend(v9, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v16);

  -[_UIResilientRemoteViewContainerViewController didMoveToParentViewController:](v6, "didMoveToParentViewController:", v25);
  -[_UIResilientRemoteViewContainerViewController endAppearanceTransition](v6, "endAppearanceTransition");

}

- (REMReminderCreationViewServiceViewController)viewServiceViewController
{
  void *v2;
  void *v3;

  -[REMReminderServiceViewController remoteViewController](self, "remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewServiceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMReminderCreationViewServiceViewController *)v3;
}

- (REMReminderCreationRemoteViewController)remoteViewController
{
  return (REMReminderCreationRemoteViewController *)-[_UIResilientRemoteViewContainerViewController remoteViewController](self->_childViewController, "remoteViewController");
}

- (_UIResilientRemoteViewContainerViewController)childViewController
{
  return self->_childViewController;
}

- (NSError)deferredErrorDuringPresentation
{
  return self->_deferredErrorDuringPresentation;
}

- (void)setDeferredErrorDuringPresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredErrorDuringPresentation, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

void __47__REMReminderServiceViewController_viewDidLoad__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  id v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  v8 = 2112;
  v9 = a2;
  v6 = v5;
  _os_log_error_impl(&dword_20D753000, a3, OS_LOG_TYPE_ERROR, "Remote view controller error while displaying %@: %@", v7, 0x16u);

}

void __47__REMReminderServiceViewController_viewDidLoad__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_20D753000, v0, v1, "_UIResilientRemoteViewContainerViewController initialized (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)viewDidAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_20D753000, v0, v1, "REMReminderServiceViewController: encountered error during presentation {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)viewDidDisappear:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D753000, log, OS_LOG_TYPE_DEBUG, "-[REMReminderServiceViewController viewDidDisappear]", v1, 2u);
}

- (void)setChildViewController:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[REMReminderServiceViewController setChildViewController:]";
  _os_log_fault_impl(&dword_20D753000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (_childViewController != nil) -- %s: remote view controller can only be set once", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
