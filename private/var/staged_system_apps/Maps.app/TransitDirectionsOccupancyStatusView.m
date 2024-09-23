@implementation TransitDirectionsOccupancyStatusView

- (TransitDirectionsOccupancyStatusView)initWithFrame:(CGRect)a3
{
  TransitDirectionsOccupancyStatusView *v3;
  TransitDirectionsOccupancyStatusView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsOccupancyStatusView;
  v3 = -[TransitDirectionsBoardingInfoStackView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_occupancyStatus = 0;
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[TransitDirectionsOccupancyStatusView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[TransitDirectionsOccupancyStatusView _updateContent](v4, "_updateContent");
  }
  return v4;
}

- (id)topView
{
  UIImageView *imageView;
  AutolayoutImageView *v4;
  UIImageView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = -[AutolayoutImageView initWithFrame:]([AutolayoutImageView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_imageView;
    self->_imageView = &v4->super;

    -[UIImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
    LODWORD(v6) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_imageView, "setContentHuggingPriority:forAxis:", 0, v6);
    LODWORD(v7) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_imageView, "setContentHuggingPriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_imageView, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    LODWORD(v9) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_imageView, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_imageView, "heightAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 20.0));
    objc_msgSend(v11, "setActive:", 1);

    -[TransitDirectionsOccupancyStatusView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  return imageView;
}

- (id)bottomView
{
  UILabel *label;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  label = self->_label;
  if (!label)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_label;
    self->_label = v4;

    -[UILabel setAccessibilityIdentifier:](self->_label, "setAccessibilityIdentifier:", CFSTR("Label"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_label, "setAdjustsFontForContentSizeCategory:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_label, "setTextColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[UILabel setFont:](self->_label, "setFont:", v7);

    -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 2);
    LODWORD(v8) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_label, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    LODWORD(v9) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_label, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    LODWORD(v10) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_label, "setContentHuggingPriority:forAxis:", 1, v10);
    LODWORD(v11) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](self->_label, "setContentHuggingPriority:forAxis:", 0, v11);
    -[TransitDirectionsOccupancyStatusView addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (void)setOccupancyStatus:(int64_t)a3
{
  if (self->_occupancyStatus != a3)
  {
    self->_occupancyStatus = a3;
    -[TransitDirectionsOccupancyStatusView _updateContent](self, "_updateContent");
  }
}

- (void)_updateContent
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;

  switch(-[TransitDirectionsOccupancyStatusView occupancyStatus](self, "occupancyStatus"))
  {
    case 0:
      v7 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("transit-occupancy-nodata")));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Transit Occupancy Status: Unknown");
      goto LABEL_8;
    case 1:
      v7 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("transit-occupancy-notcrowded")));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Transit Occupancy Status: Not Crowded");
      goto LABEL_8;
    case 2:
      v7 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("transit-occupancy-crowded")));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Transit Occupancy Status: Crowded");
      goto LABEL_8;
    case 3:
      v7 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("transit-occupancy-verycrowded")));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Transit Occupancy Status: Very Crowded");
      goto LABEL_8;
    case 4:
      v7 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("transit-occupancy-full")));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Transit Occupancy Status: Full");
LABEL_8:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      -[UIImageView setImage:](self->_imageView, "setImage:", v7);
      break;
    default:
      v7 = 0;
      v6 = 0;
      -[UIImageView setImage:](self->_imageView, "setImage:", 0);
      break;
  }
  -[UILabel setText:](self->_label, "setText:", v6);

}

- (int64_t)occupancyStatus
{
  return self->_occupancyStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
