@implementation CRLUserDefaults

+ (NSDictionary)defaultDefaults
{
  if (qword_1014157E0 != -1)
    dispatch_once(&qword_1014157E0, &stru_101259F00);
  return (NSDictionary *)(id)qword_1014157D8;
}

+ (void)registerUserDefaults
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultDefaults"));
  objc_msgSend(v4, "registerDefaults:", v3);

}

@end
