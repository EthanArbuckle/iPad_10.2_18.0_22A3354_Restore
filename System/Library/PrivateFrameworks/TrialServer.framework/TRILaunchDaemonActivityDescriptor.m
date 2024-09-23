@implementation TRILaunchDaemonActivityDescriptor

- (TRILaunchDaemonActivityDescriptor)initWithName:(id)a3 supportedTaskCapabilities:(unint64_t)a4
{
  id v8;
  TRILaunchDaemonActivityDescriptor *v9;
  TRILaunchDaemonActivityDescriptor *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1043, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRILaunchDaemonActivityDescriptor;
  v9 = -[TRILaunchDaemonActivityDescriptor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_supportedTaskCapabilities = a4;
  }

  return v10;
}

+ (id)launchDaemonActivityDescriptorWithName:(id)a3 supportedTaskCapabilities:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:supportedTaskCapabilities:", v6, a4);

  return v7;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:supportedTaskCapabilities:", v4, self->_supportedTaskCapabilities);

  return v5;
}

- (id)copyWithReplacementSupportedTaskCapabilities:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:supportedTaskCapabilities:", self->_name, a3);
}

- (BOOL)isEqualToLaunchDaemonActivityDescriptor:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *name;
  void *v10;
  int v11;
  unint64_t supportedTaskCapabilities;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = self->_name != 0;
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8
    || (name = self->_name) != 0
    && (objc_msgSend(v5, "name"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[NSString isEqual:](name, "isEqual:", v10),
        v10,
        !v11))
  {
LABEL_6:
    v13 = 0;
  }
  else
  {
    supportedTaskCapabilities = self->_supportedTaskCapabilities;
    v13 = supportedTaskCapabilities == objc_msgSend(v5, "supportedTaskCapabilities");
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  TRILaunchDaemonActivityDescriptor *v4;
  TRILaunchDaemonActivityDescriptor *v5;
  BOOL v6;

  v4 = (TRILaunchDaemonActivityDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRILaunchDaemonActivityDescriptor isEqualToLaunchDaemonActivityDescriptor:](self, "isEqualToLaunchDaemonActivityDescriptor:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return self->_supportedTaskCapabilities - v3 + 32 * v3;
}

- (id)description
{
  id v3;
  NSString *name;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  name = self->_name;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_supportedTaskCapabilities);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRILaunchDaemonActivityDescriptor | name:%@ supportedTaskCapabilities:%@>"), name, v5);

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)supportedTaskCapabilities
{
  return self->_supportedTaskCapabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)retryFailuresDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.retries-networking"), 31);
}

+ (id)taskQueueDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.task-queue"), 24);
}

+ (id)cellularDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.cellular"), 26);
}

+ (id)inexpensiveNetworkingDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.fetch-experiments"), 27);
}

+ (id)postUpgradeDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.post-upgrade"), 16);
}

+ (id)postUpgradeDescriptorRequireInexpensiveNetworking
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.post-upgrade-require-inexpensive-networking"), 27);
}

+ (id)setupAssistantFetchDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.setup-assistant-fetch"), 19);
}

+ (id)clientTriggeredWifiDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.client-trigger.wifi"), 27);
}

+ (id)clientTriggeredCellularDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.client-trigger.cellular"), 26);
}

+ (id)clientHotfixCellularAllowBatteryDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.hotfix.cellular-allow-battery-true"), 2);
}

+ (id)clientHotfixWifiDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.hotfix.wifi-allow-battery-false"), 11);
}

+ (id)maintenanceWorkDescriptor
{
  return +[TRILaunchDaemonActivityDescriptor launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:](TRILaunchDaemonActivityDescriptor, "launchDaemonActivityDescriptorWithName:supportedTaskCapabilities:", CFSTR("com.apple.triald.maintenance"), 24);
}

@end
