@implementation HKSHSleepApneaNotificationsFooter

- (HKSHSleepApneaNotificationsFooter)initWithText:(id)a3 link:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSHSleepApneaNotificationsFooter *v11;
  HKSHSleepApneaNotificationsFooter *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKSHSleepApneaNotificationsFooter;
  v11 = -[HKSHSleepApneaNotificationsFooter init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[HKSHSleepApneaNotificationsFooter setFooterText:](v11, "setFooterText:", v8);
    -[HKSHSleepApneaNotificationsFooter setFooterLink:](v12, "setFooterLink:", v9);
    -[HKSHSleepApneaNotificationsFooter setLinkURL:](v12, "setLinkURL:", v10);
  }

  return v12;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)footerLink
{
  return self->_footerLink;
}

- (void)setFooterLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_footerLink, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
}

@end
