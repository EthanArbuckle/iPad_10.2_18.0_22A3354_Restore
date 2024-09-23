@implementation SigningStatusCache

+ (id)sharedInstance
{
  if (qword_100318130 != -1)
    dispatch_once(&qword_100318130, &stru_1002C4A18);
  return (id)qword_100318128;
}

+ (id)getValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SigningStatusCache sharedInstance](SigningStatusCache, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getValueForKey:", v3));

  return v5;
}

+ (void)reset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SigningStatusCache sharedInstance](SigningStatusCache, "sharedInstance"));
  objc_msgSend(v2, "clear");

}

@end
