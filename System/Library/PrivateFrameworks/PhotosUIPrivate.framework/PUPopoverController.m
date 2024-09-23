@implementation PUPopoverController

- (void)presentPopoverFromBarButtonItem:(id)a3 permittedArrowDirections:(unint64_t)a4 animated:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPopoverController;
  -[PUPopoverController presentPopoverFromBarButtonItem:permittedArrowDirections:animated:](&v6, sel_presentPopoverFromBarButtonItem_permittedArrowDirections_animated_, a3, a4, a5);
  -[PUPopoverController setPassthroughViews:](self, "setPassthroughViews:", 0);
}

@end
