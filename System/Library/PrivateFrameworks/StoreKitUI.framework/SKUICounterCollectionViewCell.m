@implementation SKUICounterCollectionViewCell

- (SKUICounterCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUICounterCollectionViewCell *v8;
  SKUICounterView *v9;
  uint64_t v10;
  SKUICounterView *counterView;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICounterCollectionViewCell initWithFrame:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUICounterCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUICounterView alloc];
    -[SKUICounterCollectionViewCell bounds](v8, "bounds");
    v10 = -[SKUIViewReuseView initWithFrame:](v9, "initWithFrame:");
    counterView = v8->_counterView;
    v8->_counterView = (SKUICounterView *)v10;

    -[SKUICounterCollectionViewCell contentView](v8, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v8->_counterView);

  }
  return v8;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[SKUICounterView setContentInset:](self->_counterView, "setContentInset:");
}

- (void)applyLayoutAttributes:(id)a3
{
  SKUICounterView *counterView;
  id v5;
  void *v6;
  objc_super v7;

  counterView = self->_counterView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewReuseView setBackgroundColor:](counterView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SKUICounterCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SKUICounterView prefetchResourcesForViewElement:reason:context:](SKUICounterView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SKUICounterView requestLayoutForViewElement:width:context:](SKUICounterView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SKUICounterView reloadWithViewElement:width:context:](self->_counterView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SKUICounterView sizeThatFitsWidth:viewElement:context:](SKUICounterView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUICounterView setImage:forArtworkRequest:context:](self->_counterView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SKUICounterView updateWithItemState:context:animated:](self->_counterView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SKUICounterView viewForElementIdentifier:](self->_counterView, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SKUICounterView *counterView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUICounterCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  counterView = self->_counterView;
  -[SKUICounterCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SKUICounterView setFrame:](counterView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SKUICounterView *counterView;
  id v5;
  objc_super v6;

  counterView = self->_counterView;
  v5 = a3;
  -[SKUIViewReuseView setBackgroundColor:](counterView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUICounterCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUICounterCollectionViewCell;
  -[SKUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[SKUICounterCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUICounterCollectionViewCell;
  -[SKUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[SKUICounterCollectionViewCell _reloadHighlightImageView](self, "_reloadHighlightImageView");
}

- (void)_reloadHighlightImageView
{
  SKUICounterView *counterView;
  uint64_t v4;
  void *v5;
  SKUICounterView *v6;
  SKUIImageView *highlightImageView;
  SKUIImageView *v8;
  SKUIImageView *v9;
  SKUIImageView *v10;
  void *v11;
  SKUIImageView *v12;
  SKUIImageView *v13;
  void *v14;
  void *v15;
  void *v16;
  SKUIImageView *v17;
  void *v18;
  SKUIImageView *v19;
  SKUIImageView *v20;
  SKUIImageView *v21;
  void *v22;
  SKUIImageView *v23;
  _QWORD v24[4];
  SKUIImageView *v25;
  _OWORD v26[3];
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  if ((-[SKUICounterCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SKUICounterCollectionViewCell isSelected](self, "isSelected"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__97;
    v33 = __Block_byref_object_dispose__97;
    v34 = 0;
    counterView = self->_counterView;
    v4 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke;
    v28[3] = &unk_1E73A1FB0;
    v28[4] = &v29;
    -[SKUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](counterView, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6CF0, v28);
    v5 = (void *)v30[5];
    if (v5)
      goto LABEL_5;
    v6 = self->_counterView;
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_2;
    v27[3] = &unk_1E73A1FB0;
    v27[4] = &v29;
    -[SKUIViewReuseView enumerateExistingViewsForReuseIdentifier:usingBlock:](v6, "enumerateExistingViewsForReuseIdentifier:usingBlock:", 0x1E73B6F10, v27);
    v5 = (void *)v30[5];
    if (v5)
    {
LABEL_5:
      highlightImageView = self->_highlightImageView;
      if (!highlightImageView)
      {
        v8 = objc_alloc_init(SKUIImageView);
        v9 = self->_highlightImageView;
        self->_highlightImageView = v8;

        -[SKUIImageView setAlpha:](self->_highlightImageView, "setAlpha:", 0.300000012);
        v10 = self->_highlightImageView;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIImageView setBackgroundColor:](v10, "setBackgroundColor:", v11);

        highlightImageView = self->_highlightImageView;
        v5 = (void *)v30[5];
      }
      objc_msgSend(v5, "bounds");
      -[SKUIImageView setBounds:](highlightImageView, "setBounds:");
      v12 = self->_highlightImageView;
      objc_msgSend((id)v30[5], "center");
      -[SKUIImageView setCenter:](v12, "setCenter:");
      v13 = self->_highlightImageView;
      objc_msgSend((id)v30[5], "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_flatImageWithColor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIImageView setImage:](v13, "setImage:", v16);

      v17 = self->_highlightImageView;
      v18 = (void *)v30[5];
      if (v18)
        objc_msgSend(v18, "transform");
      else
        memset(v26, 0, sizeof(v26));
      -[SKUIImageView setTransform:](v17, "setTransform:", v26);
      -[SKUICounterView insertSubview:aboveSubview:](self->_counterView, "insertSubview:aboveSubview:", self->_highlightImageView, v30[5]);
    }
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v19 = self->_highlightImageView;
    if (v19)
    {
      v20 = v19;
      v21 = self->_highlightImageView;
      self->_highlightImageView = 0;

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v22 = (void *)MEMORY[0x1E0CD28B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_3;
      v24[3] = &unk_1E739FD38;
      v25 = v20;
      v23 = v20;
      objc_msgSend(v22, "setCompletionBlock:", v24);
      -[SKUIImageView setAlpha:](v23, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    }
  }
}

void __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

void __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

uint64_t __58__SKUICounterCollectionViewCell__reloadHighlightImageView__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightImageView, 0);
  objc_storeStrong((id *)&self->_counterView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICounterCollectionViewCell initWithFrame:]";
}

@end
