@implementation CTClientDelegate

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  (*((void (**)(void))self->_fCellInfoCb + 2))();
}

- (void)emergencyModeChanged:(id)a3 mode:(id)a4
{
  (*((void (**)(void))self->_fEmergModeCb + 2))();
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  (*((void (**)(void))self->_fSimStatusCb + 2))();
}

- (void)carrierBundleChange:(id)a3
{
  (*((void (**)(void))self->_fCarrierBundleChangeCb + 2))();
}

- (void)operatorBundleChange:(id)a3
{
  (*((void (**)(void))self->_fOperatorBundleChangeCb + 2))();
}

- (void)defaultBundleChange
{
  (*((void (**)(void))self->_fDefaultBundleChangeCb + 2))();
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  (*((void (**)(void))self->_fDisplayStatusCb + 2))();
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  (*((void (**)(void))self->_fDataStatusCb + 2))();
}

- (void)subscriptionInfoDidChange
{
  (*((void (**)(void))self->_fSubscriptionInfoCb + 2))();
}

- (void)subscriberCountryCodeDidChange:(id)a3
{
  (*((void (**)(void))self->_fSubscriberMccCb + 2))();
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  (*((void (**)(void))self->_fServingCellChangedCb + 2))();
}

- (void)servingNetworkChanged:(id)a3
{
  (*((void (**)(void))self->_fServingNetworkChangedCb + 2))();
}

- (void)postSUPLInitNotification:(id)a3 data:(id)a4
{
  (*((void (**)(void))self->_fSuplSmsCb + 2))();
}

- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7
{
  (*((void (**)(void))self->_fSmsSentCb + 2))();
}

- (void)preferredDataSimChanged:(id)a3
{
  (*((void (**)(void))self->_fprefDataSimChangedCb + 2))();
}

- (void)phoneNumberChanged:(id)a3
{
  (*((void (**)(void))self->_fPhoneNumberInfoCb + 2))();
}

- (void)phoneNumberAvailable:(id)a3
{
  (*((void (**)(void))self->_fPhoneNumberInfoCb + 2))();
}

- (void)voiceLinkQualityChanged:(id)a3 metric:(id)a4
{
  (*((void (**)(void))self->_fVoiceLinkQualityCb + 2))();
}

- (void)enhancedDataLinkQualityChanged:(id)a3 metric:(id)a4
{
  (*((void (**)(void))self->_fLinkQualityCb + 2))();
}

- (void)dualSimCapabilityDidChange
{
  (*((void (**)(void))self->_fTandemCapabilityChangeCb + 2))();
}

- (void)stewieSupportChanged
{
  (*((void (**)(void))self->_fStewieSupportChangedCb + 2))();
}

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
  (*((void (**)(void))self->_fImsRegStatusCb + 2))();
}

- (void)dealloc
{
  objc_super v3;

  self->_fEmergModeCb = 0;
  self->_fSimStatusCb = 0;

  self->_fCarrierBundleChangeCb = 0;
  self->_fOperatorBundleChangeCb = 0;

  self->_fDefaultBundleChangeCb = 0;
  self->_fDisplayStatusCb = 0;

  self->_fDataStatusCb = 0;
  self->_fSubscriptionInfoCb = 0;

  self->_fSubscriberMccCb = 0;
  self->_fCellInfoCb = 0;

  self->_fLinkQualityCb = 0;
  self->_fVoiceLinkQualityCb = 0;

  self->_fServingCellChangedCb = 0;
  self->_fServingNetworkChangedCb = 0;

  self->_fSuplSmsCb = 0;
  self->_fprefDataSimChangedCb = 0;

  self->_fTandemCapabilityChangeCb = 0;
  self->_fSmsSentCb = 0;

  self->_fPhoneNumberInfoCb = 0;
  self->_fStewieSupportChangedCb = 0;

  self->_fImsRegStatusCb = 0;
  v3.receiver = self;
  v3.super_class = (Class)CTClientDelegate;
  -[CTClientDelegate dealloc](&v3, "dealloc");
}

- (id)fEmergModeCb
{
  return self->_fEmergModeCb;
}

- (void)setFEmergModeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)fSimStatusCb
{
  return self->_fSimStatusCb;
}

- (void)setFSimStatusCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)fCarrierBundleChangeCb
{
  return self->_fCarrierBundleChangeCb;
}

- (void)setFCarrierBundleChangeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)fOperatorBundleChangeCb
{
  return self->_fOperatorBundleChangeCb;
}

- (void)setFOperatorBundleChangeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)fDefaultBundleChangeCb
{
  return self->_fDefaultBundleChangeCb;
}

- (void)setFDefaultBundleChangeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)fDisplayStatusCb
{
  return self->_fDisplayStatusCb;
}

- (void)setFDisplayStatusCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)fSubscriptionInfoCb
{
  return self->_fSubscriptionInfoCb;
}

- (void)setFSubscriptionInfoCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)fSubscriberMccCb
{
  return self->_fSubscriberMccCb;
}

- (void)setFSubscriberMccCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)fCellInfoCb
{
  return self->_fCellInfoCb;
}

- (void)setFCellInfoCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)fLinkQualityCb
{
  return self->_fLinkQualityCb;
}

- (void)setFLinkQualityCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)fVoiceLinkQualityCb
{
  return self->_fVoiceLinkQualityCb;
}

- (void)setFVoiceLinkQualityCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)fServingCellChangedCb
{
  return self->_fServingCellChangedCb;
}

- (void)setFServingCellChangedCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)fServingNetworkChangedCb
{
  return self->_fServingNetworkChangedCb;
}

- (void)setFServingNetworkChangedCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)fDataStatusCb
{
  return self->_fDataStatusCb;
}

- (void)setFDataStatusCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)fSuplSmsCb
{
  return self->_fSuplSmsCb;
}

- (void)setFSuplSmsCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)fSmsSentCb
{
  return self->_fSmsSentCb;
}

- (void)setFSmsSentCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)fprefDataSimChangedCb
{
  return self->_fprefDataSimChangedCb;
}

- (void)setFprefDataSimChangedCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)fPhoneNumberInfoCb
{
  return self->_fPhoneNumberInfoCb;
}

- (void)setFPhoneNumberInfoCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)fImsRegStatusCb
{
  return self->_fImsRegStatusCb;
}

- (void)setFImsRegStatusCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)fTandemCapabilityChangeCb
{
  return self->_fTandemCapabilityChangeCb;
}

- (void)setFTandemCapabilityChangeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)fStewieSupportChangedCb
{
  return self->_fStewieSupportChangedCb;
}

- (void)setFStewieSupportChangedCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

@end
