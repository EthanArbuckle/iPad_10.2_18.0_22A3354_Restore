@implementation EQKitEnvironment

+ (id)environmentFromData:(id)a3
{
  return +[EQKitEnvironmentInstance environmentFromData:](EQKitEnvironmentInstance, "environmentFromData:", a3);
}

+ (id)defaultEnvironment
{
  return +[EQKitEnvironmentInstance defaultEnvironment](EQKitEnvironmentInstance, "defaultEnvironment");
}

+ (id)dataForEnvironment:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return +[EQKitEnvironmentInstance dataForEnvironment:](EQKitEnvironmentInstance, "dataForEnvironment:", a3);
  else
    return 0;
}

- (BOOL)fontsLoaded
{
  return 0;
}

@end
