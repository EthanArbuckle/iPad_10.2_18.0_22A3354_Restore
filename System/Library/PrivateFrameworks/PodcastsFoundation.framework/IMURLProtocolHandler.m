@implementation IMURLProtocolHandler

- (void)handleCompletionWithTask:(id)a3 metrics:(id)a4 decodedObject:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__IMURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke;
  v16[3] = &unk_1E54D3130;
  objc_copyWeak(&v18, &location);
  v14 = v13;
  v17 = v14;
  v15.receiver = self;
  v15.super_class = (Class)IMURLProtocolHandler;
  -[AMSURLProtocolHandler handleCompletionWithTask:metrics:decodedObject:completionHandler:](&v15, sel_handleCompletionWithTask_metrics_decodedObject_completionHandler_, v10, v11, v12, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __89__IMURLProtocolHandler_handleCompletionWithTask_metrics_decodedObject_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_msgSend(WeakRetained, "followsRedirects");
    if (objc_msgSend(v8, "actionType") == 1 && (v5 & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      +[IMIgnoreRedirectURLAction ignoreRedirectAction](IMIgnoreRedirectURLAction, "ignoreRedirectAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }
  else
  {
    objc_msgSend(v8, "actionType");
  }

}

- (BOOL)followsRedirects
{
  return self->_followsRedirects;
}

- (void)setFollowsRedirects:(BOOL)a3
{
  self->_followsRedirects = a3;
}

@end
