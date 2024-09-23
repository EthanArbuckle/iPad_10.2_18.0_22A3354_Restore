@implementation PKDiscoveryInlineCaptionedMediaShelfView

- (PKDiscoveryInlineCaptionedMediaShelfView)initWithShelf:(id)a3 mediaView:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PKDiscoveryInlineCaptionedMediaShelfView *v13;
  PKDiscoveryInlineCaptionedMediaShelfView *v14;
  uint64_t v15;
  PKDiscoveryMedia *media;
  uint64_t v17;
  UIView *mediaContainerView;
  id *p_mediaView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  PKDiscoveryInlineMediaCaptionView *v27;
  PKDiscoveryInlineMediaCaptionView *captionView;
  void *v29;
  double v30;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PKDiscoveryInlineCaptionedMediaShelfView;
  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v13 = -[PKDiscoveryShelfView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_shelf, a3);
    v14->_isInline = -[PKDiscoveryInlineMediaShelf displayType](v14->_shelf, "displayType") == 1;
    objc_msgSend(v7, "media");
    v15 = objc_claimAutoreleasedReturnValue();
    media = v14->_media;
    v14->_media = (PKDiscoveryMedia *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v9, v10, v11, v12);
    mediaContainerView = v14->_mediaContainerView;
    v14->_mediaContainerView = (UIView *)v17;

    -[UIView setClipsToBounds:](v14->_mediaContainerView, "setClipsToBounds:", 1);
    -[PKDiscoveryInlineCaptionedMediaShelfView addSubview:](v14, "addSubview:", v14->_mediaContainerView);
    if (v14->_isInline)
      -[UIView _setContinuousCornerRadius:](v14->_mediaContainerView, "_setContinuousCornerRadius:", 8.0);
    p_mediaView = (id *)&v14->_mediaView;
    objc_storeStrong((id *)&v14->_mediaView, a4);
    v20 = (void *)MEMORY[0x1E0DC3658];
    -[PKDiscoveryMedia backgroundColor](v14->_media, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pkui_colorWithPKColor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;

    objc_msgSend(*p_mediaView, "setBackgroundColor:", v25);
    -[UIView addSubview:](v14->_mediaContainerView, "addSubview:", *p_mediaView);
    objc_msgSend(*p_mediaView, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(v7, "localizedCaption");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = -[PKDiscoveryInlineMediaCaptionView initWithCaptionText:]([PKDiscoveryInlineMediaCaptionView alloc], "initWithCaptionText:", v26);
      captionView = v14->_captionView;
      v14->_captionView = v27;

    }
    -[UIView addSubview:](v14->_mediaContainerView, "addSubview:", v14->_captionView);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lineHeight");
    v14->_leadingSpace = v30;

  }
  return v14;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  PKDiscoveryInlineMediaCaptionView *captionView;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  width = a3.width;
  if (self->_isInline)
  {
    -[PKDiscoveryShelfView contentInsets](self, "contentInsets", a3.width, a3.height);
    width = width - (v5 + v6);
  }
  v7 = *MEMORY[0x1E0C9D820];
  -[PKDiscoveryInlineMediaShelf media](self->_shelf, "media");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "width");
  v10 = v9;
  objc_msgSend(v8, "height");
  if (v11 > 0.0 && v10 > 0.0)
    v7 = width;
  captionView = self->_captionView;
  if (captionView)
    -[PKDiscoveryInlineMediaCaptionView sizeThatFits:](captionView, "sizeThatFits:", v7, 1.79769313e308);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lineHeight");

  PKSizeRoundToPixel();
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  PKDiscoveryInlineMediaCaptionView *captionView;
  objc_super v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryInlineCaptionedMediaShelfView;
  -[PKDiscoveryShelfView setContentInsets:](&v9, sel_setContentInsets_);
  captionView = self->_captionView;
  if (captionView)
    -[PKDiscoveryShelfView setContentInsets:](captionView, "setContentInsets:", top, left, bottom, right);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  PKDiscoveryInlineMediaCaptionView *captionView;
  double v23;
  objc_super v24;
  CGRect v25;

  v24.receiver = self;
  v24.super_class = (Class)PKDiscoveryInlineCaptionedMediaShelfView;
  -[PKDiscoveryInlineCaptionedMediaShelfView layoutSubviews](&v24, sel_layoutSubviews);
  -[PKDiscoveryInlineCaptionedMediaShelfView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKDiscoveryShelfView contentInsets](self, "contentInsets");
  v8 = v7;
  v10 = v9;
  -[PKDiscoveryInlineMediaShelf media](self->_shelf, "media");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v8 + v10;
  v14 = 0.0;
  if (!self->_isInline)
    v13 = 0.0;
  v15 = v6 - v13;
  if (self->_isInline)
    v16 = v8;
  else
    v16 = -0.0;
  objc_msgSend(v11, "width");
  v18 = v17;
  objc_msgSend(v12, "height");
  v20 = 0.0;
  if (v19 > 0.0 && v18 > 0.0)
    v20 = v19 * (v15 / v18);
  v21 = v4 + v16;
  captionView = self->_captionView;
  if (captionView)
  {
    -[PKDiscoveryInlineMediaCaptionView sizeThatFits:](captionView, "sizeThatFits:", v15, 1.79769313e308);
    v14 = v23;
  }
  -[UIView setFrame:](self->_mediaContainerView, "setFrame:", v21, self->_leadingSpace, v15, v20 + v14);
  -[UIView setFrame:](self->_mediaView, "setFrame:", 0.0, 0.0, v15, v20);
  if (self->_captionView)
  {
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = v15;
    v25.size.height = v20;
    -[PKDiscoveryInlineMediaCaptionView setFrame:](self->_captionView, "setFrame:", 0.0, CGRectGetMaxY(v25), v15, v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_captionView, 0);
  objc_storeStrong((id *)&self->_mediaContainerView, 0);
  objc_storeStrong((id *)&self->_shelf, 0);
}

@end
