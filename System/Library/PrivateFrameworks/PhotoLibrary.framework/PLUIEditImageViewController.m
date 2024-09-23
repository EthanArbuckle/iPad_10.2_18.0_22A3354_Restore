@implementation PLUIEditImageViewController

- (void)dealloc
{
  objc_super v3;

  -[PLUIEditImageViewController setDelegate:](self, "setDelegate:", 0);
  self->_delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLUIEditImageViewController;
  -[PLUIImageViewController dealloc](&v3, sel_dealloc);
}

- (void)setImageSavingOptions:(int)a3
{
  self->_saveOptions = a3;
}

- (int)saveOptions
{
  return self->_saveOptions;
}

- (unint64_t)_contentAutoresizingMask
{
  return 0;
}

- (unint64_t)_tileAutoresizingMask
{
  return 45;
}

- (PLUIEditImageViewController)initWithPhoto:(id)a3
{
  PLUIEditImageViewController *v3;
  PLUIEditImageViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLUIEditImageViewController;
  v3 = -[PLUIImageViewController initWithPhoto:](&v6, sel_initWithPhoto_, a3);
  v4 = v3;
  if (v3)
  {
    -[PLUIImageViewController setAllowsEditing:](v3, "setAllowsEditing:", 1);
    -[PLUIEditImageViewController setMode:](v4, "setMode:", 8);
    v4->_saveOptions = 0;
  }
  return v4;
}

- (void)cropOverlayWasOKed:(id)a3
{
  if (!self->_saveOptions)
    self->_saveOptions = 4;
  -[PLCropOverlay beginBackgroundSaveWithTile:progressTitle:completionCallbackTarget:options:](self->super._cropOverlay, "beginBackgroundSaveWithTile:progressTitle:completionCallbackTarget:options:", self->super._imageTile, 0);
}

- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4
{
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "editImageViewController:didEditImageWithOptions:", self, a4);
  }
}

- (void)cropOverlayWasCancelled:(id)a3
{
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "editImageViewControllerDidCancel:", self);
  }
}

- (id)photo
{
  return self->super._photo;
}

- (unsigned)imageFormat
{
  return 4007;
}

- (id)imageTile
{
  return self->super._imageTile;
}

- (int)cropOverlayMode
{
  int result;
  objc_super v4;

  result = self->_mode;
  if (result == 8)
  {
    v4.receiver = self;
    v4.super_class = (Class)PLUIEditImageViewController;
    return -[PLUIImageViewController cropOverlayMode](&v4, sel_cropOverlayMode);
  }
  return result;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

@end
