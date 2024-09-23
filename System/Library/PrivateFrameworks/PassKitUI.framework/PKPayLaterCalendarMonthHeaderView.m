@implementation PKPayLaterCalendarMonthHeaderView

- (PKPayLaterCalendarMonthHeaderView)initWithInstallmentsMonth:(id)a3
{
  id v5;
  PKPayLaterCalendarMonthHeaderView *v6;
  PKPayLaterCalendarMonthHeaderView *v7;
  int v8;
  UILabel *v9;
  UILabel *totalPaidLabel;
  UILabel *v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  UILabel *v21;
  UILabel *totalDueLabel;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  UILabel *v29;
  UILabel *totalPaidAmountLabel;
  void *v31;
  void *v32;
  char v33;
  UILabel *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  UILabel *v39;
  void *v40;
  UILabel *v41;
  void *v42;
  UILabel *v43;
  UILabel *totalDueAmountLabel;
  void *v45;
  UILabel *v46;
  void *v47;
  UILabel *v48;
  void *v49;
  UILabel *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  id v55;
  objc_super v56;

  v5 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PKPayLaterCalendarMonthHeaderView;
  v6 = -[PKPayLaterCalendarMonthHeaderView initWithFrame:](&v56, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v55 = v5;
    objc_storeStrong((id *)&v6->_installmentsMonth, a3);
    v8 = -[PKPayLaterCalendarMonthHeaderView _shouldReverseLayoutDirection](v7, "_shouldReverseLayoutDirection");
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    totalPaidLabel = v7->_totalPaidLabel;
    v7->_totalPaidLabel = v9;

    -[UILabel setAccessibilityIdentifier:](v7->_totalPaidLabel, "setAccessibilityIdentifier:", CFSTR("PKPayLaterCalendarMonthHeaderView.totalPaidLabel"));
    v11 = v7->_totalPaidLabel;
    v12 = (NSString *)*MEMORY[0x1E0DC4A88];
    v13 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v14);

    v15 = v7->_totalPaidLabel;
    PKLocalizedCocoonString(CFSTR("TOTAL_PAID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v15, "setText:", v16);

    v17 = v7->_totalPaidLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    if (v8)
      v19 = 2;
    else
      v19 = 0;
    if (v8)
      v20 = 0;
    else
      v20 = 2;
    v53 = v19;
    -[UILabel setTextAlignment:](v7->_totalPaidLabel, "setTextAlignment:");
    -[PKPayLaterCalendarMonthHeaderView addSubview:](v7, "addSubview:", v7->_totalPaidLabel);
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    totalDueLabel = v7->_totalDueLabel;
    v7->_totalDueLabel = v21;

    -[UILabel setAccessibilityIdentifier:](v7->_totalDueLabel, "setAccessibilityIdentifier:", CFSTR("PKPayLaterCalendarMonthHeaderView.totalDueLabel"));
    v23 = v7->_totalDueLabel;
    PKFontForDefaultDesign(v12, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v24);

    v25 = v7->_totalDueLabel;
    PKLocalizedCocoonString(CFSTR("TOTAL_REMAINING"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v25, "setText:", v26);

    v27 = v7->_totalDueLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    v54 = v20;
    -[UILabel setTextAlignment:](v7->_totalDueLabel, "setTextAlignment:", v20);
    -[PKPayLaterCalendarMonthHeaderView addSubview:](v7, "addSubview:", v7->_totalDueLabel);
    v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    totalPaidAmountLabel = v7->_totalPaidAmountLabel;
    v7->_totalPaidAmountLabel = v29;

    -[UILabel setAccessibilityIdentifier:](v7->_totalPaidAmountLabel, "setAccessibilityIdentifier:", CFSTR("PKPayLaterCalendarMonthHeaderView.totalPaidAmountLabel"));
    -[PKPayLaterInstallmentsMonth totalPaid](v7->_installmentsMonth, "totalPaid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "amount");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "pk_isPositiveNumber");

    v34 = v7->_totalPaidAmountLabel;
    v35 = (void *)*MEMORY[0x1E0DC13A8];
    v36 = (void *)*MEMORY[0x1E0DC4B50];
    v37 = *MEMORY[0x1E0DC1420];
    PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], v13, 32770, 0, *MEMORY[0x1E0DC1420]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v34, "setFont:", v38);

    v39 = v7->_totalPaidAmountLabel;
    objc_msgSend(v31, "formattedStringValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v39, "setText:", v40);

    v41 = v7->_totalPaidAmountLabel;
    if ((v33 & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v41, "setTextColor:", v42);

    -[UILabel setTextAlignment:](v7->_totalPaidAmountLabel, "setTextAlignment:", v53);
    -[PKPayLaterCalendarMonthHeaderView addSubview:](v7, "addSubview:", v7->_totalPaidAmountLabel);
    v43 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    totalDueAmountLabel = v7->_totalDueAmountLabel;
    v7->_totalDueAmountLabel = v43;

    -[UILabel setAccessibilityIdentifier:](v7->_totalDueAmountLabel, "setAccessibilityIdentifier:", CFSTR("PKPayLaterCalendarMonthHeaderView.totalDueAmountLabel"));
    -[PKPayLaterInstallmentsMonth totalDue](v7->_installmentsMonth, "totalDue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v7->_totalDueAmountLabel;
    PKFontForDesign(v35, v36, v13, 32770, 0, v37);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v46, "setFont:", v47);

    v48 = v7->_totalDueAmountLabel;
    objc_msgSend(v45, "formattedStringValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v48, "setText:", v49);

    v50 = v7->_totalDueAmountLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v50, "setTextColor:", v51);

    -[UILabel setTextAlignment:](v7->_totalDueAmountLabel, "setTextAlignment:", v54);
    -[PKPayLaterCalendarMonthHeaderView addSubview:](v7, "addSubview:", v7->_totalDueAmountLabel);

    v5 = v55;
  }

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterCalendarMonthHeaderView;
  -[PKPayLaterCalendarMonthHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPayLaterCalendarMonthHeaderView bounds](self, "bounds");
  -[PKPayLaterCalendarMonthHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPayLaterCalendarMonthHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UILabel sizeThatFits:](self->_totalPaidLabel, "sizeThatFits:", a3.size.width, 3.40282347e38);
  v11 = v10;
  -[UILabel sizeThatFits:](self->_totalDueLabel, "sizeThatFits:", width, 3.40282347e38);
  v13 = v12;
  -[UILabel sizeThatFits:](self->_totalPaidAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  v15 = v14;
  -[UILabel sizeThatFits:](self->_totalDueAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  v17 = v15 + v16;
  if (v11 + v13 <= width && v17 <= width)
    -[PKPayLaterCalendarMonthHeaderView _layoutLabelsSideBySide:isTemplateLayout:](self, "_layoutLabelsSideBySide:isTemplateLayout:", v4, x, y, width, height);
  else
    -[PKPayLaterCalendarMonthHeaderView _layoutLabelsStacked:isTemplateLayout:](self, "_layoutLabelsStacked:isTemplateLayout:", v4, x, y, width, height);
  v20 = v19 + 0.0;
  v21 = width;
  result.height = v20;
  result.width = v21;
  return result;
}

- (double)_layoutLabelsSideBySide:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  CGRectEdge v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect remainder;
  CGRect slice;
  CGRect v53;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKPayLaterCalendarMonthHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v11 = CGRectMinXEdge;
  else
    v11 = CGRectMaxXEdge;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  -[UILabel sizeThatFits:](self->_totalPaidLabel, "sizeThatFits:", width, 3.40282347e38);
  v13 = v12;
  -[UILabel sizeThatFits:](self->_totalDueLabel, "sizeThatFits:", width, 3.40282347e38);
  v15 = v14;
  v17 = fmax(v13, v16);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  CGRectDivide(v53, &slice, &remainder, v17, CGRectMinYEdge);
  memset(&v50, 0, sizeof(v50));
  CGRectDivide(slice, &v50, &slice, v15, v11);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v50.origin.x = v18;
  v50.origin.y = v19;
  v50.size.width = v20;
  v50.size.height = v21;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v47 = v23;
  v48 = v22;
  v25 = v24;
  v27 = v26;
  -[UILabel sizeThatFits:](self->_totalPaidAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  v29 = v28;
  -[UILabel sizeThatFits:](self->_totalDueAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  v31 = v30;
  v33 = fmax(v29, v32);
  CGRectDivide(remainder, &slice, &remainder, v33, CGRectMinYEdge);
  memset(&v49, 0, sizeof(v49));
  CGRectDivide(slice, &v49, &slice, v31, v11);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v49.origin.x = v34;
  v49.origin.y = v35;
  v49.size.width = v36;
  v49.size.height = v37;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  if (!a4)
  {
    v42 = v38;
    v43 = v39;
    v44 = v40;
    v45 = v41;
    -[UILabel setFrame:](self->_totalPaidLabel, "setFrame:", v48, v47, v25, v27);
    -[UILabel setFrame:](self->_totalDueLabel, "setFrame:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    -[UILabel setFrame:](self->_totalPaidAmountLabel, "setFrame:", v42, v43, v44, v45);
    -[UILabel setFrame:](self->_totalDueAmountLabel, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
  }
  return v17 + 0.0 + v33;
}

- (double)_layoutLabelsStacked:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect remainder;
  CGRect slice;
  CGRect v50;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKPayLaterCalendarMonthHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  -[UILabel sizeThatFits:](self->_totalPaidLabel, "sizeThatFits:", width, 3.40282347e38);
  v11 = v10;
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  CGRectDivide(v50, &slice, &remainder, v11, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v45 = v13;
  v46 = v12;
  v44 = v14;
  v47 = v15;
  -[UILabel sizeThatFits:](self->_totalPaidAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v16, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v42 = v18;
  v43 = v17;
  v41 = v19;
  v21 = v20;
  CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_totalDueLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v22, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v40 = v23;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[UILabel sizeThatFits:](self->_totalDueAmountLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v30, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v35 = v34;
  if (!a4)
  {
    v36 = v31;
    v37 = v32;
    v38 = v33;
    -[UILabel setFrame:](self->_totalPaidLabel, "setFrame:", v46, v45, v44, v47);
    -[UILabel setFrame:](self->_totalPaidAmountLabel, "setFrame:", v43, v42, v41, v21);
    -[UILabel setFrame:](self->_totalDueLabel, "setFrame:", v40, v25, v27, v29);
    -[UILabel setFrame:](self->_totalDueAmountLabel, "setFrame:", v36, v37, v38, v35);
  }
  return v47 + 0.0 + v21 + 10.0 + v29 + v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalPaidAmountLabel, 0);
  objc_storeStrong((id *)&self->_totalPaidLabel, 0);
  objc_storeStrong((id *)&self->_totalDueAmountLabel, 0);
  objc_storeStrong((id *)&self->_totalDueLabel, 0);
  objc_storeStrong((id *)&self->_installmentsMonth, 0);
}

@end
