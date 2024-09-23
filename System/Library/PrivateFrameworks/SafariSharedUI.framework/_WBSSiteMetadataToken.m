@implementation _WBSSiteMetadataToken

- (void)dispatchResponse:(id)a3
{
  _BOOL4 cancelled;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v7;
  id v8;
  _QWORD block[5];

  v8 = a3;
  os_unfair_lock_lock(&self->_cancelledLock);
  cancelled = self->_cancelled;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D45E4](self->_responseHandler);
  os_unfair_lock_unlock(&self->_cancelledLock);
  if (!cancelled && v5 != 0)
  {
    -[WBSSiteMetadataRequest activity](self->_request, "activity");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42___WBSSiteMetadataToken_dispatchResponse___block_invoke;
    block[3] = &unk_1E5441CB8;
    block[4] = self;
    os_activity_apply(v7, block);

    ((void (**)(_QWORD, id))v5)[2](v5, v8);
  }

}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (_WBSSiteMetadataToken)initWithRequest:(id)a3 isOneTimeRequest:(BOOL)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  _WBSSiteMetadataToken *v14;
  _WBSSiteMetadataToken *v15;
  uint64_t v16;
  id responseHandler;
  _WBSSiteMetadataToken *v18;
  objc_super v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_WBSSiteMetadataToken;
  v14 = -[_WBSSiteMetadataToken init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    objc_storeStrong((id *)&v15->_request, a3);
    v15->_priority = 0;
    v15->_isOneTimeRequest = a4;
    v16 = MEMORY[0x1A85D45E4](v13);
    responseHandler = v15->_responseHandler;
    v15->_responseHandler = (id)v16;

    v15->_cancelledLock._os_unfair_lock_opaque = 0;
    v18 = v15;
  }

  return v15;
}

- (void)setDelayTimer:(id)a3
{
  WBSDispatchSourceTimer *v5;
  WBSDispatchSourceTimer *v6;
  WBSDispatchSourceTimer **p_delayTimer;
  WBSDispatchSourceTimer *delayTimer;
  WBSDispatchSourceTimer *v9;

  v5 = (WBSDispatchSourceTimer *)a3;
  delayTimer = self->_delayTimer;
  p_delayTimer = &self->_delayTimer;
  v6 = delayTimer;
  if (delayTimer != v5)
  {
    v9 = v5;
    -[WBSDispatchSourceTimer invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_delayTimer, a3);
    v5 = v9;
  }

}

- (void)setDidReceiveResponse:(BOOL)a3
{
  self->_didReceiveResponse = a3;
}

- (BOOL)isOneTimeRequest
{
  return self->_isOneTimeRequest;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)didReceiveResponse
{
  return self->_didReceiveResponse;
}

- (WBSSiteMetadataRequest)request
{
  return self->_request;
}

- (NSSet)parentRequests
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_parentRequests, "copy");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_WBSSiteMetadataToken;
  -[_WBSSiteMetadataToken dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_parentRequests, 0);
}

- (void)setParentRequests:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *parentRequests;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  parentRequests = self->_parentRequests;
  self->_parentRequests = v4;

}

- (void)removeParentRequest:(id)a3
{
  -[NSMutableSet removeObject:](self->_parentRequests, "removeObject:", a3);
}

- (void)setCancelled:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_cancelledLock;
  id responseHandler;

  v3 = a3;
  p_cancelledLock = &self->_cancelledLock;
  os_unfair_lock_lock(&self->_cancelledLock);
  self->_cancelled = v3;
  if (v3)
  {
    responseHandler = self->_responseHandler;
    self->_responseHandler = 0;

  }
  os_unfair_lock_unlock(p_cancelledLock);
}

- (BOOL)isCancelled
{
  _WBSSiteMetadataToken *v2;
  os_unfair_lock_s *p_cancelledLock;

  v2 = self;
  p_cancelledLock = &self->_cancelledLock;
  os_unfair_lock_lock(&self->_cancelledLock);
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_cancelledLock);
  return (char)v2;
}

- (id)description
{
  os_unfair_lock_s *p_cancelledLock;
  _BOOL4 cancelled;
  void *v5;
  uint64_t v6;
  WBSSiteMetadataRequest *request;
  __CFString *v8;
  unint64_t priority;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  p_cancelledLock = &self->_cancelledLock;
  os_unfair_lock_lock(&self->_cancelledLock);
  cancelled = self->_cancelled;
  os_unfair_lock_unlock(p_cancelledLock);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  request = self->_request;
  if (self->_isOneTimeRequest)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  priority = self->_priority;
  v10 = v8;
  WBSStringFromSiteMetadataRequestPriority(priority);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (cancelled)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, request: %@, isOneTime: %@, priority: %@, cancelled: %@>"), v6, self, request, v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)priority
{
  return self->_priority;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (WBSDispatchSourceTimer)delayTimer
{
  return self->_delayTimer;
}

@end
