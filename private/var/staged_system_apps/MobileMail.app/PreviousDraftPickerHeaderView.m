@implementation PreviousDraftPickerHeaderView

- (PreviousDraftPickerHeaderView)initWithFrame:(CGRect)a3
{
  PreviousDraftPickerHeaderView *v3;
  PreviousDraftPickerHeaderView *v4;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *activityIndicatorView;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PreviousDraftPickerHeaderView;
  v3 = -[PreviousDraftPickerHeaderView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PreviousDraftPickerHeaderView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[PreviousDraftPickerHeaderView setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
    v4->_completedFirstLoad = 0;
    v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    label = v4->_label;
    v4->_label = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailPreviousDraftPickerHeaderTextColor](UIColor, "mailPreviousDraftPickerHeaderTextColor"));
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v4->_label, "setBackgroundColor:", v8);

    -[PreviousDraftPickerHeaderView addSubview:](v4, "addSubview:", v4->_label);
    v9 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    activityIndicatorView = v4->_activityIndicatorView;
    v4->_activityIndicatorView = v9;

    -[UIActivityIndicatorView setHidesWhenStopped:](v4->_activityIndicatorView, "setHidesWhenStopped:", 1);
    -[PreviousDraftPickerHeaderView addSubview:](v4, "addSubview:", v4->_activityIndicatorView);
    -[PreviousDraftPickerHeaderView setLoading:immediately:](v4, "setLoading:immediately:", 1, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  -[PreviousDraftPickerHeaderView updateUI](self, "updateUI", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double MidX;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)PreviousDraftPickerHeaderView;
  -[PreviousDraftPickerHeaderView layoutSubviews](&v14, "layoutSubviews");
  -[PreviousDraftPickerHeaderView layoutMargins](self, "layoutMargins");
  v4 = v3;
  -[PreviousDraftPickerHeaderView layoutMargins](self, "layoutMargins");
  v6 = v5;
  -[PreviousDraftPickerHeaderView bounds](self, "bounds");
  v8 = v4 + v7;
  v10 = v9 + 0.0;
  v12 = v11 - (v4 + v6);
  -[UILabel setFrame:](self->_label, "setFrame:", v8, v9 + 0.0, v12, 35.0);
  v15.origin.x = v8;
  v15.origin.y = v10;
  v15.size.width = v12;
  v15.size.height = 35.0;
  MidX = CGRectGetMidX(v15);
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = 35.0;
  -[UIActivityIndicatorView setCenter:](self->_activityIndicatorView, "setCenter:", MidX, CGRectGetMidY(v16));
}

- (void)setHasDrafts:(BOOL)a3
{
  if (self->_hasDrafts != a3)
  {
    self->_hasDrafts = a3;
    -[PreviousDraftPickerHeaderView updateUI](self, "updateUI");
  }
}

- (void)setLoading:(BOOL)a3 immediately:(BOOL)a4
{
  double v6;

  if (self->_loading != a3)
  {
    self->_loading = a3;
    if (!self->_completedFirstLoad && a3)
      self->_completedFirstLoad = 1;
    if (a4)
    {
      -[PreviousDraftPickerHeaderView updateUI](self, "updateUI");
    }
    else
    {
      if (self->_loading)
        v6 = 2.0;
      else
        v6 = 1.0;
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "updateUI", 0);
      -[PreviousDraftPickerHeaderView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "updateUI", 0, v6);
    }
  }
}

- (void)updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "updateUI", 0);
  if (self->_hasDrafts)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PREVIOUS_DRAFT_PICKER_PREVIOUS_DRAFTS"), &stru_100531B00, CFSTR("Main")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedUppercaseString"));
    -[UILabel setText:](self->_label, "setText:", v5);

    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline1));
    -[UILabel setFont:](self->_label, "setFont:", v6);

LABEL_3:
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
    return;
  }
  if (!self->_loading && self->_completedFirstLoad)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PREVIOUS_DRAFT_PICKER_NO_DRAFTS"), &stru_100531B00, CFSTR("Main")));
    -[UILabel setText:](self->_label, "setText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
    -[UILabel setFont:](self->_label, "setFont:", v9);

    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    goto LABEL_3;
  }
  -[UILabel setText:](self->_label, "setText:", &stru_100531B00);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
