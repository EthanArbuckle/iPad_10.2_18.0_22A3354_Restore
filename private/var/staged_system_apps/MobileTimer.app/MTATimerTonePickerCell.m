@implementation MTATimerTonePickerCell

- (MTATimerTonePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTATimerTonePickerCell *v4;
  MTATimerTonePickerCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTATimerTonePickerCell;
  v4 = -[MTATimerTonePickerCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTATimerTonePickerCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 0);
    -[MTATimerTonePickerCell setSeparatorInset:](v5, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_buttonBackgroundColor](UIColor, "mtui_buttonBackgroundColor"));
    -[MTATimerTonePickerCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

  }
  return v5;
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerTonePickerCell;
  -[MTATimerTonePickerCell didMoveToSuperview](&v7, "didMoveToSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTonePickerCell traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:](UIFont, "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:", UIFontTextStyleBody, UIContentSizeCategoryAccessibilityLarge, v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTonePickerCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTonePickerCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v6, "setFont:", v4);

}

@end
