@implementation AppleConnectActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "chrome", a3));
  +[MapsAppleConnectAuthViewController presentAppleConnectAuthControllerFrom:withProxyURL:](MapsAppleConnectAuthViewController, "presentAppleConnectAuthControllerFrom:withProxyURL:", v4, 0);

}

@end
