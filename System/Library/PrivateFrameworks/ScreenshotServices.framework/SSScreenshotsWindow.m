@implementation SSScreenshotsWindow

- (void)activeInterfaceOrientationObserver:(id)a3 observedChangeToInterfaceOrientation:(int64_t)a4 withDuration:(double)a5
{
  void *v8;

  -[SSScreenshotsWindow _hostViewControllerIfExists](self, "_hostViewControllerIfExists", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[SSScreenshotsWindow _setRotatableViewOrientation:duration:](self, "_setRotatableViewOrientation:duration:", a4, a5);
  self->_lastActiveInterfaceOrientation = a4;
}

- (id)_hostViewControllerIfExists
{
  void *v2;
  id v3;

  -[SSScreenshotsWindowRootViewController managedViewController](self->_root, "managedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (SSScreenshotsWindow)init
{
  SSScreenshotsWindow *v2;
  void *v3;
  void *v4;
  SSScreenshotsWindowRootViewController *v5;
  SSScreenshotsWindowRootViewController *root;
  SSActiveInterfaceOrientationObserver *v7;
  SSActiveInterfaceOrientationObserver *activeInterfaceOrientationObserver;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *notifyQueue;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SSScreenshotsWindow;
  v2 = -[SSScreenshotsWindow init](&v21, sel_init);
  -[SSScreenshotsWindow setHidden:](v2, "setHidden:", 0);
  -[SSScreenshotsWindow layer](v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisableUpdateMask:", 2);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenshotsWindow setBackgroundColor:](v2, "setBackgroundColor:", v4);

  -[SSScreenshotsWindow setWindowLevel:](v2, "setWindowLevel:", *MEMORY[0x24BDF7D70]);
  -[SSScreenshotsWindow _setWindowControlsStatusBarOrientation:](v2, "_setWindowControlsStatusBarOrientation:", 0);
  v5 = objc_alloc_init(SSScreenshotsWindowRootViewController);
  root = v2->_root;
  v2->_root = v5;

  -[SSScreenshotsWindow setRootViewController:](v2, "setRootViewController:", v2->_root);
  v7 = objc_alloc_init(SSActiveInterfaceOrientationObserver);
  activeInterfaceOrientationObserver = v2->_activeInterfaceOrientationObserver;
  v2->_activeInterfaceOrientationObserver = v7;

  -[SSActiveInterfaceOrientationObserver setDelegate:](v2->_activeInterfaceOrientationObserver, "setDelegate:", v2);
  -[SSActiveInterfaceOrientationObserver beginObserving](v2->_activeInterfaceOrientationObserver, "beginObserving");
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("com.apple.screenshotservices.notifyqueue", v9);
  notifyQueue = v2->_notifyQueue;
  v2->_notifyQueue = (OS_dispatch_queue *)v10;

  objc_initWeak(&location, v2);
  v12 = v2->_notifyQueue;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __27__SSScreenshotsWindow_init__block_invoke;
  v18 = &unk_24D06BDE0;
  objc_copyWeak(&v19, &location);
  dispatch_async(v12, &v15);
  objc_msgSend(MEMORY[0x24BDF6950], "purpleColor", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSApplyDebuggingCustomizationsToViewIfAppropriate(v2, v13, 10.0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v2;
}

void __27__SSScreenshotsWindow_init__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  const char **v4;
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  int *v8;
  NSObject *v9;
  _QWORD v10[4];
  int *v11;
  id v12;
  _QWORD handler[4];
  int *v14;
  id v15;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (const char **)MEMORY[0x24BEB0ED0];
    *((_DWORD *)WeakRetained + 234) = -1;
    v5 = *v4;
    v6 = WeakRetained[116];
    v7 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __27__SSScreenshotsWindow_init__block_invoke_2;
    handler[3] = &unk_24D06BDB8;
    v8 = WeakRetained;
    v14 = v8;
    objc_copyWeak(&v15, v1);
    notify_register_dispatch(v5, (int *)v3 + 234, v6, handler);
    v8[235] = -1;
    v9 = v3[116];
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __27__SSScreenshotsWindow_init__block_invoke_4;
    v10[3] = &unk_24D06BDB8;
    v11 = v8;
    objc_copyWeak(&v12, v1);
    notify_register_dispatch("com.apple.backboardd.backlight.changed", v8 + 235, v9, v10);
    objc_destroyWeak(&v12);

    objc_destroyWeak(&v15);
  }

}

void __27__SSScreenshotsWindow_init__block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v3[2];
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 936), &state64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__SSScreenshotsWindow_init__block_invoke_3;
  block[3] = &unk_24D06BD90;
  objc_copyWeak(v3, (id *)(a1 + 40));
  v3[1] = (id)state64;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v3);
}

void __27__SSScreenshotsWindow_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deviceLockStateChanged:", *(_QWORD *)(a1 + 40));

}

void __27__SSScreenshotsWindow_init__block_invoke_4(uint64_t a1)
{
  _QWORD block[4];
  id v3[2];
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 940), &state64);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__SSScreenshotsWindow_init__block_invoke_5;
  block[3] = &unk_24D06BD90;
  objc_copyWeak(v3, (id *)(a1 + 40));
  v3[1] = (id)state64;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v3);
}

void __27__SSScreenshotsWindow_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deviceBacklightChanged:", *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  NSObject *notifyQueue;
  objc_super v4;
  _QWORD block[5];

  notifyQueue = self->_notifyQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SSScreenshotsWindow_dealloc__block_invoke;
  block[3] = &unk_24D06BE08;
  block[4] = self;
  dispatch_sync(notifyQueue, block);
  -[SSActiveInterfaceOrientationObserver stopObserving](self->_activeInterfaceOrientationObserver, "stopObserving");
  v4.receiver = self;
  v4.super_class = (Class)SSScreenshotsWindow;
  -[SSScreenshotsWindow dealloc](&v4, sel_dealloc);
}

uint64_t __30__SSScreenshotsWindow_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 936);
  if (v3 != -1)
  {
    notify_cancel(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(unsigned int *)(v2 + 940);
  if ((_DWORD)result != -1)
    return notify_cancel(result);
  return result;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (void)activateRemoteViewControllerIfAppropriate
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[SSScreenshotsWindowRootViewController managedViewController](self->_root, "managedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SSScreenshotsWindow delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screenshotWindowWillBeDisplayed");

    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __64__SSScreenshotsWindow_activateRemoteViewControllerIfAppropriate__block_invoke;
    v5[3] = &unk_24D06BE30;
    v5[4] = self;
    -[SSScreenshotsWindow _prepareRemoteViewControllerWithCompletionHandler:](self, "_prepareRemoteViewControllerWithCompletionHandler:", v5);
  }
}

uint64_t __64__SSScreenshotsWindow_activateRemoteViewControllerIfAppropriate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "setManagedViewController:", a2);
}

- (void)_prepareRemoteViewControllerWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213892000, v5, OS_LOG_TYPE_INFO, "Preparing remote view controller", buf, 2u);
  }

  -[SSScreenshotsWindow _setRotatableViewOrientation:duration:force:](self, "_setRotatableViewOrientation:duration:force:", self->_lastActiveInterfaceOrientation, 1, 0.0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke;
  v8[3] = &unk_24D06BE58;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SSDittoHostViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("SSSDittoRemoteViewController"), CFSTR("com.apple.ScreenshotServicesService"), v8);

}

void __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke_cold_1(v6, v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v9, "setDelegate:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_dismiss
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[SSScreenshotsWindow _hostViewControllerIfExists](self, "_hostViewControllerIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[SSScreenshotsWindow _hostViewControllerIfExists](self, "_hostViewControllerIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "disconnect");

  -[SSScreenshotsWindowRootViewController setManagedViewController:](self->_root, "setManagedViewController:", 0);
  -[SSScreenshotsWindow delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenshotWindowWasDismissed");

}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 0;
}

- (void)_deviceLockStateChanged:(unint64_t)a3
{
  id v3;

  if (a3 == 1)
  {
    -[SSScreenshotsWindow _hostViewControllerIfExists](self, "_hostViewControllerIfExists");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissScreenshotExperience");

  }
}

- (void)_deviceBacklightChanged:(unint64_t)a3
{
  id v3;

  if (!a3)
  {
    -[SSScreenshotsWindow _hostViewControllerIfExists](self, "_hostViewControllerIfExists");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissScreenshotExperience");

  }
}

- (SSScreenshotsWindowDelegate)delegate
{
  return (SSScreenshotsWindowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_activeInterfaceOrientationObserver, 0);
}

void __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_213892000, a2, OS_LOG_TYPE_ERROR, "Couldn't prepare remote view controller, %@", (uint8_t *)&v4, 0xCu);

}

@end
