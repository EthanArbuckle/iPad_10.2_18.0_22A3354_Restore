@implementation PKOrderPhysicalCardHeroView

- (PKOrderPhysicalCardHeroView)initWithFrame:(CGRect)a3
{
  PKOrderPhysicalCardHeroView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *backgroundView;
  PKPhysicalCardArtworkView *v8;
  PKPhysicalCardArtworkView *artworkView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKOrderPhysicalCardHeroView;
  v3 = -[PKOrderPhysicalCardHeroView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PKOrderPhysicalCardHeroView _backgroundImage](v3, "_backgroundImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithImage:", v5);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIImageView *)v6;

    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_backgroundView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIImageView setContentMode:](v3->_backgroundView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_backgroundView, "setClipsToBounds:", 1);
    -[PKOrderPhysicalCardHeroView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v8 = objc_alloc_init(PKPhysicalCardArtworkView);
    artworkView = v3->_artworkView;
    v3->_artworkView = v8;

    -[PKOrderPhysicalCardHeroView addSubview:](v3, "addSubview:", v3->_artworkView);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PKPhysicalCardArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", a3.width, 1.79769313e308);
  v5 = v4 + 120.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  PKPhysicalCardArtworkView *artworkView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKOrderPhysicalCardHeroView;
  -[PKOrderPhysicalCardHeroView layoutSubviews](&v8, sel_layoutSubviews);
  -[PKOrderPhysicalCardHeroView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIImageView setFrame:](self->_backgroundView, "setFrame:");
  -[PKPhysicalCardArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v4, v6);
  artworkView = self->_artworkView;
  PKSizeAlignedInRect();
  -[PKPhysicalCardArtworkView setFrame:](artworkView, "setFrame:");
}

- (id)_backgroundImage
{
  unint64_t v2;

  v2 = PKUIGetMinScreenWidthType();
  if (v2 > 0xC)
    return PKUIImageNamed(0);
  else
    return PKUIImageNamed(off_1E3E67A40[v2]);
}

- (PKPhysicalCardArtworkView)artworkView
{
  return self->_artworkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
