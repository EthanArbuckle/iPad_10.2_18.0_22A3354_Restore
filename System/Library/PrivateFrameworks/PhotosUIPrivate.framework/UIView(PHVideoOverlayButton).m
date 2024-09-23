@implementation UIView(PHVideoOverlayButton)

+ (id)ph_videoOverlayButton
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v1 = v0;

  return v1;
}

@end
