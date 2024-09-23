@implementation UIStatusBarStudentItemView

- (id)accessibilityHUDRepresentation
{
  void *v2;
  UIAccessibilityHUDItem *v3;

  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("AXHUD_Student.png"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v2, 1, 0.0, 0.0, 0.0, 0.0);

  return v3;
}

@end
