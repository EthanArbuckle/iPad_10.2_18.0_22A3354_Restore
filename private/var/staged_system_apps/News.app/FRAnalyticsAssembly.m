@implementation FRAnalyticsAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publicContainer"));
  v5 = objc_msgSend(v4, "registerProtocol:factory:", &OBJC_PROTOCOL___NSSNewsAnalyticsSessionManager, &stru_1000DD808);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publicContainer"));
  v6 = objc_msgSend(v7, "registerProtocol:factory:", &OBJC_PROTOCOL___NSSNewsAnalyticsUserIDProvider, &stru_1000DD848);

}

@end
