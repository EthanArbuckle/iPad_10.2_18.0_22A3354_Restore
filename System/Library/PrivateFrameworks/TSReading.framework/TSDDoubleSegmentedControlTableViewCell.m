@implementation TSDDoubleSegmentedControlTableViewCell

- (TSDDoubleSegmentedControlTableViewCell)initWithLeftSegmentedControl:(id)a3 rightSegmentedControl:(id)a4
{
  TSDDoubleSegmentedControlTableViewCell *v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDDoubleSegmentedControlTableViewCell;
  v6 = -[TSDDoubleSegmentedControlTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 0, 0);
  if (v6)
  {
    v6->mLeftSegmentedControl = (TSKSegmentedControl *)a3;
    v6->mRightSegmentedControl = (TSKSegmentedControl *)a4;
    if (TSUPhoneUI() && TSUStatusBarIsLandscape())
    {
      LODWORD(v7) = 1132134400;
      -[TSKSegmentedControl sizeToFitWidth:](v6->mLeftSegmentedControl, "sizeToFitWidth:", v7);
      LODWORD(v8) = 1128005632;
      -[TSKSegmentedControl sizeToFitWidth:](v6->mRightSegmentedControl, "sizeToFitWidth:", v8);
    }
    else
    {
      -[TSKSegmentedControl sizeToFit](v6->mLeftSegmentedControl, "sizeToFit");
      -[TSKSegmentedControl sizeToFit](v6->mRightSegmentedControl, "sizeToFit");
    }
    objc_msgSend((id)-[TSDDoubleSegmentedControlTableViewCell contentView](v6, "contentView"), "addSubview:", a3);
    objc_msgSend((id)-[TSDDoubleSegmentedControlTableViewCell contentView](v6, "contentView"), "addSubview:", a4);
    -[TSDDoubleSegmentedControlTableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDDoubleSegmentedControlTableViewCell;
  -[TSDDoubleSegmentedControlTableViewCell dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDDoubleSegmentedControlTableViewCell;
  -[TSDDoubleSegmentedControlTableViewCell layoutSubviews](&v10, sel_layoutSubviews);
  -[TSDDoubleSegmentedControlTableViewCell setBackgroundView:](self, "setBackgroundView:", 0);
  -[TSKSegmentedControl frame](self->mLeftSegmentedControl, "frame");
  -[TSKSegmentedControl setFrame:](self->mLeftSegmentedControl, "setFrame:", -1.0);
  -[TSKSegmentedControl frame](self->mRightSegmentedControl, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend((id)-[TSDDoubleSegmentedControlTableViewCell contentView](self, "contentView"), "frame");
  -[TSKSegmentedControl setFrame:](self->mRightSegmentedControl, "setFrame:", v9 - v6 + 3.0, v4, v6, v8);
}

- (TSKSegmentedControl)leftSegmentedControl
{
  return self->mLeftSegmentedControl;
}

- (TSKSegmentedControl)rightSegmentedControl
{
  return self->mRightSegmentedControl;
}

@end
