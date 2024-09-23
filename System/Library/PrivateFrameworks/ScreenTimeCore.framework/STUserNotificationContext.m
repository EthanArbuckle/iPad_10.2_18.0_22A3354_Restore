@implementation STUserNotificationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUserNotificationContext)init
{
  void *v3;
  void *v4;
  STUserNotificationContext *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUserNotificationContext initWithIdentifier:](self, "initWithIdentifier:", v4);

  return v5;
}

- (STUserNotificationContext)initWithIdentifier:(id)a3
{
  id v5;
  STUserNotificationContext *v6;
  STUserNotificationContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUserNotificationContext;
  v6 = -[STUserNotificationContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (STUserNotificationContext)initWithCoder:(id)a3
{
  id v4;
  STUserNotificationContext *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *localizedUserNotificationBodyArguments;
  STUserNotificationContext *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STUserNotificationContext;
  v5 = -[STUserNotificationContext init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (!v5->_identifier)
    {
      v13 = 0;
      goto LABEL_6;
    }
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("localizedUserNotificationBodyArguments"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedUserNotificationBodyArguments = v5->_localizedUserNotificationBodyArguments;
    v5->_localizedUserNotificationBodyArguments = (NSArray *)v11;

  }
  v13 = v5;
LABEL_6:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedUserNotificationBodyArguments, CFSTR("localizedUserNotificationBodyArguments"));

}

- (UNMutableNotificationContent)notificationContent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSound:", v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setScheme:", CFSTR("prefs"));
  objc_msgSend(v4, "setPath:", CFSTR("root=SCREEN_TIME"));
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setDefaultActionURL:", v5);
  objc_msgSend(v2, "setShouldIgnoreDowntime:", 1);
  return (UNMutableNotificationContent *)v2;
}

- (void)notificationContentWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSound:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setScheme:", CFSTR("prefs"));
  objc_msgSend(v7, "setPath:", CFSTR("root=SCREEN_TIME"));
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDefaultActionURL:", v8);
  objc_msgSend(v5, "setShouldIgnoreDowntime:", 1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__STUserNotificationContext_notificationContentWithCompletionBlock___block_invoke;
  v11[3] = &unk_1E9370898;
  v12 = v5;
  v13 = v4;
  v9 = v5;
  v10 = v4;
  -[STUserNotificationContext customizeNotificationContent:withCompletionBlock:](self, "customizeNotificationContent:withCompletionBlock:", v9, v11);

}

uint64_t __68__STUserNotificationContext_notificationContentWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (NSNumber)destinations
{
  return 0;
}

- (NSString)notificationBundleIdentifier
{
  return (NSString *)CFSTR("com.apple.ScreenTimeNotifications");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)localizedUserNotificationBodyArguments
{
  return self->_localizedUserNotificationBodyArguments;
}

- (void)setLocalizedUserNotificationBodyArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UNNotificationTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_localizedUserNotificationBodyArguments, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
