@implementation UIInputViewSetPlacementCompactAssistantOnScreen

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)applicatorInfoForOwner:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementCompactAssistantOnScreen;
  -[UIInputViewSetPlacement applicatorInfoForOwner:](&v7, sel_applicatorInfoForOwner_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IsCompact"));
  return v5;
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 7, 0, 0, 0, 1.0, 75.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  void *v7;
  id v8;
  id v9;
  double v10;
  void *v11;

  if (a4)
  {
    v7 = (void *)MEMORY[0x1E0D156E0];
    v8 = a5;
    v9 = a4;
    -[UIInputViewSetPlacementCompactAssistantOnScreen offset](self, "offset");
    objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 9, 0, v8, 9, 1.0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (double)verticalOffset
{
  double v2;

  -[UIInputViewSetPlacementCompactAssistantOnScreen offset](self, "offset");
  return v2;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

@end
