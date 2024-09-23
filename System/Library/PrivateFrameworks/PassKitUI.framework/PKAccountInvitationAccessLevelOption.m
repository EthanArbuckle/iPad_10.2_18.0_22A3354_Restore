@implementation PKAccountInvitationAccessLevelOption

- (PKAccountInvitationAccessLevelOption)initWithAccessLevel:(unint64_t)a3
{
  PKAccountInvitationAccessLevelOption *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountInvitationAccessLevelOption;
  result = -[PKAccountInvitationAccessLevelOption init](&v5, sel_init);
  if (result)
    result->_accessLevel = a3;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)secondarySubtitle
{
  return self->_secondarySubtitle;
}

- (void)setSecondarySubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
