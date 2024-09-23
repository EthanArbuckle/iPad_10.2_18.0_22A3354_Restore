@implementation DebugSwitchCell

+ (id)preferenceSwitchWithTitle:(id)a3 preference:(unint64_t)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "preferenceSwitchWithTitle:preference:didChangeHandler:", a3, a4, 0));
}

+ (id)preferenceSwitchWithTitle:(id)a3 preference:(unint64_t)a4 didChangeHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  DebugSwitchCell *v10;
  void *v11;
  DebugSwitchCell *v12;
  DebugSwitchCell *v13;
  void *v14;
  _QWORD v16[4];
  DebugSwitchCell *v17;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EMInternalPreferences defaultForPreference:](EMInternalPreferences, "defaultForPreference:", a4));
  v10 = [DebugSwitchCell alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v12 = -[DebugSwitchCell initWithTitle:userDefaults:defaultsKey:defaultKeyValue:completion:](v10, "initWithTitle:userDefaults:defaultsKey:defaultKeyValue:completion:", v7, v11, v9, 0, v8);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008B6D0;
  v16[3] = &unk_10051C4B0;
  v13 = v12;
  v17 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EMInternalPreferences observeChangesForPreference:usingBlock:](EMInternalPreferences, "observeChangesForPreference:usingBlock:", a4, v16));
  -[DebugSwitchCell setFeatureObservation:](v13, "setFeatureObservation:", v14);

  return v13;
}

- (DebugSwitchCell)initWithTitle:(id)a3 defaultsKey:(id)a4 defaultKeyValue:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  DebugSwitchCell *v14;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v14 = -[DebugSwitchCell initWithTitle:userDefaults:defaultsKey:defaultKeyValue:completion:](self, "initWithTitle:userDefaults:defaultsKey:defaultKeyValue:completion:", v10, v13, v11, v7, v12);

  return v14;
}

- (DebugSwitchCell)initWithTitle:(id)a3 userDefaults:(id)a4 defaultsKey:(id)a5 defaultKeyValue:(BOOL)a6 completion:(id)a7
{
  id v8;
  id v12;
  id v13;
  id v14;
  id v15;
  DebugSwitchCell *v16;
  DebugSwitchCell *v17;
  id v18;
  id completionHandler;
  UISwitch *v20;
  UISwitch *selectionSwitch;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v8 = (id)a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)DebugSwitchCell;
  v16 = -[DebugSwitchCell init](&v26, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_userDefaults, a4);
    v18 = objc_retainBlock(v15);
    completionHandler = v17->_completionHandler;
    v17->_completionHandler = v18;

    v20 = (UISwitch *)objc_alloc_init((Class)UISwitch);
    selectionSwitch = v17->_selectionSwitch;
    v17->_selectionSwitch = v20;

    objc_storeStrong((id *)&v17->_defaultsKey, a5);
    -[UISwitch addTarget:action:forControlEvents:](v17->_selectionSwitch, "addTarget:action:forControlEvents:", v17, "_handleSwitchValueChange:event:", 4096);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v17->_userDefaults, "valueForKey:", v14));
    v23 = v22;
    if (v22)
      v8 = objc_msgSend(v22, "BOOLValue");
    -[UISwitch setOn:](v17->_selectionSwitch, "setOn:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DebugSwitchCell textLabel](v17, "textLabel"));
    objc_msgSend(v24, "setText:", v12);

    -[DebugSwitchCell setAccessoryView:](v17, "setAccessoryView:", v17->_selectionSwitch);
    -[DebugSwitchCell setSelectionStyle:](v17, "setSelectionStyle:", 0);

  }
  return v17;
}

- (void)_handleSwitchValueChange:(id)a3 event:(id)a4
{
  void *v5;
  void (**v6)(void);

  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:", -[UISwitch isOn](self->_selectionSwitch, "isOn", a3, a4), self->_defaultsKey);
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugSwitchCell completionHandler](self, "completionHandler"));

  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[DebugSwitchCell completionHandler](self, "completionHandler"));
    v6[2]();

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (UISwitch)selectionSwitch
{
  return self->_selectionSwitch;
}

- (void)setSelectionSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSwitch, a3);
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (void)setDefaultsKey:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsKey, a3);
}

- (EFCancelable)featureObservation
{
  return self->_featureObservation;
}

- (void)setFeatureObservation:(id)a3
{
  objc_storeStrong((id *)&self->_featureObservation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureObservation, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
  objc_storeStrong((id *)&self->_selectionSwitch, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
