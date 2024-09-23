@implementation NSMutableDictionary

- (void)ic_setNonNilObject:(id)a3 forKey:(id)a4
{
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)ic_addKey:(id)a3 forNonNilObject:(id)a4
{
  -[NSMutableDictionary ic_setNonNilObject:forKey:](self, "ic_setNonNilObject:forKey:", a4, a3);
}

- (void)ic_addZoneID:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1006791C0();
    goto LABEL_13;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1006791EC();
    goto LABEL_13;
  }
  if (!v6)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100679218();
LABEL_13:

    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v8));
  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v9, v8);
  objc_msgSend(v9, "addObject:", v6);

LABEL_14:
}

- (void)ic_removeZoneID:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "length"))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v8));
      v10 = v9;
      if (v9)
        -[NSObject removeObject:](v9, "removeObject:", v6);
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        sub_100679270();
    }
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_100679244();
  }

}

@end
