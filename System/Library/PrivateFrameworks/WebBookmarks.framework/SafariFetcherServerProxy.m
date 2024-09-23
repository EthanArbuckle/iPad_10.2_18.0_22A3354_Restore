@implementation SafariFetcherServerProxy

- (SafariFetcherServerProxy)init
{
  void *v3;
  int v4;
  WebBookmarksXPCConnection *v5;
  WebBookmarksXPCConnection *v6;
  WebBookmarksXPCConnection *connection;
  WebBookmarksXPCConnection *v8;
  uint64_t v9;
  WebBookmarksXPCConnection *v10;
  WebBookmarksXPCConnection *v11;
  WebBookmarksXPCConnection *v12;
  SafariFetcherServerProxy *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  +[WBFeatureManager sharedFeatureManager](WBFeatureManager, "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOfflineReadingListAvailable");

  if (v4
    && (v24.receiver = self,
        v24.super_class = (Class)SafariFetcherServerProxy,
        (self = -[SafariFetcherServerProxy init](&v24, sel_init)) != 0))
  {
    objc_initWeak(&location, self);
    v5 = [WebBookmarksXPCConnection alloc];
    v6 = -[WebBookmarksXPCConnection initClientForMachService:](v5, "initClientForMachService:", kSafariFetcherDServiceName);
    connection = self->_connection;
    self->_connection = v6;

    -[WebBookmarksXPCConnection setDelegate:](self->_connection, "setDelegate:", self);
    v8 = self->_connection;
    v9 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __32__SafariFetcherServerProxy_init__block_invoke;
    v21[3] = &unk_24CB347B8;
    objc_copyWeak(&v22, &location);
    -[WebBookmarksXPCConnection setHandler:forMessageNamed:](v8, "setHandler:forMessageNamed:", v21, kSafariFetcherDidFinishFetchingMessageName);
    v10 = self->_connection;
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __32__SafariFetcherServerProxy_init__block_invoke_2;
    v19[3] = &unk_24CB347B8;
    objc_copyWeak(&v20, &location);
    -[WebBookmarksXPCConnection setHandler:forMessageNamed:](v10, "setHandler:forMessageNamed:", v19, kSafariFetcherDidUpdateProgressMessageName);
    v11 = self->_connection;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __32__SafariFetcherServerProxy_init__block_invoke_3;
    v17[3] = &unk_24CB347B8;
    objc_copyWeak(&v18, &location);
    -[WebBookmarksXPCConnection setHandler:forMessageNamed:](v11, "setHandler:forMessageNamed:", v17, kSafariFetcherDidStartFetchingItemMessageName);
    v12 = self->_connection;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __32__SafariFetcherServerProxy_init__block_invoke_4;
    v15[3] = &unk_24CB347B8;
    objc_copyWeak(&v16, &location);
    -[WebBookmarksXPCConnection setHandler:forMessageNamed:](v12, "setHandler:forMessageNamed:", v15, kSafariFetcherDidStopFetchingItemMessageName);
    self = self;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __32__SafariFetcherServerProxy_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didFinishFetching");

}

void __32__SafariFetcherServerProxy_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "didUpdateProgressWithMessage:", v4);

}

void __32__SafariFetcherServerProxy_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "didStartFetchingReadingListItemWithMessage:", v4);

}

void __32__SafariFetcherServerProxy_init__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "didStopFetchingReadingListItemWithMessage:", v4);

}

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  id WeakRetained;
  WebBookmarksXPCConnection *connection;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    connection = self->_connection;
    -[WebBookmarksXPCConnection messageWithName:](connection, "messageWithName:", kSafariFetcherRegisterForReadingListFetcherUpdatesMessageName);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WebBookmarksXPCConnection sendMessage:](connection, "sendMessage:", v7);

  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  char **v5;
  void *v6;

  v4 = objc_storeWeak((id *)&self->_delegate, a3);
  v5 = &kSafariFetcherUnregisterForReadingListFetcherUpdatesMessageName;
  if (a3)
    v5 = &kSafariFetcherRegisterForReadingListFetcherUpdatesMessageName;
  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v6);

}

- (void)startReadingListFetcher
{
  id v3;

  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kSafariFetcherStartReadingListFetcherMessageName);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v3);

}

- (void)clearAllReadingListArchives
{
  id v3;

  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kSafariFetcherClearAllReadingListArchivesMessageName);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v3);

}

- (void)clearReadingListArchiveWithUUID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kSafariFetcherClearReadingListArchiveMessageName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_string(v4, kWebBookmarksUUIDKey, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v4);

  }
}

- (void)didStartFetchingReadingListItemWithMessage:(id)a3
{
  id WeakRetained;
  char v5;
  void *v6;
  id v7;
  xpc_object_t xdict;

  xdict = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(xdict, kWebBookmarksUUIDKey));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "bookmarksServerProxy:didStartFetchingReadingListItem:", self, v6);

  }
}

- (void)didStopFetchingReadingListItemWithMessage:(id)a3
{
  id WeakRetained;
  char v5;
  void *v6;
  id v7;
  xpc_object_t xdict;

  xdict = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(xdict, kWebBookmarksUUIDKey));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "bookmarksServerProxy:didStopFetchingReadingListItem:", self, v6);

  }
}

- (void)didUpdateProgressWithMessage:(id)a3
{
  id WeakRetained;
  char v5;
  double v6;
  id v7;
  xpc_object_t xdict;

  xdict = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = xpc_dictionary_get_double(xdict, kWebBookmarksProgressKey);
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "bookmarksServerProxy:didUpdateReadingListFetchingProgress:", self, v6);

  }
}

- (void)didFinishFetching
{
  WebBookmarksClientDelegateProtocol **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "bookmarksServerProxyDidFinishFetching:", self);

  }
}

- (WebBookmarksClientDelegateProtocol)delegate
{
  return (WebBookmarksClientDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
