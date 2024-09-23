@implementation VTUIDictationDataSharingOptInAlertViewModel

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)optInButtonTitle
{
  return self->_optInButtonTitle;
}

- (void)setOptInButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)learnMoreButtonTitle
{
  return self->_learnMoreButtonTitle;
}

- (void)setLearnMoreButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)optOutButtonTitle
{
  return self->_optOutButtonTitle;
}

- (void)setOptOutButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optOutButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreButtonTitle, 0);
  objc_storeStrong((id *)&self->_optInButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
