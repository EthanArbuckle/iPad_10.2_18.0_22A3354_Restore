@implementation REMCDAudioAttachment

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    sub_100681038(v2);

  return CFSTR("REMCDAudioAttachment");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAudioAttachment"));
}

@end
