@implementation _MoreEventsView

- (_MoreEventsView)init
{
  _MoreEventsView *v2;
  _MoreEventsView *v3;
  NSString *string;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MoreEventsView;
  v2 = -[_MoreEventsView init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_numberOfEvents = 0;
    string = v2->_string;
    v2->_string = (NSString *)&stru_1001B67C0;

  }
  return v3;
}

- (void)loadViewsIfNeeded
{
  UILabel *v3;
  UILabel *label;
  id v5;
  NSString *string;
  void *v7;
  id v8;

  if (!self->_label)
  {
    v3 = objc_opt_new(UILabel);
    label = self->_label;
    self->_label = v3;

    -[UILabel setClipsToBounds:](self->_label, "setClipsToBounds:", 0);
    v5 = objc_alloc((Class)NSAttributedString);
    string = self->_string;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MoreEventsView stringAttributes](self, "stringAttributes"));
    v8 = objc_msgSend(v5, "initWithString:attributes:", string, v7);
    -[UILabel setAttributedText:](self->_label, "setAttributedText:", v8);

    -[_MoreEventsView addSubview:](self, "addSubview:", self->_label);
  }
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3)
    -[_MoreEventsView loadViewsIfNeeded](self, "loadViewsIfNeeded");
}

- (void)reset
{
  -[_MoreEventsView setNumberOfEvents:](self, "setNumberOfEvents:", 0);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_renderFrame;
  BOOL v9;
  UILabel *v10;
  double v11;
  double v12;
  BOOL v13;
  UILabel *label;
  double MidX;
  CGFloat MidY;
  objc_super v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_renderFrame = &self->_renderFrame;
  v9 = self->_renderFrame.size.width == a3.size.width && self->_renderFrame.size.height == a3.size.height;
  if (v9
    && ((v10 = self->_label) == 0
     || ((-[UILabel frame](v10, "frame"), v12 == width) ? (v13 = v11 == height) : (v13 = 0), v13)))
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MidX = CGRectGetMidX(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    MidY = CGRectGetMidY(v20);
    v18.receiver = self;
    v18.super_class = (Class)_MoreEventsView;
    -[_MoreEventsView setCenter:](&v18, "setCenter:", MidX, MidY);
  }
  else
  {
    label = self->_label;
    if (label)
      -[UILabel setFrame:](label, "setFrame:", 0.0, 0.0, p_renderFrame->size.width, p_renderFrame->size.height);
    p_renderFrame->origin.x = x;
    p_renderFrame->origin.y = y;
    p_renderFrame->size.width = width;
    p_renderFrame->size.height = height;
    v17.receiver = self;
    v17.super_class = (Class)_MoreEventsView;
    -[_MoreEventsView setFrame:](&v17, "setFrame:", x, y, width, height);
  }
  p_renderFrame->origin.x = x;
  p_renderFrame->origin.y = y;
  p_renderFrame->size.width = width;
  p_renderFrame->size.height = height;
}

- (void)setIsCompact:(BOOL)a3
{
  if (self->_isCompact != a3)
  {
    self->_isCompact = a3;
    -[_MoreEventsView _updateString](self, "_updateString");
  }
}

- (void)update
{
  -[_MoreEventsView _updateString](self, "_updateString");
  -[_MoreEventsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateString
{
  NSString *v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  id v7;
  NSString *string;
  void *v9;
  id v10;
  NSString *v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_isCompact)
  {
    if (qword_1001F6120 != -1)
      dispatch_once(&qword_1001F6120, &stru_1001B2EE8);
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_numberOfEvents));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F6118, "objectForKey:"));
    if (!v3)
    {
      v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("+%ld"), &stru_1001B67C0, 0));
      v3 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, self->_numberOfEvents));

      objc_msgSend((id)qword_1001F6118, "setObject:forKey:", v3, v15);
    }
    if (!-[NSString isEqualToString:](self->_string, "isEqualToString:", v3))
    {
      objc_storeStrong((id *)&self->_string, v3);
      if (self->_label)
      {
        v7 = objc_alloc((Class)NSAttributedString);
        string = self->_string;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[_MoreEventsView stringAttributes](self, "stringAttributes"));
        v10 = objc_msgSend(v7, "initWithString:attributes:", string, v9);
        -[UILabel setAttributedText:](self->_label, "setAttributedText:", v10);

      }
    }
  }
  else
  {
    if (qword_1001F6130 != -1)
      dispatch_once(&qword_1001F6130, &stru_1001B2F08);
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_numberOfEvents));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F6128, "objectForKey:"));
    if (!v11)
    {
      v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("+%ld more"), &stru_1001B67C0, 0));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, self->_numberOfEvents));

      objc_msgSend((id)qword_1001F6128, "setObject:forKey:", v11, v15);
    }
    v3 = self->_string;
    self->_string = v11;
  }

}

- (BOOL)isNarrow
{
  double height;
  double v3;

  if (!self->_isCompact)
    return 0;
  height = self->_renderFrame.size.height;
  +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
  return height < v3;
}

- (double)pillInset
{
  _BOOL8 v2;
  uint64_t v3;
  double v4;

  v2 = -[_MoreEventsView isNarrow](self, "isNarrow");
  v4 = 3.0;
  if (v2)
    v4 = 1.5;
  return CalRoundToScreenScale(v2, v3, v4);
}

- (id)stringAttributes
{
  _BOOL8 isCompact;
  double height;
  double v4;

  isCompact = self->_isCompact;
  height = self->_renderFrame.size.height;
  +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
  return +[MonthWeekOccurrencesView xMoreStringAttributesCompact:narrow:](MonthWeekOccurrencesView, "xMoreStringAttributesCompact:narrow:", isCompact, height < v4);
}

- (void)draw
{
  double y;
  double x;
  double width;
  double height;
  double v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSString *string;
  void *v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  x = self->_renderFrame.origin.x;
  y = self->_renderFrame.origin.y;
  width = self->_renderFrame.size.width;
  height = self->_renderFrame.size.height;
  if (!self->_isCompact)
  {
    v7 = CalRoundToScreenScale(self, a2, 4.0);
    x = x + v7;
    y = y + 0.0;
    width = width - (v7 + CalRoundToScreenScale(v8, v9, 4.0));
  }
  v10 = objc_alloc((Class)NSAttributedString);
  string = self->_string;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MoreEventsView stringAttributes](self, "stringAttributes"));
  v20 = objc_msgSend(v10, "initWithString:attributes:", string, v12);

  v13 = objc_msgSend(v20, "size");
  v15 = (height - v14) * 0.5;
  v17 = CalRoundToScreenScale(v13, v16, v15);
  objc_msgSend(v20, "drawWithRect:options:context:", 33, 0, x + 0.0, y + v17, width, height - (v17 + CalRoundToScreenScale(v18, v19, v15)));

}

- (int64_t)numberOfEvents
{
  return self->_numberOfEvents;
}

- (void)setNumberOfEvents:(int64_t)a3
{
  self->_numberOfEvents = a3;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
