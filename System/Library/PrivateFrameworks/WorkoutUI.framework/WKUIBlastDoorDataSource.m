@implementation WKUIBlastDoorDataSource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)dataFromSourceFromData:(id)a3
{
  return +[NLWorkoutConfigurationImageGenerator createBlastDoorDataSourceFromData:](NLWorkoutConfigurationImageGenerator, "createBlastDoorDataSourceFromData:", a3);
}

- (WKUIBlastDoorDataSource)initWithActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 configurationType:(int64_t)a5 configurationName:(id)a6 goalTypeIdentifier:(unint64_t)a7
{
  id v13;
  WKUIBlastDoorDataSource *v14;
  WKUIBlastDoorDataSource *v15;
  objc_super v17;

  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WKUIBlastDoorDataSource;
  v14 = -[WKUIBlastDoorDataSource init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_isIndoor = a4;
    v14->_activityType = a3;
    v14->_configurationType = a5;
    objc_storeStrong((id *)&v14->_configurationName, a6);
    v15->_goalTypeIdentifier = a7;
  }

  return v15;
}

- (WKUIBlastDoorDataSource)initWithCoder:(id)a3
{
  id v4;
  WKUIBlastDoorDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *configurationName;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WKUIBlastDoorDataSource;
  v5 = -[WKUIBlastDoorDataSource init](&v15, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_activityType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activityType = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    NSStringFromSelector(sel_isIndoor);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isIndoor = objc_msgSend(v4, "decodeBoolForKey:", v7);

    NSStringFromSelector(sel_configurationType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_configurationType = objc_msgSend(v4, "decodeIntegerForKey:", v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_configurationName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    configurationName = v5->_configurationName;
    v5->_configurationName = (NSString *)v11;

    NSStringFromSelector(sel_goalTypeIdentifier);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_goalTypeIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;

  v4 = a3;
  v5 = -[WKUIBlastDoorDataSource activityType](self, "activityType");
  NSStringFromSelector(sel_activityType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[WKUIBlastDoorDataSource isIndoor](self, "isIndoor");
  NSStringFromSelector(sel_isIndoor);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  v9 = -[WKUIBlastDoorDataSource configurationType](self, "configurationType");
  NSStringFromSelector(sel_configurationType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[WKUIBlastDoorDataSource configurationName](self, "configurationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_configurationName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  v13 = -[WKUIBlastDoorDataSource goalTypeIdentifier](self, "goalTypeIdentifier");
  NSStringFromSelector(sel_goalTypeIdentifier);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v13, v14);

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v3 = 31 * -[WKUIBlastDoorDataSource activityType](self, "activityType");
  v4 = v3 + -[WKUIBlastDoorDataSource isIndoor](self, "isIndoor");
  v5 = -[WKUIBlastDoorDataSource configurationType](self, "configurationType") - v4 + 32 * v4;
  -[WKUIBlastDoorDataSource configurationName](self, "configurationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  return -[WKUIBlastDoorDataSource goalTypeIdentifier](self, "goalTypeIdentifier") - v7 + 32 * v7 + 486695567;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("activityType: %lu\n"), -[WKUIBlastDoorDataSource activityType](self, "activityType"));
  v7 = -[WKUIBlastDoorDataSource isIndoor](self, "isIndoor");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v6, "appendFormat:", CFSTR("isIndoor: %@\n"), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("configurationType: %ld\n"), -[WKUIBlastDoorDataSource configurationType](self, "configurationType"));
  -[WKUIBlastDoorDataSource configurationName](self, "configurationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("configurationName: %@\n"), v9);

  objc_msgSend(v6, "appendFormat:", CFSTR("goalTypeIdentifier: %lu\n"), -[WKUIBlastDoorDataSource goalTypeIdentifier](self, "goalTypeIdentifier"));
  return v6;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (unint64_t)goalTypeIdentifier
{
  return self->_goalTypeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationName, 0);
}

@end
