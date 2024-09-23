@implementation CHFriendDetailDateCell

- (CHFriendDetailDateCell)initWithFrame:(CGRect)a3
{
  CHFriendDetailDateCell *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableParagraphStyle *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double y;
  double width;
  double height;
  UILabel *v15;
  UILabel *dateLabel;
  UIView *v17;
  UIView *separatorView;
  void *v19;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[3];

  v21.receiver = self;
  v21.super_class = (Class)CHFriendDetailDateCell;
  v3 = -[CHFriendDetailDateCell initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 0x8000));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, 0.0));
    v7 = objc_opt_new(NSMutableParagraphStyle);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    -[NSMutableParagraphStyle setParagraphStyle:](v7, "setParagraphStyle:", v8);

    -[NSMutableParagraphStyle setLineSpacing:](v7, "setLineSpacing:", 0.0);
    v22[0] = NSParagraphStyleAttributeName;
    v22[1] = NSFontAttributeName;
    v23[0] = v7;
    v23[1] = v6;
    v22[2] = NSForegroundColorAttributeName;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v23[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));

    v11 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v15 = (UILabel *)objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = v15;

    -[UILabel setNumberOfLines:](v3->_dateLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_dateLabel, "setLineBreakMode:", 0);
    -[UILabel _setDefaultAttributes:](v3->_dateLabel, "_setDefaultAttributes:", v10);
    -[CHFriendDetailDateCell addSubview:](v3, "addSubview:", v3->_dateLabel);
    v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    separatorView = v3->_separatorView;
    v3->_separatorView = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v3->_separatorView, "setBackgroundColor:", v19);

    -[CHFriendDetailDateCell addSubview:](v3, "addSubview:", v3->_separatorView);
  }
  return v3;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_dateLabel, "setText:", a3);
  -[CHFriendDetailDateCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int IsRightToLeft;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v19.receiver = self;
  v19.super_class = (Class)CHFriendDetailDateCell;
  -[CHFriendDetailDateCell layoutSubviews](&v19, "layoutSubviews");
  -[CHFriendDetailDateCell bounds](self, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v7 = -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", CGRectGetWidth(v20) + -6.0, 1.79769313e308);
  v9 = v8;
  v11 = v10;
  IsRightToLeft = FIUILocaleIsRightToLeft(v7);
  v13 = 3.0;
  if (IsRightToLeft)
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v13 = CGRectGetWidth(v21) - v9 + -3.0;
  }
  -[UILabel setFrame:](self->_dateLabel, "setFrame:", v13, 0.0, v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_dateLabel, "font"));
  objc_msgSend(v14, "_scaledValueForValue:", 16.0);
  v16 = v15;

  -[UILabel _setFirstLineCapFrameOriginY:](self->_dateLabel, "_setFirstLineCapFrameOriginY:", v16);
  -[UILabel _lastLineBaselineFrameOriginY](self->_dateLabel, "_lastLineBaselineFrameOriginY");
  v18 = v17 + 17.5;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, v18, CGRectGetWidth(v22), 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
