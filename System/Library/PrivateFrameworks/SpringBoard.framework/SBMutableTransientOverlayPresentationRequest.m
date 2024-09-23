@implementation SBMutableTransientOverlayPresentationRequest

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBTransientOverlayPresentationRequest _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBTransientOverlayPresentationRequest _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
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

- (void)setShouldDismissSiri:(BOOL)a3
{
  self->super._shouldDismissSiri = a3;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->super._viewController, a3);
}

- (void)setOriginatingProcess:(id)a3
{
  objc_storeStrong((id *)&self->super._originatingProcess, a3);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->super._windowScene, a3);
}

@end
