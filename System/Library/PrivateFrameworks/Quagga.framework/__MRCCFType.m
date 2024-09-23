@implementation __MRCCFType

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (a3 == self)
    return 1;
  return _CFNonObjCEqual() != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain() != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating() != 0;
}

- (id)description
{
  CFStringRef v2;

  v2 = CFCopyDescription(self);
  return (id)(id)CFMakeCollectable(v2);
}

@end
