@implementation PUEditExtensionActivityViewController

- (BOOL)_shouldUseModernDesign
{
  return 1;
}

- (BOOL)isPhotosOrCamera
{
  return 0;
}

- (BOOL)appWantsLargePreview
{
  return 0;
}

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.sharing.quick-note")) ^ 1;
}

- (void)_performActivity:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUEditExtensionActivityViewController editExtensionActivityViewControllerDelegate](self, "editExtensionActivityViewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editExtensionActivityViewController:didSelectActivity:", self, v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUEditExtensionActivityViewController;
    -[PUEditExtensionActivityViewController _performActivity:](&v6, sel__performActivity_, v4);
  }

}

- (PUEditExtensionActivityViewControllerDelegate)editExtensionActivityViewControllerDelegate
{
  return (PUEditExtensionActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_editExtensionActivityViewControllerDelegate);
}

- (void)setEditExtensionActivityViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editExtensionActivityViewControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editExtensionActivityViewControllerDelegate);
}

@end
