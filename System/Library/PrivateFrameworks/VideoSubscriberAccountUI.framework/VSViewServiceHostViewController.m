@implementation VSViewServiceHostViewController

- (VSViewServiceHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  VSViewServiceHostViewController *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *requestsByID;
  uint64_t v11;
  VSViewControllerFactory *viewControllerFactory;
  VSOptional *v13;
  VSOptional *currentRequest;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  VSRequireMainThread();
  v16.receiver = self;
  v16.super_class = (Class)VSViewServiceHostViewController;
  v8 = -[VSViewServiceHostViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, v7, v6);

  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    requestsByID = v8->_requestsByID;
    v8->_requestsByID = v9;

    +[VSViewControllerFactory sharedFactory](VSViewControllerFactory, "sharedFactory");
    v11 = objc_claimAutoreleasedReturnValue();
    viewControllerFactory = v8->_viewControllerFactory;
    v8->_viewControllerFactory = (VSViewControllerFactory *)v11;

    v13 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    currentRequest = v8->_currentRequest;
    v8->_currentRequest = v13;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSViewServiceHostViewController;
  -[VSViewServiceHostViewController dealloc](&v3, sel_dealloc);
}

- (void)enqueueViewServiceRequest:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Will enque view service request in host view controller: %@", buf, 0xCu);
  }

  -[VSViewServiceHostViewController requestsByID](self, "requestsByID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Request %@ already enqueued."), v7);
  v11 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v9, "setObject:forKey:", v11, v7);

  if (objc_msgSend(v9, "count") == 1)
    -[VSViewServiceHostViewController _connectToViewServiceForRequest:](self, "_connectToViewServiceForRequest:", v7);

}

- (id)_requestForID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDF8C38];
  v5 = a3;
  -[VSViewServiceHostViewController requestsByID](self, "requestsByID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "optionalWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_didCompleteRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Did complete request %@", buf, 0xCu);
  }

  -[VSViewServiceHostViewController requestsByID](self, "requestsByID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if ((v8 & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unrecognized request ID: %@"), v4);
  objc_msgSend(v6, "removeObjectForKey:", v4);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    VSDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Will handle next request: %@", buf, 0xCu);
    }

    -[VSViewServiceHostViewController _connectToViewServiceForRequest:](self, "_connectToViewServiceForRequest:", v10);
  }
  else
  {
    VSDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v12, OS_LOG_TYPE_DEFAULT, "No more requests remain.", buf, 2u);
    }

    v10 = objc_alloc_init(MEMORY[0x24BDF8C38]);
    -[VSViewServiceHostViewController setCurrentRequest:](self, "setCurrentRequest:", v10);
  }

}

- (void)_request:(id)a3 didFinishWithResponse:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[VSViewServiceHostViewController _requestForID:](self, "_requestForID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__VSViewServiceHostViewController__request_didFinishWithResponse___block_invoke;
  v9[3] = &unk_24FE196D8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "conditionallyUnwrapObject:", v9);

}

void __66__VSViewServiceHostViewController__request_didFinishWithResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceHostViewController:request:didFinishWithResponse:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

}

- (void)_request:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[VSViewServiceHostViewController _requestForID:](self, "_requestForID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__VSViewServiceHostViewController__request_didFailWithError___block_invoke;
  v9[3] = &unk_24FE196D8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "conditionallyUnwrapObject:", v9);

}

void __61__VSViewServiceHostViewController__request_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceHostViewController:request:didFailWithError:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

}

- (void)_didCancelRequest:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[VSViewServiceHostViewController _requestForID:](self, "_requestForID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__VSViewServiceHostViewController__didCancelRequest___block_invoke;
  v5[3] = &unk_24FE19700;
  v5[4] = self;
  objc_msgSend(v4, "conditionallyUnwrapObject:", v5);

}

void __53__VSViewServiceHostViewController__didCancelRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceHostViewController:didCancelRequest:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_didChooseAdditionalProvidersForRequest:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[VSViewServiceHostViewController _requestForID:](self, "_requestForID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __75__VSViewServiceHostViewController__didChooseAdditionalProvidersForRequest___block_invoke;
  v5[3] = &unk_24FE19700;
  v5[4] = self;
  objc_msgSend(v4, "conditionallyUnwrapObject:", v5);

}

void __75__VSViewServiceHostViewController__didChooseAdditionalProvidersForRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceHostViewController:didChooseAdditionalProvidersForRequest:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_presentViewServiceHostViewController
{
  id v3;

  -[VSViewServiceHostViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentViewServiceHostViewController:", self);

}

- (void)_dismissViewServiceHostViewController
{
  id v3;

  -[VSViewServiceHostViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewServiceHostViewController:", self);

}

- (BOOL)_shouldAuthenticateAccountProviderWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[VSViewServiceHostViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "viewServiceHostViewController:shouldAuthenticateAccountProviderWithIdentifier:", self, v4);

  return (char)self;
}

- (void)_cancelButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VSViewServiceHostViewController requestsByID](self, "requestsByID", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[VSViewServiceHostViewController _didCancelRequest:](self, "_didCancelRequest:", v11);
        -[VSViewServiceHostViewController _didCompleteRequest:](self, "_didCompleteRequest:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)presentViewServiceRemoteViewController:(id)a3
{
  if (!-[VSViewServiceHostViewController hasRequestedPresentation](self, "hasRequestedPresentation", a3))
  {
    -[VSViewServiceHostViewController setHasRequestedPresentation:](self, "setHasRequestedPresentation:", 1);
    -[VSViewServiceHostViewController _presentViewServiceHostViewController](self, "_presentViewServiceHostViewController");
  }
  -[VSViewServiceHostViewController _addRemoteViewControllerAsChildViewController](self, "_addRemoteViewControllerAsChildViewController");
}

- (void)dismissViewServiceRemoteViewController:(id)a3
{
  if (-[VSViewServiceHostViewController hasRequestedPresentation](self, "hasRequestedPresentation", a3))
  {
    -[VSViewServiceHostViewController setHasRequestedPresentation:](self, "setHasRequestedPresentation:", 0);
    -[VSViewServiceHostViewController _dismissViewServiceHostViewController](self, "_dismissViewServiceHostViewController");
  }
}

- (void)viewServiceRemoteViewController:(id)a3 request:(id)a4 didFinishWithResponse:(id)a5
{
  id v7;

  v7 = a4;
  -[VSViewServiceHostViewController _request:didFinishWithResponse:](self, "_request:didFinishWithResponse:", v7, a5);
  -[VSViewServiceHostViewController _didCompleteRequest:](self, "_didCompleteRequest:", v7);

}

- (void)viewServiceRemoteViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;

  v5 = a4;
  VSErrorLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[VSViewServiceHostViewController viewServiceRemoteViewController:didTerminateWithError:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  -[VSViewServiceHostViewController currentRequest](self, "currentRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = self;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke;
  v16[3] = &unk_24FE19750;
  v16[4] = self;
  v17 = v5;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_11;
  v15[3] = &unk_24FE19778;
  v14 = v5;
  objc_msgSend(v13, "conditionallyUnwrapObject:otherwise:", v16, v15);

}

void __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "hasRequestedPresentation");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "_removeRemoteViewControllerAsChildViewController");
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", 0);
    v16 = MEMORY[0x24BDAC760];
    v17 = *(_QWORD *)(a1 + 32);
    v18 = v3;
    VSPrivateViewServiceCrashedErrorWithRecoveryHandler();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    VSAlertForError(v6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v14, 1, 0, v16, 3221225472, __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_2, &unk_24FE19728, v17);

  }
  else if ((objc_msgSend(v5, "hasRetriedOnce") & 1) != 0)
  {
    VSPublicError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_request:didFailWithError:", v3, v15);
    objc_msgSend(*(id *)(a1 + 32), "_didCompleteRequest:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasRetriedOnce:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_connectToViewServiceForRequest:", v3);
  }

}

uint64_t __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
    return objc_msgSend(v3, "_connectToViewServiceForRequest:", v4);
  objc_msgSend(v3, "_didCancelRequest:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteRequest:", *(_QWORD *)(a1 + 40));
}

uint64_t __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", 0);
}

- (void)viewServiceRemoteViewController:(id)a3 request:(id)a4 didFailWithError:(id)a5
{
  id v7;

  v7 = a4;
  -[VSViewServiceHostViewController _request:didFailWithError:](self, "_request:didFailWithError:", v7, a5);
  -[VSViewServiceHostViewController _didCompleteRequest:](self, "_didCompleteRequest:", v7);

}

- (void)viewServiceRemoteViewController:(id)a3 didChooseAdditionalProvidersForRequest:(id)a4
{
  id v5;

  v5 = a4;
  -[VSViewServiceHostViewController _didChooseAdditionalProvidersForRequest:](self, "_didChooseAdditionalProvidersForRequest:", v5);
  -[VSViewServiceHostViewController _didCompleteRequest:](self, "_didCompleteRequest:", v5);

}

- (void)viewServiceRemoteViewController:(id)a3 didCancelRequest:(id)a4
{
  id v5;

  v5 = a4;
  -[VSViewServiceHostViewController _didCancelRequest:](self, "_didCancelRequest:", v5);
  -[VSViewServiceHostViewController _didCompleteRequest:](self, "_didCompleteRequest:", v5);

}

- (void)viewServiceRemoteViewController:(id)a3 didSelectProviderWithIdentifier:(id)a4 vetoHandler:(id)a5
{
  void (**v7)(id, BOOL);

  v7 = (void (**)(id, BOOL))a5;
  v7[2](v7, -[VSViewServiceHostViewController _shouldAuthenticateAccountProviderWithIdentifier:](self, "_shouldAuthenticateAccountProviderWithIdentifier:", a4));

}

- (void)_connectToViewServiceForRequest:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t v23[16];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Entering %@ for request %@.", buf, 0x16u);

  }
  v8 = (void *)MEMORY[0x24BDF8C38];
  v9 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v8, "optionalWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceHostViewController setCurrentRequest:](self, "setCurrentRequest:", v10);

  -[VSViewServiceHostViewController remoteViewController](self, "remoteViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "serviceViewControllerProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    VSDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_2303C5000, v14, OS_LOG_TYPE_DEFAULT, "Will send request %@ to view service.", buf, 0xCu);
    }

    -[VSViewServiceHostViewController _requestForID:](self, "_requestForID:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "forceUnwrapObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "_performRequest:withIdentifier:", v16, v5);
    VSDefaultLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_2303C5000, v17, OS_LOG_TYPE_DEFAULT, "Did send request %@ to view service.", buf, 0xCu);
    }

  }
  else
  {
    objc_initWeak((id *)buf, self);
    VSDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_2303C5000, v18, OS_LOG_TYPE_DEFAULT, "Will construct remote view controller.", v23, 2u);
    }

    -[VSViewServiceHostViewController viewControllerFactory](self, "viewControllerFactory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __67__VSViewServiceHostViewController__connectToViewServiceForRequest___block_invoke;
    v20[3] = &unk_24FE197A0;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v5;
    objc_msgSend(v19, "viewServiceRemoteViewControllerWithCompletion:", v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __67__VSViewServiceHostViewController__connectToViewServiceForRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      v8 = v5;
      VSDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2303C5000, v9, OS_LOG_TYPE_DEFAULT, "Did construct remote view controller.", v12, 2u);
      }

      objc_msgSend(WeakRetained, "setRemoteViewController:", v8);
      objc_msgSend(v8, "setDelegate:", WeakRetained);

      objc_msgSend(WeakRetained, "_connectToViewServiceForRequest:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      if (!v6)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The errorOrNil parameter must not be nil."));
      v10 = v6;
      VSErrorLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __67__VSViewServiceHostViewController__connectToViewServiceForRequest___block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v10, v11);

      objc_msgSend(WeakRetained, "_request:didFailWithError:", *(_QWORD *)(a1 + 32), v10);
      objc_msgSend(WeakRetained, "_didCompleteRequest:", *(_QWORD *)(a1 + 32));

    }
  }

}

- (void)_removeRemoteViewControllerAsChildViewController
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[VSViewServiceHostViewController remoteViewController](self, "remoteViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VSViewServiceHostViewController childViewControllers](self, "childViewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v6);

    if (v4)
    {
      objc_msgSend(v6, "willMoveToParentViewController:", 0);
      objc_msgSend(v6, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");
      objc_msgSend(v6, "removeFromParentViewController");

    }
  }

}

- (void)_addRemoteViewControllerAsChildViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VSViewServiceHostViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    -[VSViewServiceHostViewController addChildViewController:](self, "addChildViewController:", v3);
    objc_msgSend(v7, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSViewServiceHostViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v4, "setFrame:");

    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[VSViewServiceHostViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:atIndex:", v4, 0);

    objc_msgSend(v7, "didMoveToParentViewController:", self);
    v3 = v7;
  }

}

- (VSViewServiceHostViewControllerDelegate)delegate
{
  return (VSViewServiceHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)requestsByID
{
  return self->_requestsByID;
}

- (void)setRequestsByID:(id)a3
{
  objc_storeStrong((id *)&self->_requestsByID, a3);
}

- (VSOptional)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (VSViewServiceRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (BOOL)hasRetriedOnce
{
  return self->_hasRetriedOnce;
}

- (void)setHasRetriedOnce:(BOOL)a3
{
  self->_hasRetriedOnce = a3;
}

- (BOOL)hasRequestedPresentation
{
  return self->_hasRequestedPresentation;
}

- (void)setHasRequestedPresentation:(BOOL)a3
{
  self->_hasRequestedPresentation = a3;
}

- (VSViewControllerFactory)viewControllerFactory
{
  return self->_viewControllerFactory;
}

- (void)setViewControllerFactory:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerFactory, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requestsByID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewServiceRemoteViewController:(uint64_t)a3 didTerminateWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a2, a3, "View service did terminate with error: %@", a5, a6, a7, a8, 2u);
}

void __89__VSViewServiceHostViewController_viewServiceRemoteViewController_didTerminateWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a2, a3, "Will present alert for termination error: %@", a5, a6, a7, a8, 2u);
}

void __67__VSViewServiceHostViewController__connectToViewServiceForRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_2303C5000, a3, OS_LOG_TYPE_ERROR, "Remote view controller error while displaying %@: %@", (uint8_t *)&v6, 0x16u);

}

@end
