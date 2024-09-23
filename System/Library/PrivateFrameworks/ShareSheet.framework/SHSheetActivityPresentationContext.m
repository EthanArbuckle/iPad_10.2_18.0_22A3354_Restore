@implementation SHSheetActivityPresentationContext

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SHSheetActivityPresentationContext shouldDismissBeforePresentation](self, "shouldDismissBeforePresentation");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPresentationContext shouldPresentOverCurrentContext](self, "shouldPresentOverCurrentContext");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPresentationContext isCloudSharing](self, "isCloudSharing");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ shouldDismissBeforePresentation:%@ shouldPresentOverCurrentContext:%@ isCloudSharing:%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldDismissBeforePresentation
{
  return self->_shouldDismissBeforePresentation;
}

- (void)setShouldDismissBeforePresentation:(BOOL)a3
{
  self->_shouldDismissBeforePresentation = a3;
}

- (BOOL)shouldPresentOverCurrentContext
{
  return self->_shouldPresentOverCurrentContext;
}

- (void)setShouldPresentOverCurrentContext:(BOOL)a3
{
  self->_shouldPresentOverCurrentContext = a3;
}

- (BOOL)isCloudSharing
{
  return self->_isCloudSharing;
}

- (void)setIsCloudSharing:(BOOL)a3
{
  self->_isCloudSharing = a3;
}

@end
