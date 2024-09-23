@implementation CHHorizontalScrollingAchievementsTableViewCell

- (CHHorizontalScrollingAchievementsTableViewCell)initWithFrame:(CGRect)a3 badgeImageFactory:(id)a4 locProvider:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  CHHorizontalScrollingAchievementsTableViewCell *v13;
  UILabel *v14;
  UILabel *titleLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  CHHorizontalScrollingAchievementsView *v24;
  CHHorizontalScrollingAchievementsView *achievementsView;
  void *v26;
  UIView *v27;
  UIView *topDivider;
  UIView *v29;
  void *v30;
  void *v31;
  objc_super v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)CHHorizontalScrollingAchievementsTableViewCell;
  v13 = -[CHHorizontalScrollingAchievementsTableViewCell initWithFrame:](&v33, "initWithFrame:", x, y, width, height);
  if (v13)
  {
    v14 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v13->_titleLabel;
    v13->_titleLabel = v14;

    v16 = v13->_titleLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0));
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = v13->_titleLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    v20 = v13->_titleLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("AWARDS"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[UILabel setText:](v20, "setText:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell contentView](v13, "contentView"));
    objc_msgSend(v23, "addSubview:", v13->_titleLabel);

    v24 = -[CHHorizontalScrollingAchievementsView initWithFrame:badgeImageFactory:locProvider:]([CHHorizontalScrollingAchievementsView alloc], "initWithFrame:badgeImageFactory:locProvider:", v11, v12, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    achievementsView = v13->_achievementsView;
    v13->_achievementsView = v24;

    -[CHHorizontalScrollingAchievementsView setDelegate:](v13->_achievementsView, "setDelegate:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell contentView](v13, "contentView"));
    objc_msgSend(v26, "addSubview:", v13->_achievementsView);

    v27 = (UIView *)objc_alloc_init((Class)UIView);
    topDivider = v13->_topDivider;
    v13->_topDivider = v27;

    v29 = v13->_topDivider;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.300000012, 1.0));
    -[UIView setBackgroundColor:](v29, "setBackgroundColor:", v30);

    -[CHHorizontalScrollingAchievementsTableViewCell addSubview:](v13, "addSubview:", v13->_topDivider);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CHHorizontalScrollingAchievementsTableViewCell setBackgroundColor:](v13, "setBackgroundColor:", v31);

    -[CHHorizontalScrollingAchievementsTableViewCell setSelectionStyle:](v13, "setSelectionStyle:", 0);
  }

  return v13;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 124.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  void *v25;
  CGFloat v26;
  void *v27;
  double bottom;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  CGRect v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CHHorizontalScrollingAchievementsTableViewCell;
  -[CHHorizontalScrollingAchievementsTableViewCell layoutSubviews](&v35, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell contentView](self, "contentView"));
  objc_msgSend(v12, "bounds");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v15, "sizeToFit");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v16, "frame");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v19, "frame");
  v34.origin.x = 16.0;
  v34.origin.y = 5.0;
  v34.size.width = v18;
  v34.size.height = v20;

  FIUIFlipFrameRightToLeftIfNeeded(&v34, v5, v7, v9, v11);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v25, "setFrame:", x, y, width, height);

  v26 = CGRectGetMaxY(v34) + 6.0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell achievementsView](self, "achievementsView"));
  objc_msgSend(v27, "setFrame:", 0.0, v26, v14, 70.0);

  bottom = UIEdgeInsetsZero.bottom;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell achievementsView](self, "achievementsView"));
  objc_msgSend(v29, "setScrollViewContentInset:", UIEdgeInsetsZero.top, 16.0 + 2.0, bottom, 16.0 + 2.0);

  if (qword_10083E098 != -1)
    dispatch_once(&qword_10083E098, &stru_100779F08);
  v30 = *(double *)&qword_10083E090;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell topDivider](self, "topDivider", *(_QWORD *)&v34.origin.x, *(_QWORD *)&v34.origin.y, *(_QWORD *)&v34.size.width, *(_QWORD *)&v34.size.height));
  objc_msgSend(v31, "setFrame:", 16.0, 0.0, v14, v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell topDivider](self, "topDivider"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell contentView](self, "contentView"));
  objc_msgSend(v33, "bounds");
  FIUIFlipViewRightToLeftIfNeeded(v32);

}

- (void)setAchievements:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell achievementsView](self, "achievementsView"));
  objc_msgSend(v5, "setAchievements:", v4);

  -[CHHorizontalScrollingAchievementsTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)hasVisibleAchievements
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell achievementsView](self, "achievementsView"));
  v3 = objc_msgSend(v2, "hasVisibleAchievements");

  return v3;
}

- (void)achievementsView:(id)a3 didTapAchievement:(id)a4 cell:(id)a5
{
  id v7;
  id v8;
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
  double v20;
  id v21;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v7, "badgeFrame");
  objc_msgSend(v7, "convertRect:toView:", self);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  +[AAUIBadgeView badgeAspectRatio](AAUIBadgeView, "badgeAspectRatio");
  v18 = (v16 * v17 - v16) * -0.5;
  v19 = v16 / v17;
  v20 = v12 + v18;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[CHHorizontalScrollingAchievementsTableViewCell delegate](self, "delegate"));
  objc_msgSend(v21, "achievementsCell:didTapAchievement:subCell:frameInCHHorizontalScrollingAchievementsTableViewCellCoordinates:", self, v8, v7, v10, v20, v14, v19);

}

- (CHHorizontalScrollingAchievementsTableViewCellDelegate)delegate
{
  return (CHHorizontalScrollingAchievementsTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)topDivider
{
  return self->_topDivider;
}

- (void)setTopDivider:(id)a3
{
  objc_storeStrong((id *)&self->_topDivider, a3);
}

- (CHHorizontalScrollingAchievementsView)achievementsView
{
  return self->_achievementsView;
}

- (void)setAchievementsView:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_achievementsView, 0);
  objc_storeStrong((id *)&self->_topDivider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
