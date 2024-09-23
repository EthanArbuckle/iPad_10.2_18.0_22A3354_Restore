@implementation TSWPReferenceLibraryViewController

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPReferenceLibraryViewController;
  -[TSWPReferenceLibraryViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[TSWPReferenceLibraryViewControllerDelegate referenceLibrarayViewControllerWasDismissed:](self->_delegate, "referenceLibrarayViewControllerWasDismissed:", self);
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return objc_msgSend((id)-[TSWPReferenceLibraryViewController presentingViewController](self, "presentingViewController"), "supportedInterfaceOrientations");
}

- (TSWPReferenceLibraryViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPReferenceLibraryViewControllerDelegate *)a3;
}

@end
