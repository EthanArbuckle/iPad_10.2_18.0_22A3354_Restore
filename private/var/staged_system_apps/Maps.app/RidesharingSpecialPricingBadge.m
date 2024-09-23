@implementation RidesharingSpecialPricingBadge

- (RidesharingSpecialPricingBadge)initWithTemplateImage:(id)a3
{
  id v4;
  RidesharingSpecialPricingBadge *v5;
  void *v6;
  uint64_t v7;
  UIImage *image;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RidesharingSpecialPricingBadge;
  v5 = -[RidesharingSpecialPricingBadge init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_flatImageWithColor:", v6));
    image = v5->_image;
    v5->_image = (UIImage *)v7;

  }
  return v5;
}

- (id)badgeImageWithMaximumDimension:(double)a3
{
  return -[UIImage _maps_imageWithAspectFitScalingForMaximumDimension:](self->_image, "_maps_imageWithAspectFitScalingForMaximumDimension:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
