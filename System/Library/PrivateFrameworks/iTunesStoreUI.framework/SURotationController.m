@implementation SURotationController

- (SURotationController)init
{
  return -[SURotationController initWithViewController:](self, "initWithViewController:", 0);
}

- (SURotationController)initWithViewController:(id)a3
{
  SURotationController *result;
  objc_super v6;

  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("viewController cannot be nil"));
  v6.receiver = self;
  v6.super_class = (Class)SURotationController;
  result = -[SURotationController init](&v6, sel_init);
  if (result)
    result->_viewController = (SUViewController *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SURotationController;
  -[SURotationController dealloc](&v2, sel_dealloc);
}

- (BOOL)orientationAffectsViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL result;
  uint64_t v13;
  void *v14;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[SUViewController interfaceOrientation](self->_viewController, "interfaceOrientation");
  if (-[UIViewController overlayViewController](self->_viewController, "overlayViewController"))
    return 0;
  v8 = v4 >= v6 ? v4 : v6;
  v9 = v4 >= v6 ? v6 : v4;
  v10 = (unint64_t)(v7 - 3) >= 2 ? v9 : v8;
  objc_msgSend((id)-[SUViewController view](self->_viewController, "view"), "frame");
  if (vabdd_f64(v11, v10) > 0.00000011920929)
    return 0;
  v13 = -[SUViewController presentingViewController](self->_viewController, "presentingViewController");
  result = !v13
        || (v14 = (void *)v13,
            !-[UIViewController isDescendantOfViewController:](self->_viewController, "isDescendantOfViewController:", v13))|| objc_msgSend(v14, "modalPresentationStyle") != 2;
  return result;
}

- (CGRect)viewFrameForInterfaceOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  objc_msgSend((id)-[SUViewController view](self->_viewController, "view"), "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[SURotationController orientationAffectsViewFrame](self, "orientationAffectsViewFrame"))
  {
    v13 = -[SUViewController interfaceOrientation](self->_viewController, "interfaceOrientation") - 3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    if ((unint64_t)(a3 - 3) > 1)
    {
      if (v13 <= 1)
      {
        v12 = v15 - (v14 - v12);
        v10 = v14 - (v15 - v10);
      }
    }
    else if (v13 >= 2)
    {
      v12 = v14 - (v15 - v12);
      v10 = v15 - (v14 - v10);
    }
  }
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (SUViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  self->_viewController = (SUViewController *)a3;
}

@end
