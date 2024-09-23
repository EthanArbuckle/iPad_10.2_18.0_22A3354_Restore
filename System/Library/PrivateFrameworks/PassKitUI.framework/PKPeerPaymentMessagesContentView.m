@implementation PKPeerPaymentMessagesContentView

- (PKPeerPaymentMessagesContentView)initWithFrame:(CGRect)a3
{
  PKPeerPaymentMessagesContentView *v3;
  void *v4;
  _BOOL4 v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesContentView;
  v3 = -[PKPeerPaymentMessagesContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PKPeerPaymentTheme backgroundColor](PKPeerPaymentTheme, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentMessagesContentView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_contentAlignment = ($D338B265850D33B29D0E4C40C8D279D7)*MEMORY[0x1E0D69C40];
    v3->_verticalPadding = 10.0;
    v5 = -[UIView pkui_userInterfaceIdiomSupportsLargeLayouts](v3, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    v6 = 44.0;
    v3->_contentInset.top = 8.0;
    if (!v5)
      v6 = 24.0;
    v3->_contentInset.left = v6;
    v3->_contentInset.bottom = 8.0;
    v3->_contentInset.right = v6;
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double left;
  double top;
  double right;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  unsigned int verticalAlignment;
  double v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  double v39;
  double v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double v47;
  uint64_t j;
  void *v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentMessagesContentView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PKPeerPaymentMessagesContentView bounds](self, "bounds");
    v51 = v5;
    v50 = v6;
    v8 = v7;
    -[PKPeerPaymentMessagesContentView safeAreaInsets](self, "safeAreaInsets");
    v12 = v11;
    v14 = v13;
    if (self->_ignoreTopSafeArea)
      v15 = 0.0;
    else
      v15 = v9;
    top = self->_contentInset.top;
    left = self->_contentInset.left;
    right = self->_contentInset.right;
    v19 = v8 - (v10 + v15) - (top + self->_contentInset.bottom);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    -[PKPeerPaymentMessagesContentView subviews](self, "subviews", &self->_contentInset);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v21)
    {
      v22 = v21;
      v23 = v50 - (v12 + v14) - (left + right);
      v24 = top + v51 + v15;
      v25 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v61 != v25)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v27, "sizeThatFits:", v23, v19);
          v29 = v28;
          if (objc_msgSend(v27, "isHidden"))
            v29 = 0.0 - self->_verticalPadding;
          if ((self->_contentAlignment.verticalAlignment & 0xFFFFFFFD) == 1)
            verticalAlignment = 0;
          else
            verticalAlignment = self->_contentAlignment.verticalAlignment;
          PKSizeAlignedInRect();
          objc_msgSend(v27, "setFrame:");
          v31 = -0.0;
          if (!verticalAlignment)
            v31 = v29 + self->_verticalPadding;
          v24 = v24 + v31;
          v19 = v19 - (v29 + self->_verticalPadding);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v22);
    }

    v32 = self->_contentAlignment.verticalAlignment;
    if (v32 == 3)
    {
      -[PKPeerPaymentMessagesContentView bounds](self, "bounds");
      v40 = v39;
      -[PKPeerPaymentMessagesContentView subviews](self, "subviews");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count");

      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[PKPeerPaymentMessagesContentView subviews](self, "subviews");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      if (v43)
      {
        v44 = v43;
        v45 = v40 / (double)v42;
        v46 = *(_QWORD *)v53;
        v47 = 0.0;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v53 != v46)
              objc_enumerationMutation(v33);
            v49 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            if ((objc_msgSend(v49, "isHidden") & 1) == 0)
            {
              objc_msgSend(v49, "frame");
              objc_msgSend(v49, "setFrame:");
              v47 = v45 + v47;
            }
          }
          v44 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        }
        while (v44);
      }
    }
    else
    {
      if (v32 != 1)
        return;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[PKPeerPaymentMessagesContentView subviews](self, "subviews");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v57 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
            if ((objc_msgSend(v38, "isHidden") & 1) == 0)
            {
              objc_msgSend(v38, "frame");
              objc_msgSend(v38, "setFrame:");
            }
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v35);
      }
    }

  }
}

- (UILabel)label
{
  UILabel *label;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;

  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PKPeerPaymentMessagesContentView bounds](self, "bounds");
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_label;
    self->_label = v5;

    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    v7 = self->_label;
    +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    v9 = self->_label;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    -[PKPeerPaymentMessagesContentView addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (UIActivityIndicatorView)activityIndicator
{
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;

  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    v6 = self->_activityIndicator;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v6, "setColor:", v7);

    -[PKPeerPaymentMessagesContentView addSubview:](self, "addSubview:", self->_activityIndicator);
    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (PKPeerPaymentMessagesRoundedButton)button
{
  PKPeerPaymentMessagesRoundedButton *button;
  PKPeerPaymentMessagesRoundedButton *v4;
  PKPeerPaymentMessagesRoundedButton *v5;

  button = self->_button;
  if (!button)
  {
    v4 = objc_alloc_init(PKPeerPaymentMessagesRoundedButton);
    v5 = self->_button;
    self->_button = v4;

    -[PKPeerPaymentMessagesContentView addSubview:](self, "addSubview:", self->_button);
    button = self->_button;
  }
  return button;
}

- (UIImageView)imageView
{
  UIImageView *imageView;
  id v4;
  UIImageView *v5;
  UIImageView *v6;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PKPeerPaymentMessagesContentView bounds](self, "bounds");
    v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_imageView;
    self->_imageView = v5;

    -[PKPeerPaymentMessagesContentView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- ($85CD2974BE96D4886BB301820D1C36C2)contentAlignment
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_contentAlignment;
}

- (void)setContentAlignment:(id)a3
{
  self->_contentAlignment = ($D338B265850D33B29D0E4C40C8D279D7)a3;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (BOOL)ignoreTopSafeArea
{
  return self->_ignoreTopSafeArea;
}

- (void)setIgnoreTopSafeArea:(BOOL)a3
{
  self->_ignoreTopSafeArea = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
