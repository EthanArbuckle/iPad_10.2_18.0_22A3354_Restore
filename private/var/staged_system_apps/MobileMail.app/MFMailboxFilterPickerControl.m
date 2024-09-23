@implementation MFMailboxFilterPickerControl

- (void)_setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl _fontForFilterLabels](self, "_fontForFilterLabels"));
  v3 = objc_alloc_init((Class)UILabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FILTERS_CHOOSE"), &stru_100531B00, CFSTR("Main")));
  objc_msgSend(v3, "setText:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v3, "setTextColor:", v6);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setFont:", v10);
  -[MFMailboxFilterPickerControl setTitleLabel:](self, "setTitleLabel:", v3);
  -[MFMailboxFilterPickerControl addSubview:](self, "addSubview:", v3);
  v7 = objc_alloc_init((Class)UILabel);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor"));
  objc_msgSend(v7, "setTextColor:", v8);

  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v7, "_setTextColorFollowsTintColor:", 1);
  objc_msgSend(v7, "setFont:", v10);
  -[MFMailboxFilterPickerControl setFiltersLabel:](self, "setFiltersLabel:", v7);
  -[MFMailboxFilterPickerControl addSubview:](self, "addSubview:", v7);
  v9 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
  -[MFMailboxFilterPickerControl addInteraction:](self, "addInteraction:", v9);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setPointerRegion:(id)a3
{
  objc_storeStrong((id *)&self->_pointerRegion, a3);
}

- (void)setFiltersLabel:(id)a3
{
  objc_storeStrong((id *)&self->_filtersLabel, a3);
}

- (void)setFilterDescription:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v8 = (__CFString *)a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  if (v8)
    v5 = v8;
  else
    v5 = &stru_100531B00;
  objc_msgSend(v4, "setText:", v5);

  -[MFMailboxFilterPickerControl invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "sizeToFit");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  objc_msgSend(v7, "sizeToFit");

  -[MFMailboxFilterPickerControl setPointerRegion:](self, "setPointerRegion:", 0);
}

- (MFMailboxFilterPickerControl)initWithFrame:(CGRect)a3
{
  MFMailboxFilterPickerControl *v3;
  MFMailboxFilterPickerControl *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilterPickerControl;
  v3 = -[MFMailboxFilterPickerControl initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFMailboxFilterPickerControl setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFMailboxFilterPickerControl _setupSubviews](v4, "_setupSubviews");
    -[MFMailboxFilterPickerControl _setupGestureRecognizer](v4, "_setupGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_fontMetricCacheDidInvalidate:", MFFontMetricCacheInvalidationNotification, 0);

  }
  return v4;
}

- (UILabel)filtersLabel
{
  return self->_filtersLabel;
}

- (void)_setupGestureRecognizer
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleTapGestureRecognizer");
  -[MFMailboxFilterPickerControl addGestureRecognizer:](self, "addGestureRecognizer:");

}

- (id)_fontForFilterLabels
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cachedPreferredFontForStyle:maximumContentSizeCategory:", UIFontTextStyleCaption2, UIContentSizeCategoryExtraLarge));

  return v3;
}

- (void)_fontMetricCacheDidInvalidate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl _fontForFilterLabels](self, "_fontForFilterLabels", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl titleLabel](self, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  objc_msgSend(v4, "setFont:", v6);
  objc_msgSend(v5, "setFont:", v6);
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v5, "sizeToFit");
  -[MFMailboxFilterPickerControl invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MFMailboxFilterPickerControl setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double Width;
  void *v4;
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
  double Height;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)MFMailboxFilterPickerControl;
  -[MFMailboxFilterPickerControl layoutSubviews](&v19, "layoutSubviews");
  -[MFMailboxFilterPickerControl bounds](self, "bounds");
  Width = CGRectGetWidth(v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setFrame:", v6, v8, Width, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = Width;
  v21.size.height = v10;
  Height = CGRectGetHeight(v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  objc_msgSend(v18, "setFrame:", v14, Height, Width, v16);

}

- (void)_handleTapGestureRecognizer
{
  -[MFMailboxFilterPickerControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double Width;
  double v21;
  double Height;
  double v23;
  double v24;
  CGFloat rect;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGSize result;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  objc_msgSend(v12, "frame");
  v28 = v14;
  v29 = v13;
  v26 = v16;
  v27 = v15;

  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  rect = v11;
  v17 = v9;
  v18 = v7;
  v19 = v5;
  Width = CGRectGetWidth(v31);
  v32.origin.x = v29;
  v32.origin.y = v28;
  v32.size.width = v27;
  v32.size.height = v26;
  v21 = fmax(Width, CGRectGetWidth(v32));
  v33.origin.x = v19;
  v33.origin.y = v18;
  v33.size.width = v17;
  v33.size.height = rect;
  Height = CGRectGetHeight(v33);
  v34.origin.x = v29;
  v34.origin.y = v28;
  v34.size.width = v27;
  v34.size.height = v26;
  v23 = Height + CGRectGetHeight(v34);
  v24 = v21;
  result.height = v23;
  result.width = v24;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, MFFontMetricCacheInvalidationNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)MFMailboxFilterPickerControl;
  -[MFMailboxFilterPickerControl dealloc](&v4, "dealloc");
}

- (NSString)filterDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL4 v18;
  void *v19;
  CGPoint v21;
  CGRect v22;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "location");
  v21.x = v16;
  v21.y = v17;
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  v18 = CGRectContainsPoint(v22, v21);

  if (v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl pointerRegion](self, "pointerRegion"));
  else
    v19 = 0;

  return v19;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = objc_alloc((Class)UITargetedPreview);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
  v7 = objc_msgSend(v5, "initWithView:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerEffect effectWithPreview:](UIPointerEffect, "effectWithPreview:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v8, 0));

  return v9;
}

- (UIPointerRegion)pointerRegion
{
  UIPointerRegion *pointerRegion;
  void *v4;
  UIPointerRegion *v5;
  UIPointerRegion *v6;

  pointerRegion = self->_pointerRegion;
  if (!pointerRegion)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerControl filtersLabel](self, "filtersLabel"));
    objc_msgSend(v4, "frame");
    v5 = (UIPointerRegion *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", CFSTR("MailboxFilterPickerControl")));
    v6 = self->_pointerRegion;
    self->_pointerRegion = v5;

    pointerRegion = self->_pointerRegion;
  }
  return pointerRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerRegion, 0);
  objc_storeStrong((id *)&self->_filtersLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
