@implementation PUAbstractNavigationBanner

- (double)height
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAbstractNavigationBanner.m"), 17, CFSTR("%s must be overriden by subclass"), "-[PUAbstractNavigationBanner height]");

  -[PUAbstractNavigationBanner doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (UIView)view
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAbstractNavigationBanner.m"), 23, CFSTR("%s must be overriden by subclass"), "-[PUAbstractNavigationBanner view]");

  -[PUAbstractNavigationBanner doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PUAbstractNavigationBannerDelegate)delegate
{
  return (PUAbstractNavigationBannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
