@implementation TPKContentViewController

- (TPKContentViewController)initWithContentController:(id)a3 tipContent:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  return (TPKContentViewController *)TPKContentPopoverViewController.init(contentController:tipContent:sourceViewController:)(v7, v8, a5);
}

- (TPKContentViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPKContentViewController();
  return -[TPKContentPopoverViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
