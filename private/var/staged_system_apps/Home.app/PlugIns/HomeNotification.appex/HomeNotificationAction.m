@implementation HomeNotificationAction

+ (id)actionsFromArrayOfDictionaries:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  _QWORD v8[4];
  NSMutableDictionary *v9;

  v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DD18;
  v8[3] = &unk_100018D58;
  v9 = objc_opt_new(NSMutableDictionary);
  v4 = v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  if (-[NSMutableDictionary count](v4, "count"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (HomeNotificationAction)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HomeNotificationAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HomeNotificationAction *v15;
  objc_super v17;

  v4 = a3;
  if (qword_10001F138[0] != -1)
    dispatch_once(qword_10001F138, &stru_100018D78);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  if (objc_msgSend(v6, "count") && objc_msgSend((id)qword_10001F130, "intersectsSet:", v6))
  {
    v17.receiver = self;
    v17.super_class = (Class)HomeNotificationAction;
    v7 = -[HomeNotificationAction init](&v17, "init");
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemType")));
      -[HomeNotificationAction setType:](v7, "setType:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier")));
      -[HomeNotificationAction setIdentifier:](v7, "setIdentifier:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldDismiss")));
      -[HomeNotificationAction setShouldDismiss:](v7, "setShouldDismiss:", objc_msgSend(v10, "BOOLValue"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("services.uuid")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "na_map:", &stru_100018D98));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
      -[HomeNotificationAction setServiceUUIDs:](v7, "setServiceUUIDs:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
      -[HomeNotificationAction setTitle:](v7, "setTitle:", v14);

    }
    self = v7;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationAction type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationAction identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[HomeNotificationAction shouldDismiss](self, "shouldDismiss")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationAction serviceUUIDs](self, "serviceUUIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationAction title](self, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@"), v3, v4, v5, v6, v7));
  v9 = objc_msgSend(v8, "hash");

  return (unint64_t)v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (void)setServiceUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldDismiss
{
  return self->_shouldDismiss;
}

- (void)setShouldDismiss:(BOOL)a3
{
  self->_shouldDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
