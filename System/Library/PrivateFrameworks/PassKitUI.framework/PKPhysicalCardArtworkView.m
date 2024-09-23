@implementation PKPhysicalCardArtworkView

- (PKPhysicalCardArtworkView)initWithFrame:(CGRect)a3
{
  PKPhysicalCardArtworkView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *artworkImageView;
  UILabel *v8;
  UILabel *nameLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKPhysicalCardArtworkView;
  v3 = -[PKPhysicalCardArtworkView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIImageNamed(CFSTR("PhysicalCard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithImage:", v5);
    artworkImageView = v3->_artworkImageView;
    v3->_artworkImageView = (UIImageView *)v6;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_artworkImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIImageView setContentMode:](v3->_artworkImageView, "setContentMode:", 1);
    -[PKPhysicalCardArtworkView addSubview:](v3, "addSubview:", v3->_artworkImageView);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v8;

    v10 = v3->_nameLabel;
    PKRoundedSystemFontOfSizeAndWeight(16.0, *MEMORY[0x1E0DC1420]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = v3->_nameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_nameLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v3->_nameLabel, "setMinimumScaleFactor:", 0.2);
    -[UILabel setNumberOfLines:](v3->_nameLabel, "setNumberOfLines:", 1);
    -[UIImageView addSubview:](v3->_artworkImageView, "addSubview:", v3->_nameLabel);
  }
  return v3;
}

- (void)setArtworkImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_artworkImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_artworkImage, a3);
    -[UIImageView setImage:](self->_artworkImageView, "setImage:", self->_artworkImage);
    -[PKPhysicalCardArtworkView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setNameOnCard:(id)a3
{
  NSString *v4;
  NSString *nameOnCard;

  if (self->_nameOnCard != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    nameOnCard = self->_nameOnCard;
    self->_nameOnCard = v4;

    -[UILabel setText:](self->_nameLabel, "setText:", self->_nameOnCard);
    -[UILabel sizeToFit](self->_nameLabel, "sizeToFit");
    -[PKPhysicalCardArtworkView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPhysicalCardArtworkView;
  -[PKPhysicalCardArtworkView layoutSubviews](&v6, sel_layoutSubviews);
  -[PKPhysicalCardArtworkView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_artworkImageView, "setFrame:");
  -[UILabel font](self->_nameLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = v4;

  -[UILabel setFrame:](self->_nameLabel, "setFrame:", 26.0, 110.0, 188.0, v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  PKPassFrontFaceContentSize();
  v4 = 300.0 / v3;
  v5 = v3 * (300.0 / v3);
  v7 = v6 * v4;
  result.height = v7;
  result.width = v5;
  return result;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
}

@end
