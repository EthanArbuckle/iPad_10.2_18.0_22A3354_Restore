@implementation SBOrientationTransformWrapperViewController

- (BSUIOrientationTransformWrapperView)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBOrientationTransformWrapperViewController;
  -[SBOrientationTransformWrapperViewController view](&v3, sel_view);
  return (BSUIOrientationTransformWrapperView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x24BE0BF38]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[SBOrientationTransformWrapperViewController setView:](self, "setView:", v4);

}

@end
