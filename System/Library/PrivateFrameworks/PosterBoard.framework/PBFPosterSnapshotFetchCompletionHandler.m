@implementation PBFPosterSnapshotFetchCompletionHandler

- (PBFPosterSnapshotFetchCompletionHandler)initWithRequest:(id)a3 completionHandler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PBFPosterSnapshotFetchCompletionHandler *v11;
  PBFPosterSnapshotFetchCompletionHandler *v12;
  uint64_t v13;
  id completionHandler;
  uint64_t v15;
  BSAtomicFlag *didFireCompletionHandler;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completionHandler"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotFetchCompletionHandler initWithRequest:completionHandler:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA9BE98);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("request"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterSnapshotFetchCompletionHandler initWithRequest:completionHandler:].cold.2(a2);
    goto LABEL_11;
  }
  v10 = v9;
  v19.receiver = self;
  v19.super_class = (Class)PBFPosterSnapshotFetchCompletionHandler;
  v11 = -[PBFPosterSnapshotFetchCompletionHandler init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    v13 = objc_msgSend(v10, "copy");
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = (id)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    didFireCompletionHandler = v12->_didFireCompletionHandler;
    v12->_didFireCompletionHandler = (BSAtomicFlag *)v15;

  }
  return v12;
}

- (void)dealloc
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 24);
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_FAULT, "Completion handler deallocated without being fired! Request: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)finishWithError:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  PBFPosterSnapshotRequest *request;
  PBFPosterSnapshotRequest *v9;
  int v10;
  PBFPosterSnapshotRequest *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BSAtomicFlag setFlag:](self->_didFireCompletionHandler, "setFlag:", 1);
  PBFLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      request = self->_request;
      v10 = 138543362;
      v11 = request;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_INFO, "Fired ERROR completion handler for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    (*((void (**)(void))self->_completionHandler + 2))();
  }
  else
  {
    if (v7)
    {
      v9 = self->_request;
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_INFO, "Already fired completion handler for %{public}@; bailing",
        (uint8_t *)&v10,
        0xCu);
    }

  }
}

- (void)finishWithSuccess:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  PBFPosterSnapshotRequest *request;
  PBFPosterSnapshotRequest *v9;
  int v10;
  PBFPosterSnapshotRequest *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BSAtomicFlag setFlag:](self->_didFireCompletionHandler, "setFlag:", 1);
  PBFLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      request = self->_request;
      v10 = 138543362;
      v11 = request;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_INFO, "Fired SUCCESS completion handler for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    (*((void (**)(void))self->_completionHandler + 2))();
  }
  else
  {
    if (v7)
    {
      v9 = self->_request;
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_INFO, "Already fired completion handler for %{public}@; bailing",
        (uint8_t *)&v10,
        0xCu);
    }

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (PBFPosterSnapshotRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_didFireCompletionHandler, 0);
}

- (void)initWithRequest:(const char *)a1 completionHandler:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithRequest:(const char *)a1 completionHandler:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
