@implementation UIInputViewSetPlacementPlaceholder

+ (id)placementWithHeight:(double)a3
{
  UIInputViewSetPlacementPlaceholder *v4;

  v4 = objc_alloc_init(UIInputViewSetPlacementPlaceholder);
  if (v4)
    v4->_height = a3;
  return v4;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 3, 0, a5, 4, 1.0, -self->_height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double height;
  objc_super v9;
  CGRect result;

  v9.receiver = self;
  v9.super_class = (Class)UIInputViewSetPlacementPlaceholder;
  -[UIInputViewSetPlacement remoteIntrinsicContentSizeForInputViewInSet:includingIAV:](&v9, sel_remoteIntrinsicContentSizeForInputViewInSet_includingIAV_, a3, a4);
  height = self->_height;
  result.size.height = height;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementPlaceholder;
  if (-[UIInputViewSetPlacement isEqual:](&v7, sel_isEqual_, v4))
    v5 = v4[5] == self->_height;
  else
    v5 = 0;

  return v5;
}

@end
