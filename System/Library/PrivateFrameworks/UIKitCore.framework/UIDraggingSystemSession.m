@implementation UIDraggingSystemSession

- (void)commandeerImmediately
{
  self->_commandeered = 1;
}

- (void)setCommandeered:(BOOL)a3
{
  _BOOL4 commandeered;
  void *v6;
  void *v7;

  commandeered = self->_commandeered;
  if (commandeered != a3)
  {
    -[UIDraggingSystemSession _serverSession](self, "_serverSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (commandeered)
      objc_msgSend(v6, "surrenderDragSession");
    else
      objc_msgSend(v6, "commandeerDragSession");

    self->_commandeered = a3;
  }
}

- (unint64_t)_indexOfDragItemInSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "_dragDropSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v5, "sessionDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sessionIdentifier");

  -[UIDraggingSystemSession info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "sessionIdentifier");

  if (v7 == (_DWORD)v6)
  {
    objc_msgSend(v5, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", v4);

  }
  else
  {
LABEL_4:
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)loadURLForItem:(id)a3 completion:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a4;
  v6 = -[UIDraggingSystemSession _indexOfDragItemInSession:](self, "_indexOfDragItemInSession:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9[2](v9, 0);
  }
  else
  {
    v7 = v6;
    -[UIDraggingSystemSession _serverSession](self, "_serverSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadURLForItemAtIndex:reply:", v7, v9);

  }
}

- (void)loadUserActivityForItem:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a4;
  v7 = -[UIDraggingSystemSession _indexOfDragItemInSession:](self, "_indexOfDragItemInSession:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6[2](v6, 0);
  }
  else
  {
    v8 = v7;
    -[UIDraggingSystemSession _serverSession](self, "_serverSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__UIDraggingSystemSession_loadUserActivityForItem_completion___block_invoke;
    v10[3] = &unk_1E16E7B68;
    v11 = v6;
    objc_msgSend(v9, "loadUserActivityDataForItemAtIndex:reply:", v8, v10);

  }
}

void __62__UIDraggingSystemSession_loadUserActivityForItem_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3B10];
    v4 = a2;
    v5 = (id)objc_msgSend([v3 alloc], "_initWithUserActivityData:", v4);

  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)requestDragContinuationEndpointWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIDraggingSystemSession _serverSession](self, "_serverSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestDragContinuationEndpointWithReply:", v4);

}

- (BOOL)isCommandeered
{
  return self->_commandeered;
}

- (UIDraggingSystemSessionInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (UIDraggingSystemTouchRoutingPolicy)routingPolicy
{
  return self->_routingPolicy;
}

- (void)setRoutingPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_routingPolicy, a3);
}

- (_DUIServerSessionSystemApp)_serverSession
{
  return self->_serverSession;
}

- (void)setServerSession:(id)a3
{
  objc_storeStrong((id *)&self->_serverSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSession, 0);
  objc_storeStrong((id *)&self->_routingPolicy, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
