@implementation RecordingActionItemView

- (RecordingActionItemView)initWithCoder:(id)a3
{
  RecordingActionItemView *v3;
  RecordingActionItemView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RecordingActionItemView;
  v3 = -[RecordingActionItemView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RecordingActionItemView _commonInit](v3, "_commonInit");
  return v4;
}

- (RecordingActionItemView)initWithFrame:(CGRect)a3
{
  RecordingActionItemView *v3;
  RecordingActionItemView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RecordingActionItemView;
  v3 = -[RecordingActionItemView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RecordingActionItemView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIImageView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;

  v9 = objc_opt_new(UILabel);
  self->_actionTitleLabel = v9;
  -[RecordingActionItemView addSubview:](self, "addSubview:", v9);
  -[UILabel addLeadingToLeadingMarginConstraintWithView:padding:](self->_actionTitleLabel, "addLeadingToLeadingMarginConstraintWithView:padding:", self, 0.0);
  -[UILabel addCenterYConstraintWithView:](self->_actionTitleLabel, "addCenterYConstraintWithView:", self);
  v3 = objc_opt_new(UIImageView);
  self->_actionImageView = v3;
  -[RecordingActionItemView addSubview:](self, "addSubview:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v4, "actionMenuImageSize");
  v6 = v5;
  v8 = v7;

  -[UIImageView constrainSize:](self->_actionImageView, "constrainSize:", v6, v8);
  -[UIImageView alignCenterTrailingToCenterTrailingMarginOfView:padding:](self->_actionImageView, "alignCenterTrailingToCenterTrailingMarginOfView:padding:", self, 0.0);

}

- (UILabel)actionTitleLabel
{
  return self->_actionTitleLabel;
}

- (void)setActionTitleLabel:(id)a3
{
  self->_actionTitleLabel = (UILabel *)a3;
}

- (UIImageView)actionImageView
{
  return self->_actionImageView;
}

- (void)setActionImageView:(id)a3
{
  self->_actionImageView = (UIImageView *)a3;
}

@end
