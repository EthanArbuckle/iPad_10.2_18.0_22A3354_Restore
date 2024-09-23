@implementation NUNIPreferencePane

- (NUNIPreferencePane)initWithSliders:(id)a3 toggles:(id)a4 pickerOptions:(id)a5 pickerSelections:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC9WeatherUI14PreferencePane *v14;
  void *v15;
  _TtC9WeatherUI14PreferencePane *v16;
  NUNIPreferencePane *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [_TtC9WeatherUI14PreferencePane alloc];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PreferencePane initWithName:userDefaults:sliders:toggles:pickerOptions:pickerSelections:](v14, "initWithName:userDefaults:sliders:toggles:pickerOptions:pickerSelections:", &stru_1E6095498, v15, v13, v12, v11, v10);

  v17 = -[NUNIPreferencePane initWithPreferencePane:](self, "initWithPreferencePane:", v16);
  return v17;
}

- (NUNIPreferencePane)initWithPreferencePane:(id)a3
{
  id v5;
  NUNIPreferencePane *v6;
  NUNIPreferencePane *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUNIPreferencePane;
  v6 = -[NUNIPreferencePane init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_preference, a3);

  return v7;
}

- (void)preferencePaneDidChangeWithPreference:(id)a3
{
  id v4;

  -[NUNIPreferencePane delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferencePaneDidChange:", self);

}

- (NUNIPreferencePaneDelegate)delegate
{
  return (NUNIPreferencePaneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preference, 0);
}

@end
