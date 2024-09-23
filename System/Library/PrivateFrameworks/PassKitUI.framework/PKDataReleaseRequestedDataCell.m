@implementation PKDataReleaseRequestedDataCell

- (PKDataReleaseRequestedDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKDataReleaseRequestedDataCell *v4;
  NSString *v5;
  uint64_t v6;
  UIFont *titleFont;
  uint64_t v8;
  UIFont *subtitleFont;
  uint64_t v10;
  UIFont *bodyFont;
  NSMutableArray *v12;
  NSMutableArray *retainElementViews;
  NSMutableArray *v14;
  NSMutableArray *doNotRetainElementViews;
  NSMutableArray *v16;
  NSMutableArray *displayOnlyElementViews;
  void *v18;
  NSArray *v19;
  NSArray *intentRetainElements;
  NSArray *v21;
  NSArray *intentDoNotRetainElements;
  NSArray *v23;
  NSArray *intentDisplayOnlyElements;
  UIView *v25;
  UIView *separatorView1;
  UIView *v27;
  void *v28;
  UIView *v29;
  UIView *separatorView2;
  UIView *v31;
  void *v32;
  UILabel *v33;
  UILabel *titleLabel;
  UILabel *v35;
  UILabel *intentRetainLabel;
  UILabel *v37;
  void *v38;
  UILabel *v39;
  UILabel *intentDoNotRetainLabel;
  UILabel *v41;
  void *v42;
  UILabel *v43;
  UILabel *intentDisplayOnlyLabel;
  UILabel *v45;
  void *v46;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)PKDataReleaseRequestedDataCell;
  v4 = -[PKDataReleaseRequestedDataCell initWithStyle:reuseIdentifier:](&v48, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (NSString *)*MEMORY[0x1E0DC4938];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC4938]);
    v6 = objc_claimAutoreleasedReturnValue();
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v6;

    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], v5);
    v8 = objc_claimAutoreleasedReturnValue();
    subtitleFont = v4->_subtitleFont;
    v4->_subtitleFont = (UIFont *)v8;

    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], v5);
    v10 = objc_claimAutoreleasedReturnValue();
    bodyFont = v4->_bodyFont;
    v4->_bodyFont = (UIFont *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    retainElementViews = v4->_retainElementViews;
    v4->_retainElementViews = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    doNotRetainElementViews = v4->_doNotRetainElementViews;
    v4->_doNotRetainElementViews = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    displayOnlyElementViews = v4->_displayOnlyElementViews;
    v4->_displayOnlyElementViews = v16;

    -[PKDataReleaseRequestedDataCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    intentRetainElements = v4->_intentRetainElements;
    v4->_intentRetainElements = v19;

    v21 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    intentDoNotRetainElements = v4->_intentDoNotRetainElements;
    v4->_intentDoNotRetainElements = v21;

    v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    intentDisplayOnlyElements = v4->_intentDisplayOnlyElements;
    v4->_intentDisplayOnlyElements = v23;

    v25 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView1 = v4->_separatorView1;
    v4->_separatorView1 = v25;

    v27 = v4->_separatorView1;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v27, "setBackgroundColor:", v28);

    objc_msgSend(v18, "addSubview:", v4->_separatorView1);
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView2 = v4->_separatorView2;
    v4->_separatorView2 = v29;

    v31 = v4->_separatorView2;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v31, "setBackgroundColor:", v32);

    objc_msgSend(v18, "addSubview:", v4->_separatorView2);
    v33 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v33;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v4->_titleFont);
    objc_msgSend(v18, "addSubview:", v4->_titleLabel);
    v35 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    intentRetainLabel = v4->_intentRetainLabel;
    v4->_intentRetainLabel = v35;

    -[UILabel setFont:](v4->_intentRetainLabel, "setFont:", v4->_subtitleFont);
    v37 = v4->_intentRetainLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v37, "setTextColor:", v38);

    -[UILabel setNumberOfLines:](v4->_intentRetainLabel, "setNumberOfLines:", 0);
    objc_msgSend(v18, "addSubview:", v4->_intentRetainLabel);
    v39 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    intentDoNotRetainLabel = v4->_intentDoNotRetainLabel;
    v4->_intentDoNotRetainLabel = v39;

    -[UILabel setFont:](v4->_intentDoNotRetainLabel, "setFont:", v4->_subtitleFont);
    v41 = v4->_intentDoNotRetainLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v41, "setTextColor:", v42);

    -[UILabel setNumberOfLines:](v4->_intentDoNotRetainLabel, "setNumberOfLines:", 0);
    objc_msgSend(v18, "addSubview:", v4->_intentDoNotRetainLabel);
    v43 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    intentDisplayOnlyLabel = v4->_intentDisplayOnlyLabel;
    v4->_intentDisplayOnlyLabel = v43;

    -[UILabel setFont:](v4->_intentDisplayOnlyLabel, "setFont:", v4->_subtitleFont);
    v45 = v4->_intentDisplayOnlyLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v45, "setTextColor:", v46);

    -[UILabel setNumberOfLines:](v4->_intentDisplayOnlyLabel, "setNumberOfLines:", 0);
    objc_msgSend(v18, "addSubview:", v4->_intentDisplayOnlyLabel);

  }
  return v4;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[PKDataReleaseRequestedDataCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitleFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIFont isEqual:](self->_titleFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[UILabel setFont:](self->_titleLabel, "setFont:", v5);
    -[PKDataReleaseRequestedDataCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitleFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIFont isEqual:](self->_subtitleFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitleFont, a3);
    -[UILabel setFont:](self->_intentRetainLabel, "setFont:", v5);
    -[UILabel setFont:](self->_intentDoNotRetainLabel, "setFont:", v5);
    -[UILabel setFont:](self->_intentDisplayOnlyLabel, "setFont:", v5);
    -[PKDataReleaseRequestedDataCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBodyFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIFont isEqual:](self->_bodyFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bodyFont, a3);
    -[PKDataReleaseRequestedDataCell _recreateViews:forElements:](self, "_recreateViews:forElements:", self->_retainElementViews, self->_intentRetainElements);
    -[PKDataReleaseRequestedDataCell _recreateViews:forElements:](self, "_recreateViews:forElements:", self->_doNotRetainElementViews, self->_intentDoNotRetainElements);
    -[PKDataReleaseRequestedDataCell _recreateViews:forElements:](self, "_recreateViews:forElements:", self->_displayOnlyElementViews, self->_intentDisplayOnlyElements);
    -[PKDataReleaseRequestedDataCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)intentRetainTitle
{
  return -[UILabel text](self->_intentRetainLabel, "text");
}

- (void)setIntentRetainTitle:(id)a3
{
  -[UILabel setText:](self->_intentRetainLabel, "setText:", a3);
  -[PKDataReleaseRequestedDataCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)intentDoNotRetainTitle
{
  return -[UILabel text](self->_intentDoNotRetainLabel, "text");
}

- (void)setIntentDoNotRetainTitle:(id)a3
{
  -[UILabel setText:](self->_intentDoNotRetainLabel, "setText:", a3);
  -[PKDataReleaseRequestedDataCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)intentDisplayOnlyTitle
{
  return -[UILabel text](self->_intentDisplayOnlyLabel, "text");
}

- (void)setIntentDisplayOnlyTitle:(id)a3
{
  -[UILabel setText:](self->_intentDisplayOnlyLabel, "setText:", a3);
  -[PKDataReleaseRequestedDataCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIntentRetainElements:(id)a3
{
  NSArray *v4;
  NSArray *intentRetainElements;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  intentRetainElements = self->_intentRetainElements;
  self->_intentRetainElements = v4;

  -[PKDataReleaseRequestedDataCell _recreateViews:forElements:](self, "_recreateViews:forElements:", self->_retainElementViews, v6);
}

- (void)setIntentDoNotRetainElements:(id)a3
{
  NSArray *v4;
  NSArray *intentDoNotRetainElements;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  intentDoNotRetainElements = self->_intentDoNotRetainElements;
  self->_intentDoNotRetainElements = v4;

  -[PKDataReleaseRequestedDataCell _recreateViews:forElements:](self, "_recreateViews:forElements:", self->_doNotRetainElementViews, v6);
}

- (void)setIntentDisplayOnlyElements:(id)a3
{
  NSArray *v4;
  NSArray *intentDisplayOnlyElements;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  intentDisplayOnlyElements = self->_intentDisplayOnlyElements;
  self->_intentDisplayOnlyElements = v4;

  -[PKDataReleaseRequestedDataCell _recreateViews:forElements:](self, "_recreateViews:forElements:", self->_displayOnlyElementViews, v6);
}

- (void)_recreateViews:(id)a3 forElements:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  PKDataReleaseSingleElementView *v21;
  void *v22;
  UIFont *bodyFont;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v10++), "removeFromSuperview");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }
  objc_msgSend(v5, "removeAllObjects");
  -[PKDataReleaseRequestedDataCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v19);
        v21 = -[PKDataReleaseSingleElementView initWithFrame:]([PKDataReleaseSingleElementView alloc], "initWithFrame:", v15, v16, v17, v18);
        objc_msgSend(v20, "localizedTitle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        bodyFont = self->_bodyFont;
        objc_msgSend(v20, "icon");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDataReleaseSingleElementView setTitle:titleFont:image:](v21, "setTitle:titleFont:image:", v22, bodyFont, v24);

        objc_msgSend(v5, "addObject:", v21);
        objc_msgSend(v11, "addSubview:", v21);

        ++v19;
      }
      while (v13 != v19);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v13);
  }

  -[PKDataReleaseRequestedDataCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDataReleaseRequestedDataCell;
  -[PKDataReleaseRequestedDataCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PKDataReleaseRequestedDataCell bounds](self, "bounds");
  -[PKDataReleaseRequestedDataCell _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKDataReleaseRequestedDataCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat width;
  void *v5;
  NSString *v6;
  BOOL IsAccessibilityCategory;
  int v8;
  CGRectEdge v9;
  CGRectEdge v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  uint64_t v16;
  void (**v17)(void *, NSMutableArray *, UILabel *);
  void (**v18)(void *, _BOOL8, UIView *);
  _BOOL8 v19;
  _BOOL8 v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[7];
  _QWORD aBlock[9];
  CGRectEdge v26;
  CGRectEdge v27;
  BOOL v28;
  CGRect slice;
  uint64_t v30;
  CGRect *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  uint64_t v38;
  CGRect *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  CGSize result;

  width = a3.size.width;
  v38 = 0;
  v39 = (CGRect *)&v38;
  v40 = 0x4010000000;
  v41 = &unk_19E0C78CE;
  v42 = 0u;
  v43 = 0u;
  v30 = 0;
  v31 = (CGRect *)&v30;
  v32 = 0x4010000000;
  v33 = &unk_19E0C78CE;
  memset(&slice, 0, sizeof(slice));
  v34 = a3.origin.x + 0.0;
  v35 = a3.origin.y + 16.0;
  v36 = a3.size.width;
  v37 = a3.size.height + -32.0;
  -[PKDataReleaseRequestedDataCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  v8 = -[PKDataReleaseRequestedDataCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v8)
    v9 = CGRectMaxXEdge;
  else
    v9 = CGRectMinXEdge;
  if (v8)
    v10 = CGRectMinXEdge;
  else
    v10 = CGRectMaxXEdge;
  PKFloatFloorToPixel();
  v12 = v11;
  -[UIFont lineHeight](self->_bodyFont, "lineHeight");
  v14 = v13;
  CGRectDivide(v31[1], v39 + 1, v31 + 1, 16.0, v9);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v31[1].size.width, v31[1].size.height);
  CGRectDivide(v31[1], v39 + 1, v31 + 1, v15, CGRectMinYEdge);
  CGRectDivide(v39[1], &slice, v39 + 1, 16.0, v10);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v39[1].origin.x, v39[1].origin.y, v39[1].size.width, v39[1].size.height);
  CGRectDivide(v31[1], v39 + 1, v31 + 1, 4.0, CGRectMinYEdge);
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKDataReleaseRequestedDataCell__layoutWithBounds___block_invoke;
  aBlock[3] = &unk_1E3E628B0;
  aBlock[5] = &v30;
  aBlock[6] = &v38;
  aBlock[4] = self;
  v28 = IsAccessibilityCategory;
  v26 = v10;
  v27 = v9;
  aBlock[7] = v14;
  aBlock[8] = v12;
  v17 = (void (**)(void *, NSMutableArray *, UILabel *))_Block_copy(aBlock);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __52__PKDataReleaseRequestedDataCell__layoutWithBounds___block_invoke_2;
  v24[3] = &unk_1E3E628D8;
  v24[5] = &v30;
  v24[6] = &v38;
  v24[4] = self;
  v18 = (void (**)(void *, _BOOL8, UIView *))_Block_copy(v24);
  v17[2](v17, self->_retainElementViews, self->_intentRetainLabel);
  if (-[NSMutableArray count](self->_retainElementViews, "count"))
    v19 = -[NSMutableArray count](self->_doNotRetainElementViews, "count") != 0;
  else
    v19 = 0;
  v18[2](v18, v19, self->_separatorView1);
  v17[2](v17, self->_doNotRetainElementViews, self->_intentDoNotRetainLabel);
  if (-[NSMutableArray count](self->_doNotRetainElementViews, "count"))
    v20 = -[NSMutableArray count](self->_displayOnlyElementViews, "count") != 0;
  else
    v20 = 0;
  v18[2](v18, v20, self->_separatorView2);
  v17[2](v17, self->_displayOnlyElementViews, self->_intentDisplayOnlyLabel);
  v21 = v31[1].origin.y + 16.0;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v38, 8);
  v22 = width;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

void __52__PKDataReleaseRequestedDataCell__layoutWithBounds___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  CGFloat width;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGRect *v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  void *v21;
  CGRect *v22;
  CGRect *v23;
  CGFloat v24;
  CGFloat v25;
  CGPoint origin;
  CGFloat v27;
  CGRect v28;
  CGRect remainder;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      memset(&remainder, 0, sizeof(remainder));
      CGRectDivide(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), &remainder, 16.0, *(CGRectEdge *)(a1 + 72));
      objc_msgSend(v6, "sizeThatFits:", remainder.size.width, remainder.size.height);
      width = remainder.size.width;
      if (v11 <= remainder.size.width)
      {
        v13 = v9;
      }
      else
      {
        PKFloatCeilToPixel();
        v13 = v12;
        width = remainder.size.width;
      }
      x = remainder.origin.x;
      y = remainder.origin.y;
      height = remainder.size.height;
      CGRectDivide(*(CGRect *)(&width - 2), &remainder, (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v13, CGRectMinYEdge);
      v17 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
      v30.origin.x = v17[1].origin.x;
      v30.origin.y = v17[1].origin.y;
      ++v17;
      v30.size.width = v17->size.width;
      v30.size.height = v17->size.height;
      CGRectDivide(v30, (CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), v17, v13, CGRectMinYEdge);
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1096))
        objc_msgSend(v6, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    }
    memset(&remainder, 0, sizeof(remainder));
    v28.size = 0u;
    if (objc_msgSend(v5, "count", 0, 0))
    {
      v18 = 0;
      v19 = 1;
      do
      {
        v20 = v18;
        if (!*(_BYTE *)(a1 + 80))
        {
          if ((v18 & 1) != 0)
            v20 = (objc_msgSend(v5, "count", v18) + v18) >> 1;
          else
            v20 = v18 >> 1;
        }
        objc_msgSend(v5, "objectAtIndex:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 & 1) != 0)
        {
          v22 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
          v31.origin.x = v22[1].origin.x;
          v31.origin.y = v22[1].origin.y;
          ++v22;
          v31.size.width = v22->size.width;
          v31.size.height = v22->size.height;
          CGRectDivide(v31, &v28, v22, 8.0, CGRectMinYEdge);
          v23 = *(CGRect **)(*(_QWORD *)(a1 + 40) + 8);
          v32.origin.x = v23[1].origin.x;
          v32.origin.y = v23[1].origin.y;
          ++v23;
          v32.size.width = v23->size.width;
          v32.size.height = v23->size.height;
          CGRectDivide(v32, &v28, v23, *(CGFloat *)(a1 + 56), CGRectMinYEdge);
          if (!*(_BYTE *)(a1 + 80))
          {
            v19 = 0;
LABEL_21:
            v25 = *(double *)(a1 + 64);
            v24 = v28.size.width;
            goto LABEL_22;
          }
        }
        else
        {
          CGRectDivide(v28, &remainder, &v28, 12.0, *(CGRectEdge *)(a1 + 76));
        }
        CGRectDivide(v28, &remainder, &v28, 16.0, *(CGRectEdge *)(a1 + 72));
        if (!*(_BYTE *)(a1 + 80))
        {
          v19 = 1;
          goto LABEL_21;
        }
        v19 = 1;
        v24 = v28.size.width;
        v25 = v28.size.width;
LABEL_22:
        origin = v28.origin;
        v27 = v28.size.height;
        CGRectDivide(*(CGRect *)(&v24 - 2), &remainder, &v28, v25, *(CGRectEdge *)(a1 + 76));
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1096))
          objc_msgSend(v21, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);

        ++v18;
      }
      while (v18 < objc_msgSend(v5, "count"));
    }
  }

}

void __52__PKDataReleaseRequestedDataCell__layoutWithBounds___block_invoke_2(_QWORD *a1, int a2, void *a3)
{
  CGRect *v5;
  CGRect *v6;
  CGRect *v7;
  double v8;
  CGRect *v9;
  id v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v10 = a3;
  if (a2)
  {
    v5 = *(CGRect **)(a1[5] + 8);
    v11.origin.x = v5[1].origin.x;
    v11.origin.y = v5[1].origin.y;
    ++v5;
    v11.size.width = v5->size.width;
    v11.size.height = v5->size.height;
    CGRectDivide(v11, (CGRect *)(*(_QWORD *)(a1[6] + 8) + 32), v5, 16.0, CGRectMinYEdge);
    v6 = *(CGRect **)(a1[5] + 8);
    v7 = (CGRect *)(*(_QWORD *)(a1[6] + 8) + 32);
    v8 = PKUIPixelLength();
    v12.origin.x = v6[1].origin.x;
    v12.origin.y = v6[1].origin.y;
    ++v6;
    v12.size.width = v6->size.width;
    v12.size.height = v6->size.height;
    CGRectDivide(v12, v7, v6, v8, CGRectMinYEdge);
    if (!*(_BYTE *)(a1[4] + 1096))
      objc_msgSend(v10, "setFrame:", *(double *)(*(_QWORD *)(a1[6] + 8) + 32), *(double *)(*(_QWORD *)(a1[6] + 8) + 40), *(double *)(*(_QWORD *)(a1[6] + 8) + 48), *(double *)(*(_QWORD *)(a1[6] + 8) + 56));
    v9 = *(CGRect **)(a1[5] + 8);
    v13.origin.x = v9[1].origin.x;
    v13.origin.y = v9[1].origin.y;
    ++v9;
    v13.size.width = v9->size.width;
    v13.size.height = v9->size.height;
    CGRectDivide(v13, (CGRect *)(*(_QWORD *)(a1[6] + 8) + 32), v9, 16.0, CGRectMinYEdge);
  }
  objc_msgSend(v10, "setHidden:", a2 ^ 1u);

}

- (NSArray)intentRetainElements
{
  return self->_intentRetainElements;
}

- (NSArray)intentDoNotRetainElements
{
  return self->_intentDoNotRetainElements;
}

- (NSArray)intentDisplayOnlyElements
{
  return self->_intentDisplayOnlyElements;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)bodyFont
{
  return self->_bodyFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_intentDisplayOnlyElements, 0);
  objc_storeStrong((id *)&self->_intentDoNotRetainElements, 0);
  objc_storeStrong((id *)&self->_intentRetainElements, 0);
  objc_storeStrong((id *)&self->_displayOnlyElementViews, 0);
  objc_storeStrong((id *)&self->_intentDisplayOnlyLabel, 0);
  objc_storeStrong((id *)&self->_separatorView2, 0);
  objc_storeStrong((id *)&self->_doNotRetainElementViews, 0);
  objc_storeStrong((id *)&self->_intentDoNotRetainLabel, 0);
  objc_storeStrong((id *)&self->_separatorView1, 0);
  objc_storeStrong((id *)&self->_retainElementViews, 0);
  objc_storeStrong((id *)&self->_intentRetainLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
