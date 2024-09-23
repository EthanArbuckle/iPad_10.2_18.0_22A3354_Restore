@implementation SKUISortDataRequest

- (SKUISortDataRequest)initWithSortURL:(id)a3
{
  id v4;
  SKUISortDataRequest *v5;
  uint64_t v6;
  NSURL *sortURL;
  objc_super v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISortDataRequest initWithSortURL:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUISortDataRequest;
  v5 = -[SKUIResourceRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sortURL = v5->_sortURL;
    v5->_sortURL = (NSURL *)v6;

  }
  return v5;
}

- (void)finishWithResource:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "sortDataRequest:didFinishWithLockups:", self, v5);

}

- (id)newLoadOperation
{
  return -[SKUILoadSortDataOperation initWithResourceRequest:]([SKUILoadSortDataOperation alloc], "initWithResourceRequest:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKUISortDataRequest;
  v5 = -[SKUIResourceRequest copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSURL copyWithZone:](self->_sortURL, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (SKUISortDataRequestDelegate)delegate
{
  return (SKUISortDataRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)sortURL
{
  return self->_sortURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithSortURL:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISortDataRequest initWithSortURL:]";
}

@end
