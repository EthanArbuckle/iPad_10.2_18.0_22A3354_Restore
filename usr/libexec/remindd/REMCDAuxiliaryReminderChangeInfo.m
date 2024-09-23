@implementation REMCDAuxiliaryReminderChangeInfo

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v10;

  v3 = (objc_class *)objc_opt_class(REMCDAuxiliaryReminderChangeInfo, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromClass((Class)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_10067E64C(v10);

  }
  return CFSTR("REMCDAuxiliaryReminderChangeInfo");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAuxiliaryReminderChangeInfo"));
}

@end
