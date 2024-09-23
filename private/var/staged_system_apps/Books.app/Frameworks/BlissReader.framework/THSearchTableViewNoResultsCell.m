@implementation THSearchTableViewNoResultsCell

- (THSearchTableViewNoResultsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  THSearchTableViewNoResultsCell *v4;
  THSearchTableViewNoResultsCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THSearchTableViewNoResultsCell;
  v4 = -[THSearchTableViewNoResultsCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[THSearchTableViewNoResultsCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](v5, "textLabel"), "setFont:", +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 14.0));
    objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](v5, "textLabel"), "setTextAlignment:", 1);
    objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](v5, "textLabel"), "setTextColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.298039228, 1.0));
    objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](v5, "textLabel"), "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Search Completed"), &stru_43D7D8, 0));
    objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](v5, "detailTextLabel"), "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
    objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](v5, "detailTextLabel"), "setTextAlignment:", 1);
    objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](v5, "detailTextLabel"), "setTextColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.101960786, 1.0));
  }
  return v5;
}

- (void)setSearchKind:(int)a3
{
  void *v5;
  const __CFString *v6;

  v5 = (void *)THBundle();
  if (a3)
    v6 = CFSTR("No matches in media found.");
  else
    v6 = CFSTR("No matches in text found.");
  objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "setText:", objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_43D7D8, 0));
}

- (void)layoutSubviews
{
  double MidX;
  double v4;
  double v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  v6.receiver = self;
  v6.super_class = (Class)THSearchTableViewNoResultsCell;
  -[THSearchTableViewNoResultsCell layoutSubviews](&v6, "layoutSubviews");
  objc_msgSend(-[THSearchTableViewNoResultsCell contentView](self, "contentView"), "bounds");
  MidX = CGRectGetMidX(v7);
  objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "center");
  objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "setCenter:", MidX, v4);
  objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "frame");
  v9 = CGRectIntegral(v8);
  objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "center");
  objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "setCenter:", MidX, v5);
  objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "frame");
  v11 = CGRectIntegral(v10);
  objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "setTextAlignment:", 1);
  objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "setNeedsLayout");
  objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "layoutIfNeeded");
  objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "setTextAlignment:", 1);
  objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "setNeedsLayout");
  objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "layoutIfNeeded");
  objc_msgSend(objc_msgSend(-[THSearchTableViewNoResultsCell textLabel](self, "textLabel"), "layer"), "removeAllAnimations");
  objc_msgSend(objc_msgSend(-[THSearchTableViewNoResultsCell detailTextLabel](self, "detailTextLabel"), "layer"), "removeAllAnimations");
}

@end
