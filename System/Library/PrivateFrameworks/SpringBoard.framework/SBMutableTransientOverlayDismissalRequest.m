@implementation SBMutableTransientOverlayDismissalRequest

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBTransientOverlayDismissalRequest _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBTransientOverlayDismissalRequest _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (void)setAnimated:(BOOL)a3
{
  self->super._animated = a3;
}

- (void)setCompletionHandler:(id)a3
{
  void *v4;
  id completionHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  completionHandler = self->super._completionHandler;
  self->super._completionHandler = v4;

}

@end
