@implementation NSError

- (BOOL)rem_isDiskFullSQLError
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v4 = objc_msgSend(v3, "isEqualToString:", NSSQLiteErrorDomain);

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
    if (!objc_msgSend(v5, "isEqualToString:", NSCocoaErrorDomain))
    {
      v10 = 0;
      goto LABEL_10;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", NSSQLiteErrorDomain));

    if (!v7)
      return 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NSSQLiteErrorDomain));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "integerValue")));

    if (!v5)
      return 0;
LABEL_7:
    v10 = objc_msgSend(&off_100804E28, "containsObject:", v5);
LABEL_10:

    return v10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSError code](self, "code")));
  if (v5)
    goto LABEL_7;
  return 0;
}

@end
