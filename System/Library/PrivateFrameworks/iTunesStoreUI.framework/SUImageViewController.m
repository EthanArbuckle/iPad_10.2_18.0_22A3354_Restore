@implementation SUImageViewController

- (void)dealloc
{
  objc_super v3;

  -[SUTouchCaptureView removeTarget:action:forControlEvents:](self->_backstopView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_backstopView = 0;
  self->_imageView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUImageViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  SUTouchCaptureView *v3;

  v3 = objc_alloc_init(SUTouchCaptureView);
  self->_backstopView = v3;
  -[SUTouchCaptureView addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__backstopAction_, 64);
  -[SUTouchCaptureView setAutoresizingMask:](self->_backstopView, "setAutoresizingMask:", 18);
  -[SUTouchCaptureView setBackgroundColor:](self->_backstopView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[SUTouchCaptureView addSubview:](self->_backstopView, "addSubview:", -[SUImageViewController _imageView](self, "_imageView"));
  -[SUImageViewController setView:](self, "setView:", self->_backstopView);
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUImageViewController.m"), 47, CFSTR("Page must be an image"));
  objc_msgSend(-[SUImageViewController _imageView](self, "_imageView"), "setImage:", a3);
}

- (void)_backstopAction:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "sendAction:to:from:forEvent:", sel_imagePageViewTapped_, 0, self, 0);
}

- (id)_imageView
{
  id result;
  UIImageView *v4;

  result = self->_imageView;
  if (!result)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    self->_imageView = v4;
    -[UIImageView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
    return self->_imageView;
  }
  return result;
}

@end
