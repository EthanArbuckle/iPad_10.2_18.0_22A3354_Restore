@implementation TUIPredictionCellButton

- (TUIPredictionCellButton)initWithFrame:(CGRect)a3
{
  TUIPredictionCellButton *v3;
  TUIPredictionViewCell *v4;
  uint64_t v5;
  TUIPredictionViewCell *cellView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIPredictionCellButton;
  v3 = -[TUIPredictionCellButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TUIPredictionViewCell alloc];
    v5 = -[TUIPredictionViewCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    cellView = v3->_cellView;
    v3->_cellView = (TUIPredictionViewCell *)v5;

    -[TUIPredictionViewCell setUserInteractionEnabled:](v3->_cellView, "setUserInteractionEnabled:", 0);
    -[TUIPredictionCellButton addSubview:](v3, "addSubview:", v3->_cellView);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIPredictionCellButton;
  -[TUIPredictionCellButton layoutSubviews](&v3, sel_layoutSubviews);
  -[TUIPredictionCellButton bounds](self, "bounds");
  -[TUIPredictionViewCell setFrame:](self->_cellView, "setFrame:");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIPredictionCellButton;
  -[TUIPredictionCellButton setHighlighted:](&v5, sel_setHighlighted_);
  -[TUIPredictionViewCell setHighlighted:](self->_cellView, "setHighlighted:", v3);
}

- (TUIPredictionViewCell)cellView
{
  return self->_cellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellView, 0);
}

@end
