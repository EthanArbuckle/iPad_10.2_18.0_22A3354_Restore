@implementation _PUWallpaperPosterDebugIdleTimerAssertion

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_PUWallpaperPosterDebugIdleTimerAssertion;
  -[_PUWallpaperPosterDebugIdleTimerAssertion dealloc](&v2, sel_dealloc);
}

- (void)px_invalidate
{
  id v2;

  self->_invalidated = 1;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdleTimerDisabled:", 0);

}

@end
