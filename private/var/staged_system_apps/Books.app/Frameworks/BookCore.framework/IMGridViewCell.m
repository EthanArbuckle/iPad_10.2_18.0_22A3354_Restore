@implementation IMGridViewCell

- (IMGridViewCell)initWithFrame:(CGRect)a3
{
  IMGridViewCell *v3;
  IMGridViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMGridViewCell;
  v3 = -[IMGridViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[IMGridViewCell prepareForReuse](v3, "prepareForReuse");
    -[IMGridViewCell setHidden:](v4, "setHidden:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIImageView removeObserver:forKeyPath:](self->_imageView, "removeObserver:forKeyPath:", self, CFSTR("image"));
  self->_showSelectionView = 1;
  v3.receiver = self;
  v3.super_class = (Class)IMGridViewCell;
  -[IMGridViewCell dealloc](&v3, "dealloc");
}

- (void)setHidden:(BOOL)a3
{
  objc_super v3;

  if (!self->_ignoreChangesToHidden)
  {
    v3.receiver = self;
    v3.super_class = (Class)IMGridViewCell;
    -[IMGridViewCell setHidden:](&v3, "setHidden:", a3);
  }
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMGridViewCell;
  v3 = -[IMGridViewCell description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell title](self, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ Title:%@"), v4, v5));

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (self->_imageView == a6)
  {
    -[IMGridViewCell setNeedsLayout](self, "setNeedsLayout", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IMGridViewCell;
    -[IMGridViewCell observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (UIImageView)badgeView
{
  UIImageView *badgeView;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *v11;
  void *v12;

  badgeView = self->_badgeView;
  if (!badgeView)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = IMCommonCoreBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell traitCollection](self, "traitCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("TVBadge.png"), v6, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stretchableImageWithLeftCapWidth:topCapHeight:", 15, 0));
    v10 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v9);
    v11 = self->_badgeView;
    self->_badgeView = v10;

    -[UIImageView setFrame:](self->_badgeView, "setFrame:", 0.0, 0.0, 31.0, 31.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
    objc_msgSend(v12, "addSubview:", self->_badgeView);

    badgeView = self->_badgeView;
  }
  return badgeView;
}

- (UILabel)badgeLabel
{
  UILabel *badgeLabel;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  badgeLabel = self->_badgeLabel;
  if (!badgeLabel)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell badgeView](self, "badgeView"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", v6, v8, v10, v12);
    v14 = self->_badgeLabel;
    self->_badgeLabel = v13;

    -[UILabel setTextAlignment:](self->_badgeLabel, "setTextAlignment:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
    -[UILabel setFont:](self->_badgeLabel, "setFont:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_badgeLabel, "setTextColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_badgeLabel, "setBackgroundColor:", v17);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_badgeLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_badgeLabel, "setMinimumScaleFactor:", 0.47);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell badgeView](self, "badgeView"));
    objc_msgSend(v18, "addSubview:", self->_badgeLabel);

    badgeLabel = self->_badgeLabel;
  }
  return badgeLabel;
}

- (void)setBadgeLabelNumber:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "intValue"))
  {
    v4 = objc_alloc((Class)NSString);
    v5 = IMCommonCoreBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v8 = objc_msgSend(v4, "initWithFormat:", v7, v9);

  }
  else
  {
    v8 = 0;
  }
  -[IMGridViewCell setBadgeText:](self, "setBadgeText:", v8);

}

- (void)setBadgeText:(id)a3
{
  id v5;
  void *v6;
  _BOOL8 v7;

  if (a3)
  {
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell badgeLabel](self, "badgeLabel"));
    objc_msgSend(v6, "setText:", v5);

    -[IMGridViewCell setNeedsLayout](self, "setNeedsLayout");
  }
  v7 = a3 == 0;
  -[UIImageView setHidden:](self->_badgeView, "setHidden:", v7);
  -[UILabel setHidden:](self->_badgeLabel, "setHidden:", v7);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIButton *closeBox;
  BOOL v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  closeBox = self->_closeBox;
  -[UIButton convertPoint:fromView:](closeBox, "convertPoint:fromView:", self, x, y);
  if ((-[UIButton pointInside:withEvent:](closeBox, "pointInside:withEvent:", v7) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IMGridViewCell;
    v9 = -[IMGridViewCell pointInside:withEvent:](&v11, "pointInside:withEvent:", v7, x, y);
  }

  return v9;
}

- (UIView)contentView
{
  UIView *contentView;
  id v4;
  UIView *v5;
  UIView *v6;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_alloc((Class)UIView);
    -[IMGridViewCell bounds](self, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_contentView;
    self->_contentView = v5;

    -[UIView setAccessibilityIgnoresInvertColors:](self->_contentView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
    -[IMGridViewCell addSubview:](self, "addSubview:", self->_contentView);
    contentView = self->_contentView;
  }
  return contentView;
}

- (BOOL)useMaskForHighlightView
{
  return self->_useMaskForHighlightView;
}

- (void)setUseMaskForHighlightView:(BOOL)a3
{
  if (-[IMGridViewCell useMaskForHighlightView](self, "useMaskForHighlightView") != a3)
  {
    self->_useMaskForHighlightView = a3;
    -[IMGridViewCell _removeHighlightView](self, "_removeHighlightView");
  }
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  self->_highlighted = a3;
  -[UIImageView setHighlighted:](self->_imageView, "setHighlighted:");
  if (v3)
  {
    if (self->_showSelectionView)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell highlightView](self, "highlightView"));
      objc_msgSend(v5, "setHidden:", 0);

    }
  }
  else
  {
    -[IMGridViewCell _removeHighlightView](self, "_removeHighlightView");
  }
  -[IMGridViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isWorking
{
  return self->_working;
}

- (void)setWorking:(BOOL)a3
{
  void *v4;
  UIActivityIndicatorView *workingView;

  self->_working = a3;
  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell workingView](self, "workingView"));
    objc_msgSend(v4, "startAnimating");

  }
  else
  {
    workingView = self->_workingView;
    if (workingView)
    {
      -[UIActivityIndicatorView stopAnimating](workingView, "stopAnimating");
      -[IMGridViewCell _removeWorkingView](self, "_removeWorkingView");
    }
  }
  -[IMGridViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  id v6;

  if (self->_title != a3)
  {
    v6 = a3;
    v4 = (NSString *)objc_msgSend(v6, "copy");
    title = self->_title;
    self->_title = v4;

    -[UILabel setText:](self->_textLabel, "setText:", v6);
  }
}

- (UIImageView)imageView
{
  UIImageView *imageView;

  imageView = self->_imageView;
  if (!imageView)
  {
    -[IMGridViewCell loadImageView](self, "loadImageView");
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)loadImageView
{
  UIImageView *v3;
  UIImageView *imageView;
  uint64_t v5;
  void *v6;

  v3 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  imageView = self->_imageView;
  self->_imageView = v3;

  if (-[IMGridViewCell imageGravity](self, "imageGravity") == 1)
    v5 = 4;
  else
    v5 = 1;
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v5);
  -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 0);
  -[UIImageView setOpaque:](self->_imageView, "setOpaque:", 1);
  -[UIImageView setClearsContextBeforeDrawing:](self->_imageView, "setClearsContextBeforeDrawing:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "insertSubview:atIndex:", self->_imageView, 0);

  -[UIImageView addObserver:forKeyPath:options:context:](self->_imageView, "addObserver:forKeyPath:options:context:", self, CFSTR("image"), 4, self->_imageView);
}

- (id)highlightView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *highlightView;
  id v9;
  UIView *v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;

  if (!self->_highlightView)
  {
    if (-[IMGridViewCell useMaskForHighlightView](self, "useMaskForHighlightView")
      && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image")),
          v3,
          v3))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageMaskWithColor:", v5));

      v7 = (UIView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
      highlightView = self->_highlightView;
      self->_highlightView = v7;

      if (-[IMGridViewCell imageGravity](self, "imageGravity") == 1)
        -[UIView setContentMode:](self->_highlightView, "setContentMode:", -[UIImageView contentMode](self->_imageView, "contentMode"));
    }
    else
    {
      v9 = objc_alloc((Class)UIView);
      -[IMGridViewCell selectionFrame](self, "selectionFrame");
      v10 = (UIView *)objc_msgSend(v9, "initWithFrame:");
      v11 = self->_highlightView;
      self->_highlightView = v10;

      -[UIView setOpaque:](self->_highlightView, "setOpaque:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
      -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v6);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
    objc_msgSend(v12, "addSubview:", self->_highlightView);

    if (self->_badgeView)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell badgeView](self, "badgeView"));
      objc_msgSend(v13, "bringSubviewToFront:", v14);

    }
  }
  return self->_highlightView;
}

- (id)workingView
{
  UIActivityIndicatorView *workingView;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  void *v6;

  workingView = self->_workingView;
  if (!workingView)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    v5 = self->_workingView;
    self->_workingView = v4;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_workingView, "setHidesWhenStopped:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", self->_workingView);

    workingView = self->_workingView;
  }
  return workingView;
}

- (UILabel)textLabel
{
  UILabel *textLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_textLabel;
    self->_textLabel = v4;

    -[UILabel setContentMode:](self->_textLabel, "setContentMode:", 2);
    -[UILabel setClipsToBounds:](self->_textLabel, "setClipsToBounds:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));
    -[UILabel setFont:](self->_textLabel, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_textLabel, "setBackgroundColor:", v7);

    -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell title](self, "title"));
    -[UILabel setText:](self->_textLabel, "setText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
    objc_msgSend(v9, "addSubview:", self->_textLabel);

    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (void)prepareForReuse
{
  __int128 v3;
  _OWORD v4[3];

  -[IMGridViewCell setHidden:](self, "setHidden:", 1);
  self->_showSelectionView = 0;
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  -[UILabel setText:](self->_textLabel, "setText:", 0);
  -[IMGridViewCell setHighlighted:](self, "setHighlighted:", 0);
  -[IMGridViewCell setWorking:](self, "setWorking:", 0);
  -[IMGridViewCell setEditing:](self, "setEditing:", 0);
  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[IMGridViewCell setTransform:](self, "setTransform:", v4);
  -[IMGridViewCell setBadgeLabelNumber:](self, "setBadgeLabelNumber:", 0);
  -[IMGridViewCell setSelected:](self, "setSelected:", 0);
  -[IMGridViewCell _removeSelectedBadgeView](self, "_removeSelectedBadgeView");
  -[IMGridViewCell _removeHighlightView](self, "_removeHighlightView");
  -[IMGridViewCell _removeCloseBox](self, "_removeCloseBox");
}

+ (CGSize)scaledImageSizeForBounds:(CGRect)a3 image:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "size");
    v10 = v8 / v9;
    v11 = width / height;
    if (v10 <= width / height)
    {
      if (v10 < width / height)
      {
        v13 = width * (v10 / v11);
        width = roundf(v13);
      }
    }
    else
    {
      v12 = height * (v11 / v10);
      height = roundf(v12);
    }
  }

  v14 = width;
  v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)scaledImageSizeForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
  objc_msgSend(v8, "scaledImageSizeForBounds:image:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (CGRect)imageRectForBounds:(CGRect)a3 image:(id)a4 gravity:(int)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double y;
  double v14;
  double x;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  objc_msgSend(a1, "scaledImageSizeForBounds:image:", a4, a3.origin.x, a3.origin.y);
  v10 = CGRectZero.size.width;
  v11 = CGRectZero.size.height;
  v12 = ceil((width - v8) * 0.5);
  y = height - v9;
  v14 = ceil((height - v9) * 0.5);
  if (a5)
  {
    y = CGRectZero.origin.y;
    x = CGRectZero.origin.x;
  }
  else
  {
    v11 = v9;
    v10 = v8;
    x = v12;
  }
  if (a5 == 1)
    v16 = v9;
  else
    v16 = v11;
  if (a5 == 1)
    v17 = v8;
  else
    v17 = v10;
  if (a5 == 1)
    v18 = v14;
  else
    v18 = y;
  if (a5 == 1)
    v19 = v12;
  else
    v19 = x;
  result.size.height = v16;
  result.size.width = v17;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (CGRect)imageRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
  objc_msgSend(v8, "imageRectForBounds:image:gravity:", v9, self->_imageGravity, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)titleRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[IMGridViewCell contentRectForBounds:](self, "contentRectForBounds:");
  v8 = CGRectGetMaxY(v17) + 5.0;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v9 = CGRectGetWidth(v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v10, "leading");
  v12 = ceil(v11);

  v13 = 0.0;
  v14 = v8;
  v15 = v9;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
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
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIButton *closeBox;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  UIImageView *imageView;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  -[IMGridViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_textLabel, "text"));
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[IMGridViewCell titleRectForBounds:](self, "titleRectForBounds:", v4, v6, v8, v10);
    -[UILabel setFrame:](self->_textLabel, "setFrame:");
  }
  -[IMGridViewCell imageRectForBounds:](self, "imageRectForBounds:", v4, v6, v8, v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[IMGridViewCell contentRectForBounds:](self, "contentRectForBounds:", v4, v6, v8, v10);
  v22 = v21;
  v24 = v23;
  if (self->_highlightView && self->_showSelectionView)
  {
    -[IMGridViewCell selectionFrame](self, "selectionFrame");
    -[UIView setFrame:](self->_highlightView, "setFrame:");
    -[IMGridViewCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_highlightView);
  }
  closeBox = self->_closeBox;
  if (closeBox && (*((_BYTE *)self + 132) & 4) != 0 && (*((_BYTE *)self + 132) & 2) != 0)
  {
    -[UIButton setCenter:](closeBox, "setCenter:", v22 + 1.0, v24 + 1.5);
    -[IMGridViewCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_closeBox);
  }
  if (self->_badgeView)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell badgeView](self, "badgeView"));
    objc_msgSend(v26, "bounds");
    v28 = v27;
    v30 = v29;

    v68.origin.x = v14;
    v68.origin.y = v16;
    v68.size.width = v18;
    v68.size.height = v20;
    -[UIImageView setFrame:](self->_badgeView, "setFrame:", CGRectGetMaxX(v68) - round(v28) + 10.0, v16 - round(v30 * 0.5) + 4.0, v28, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v31, "scale");
    v33 = v32;

    -[UIImageView bounds](self->_badgeView, "bounds");
    if (v33 <= 1.0)
      *(CGRect *)&v34 = CGRectOffset(*(CGRect *)&v34, 0.0, -1.0);
    -[UILabel setFrame:](self->_badgeLabel, "setFrame:", v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell badgeView](self, "badgeView"));
    objc_msgSend(v38, "bringSubviewToFront:", v39);

  }
  if (-[IMGridViewCell isSelected](self, "isSelected"))
  {
    if ((*((_BYTE *)self + 132) & 0x20) == 0)
    {
      imageView = self->_imageView;
      if (imageView)
      {
        -[UIImageView frame](imageView, "frame");
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell selectedWhitewashView](self, "selectedWhitewashView"));
        objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell selectedWhitewashView](self, "selectedWhitewashView"));
        objc_msgSend(v50, "addSubview:", v51);

      }
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell selectedBadgeView](self, "selectedBadgeView"));
    objc_msgSend(v52, "bounds");
    v54 = v53;
    v56 = v55;

    v69.origin.x = v14;
    v69.origin.y = v16;
    v69.size.width = v18;
    v69.size.height = v20;
    v57 = CGRectGetMaxX(v69) - v54 + -3.0;
    v70.origin.x = v14;
    v70.origin.y = v16;
    v70.size.width = v18;
    v70.size.height = v20;
    v58 = CGRectGetMaxY(v70) - v56 + -2.0;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell selectedBadgeView](self, "selectedBadgeView"));
    objc_msgSend(v59, "setFrame:", v57, v58, v54, v56);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell selectedBadgeView](self, "selectedBadgeView"));
    objc_msgSend(v60, "bringSubviewToFront:", v61);

  }
  if (-[IMGridViewCell isWorking](self, "isWorking"))
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell workingView](self, "workingView"));
    objc_msgSend(v62, "bounds");
    v64 = v63;
    v66 = v65;

    v71.origin.x = v14;
    v71.origin.y = v16;
    v71.size.width = v18;
    v71.size.height = v20;
    v67 = CGRectGetMaxY(v71) - round(v20 * 0.5) - round(v66 * 0.5);
    v72.origin.x = v14;
    v72.origin.y = v16;
    v72.size.width = v18;
    v72.size.height = v20;
    -[UIActivityIndicatorView setFrame:](self->_workingView, "setFrame:", CGRectGetMaxX(v72) - round(v18 * 0.5) - round(v64 * 0.5), v67, v64, v66);
    -[UIActivityIndicatorView startAnimating](self->_workingView, "startAnimating");
    -[IMGridViewCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_workingView);
  }
  else
  {
    -[UIActivityIndicatorView stopAnimating](self->_workingView, "stopAnimating");
  }
}

- (CGRect)selectionFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[IMGridViewCell bounds](self, "bounds");
  -[IMGridViewCell contentRectForBounds:](self, "contentRectForBounds:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_gridView
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell superview](self, "superview"));
  v3 = objc_opt_class(IMGridView);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setGrabbed:(BOOL)a3
{
  char v3;
  UIView *highlightView;
  double v5;

  v3 = *((_BYTE *)self + 132);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 132) = v3 & 0xFE | a3;
    highlightView = self->_highlightView;
    v5 = 1.0;
    if (a3)
      v5 = 0.0;
    -[UIView setAlpha:](highlightView, "setAlpha:", v5);
  }
}

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)self + 132) >> 1) & 1;
}

- (void)setEditing:(BOOL)a3
{
  char v3;
  _BOOL4 v4;
  char v6;
  unsigned int v7;
  uint64_t v8;

  v3 = *((_BYTE *)self + 132);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if ((*((_BYTE *)self + 132) & 1) == 0 || !a3)
    {
      if (a3)
        v6 = 2;
      else
        v6 = 0;
      *((_BYTE *)self + 132) = v3 & 0xFD | v6;
      v7 = *((unsigned __int8 *)self + 132);
      v8 = (v7 >> 2) & 1;
      if ((v7 & 4) != 0 && !v4)
        v8 = *((_BYTE *)self + 132) & 1;
      -[IMGridViewCell setShowCloseBox:](self, "setShowCloseBox:", v8);
      if (v4)
        -[IMGridViewCell setHighlighted:](self, "setHighlighted:", 0);
      -[IMGridViewCell setJiggling:](self, "setJiggling:", -[IMGridViewCell jiggleWhenEditing](self, "jiggleWhenEditing") & v4);
      -[IMGridViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)canDelete
{
  return (*((unsigned __int8 *)self + 132) >> 2) & 1;
}

- (void)setCanDelete:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 132);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *((_BYTE *)self + 132) = v3 & 0xFB | v4;
    if ((*((_BYTE *)self + 132) & 2) != 0)
      -[IMGridViewCell setShowCloseBox:](self, "setShowCloseBox:");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  __int128 v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  -[IMGridViewCell transform](self, "transform");
  if ((*((_BYTE *)self + 132) & 1) == 0)
  {
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v13 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v14 = v8;
    v15 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[IMGridViewCell setTransform:](self, "setTransform:", &v13);
  }
  v12.receiver = self;
  v12.super_class = (Class)IMGridViewCell;
  -[IMGridViewCell setFrame:](&v12, "setFrame:", x, y, width, height);
  if ((*((_BYTE *)self + 132) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self, "layer"));
    objc_msgSend(v9, "position");
    self->_unjitterPoint.x = v10;
    self->_unjitterPoint.y = v11;

    v13 = v16;
    v14 = v17;
    v15 = v18;
    -[IMGridViewCell setTransform:](self, "setTransform:", &v13);
  }
}

- (void)setHidesWhitewash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 132) = *((_BYTE *)self + 132) & 0xDF | v3;
}

- (BOOL)isSelected
{
  return (*((unsigned __int8 *)self + 132) >> 4) & 1;
}

- (void)setSelected:(BOOL)a3
{
  char v3;
  char v6;

  v3 = *((_BYTE *)self + 132);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v6 = 16;
    else
      v6 = 0;
    *((_BYTE *)self + 132) = v3 & 0xEF | v6;
    if (-[IMGridViewCell highlighted](self, "highlighted") && !a3)
      -[IMGridViewCell setHighlighted:](self, "setHighlighted:", 0);
    if (!-[IMGridViewCell isSelected](self, "isSelected"))
      -[IMGridViewCell _removeSelectedBadgeView](self, "_removeSelectedBadgeView");
    -[IMGridViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)selectedWhitewashView
{
  UIView *selectedWhitewashView;
  UIView *v4;
  UIView *v5;
  void *v6;

  selectedWhitewashView = self->_selectedWhitewashView;
  if (!selectedWhitewashView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_selectedWhitewashView;
    self->_selectedWhitewashView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
    -[UIView setBackgroundColor:](self->_selectedWhitewashView, "setBackgroundColor:", v6);

    -[UIView setOpaque:](self->_selectedWhitewashView, "setOpaque:", 0);
    selectedWhitewashView = self->_selectedWhitewashView;
  }
  return selectedWhitewashView;
}

- (UIImageView)selectedBadgeView
{
  UIImageView *selectedBadgeView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;

  selectedBadgeView = self->_selectedBadgeView;
  if (!selectedBadgeView)
  {
    v4 = IMCommonCoreBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell traitCollection](self, "traitCollection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("blue_circle_checkmark"), v5, v6));

    v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    v9 = self->_selectedBadgeView;
    self->_selectedBadgeView = v8;

    -[UIImageView setFrame:](self->_selectedBadgeView, "setFrame:", 0.0, 0.0, 29.0, 29.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
    objc_msgSend(v10, "addSubview:", self->_selectedBadgeView);

    selectedBadgeView = self->_selectedBadgeView;
  }
  return selectedBadgeView;
}

- (BOOL)jiggleWhenEditing
{
  return (*((unsigned __int8 *)self + 132) >> 3) & 1;
}

- (void)setJiggleWhenEditing:(BOOL)a3
{
  char v3;
  _BOOL8 v5;
  char v6;

  v3 = *((_BYTE *)self + 132);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    v5 = 0;
    if (a3)
      v6 = 8;
    else
      v6 = 0;
    *((_BYTE *)self + 132) = v3 & 0xF7 | v6;
    if (a3)
      v5 = -[IMGridViewCell isEditing](self, "isEditing");
    -[IMGridViewCell setJiggling:](self, "setJiggling:", v5);
  }
}

- (void)setJiggling:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self, "layer"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationForKey:", CFSTR("JitterPosition")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self, "layer"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "animationForKey:", CFSTR("JitterTransform")));

  if (v3)
  {
    if (v16)
    {
      if (!v7)
        goto LABEL_8;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self, "layer"));
      v12 = objc_msgSend((id)objc_opt_class(self), "_jitterPositionAnimation");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      objc_msgSend(v11, "addAnimation:forKey:", v13, CFSTR("JitterPosition"));

      if (!v7)
      {
LABEL_8:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self, "layer"));
        v14 = objc_msgSend((id)objc_opt_class(self), "_jitterTransformAnimation");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v10, "addAnimation:forKey:", v15, CFSTR("JitterTransform"));

        goto LABEL_9;
      }
    }
  }
  else if (v16 | v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self, "layer"));
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("JitterPosition"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self, "layer"));
    objc_msgSend(v9, "removeAnimationForKey:", CFSTR("JitterTransform"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell layer](self, "layer"));
    objc_msgSend(v10, "setPosition:", self->_unjitterPoint.x, self->_unjitterPoint.y);
LABEL_9:

  }
}

+ (id)_jitterPositionAnimation
{
  void *v2;
  double v3;
  id v4;
  uint64_t v5;
  float v6;
  double v7;
  uint64_t v8;
  float v9;
  void *v10;
  uint64_t v11;
  float v12;
  double v13;
  uint64_t v14;
  float v15;
  void *v16;
  uint64_t v17;
  float v18;
  double v19;
  uint64_t v20;
  float v21;
  void *v22;
  uint64_t v23;
  float v24;
  double v25;
  uint64_t v26;
  float v27;
  void *v28;
  id v29;
  double v30;
  id v31;
  id v32;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animation](CAKeyframeAnimation, "animation"));
  objc_msgSend(v2, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v2, "setDuration:", 0.25);
  objc_msgSend(v2, "setAdditive:", 1);
  LODWORD(v3) = 2139095039;
  objc_msgSend(v2, "setRepeatCount:", v3);
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = random();
  v6 = ((double)(v5 % 1000) / 1000.0 + (double)(v5 % 1000) / 1000.0) * 0.25 + -0.25;
  v7 = floorf(v6);
  v8 = random();
  v9 = ((double)(v8 % 1000) / 1000.0 + (double)(v8 % 1000) / 1000.0) * 0.25 + -0.25;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v7, floorf(v9)));
  objc_msgSend(v4, "addObject:", v10);
  v11 = random();
  v12 = ((double)(v11 % 1000) / 1000.0 + (double)(v11 % 1000) / 1000.0) * 0.25 + -0.25;
  v13 = floorf(v12);
  v14 = random();
  v15 = ((double)(v14 % 1000) / 1000.0 + (double)(v14 % 1000) / 1000.0) * 0.25 + -0.25;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, floorf(v15)));
  objc_msgSend(v4, "addObject:", v16);

  v17 = random();
  v18 = ((double)(v17 % 1000) / 1000.0 + (double)(v17 % 1000) / 1000.0) * 0.25 + -0.25;
  v19 = floorf(v18);
  v20 = random();
  v21 = ((double)(v20 % 1000) / 1000.0 + (double)(v20 % 1000) / 1000.0) * 0.25 + -0.25;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v19, floorf(v21)));
  objc_msgSend(v4, "addObject:", v22);

  v23 = random();
  v24 = ((double)(v23 % 1000) / 1000.0 + (double)(v23 % 1000) / 1000.0) * 0.25 + -0.25;
  v25 = floorf(v24);
  v26 = random();
  v27 = ((double)(v26 % 1000) / 1000.0 + (double)(v26 % 1000) / 1000.0) * 0.25 + -0.25;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v25, floorf(v27)));
  objc_msgSend(v4, "addObject:", v28);

  objc_msgSend(v4, "addObject:", v10);
  v29 = objc_alloc((Class)NSNumber);
  LODWORD(v30) = 1028443341;
  v31 = objc_msgSend(v29, "initWithFloat:", v30);
  v32 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v31, v31, v31, v31, v31, 0);
  objc_msgSend(v2, "setBeginTime:", ceilf((float)(random() % 1000 + 1) * 0.2) * 0.05);
  objc_msgSend(v2, "setValues:", v4);
  objc_msgSend(v2, "setKeyTimes:", v32);

  return v2;
}

+ (id)_jitterTransformAnimation
{
  void *v2;
  void *v3;
  double v4;
  id v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  double v13;
  id v14;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animation](CAKeyframeAnimation, "animation"));
  objc_msgSend(v2, "setKeyPath:", CFSTR("transform"));
  objc_msgSend(v2, "setDuration:", 0.25);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAValueFunction functionWithName:](CAValueFunction, "functionWithName:", kCAValueFunctionRotateZ));
  objc_msgSend(v2, "setValueFunction:", v3);

  objc_msgSend(v2, "setAdditive:", 1);
  LODWORD(v4) = 2139095039;
  objc_msgSend(v2, "setRepeatCount:", v4);
  v5 = objc_alloc_init((Class)NSMutableArray);
  LODWORD(v6) = -1129606490;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  objc_msgSend(v5, "addObject:", v7);

  LODWORD(v8) = 1017877158;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
  objc_msgSend(v5, "addObject:", v9);

  LODWORD(v10) = -1129606490;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
  objc_msgSend(v5, "addObject:", v11);

  v12 = objc_alloc((Class)NSNumber);
  LODWORD(v13) = 1028443341;
  v14 = objc_msgSend(v12, "initWithFloat:", v13);
  v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v14, v14, v14, 0);
  objc_msgSend(v2, "setBeginTime:", ceilf((float)(random() % 1000 + 1) * 0.2) * 0.05);
  objc_msgSend(v2, "setValues:", v5);
  objc_msgSend(v2, "setKeyTimes:", v15);

  return v2;
}

- (void)deleteConfirmationControlWasClicked:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[IMGridViewCell _gridView](self, "_gridView", a3));
  objc_msgSend(v4, "animateDeletionOfCell:", self);

}

- (id)closeBox
{
  UIButton *closeBox;
  void *v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;

  closeBox = self->_closeBox;
  if (!closeBox)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("closebox.png")));
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    v6 = self->_closeBox;
    self->_closeBox = v5;

    -[UIButton setImage:forState:](self->_closeBox, "setImage:forState:", v4, 0);
    -[UIButton sizeToFit](self->_closeBox, "sizeToFit");
    -[UIButton setAlpha:](self->_closeBox, "setAlpha:", 0.0);
    -[UIButton addTarget:action:forControlEvents:](self->_closeBox, "addTarget:action:forControlEvents:", self, "deleteConfirmationControlWasClicked:", 64);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_closeBox);

    closeBox = self->_closeBox;
  }
  return closeBox;
}

- (void)_removeSelectedBadgeView
{
  UIImageView *selectedBadgeView;
  UIView *selectedWhitewashView;

  -[UIImageView removeFromSuperview](self->_selectedBadgeView, "removeFromSuperview");
  selectedBadgeView = self->_selectedBadgeView;
  self->_selectedBadgeView = 0;

  -[UIView removeFromSuperview](self->_selectedWhitewashView, "removeFromSuperview");
  selectedWhitewashView = self->_selectedWhitewashView;
  self->_selectedWhitewashView = 0;

}

- (void)_removeHighlightView
{
  UIView *highlightView;

  -[UIView removeFromSuperview](self->_highlightView, "removeFromSuperview");
  highlightView = self->_highlightView;
  self->_highlightView = 0;

}

- (void)_removeWorkingView
{
  UIActivityIndicatorView *workingView;
  UIActivityIndicatorView *v4;

  workingView = self->_workingView;
  if (workingView)
  {
    -[UIActivityIndicatorView removeFromSuperview](workingView, "removeFromSuperview");
    v4 = self->_workingView;
    self->_workingView = 0;

  }
}

- (void)_removeCloseBox
{
  UIButton *closeBox;

  -[UIButton removeFromSuperview](self->_closeBox, "removeFromSuperview");
  closeBox = self->_closeBox;
  self->_closeBox = 0;

}

- (void)setShowCloseBox:(BOOL)a3
{
  UIButton *v4;
  UIButton *v5;
  _QWORD v6[4];
  UIButton *v7;
  BOOL v8;

  if (a3)
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell closeBox](self, "closeBox"));
  else
    v4 = self->_closeBox;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_B34C4;
  v6[3] = &unk_28D018;
  v7 = v4;
  v8 = a3;
  v5 = v4;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, 0, 0.2);

}

- (UIEdgeInsets)snapshotEdgeInsets
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat v10;
  void *v11;
  id v12;
  CGFloat height;
  id v14;
  uint64_t v15;
  void *i;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double top;
  double left;
  double right;
  double bottom;
  double MaxY;
  double MaxX;
  double v27;
  double MinX;
  double v29;
  double MinY;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat rect1;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  UIEdgeInsets result;
  CGRect v52;
  CGRect v53;

  -[IMGridViewCell bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  v10 = v9;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewCell subviews](self, "subviews"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  v32 = y;
  v33 = x;
  rect1 = width;
  height = v10;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v36;
    height = v10;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "frame");
        v52.origin.x = v17;
        v52.origin.y = v18;
        v52.size.width = v19;
        v52.size.height = v20;
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        v41 = CGRectUnion(v40, v52);
        x = v41.origin.x;
        y = v41.origin.y;
        width = v41.size.width;
        height = v41.size.height;
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v14);
  }

  v42.origin.y = v32;
  v42.origin.x = v33;
  v42.size.width = rect1;
  v42.size.height = v10;
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  if (CGRectEqualToRect(v42, v53))
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  else
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MinY = CGRectGetMinY(v43);
    v44.origin.x = v33;
    v44.origin.y = v32;
    v44.size.width = rect1;
    v44.size.height = v10;
    v31 = MinY - CGRectGetMinY(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MinX = CGRectGetMinX(v45);
    v46.origin.x = v33;
    v46.origin.y = v32;
    v46.size.width = rect1;
    v46.size.height = v10;
    v29 = MinX - CGRectGetMinX(v46);
    v47.origin.x = v33;
    v47.origin.y = v32;
    v47.size.width = rect1;
    v47.size.height = v10;
    MaxY = CGRectGetMaxY(v47);
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    bottom = MaxY - CGRectGetMaxY(v48);
    v49.origin.x = v33;
    v49.origin.y = v32;
    v49.size.width = rect1;
    v49.size.height = v10;
    MaxX = CGRectGetMaxX(v49);
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    right = MaxX - CGRectGetMaxX(v50);
    left = v29;
    top = v31;
  }
  v27 = bottom;
  result.right = right;
  result.bottom = v27;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int)imageGravity
{
  return self->_imageGravity;
}

- (void)setImageGravity:(int)a3
{
  self->_imageGravity = a3;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (void)setBadgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_badgeLabel, a3);
}

- (BOOL)showSelectionView
{
  return self->_showSelectionView;
}

- (void)setShowSelectionView:(BOOL)a3
{
  self->_showSelectionView = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void)setSelectedWhitewashView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedWhitewashView, a3);
}

- (void)setSelectedBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBadgeView, a3);
}

- (IMGridView)gridView
{
  return (IMGridView *)objc_loadWeakRetained((id *)&self->_gridView);
}

- (void)setGridView:(id)a3
{
  objc_storeWeak((id *)&self->_gridView, a3);
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)ignoreChangesToHidden
{
  return self->_ignoreChangesToHidden;
}

- (void)setIgnoreChangesToHidden:(BOOL)a3
{
  self->_ignoreChangesToHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_gridView);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_selectedBadgeView, 0);
  objc_storeStrong((id *)&self->_selectedWhitewashView, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_closeBox, 0);
  objc_storeStrong((id *)&self->_workingView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
