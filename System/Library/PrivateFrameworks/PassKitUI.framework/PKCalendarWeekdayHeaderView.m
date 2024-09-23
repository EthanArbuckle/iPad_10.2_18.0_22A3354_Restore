@implementation PKCalendarWeekdayHeaderView

- (PKCalendarWeekdayHeaderView)initWithWeekdayString:(id)a3
{
  id v4;
  PKCalendarWeekdayHeaderView *v5;
  UILabel *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCalendarWeekdayHeaderView;
  v5 = -[PKCalendarWeekdayHeaderView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v5->_label;
    v5->_label = v6;

    v8 = v5->_label;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC48D8], 2, (unint64_t)*MEMORY[0x1E0DC1448]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[UILabel setText:](v5->_label, "setText:", v4);
    v10 = v5->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[PKCalendarWeekdayHeaderView addSubview:](v5, "addSubview:", v5->_label);
  }

  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCalendarWeekdayHeaderView;
  -[PKCalendarWeekdayHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKCalendarWeekdayHeaderView bounds](self, "bounds");
  -[PKCalendarWeekdayHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKCalendarWeekdayHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.size.width;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.size.width, 3.40282347e38);
  PKRectCenteredIntegralRect();
  v8 = v7;
  if (!a4)
    -[UILabel setFrame:](self->_label, "setFrame:");
  v9 = v8 + 0.0;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
