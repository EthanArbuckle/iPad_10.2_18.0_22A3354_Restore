@implementation IMOSConfigurationPredicate

+ (id)iOSPredicate
{
  return +[IMBoolValueConfigurationPredicate predicateWithValue:](IMBoolValueConfigurationPredicate, "predicateWithValue:", 1);
}

+ (id)OSXPredicate
{
  return +[IMBoolValueConfigurationPredicate predicateWithValue:](IMBoolValueConfigurationPredicate, "predicateWithValue:", 0);
}

@end
