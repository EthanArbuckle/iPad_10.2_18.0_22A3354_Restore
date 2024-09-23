@implementation SUReviewsButton

- (SUReviewsButton)initWithFrame:(CGRect)a3
{
  SUReviewsButton *v3;
  SUReviewsButton *v4;
  id v5;
  uint64_t TableNext;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUReviewsButton;
  v3 = -[SUGradientButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUReviewsButton setAdjustsImageWhenDisabled:](v3, "setAdjustsImageWhenDisabled:", 0);
    -[SUReviewsButton setAdjustsImageWhenHighlighted:](v4, "setAdjustsImageWhenHighlighted:", 0);
    -[SUReviewsButton setContentHorizontalAlignment:](v4, "setContentHorizontalAlignment:", 1);
    objc_msgSend((id)-[SUReviewsButton titleLabel](v4, "titleLabel"), "setLineBreakMode:", 4);
    -[SUReviewsButton contentEdgeInsets](v4, "contentEdgeInsets");
    -[SUReviewsButton setContentEdgeInsets:](v4, "setContentEdgeInsets:");
    v5 = objc_alloc(MEMORY[0x24BDF6AE8]);
    TableNext = UIImageGetTableNext();
    v7 = objc_msgSend(v5, "initWithImage:highlightedImage:", TableNext, UIImageGetTableNextSelected());
    v4->_disclosureView = (UIImageView *)v7;
    -[SUReviewsButton addSubview:](v4, "addSubview:", v7);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton dealloc](&v3, sel_dealloc);
}

- (void)reloadView
{
  NSString *v3;
  float userRating;
  uint64_t v5;
  double v6;
  id v7;

  v3 = -[SUReviewsButton userRatingCountString](self, "userRatingCountString");
  if (!-[NSString length](v3, "length"))
  {

    v3 = (NSString *)SUCopyLocalizedReviewsStringForCount(self->_userRatingCount, 1);
  }
  -[SUReviewsButton setTitle:forState:](self, "setTitle:forState:", v3, 0);

  if (self->_userRatingCount)
  {
    userRating = self->_userRating;
    v5 = objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    *(float *)&v6 = userRating;
    v7 = +[SUUserRatingView copyImageForRating:backgroundColor:style:](SUUserRatingView, "copyImageForRating:backgroundColor:style:", v5, 1, v6);
    -[SUReviewsButton setImage:forState:](self, "setImage:forState:", v7, 0);

  }
  else
  {
    -[SUReviewsButton setImage:forState:](self, "setImage:forState:", 0, 0);
  }
}

- (void)setUserRating:(float)a3
{
  self->_userRating = a3;
  -[SUReviewsButton reloadView](self, "reloadView");
}

- (void)setUserRatingCount:(int64_t)a3
{
  self->_userRatingCount = a3;
  -[SUReviewsButton reloadView](self, "reloadView");
}

- (void)setUserRatingCountString:(id)a3
{
  NSString *userRatingCountString;

  userRatingCountString = self->_userRatingCountString;
  if (userRatingCountString != a3)
  {

    self->_userRatingCountString = (NSString *)a3;
    -[SUReviewsButton reloadView](self, "reloadView");
  }
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton contentRectForBounds:](&v24, sel_contentRectForBounds_);
  v9 = v8;
  v23 = v10;
  v12 = v11;
  v14 = v13;
  -[SUReviewsButton contentEdgeInsets](self, "contentEdgeInsets");
  v16 = v15;
  if (-[SUReviewsButton titleForState:](self, "titleForState:", 0)
    && -[SUReviewsButton imageForState:](self, "imageForState:", 0))
  {
    v12 = v12 + 10.0;
  }
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v17 = CGRectGetMaxX(v25) - v16;
  -[UIImageView frame](self->_disclosureView, "frame");
  if (v12 >= v17 - v18 + -10.0 - v9)
    v19 = v17 - v18 + -10.0 - v9;
  else
    v19 = v12;
  v20 = v9;
  v21 = v23;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v19;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIImageView *disclosureView;
  uint64_t v18;
  objc_super v19;
  CGRect v20;

  if (self->_disclosureView)
  {
    -[SUReviewsButton bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SUReviewsButton contentEdgeInsets](self, "contentEdgeInsets");
    v12 = v11;
    -[UIImageView frame](self->_disclosureView, "frame");
    v14 = v13;
    v16 = v15;
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", CGRectGetMaxX(v20) - v12 - v14, 17.0, v14, v16);
    disclosureView = self->_disclosureView;
    if ((-[SUReviewsButton isHighlighted](self, "isHighlighted") & 1) != 0)
      v18 = 1;
    else
      v18 = -[SUReviewsButton isSelected](self, "isSelected");
    -[UIImageView setHighlighted:](disclosureView, "setHighlighted:", v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton layoutSubviews](&v19, sel_layoutSubviews);
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  objc_super v24;
  CGRect v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton imageRectForContentRect:](&v24, sel_imageRectForContentRect_);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v23.receiver = self;
  v23.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton titleRectForContentRect:](&v23, sel_titleRectForContentRect_, x, y, width, height);
  v15 = x + v14 + 10.0;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v16 = CGRectGetMaxX(v25) - v11;
  if (v15 >= v16)
    v17 = v16;
  else
    v17 = v15;
  +[SUUserRatingView reflectionHeight](SUUserRatingView, "reflectionHeight");
  *(float *)&v18 = v18 * 0.5;
  v19 = v9 + floorf(*(float *)&v18);
  v20 = v17;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v19;
  result.origin.x = v20;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  CGFloat x;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton titleRectForContentRect:](&v8, sel_titleRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = x;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (float)userRating
{
  return self->_userRating;
}

- (int64_t)userRatingCount
{
  return self->_userRatingCount;
}

- (NSString)userRatingCountString
{
  return self->_userRatingCountString;
}

@end
