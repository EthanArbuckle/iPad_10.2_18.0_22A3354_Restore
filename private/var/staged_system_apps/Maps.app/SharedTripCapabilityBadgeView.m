@implementation SharedTripCapabilityBadgeView

- (SharedTripCapabilityBadgeView)init
{
  double y;
  double width;
  double height;
  SharedTripCapabilityBadgeView *v5;
  double v6;
  SharedTripCapabilityBadgeView *v7;
  double v8;
  double v9;
  double v10;
  AutolayoutImageView *v11;
  UIImageView *imageView;
  void *v13;
  uint64_t v14;
  NSLayoutConstraint *heightConstraint;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SharedTripCapabilityBadgeView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v5 = -[SharedTripCapabilityBadgeView initWithFrame:](&v27, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1144750080;
    -[SharedTripCapabilityBadgeView setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v8) = 1144750080;
    -[SharedTripCapabilityBadgeView setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    LODWORD(v9) = 1148846080;
    -[SharedTripCapabilityBadgeView setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 0, v9);
    LODWORD(v10) = 1148846080;
    -[SharedTripCapabilityBadgeView setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v10);
    v7->_capabilityType = 0;
    v11 = -[AutolayoutImageView initWithFrame:]([AutolayoutImageView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = &v11->super;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v7->_imageView, "setContentMode:", 1);
    -[SharedTripCapabilityBadgeView addSubview:](v7, "addSubview:", v7->_imageView);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView heightAnchor](v7, "heightAnchor"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 22.0));
    heightConstraint = v7->_heightConstraint;
    v7->_heightConstraint = (NSLayoutConstraint *)v14;

    v16 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v16, "addObject:", v7->_heightConstraint);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _maps_constraintsForCenteringInView:](v7->_imageView, "_maps_constraintsForCenteringInView:", v7));
    objc_msgSend(v16, "addObjectsFromArray:", v17);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView layer](v7, "layer"));
    objc_msgSend(v18, "setMasksToBounds:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView layer](v7, "layer"));
    objc_msgSend(v19, "setShadowOffset:", 0.0, 2.0);

    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor")));
    v21 = objc_msgSend(v20, "CGColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView layer](v7, "layer"));
    objc_msgSend(v22, "setShadowColor:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView layer](v7, "layer"));
    LODWORD(v24) = 1036831949;
    objc_msgSend(v23, "setShadowOpacity:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView layer](v7, "layer"));
    objc_msgSend(v25, "setShadowRadius:", 5.0);

    -[SharedTripCapabilityBadgeView _updateImage](v7, "_updateImage");
  }
  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SharedTripCapabilityBadgeView;
  -[SharedTripCapabilityBadgeView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");
  if (v6 == objc_msgSend(v4, "userInterfaceIdiom"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");
    v9 = objc_msgSend(v4, "userInterfaceStyle");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[SharedTripCapabilityBadgeView _updateImage](self, "_updateImage");
LABEL_6:

}

- (void)setCapabilityType:(unint64_t)a3
{
  self->_capabilityType = a3;
  -[SharedTripCapabilityBadgeView _updateImage](self, "_updateImage");
}

- (void)_updateImage
{
  void *v3;
  id v4;
  uint64_t v5;
  double v6;
  unint64_t capabilityType;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v6 = 22.0;
  if (v4 == (id)3)
    v6 = 14.0;
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", UIRoundToViewScale(self, v5, v6));
  capabilityType = self->_capabilityType;
  if (capabilityType - 2 >= 2)
  {
    if (capabilityType != 4)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v10 = (const __CFString *)MapsAppBundleId;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView traitCollection](self, "traitCollection"));
    objc_msgSend(v8, "displayScale");
    v9 = v10;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripCapabilityBadgeView traitCollection](self, "traitCollection"));
    objc_msgSend(v8, "displayScale");
    v9 = CFSTR("com.apple.MobileSMS");
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0));

LABEL_9:
  -[UIImageView setImage:](self->_imageView, "setImage:", v11);
  -[SharedTripCapabilityBadgeView _setAccessibilityIdentifier](self, "_setAccessibilityIdentifier");
  -[SharedTripCapabilityBadgeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)_setAccessibilityIdentifier
{
  unint64_t v2;
  const __CFString *v3;

  v2 = self->_capabilityType - 2;
  if (v2 > 2)
    v3 = CFSTR("SharedTripCapabilityBadge.Unknown");
  else
    v3 = off_1011B6090[v2];
  -[UIImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", v3);
}

- (unint64_t)capabilityType
{
  return self->_capabilityType;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
