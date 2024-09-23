@implementation GKBulletinAction

- (GKBulletinAction)init
{
  GKBulletinAction *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKBulletinAction;
  result = -[GKBulletinAction init](&v3, "init");
  if (result)
    *(_WORD *)&result->_inAlertView = 257;
  return result;
}

- (GKBulletinAction)initWithDictionary:(id)a3
{
  id v4;
  GKBulletinAction *v5;
  void *v6;
  uint64_t v7;
  NSString *info;
  uint64_t v9;
  NSNumber *adamID;
  uint64_t v11;
  NSString *bundleID;

  v4 = a3;
  v5 = -[GKBulletinAction init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")));
    v5->_type = (int64_t)objc_msgSend(v6, "integerValue");

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("info")));
    info = v5->_info;
    v5->_info = (NSString *)v7;

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("adamID")));
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v9;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("bundleID")));
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v11;

  }
  return v5;
}

- (GKBulletinAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  GKBulletinAction *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSString *title;
  id v14;
  uint64_t v15;
  NSString *info;
  id v17;
  uint64_t v18;
  NSNumber *adamID;
  id v20;
  uint64_t v21;
  NSString *bundleID;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  objc_super v30;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinAction initWithCoder:", buf, 2u);
  }
  v30.receiver = self;
  v30.super_class = (Class)GKBulletinAction;
  v8 = -[GKBulletinAction init](&v30, "init");
  if (v8)
  {
    v9 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v8->_type = (int64_t)objc_msgSend(v10, "integerValue");

    v11 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("title"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    title = v8->_title;
    v8->_title = (NSString *)v12;

    v14 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("info"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    info = v8->_info;
    v8->_info = (NSString *)v15;

    v17 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("adamID"));
    v18 = objc_claimAutoreleasedReturnValue(v17);
    adamID = v8->_adamID;
    v8->_adamID = (NSNumber *)v18;

    v20 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleID"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v21;

    v23 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("isDestructive"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v8->_isDestructive = objc_msgSend(v24, "BOOLValue");

    v25 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("inAlertView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v8->_inAlertView = objc_msgSend(v26, "BOOLValue");

    v27 = objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("inBannerView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v8->_inBannerView = objc_msgSend(v28, "BOOLValue");

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKBulletinAction encodeWithCoder:", v16, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKBulletinAction type](self, "type")));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("type"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction title](self, "title"));
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("title"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](self, "info"));
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("info"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("adamID"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("bundleID"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKBulletinAction isDestructive](self, "isDestructive")));
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("isDestructive"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKBulletinAction inAlertView](self, "inAlertView")));
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("inAlertView"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[GKBulletinAction inBannerView](self, "inBannerView")));
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("inBannerView"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GKBulletinAction *v4;

  v4 = -[GKBulletinAction init](+[GKBulletinAction allocWithZone:](GKBulletinAction, "allocWithZone:", a3), "init");
  v4->_type = self->_type;
  objc_storeStrong((id *)&v4->_info, self->_info);
  objc_storeStrong((id *)&v4->_title, self->_title);
  objc_storeStrong((id *)&v4->_adamID, self->_adamID);
  objc_storeStrong((id *)&v4->_bundleID, self->_bundleID);
  v4->_isDestructive = self->_isDestructive;
  v4->_inBannerView = self->_inBannerView;
  v4->_inAlertView = self->_inAlertView;
  return v4;
}

- (NSDictionary)actionDictionary
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKBulletinAction actionDictionary", v14, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", -[GKBulletinAction type](self, "type")));
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("type"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](self, "info"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](self, "info"));
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("info"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("adamID"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID"));
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("bundleID"));

  }
  return (NSDictionary *)v5;
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  objc_super v15;

  v3 = -[GKBulletinAction type](self, "type");
  v4 = CFSTR("NO TYPE");
  if (!v3)
    v4 = CFSTR("NoAction");
  if (v3 == 1)
    v5 = CFSTR("LaunchTrampoline");
  else
    v5 = v4;
  v15.receiver = self;
  v15.super_class = (Class)GKBulletinAction;
  v6 = -[GKBulletinAction description](&v15, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction title](self, "title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction info](self, "info"));
  if (-[GKBulletinAction isDestructive](self, "isDestructive"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[GKBulletinAction inBannerView](self, "inBannerView"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[GKBulletinAction inAlertView](self, "inAlertView"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\n\ttitle:%@\n\ttype:%@\n\tinfo:%@\n\tisDestructive:%@\n\tinBannerView:%@\n\tinAlertView:%@"), v8, v5, v9, v10, v11, v12));

  return v13;
}

- (id)appLaunchTrampolineURL
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID")),
        v5,
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction adamID](self, "adamID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletinAction bundleID](self, "bundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ASCAppLaunchTrampolineURL URLWithAdamId:bundleId:localizedName:sourceApplication:topic:](ASCAppLaunchTrampolineURL, "URLWithAdamId:bundleId:localizedName:sourceApplication:topic:", v7, v8, 0, v10, 0));

  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v3);
    v13 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1001376B8(v13, self);
    v11 = 0;
  }
  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)info
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)adamID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (BOOL)inAlertView
{
  return self->_inAlertView;
}

- (void)setInAlertView:(BOOL)a3
{
  self->_inAlertView = a3;
}

- (BOOL)inBannerView
{
  return self->_inBannerView;
}

- (void)setInBannerView:(BOOL)a3
{
  self->_inBannerView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
