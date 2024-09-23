@implementation PUPhotoEditViewControllerSpec

- (UIEdgeInsets)previewViewInsetsPortrait
{
  unint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") - 1;
  if (v2 > 3)
  {
    v4 = *MEMORY[0x1E0DC49E8];
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v3 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v3 = dbl_1AB0EFE00[v2];
    v4 = dbl_1AB0EFDC0[v2];
    v5 = 0.0;
    v6 = 0.0;
  }
  result.right = v5;
  result.bottom = v3;
  result.left = v6;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)previewViewInsetsLandscape
{
  unint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") - 1;
  if (v2 > 3)
  {
    v5 = *MEMORY[0x1E0DC49E8];
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v3 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    v3 = dbl_1AB0EFE00[v2];
    v4 = dbl_1AB0EFDE0[v2];
    v5 = 50.0;
    v6 = v3;
  }
  result.right = v3;
  result.bottom = v4;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)toolbarLongSideMargin
{
  unint64_t v2;
  double result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 0.0;
  if (v2 <= 4)
    return dbl_1AB0EFE20[v2];
  return result;
}

- (double)toolbarLongSideWideMargin
{
  unint64_t v2;
  double result;

  v2 = -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle");
  result = 0.0;
  if (v2 <= 4)
    return dbl_1AB0EFE48[v2];
  return result;
}

- (UIEdgeInsets)scrubberViewMargin
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 32.0;
  v3 = 12.0;
  v4 = 16.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)shouldDisplayExtensionButtonInMainToolbar
{
  return (unint64_t)(-[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") - 3) < 2;
}

- (BOOL)shouldDisplayCompactToolbar
{
  return -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") != 4;
}

- (BOOL)shouldAnchorLightingAgainstToolbar
{
  return -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") != 4;
}

- (BOOL)shouldUseCompactToolbarSpacing
{
  return -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") == 1;
}

- (BOOL)toolbarShadows_shouldShowToolbarUnderline
{
  return -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") != 4;
}

- (BOOL)shouldAllowApertureButtonExpansion
{
  return 1;
}

@end
