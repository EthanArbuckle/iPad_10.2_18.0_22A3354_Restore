@implementation PUCurationTragicFailureInHighlightsGridDebugViewCell

- (PUCurationTragicFailureInHighlightsGridDebugViewCell)initWithFrame:(CGRect)a3
{
  PUCurationTragicFailureInHighlightsGridDebugViewCell *v3;
  UILabel *v4;
  UILabel *visibleLabel;
  UILabel *v6;
  UILabel *utilityTypesLabel;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewCell;
  v3 = -[PUPhotosGridCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    visibleLabel = v3->_visibleLabel;
    v3->_visibleLabel = v4;

    -[UILabel setText:](v3->_visibleLabel, "setText:", CFSTR("✅"));
    -[UILabel sizeToFit](v3->_visibleLabel, "sizeToFit");
    -[PUCurationTragicFailureInHighlightsGridDebugViewCell addSubview:](v3, "addSubview:", v3->_visibleLabel);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    utilityTypesLabel = v3->_utilityTypesLabel;
    v3->_utilityTypesLabel = v6;

    -[UILabel setText:](v3->_utilityTypesLabel, "setText:", CFSTR("🛑"));
    -[UILabel sizeToFit](v3->_utilityTypesLabel, "sizeToFit");
    -[PUCurationTragicFailureInHighlightsGridDebugViewCell addSubview:](v3, "addSubview:", v3->_utilityTypesLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewCell;
  -[PUPhotosGridCell layoutSubviews](&v8, sel_layoutSubviews);
  -[UILabel frame](self->_visibleLabel, "frame");
  -[UILabel setFrame:](self->_visibleLabel, "setFrame:", 5.0, 5.0);
  -[PUCurationTragicFailureInHighlightsGridDebugViewCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_visibleLabel);
  -[UILabel frame](self->_utilityTypesLabel, "frame");
  v4 = v3;
  v6 = v5;
  -[PUCurationTragicFailureInHighlightsGridDebugViewCell bounds](self, "bounds");
  -[UILabel setFrame:](self->_utilityTypesLabel, "setFrame:", 5.0, v7 + -26.0, v4, v6);
  -[PUCurationTragicFailureInHighlightsGridDebugViewCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_utilityTypesLabel);
}

- (void)setUtilityTypes:(unint64_t)a3
{
  const __CFString *v4;
  unint64_t utilityTypes;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;

  self->_utilityTypes = a3;
  if ((a3 & 1) != 0)
    v4 = CFSTR("❌");
  else
    v4 = CFSTR("✅");
  -[UILabel setText:](self->_visibleLabel, "setText:", v4);
  utilityTypes = self->_utilityTypes;
  v6 = CFSTR("🛑");
  if ((utilityTypes & 2) == 0)
    v6 = &stru_1E58AD278;
  v7 = CFSTR("🥱");
  if ((utilityTypes & 4) == 0)
    v7 = &stru_1E58AD278;
  if ((utilityTypes & 8) != 0)
    v8 = CFSTR("🤢");
  else
    v8 = &stru_1E58AD278;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v6, v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_utilityTypesLabel, "setText:", v9);
  -[UILabel sizeToFit](self->_utilityTypesLabel, "sizeToFit");

}

- (unint64_t)utilityTypes
{
  return self->_utilityTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilityTypesLabel, 0);
  objc_storeStrong((id *)&self->_visibleLabel, 0);
}

@end
