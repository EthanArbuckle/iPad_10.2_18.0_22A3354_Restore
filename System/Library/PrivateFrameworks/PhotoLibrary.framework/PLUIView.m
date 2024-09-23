@implementation PLUIView

- (void)didMoveToWindow
{
  objc_super v3;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && -[PLUIView window](self, "window")
    && objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", self), "parentViewController")
    && !-[PLUIView disableViewInPopoverRule](self, "disableViewInPopoverRule"))
  {
    UIImagePickerEnsureViewIsInsidePopover();
  }
  v3.receiver = self;
  v3.super_class = (Class)PLUIView;
  -[PLUIView didMoveToWindow](&v3, sel_didMoveToWindow);
}

- (BOOL)disableViewInPopoverRule
{
  return self->_disableViewInPopoverRule;
}

- (void)setDisableViewInPopoverRule:(BOOL)a3
{
  self->_disableViewInPopoverRule = a3;
}

@end
