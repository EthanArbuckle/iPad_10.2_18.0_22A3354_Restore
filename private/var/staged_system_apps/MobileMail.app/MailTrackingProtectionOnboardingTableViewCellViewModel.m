@implementation MailTrackingProtectionOnboardingTableViewCellViewModel

- (MailTrackingProtectionOnboardingTableViewCellViewModel)initWithTitle:(id)a3 detail:(id)a4 image:(id)a5 isSelected:(BOOL)a6 preventTracking:(BOOL)a7 accessibilityIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  MailTrackingProtectionOnboardingTableViewCellViewModel *v18;
  MailTrackingProtectionOnboardingTableViewCellViewModel *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MailTrackingProtectionOnboardingTableViewCellViewModel;
  v18 = -[MailTrackingProtectionOnboardingTableViewCellViewModel init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_detail, a4);
    objc_storeStrong((id *)&v19->_image, a5);
    v19->_selected = a6;
    v19->_preventTracking = a7;
    objc_storeStrong((id *)&v19->_accessibilityIdentifier, a8);
  }

  return v19;
}

- (void)handleSelection
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  objc_msgSend(v3, "enableMailTrackingProtection:", -[MailTrackingProtectionOnboardingTableViewCellViewModel preventTracking](self, "preventTracking"));

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)preventTracking
{
  return self->_preventTracking;
}

- (void)setPreventTracking:(BOOL)a3
{
  self->_preventTracking = a3;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
