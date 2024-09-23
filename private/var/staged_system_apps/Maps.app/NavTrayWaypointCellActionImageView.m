@implementation NavTrayWaypointCellActionImageView

- (NavTrayWaypointCellActionImageView)initWithImage:(id)a3 style:(id)a4 weight:(double)a5 sideLength:(double)a6
{
  id v11;
  id v12;
  NavTrayWaypointCellActionImageView *v13;
  NavTrayWaypointCellActionImageView *v14;
  void *v15;
  void *v16;
  id v17;
  UIImage *image;
  void *v19;
  void *v20;
  UIImageView *v21;
  UIImageView *imageView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v35;
  id v36;
  objc_super v37;
  _QWORD v38[2];

  v11 = a3;
  v12 = a4;
  v37.receiver = self;
  v37.super_class = (Class)NavTrayWaypointCellActionImageView;
  v13 = -[NavTrayWaypointCellActionImageView initWithFrame:](&v37, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v14 = v13;
  if (v13)
  {
    v36 = v11;
    objc_storeStrong((id *)&v13->_image, a3);
    objc_storeStrong((id *)&v14->_style, a4);
    v14->_weight = a5;
    v14->_sideLength = a6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", v14->_style, v14->_weight));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryLarge));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v16));

    v17 = objc_alloc((Class)UIImageView);
    image = v14->_image;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v35));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage imageByApplyingSymbolConfiguration:](image, "imageByApplyingSymbolConfiguration:", v19));
    v21 = (UIImageView *)objc_msgSend(v17, "initWithImage:", v20);
    imageView = v14->_imageView;
    v14->_imageView = v21;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v14->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setUserInteractionEnabled:](v14->_imageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v14->_imageView, "setContentMode:", 4);
    -[NavTrayWaypointCellActionImageView addSubview:](v14, "addSubview:", v14->_imageView);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v14->_imageView, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCellActionImageView centerXAnchor](v14, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v38[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v14->_imageView, "centerYAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCellActionImageView centerYAnchor](v14, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    v38[1] = v28;
    v29 = v12;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

    v12 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    -[NavTrayWaypointCellActionImageView setBackgroundColor:](v14, "setBackgroundColor:", v31);

    v32 = v14->_sideLength * 0.5;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrayWaypointCellActionImageView layer](v14, "layer"));
    objc_msgSend(v33, "setCornerRadius:", v32);

    v11 = v36;
    -[NavTrayWaypointCellActionImageView setIsAccessibilityElement:](v14, "setIsAccessibilityElement:", 1);
    -[NavTrayWaypointCellActionImageView setAccessibilityTraits:](v14, "setAccessibilityTraits:", UIAccessibilityTraitUpdatesFrequently | UIAccessibilityTraitAllowsDirectInteraction | UIAccessibilityTraitButton | UIAccessibilityTraitImage);

  }
  return v14;
}

- (CGSize)intrinsicContentSize
{
  double sideLength;
  double v3;
  CGSize result;

  sideLength = self->_sideLength;
  v3 = sideLength;
  result.height = v3;
  result.width = sideLength;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
