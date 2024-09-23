@implementation NRDLDKeychainItem

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  BOOL isChanged;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  if (self)
  {
    isChanged = self->_isChanged;
    if (!result)
      return result;
  }
  else
  {
    isChanged = 0;
    if (!result)
      return result;
  }
  *((_BYTE *)result + 8) = isChanged;
  return result;
}

@end
