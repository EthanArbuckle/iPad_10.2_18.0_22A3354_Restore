@implementation _UIDocumentUnavailableBrowserContainerViewController

- (_UIDocumentUnavailableBrowserContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _UIDocumentUnavailableBrowserContainerViewController *v4;
  _UIDocumentUnavailableBrowserContainerViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDocumentUnavailableBrowserContainerViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[UIViewController setDefinesPresentationContext:](v4, "setDefinesPresentationContext:", 1);
  return v5;
}

- (void)loadView
{
  _UITouchPassthroughView *v3;

  v3 = objc_alloc_init(_UITouchPassthroughView);
  -[UIViewController setView:](self, "setView:", v3);

}

@end
