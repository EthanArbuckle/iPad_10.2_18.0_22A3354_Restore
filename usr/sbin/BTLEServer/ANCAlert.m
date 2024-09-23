@implementation ANCAlert

- (ANCAlert)initWithCategoryID:(unsigned __int8)a3
{
  ANCAlert *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ANCAlert;
  result = -[ANCAlert init](&v5, "init");
  if (result)
    result->_categoryID = a3;
  return result;
}

- (BOOL)isSilent
{
  return self->_silent;
}

- (BOOL)isImportant
{
  return 0;
}

- (id)appIdentifier
{
  return 0;
}

- (id)title
{
  return 0;
}

- (id)subtitle
{
  return 0;
}

- (id)message
{
  return 0;
}

- (id)date
{
  return 0;
}

- (BOOL)hasPositiveAction
{
  return 0;
}

- (BOOL)hasNegativeAction
{
  return 0;
}

- (id)positiveActionLabel
{
  return 0;
}

- (id)negativeActionLabel
{
  return 0;
}

- (BOOL)performPositiveAction
{
  return 0;
}

- (BOOL)performNegativeAction
{
  return 0;
}

- (BOOL)hasExtraContent
{
  return 0;
}

- (id)updateDNDEventDetails:(id)a3
{
  return a3;
}

- (id)_appIdentifierForTUCallProvider:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isTelephonyProvider") & 1) != 0)
  {
    v4 = CFSTR("com.apple.mobilephone");
  }
  else if ((objc_msgSend(v3, "isFaceTimeProvider") & 1) != 0)
  {
    v4 = CFSTR("com.apple.facetime");
  }
  else
  {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  }

  return v4;
}

- (unsigned)categoryID
{
  return self->_categoryID;
}

- (BOOL)silent
{
  return self->_silent;
}

- (void)setSilent:(BOOL)a3
{
  self->_silent = a3;
}

@end
