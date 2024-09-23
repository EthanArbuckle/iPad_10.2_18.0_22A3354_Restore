@implementation UIMenuController

+ (UIMenuController)sharedMenuController
{
  void *v2;
  _UIEditMenuInteractionMenuController *v3;
  void *v4;

  v2 = (void *)__sharedMenuController;
  if (!__sharedMenuController)
  {
    v3 = objc_alloc_init(_UIEditMenuInteractionMenuController);
    v4 = (void *)__sharedMenuController;
    __sharedMenuController = (uint64_t)v3;

    v2 = (void *)__sharedMenuController;
  }
  return (UIMenuController *)v2;
}

- (UIMenuController)init
{
  void *v5;
  void *v6;
  objc_super v7;

  if (__sharedMenuController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuController.m"), 88, CFSTR("There can only be one UIMenuController instance."));

  }
  if (-[UIMenuController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuController.m"), 89, CFSTR("UIMenuController does not support direct initialization."));

  }
  v7.receiver = self;
  v7.super_class = (Class)UIMenuController;
  return -[UIMenuController init](&v7, sel_init);
}

- (void)setMenuVisible:(BOOL)menuVisible
{
  -[UIMenuController setMenuVisible:animated:](self, "setMenuVisible:animated:", menuVisible, 0);
}

- (void)setMenuVisible:(BOOL)menuVisible animated:(BOOL)animated
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", menuVisible, animated);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuController.m"), 100, CFSTR("%s needs to be implemented by a concrete subclass."), "-[UIMenuController setMenuVisible:animated:]");

}

- (void)setTargetRect:(CGRect)targetRect inView:(UIView *)targetView
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", targetView, targetRect.origin.x, targetRect.origin.y, targetRect.size.width, targetRect.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuController.m"), 105, CFSTR("%s needs to be implemented by a concrete subclass."), "-[UIMenuController setTargetRect:inView:]");

}

- (void)showMenuFromView:(UIView *)targetView rect:(CGRect)targetRect
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", targetView, targetRect.origin.x, targetRect.origin.y, targetRect.size.width, targetRect.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuController.m"), 110, CFSTR("%s needs to be implemented by a concrete subclass."), "-[UIMenuController showMenuFromView:rect:]");

}

- (void)hideMenuFromView:(UIView *)targetView
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", targetView);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuController.m"), 115, CFSTR("%s needs to be implemented by a concrete subclass."), "-[UIMenuController hideMenuFromView:]");

}

- (void)hideMenu
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuController.m"), 120, CFSTR("%s needs to be implemented by a concrete subclass."), "-[UIMenuController hideMenu]");

}

- (void)update
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenuController.m"), 125, CFSTR("%s needs to be implemented by a concrete subclass."), "-[UIMenuController update]");

}

- (NSArray)menuItems
{
  return 0;
}

- (CGRect)menuFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_asCalloutBarDelegate
{
  return 0;
}

- (UIMenuControllerArrowDirection)arrowDirection
{
  return self->_arrowDirection;
}

- (void)setArrowDirection:(UIMenuControllerArrowDirection)arrowDirection
{
  self->_arrowDirection = arrowDirection;
}

- (BOOL)isMenuVisible
{
  return self->_menuVisible;
}

@end
