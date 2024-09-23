@implementation _UIViewServiceDummyPopoverController

+ (Class)_popoverViewClass
{
  return (Class)objc_opt_class();
}

- (void)_popoverView:(id)a3 didSetUseToolbarShine:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[UIPopoverController popoverView](self, "popoverView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[_UIViewServiceDummyPopoverController dummyPopoverControllerDelegate](self, "dummyPopoverControllerDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "dummyPopoverController:popoverViewDidSetUseToolbarShine:", self, v4);

  }
}

- (void)setPopoverContentSize:(CGSize)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v8;
  objc_super v9;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[_UIViewServiceDummyPopoverController dummyPopoverControllerDelegate](self, "dummyPopoverControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "dummyPopoverController:didChangeContentSize:animated:", self, v4, width, height);
  v9.receiver = self;
  v9.super_class = (Class)_UIViewServiceDummyPopoverController;
  -[UIPopoverController setPopoverContentSize:animated:](&v9, sel_setPopoverContentSize_animated_, v4, width, height);

}

- (BOOL)_attemptsToAvoidKeyboard
{
  return 0;
}

- (void)_super_setPopoverContentSize:(CGSize)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceDummyPopoverController;
  -[UIPopoverController setPopoverContentSize:animated:](&v3, sel_setPopoverContentSize_animated_, 0, a3.width, a3.height);
}

- (_UIViewServiceDummyPopoverControllerDelegate)dummyPopoverControllerDelegate
{
  return (_UIViewServiceDummyPopoverControllerDelegate *)objc_loadWeakRetained((id *)&self->_dummyPopoverControllerDelegate);
}

- (void)setDummyPopoverControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dummyPopoverControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dummyPopoverControllerDelegate);
}

@end
