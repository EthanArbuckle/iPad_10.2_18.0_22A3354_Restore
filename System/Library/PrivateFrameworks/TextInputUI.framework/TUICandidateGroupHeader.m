@implementation TUICandidateGroupHeader

- (void)commonInit
{
  id v3;
  UILabel *v4;
  UILabel *textLabel;

  self->_alignment = 0;
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  -[TUICandidateGroupHeader bounds](self, "bounds");
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
  textLabel = self->_textLabel;
  self->_textLabel = v4;

  -[UILabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", 4);
  -[UILabel setBaselineAdjustment:](self->_textLabel, "setBaselineAdjustment:", 1);
  -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 0);
  self->_rowHeight = 41.0;
  -[TUICandidateGroupHeader addSubview:](self, "addSubview:", self->_textLabel);
}

- (TUICandidateGroupHeader)initWithFrame:(CGRect)a3
{
  TUICandidateGroupHeader *v3;
  TUICandidateGroupHeader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateGroupHeader;
  v3 = -[TUICandidateGroupHeader initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateGroupHeader commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateGroupHeader)initWithCoder:(id)a3
{
  TUICandidateGroupHeader *v3;
  TUICandidateGroupHeader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateGroupHeader;
  v3 = -[TUICandidateGroupHeader initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateGroupHeader commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat x;
  double y;
  double height;
  double v20;
  double v21;
  double Width;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v26.receiver = self;
  v26.super_class = (Class)TUICandidateGroupHeader;
  -[TUICandidateGroupHeader layoutSubviews](&v26, sel_layoutSubviews);
  -[TUICandidateGroupHeader bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUICandidateGroupHeader style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "layoutOrientation");

  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  if (v12 == 1)
  {
    v27 = CGRectInset(*(CGRect *)&v13, 0.0, 10.0);
    x = v27.origin.x;
    y = v27.origin.y;
    height = v27.size.height;
    -[TUICandidateGroupHeader rowHeight](self, "rowHeight");
    v21 = v20;
    -[TUICandidateGroupHeader bounds](self, "bounds");
    Width = CGRectGetWidth(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = v21;
    v29.size.height = height;
    v23 = Width - CGRectGetMinX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = v21;
    v30.size.height = height;
    v24 = v23 - CGRectGetWidth(v30);
  }
  else
  {
    v31 = CGRectInset(*(CGRect *)&v13, 10.0, 0.0);
    v24 = v31.origin.x;
    y = v31.origin.y;
    v21 = v31.size.width;
    -[TUICandidateGroupHeader rowHeight](self, "rowHeight");
    height = v25;
  }
  -[TUICandidateGroupHeader setVirtualLabelContainerFrame:](self, "setVirtualLabelContainerFrame:", v24, y, v21, height);
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    text = self->_text;
    self->_text = v4;

    v6 = self->_text;
    -[TUICandidateGroupHeader textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
}

- (void)setAlignment:(int64_t)a3
{
  id v4;

  if (self->_alignment != a3)
  {
    -[TUICandidateGroupHeader textLabel](self, "textLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextAlignment:", a3);

  }
}

- (void)setStyle:(id)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    objc_msgSend(v13, "rowHeight");
    self->_rowHeight = v5;
    objc_msgSend(v13, "candidateFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGroupHeader textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    objc_msgSend(v13, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGroupHeader textLabel](self, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(v13, "groupHeaderBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateGroupHeader setBackgroundColor:](self, "setBackgroundColor:", v10);

    v11 = objc_msgSend(v13, "layoutOrientation") == 1;
    -[TUICandidateGroupHeader textLabel](self, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", v11);

  }
}

- (void)setVisibleBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_visibleBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_visibleBounds = &self->_visibleBounds;
  if (!CGRectEqualToRect(self->_visibleBounds, a3))
  {
    p_visibleBounds->origin.x = x;
    p_visibleBounds->origin.y = y;
    p_visibleBounds->size.width = width;
    p_visibleBounds->size.height = height;
    -[TUICandidateGroupHeader updateGroupHeaderLabelPosition](self, "updateGroupHeaderLabelPosition");
  }
}

- (void)updateGroupHeaderLabelPosition
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double MinX;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double MaxY;
  double MinY;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[TUICandidateGroupHeader bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUICandidateGroupHeader visibleBounds](self, "visibleBounds");
  v34.origin.x = v11;
  v34.origin.y = v12;
  v34.size.width = v13;
  v34.size.height = v14;
  -[TUICandidateGroupHeader virtualLabelContainerFrame](self, "virtualLabelContainerFrame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[TUICandidateGroupHeader style](self, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "layoutOrientation");

  -[TUICandidateGroupHeader rowHeight](self, "rowHeight");
  if (v24 == 1)
  {
    v16 = (v25 - v20) * 0.5;
    v35.origin.x = v4;
    v35.origin.y = v6;
    v35.size.width = v8;
    v35.size.height = v10;
    v26 = CGRectGetMaxX(v35) - v16 - v20;
    if (CGRectIsEmpty(v34))
      goto LABEL_5;
    v36.origin.x = v26;
    v36.origin.y = v18;
    v36.size.width = v20;
    v36.size.height = v22;
    MinX = CGRectGetMinX(v36);
    v28 = CGRectGetMaxX(v34) - v16;
    v37.origin.x = v26;
    v37.origin.y = v18;
    v37.size.width = v20;
    v37.size.height = v22;
    if (v28 - CGRectGetWidth(v37) >= MinX)
      goto LABEL_5;
    v29 = CGRectGetMaxX(v34) - v16;
    v38.origin.x = v26;
    v38.origin.y = v18;
    v38.size.width = v20;
    v38.size.height = v22;
    v26 = v29 - CGRectGetWidth(v38);
    v39.origin.x = v26;
    v39.origin.y = v18;
    v39.size.width = v20;
    v39.size.height = v22;
    if (CGRectGetMinX(v39) >= v16)
LABEL_5:
      v16 = v26;
  }
  else
  {
    v18 = (v25 - v22) * 0.5;
    if (!CGRectIsEmpty(v34))
    {
      v40.origin.x = v16;
      v40.origin.y = v18;
      v40.size.width = v20;
      v40.size.height = v22;
      MinY = CGRectGetMinY(v40);
      v41.origin.x = v4;
      v41.origin.y = v6;
      v41.size.width = v8;
      v41.size.height = v10;
      MaxY = CGRectGetMaxY(v41);
      v42.origin.x = v4;
      v42.origin.y = v6;
      v42.size.width = v8;
      v42.size.height = v10;
      v30 = CGRectGetMinY(v42);
      if (v18 + CGRectGetMinY(v34) > MinY)
      {
        v31 = MaxY - (MinY - v30);
        v18 = v18 + CGRectGetMinY(v34);
        v43.origin.x = v16;
        v43.origin.y = v18;
        v43.size.width = v20;
        v43.size.height = v22;
        if (CGRectGetMaxY(v43) > v31)
        {
          v44.origin.x = v16;
          v44.origin.y = v18;
          v44.size.width = v20;
          v44.size.height = v22;
          v18 = v31 - CGRectGetHeight(v44);
        }
      }
    }
  }
  -[TUICandidateGroupHeader virtualLabelContainerFrame](self, "virtualLabelContainerFrame", *(_QWORD *)&MaxY);
  v46.origin.x = v16;
  v46.origin.y = v18;
  v46.size.width = v20;
  v46.size.height = v22;
  if (!CGRectEqualToRect(v45, v46))
    -[TUICandidateGroupHeader setVirtualLabelContainerFrame:](self, "setVirtualLabelContainerFrame:", v16, v18, v20, v22);
}

- (void)setVirtualLabelContainerFrame:(CGRect)a3
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
  void *v20;
  id v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_virtualLabelContainerFrame = a3;
  -[TUICandidateGroupHeader style](self, "style");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "extraCellPadding");
  v9 = x + v8;
  v11 = y + v10;
  v13 = width - (v8 + v12);
  v15 = height - (v10 + v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v21, "groupHeaderPadding");
    v9 = v9 + v16;
    v11 = v11 + v17;
    v13 = v13 - (v16 + v18);
    v15 = v15 - (v17 + v19);
  }
  -[TUICandidateGroupHeader textLabel](self, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v9, v11, v13, v15);

}

- (NSString)text
{
  return self->_text;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (CGRect)virtualLabelContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_virtualLabelContainerFrame.origin.x;
  y = self->_virtualLabelContainerFrame.origin.y;
  width = self->_virtualLabelContainerFrame.size.width;
  height = self->_virtualLabelContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("TUICandidateGroupHeader");
}

@end
