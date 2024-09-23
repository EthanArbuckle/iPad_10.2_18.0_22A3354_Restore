@implementation UIInputViewSetPlacementUndocked

+ (id)infoWithPoint:(CGPoint)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("Origin");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)applicatorInfoForOwner:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v23[2];
  objc_super v24;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v24.receiver = self;
  v24.super_class = (Class)UIInputViewSetPlacementUndocked;
  v5 = a3;
  -[UIInputViewSetPlacement applicatorInfoForOwner:](&v24, sel_applicatorInfoForOwner_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "inputViewSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSetPlacementUndocked heightOfInputViews:](self, "heightOfInputViews:", v8);
  v10 = v9;

  objc_msgSend(v5, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bounds");
  v13 = v12;

  v14 = 0.0;
  if (v13 != 0.0)
  {
    -[UIInputViewSetPlacementUndocked chromeBuffer](self, "chromeBuffer");
    v16 = v10 + v15;
    -[UIInputViewSetPlacement extendedHeight](self, "extendedHeight");
    *(float *)&v17 = v17 + v16;
    v18 = v13;
    v14 = fminf(*(float *)&v17, v18) / v13;
  }
  -[UIInputViewSetPlacementUndocked normalizedOffset](self, "normalizedOffset");
  v20 = 1.0 - v14;
  if (v19 < 1.0 - v14)
    v20 = v19;
  v23[0] = 0;
  *(double *)&v23[1] = -(v20 * v13);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v23, "{CGPoint=dd}");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v21, CFSTR("Origin"));

  return v7;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)placementWithUndockedOffset:(CGPoint)a3 chromeBuffer:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double y;
  double x;
  id v10;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  y = a3.y;
  x = a3.x;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setChromeBuffer:", top, left, bottom, right);
  objc_msgSend(v10, "setOffset:", x, y);
  return v10;
}

- (UIInputViewSetPlacementUndocked)initWithCoder:(id)a3
{
  id v4;
  UIInputViewSetPlacementUndocked *v5;
  UIInputViewSetPlacementUndocked *v6;
  CGPoint *p_normalizedOffset;
  void *v8;
  objc_class *v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIInputViewSetPlacementUndocked;
  v5 = -[UIInputViewSetPlacement initWithCoder:](&v17, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_normalizedOffset = &v5->_normalizedOffset;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Offset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGPointValue");
    *(_QWORD *)&p_normalizedOffset->x = v9;
    v6->_normalizedOffset.y = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Chrome"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UIEdgeInsetsValue");
    v6->_chromeBuffer.top = v12;
    v6->_chromeBuffer.left = v13;
    v6->_chromeBuffer.bottom = v14;
    v6->_chromeBuffer.right = v15;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementUndocked;
  v4 = a3;
  -[UIInputViewSetPlacement encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_normalizedOffset.x, self->_normalizedOffset.y, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Offset"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", self->_chromeBuffer.top, self->_chromeBuffer.left, self->_chromeBuffer.bottom, self->_chromeBuffer.right);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Chrome"));

}

- (void)setOffset:(CGPoint)a3
{
  double v3;
  double v4;

  v3 = fmax(fabs(a3.x), 0.0);
  if (v3 > 1.0)
    v3 = 1.0;
  v4 = fmax(fabs(a3.y), 0.0);
  if (v4 > 1.0)
    v4 = 1.0;
  -[UIInputViewSetPlacementUndocked setNormalizedOffset:](self, "setNormalizedOffset:", v3, v4);
}

+ (CGPoint)computeOffsetForOffset:(CGPoint)a3 withSize:(CGSize)a4 chromeBuffer:(UIEdgeInsets)a5 onScreenSize:(CGSize)a6
{
  double v6;
  float v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v6 = 0.0;
  if (v12 != 0.0)
  {
    v7 = a4.height + a5.top;
    v8 = v12;
    v6 = fminf(v7, v8) / v12;
  }
  v9 = 1.0 - v6;
  if (a3.y >= v9)
    a3.y = v9;
  v10 = -(a3.y * v12);
  v11 = 0.0;
  result.y = v10;
  result.x = v11;
  return result;
}

- (double)heightOfInputViews:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  objc_msgSend(v3, "inputViewBounds");
  v5 = v4;
  objc_msgSend(v3, "inputAssistantViewBounds");
  v7 = v5 + v6;
  objc_msgSend(v3, "inputAccessoryViewBounds");
  v9 = v8;

  return v7 + v9;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  void *v21;

  v8 = a5;
  if (a4)
  {
    v9 = a4;
    -[UIInputViewSetPlacementUndocked heightOfInputViews:](self, "heightOfInputViews:", a3);
    v11 = v10;
    objc_msgSend(v8, "bounds");
    v13 = v12;
    v14 = 0.0;
    if (v12 != 0.0)
    {
      -[UIInputViewSetPlacementUndocked chromeBuffer](self, "chromeBuffer");
      v16 = v11 + v15;
      -[UIInputViewSetPlacement extendedHeight](self, "extendedHeight");
      *(float *)&v17 = v17 + v16;
      v18 = v13;
      v14 = fminf(*(float *)&v17, v18) / v13;
    }
    -[UIInputViewSetPlacementUndocked normalizedOffset](self, "normalizedOffset");
    v20 = 1.0 - v14;
    if (v19 < 1.0 - v14)
      v20 = v19;
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 4, 0, v8, 4, 1.0, -(v20 * v13));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIInputViewSetPlacementUndocked;
  if (-[UIInputViewSetPlacement isEqual:](&v13, sel_isEqual_, v4))
  {
    -[UIInputViewSetPlacementUndocked normalizedOffset](self, "normalizedOffset");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "normalizedOffset");
    v11 = v8 == v10 && v6 == v9;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)inputViewWillAppear
{
  return 1;
}

- (BOOL)isUndocked
{
  return 1;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacementUndocked;
  -[UIInputViewSetPlacement remoteIntrinsicContentSizeForInputViewInSet:includingIAV:](&v8, sel_remoteIntrinsicContentSizeForInputViewInSet_includingIAV_, a3, a4);
  v7 = 1.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v7;
  result.origin.x = v4;
  return result;
}

- (UIEdgeInsets)chromeBuffer
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_chromeBuffer.top;
  left = self->_chromeBuffer.left;
  bottom = self->_chromeBuffer.bottom;
  right = self->_chromeBuffer.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setChromeBuffer:(UIEdgeInsets)a3
{
  self->_chromeBuffer = a3;
}

- (CGPoint)normalizedOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedOffset.x;
  y = self->_normalizedOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNormalizedOffset:(CGPoint)a3
{
  self->_normalizedOffset = a3;
}

@end
