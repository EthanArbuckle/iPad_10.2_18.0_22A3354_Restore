@implementation PLUIEditVideoViewController

- (BOOL)_displaysFullScreen
{
  return 0;
}

- (BOOL)_editingForThirdParty
{
  return -[NSDictionary objectForKey:](self->_options, "objectForKey:", *MEMORY[0x1E0CEC310]) != 0;
}

- (void)setupNavigationItem
{
  id v3;
  void *v4;
  id v5;

  -[PLUIEditVideoViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  v3 = -[PLUIEditVideoViewController navigationItem](self, "navigationItem");
  -[PLUIEditVideoViewController _editingForThirdParty](self, "_editingForThirdParty");
  objc_msgSend(v3, "setTitle:", PLLocalizedFrameworkString());
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelTrim_);
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 3, self, sel__trimVideo_);
  objc_msgSend(v3, "setRightBarButtonItem:", v5);

}

- (PLUIEditVideoViewController)initWithPhoto:(id)a3 trimTitle:(id)a4
{
  PLUIEditVideoViewController *v4;
  PLUIEditVideoViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLUIEditVideoViewController;
  v4 = -[PLUIImageViewController initWithPhoto:](&v7, sel_initWithPhoto_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PLUIImageViewController setAllowsEditing:](v4, "setAllowsEditing:", 1);
    -[PLUIEditVideoViewController setParentInPopoverException:](v5, "setParentInPopoverException:", 0);
    v5->_canCreateMetadata = PLIsAssetsd();
    v5->_viewClass = (Class)objc_opt_class();
  }
  return v5;
}

- (PLUIEditVideoViewController)initWithProperties:(id)a3
{
  uint64_t v5;
  PLUIEditVideoViewController *v6;
  PLUIEditVideoViewController *v7;
  objc_super v9;

  v5 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CEC310]);
  v9.receiver = self;
  v9.super_class = (Class)PLUIEditVideoViewController;
  v6 = -[PLUIImageViewController initWithVideoURL:](&v9, sel_initWithVideoURL_, v5);
  v7 = v6;
  if (v6)
  {
    -[PLUIEditVideoViewController setImagePickerOptions:](v6, "setImagePickerOptions:", a3);
    -[PLUIImageViewController setAllowsEditing:](v7, "setAllowsEditing:", 1);
    v7->_canCreateMetadata = 0;
    v7->_viewClass = (Class)objc_opt_class();
  }
  return v7;
}

- (PLUIEditVideoViewController)initWithVideoURL:(id)a3 trimTitle:(id)a4
{
  PLUIEditVideoViewController *v4;
  PLUIEditVideoViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLUIEditVideoViewController;
  v4 = -[PLUIImageViewController initWithVideoURL:](&v7, sel_initWithVideoURL_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PLUIImageViewController setAllowsEditing:](v4, "setAllowsEditing:", 1);
    v5->_canCreateMetadata = 0;
    v5->_viewClass = (Class)objc_opt_class();
  }
  return v5;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (id)navigationItem
{
  id result;

  result = self->_navItem;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7C0]), "initWithTitle:", -[PLUIEditVideoViewController title](self, "title"));
    self->_navItem = (UINavigationItem *)result;
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

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLUIEditVideoViewController;
  -[PLUIImageViewController dealloc](&v3, sel_dealloc);
}

- (void)setImagePickerOptions:(id)a3
{
  NSDictionary *options;

  options = self->_options;
  if (options != a3)
  {

    self->_options = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)uiipc_imagePickerOptions
{
  return self->_options;
}

- (id)_trimMessage
{
  -[PLUIEditVideoViewController _editingForThirdParty](self, "_editingForThirdParty");
  return (id)PLLocalizedFrameworkString();
}

- (id)uiipc_imagePickerController
{
  return 0;
}

- (Class)_viewClass
{
  return self->_viewClass;
}

- (void)setViewClass:(Class)a3
{
  self->_viewClass = a3;
}

- (void)loadView
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLUIEditVideoViewController;
  -[PLUIImageViewController loadView](&v5, sel_loadView);
  v3 = -[PLUIEditVideoViewController view](self, "view");
  if (v3)
  {
    v4 = (void *)v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setDisableViewInPopoverRule:", -[PLUIEditVideoViewController parentInPopoverException](self, "parentInPopoverException"));
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLUIEditVideoViewController;
  -[PLUIEditVideoViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (void *)objc_msgSend((id)-[PLUIEditVideoViewController navigationController](self, "navigationController"), "navigationBar");
  objc_msgSend(v3, "setScrollEdgeAppearance:", objc_msgSend(v3, "standardAppearance"));
  v4 = (void *)objc_msgSend((id)-[PLUIEditVideoViewController navigationController](self, "navigationController"), "toolbar");
  objc_msgSend(v4, "setScrollEdgeAppearance:", objc_msgSend(v4, "standardAppearance"));
}

- (void)didChooseVideoAtURL:(id)a3 options:(id)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a4);
  v7 = v6;
  if (a3)
    objc_msgSend(v6, "setObject:forKey:", a3, *MEMORY[0x1E0CEB6C8]);
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "editVideoViewController:didTrimVideoWithOptions:", self, v7);
  }
}

- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLUIEditVideoViewController;
  -[PLUIImageViewController videoRemakerDidEndRemaking:temporaryPath:](&v8, sel_videoRemakerDidEndRemaking_temporaryPath_, a3);
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a4)
    {
      v6 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a4, 0);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E0CEB6C8]);
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(self->_delegate, "editVideoViewController:didTrimVideoWithOptions:", self, v7);
  }
}

- (void)_cancelTrim:(id)a3
{
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "editVideoViewControllerDidCancel:", self);
  }
}

- (int)cropOverlayMode
{
  return 5;
}

- (CGRect)previewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 320.0;
  v3 = 426.0;
  v4 = 0.0;
  v5 = 20.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)_trimVideo:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLUIEditVideoViewController;
  -[PLUIImageViewController cropOverlayWasOKed:](&v3, sel_cropOverlayWasOKed_, 0);
}

- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4
{
  return 0.0;
}

- (BOOL)videoViewCanCreateMetadata:(id)a3
{
  return self->_canCreateMetadata != 0;
}

- (void)videoViewPlaybackDidFail:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = objc_alloc(MEMORY[0x1E0C99D80]);
      v5 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", PLLocalizedFrameworkString(), *MEMORY[0x1E0CB2D50], 0);
      v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], -1100, v5);

      objc_msgSend(self->_delegate, "editVideoViewController:didFailWithError:", self, v6);
    }
  }
}

- (BOOL)parentInPopoverException
{
  return self->_parentInPopoverException;
}

- (void)setParentInPopoverException:(BOOL)a3
{
  self->_parentInPopoverException = a3;
}

@end
