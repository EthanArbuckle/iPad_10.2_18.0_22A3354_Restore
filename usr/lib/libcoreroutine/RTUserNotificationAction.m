@implementation RTUserNotificationAction

- (RTUserNotificationAction)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithActionIdentifier_title_url_iconWithSystemImageName_handler_);
}

- (RTUserNotificationAction)initWithActionIdentifier:(id)a3 title:(id)a4 iconWithSystemImageName:(id)a5 handler:(id)a6
{
  return -[RTUserNotificationAction initWithActionIdentifier:title:url:iconWithSystemImageName:handler:](self, "initWithActionIdentifier:title:url:iconWithSystemImageName:handler:", a3, a4, 0, a5, a6);
}

- (RTUserNotificationAction)initWithActionIdentifier:(id)a3 title:(id)a4 url:(id)a5 iconWithSystemImageName:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  RTUserNotificationAction *v19;
  RTUserNotificationAction *v20;
  uint64_t v21;
  id handler;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[RTUserNotificationAction initWithActionIdentifier:title:url:iconWithSystemImageName:handler:]";
    v28 = 1024;
    v29 = 38;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: actionIdentifier (in %s:%d)", buf, 0x12u);
  }

  if (!v14)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[RTUserNotificationAction initWithActionIdentifier:title:url:iconWithSystemImageName:handler:]";
      v28 = 1024;
      v29 = 39;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: title (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v25.receiver = self;
  v25.super_class = (Class)RTUserNotificationAction;
  v19 = -[RTUserNotificationAction init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_actionIdentifier, a3);
    objc_storeStrong((id *)&v20->_title, a4);
    objc_storeStrong((id *)&v20->_url, a5);
    objc_storeStrong((id *)&v20->_iconWithSystemImageName, a6);
    v21 = MEMORY[0x1D8232094](v16);
    handler = v20->_handler;
    v20->_handler = (id)v21;

  }
  return v20;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("action identifier, %@, title, %@, url, %@, iconWithSystemImageName, %@"), self->_actionIdentifier, self->_title, self->_url, self->_iconWithSystemImageName);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)iconWithSystemImageName
{
  return self->_iconWithSystemImageName;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_iconWithSystemImageName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
