@implementation _TVRotatingViewController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_TVRotatingViewController;
  v7 = a4;
  -[_TVRotatingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80___TVRotatingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24EB85720;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)setView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  v5.receiver = self;
  v5.super_class = (Class)_TVRotatingViewController;
  -[_TVRotatingViewController setView:](&v5, sel_setView_, v4);

}

@end
