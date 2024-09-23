@implementation UIInputViewSetPlacementOffScreenDownByScreenHeight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;

  v5 = a4;
  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0D156E0];
    v7 = a5;
    v8 = v5;
    objc_msgSend(v7, "frame");
    v10 = v9;
    objc_msgSend(v8, "frame");
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, v7, 4, 1.0, v10 - v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
