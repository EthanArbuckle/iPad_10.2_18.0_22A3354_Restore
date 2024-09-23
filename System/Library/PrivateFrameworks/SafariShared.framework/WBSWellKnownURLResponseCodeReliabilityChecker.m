@implementation WBSWellKnownURLResponseCodeReliabilityChecker

- (WBSWellKnownURLResponseCodeReliabilityChecker)initWithURL:(id)a3
{
  id v4;
  WBSWellKnownURLResponseCodeReliabilityChecker *v5;
  uint64_t v6;
  NSURL *url;
  NSOperationQueue *v8;
  NSOperationQueue *fetchOperationQueue;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURLSession *session;
  WBSWellKnownURLResponseCodeReliabilityChecker *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSWellKnownURLResponseCodeReliabilityChecker;
  v5 = -[WBSWellKnownURLResponseCodeReliabilityChecker init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_wellKnownResponseCodeReliabilityURL");
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    fetchOperationQueue = v5->_fetchOperationQueue;
    v5->_fetchOperationQueue = v8;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p.operationQueue"), objc_opt_class(), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v5->_fetchOperationQueue, "setName:", v10);

    v11 = (void *)MEMORY[0x1E0C92C98];
    objc_msgSend(MEMORY[0x1E0C92CA0], "safari_ephemeralSessionConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionWithConfiguration:delegate:delegateQueue:", v12, 0, v5->_fetchOperationQueue);
    v13 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (NSURLSession *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)checkReliabilityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id completion;
  NSURLSession *session;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *, uint64_t);
  void *v14;
  WBSWellKnownURLResponseCodeReliabilityChecker *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:cachePolicy:timeoutInterval:", self->_url, 1, 10.0);
  objc_msgSend(v5, "setAttribution:", 1);
  v6 = (void *)MEMORY[0x1A8599ED0](v4);
  completion = self->_completion;
  self->_completion = v6;

  session = self->_session;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __80__WBSWellKnownURLResponseCodeReliabilityChecker_checkReliabilityWithCompletion___block_invoke;
  v14 = &unk_1E4B408D8;
  v15 = self;
  v16 = v4;
  v9 = v4;
  -[NSURLSession dataTaskWithRequest:completionHandler:](session, "dataTaskWithRequest:completionHandler:", v5, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume", v11, v12, v13, v14, v15);

}

void __80__WBSWellKnownURLResponseCodeReliabilityChecker_checkReliabilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void (*v6)(void);
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v9, "safari_statusCodeGroup");
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;

}

- (void)cancel
{
  void (**completion)(id, uint64_t);
  id v4;

  -[NSURLSession finishTasksAndInvalidate](self->_session, "finishTasksAndInvalidate");
  completion = (void (**)(id, uint64_t))self->_completion;
  if (completion)
  {
    completion[2](completion, 2);
    v4 = self->_completion;
    self->_completion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_fetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
