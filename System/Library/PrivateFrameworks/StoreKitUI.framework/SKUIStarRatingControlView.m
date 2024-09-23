@implementation SKUIStarRatingControlView

- (SKUIStarRatingControlView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIStarRatingControlView *v16;
  SKUIStarRatingControlView *v17;
  SKUIStarRatingControl *v18;
  SKUIStarRatingControl *control;
  void *v20;
  void *v21;
  uint64_t v22;
  UIImage *emptyStars;
  SKUIStarRatingControl *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIStarRatingControlView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SKUIStarRatingControlView;
  v16 = -[SKUIStarRatingControlView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    -[SKUIStarRatingControlView setContentMode:](v16, "setContentMode:", 3);
    v18 = objc_alloc_init(SKUIStarRatingControl);
    control = v17->_control;
    v17->_control = v18;

    -[SKUIStarRatingControlView addSubview:](v17, "addSubview:", v17->_control);
    v20 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageNamed:inBundle:", CFSTR("LightRateControl"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    emptyStars = v17->_emptyStars;
    v17->_emptyStars = (UIImage *)v22;

    -[SKUIStarRatingControl setEmptyStarsImage:](v17->_control, "setEmptyStarsImage:", v17->_emptyStars);
    v24 = v17->_control;
    v25 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageNamed:inBundle:", CFSTR("RateControlFilled"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStarRatingControl setFilledStarsImage:](v24, "setFilledStarsImage:", v27);

    -[SKUIStarRatingControl sizeToFit](v17->_control, "sizeToFit");
    -[SKUIStarRatingControl addTarget:action:forControlEvents:](v17->_control, "addTarget:action:forControlEvents:", v17, sel_didRating_, 64);
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIStarRatingControl removeTarget:action:forControlEvents:](self->_control, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUIStarRatingControlView;
  -[SKUIStarRatingControlView dealloc](&v3, sel_dealloc);
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIStarRatingControlView prefetchResourcesForViewElement:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIStarRatingControlView preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v5)
      +[SKUIStarRatingControlView requestLayoutForViewElement:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIStarRatingControlView sizeThatFitsWidth:viewElement:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (void *)MEMORY[0x1E0DC3870];
  SKUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageNamed:inBundle:", CFSTR("StarRatingControlEmpty"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  float v7;
  float v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_viewElement, a3);
  objc_msgSend(v10, "ratingValue");
  if (v7 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v10, "ratingValue");
    v9 = (uint64_t)(v8 * 5.0);
  }
  -[SKUIStarRatingControl setUserRating:](self->_control, "setUserRating:", v9);
  -[SKUIStarRatingControl setNeedsDisplay](self->_control, "setNeedsDisplay");
  -[SKUIStarRatingControlView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SKUIStarRatingControlView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUIStarRatingControlView;
  -[SKUIStarRatingControlView setEnabled:](&v5, sel_setEnabled_);
  -[SKUIStarRatingControl setEnabled:](self->_control, "setEnabled:", v3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[SKUIStarRatingControlView bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -20.0, -20.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImage size](self->_emptyStars, "size", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didRating:(id)a3
{
  SKUIStarRatingViewElement *viewElement;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  viewElement = self->_viewElement;
  if (viewElement)
  {
    v6 = CFSTR("value");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SKUIStarRatingControl userRating](self->_control, "userRating", a3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStarRatingViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v5, 0);

  }
}

- (SKUIStarRatingControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_storeStrong((id *)&self->_control, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_emptyStars, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
