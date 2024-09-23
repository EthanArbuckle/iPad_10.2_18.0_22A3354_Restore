@implementation ASKAirplaneModeInquiry

- (ASKAirplaneModeInquiry)init
{
  ASKAirplaneModeInquiry *v2;
  RadiosPreferences *v3;
  RadiosPreferences *radiosPreferences;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASKAirplaneModeInquiry;
  v2 = -[ASKAirplaneModeInquiry init](&v6, "init");
  if (v2)
  {
    v3 = (RadiosPreferences *)objc_alloc_init((Class)RadiosPreferences);
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v3;

    -[RadiosPreferences setDelegate:](v2->_radiosPreferences, "setDelegate:", v2);
  }
  return v2;
}

+ (NSURL)settingsURL
{
  return (NSURL *)+[PSAirplaneModeSettingsDetail preferencesURL](PSAirplaneModeSettingsDetail, "preferencesURL");
}

- (BOOL)isEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ASKAirplaneModeInquiry radiosPreferences](self, "radiosPreferences"));
  v3 = objc_msgSend(v2, "airplaneMode");

  return v3;
}

- (void)airplaneModeChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ASKAirplaneModeInquiry delegate](self, "delegate"));
  objc_msgSend(v3, "airplaneModeInquiryDidObserveChange:", self);

}

- (ASKAirplaneModeInquiryDelegate)delegate
{
  return (ASKAirplaneModeInquiryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
