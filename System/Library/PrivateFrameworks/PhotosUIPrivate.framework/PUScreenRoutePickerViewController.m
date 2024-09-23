@implementation PUScreenRoutePickerViewController

- (PUScreenRoutePickerViewController)initWithCompletionBlock:(id)a3
{
  id v4;
  PUScreenRoutePickerViewController *v5;
  uint64_t v6;
  id completionBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUScreenRoutePickerViewController;
  v5 = -[_UIScreenRoutePickerViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completionBlock = v5->_completionBlock;
    v5->_completionBlock = (id)v6;

  }
  return v5;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void (**completionBlock)(void);
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUScreenRoutePickerViewController;
  -[PUScreenRoutePickerViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();
    v5 = self->_completionBlock;
    self->_completionBlock = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
