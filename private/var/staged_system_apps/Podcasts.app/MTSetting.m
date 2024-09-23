@implementation MTSetting

+ (id)radioOptionWithTitle:(id)a3 radioGroup:(id)a4 value:(unint64_t)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  MTRadioButtonSetting *v12;
  void *v13;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(MTRadioButtonSetting);
  -[MTSetting setType:](v12, "setType:", 7);
  -[MTSetting setTitle:](v12, "setTitle:", v11);

  -[MTRadioButtonSetting setRadioGroup:](v12, "setRadioGroup:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  -[MTSetting setValue:](v12, "setValue:", v13);

  -[MTSetting setIdentifier:](v12, "setIdentifier:", v9);
  objc_msgSend(v10, "addRadioSetting:", v12);

  return v12;
}

+ (id)switchSettingWithTitle:(id)a3 initialValue:(BOOL)a4 identifier:(id)a5 changeHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init((Class)a1);
  objc_msgSend(v13, "setType:", 0);
  objc_msgSend(v13, "setTitle:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  objc_msgSend(v13, "setValue:", v14);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000FF258;
  v17[3] = &unk_1004AB280;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v13, "setChangeHandler:", v17);
  objc_msgSend(v13, "setIdentifier:", v11);

  return v13;
}

+ (id)buttonSettingWithTitle:(id)a3 detailText:(id)a4 identifier:(id)a5 changeHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  objc_msgSend(v14, "setType:", 2);
  objc_msgSend(v14, "setTitle:", v13);

  v15 = objc_msgSend(v12, "copy");
  objc_msgSend(v14, "setValue:", v15);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000FF390;
  v18[3] = &unk_1004AB280;
  v19 = v10;
  v16 = v10;
  objc_msgSend(v14, "setChangeHandler:", v18);
  objc_msgSend(v14, "setIdentifier:", v11);

  return v14;
}

+ (id)buttonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setType:", 1);
  objc_msgSend(v11, "setTitle:", v10);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000FF470;
  v14[3] = &unk_1004AB280;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "setChangeHandler:", v14);
  objc_msgSend(v11, "setIdentifier:", v9);

  return v11;
}

+ (id)appThemeButtonSettingWithTitle:(id)a3 identifier:(id)a4 changeHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setType:", 3);
  objc_msgSend(v11, "setTitle:", v10);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000FF550;
  v14[3] = &unk_1004AB280;
  v15 = v8;
  v12 = v8;
  objc_msgSend(v11, "setChangeHandler:", v14);
  objc_msgSend(v11, "setIdentifier:", v9);

  return v11;
}

+ (id)textSettingWithInitialValue:(id)a3 placeholder:(id)a4 identifier:(id)a5 changeHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MTTextSetting *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(MTTextSetting);
  -[MTSetting setType:](v13, "setType:", 6);
  -[MTSetting setValue:](v13, "setValue:", v12);

  -[MTTextSetting setPlaceholder:](v13, "setPlaceholder:", v11);
  -[MTSetting setChangeHandler:](v13, "setChangeHandler:", v9);

  -[MTSetting setIdentifier:](v13, "setIdentifier:", v10);
  return v13;
}

+ (id)drilldownSettingWithTitle:(id)a3 valueLabel:(id)a4 identifier:(id)a5 viewControllerGenerator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  objc_msgSend(v14, "setType:", 4);
  objc_msgSend(v14, "setTitle:", v13);

  objc_msgSend(v14, "setGenerator:", v10);
  objc_msgSend(v14, "setIdentifier:", v11);

  objc_msgSend(v14, "setValue:", v12);
  return v14;
}

+ (id)loadingSettingWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setType:", 8);
  objc_msgSend(v5, "setIdentifier:", v4);

  return v5;
}

+ (id)informativeSettingWithText:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setType:", 9);
  objc_msgSend(v8, "setIdentifier:", v6);

  objc_msgSend(v8, "setEnabled:", 0);
  objc_msgSend(v8, "setValue:", v7);

  return v8;
}

+ (id)optionSettingWithTitle:(id)a3 headerTitle:(id)a4 footerText:(id)a5 initialValue:(unint64_t)a6 optionDescription:(id)a7 identifier:(id)a8 changeHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MTOptionSetting *v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = objc_alloc_init(MTOptionSetting);
  -[MTSetting setType:](v21, "setType:", 5);
  -[MTSetting setTitle:](v21, "setTitle:", v20);

  -[MTOptionSetting setHeaderTitle:](v21, "setHeaderTitle:", v19);
  -[MTOptionSetting setFooterText:](v21, "setFooterText:", v18);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a6));
  -[MTSetting setValue:](v21, "setValue:", v22);

  -[MTOptionSetting setOptions:](v21, "setOptions:", v17);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000FF8FC;
  v25[3] = &unk_1004AB280;
  v26 = v15;
  v23 = v15;
  -[MTSetting setChangeHandler:](v21, "setChangeHandler:", v25);
  -[MTSetting setIdentifier:](v21, "setIdentifier:", v16);

  return v21;
}

+ (id)optionSettingWithTitle:(id)a3 footerText:(id)a4 initialValue:(unint64_t)a5 optionDescription:(id)a6 identifier:(id)a7 changeHandler:(id)a8
{
  return objc_msgSend(a1, "optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:", a3, a3, a4, a5, a6, a7, a8);
}

- (MTSetting)init
{
  MTSetting *v2;
  MTSetting *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTSetting;
  v2 = -[MTSetting init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MTSetting setEnabled:](v2, "setEnabled:", 1);
  return v3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MTSettingsGroup)group
{
  return (MTSettingsGroup *)objc_loadWeakRetained((id *)&self->_group);
}

- (void)setGroup:(id)a3
{
  objc_storeWeak((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong(&self->_generator, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
