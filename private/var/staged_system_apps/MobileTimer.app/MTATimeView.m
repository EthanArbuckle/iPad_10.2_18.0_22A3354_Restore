@implementation MTATimeView

+ (double)defaultHeight
{
  return 0.0;
}

- (BOOL)showSubseconds
{
  return 0;
}

- (void)configureTimeLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_timeLabel, "setTextColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_timeLabel, "setBackgroundColor:", v4);

  -[UILabel setOpaque:](self->_timeLabel, "setOpaque:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UILabel setShadowColor:](self->_timeLabel, "setShadowColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1));
  -[UILabel setFont:](self->_timeLabel, "setFont:", v6);

  -[UILabel setTextAlignment:](self->_timeLabel, "setTextAlignment:", 2);
  -[UILabel setBaselineAdjustment:](self->_timeLabel, "setBaselineAdjustment:", 1);
  -[UILabel setLineBreakMode:](self->_timeLabel, "setLineBreakMode:", 2);
}

- (void)sizeLabelToFit
{
  -[MTATimeView setTime:](self, "setTime:", 0.0);
  -[UILabel sizeToFit](self->_timeLabel, "sizeToFit");
}

- (MTATimeView)init
{
  double y;
  double width;
  double height;
  MTATimeView *v5;
  MTATimeView *v6;
  UILabel *v7;
  UILabel *timeLabel;
  MTATimeView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTATimeView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v5 = -[MTATimeView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v6 = v5;
  if (v5)
  {
    -[MTATimeView setOpaque:](v5, "setOpaque:", 1);
    if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
    {
      v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      timeLabel = v6->_timeLabel;
      v6->_timeLabel = v7;

      -[MTATimeView configureTimeLabel](v6, "configureTimeLabel");
      -[MTATimeView sizeLabelToFit](v6, "sizeLabelToFit");
      -[MTATimeView configureBackground](v6, "configureBackground");
      -[MTATimeView setTime:](v6, "setTime:", 0.0);
      -[MTATimeView addSubview:](v6, "addSubview:", v6->_timeLabel);
    }
    v9 = v6;
  }

  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double maxTimeLabelWidth;
  UILabel *timeLabel;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTATimeView;
  -[MTATimeView layoutSubviews](&v13, "layoutSubviews");
  -[UILabel frame](self->_timeLabel, "frame");
  v4 = v3;
  v6 = v5;
  maxTimeLabelWidth = self->_maxTimeLabelWidth;
  timeLabel = self->_timeLabel;
  -[MTATimeView bounds](self, "bounds");
  -[UILabel sizeThatFits:](timeLabel, "sizeThatFits:", v9, v10);
  if (maxTimeLabelWidth >= v11)
    maxTimeLabelWidth = v11;
  -[MTATimeView bounds](self, "bounds");
  -[UILabel setFrame:](self->_timeLabel, "setFrame:", round((v12 - maxTimeLabelWidth) * 0.5), v4, maxTimeLabelWidth, v6);
}

- (void)handleLocaleChange
{
  ResetTimeFormatter(self, a2);
  -[MTATimeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTimeLabelFrame:(CGRect)a3
{
  self->_maxTimeLabelWidth = a3.size.width;
  -[UILabel setFrame:](self->_timeLabel, "setFrame:", a3.origin.x, a3.origin.y);
}

- (void)setTime:(double)a3
{
  uint64_t v4;
  id v5;

  self->_timeValue = a3;
  v4 = FormatTime(0, -[MTATimeView showSubseconds](self, "showSubseconds"), a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[UILabel setText:](self->_timeLabel, "setText:", v5);

}

- (double)time
{
  return self->_timeValue;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end
