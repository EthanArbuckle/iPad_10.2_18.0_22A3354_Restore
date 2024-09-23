@implementation ConversationHeaderContentView

- (ConversationHeaderContentView)initWithFrame:(CGRect)a3
{
  ConversationHeaderContentView *v3;
  ConversationHeaderContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ConversationHeaderContentView;
  v3 = -[ConversationHeaderContentView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ConversationHeaderContentView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[ConversationHeaderContentView _createPrimaryViews](v4, "_createPrimaryViews");
  }
  return v4;
}

- (void)_createPrimaryViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[ConversationHeaderContentView setTextLabel:](self, "setTextLabel:");

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  objc_msgSend(v3, "setBackgroundColor:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  objc_msgSend(v8, "setLineBreakMode:", 4);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  objc_msgSend(v9, "setNumberOfLines:", 1);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  objc_msgSend(v4, "setTextColor:", v10);

  v5 = MSAccessibilityIdentifierMailMessageViewSubjectLabel;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  objc_msgSend(v11, "setAccessibilityIdentifier:", v5);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  -[ConversationHeaderContentView addSubview:](self, "addSubview:");

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  -[ConversationHeaderContentView bounds](self, "bounds");
  v9 = v8 - CGRectGetWidth(v14);
  if (v9 >= 0.0)
    v10 = v9;
  else
    v10 = -v9;
  v13.receiver = self;
  v13.super_class = (Class)ConversationHeaderContentView;
  -[ConversationHeaderContentView setBounds:](&v13, "setBounds:", x, y, width, height);
  if (v10 > 0.00000011920929)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
    -[ConversationHeaderContentView _updateTextAlignmentForText:](self, "_updateTextAlignmentForText:", v12);

    -[ConversationHeaderContentView reflow](self, "reflow");
  }
}

- (void)layoutMarginsDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ConversationHeaderContentView;
  -[ConversationHeaderContentView layoutMarginsDidChange](&v5, "layoutMarginsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  -[ConversationHeaderContentView _updateTextAlignmentForText:](self, "_updateTextAlignmentForText:", v4);

  -[ConversationHeaderContentView reflow](self, "reflow");
}

- (void)_updateTextAlignmentForText:(id)a3
{
  unint64_t v4;
  int64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    v4 = -[ConversationHeaderContentView textAlignment](self, "textAlignment") - 1;
    if (v4 >= 4)
      v5 = -[ConversationHeaderContentView _automaticTextAlignmentForText:](self, "_automaticTextAlignmentForText:", v9);
    else
      v5 = qword_1004C9340[v4];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
    v7 = objc_msgSend(v6, "textAlignment");

    if (v7 != (id)v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
      objc_msgSend(v8, "setTextAlignment:", v5);

    }
  }

}

- (int64_t)_automaticTextAlignmentForText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  int64_t v24;
  NSAttributedStringKey v26;
  void *v27;
  CGRect v28;

  v4 = a3;
  v26 = NSFontAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
  v27 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));

  objc_msgSend(v4, "sizeWithAttributes:", v7);
  v9 = v8;
  -[ConversationHeaderContentView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[ConversationHeaderContentView layoutMargins](self, "layoutMargins");
  v19 = v13 + v18;
  v22 = v15 - (v20 + v21);
  v28.size.height = v17 - (v18 + v23);
  v28.origin.x = v11 + v20;
  v28.origin.y = v19;
  v28.size.width = v22;
  if (CGRectGetWidth(v28) - v9 <= 20.0)
  {
    if (objc_msgSend(v4, "_isNaturallyRTL"))
      v24 = 2;
    else
      v24 = 0;
  }
  else
  {
    v24 = 1;
  }

  return v24;
}

- (void)setText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ConversationHeaderContentView _updateTextAlignmentForText:](self, "_updateTextAlignmentForText:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  objc_msgSend(v4, "setText:", v5);

  -[ConversationHeaderContentView reflow](self, "reflow");
}

- (void)setContentWidth:(double)a3
{
  if (self->_contentWidth != a3)
  {
    self->_contentWidth = a3;
    -[ConversationHeaderContentView reflow](self, "reflow");
  }
}

- (void)reflow
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  __n128 v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  __n128 v30;
  double v31;
  double y;
  double v33;
  double v34;
  CGRect v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[ConversationHeaderContentView contentWidth](self, "contentWidth");
    v7 = v6;
    -[ConversationHeaderContentView layoutMargins](self, "layoutMargins");
    v9 = v8;
    -[ConversationHeaderContentView layoutMargins](self, "layoutMargins");
    v11 = v7 - (v9 + v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
    objc_msgSend(v12, "sizeThatFits:", v11, 0.0);
    v14 = v13;

    -[ConversationHeaderContentView topToFirstBaseline](self, "topToFirstBaseline");
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
    objc_msgSend(v17, "_firstLineBaseline");
    v19 = v16 - v18;

    v20.n128_f64[0] = v19;
    v21 = UIRoundToViewScale(self, v20);
    -[ConversationHeaderContentView layoutMargins](self, "layoutMargins");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
    objc_msgSend(v24, "setFrame:", v23, v21, v11, v14);

    -[ConversationHeaderContentView lastBaselineToBottom](self, "lastBaselineToBottom");
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
    objc_msgSend(v27, "_lastLineBaseline");
    v29 = v26 + v28 - v14;

    v30.n128_f64[0] = v29;
    v31 = UIRoundToViewScale(self, v30);
    y = CGRectZero.origin.y;
    -[ConversationHeaderContentView contentWidth](self, "contentWidth");
    v34 = v33;
    v35.origin.x = v23;
    v35.origin.y = v21;
    v35.size.width = v11;
    v35.size.height = v14;
    -[ConversationHeaderContentView setBounds:](self, "setBounds:", CGRectZero.origin.x, y, v34, v31 + CGRectGetMaxY(v35));
    -[ConversationHeaderContentView _updateAnchorPoint](self, "_updateAnchorPoint");
  }
}

- (void)setFont:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  objc_msgSend(v4, "setFont:", v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[ConversationHeaderContentView _updateTextAlignmentForText:](self, "_updateTextAlignmentForText:", v6);

  -[ConversationHeaderContentView reflow](self, "reflow");
}

- (void)setNumberOfLines:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  objc_msgSend(v4, "setNumberOfLines:", a3);

}

- (unint64_t)numberOfLines
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView textLabel](self, "textLabel"));
  v3 = objc_msgSend(v2, "numberOfLines");

  return (unint64_t)v3;
}

- (void)_updateAnchorPoint
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
  void *v14;
  __n128 v15;
  CGRect v16;

  -[ConversationHeaderContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ConversationHeaderContentView topToFirstBaseline](self, "topToFirstBaseline");
  v12 = v11;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  v13 = v12 / CGRectGetHeight(v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderContentView layer](self, "layer"));
  objc_msgSend(v14, "setAnchorPoint:", CGPointZero.x, v13);

  -[ConversationHeaderContentView topToFirstBaseline](self, "topToFirstBaseline");
  -[ConversationHeaderContentView setCenter:](self, "setCenter:", 0.0, UIRoundToViewScale(self, v15));
}

- (double)topToFirstBaseline
{
  return self->_topToFirstBaseline;
}

- (void)setTopToFirstBaseline:(double)a3
{
  self->_topToFirstBaseline = a3;
}

- (double)lastBaselineToBottom
{
  return self->_lastBaselineToBottom;
}

- (void)setLastBaselineToBottom:(double)a3
{
  self->_lastBaselineToBottom = a3;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (unint64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unint64_t)a3
{
  self->_textAlignment = a3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
