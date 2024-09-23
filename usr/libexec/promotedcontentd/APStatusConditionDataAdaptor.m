@implementation APStatusConditionDataAdaptor

+ (id)identifier
{
  return CFSTR("com.apple.ap.statuscondition");
}

- (BOOL)_validateParameters:(id *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  NSErrorUserInfoKey v22;
  void *v23;

  v21.receiver = self;
  v21.super_class = (Class)APStatusConditionDataAdaptor;
  if (!-[APDataAdaptor _validateParameters:](&v21, "_validateParameters:"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID")));
  v7 = -[APDataAdaptor _requireClassType:name:expectedClass:error:](self, "_requireClassType:name:expectedClass:error:", v6, CFSTR("bundleID"), objc_opt_class(NSString), a3);

  if (!v7)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("conditionID")));
  v10 = -[APDataAdaptor _requireClassType:name:expectedClass:error:](self, "_requireClassType:name:expectedClass:error:", v9, CFSTR("conditionID"), objc_opt_class(NSString), a3);

  if (!v10)
    return 0;
  v11 = objc_alloc((Class)NSUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("conditionID")));
  v14 = objc_msgSend(v11, "initWithUUIDString:", v13);

  v15 = v14 != 0;
  if (a3 && !v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("conditionID")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Condition ID '%@' is not in UUID format"), v17));

    v22 = NSLocalizedDescriptionKey;
    v23 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5201, v19));

  }
  return v15;
}

- (void)_run:(id)a3
{
  id v4;
  PCBooleanCondition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PCBooleanCondition *v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = [PCBooleanCondition alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("conditionID")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundleID")));
  v10 = -[PCBooleanCondition initWithType:value:identifier:](v5, "initWithType:value:identifier:", CFSTR("sc"), v7, v9);

  v14 = 0;
  v11 = +[PCStatusConditionStorage isStatusConditionRegistered:error:](PCStatusConditionStorage, "isStatusConditionRegistered:error:", v10, &v14);
  v12 = v14;
  if (v12)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v4 + 2))(v4, 0, 0, v12);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
    (*((void (**)(id, void *, _QWORD, _QWORD))v4 + 2))(v4, v13, 0, 0);

  }
}

@end
