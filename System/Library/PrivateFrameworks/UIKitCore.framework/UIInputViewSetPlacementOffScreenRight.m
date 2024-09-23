@implementation UIInputViewSetPlacementOffScreenRight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 1, 0, a5, 2, 1.0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
