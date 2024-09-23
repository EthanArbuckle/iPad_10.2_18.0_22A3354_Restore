@implementation PKPassBannerLeadingView

- (PKPassBannerLeadingView)init
{

  return 0;
}

- (PKPassBannerLeadingView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKPassBannerLeadingView)initWithCoder:(id)a3
{

  return 0;
}

- (id)_initWithStyle:(void *)a3 pass:
{
  id *result;
  id *v7;
  id *v8;
  PKPassThumbnailView *v9;
  id v10;
  objc_super v11;

  result = a3;
  v7 = result;
  if (!a1)
  {
LABEL_7:

    return a1;
  }
  if (result)
  {
    v11.receiver = a1;
    v11.super_class = (Class)PKPassBannerLeadingView;
    v8 = (id *)objc_msgSendSuper2(&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    a1 = v8;
    if (v8)
    {
      v8[52] = a2;
      objc_storeStrong(v8 + 53, a3);
      v9 = [PKPassThumbnailView alloc];
      if (v9)
        v9 = (PKPassThumbnailView *)-[PKPassThumbnailView initWithPass:suppressedContent:rendererState:options:](v9, a1[53], 375, 0, 0);
      v10 = a1[54];
      a1[54] = v9;

      -[PKPassThumbnailView setShadowVisibility:]((uint64_t)a1[54], 0.0);
      objc_msgSend(a1, "addSubview:", a1[54]);
    }
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t style;
  PKPassThumbnailView *passView;
  double v5;
  double v6;
  double v7;
  CGSize result;

  style = self->_style;
  passView = self->_passView;
  v5 = 15.0;
  if (style != 1)
    v5 = 63.0;
  -[PKPassThumbnailView sizeThatFits:](passView, "sizeThatFits:", 1.79769313e308, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  PKPassThumbnailView *passView;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassBannerLeadingView;
  -[PKPassBannerLeadingView layoutSubviews](&v6, sel_layoutSubviews);
  -[PKPassBannerLeadingView bounds](self, "bounds");
  passView = self->_passView;
  -[PKPassThumbnailView sizeThatFits:](passView, "sizeThatFits:", v4, v5);
  PKSizeAlignedInRect();
  -[PKPassThumbnailView setFrame:](passView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
