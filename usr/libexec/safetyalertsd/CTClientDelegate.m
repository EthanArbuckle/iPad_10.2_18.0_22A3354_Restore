@implementation CTClientDelegate

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v4 = a3;
  v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,carrierBundleChange()\"}", (uint8_t *)v6, 0x12u);
  }
  (*((void (**)(void))self->_fCarrierBundleChangeCb + 2))();

}

- (void)operatorBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v4 = a3;
  v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,operatorBundleChange()\"}", (uint8_t *)v6, 0x12u);
  }
  (*((void (**)(void))self->_fOperatorBundleChangeCb + 2))();

}

- (void)defaultBundleChange
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,defaultBundleChange()\"}", (uint8_t *)v4, 0x12u);
  }
  (*((void (**)(void))self->_fDefaultBundleChangeCb + 2))();
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v4 = a3;
  v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,preferredDataSimChanged()\"}", (uint8_t *)v6, 0x12u);
  }
  (*((void (**)(void))self->_fPrefDataSimChangedCb + 2))();

}

- (void)dualSimCapabilityDidChange
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,dualSimCapabilityDidChange()\"}", (uint8_t *)v4, 0x12u);
  }
  (*((void (**)(void))self->_fTandemCapabilityChangeCb + 2))();
}

- (id)fCarrierBundleChangeCb
{
  return self->_fCarrierBundleChangeCb;
}

- (void)setFCarrierBundleChangeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)fOperatorBundleChangeCb
{
  return self->_fOperatorBundleChangeCb;
}

- (void)setFOperatorBundleChangeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)fDefaultBundleChangeCb
{
  return self->_fDefaultBundleChangeCb;
}

- (void)setFDefaultBundleChangeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)fPrefDataSimChangedCb
{
  return self->_fPrefDataSimChangedCb;
}

- (void)setFPrefDataSimChangedCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)fTandemCapabilityChangeCb
{
  return self->_fTandemCapabilityChangeCb;
}

- (void)setFTandemCapabilityChangeCb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fTandemCapabilityChangeCb, 0);
  objc_storeStrong(&self->_fPrefDataSimChangedCb, 0);
  objc_storeStrong(&self->_fDefaultBundleChangeCb, 0);
  objc_storeStrong(&self->_fOperatorBundleChangeCb, 0);
  objc_storeStrong(&self->_fCarrierBundleChangeCb, 0);
}

@end
