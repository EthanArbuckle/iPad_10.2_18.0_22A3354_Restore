@implementation CRLiOSMultipaneSegmentedControlSegment

- (CRLiOSMultipaneSegmentedControlSegment)initWithType:(int64_t)a3 title:(id)a4 image:(id)a5 edgeInsets:(UIEdgeInsets)a6
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v14;
  id v15;
  CRLiOSMultipaneSegmentedControlSegment *v16;
  CRLiOSMultipaneSegmentedControlSegment *v17;
  uint64_t v18;
  UIImage *image;
  void *v20;
  objc_super v22;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v14 = a4;
  v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CRLiOSMultipaneSegmentedControlSegment;
  v16 = -[CRLiOSMultipaneSegmentedControlSegment init](&v22, "init");
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    objc_storeStrong((id *)&v16->_title, a4);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithRenderingMode:", 2));
    image = v17->_image;
    v17->_image = (UIImage *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accessibilityLabel"));
    -[UIImage setAccessibilityLabel:](v17->_image, "setAccessibilityLabel:", v20);

    v17->_width = 0.0;
    v17->_edgeInsets.top = top;
    v17->_edgeInsets.left = left;
    v17->_edgeInsets.bottom = bottom;
    v17->_edgeInsets.right = right;
    v17->_enabled = 1;
    -[CRLiOSMultipaneSegmentedControlSegment updateAccessibilityLabel](v17, "updateAccessibilityLabel");
  }

  return v17;
}

+ (id)segmentWithString:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  id v10;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithType:title:image:edgeInsets:", 0, v9, 0, top, left, bottom, right);

  return v10;
}

+ (id)segmentWithImage:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  id v10;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithType:title:image:edgeInsets:", 1, 0, v9, top, left, bottom, right);

  return v10;
}

+ (id)segmentWithObject:(id)a3 edgeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9 = a3;
  v11 = objc_opt_class(NSString, v10);
  v12 = sub_100221D0C(v11, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "segmentWithString:edgeInsets:", v14, top, left, bottom, right));
  }
  else
  {
    v16 = objc_opt_class(UIImage, v13);
    v17 = sub_100221D0C(v16, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (v18)
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "segmentWithImage:edgeInsets:", v18, top, left, bottom, right));
    else
      v15 = 0;

  }
  return v15;
}

- (void)setTitle:(id)a3
{
  id v5;
  UIImage *image;

  self->_type = 0;
  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  image = self->_image;
  self->_image = 0;

  -[CRLiOSMultipaneSegmentedControlSegment updateAccessibilityLabel](self, "updateAccessibilityLabel");
}

- (void)setImage:(id)a3
{
  NSString *title;
  id v5;
  UIImage *v6;
  UIImage *image;

  title = self->_title;
  self->_type = 1;
  self->_title = 0;
  v5 = a3;

  v6 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithRenderingMode:", 2));
  image = self->_image;
  self->_image = v6;

  -[CRLiOSMultipaneSegmentedControlSegment updateAccessibilityLabel](self, "updateAccessibilityLabel");
}

- (void)updateAccessibilityLabel
{
  NSString *v3;
  NSString *v4;

  if (self->_type)
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[UIImage accessibilityLabel](self->_image, "accessibilityLabel"));
  else
    v3 = self->_title;
  v4 = v3;
  -[CRLiOSMultipaneSegmentedControlSegment setAccessibilityLabel:](self, "setAccessibilityLabel:", v3);

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (NSLayoutConstraint)equalWidthConstraint
{
  return self->_equalWidthConstraint;
}

- (void)setEqualWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_equalWidthConstraint, a3);
}

- (NSLayoutXAxisAnchor)previousTrailingAnchor
{
  return (NSLayoutXAxisAnchor *)objc_loadWeakRetained((id *)&self->_previousTrailingAnchor);
}

- (void)setPreviousTrailingAnchor:(id)a3
{
  objc_storeWeak((id *)&self->_previousTrailingAnchor, a3);
}

- (NSLayoutDimension)distanceToPreviousTrailingAnchor
{
  return self->_distanceToPreviousTrailingAnchor;
}

- (void)setDistanceToPreviousTrailingAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_distanceToPreviousTrailingAnchor, a3);
}

- (NSLayoutConstraint)distanceBetweenPreviousAndNextSegmentConstraint
{
  return self->_distanceBetweenPreviousAndNextSegmentConstraint;
}

- (void)setDistanceBetweenPreviousAndNextSegmentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_distanceBetweenPreviousAndNextSegmentConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceBetweenPreviousAndNextSegmentConstraint, 0);
  objc_storeStrong((id *)&self->_distanceToPreviousTrailingAnchor, 0);
  objc_destroyWeak((id *)&self->_previousTrailingAnchor);
  objc_storeStrong((id *)&self->_equalWidthConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
