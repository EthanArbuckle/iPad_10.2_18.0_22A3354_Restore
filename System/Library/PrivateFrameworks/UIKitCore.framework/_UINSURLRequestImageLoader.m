@implementation _UINSURLRequestImageLoader

- (_UINSURLRequestImageLoader)initWithURLRequest:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  _UINSURLRequestImageLoader *v9;
  _UINSURLRequestImageLoader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UINSURLRequestImageLoader;
  v9 = -[_UIImageLoader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_session, a4);
  }

  return v10;
}

- (void)_really_loadImage:(id)a3
{
  id v4;
  NSURLSession *session;
  NSURLRequest *request;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *, void *);
  void *v15;
  _UINSURLRequestImageLoader *v16;
  id v17;
  uint8_t buf[4];
  _UINSURLRequestImageLoader *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  session = self->_session;
  request = self->_request;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __48___UINSURLRequestImageLoader__really_loadImage___block_invoke;
  v15 = &unk_1E16C4430;
  v16 = self;
  v7 = v4;
  v17 = v7;
  -[NSURLSession dataTaskWithRequest:completionHandler:](session, "dataTaskWithRequest:completionHandler:", request, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_task, v8);
  _UIImageLoadingLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[NSURLRequest HTTPMethod](self->_request, "HTTPMethod", v12, v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLRequest URL](self->_request, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218499;
    v19 = self;
    v20 = 2113;
    v21 = v10;
    v22 = 2113;
    v23 = v11;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_INFO, "Image loader %p issuing URL request: %{private}@ %{private}@", buf, 0x20u);

  }
  objc_msgSend(v8, "resume");

}

- (BOOL)_really_cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_task);
  objc_msgSend(WeakRetained, "cancel");

  return 1;
}

- (id)_error
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UINSURLRequestImageLoader;
  -[_UIImageLoader _error](&v6, sel__error);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "code") == -999)
    v3 = 0;
  else
    v3 = v2;
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_task);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
