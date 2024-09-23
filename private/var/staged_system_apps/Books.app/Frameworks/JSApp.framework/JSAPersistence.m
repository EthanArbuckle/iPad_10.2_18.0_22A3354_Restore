@implementation JSAPersistence

+ (JSACookieStorage)cookieStorage
{
  return +[JSACookieStorage sharedInstance](JSACookieStorage, "sharedInstance");
}

+ (JSAKeychainStorage)keychainStorage
{
  return +[JSAKeychainStorage sharedInstance](JSAKeychainStorage, "sharedInstance");
}

+ (JSALocalStorage)localStorage
{
  return +[JSALocalStorage sharedInstance](JSALocalStorage, "sharedInstance");
}

+ (JSASessionStorage)sessionStorage
{
  return +[JSASessionStorage sharedInstance](JSASessionStorage, "sharedInstance");
}

@end
