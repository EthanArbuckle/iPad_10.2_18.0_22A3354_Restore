@implementation THBookmarkMenuTableViewCell

- (THBookmarkMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  THBookmarkMenuTableViewCell *v4;
  THBookmarkMenuTableViewCell *v5;
  id v6;
  THAspectFitImageView *v7;
  double v8;
  UILabel *v9;
  id v10;
  double v11;
  double v12;
  NSDictionary *v13;
  NSDictionary *v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THBookmarkMenuTableViewCell;
  v4 = -[THBookmarkMenuTableViewCell initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = -[THBookmarkMenuTableViewCell contentView](v4, "contentView");
    v7 = objc_alloc_init(THAspectFitImageView);
    -[THAspectFitImageView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[THAspectFitImageView setPreferredMaxLayoutHeight:](v7, "setPreferredMaxLayoutHeight:", 45.0);
    -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
    objc_msgSend(-[THAspectFitImageView layer](v7, "layer"), "setBorderWidth:", 1.0 / v8);
    objc_msgSend(v6, "addSubview:", v7);
    v5->_thumbnail = &v7->super;
    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](v9, "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    objc_msgSend(v6, "addSubview:", v9);
    v5->_bookmarkTitleLabel = v9;
    v10 = objc_alloc_init((Class)BETableViewCellPageNumberLabel);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v10);
    v5->_pageNumberLabel = (BETableViewCellPageNumberLabel *)v10;
    LODWORD(v11) = 1144750080;
    objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    LODWORD(v12) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v9, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    v13 = _NSDictionaryOfVariableBindings(CFSTR("thumbnail, bookmarkTitleLabel, pageNumberLabel"), v7, v9, v10, 0);
    v14 = _NSDictionaryOfVariableBindings(CFSTR("kHorizontalInset, kGapBetweenLabels, kImageViewMaxWidth"), &off_468F78, &off_468F78, &off_468F88, 0);
    v15 = +[NSMutableArray array](NSMutableArray, "array");
    objc_msgSend(v15, "addObjectsFromArray:", +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(==kHorizontalInset)-[thumbnail(==kImageViewMaxWidth)]-(==kGapBetweenLabels)-[bookmarkTitleLabel]-(==kGapBetweenLabels)-[pageNumberLabel]-(==kHorizontalInset)-|"), 66560, v14, v13));
    objc_msgSend(v15, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v6, 10, 1.0, 0.0));
    objc_msgSend(-[THBookmarkMenuTableViewCell contentView](v5, "contentView"), "addConstraints:", v15);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THBookmarkMenuTableViewCell;
  -[THBookmarkMenuTableViewCell dealloc](&v3, "dealloc");
}

- (UIImageView)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UILabel)bookmarkTitleLabel
{
  return self->_bookmarkTitleLabel;
}

- (void)setBookmarkTitleLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BETableViewCellPageNumberLabel)pageNumberLabel
{
  return self->_pageNumberLabel;
}

- (void)setPageNumberLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
