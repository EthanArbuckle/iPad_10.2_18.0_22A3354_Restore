@implementation UGCUserInformationViewModel

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_storeStrong((id *)&self->_userName, a3);
}

- (NSString)userEmail
{
  return self->_userEmail;
}

- (void)setUserEmail:(id)a3
{
  objc_storeStrong((id *)&self->_userEmail, a3);
}

- (NSString)userCurrentLocation
{
  return self->_userCurrentLocation;
}

- (void)setUserCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_userCurrentLocation, a3);
}

- (UIImage)userIcon
{
  return self->_userIcon;
}

- (void)setUserIcon:(id)a3
{
  objc_storeStrong((id *)&self->_userIcon, a3);
}

- (NSString)legalDisclosureString
{
  return self->_legalDisclosureString;
}

- (void)setLegalDisclosureString:(id)a3
{
  objc_storeStrong((id *)&self->_legalDisclosureString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legalDisclosureString, 0);
  objc_storeStrong((id *)&self->_userIcon, 0);
  objc_storeStrong((id *)&self->_userCurrentLocation, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userName, 0);
}

@end
