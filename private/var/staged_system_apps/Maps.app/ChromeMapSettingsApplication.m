@implementation ChromeMapSettingsApplication

- (ChromeMapSettingsApplication)initWithSettingsDictionary:(id)a3
{
  id v4;
  ChromeMapSettingsApplication *v5;
  NSDictionary *v6;
  NSDictionary *settingsDictionary;
  uint64_t v8;
  NSMutableArray *completionHandlers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ChromeMapSettingsApplication;
  v5 = -[ChromeMapSettingsApplication init](&v11, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    settingsDictionary = v5->_settingsDictionary;
    v5->_settingsDictionary = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    completionHandlers = v5->_completionHandlers;
    v5->_completionHandlers = (NSMutableArray *)v8;

  }
  return v5;
}

- (NSArray)completionHandlers
{
  return (NSArray *)-[NSMutableArray copy](self->_completionHandlers, "copy");
}

- (void)addCompletionHandler:(id)a3
{
  NSMutableArray *completionHandlers;
  id v4;

  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    v4 = objc_msgSend(a3, "copy");
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v4);

  }
}

- (NSDictionary)settingsDictionary
{
  return self->_settingsDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_settingsDictionary, 0);
}

@end
