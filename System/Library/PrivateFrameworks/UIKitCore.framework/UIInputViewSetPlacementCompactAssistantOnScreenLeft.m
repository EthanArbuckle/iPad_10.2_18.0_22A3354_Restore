@implementation UIInputViewSetPlacementCompactAssistantOnScreenLeft

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (a4)
  {
    v6 = a5;
    objc_msgSend(v5, "leftAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 16.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (double)verticalOffset
{
  return 16.0;
}

@end
