@implementation _UIStateRestorationKeyedArchiverDelegate

+ (id)sharedDelegate
{
  if (qword_1ECD80170 != -1)
    dispatch_once(&qword_1ECD80170, &__block_literal_global_467);
  return (id)qword_1ECD80178;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v4;
  const char *ClassName;
  _UIObjectIdentifierPathProxy *v6;
  _UIObjectIdentifierPathProxy *v7;

  v4 = a4;
  if ((objc_msgSend(a4, "__isKindOfUIResponder", a3) & 1) != 0
    || objc_msgSend(v4, "conformsToProtocol:", &unk_1EE0CED08))
  {
    if (_UIStateRestorationDebugLogEnabled())
    {
      ClassName = object_getClassName(v4);
      NSLog(CFSTR("%s: Replacing object with _UIObjectIdentifierPathProxy for encoding: %s<%p>"), "-[_UIStateRestorationKeyedArchiverDelegate archiver:willEncodeObject:]", ClassName, v4);
    }
    v6 = -[_UIObjectIdentifierPathProxy initWithObject:]([_UIObjectIdentifierPathProxy alloc], "initWithObject:", v4);
    if (v6)
    {
      v7 = v6;
      _UIAddObjectToStateRestorationRoots(v4);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

@end
