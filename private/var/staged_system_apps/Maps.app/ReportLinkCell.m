@implementation ReportLinkCell

- (ReportLinkCell)initWithFrame:(CGRect)a3
{
  ReportLinkCell *v3;
  ReportLinkCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ReportLinkCell;
  v3 = -[UserProfilePersonalizationLinkCell initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[ReportLinkCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UserProfilePersonalizationLinkCell setGlyphTintColor:](v4, "setGlyphTintColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
    -[UserProfilePersonalizationLinkCell setGlyphBackgroundColor:](v4, "setGlyphBackgroundColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfilePersonalizationLinkCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v10, "setNumberOfLines:", 2);

  }
  return v4;
}

- (void)setReportLink:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[ReportLink isEqual:](self->_reportLink, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_reportLink, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subtitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "icon"));
    -[UserProfilePersonalizationLinkCell updateTitle:subtitle:icon:](self, "updateTitle:subtitle:icon:", v5, v6, v7);

  }
}

- (ReportLink)reportLink
{
  return self->_reportLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportLink, 0);
}

@end
