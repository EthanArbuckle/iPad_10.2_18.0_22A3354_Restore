@implementation SXContentScaleManager

- (SXContentScaleManager)initWithContentScale:(int64_t)a3
{
  SXContentScaleManager *result;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXContentScaleManager;
  result = -[SXContentScaleManager init](&v6, sel_init);
  if (result)
  {
    result->_contentScale = a3;
    v5 = 1.0;
    if ((unint64_t)(a3 - 1) <= 0xA)
      v5 = dbl_21713C4A0[a3 - 1];
    result->_contentScaleFactor = v5;
  }
  return result;
}

- (void)increase
{
  int64_t contentScale;

  contentScale = self->_contentScale;
  if (contentScale >= 10)
    contentScale = 10;
  -[SXContentScaleManager setContentScale:](self, "setContentScale:", contentScale + 1);
}

- (void)decrease
{
  int64_t contentScale;

  contentScale = self->_contentScale;
  if (contentScale <= 2)
    contentScale = 2;
  -[SXContentScaleManager setContentScale:](self, "setContentScale:", contentScale - 1);
}

- (void)reset
{
  -[SXContentScaleManager setContentScale:](self, "setContentScale:", 4);
}

- (void)setContentScale:(int64_t)a3
{
  double v4;
  void *v5;
  char v6;
  id v7;

  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    v4 = 1.0;
    if ((unint64_t)(a3 - 1) <= 0xA)
      v4 = dbl_21713C4A0[a3 - 1];
    self->_contentScaleFactor = v4;
    -[SXContentScaleManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SXContentScaleManager delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentScaleManagerDidChangeContentScaleFactor:", self);

    }
  }
}

- (int64_t)contentScale
{
  return self->_contentScale;
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (SXContentScaleManagerDelegate)delegate
{
  return (SXContentScaleManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
