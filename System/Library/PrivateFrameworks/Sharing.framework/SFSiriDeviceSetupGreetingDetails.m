@implementation SFSiriDeviceSetupGreetingDetails

- (NSArray)introWordTimings
{
  return self->_introWordTimings;
}

- (void)setIntroWordTimings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)dialogAText
{
  return self->_dialogAText;
}

- (void)setDialogAText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)dialogAWordTimings
{
  return self->_dialogAWordTimings;
}

- (void)setDialogAWordTimings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)dialogBPhraseTimings
{
  return self->_dialogBPhraseTimings;
}

- (void)setDialogBPhraseTimings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)dialogCPhraseTimings
{
  return self->_dialogCPhraseTimings;
}

- (void)setDialogCPhraseTimings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogCPhraseTimings, 0);
  objc_storeStrong((id *)&self->_dialogBPhraseTimings, 0);
  objc_storeStrong((id *)&self->_dialogAWordTimings, 0);
  objc_storeStrong((id *)&self->_dialogAText, 0);
  objc_storeStrong((id *)&self->_introWordTimings, 0);
}

@end
