@implementation THGlossaryTermTableViewCell

- (THGlossaryTermTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  THGlossaryTermTableViewCell *v4;
  THGlossaryTermTableViewCell *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THGlossaryTermTableViewCell;
  v4 = -[THGlossaryTermTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->mSelectedAppearance = 0;
    v4->mLastEntryAppearance = 0;
    v6 = objc_alloc((Class)UIView);
    -[THGlossaryTermTableViewCell frame](v5, "frame");
    v7 = objc_msgSend(v6, "initWithFrame:");
    -[THGlossaryTermTableViewCell setSelectedBackgroundView:](v5, "setSelectedBackgroundView:", v7);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mLabelWithHighlights = 0;
  self->_separatorView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermTableViewCell;
  -[THGlossaryTermTableViewCell dealloc](&v3, "dealloc");
}

- (THLabelWithWordHighlights)labelWithHighlights
{
  THLabelWithWordHighlights *result;
  double v4;
  double v5;
  THLabelWithWordHighlights *v6;

  result = self->mLabelWithHighlights;
  if (!result)
  {
    objc_msgSend(-[THGlossaryTermTableViewCell contentView](self, "contentView"), "bounds");
    v6 = -[THLabelWithWordHighlights initWithFrame:]([THLabelWithWordHighlights alloc], "initWithFrame:", 0.0, 0.0, v4, v5);
    self->mLabelWithHighlights = v6;
    -[THLabelWithWordHighlights setContentMode:](v6, "setContentMode:", 7);
    objc_msgSend(-[THGlossaryTermTableViewCell contentView](self, "contentView"), "addSubview:", self->mLabelWithHighlights);
    return self->mLabelWithHighlights;
  }
  return result;
}

- (UIView)separatorView
{
  UIView *result;
  double v4;
  double v5;

  result = self->_separatorView;
  if (!result)
  {
    objc_msgSend(-[THGlossaryTermTableViewCell contentView](self, "contentView"), "bounds");
    self->_separatorView = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v4, v5);
    objc_msgSend(-[THGlossaryTermTableViewCell contentView](self, "contentView"), "addSubview:", self->_separatorView);
    return self->_separatorView;
  }
  return result;
}

- (void)p_setSelectedAppearanceLastEntry:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v6;
  _BOOL4 v7;
  int v8;
  THLabelWithWordHighlights *v9;
  UIColor *v10;
  UIColor *v11;

  v4 = a3;
  if ((-[THGlossaryTermTableViewCell isSelected](self, "isSelected", a3, a4) & 1) != 0)
    v6 = 1;
  else
    v6 = -[THGlossaryTermTableViewCell isHighlighted](self, "isHighlighted");
  if (-[THGlossaryTermTableViewCell isFollowingCellSelected](self, "isFollowingCellSelected"))
    v7 = 1;
  else
    v7 = -[THGlossaryTermTableViewCell isFollowingCellHighlighted](self, "isFollowingCellHighlighted");
  if (self->mSelectedAppearance == v6 && self->mFollowingCellSelectedAppearance == v7)
  {
    v8 = 0;
  }
  else
  {
    -[UIView setHidden:](-[THGlossaryTermTableViewCell separatorView](self, "separatorView"), "setHidden:", v6 | v7);
    self->mSelectedAppearance = v6;
    self->mFollowingCellSelectedAppearance = v7;
    v8 = 1;
  }
  v9 = -[THGlossaryTermTableViewCell labelWithHighlights](self, "labelWithHighlights");
  if (self->mLastEntryAppearance != v4)
  {
    if (v4)
      v10 = +[UIColor blueColor](UIColor, "blueColor");
    else
      v10 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.203921569, 1.0);
    v11 = v10;
    -[THLabelWithWordHighlights setTextColor:](v9, "setTextColor:", v10);
    -[THLabelWithWordHighlights setHighlightedTextColor:](v9, "setHighlightedTextColor:", v11);
    self->mLastEntryAppearance = v4;
    goto LABEL_18;
  }
  if (v8)
  {
LABEL_18:
    -[THGlossaryTermTableViewCell setNeedsDisplay](self, "setNeedsDisplay");
    -[THLabelWithWordHighlights setNeedsDisplay](v9, "setNeedsDisplay");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  -[THGlossaryTermTableViewCell setFollowingCellHighlighted:](self, "setFollowingCellHighlighted:", 0);
  -[THGlossaryTermTableViewCell setFollowingCellSelected:](self, "setFollowingCellSelected:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermTableViewCell;
  -[THGlossaryTermTableViewCell prepareForReuse](&v3, "prepareForReuse");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)THGlossaryTermTableViewCell;
  -[THGlossaryTermTableViewCell setSelected:animated:](&v8, "setSelected:animated:");
  -[THGlossaryTermTableViewCellDelegate glossaryTermTableCell:selected:](-[THGlossaryTermTableViewCell delegate](self, "delegate"), "glossaryTermTableCell:selected:", self, v5);
  if (v5)
    v7 = -[THGlossaryTermTableViewCell selectedBackgroundView](self, "selectedBackgroundView");
  else
    v7 = -[THGlossaryTermTableViewCell contentView](self, "contentView");
  -[THGlossaryTermTableViewCell setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(v7, "backgroundColor"));
  -[THGlossaryTermTableViewCell p_setSelectedAppearanceLastEntry:animated:](self, "p_setSelectedAppearanceLastEntry:animated:", self->mLastEntryAppearance, v4);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)THGlossaryTermTableViewCell;
  -[THGlossaryTermTableViewCell setHighlighted:animated:](&v6, "setHighlighted:animated:", a3);
  -[THGlossaryTermTableViewCell p_setSelectedAppearanceLastEntry:animated:](self, "p_setSelectedAppearanceLastEntry:animated:", self->mLastEntryAppearance, v4);
}

- (void)setLastEntryAppearance:(BOOL)a3
{
  -[THGlossaryTermTableViewCell setLastEntryAppearance:animated:](self, "setLastEntryAppearance:animated:", a3, 0);
}

- (void)setFollowingCellHighlighted:(BOOL)a3
{
  if (self->mFollowingCellHighlighted != a3)
  {
    self->mFollowingCellHighlighted = a3;
    -[THGlossaryTermTableViewCell p_setSelectedAppearanceLastEntry:animated:](self, "p_setSelectedAppearanceLastEntry:animated:", self->mLastEntryAppearance, 0);
  }
}

- (void)setFollowingCellSelected:(BOOL)a3
{
  if (self->mFollowingCellSelected != a3)
  {
    self->mFollowingCellSelected = a3;
    -[THGlossaryTermTableViewCell p_setSelectedAppearanceLastEntry:animated:](self, "p_setSelectedAppearanceLastEntry:animated:", self->mLastEntryAppearance, 0);
  }
}

- (BOOL)isLastEntryAppearance
{
  return self->mLastEntryAppearance;
}

- (BOOL)isFollowingCellHighlighted
{
  return self->mFollowingCellHighlighted;
}

- (BOOL)isFollowingCellSelected
{
  return self->mFollowingCellSelected;
}

- (THGlossaryTermTableViewCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THGlossaryTermTableViewCellDelegate *)a3;
}

- (void)setSeparatorView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)preferDarkAppearance
{
  return self->_preferDarkAppearance;
}

- (void)setPreferDarkAppearance:(BOOL)a3
{
  self->_preferDarkAppearance = a3;
}

@end
