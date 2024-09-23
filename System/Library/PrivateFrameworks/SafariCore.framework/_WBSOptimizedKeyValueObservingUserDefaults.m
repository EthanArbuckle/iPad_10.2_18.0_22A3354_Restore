@implementation _WBSOptimizedKeyValueObservingUserDefaults

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

@end
