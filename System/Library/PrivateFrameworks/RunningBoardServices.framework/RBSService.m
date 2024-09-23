@implementation RBSService

- (void)didReceiveInheritances:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *calloutQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet unionSet:](self->_inheritances, "unionSet:", v4);
  calloutQueue = self->_calloutQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__RBSService_didReceiveInheritances___block_invoke;
  v8[3] = &unk_1E2D17468;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(calloutQueue, v8);
  os_unfair_lock_unlock(p_lock);

}

- (void)didLoseInheritances:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *calloutQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet minusSet:](self->_inheritances, "minusSet:", v4);
  calloutQueue = self->_calloutQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__RBSService_didLoseInheritances___block_invoke;
  v8[3] = &unk_1E2D17468;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(calloutQueue, v8);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __37__RBSService_didReceiveInheritances___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "service:didReceiveInheritances:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __34__RBSService_didLoseInheritances___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "service:didLoseInheritances:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (_QWORD)_init
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)RBSService;
  v1 = objc_msgSendSuper2(&v10, sel_init);
  v2 = v1;
  if (v1)
  {
    *((_DWORD *)v1 + 4) = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[3];
    v2[3] = v3;

    +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[4];
    v2[4] = v5;

    v7 = +[RBSWorkloop createCalloutQueue:]((uint64_t)RBSWorkloop, CFSTR("com.apple.runningboard.service.callout"));
    v8 = (void *)v2[5];
    v2[5] = v7;

  }
  return v2;
}

- (RBSService)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSService.m"), 52, CFSTR("cannot call -init on RBSService"));

  return 0;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSService.m"), 68, CFSTR("RBSService must not dealloc"));

  v5.receiver = self;
  v5.super_class = (Class)RBSService;
  -[RBSService dealloc](&v5, sel_dealloc);
}

+ (BOOL)saveEndowment:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSService.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endowment"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSService.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSSavedEndowment savedEndowment:withKey:](RBSSavedEndowment, "savedEndowment:withKey:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "saveEndowment:withError:", v13, a5);

  return v14;
}

- (id)inheritances
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_inheritances, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)managedEndpointByLaunchIdentifier
{
  void *v2;
  void *v3;

  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection managedEndpointByLaunchIdentifier]((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
