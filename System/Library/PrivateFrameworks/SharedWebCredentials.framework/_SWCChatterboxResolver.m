@implementation _SWCChatterboxResolver

+ (id)new
{
  abort();
}

- (_SWCChatterboxResolver)init
{
  abort();
}

- (_SWCChatterboxResolver)initWithURL:(id)a3
{
  id v5;
  _SWCChatterboxResolver *v6;
  _SWCChatterboxResolver *v7;
  uint64_t v8;
  NSURLComponents *URLComponents;
  void *v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SWCChatterboxResolver;
  v6 = -[_SWCChatterboxResolver init](&v12, sel_init);
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("SWCChatterboxResolver.mm"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aURL != nil"));

    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 1);
    URLComponents = v7->_URLComponents;
    v7->_URLComponents = (NSURLComponents *)v8;

  }
LABEL_4:

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  _SWCChatterboxResolver *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (qword_1ED1B61C8 != -1)
    dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
  v3 = qword_1ED1B61C0;
  if (os_log_type_enabled((os_log_t)qword_1ED1B61C0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1A855A000, v3, OS_LOG_TYPE_DEBUG, "Deallocating %p", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)_SWCChatterboxResolver;
  -[_SWCChatterboxResolver dealloc](&v4, sel_dealloc);
}

- (NSURL)originalURL
{
  return -[NSURLComponents URL](self->_URLComponents, "URL");
}

- (void)resolveWithCompletionHandler:(id)a3
{
  id v5;
  NSURLComponents *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id completionHandler;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_URLComponents;
  v7 = (void *)objc_opt_class();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCChatterboxResolver.mm"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  if (objc_msgSend(v7, "_looksLikeChatterboxURLComponents:", v6))
  {
    -[NSURLComponents URL](v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_recursive_lock_lock_with_options();
    if (self->_task)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCChatterboxResolver.mm"), 87, CFSTR("Already attempting to resolve this Chatterbox URL."), v8);

    }
    if (qword_1ED1B61C8 != -1)
      dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
    v9 = qword_1ED1B61C0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B61C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      v19 = v8;
      _os_log_impl(&dword_1A855A000, v9, OS_LOG_TYPE_INFO, "Resolving Chatterbox URL %{sensitive}@", buf, 0xCu);
    }
    objc_msgSend(v7, "_session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v8);
    objc_msgSend(v10, "dataTaskWithRequest:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");
    objc_storeStrong((id *)&self->_task, v12);
    objc_storeStrong((id *)&self->_session, v10);
    v13 = (void *)objc_msgSend(v5, "copy");
    completionHandler = self->_completionHandler;
    self->_completionHandler = v13;

    objc_msgSend(v7, "_setResolver:forTask:", self, v12);
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    -[NSURLComponents URL](v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B61C8 != -1)
      dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
    v15 = qword_1ED1B61C0;
    if (os_log_type_enabled((os_log_t)qword_1ED1B61C0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      v19 = v8;
      _os_log_impl(&dword_1A855A000, v15, OS_LOG_TYPE_INFO, "URL %{sensitive}@ is not from Chatterbox, returning verbatim.", buf, 0xCu);
    }
    (*((void (**)(id, void *, _QWORD))v5 + 2))(v5, v8, 0);
  }

}

+ (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  v12 = objc_msgSend(v10, "statusCode");
  if (qword_1ED1B61C8 != -1)
    dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
  v13 = (id)qword_1ED1B61C0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "originalRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218499;
    v24 = v12;
    v25 = 2117;
    v26 = v15;
    v27 = 2117;
    v28 = v10;
    _os_log_impl(&dword_1A855A000, v13, OS_LOG_TYPE_INFO, "Got HTTP response %li for Chatterbox URL %{sensitive}@: %{sensitive}@", buf, 0x20u);

  }
  if ((unint64_t)(v12 - 200) > 0x63)
  {
    if ((unint64_t)(v12 - 400) <= 0xC7)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_SWCChatterboxResolver URLSession:dataTask:didReceiveResponse:completionHandler:]", CFSTR("Line"), CFSTR("Function"), &unk_1E5480E88);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("HTTP"), v12, v18);
      objc_msgSend(a1, "_invokeCompletionHandlerForTask:result:error:", v9, 0, v19);

      goto LABEL_10;
    }
LABEL_11:
    v20 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v10, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_invokeCompletionHandlerForTask:result:error:", v9, v16, 0);
LABEL_10:

  v20 = 0;
LABEL_12:
  v11[2](v11, v20);

}

+ (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, id);
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  _QWORD v32[4];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v12 = a4;
  v30 = a5;
  v13 = a6;
  v14 = (void (**)(id, id))a7;
  if (qword_1ED1B61C8 != -1)
    dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
  v15 = (id)qword_1ED1B61C0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "originalRequest", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138740227;
    v34 = v17;
    v35 = 2117;
    v36 = v18;
    _os_log_impl(&dword_1A855A000, v15, OS_LOG_TYPE_INFO, "Redirecting Chatterbox URL %{sensitive}@ => %{sensitive}@", buf, 0x16u);

  }
  if (objc_msgSend(a1, "_looksLikeAppleErrorPageURLResponse:", v30))
  {
    if (qword_1ED1B61C8 != -1)
      dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
    v19 = (id)qword_1ED1B61C0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "originalRequest");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138739971;
      v34 = v28;
      _os_log_error_impl(&dword_1A855A000, v19, OS_LOG_TYPE_ERROR, "Chatterbox URL %{sensitive}@: resolution failed server-side and redirected to a generic error page.", buf, 0xCu);

    }
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v32[0] = &unk_1E5480EA0;
    v31[0] = CFSTR("Line");
    v31[1] = CFSTR("Function");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[_SWCChatterboxResolver URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CB2938];
    v32[1] = v21;
    v32[2] = CFSTR("The specified Chatterbox URL redirected to an error page.");
    v23 = *MEMORY[0x1E0CB3308];
    v31[2] = v22;
    v31[3] = v23;
    objc_msgSend(v13, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v20, "initWithDomain:code:userInfo:", CFSTR("SWCErrorDomain"), 9, v25);
    objc_msgSend(a1, "_invokeCompletionHandlerForTask:result:error:", v12, 0, v26);

    objc_msgSend(v12, "cancel");
  }
  v14[2](v14, v13);

}

+ (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (qword_1ED1B61C8 != -1)
      dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
    v11 = (id)qword_1ED1B61C0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "originalRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138740227;
      v19 = v17;
      v20 = 2112;
      v21 = v10;
      _os_log_error_impl(&dword_1A855A000, v11, OS_LOG_TYPE_ERROR, "Error handling Chatterbox URL %{sensitive}@: %@", (uint8_t *)&v18, 0x16u);

    }
    v12 = 0;
  }
  else
  {
    if (qword_1ED1B61C8 != -1)
      dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
    v13 = (id)qword_1ED1B61C0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "originalRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138739971;
      v19 = v15;
      _os_log_impl(&dword_1A855A000, v13, OS_LOG_TYPE_INFO, "Finished handling Chatterbox URL %{sensitive}@", (uint8_t *)&v18, 0xCu);

    }
    objc_msgSend(v9, "currentRequest");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject URL](v11, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "_invokeCompletionHandlerForTask:result:error:", v9, v12, v10);
  if (!v10)
  {

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_URLComponents, 0);
}

+ (id)_queue
{
  if (qword_1ED1B61A8 != -1)
    dispatch_once(&qword_1ED1B61A8, &__block_literal_global_1);
  return (id)_MergedGlobals_1;
}

+ (id)_session
{
  void *WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  os_unfair_recursive_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained(&qword_1ED1B61B0);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(a1, "_queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionWithConfiguration:delegate:delegateQueue:", v4, a1, v6);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_recursive_lock_unlock();
  return WeakRetained;
}

+ (id)_resolverForTask:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend((id)qword_1ED1B61B8, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();

  return v4;
}

+ (void)_setResolver:(id)a3 forTask:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v6 = (void *)qword_1ED1B61B8;
  if (v9 && !qword_1ED1B61B8)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)qword_1ED1B61B8;
    qword_1ED1B61B8 = (uint64_t)v7;

    v6 = (void *)qword_1ED1B61B8;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v5);
  os_unfair_recursive_lock_unlock();

}

+ (void)_invokeCompletionHandlerForTask:(id)a3 result:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(a1, "_resolverForTask:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = *(void **)(v11 + 16);
    *(_QWORD *)(v11 + 16) = 0;

    v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85D4CA4](*(_QWORD *)(v12 + 32));
    v15 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = 0;

    v16 = 0;
    if (!v9)
      v16 = *(id *)(v12 + 8);
    objc_msgSend(a1, "_setResolver:forTask:", 0, v8);
    v17 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = 0;

  }
  else
  {
    v14 = 0;
    v16 = 0;
  }

  os_unfair_recursive_lock_unlock();
  if (v14)
  {
    if (qword_1ED1B61C8 != -1)
      dispatch_once(&qword_1ED1B61C8, &__block_literal_global_79);
    v18 = (id)qword_1ED1B61C0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = (void *)MEMORY[0x1A85D4CA4](v14);
      objc_msgSend(v8, "originalRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412547;
      v23 = v19;
      v24 = 2117;
      v25 = v21;
      _os_log_debug_impl(&dword_1A855A000, v18, OS_LOG_TYPE_DEBUG, "Invoking completion handler %@ for Chatterbox URL %{sensitive}@", (uint8_t *)&v22, 0x16u);

    }
    ((void (**)(_QWORD, id, id))v14)[2](v14, v9, v10);
  }

}

+ (BOOL)_looksLikeChatterboxURLComponents:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCChatterboxResolver.mm"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("urlComponents != nil"));

  }
  v6 = (void *)MEMORY[0x1A85D4B3C]();
  objc_msgSend(v5, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_13;
  if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("http")))
  {
    if (v8)
      goto LABEL_9;
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v9 = 0;
  if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("https")) || !v8)
    goto LABEL_14;
LABEL_9:
  if (!objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("c.apple.com")))
  {
    v9 = 1;
    goto LABEL_14;
  }
  if (!qword_1ED1B6320)
    goto LABEL_13;
  +[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isAppleInternal"))
    v9 = objc_msgSend(v8, "caseInsensitiveCompare:", qword_1ED1B6320) == 0;
  else
    v9 = 0;

LABEL_14:
  objc_autoreleasePoolPop(v6);

  return v9;
}

+ (BOOL)_looksLikeAppleErrorPageURLResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(a3, "valueForHTTPHeaderField:", CFSTR("Location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v3);
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && !objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("www.apple.com")))
    {
      objc_msgSend(v4, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqual:", CFSTR("/error")) & 1) != 0)
        v7 = 1;
      else
        v7 = objc_msgSend(v8, "hasSuffix:", CFSTR("/error.html"));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
