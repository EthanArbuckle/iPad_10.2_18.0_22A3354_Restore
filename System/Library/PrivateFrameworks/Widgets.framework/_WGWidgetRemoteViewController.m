@implementation _WGWidgetRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F2E030);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F23D08);
}

- (_WGWidgetRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _WGWidgetRemoteViewController *v4;
  char *v5;
  uint64_t v6;
  OS_dispatch_queue *managingHostQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WGWidgetRemoteViewController;
  v4 = -[_WGWidgetRemoteViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (char *)QueueName(CFSTR("com.apple.widgets.managinghostqueue"), 0);
    NewSerialQueue(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    managingHostQueue = v4->_managingHostQueue;
    v4->_managingHostQueue = (OS_dispatch_queue *)v6;

    SuspendQueueIfNecessary(v4->_managingHostQueue);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  InvalidateQueue(self->_managingHostQueue);
  v3.receiver = self;
  v3.super_class = (Class)_WGWidgetRemoteViewController;
  -[_UIRemoteViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)disconnect
{
  objc_super v3;

  self->_valid = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WGWidgetRemoteViewController;
  -[_UIRemoteViewController disconnect](&v3, sel_disconnect);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 0;
}

- (BOOL)_serviceHasScrollToTopView
{
  return 0;
}

- (void)setManagingHost:(id)a3
{
  OS_dispatch_queue *managingHostQueue;

  objc_storeWeak((id *)&self->_managingHost, a3);
  managingHostQueue = self->_managingHostQueue;
  if (a3)
    ResumeQueueIfNecessary(managingHostQueue);
  else
    SuspendQueueIfNecessary(managingHostQueue);
}

- (void)_setActiveDisplayMode:(int64_t)a3
{
  id v4;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__setActiveDisplayMode:", a3);

}

- (void)_setMaximumSize:(CGSize)a3 forDisplayMode:(int64_t)a4
{
  double height;
  double width;
  id v7;

  height = a3.height;
  width = a3.width;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__setMaximumSize:forDisplayMode:", a4, width, height);

}

- (void)_openTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__openTransactionForAppearanceCallWithState:withIdentifier:", v4, v6);

}

- (void)_requestEncodedLayerTreeAtURL:(id)a3 withReplyHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80___WGWidgetRemoteViewController__requestEncodedLayerTreeAtURL_withReplyHandler___block_invoke;
  v11[3] = &unk_24D732E68;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_WGSupportsASTC())
    v10 = CFSTR("com.apple.atx");
  else
    v10 = 0;
  objc_msgSend(v9, "__requestEncodedLayerTreeToURL:withCodingImageFormat:withReplyHandler:", v8, v10, v7);

}

- (void)_performUpdateWithReplyHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_managingHost);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64___WGWidgetRemoteViewController__performUpdateWithReplyHandler___block_invoke;
  v7[3] = &unk_24D732E90;
  v5 = v4;
  v8 = v5;
  objc_copyWeak(&v9, &to);
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__performUpdateWithReplyHandler:", v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&to);

}

- (void)_updateVisibilityState:(int64_t)a3
{
  id v4;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__updateVisibilityState:", a3);

}

- (void)_updateVisibleFrame:(CGRect)a3 withReplyHandler:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id to;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_copyWeak(&to, (id *)&self->_managingHost);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70___WGWidgetRemoteViewController__updateVisibleFrame_withReplyHandler___block_invoke;
  v12[3] = &unk_24D732E90;
  v10 = v9;
  v13 = v10;
  objc_copyWeak(&v14, &to);
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](self, "serviceViewControllerProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__updateVisibleFrame:withReplyHandler:", v10, x, y, width, height);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&to);

}

- (void)_updateLayoutMargins:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  void *v7;
  id v8;
  UIEdgeInsets v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9.top = top;
  v9.left = left;
  v9.bottom = bottom;
  v9.right = right;
  NSStringFromUIEdgeInsets(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__updateLayoutMargins:", v7);

}

- (void)__requestPreferredViewHeight:(double)a3
{
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *managingHostQueue;
  id v11;
  _QWORD v12[4];
  id v13;
  double v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  v6 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(WeakRetained, "widgetIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v16 = v8;
    v17 = 2050;
    v18 = WeakRetained;
    v19 = 2114;
    v20 = v9;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_2172E1000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Client asked to set a preferred height: %.2f",
      buf,
      0x2Au);

  }
  managingHostQueue = self->_managingHostQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62___WGWidgetRemoteViewController___requestPreferredViewHeight___block_invoke;
  v12[3] = &unk_24D731D78;
  v13 = WeakRetained;
  v14 = a3;
  v11 = WeakRetained;
  dispatch_async(managingHostQueue, v12);

}

- (void)__setLargestAvailableDisplayMode:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *managingHostQueue;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  v6 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(WeakRetained, "widgetIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NCStringFromWidgetDisplayMode();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v17 = v8;
    v18 = 2050;
    v19 = WeakRetained;
    v20 = 2114;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_2172E1000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Asked to set largest available display mode to '%{public}@'",
      buf,
      0x2Au);

  }
  managingHostQueue = self->_managingHostQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66___WGWidgetRemoteViewController___setLargestAvailableDisplayMode___block_invoke;
  v13[3] = &unk_24D731D78;
  v14 = WeakRetained;
  v15 = a3;
  v12 = WeakRetained;
  dispatch_async(managingHostQueue, v13);

}

- (void)__closeTransactionForAppearanceCallWithState:(int)a3 withIdentifier:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *managingHostQueue;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  v8 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(WeakRetained, "widgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WGStringForAppearState(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v20 = v10;
    v21 = 2050;
    v22 = WeakRetained;
    v23 = 2114;
    v24 = v11;
    v25 = 2114;
    v26 = v12;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_2172E1000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> Asked to close appearance transaction with state '%{public}@' and "
      "identifier '%{public}@'",
      buf,
      0x34u);

  }
  managingHostQueue = self->_managingHostQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __93___WGWidgetRemoteViewController___closeTransactionForAppearanceCallWithState_withIdentifier___block_invoke;
  v16[3] = &unk_24D731670;
  v17 = WeakRetained;
  v18 = v6;
  v14 = v6;
  v15 = WeakRetained;
  dispatch_async(managingHostQueue, v16);

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *managingHostQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_managingHost);
  objc_initWeak(&location, self);
  managingHostQueue = self->_managingHostQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66___WGWidgetRemoteViewController_viewServiceDidTerminateWithError___block_invoke;
  v9[3] = &unk_24D732EB8;
  v10 = WeakRetained;
  v7 = WeakRetained;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v8 = v4;
  dispatch_async(managingHostQueue, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)managingHostQueue
{
  return self->_managingHostQueue;
}

- (WGWidgetHostingViewController)managingHost
{
  return (WGWidgetHostingViewController *)objc_loadWeakRetained((id *)&self->_managingHost);
}

- (BOOL)_isValid
{
  return self->_valid;
}

- (void)_setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_managingHost);
  objc_storeStrong((id *)&self->_managingHostQueue, 0);
}

@end
