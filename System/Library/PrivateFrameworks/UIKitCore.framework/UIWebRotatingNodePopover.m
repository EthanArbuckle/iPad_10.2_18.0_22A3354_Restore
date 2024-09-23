@implementation UIWebRotatingNodePopover

- (UIWebRotatingNodePopover)initWithDOMNode:(id)a3
{
  id v4;
  UIWebRotatingNodePopover *v5;
  UIWebRotatingNodePopover *v6;
  void *v7;
  UIWebRotatingNodePopover *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIWebRotatingNodePopover;
  v5 = -[UIWebRotatingNodePopover init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIWebRotatingNodePopover setNode:](v5, "setNode:", v4);
    -[UIWebRotatingNodePopover setPresentationPoint:](v6, "setPresentationPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_willRotate_, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_didRotate_, CFSTR("UIWindowDidRotateNotification"), 0);
    v8 = v6;

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  -[UIWebRotatingNodePopover setNode:](self, "setNode:", 0);
  -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 1);
  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  -[UIWebRotatingNodePopover setPopoverController:](self, "setPopoverController:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIWindowWillRotateNotification");
  v6[1] = CFSTR("UIWindowDidRotateNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIWebRotatingNodePopover;
  -[UIWebRotatingNodePopover dealloc](&v5, sel_dealloc);
}

- (void)setPopoverController:(id)a3
{
  UIPopoverController *v5;
  UIPopoverController *popoverController;
  UIPopoverController *v7;

  v5 = (UIPopoverController *)a3;
  popoverController = self->_popoverController;
  if (popoverController != v5)
  {
    v7 = v5;
    -[UIPopoverController setDelegate:](popoverController, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_popoverController, a3);
    -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    v5 = v7;
  }

}

- (unint64_t)popoverArrowDirections
{
  return 15;
}

- (void)presentPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  float v12;
  double v13;
  UIPopoverController *v14;
  double v15;
  CGFloat v16;
  double v17;
  UIPopoverController *v18;
  DOMNode *node;
  UIPopoverController *popoverController;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v3 = a3;
  WebThreadLock();
  -[DOMNode ownerDocument](self->_node, "ownerDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIWebRotatingNodePopover popoverArrowDirections](self, "popoverArrowDirections");
  -[UIPopoverController _setAllowsPopoverPresentationToAdapt:](self->_popoverController, "_setAllowsPopoverPresentationToAdapt:", 0);
  -[UIWebRotatingNodePopover presentationPoint](self, "presentationPoint");
  if (v10 == *MEMORY[0x1E0C9D538] && v9 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    node = self->_node;
    if (node)
    {
      -[DOMNode absoluteQuad](node, "absoluteQuad");
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
    }
    objc_msgSend(v7, "convertRect:fromFrame:", v6, quadBoundingBox((double *)&v21));
    popoverController = self->_popoverController;
    v26 = CGRectIntegral(v27);
    v18 = popoverController;
  }
  else
  {
    objc_msgSend(v7, "_documentScale");
    v13 = v12;
    v14 = self->_popoverController;
    -[UIWebRotatingNodePopover presentationPoint](self, "presentationPoint");
    v16 = v15 * v13;
    -[UIWebRotatingNodePopover presentationPoint](self, "presentationPoint");
    v25.origin.y = v17 * v13;
    v25.size.width = 1.0;
    v25.size.height = 1.0;
    v25.origin.x = v16;
    v26 = CGRectIntegral(v25);
    v18 = v14;
  }
  -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v18, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, v8, v3, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height, v21, v22, v23, v24);

}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", a3);
}

- (void)willRotate:(id)a3
{
  self->_isRotating = 1;
  -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 0);
}

- (void)didRotate:(id)a3
{
  self->_isRotating = 0;
  -[UIWebRotatingNodePopover presentPopoverAnimated:](self, "presentPopoverAnimated:", 0);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (!self->_isRotating)
    -[UIWebRotatingNodePopoverDelegate popoverWasDismissed:](self->_dismissDelegate, "popoverWasDismissed:", self);
}

- (DOMNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (CGPoint)presentationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_presentationPoint.x;
  y = self->_presentationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPresentationPoint:(CGPoint)a3
{
  self->_presentationPoint = a3;
}

- (UIPopoverController)popoverController
{
  return self->_popoverController;
}

- (UIWebRotatingNodePopoverDelegate)dismissDelegate
{
  return self->_dismissDelegate;
}

- (void)setDismissDelegate:(id)a3
{
  self->_dismissDelegate = (UIWebRotatingNodePopoverDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end
