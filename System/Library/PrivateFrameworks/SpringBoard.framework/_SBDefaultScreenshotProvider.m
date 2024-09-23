@implementation _SBDefaultScreenshotProvider

- (_SBDefaultScreenshotProvider)initWithScreen:(id)a3
{
  id v5;
  _SBDefaultScreenshotProvider *v6;
  _SBDefaultScreenshotProvider *v7;
  SBScreenFlash *v8;
  SBScreenFlash *flasher;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SBDefaultScreenshotProvider;
  v6 = -[_SBDefaultScreenshotProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_screen, a3);
    v8 = -[SBScreenFlash initWithScreen:]([SBScreenFlash alloc], "initWithScreen:", v5);
    flasher = v7->_flasher;
    v7->_flasher = v8;

  }
  return v7;
}

- (id)captureScreenshot
{
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  CGImage *v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend(MEMORY[0x1E0CEAC18], "createIOSurfaceFromScreen:", self->_screen);
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = _UICreateCGImageFromIOSurfaceWithOptions();
    if (v5)
    {
      v6 = (CGImage *)v5;
      v7 = (void *)MEMORY[0x1E0CEA638];
      -[UIScreen scale](self->_screen, "scale");
      objc_msgSend(v7, "imageWithCGImage:scale:orientation:", v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v6);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (SBScreenFlash)flasher
{
  return self->_flasher;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flasher, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end
