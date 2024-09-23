@implementation TFFeedbackFormViewSpecification

+ (UIEdgeInsets)formCellInsetsInTraitEnvironment:(id)a3
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  objc_msgSend(a3, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  v5 = 20.0;
  if (v4 != 2)
    v5 = 16.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = v5;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

@end
