@implementation PKWeekdaySelectionCollectionViewCell

- (PKWeekdaySelectionCollectionViewCell)init
{
  return -[PKWeekdaySelectionCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKWeekdaySelectionCollectionViewCell)initWithSize:(CGSize)a3
{
  return -[PKWeekdaySelectionCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
}

- (PKWeekdaySelectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKWeekdaySelectionCollectionViewCell *v3;
  PKWeekdaySelector *v4;
  PKWeekdaySelector *weekdaySelector;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKWeekdaySelectionCollectionViewCell;
  v3 = -[PKWeekdaySelectionCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PKWeekdaySelector);
    weekdaySelector = v3->_weekdaySelector;
    v3->_weekdaySelector = v4;

    -[PKWeekdaySelectionCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_weekdaySelector);

  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  -[PKWeekdaySelector setDelegate:](self->_weekdaySelector, "setDelegate:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKWeekdaySelectionCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKWeekdaySelectionCollectionViewCell;
  -[PKWeekdaySelectionCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKWeekdaySelectionCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKWeekdaySelectionCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.size.width;
  -[PKWeekdaySelector sizeThatFits:](self->_weekdaySelector, "sizeThatFits:", a3.size.width, 1.79769313e308);
  v9 = v8;
  if (!a4)
    -[PKWeekdaySelector setFrame:](self->_weekdaySelector, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8) + 15.0, v7, v8);
  v10 = v9 + 30.0;
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKWeekdaySelectionCollectionViewCell;
  v4 = a3;
  -[PKWeekdaySelectionCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[PKWeekdaySelectionCollectionViewCell contentView](self, "contentView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[PKWeekdaySelector setBackgroundColor:](self->_weekdaySelector, "setBackgroundColor:", v4);
}

- (void)setSelectedDays:(id)a3 possibleDays:(id)a4
{
  -[PKWeekdaySelector setSelectedDays:possibleDays:](self->_weekdaySelector, "setSelectedDays:possibleDays:", a3, a4);
}

- (PKWeekdaySelectorDelegate)delegate
{
  return (PKWeekdaySelectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weekdaySelector, 0);
}

@end
