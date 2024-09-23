@implementation CRBulletin

- (CRBulletin)init
{
  CRBulletin *v2;
  void *v3;
  uint64_t v4;
  NSString *recordID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRBulletin;
  v2 = -[CRBulletin init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    recordID = v2->_recordID;
    v2->_recordID = (NSString *)v4;

    v2->_destinations = 2;
  }
  return v2;
}

- (CRBulletin)initWithTitle:(id)a3 message:(id)a4 destinations:(unint64_t)a5
{
  id v9;
  id v10;
  CRBulletin *v11;
  CRBulletin *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[CRBulletin init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v12->_message, a4);
    v12->_destinations = a5;
  }

  return v12;
}

+ (NSArray)actions
{
  return (NSArray *)&__NSArray0__struct;
}

+ (UNNotificationCategory)notificationCategory
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_alloc((Class)UNMutableNotificationCategory);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "categoryIdentifier"));
  v5 = objc_msgSend(v3, "initWithIdentifier:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "actions"));
  objc_msgSend(v5, "setActions:", v6);

  objc_msgSend(v5, "setOptions:", 0);
  return (UNNotificationCategory *)v5;
}

- (NSArray)actions
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(self), "actions");
}

- (UNNotificationRequest)notificationRequest
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new(UNMutableNotificationContent, a2);
  v4 = objc_claimAutoreleasedReturnValue(-[CRBulletin title](self, "title"));
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1000B87A0;
  objc_msgSend(v3, "setTitle:", v6);

  v7 = objc_claimAutoreleasedReturnValue(-[CRBulletin message](self, "message"));
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1000B87A0;
  objc_msgSend(v3, "setBody:", v9);

  v10 = objc_msgSend((id)objc_opt_class(self), "categoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v3, "setCategoryIdentifier:", v11);

  objc_msgSend(v3, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v3, "setShouldSuppressScreenLightUp:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRBulletin recordID](self, "recordID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v12, v3, 0, self->_destinations));

  return (UNNotificationRequest *)v13;
}

+ (id)CARActionWithTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uppercaseString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", v4, v3, 0));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)CARActionWithURL:(id)a3 title:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uppercaseString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:url:](UNNotificationAction, "actionWithIdentifier:title:url:", v8, v6, v7));

  }
  return v4;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (unint64_t)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(unint64_t)a3
{
  self->_destinations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
