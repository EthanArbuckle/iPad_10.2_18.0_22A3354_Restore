@implementation PUPhotoEditToolControllerSpec

+ (UIColor)toolPickerSelectionColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.97, 0.8, 0.0, 1.0);
}

- (void)setLayoutOrientation:(int64_t)a3
{
  -[PUPhotoEditToolControllerSpec setLayoutOrientation:withTransitionCoordinator:](self, "setLayoutOrientation:withTransitionCoordinator:", a3, 0);
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  self->_layoutOrientation = a3;
}

- (double)standardBottomBarHeight
{
  unint64_t v4;
  double result;
  void *v6;

  if (!-[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolControllerSpec.m"), 27, CFSTR("Invalid layout style"));

  }
  v4 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 141.0;
  if (v4 >= 5)
    return 0.0;
  return result;
}

- (double)standardSideBarWidth
{
  unint64_t v4;
  double result;
  void *v6;

  if (!-[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditToolControllerSpec.m"), 45, CFSTR("Invalid layout style"));

  }
  v4 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 0.0;
  if (v4 <= 4)
    return dbl_1AB0EFD20[v4];
  return result;
}

- (BOOL)isiPadLayout
{
  return -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") == 4;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

@end
