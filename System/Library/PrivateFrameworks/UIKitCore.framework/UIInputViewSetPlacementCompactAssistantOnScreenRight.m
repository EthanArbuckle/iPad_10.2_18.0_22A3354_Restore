@implementation UIInputViewSetPlacementCompactAssistantOnScreenRight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v6 = a4;
    objc_msgSend(a5, "rightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 16.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (double)verticalOffset
{
  return 16.0;
}

@end
